Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DA8153BE9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 02:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791166359; cv=none; b=JXjY/S2w9Ax7DOCkx3cn5sM2RJ9ryRimUQK3ikQ1e9B650ukJwXj74cWTsjt+EMIfy4YKErZsEG6rJw0fFoU4KjKKJomYP/HuqmeTOhkq9fCGdFQEMlIelxeofkOtuWiMO+yj/zKIGCII6wpF83RlzXldxDi7/PHLo4hZUKI83g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791166359; c=relaxed/simple;
	bh=BGUhXXXtcnuShkA03X+V+8ParF89SYrXypmzAkwkIi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ho/U2Qm1TEJLxhVLw15zMNMWn23PZ5BTggWhFbi00xOISnmyIbAW/qFaGKycttGT+Evuaf2/YqpZl8jJMWstram8g8z0QALVSvYSGdatvdIS1Row+FoMaisztT4DG0JR9WVebwBqgWSGAZhDZdYSA1kg/jIQxmZMe02Hu5+4G/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=NxrDoTOA; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="NxrDoTOA"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49896dd9dso304412a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791166355; x=1791771155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8BtH1wOi3R0dL1LEJcbfIDWWZE0ydiC1A3fSU2odtA=;
        b=NxrDoTOAfNHLf9zKj4gZ02GZ2m+0YCUQhD1TxhTdE07MTFxSiRBGcME/iwa4QrQj/V
         dJmBI9dby9oXwCCKSZjUqzjXFv+OGuByf4mY8yTObEhSEyg/TPmz/v5U7/ZZBubCwLg9
         Ye0AH/M2O3dxqrcpCaAwpjk71Q9F4S/s6jpyv8TaxdFq6mG1ClnL6595rUtMHmPtD/wX
         N6Z7+2hFg1YHc/HSTaDNpBjTRBx1z7DaEfGWtPTgUyM6N2rtragtkPHjD+vZ6VKm78hN
         4HpIgN3TtdVDbsPtk25LFPZhZb9ajWcUkC0apHDDR0IEbhygdbY9uL8nfgySxsVp4FKU
         MVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791166355; x=1791771155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8BtH1wOi3R0dL1LEJcbfIDWWZE0ydiC1A3fSU2odtA=;
        b=Z4wgPAAvObCLHbYMs4xJdpTwwI8yM1A/mdwqHUOKARlIwmpaCD3A+8QgZbNoCEIthF
         tqqtY0dYreqrtMesExN+CiU3n2UVQ7kbAShaaE9WM67KlP/JogzgJfTGOCbWmNJLzsUm
         11BsEBblD11Ogly5VWXZcJSelrmTkY1TzvZT0Lk0qtFZHwwyUAlVnJPFnSoai3cYvo4q
         P1D2oY7u1Dju/gBTXCwKnckURFdKGB+xB6r2/1KP6LlT8k18hAJzm99Uu06CSaBeLppc
         CNC5AyGk9kQXwTaZoXchNBuT4fAdD1PdrkDEBgWBp1+QBG1+zZwa7A81r+0pR8rnR/D7
         Sc9A==
X-Forwarded-Encrypted: i=1; AKwUvBz4O62MCXrifDKYUTOOxViDdZrp5f8UyT/SLpG3WwDrW3W/iWFbjPxyUIY2/EEYWQWKhOftYDs+6nwAfSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/jQoNdN8iM7h2FtO8icJJApF9Lqb5YPNrffFKp+vZe6dvfo3O
	GKEJlheHK9RjNi6df+a5LudXbAvFYziHTDNz4uAXxefnM0lNAYAfXw9rsLw/+z8XXs4=
