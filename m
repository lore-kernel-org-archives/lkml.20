Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A91C862F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129455; cv=none; b=jnAvY8JS8fYIOQdjDPxIpSEx3Q1pUS66KRmNb1UIszrb06w8pqvkA3mQDZ6tPYjm89yPhLA1WaSORxmaxt8QFVgGT7bBPcmYKoGku387x5C9vdtl4xIkIipNsZdH55Kd0r8WYKziJ4fnXBepwJBjCOC+8RNxH/pt0lVgO6fZ+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129455; c=relaxed/simple;
	bh=G9xOLF1Ltmfv5/icRq2cEKpWLTW4z5xYUxmF/vM59VU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iHtR64BGPYx/cxnRcaUGkkQm6AHj+GlWLWAEPV9tK5WwD8EHlBRcAG6vTHMVQH6Wun4IgHa0PQsgUyRYecP6PGBbooyDJq/FFx8KfT1bb1Pfx0B510Pxpqd41ZUwQdn3ecIZ520AeN3hPMMGh1rwoqVVbbvg5YRGRWepWw1l1Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPbL2Fgw; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPbL2Fgw"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so289747c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792129453; x=1792734253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OK8gQ1ufxTYQRu20UVmbLfwGO0s2WmJNokT26nu2ksg=;
        b=dPbL2FgwHjRPTc1LvRnNu+WG0cYavz//+Vf4CTx3yLkk/nzEwV0su3gWHs6vP8DAO0
         D4Fik8ffdS69ecaKth1Upoc8bOSriC6lbW6Mm+hknGfPyVK5SYTwWccZuoeJRmQbIYxp
         7dk6v+2AGlG21UillNaP3QkUCw4XyqTjtcrIx5v0WJlj5r0lylhEEHg24NPJKYfhTpAP
         Q0WRvF1cnqLHUr4VbCUcFk+JBxKv50S7beO9FWwgBmJM8WOA/a9a/98b+onJj7xgIZAg
         srlBF79+9BXykKCXn4W1JCs3ATyJ2B1hHuLurojqDqkjzppgP1nRqZZVyHo3WsTw5+Xs
         KeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129453; x=1792734253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OK8gQ1ufxTYQRu20UVmbLfwGO0s2WmJNokT26nu2ksg=;
        b=2kFxWqg/+1Sma7+0rCotpE1Z+ZsfaPKn/nnEeW2vyq5L/OQ8p0oVnmeH8eXuWly8kk
         2dSX1LSfMqP9URb/7fs3+fPVh2OInLdbIDohydmuhkKMBXENEeROS1BWavtVRw8GC6mO
         M0ZmywxG4J5ROMJ1Qtemp9/Mp8vWmZ8EWwp/fiMTrRsLHTjVlEhCfMzS6umtf0Fog/IS
         dNG6pkPmeAUdax+s6gI1++V46yM/or8hIhk5UwJRAGaXnJLveF9FbEj6P4h0i5NccQyb
         ZOIGX6LyQjvmAB1Xu760UPrJYbOZyuYEcKP1Yf+o0YLh1tUvIGLWV59thk/fvDbT3OGz
         O3MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNzRI5IISSHsahwfnPnfFssXt2EdEvr4ezgkv7uqtIWLX6439c4DXJ3jWqNpbioYUm33OwNiJ7US9G+OE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4IilH0iUg/gsmbNoAi3riqwc9hX0Z03U1Fupyh4SXKIVCTAn4
	2xOKAk9Pj/Ih/IzTXbaoGvCk+J+n1oiljXFTjwwdqA9VdE+KB7NU9YsC
X-Gm-Gg: AYBFou1BpHKJyi0FeuCsGDEHZtlcg35ElvelbJ/Vm27AjI9gGrd/zgoo/YAXpdKIPGe
	c61WSBGQ8j9e5dqnfJAKY7AI6+47VfoUdR04shesTCordpiRA7/mjoGhg0CxIh5236tIY9ZkTzq
	tmgYY2brRFehWR9wWMXDNPjfEDeGt0J9hxL/xhKSRsLSvOFhQtXKcpUdlXQsOhpK68nE9uuHNRT
	b3KXcLgo3iXv4a8C5b5w+qxktb3JqNkTta2qm9D4jACsax7sgo4Z5KtdYfRLswF9P0Vgf3TpaGd
	L1EmYjs13qE7ufSod3i60ZBhWQYZS2sWh3WbM0/9qsBG7G1qbNDDOXOMttZkSRLXsqCQb25qHqy
	wZjD7vKX5FkOCbG7iLd4BoWiIbLHiXqg+QKIWb6MRI2aaXUNSey0Akt1IgkZlp5JKEA4iMPizLt
	b9GloUe5ycsOlEft4tqfdJkStCkbSsQbXXVRewbPP54taF6zILJSv3G8L6lv77xcIxWb/JzEwgu
	lT1fYDOI0cej5pDi+GPC1m1OIqo7pbwL3A=
X-Received: by 2002:a05:701b:4544:10b0:144:c12b:dfc6 with SMTP id a92af1059eb24-16a60ce7b43mr28097347c88.44.1792129453455;
        Thu, 15 Oct 2026 22:44:13 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm2642428c88.7.2026.10.15.22.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:44:12 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daeho43@gmail.com,
	daehojeong@google.com,
	sunqiuyang@huawei.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v4 0/2] f2fs: fix online resize state
Date: Fri, 16 Oct 2026 13:44:04 +0800
Message-ID: <cover.1792116883.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Online shrink changes both persistent SIT state and the geometry used
by pinned allocation. This series keeps those states consistent during
range evacuation and after the geometry changes.

Patch 1 drains the SIT journal during resize even when there are no
new dirty sentries. It is unchanged and retains Daeho's Reviewed-by.

Patch 2 consumes the tail reservation, refreshes the pinned boundary,
and restores both on final checkpoint rollback. It also limits pinned
allocation by the temporarily reduced MAIN_SECS() during evacuation.

Changes in v4 (since v3):
- Bound pinned section allocation by the current MAIN_SECS().

Changes in v3 (since v2):
- Rebase onto f2fs/dev.
- Reduce resizable_tail_secno by the removed sections, down to zero.
- Save the current tail after freeze and restore it on rollback.
- Document that online shrink consumes the reservation.
- Retain Daeho's review for patch 1; request a new review for patch 2.

Changes in v2 (since v1):
- Simplify tail validation and improve rejection diagnostics.
- Validate before taking the mount write reference and recheck
  after freeze for concurrent remounts.

v1:
- Initial SIT-journal and pinned-boundary fixes.

Wenjie Qi (2):
  f2fs: flush SIT journal during filesystem resize
  f2fs: refresh pinned allocation boundary after resize

 Documentation/filesystems/f2fs.rst |  3 ++-
 fs/f2fs/gc.c                       |  6 +++++-
 fs/f2fs/segment.c                  |  4 ++--
 fs/f2fs/segment.h                  | 11 +++++++++++
 fs/f2fs/super.c                    | 15 ++-------------
 5 files changed, 22 insertions(+), 17 deletions(-)


base-commit: e455328a66a5f4827d4ba96acfe50dbbb0e13b8d
-- 
2.43.0

