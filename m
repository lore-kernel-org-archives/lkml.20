Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61343A7E4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449577; cv=none; b=vC14gJHG+ZY5DtHtUVZbS8/huy7dRnOI0+/6uKYhHUSST0w6TOv0yRKJpdwOX9ccnoOTemV/ngoYfBXM7akp/vQoR8yhsE1CKh/h7U9ZYpmT/98gnhvgmfoeVcMlgoHe+wsJQcTBQnjlgR+SB0Q4MVegdOuzgUIpP83PWuR7tb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449577; c=relaxed/simple;
	bh=tRK/WLCmOL9yWhdP5u7X+a8hOKx87CLe/k7xw0s+QCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=or1mEZz5XLCPY3q+CThe2w0PGPkFNROyKsXHnWx0vDffscyuKMlcnZLRq8H5Ogk4dP2ONxyvWkuHmweobkLjK1/CKrEIAxQH8bgcvLq3xgnAEmDAiHMNMADV3PWGP9oSLw1uWBVG827Zk2NAYyW7hVSsb3nt5kMGqYd6cEhQVJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=q7rAe4ly; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="q7rAe4ly"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc147d86bebso731846a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789449567; x=1790054367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OOwy7c+zcjkAyM/C1EYhF9ectrxzXXceO/PRGImhvE=;
        b=q7rAe4lyJRGIY1qra+QwabZXXcVkexZdsB7FW/7cl1ndR7E0EisBYCtvRJG49n6oaV
         cPRTRyvN9KdMjleC7i0MgCg3eeN6Qv2s7WoZ60GmHMVoRAwKqU4SFMyQFNobznZciBy7
         qDbGzs+W987wXO1BvnTvqmBQl5S5Z5i4NF7K5LmaQwuvxCywg7B3jsQS9KUvj7rpCqdj
         FUQzAWbsFDlXCchxBNQUH7suXnHSsZOmxZ2FkH0jfogHQMsiMlAOEDW6MM++NoYrd4GU
         tWGRc06SO5ZPNsmYzhtS1SFoo7DYzirfo6DCgpsRJMINIaFs7+3t5/UOz6ba03YLjpCe
         eMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449567; x=1790054367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OOwy7c+zcjkAyM/C1EYhF9ectrxzXXceO/PRGImhvE=;
        b=UsLN9GemWrR4SIr5Mybr47NrrEEzFYDiKMLiWV0h/tJtNMhVsnv0s56goMjmCdZrD5
         Jj5jr6GcJAgKZiQl6/HefDDqSGYuIuCeYSGA5fSQ6BMrvF3xQ6A3F3j9+vHlpXzE1hmh
         3u/+IgS5ZdwXO7SFUv/chxrAGFY5o6jQnEWgh3lvghxPC0pj8iXAFXn4xuVIZ7ZDw1GR
         +F+fzeW9o7khuPzpY9EzO2QzghpdOoxw5m6kh1sp+wxNmyIjGI616s4jC6F3J4fHDJYV
         ehPoYOBz54xURgaCwWZ2QPEtxr2UZz9Me5ta6LZMRUuO+wbIOLTMYCjDdHpkaMPMdD5g
         OBRw==
X-Forwarded-Encrypted: i=1; AKwUvBykr4b5mncsIKDy/MZKC9Di9E5WEPlZd+offcGaRpWFFIAP3jaC74xIO/hPnTSl4DaLFuOUAel7NjaN4Hc=@vger.kernel.org
X-Gm-Message-State: AFuF++mgdm6yTlW0IORmv/+ohGfTVO3DBauRKSuTGfQmdnDwl3k8xZ2I
	1gDoJELyU+WO9R/Uo69TpxnF/iQdq3vMZ9SQy2rFGhd/XuNF6aLsfn1q7eCNabGFtw==
X-Gm-Gg: AYBFou1BGIKE4s/eS6jFIl4bfrt0yzeN27F6v0jYpJeKFqpx95NXuDTnR+zRsbAjLoc
	RBWf7ARCHpev8nbCGsCCGaheBkr/AN4Z7lmVyweR/UYInhzoxV8/+SlLwiRMDwXAKbVk4a471jF
	u9XU7bpu4uQur9jy8sLuQz6maIFHUjJUbwt899joZuwAoWB2UNK9GtkB960fLUMLLr29YC9E0MD
	per8uJcUaJOjSNXq8xP2I4oNJGquTQbNJQhEsErT6npGhw5sKhfzx8iFo0fg0B/wYVCQMNSPJrG
	WRrVTALB7KKW47eHYpZGirHn+lcidd6d8OG9G0h9iJ9RyMcxGE0D7qCH/IETPwLsqDa2wuh9boI
	bfFWJzoB5yNcKq0kZIsOHGkGJHarAuO/Bn7UlKv3VnHCfC7S6tJaMMbr/bBmmk8fxLGM52B+5VI
	RfGbpvNeFMAJezcisO8XEiw253NiJ/TONyo4GbZznLxJF4gWE2dQqAqGsro0CrNgLWsvkq0motk
	WinDv2m9ANMXonj9/EwsRrgJpaVMNKXQ9JAmg==