X-Gm-Gg: AYBFou1pBG9qU77VjkLxhWWhsRPIlVKUCR6j8l5aYQDL/zgYPsd1ebvAf7u+WQg48yF
	Z3EZqWtgK1DqfPBDrvb2uyvETPRXuUDJ29DONPT96QpWRsr+ZtvI8M+zT7/e176041y3kriOtYU
	m98r5j9w+pVz6fS8GwCwtSHekbTM1tphzgCYSx5Qt7FQZyiFoEJTHeahF1vH8t6+Rh+Z1nVicQY
	FS79ybh3jfAdeSDWj1PQRn6e0jWw2+frgztSU8WgvNfGOXow2z3O/vbrk0wFy6Tv3D9mL80T5xh
	LxgrAwNxWln7RqTmZ0LCh2nRJGFwboc3Xqvn5f0OXxUXSktcmhtscji5+ghhqabfqINQZR3iW9P
	ixmeaUQ6RfZwn/YV/ksBVFAcFc6IeG5LgYPCV8wJCqzoS6QYAl4fwrAXfC5MJylJlQ9zS+JQ7pI
	s3mjNrObBaGmvzM+ntqoa13PYQ/Xh+9fWfxc3z7i7XZsYoYmNMyvpLBwfCntoEjEyM2vLy21AKw
	RiLJhNbnqwPjCge3St9BQ==
X-Received: by 2002:a17:90a:701:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3a6d2ac75d9mr3440094a91.19.1791166355134;
        Sun, 04 Oct 2026 19:12:35 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:7020:baaa:df0e:eada])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e61386csm9241660a91.17.2026.10.04.19.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 19:12:34 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH] 9p/xen: validate the response size from the backend
Date: Mon,  5 Oct 2026 11:11:55 +0900
Message-ID: <20261005021157.207947-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

p9_xen_response() takes the length of an incoming response from the ring
-- the first field of the 9p header, which the Xen transport reuses as
its framing header -- and uses it to advance the consumer index, but
never checks that it is at least the header size or no larger than the
number of bytes the backend has actually produced.

A malicious or buggy backend can post a response whose size is smaller
than the header (for example 0). The consumer index then never advances,
so the response work re-reads the same ring contents instead of making
progress. In testing this raced with the teardown that the malformed
reply triggers and dereferenced a freed p9_client:

  9pfs 9pfs-0: Wrong req tag=ffff
  BUG: kernel NULL pointer dereference, address: 0000000000000060
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: Oops: 0000 [#1] SMP NOPTI
  CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 7.2.0-rc5 #6 PREEMPT(lazy)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
  Workqueue: events p9_xen_response
  RIP: 0010:idr_find+0x4/0x10
  RSP: 0018:ffffbf5d80063de8 EFLAGS: 00010202
  RAX: 0000000000000001 RBX: ffffa229c21195a0 RCX: ffffa229c2400000
  RDX: ffffa229c11c2200 RSI: 000000000000ffff RDI: 0000000000000050
  RBP: 000000000000ffff R08: 3fffffffffffdfff R09: ffffffffffffffff
  R10: 3fffffffffffdfff R11: ffffffff87a60e80 R12: 0000000000000050
  R13: 0000000000000000 R14: 000000000000ffff R15: 0000000000100000
  FS:  0000000000000000(0000) GS:ffffa22a7661c000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 0000000000000060 CR3: 000000003ac34002 CR4: 0000000000770ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   p9_tag_lookup+0x2b/0x90
   p9_xen_response+0x17c/0x2e0
   process_one_work+0x16a/0x3a0
   worker_thread+0x172/0x2e0
   kthread+0xdd/0x110
   ret_from_fork+0x18b/0x240
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  Modules linked in:
  CR2: 0000000000000060
  ---[ end trace 0000000000000000 ]---

Reject a response whose size is outside [sizeof(header), queued] before
using it, matching the validation the backend already applies to
incoming requests.

Fixes: f66c72bea129 ("xen/9pfs: receive responses")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 net/9p/trans_xen.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index f9fb2db7a0663..685523be16f0a 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -200,6 +200,14 @@ static void p9_xen_response(struct work_struct *work)
 				     masked_prod, &masked_cons,
 				     XEN_9PFS_RING_SIZE(ring));
 
+		if (h.size < sizeof(h) ||
+		    h.size > xen_9pfs_queued(prod, cons,
+					     XEN_9PFS_RING_SIZE(ring))) {
+			dev_warn(&priv->dev->dev,
+				 "bad response size %u from backend\n", h.size);
+			break;
+		}
+
 		req = p9_tag_lookup(priv->client, h.tag);
 		if (!req || req->status != REQ_STATUS_SENT) {
 			dev_warn(&priv->dev->dev, "Wrong req tag=%x\n", h.tag);
-- 
2.43.0

