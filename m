Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F0D3E9C29
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460979; cv=none; b=h9q2hx5kvBfVvE2J9Dzje8AwwWU3yqiiZ1eYlOMQK/iDH0ar7nK7X6ctEOinOrCQtCHfNtmiIVhFE3mfgg99BEJl00+VZLMmuqtAjo+5MBvugCnN0T+uUAGXZuOzHjB/AL1CYoUCDXFsYsfr41IKfa1t2RcZRMq9S9InpfA3nJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460979; c=relaxed/simple;
	bh=oA9TPSXruq9GjVV664jd3ankQEREuKLFI8yASbQLQ4Y=;
	h=Cc:Message-Id:Mime-Version:To:From:Subject:Date:Content-Type; b=SeQjNdQ9OkxO5+26S8Ts4eNzA/ixDwgjDfxlSbIAv4TAx+l/B9yxpsbQC9vDdqC9QvAWZ9xg2OpEKvJnyYC9cN/Xh+eMQXb0XSEx98zpRYCHP/NC2ykAxW3XR875wZQ9Cqx6J7zBl5PxXJ69JUsvf2DmHtdrdKzZ4aQKW+ucQjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=W/D58YqJ; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="W/D58YqJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791460972; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=tls5HbU/EWP2TtCFN2PAD3tmRnPe+a9FTxZqc+ipIBw=;
 b=W/D58YqJkui27FURFkIMzpeiI/QeIQ4jx9QidFFvY0d9KtZueQxrASBCqR3yKuFWNcvKqA
 shem7ZcIy1kY2GV4y7YdafYLBDuH7ONVbFQRjZYdb2tA2UUxkDSnLU/6Z0YU1CA0e7XTTT
 5BYrSGD/lTfsvYY4izsTEa0XXWJVANcVMWIXhqUJH5gwriTpEtGJ3IveBbTysFiBnQh7WP
 9RrRLbZccI+EbE9+6Ewp4blXpx8Zs2gVjh9CIHh9DXnK9vxEbDCbzBJ6ZDzoAnevH5Z674
 oKVmCl6TKYjFUjCsG8UYYwd0Hq/+aOdT/0P3ycHaIVE4FdFh1Ama16j32MwWbw==
Cc: "Jia Zhu" <zhujia.zj@bytedance.com>, <amir73il@gmail.com>, 
	<linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Message-Id: <cover.1791452174.git.zhujia.zj@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: "Jan Kara" <jack@suse.cz>
From: "Jia Zhu" <zhujia.zj@bytedance.com>
X-Original-From: Jia Zhu <zhujia.zj@bytedance.com>
X-Mailer: git-send-email 2.20.1
Subject: [PATCH v2 0/2] fsnotify: drop SRCU across inotify event delivery
Date: Thu,  8 Oct 2026 20:02:37 +0800
X-Lms-Return-Path: <lba+26ac7866a+cb0b49+vger.kernel.org+zhujia.zj@bytedance.com>
Content-Type: text/plain; charset=UTF-8

We observed fsnotify teardown stalls in production. NMI backtraces
showed inotify_handle_inode_event() in memcg reclaim, and the mark
reaper, inotifywait and a systemd process were reported blocked for more
than 327 seconds.

We checked upstream and found the same issue: inotify allocates events
under fsnotify_mark_srcu, and the global mark reaper waits in
synchronize_srcu().

The production report shows multiple inotify release paths blocked
behind the global mark reaper. Because SRCU and the reaper are shared
across groups, a stalled delivery can delay other groups' close() and
exit paths.

Patch 1 pins the iterator marks and drops SRCU around inotify delivery.
It retains fanotify's pinning semantics and preserves event delivery to
a surviving inotify watch when another watch is removed. This leaves the
reclaim stall itself unchanged.

Patch 2 skips the global reaper flush when only the closing group
reference remains. As Jan noted on the earlier patch [1], this only
helps groups with no outstanding marks. It is optional and can be
dropped.

The teardown fast path was checked in QEMU with a test-only SRCU holder.

[1] https://lore.kernel.org/all/4467cbj7eivubtdwcawvr7mhrb7armgoc4xfqjjnncrbkxxag6@3mmou6nhviao/

Jia Zhu (2):
  inotify: drop fsnotify SRCU protection during event delivery
  fsnotify: avoid unrelated mark reaper waits during group teardown

 fs/notify/fsnotify.c             | 15 ++++++++++++---
 fs/notify/group.c                | 26 +++++++++++++++-----------
 fs/notify/inotify/inotify_user.c |  3 ++-
 fs/notify/mark.c                 | 26 ++++++++++++++++++++++----
 include/linux/fsnotify_backend.h |  2 ++
 5 files changed, 53 insertions(+), 19 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.20.1