X-Received: by 2002:a05:6a20:7493:b0:3d3:aed2:6f28 with SMTP id adf61e73a8af0-3db501db9afmr3325689637.28.1789449567479;
        Mon, 14 Sep 2026 22:19:27 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm30593846eec.7.2026.09.14.22.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:19:26 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	slava@dubeyko.com
Cc: ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	co+f8e3e01d8dda8689@bugs.sh,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH] ceph: reject mdsmaps that claim more than CEPH_MAX_MDS ranks
Date: Mon, 14 Sep 2026 22:19:24 -0700
Message-ID: <20260915051924.737109-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_new_map() sizes its export-target bitmap from CEPH_MAX_MDS but walks
it with newmap->possible_max_rank, which comes straight off the wire:
ceph_mdsmap_decode() sets it to max(m_num_active_mds, m_max_mds), then
overwrites it with the size of the "in" set.  Neither is bounded by
CEPH_MAX_MDS, only by m_info allocating, so a monitor announcing more ranks
than the bitmap holds makes test_bit() read past the end of targets[].  The
clear_bit() loop above indexes the same bitmap, though it is additionally
bounded by mdsc->max_sessions.  The map arrives on the monitor connection,
which is unauthenticated in legacy msgr mode.

CEPH_MAX_MDS is a protocol constant from src/mds/mdstypes.h, and the
reserved inode ranges in super.h are laid out one rank apart over that
span, so a map claiming more ranks is corrupt.  Reject it where the rank
space is established rather than letting the count reach check_new_map().

  BUG: KASAN: stack-out-of-bounds in check_new_map (fs/ceph/mds_client.c:5968)
  Read of size 8 at addr ffffc90000ac7798 by task kworker/1:2/127
  Workqueue: ceph-msgr ceph_con_workfn
  Call Trace:
   <TASK>
   dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
   print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
   kasan_report (mm/kasan/report.c:595)
   kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
   check_new_map (fs/ceph/mds_client.c:5968)
   ceph_mdsc_handle_mdsmap (fs/ceph/mds_client.c:7060)
   extra_mon_dispatch (fs/ceph/super.c:802)
   mon_dispatch (net/ceph/mon_client.c:1483)
   ceph_con_process_message (net/ceph/messenger.c:1424)
   ceph_con_v1_try_read (net/ceph/messenger_v1.c:1430)
   ceph_con_workfn (net/ceph/messenger.c:1576)
   process_one_work (kernel/workqueue.c:3396)
   worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
   kthread (kernel/kthread.c:436)
   ret_from_fork (arch/x86/kernel/process.c:158)
   ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
   </TASK>
  The buggy address belongs to stack of task kworker/1:2/127
   and is located at offset 288 in frame:
   check_new_map (fs/ceph/mds_client.c:5846)
  This frame has 1 object:
   [32, 288) 'targets'

Cc: stable@vger.kernel.org
Fixes: d517b3983dd3 ("ceph: reconnect to the export targets on new mdsmaps")
Reported-by: <co+f8e3e01d8dda8689@bugs.sh>
Assisted-by: LLM
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/ceph/mdsmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ceph/mdsmap.c b/fs/ceph/mdsmap.c
index 53079ef34c3a..5e3b8c3ca502 100644
--- a/fs/ceph/mdsmap.c
+++ b/fs/ceph/mdsmap.c
@@ -170,6 +170,10 @@ struct ceph_mdsmap *ceph_mdsmap_decode(struct ceph_mds_client *mdsc, void **p,
 	 * and the mds rank >= m_num_active_mds.
 	 */
 	m->possible_max_rank = max(m->m_num_active_mds, m->m_max_mds);
+	if (m->possible_max_rank > CEPH_MAX_MDS) {
+		err = -EIO;
+		goto corrupt;
+	}
 
 	m->m_info = kzalloc_objs(*m->m_info, m->possible_max_rank, GFP_NOFS);
 	if (!m->m_info)
@@ -316,6 +320,10 @@ struct ceph_mdsmap *ceph_mdsmap_decode(struct ceph_mds_client *mdsc, void **p,
 	{
 		int num_laggy = 0;
 		ceph_decode_32_safe(p, end, n, bad_ext);
+		if (n > CEPH_MAX_MDS) {
+			err = -EIO;
+			goto corrupt;
+		}
 		ceph_decode_need(p, end, sizeof(u32) * n, bad_ext);
 
 		for (i = 0; i < n; i++) {
-- 
2.43.0

