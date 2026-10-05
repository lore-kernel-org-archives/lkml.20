Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C9480353
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205021; cv=none; b=i+UfEHOWw2agtFemMOlyU26sIeVfLuynoFx8e3r9SG63Auh0qnEvP6tT94vZDgwVG11bhNdkZ/qLGJKcx2LqGtiQ+bFJVBwqfeIn/FzhdryTUFFF1JUUvcdoVapvO9SSHCcc09h/hBQfucAst5Z9kAEfJq70iaaGtGeCWib68Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205021; c=relaxed/simple;
	bh=HI9Ca2Fo2tkQcb4WshVMmwmxrgJVc/dv7UEoTbCUW/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hSl8rLcospTN8fHpTyUUL8DbTdoBkcRpqdeT4iUoKhzFGbhXlKtfsEbJnil8l8gGYfuootrXow/f5+kRGGIfktreT8HMxeN201b7KTvQOJfmbtfeYPY5I+f6MSHcR7nx4eLAWg+zyQho73fyqCR+SD4ZhwR/3Rm0S17/m5y9WUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=FE4x+P20; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="FE4x+P20"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc502d509c0so514645a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791205018; x=1791809818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pdPpjclY/Qu2NFmchOm2ms5jkg4XhM0PjITCIKS9/s=;
        b=FE4x+P20FB0vWAbnKqkpUmFCRwZM18clW1RxQVNZUOzNHjj5VpqFP65/TqeIwi6/MR
         90PIQJ+DO+5ExKnTLTBdaFTp5PSiVV32C4BVQld0N7qQNI25CQQqK2rsTtek11TwES8T
         KPRLB+duK9xpnIzW8113PlV5rz/SbAphMuE/Cphsz8TcpkJtBXPcu7MupYmxJPhPzCR2
         abZSrpSSQJcTp+dVawm0DCZ2Ry4qvO422AWxv3yuexR8sBn8r44FpLbd6woleWZidGN8
         AUf2rZ2loCXV/EvPMidFZ2TDVQyam06EZJSzsPduH348nsJpjjy/JBTb+GyxNG9slPLu
         6G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205018; x=1791809818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pdPpjclY/Qu2NFmchOm2ms5jkg4XhM0PjITCIKS9/s=;
        b=DLu1dj5B/UCLxO/tZTKpTJ3VP8peiwU2RF7W0PebAyRj93YUNVdx7tb2Tao1lv1d92
         wXbxPrJLnJsrqDkMWaqoenSiMBtqxQV5rN096FlLbQK7+HkXRZ05ZsLYbBPA2JqDd2KP
         hCtGAddvUBpi6G7nUhUHGFBczj3YaXrx4M1nKFFKQll8no5nQY/lRBUzAsB6Qb+jqaa3
         LMmZfmkROjWZHBqkeHsaxglSXeyQDyyXpqjEF5bkjuecxoUMIfoy7KlTgBUjIx5ueONS
         mvhaRSW8w3nwLuchOBjjQ2srvJjU5GHRRUl6VrvOqZZGE+fccmXeMjbhSbeT2t/wtYKE
         B7+g==
X-Forwarded-Encrypted: i=1; AKwUvBzTo9wAX+ZWDBoT8I4gketAqioI2drVsJES6oyH/NDHu7k25L5Yv8YceDcI0qdtA4Mz5Fjjhxaf6mOAOaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFd4N/XwaHWbDkZmAc1mkKa0qgMsD2wjH3zhA/4qK4Z0Ei9D4s
	FGYL0TMQ2XjR56YF6azwcKyBc7UaHFzps9L/pWXMsXmyUAIrSv0jKUWJU4JNSC+WOaY=
X-Gm-Gg: AYBFou3AbuVz6uTzmXcmdSIEcjIhT9EaPFsiQw+b2LN+3lQQY8urRjUViucNA3jXhfo
	jYIKL7plmXMyqTmd4TvTAVQBpjBSycAH1RD4mBWndzVvJWCN7CyYMpLMGeHxgFvQT8iJWG70Bnn
	o2Q4nhZb/LLsjKxDHpe5WPw4pCiMm2QfXwBUMA+juF9E3vh2yqFkdHhhMipy4GCLfCxm+KMfG5b
	GCwTJQ4pKdoZlrLbW2aqUUTi+FAbkA+X+tK65/YqmVU0VKVdlsffyhFLob3cGm0zwkCY+zBuSxo
	UXJ//JDwbKQMQGBQtn+JxqXjyzJIIVZpQ0n/XoM1LwZ49DNbpR8Yuwguvd46Geq7vCO6mOX/DwW
	0hm9/y21/zaHGrqSh6urqKCbdAAXj0NVvscN7yl1wdcFCkRRaDK37mBWXiLg2s2H643wZeZumpo
	7d5RprdUPl42UzCj6ptELF0mTVX4fkf/lXTLPqZuECc8DFrFnunvc5+AxSNB4DKlLEe6H5DZEJs
	DwayTbZ8ABJF5pplcgc7w==
X-Received: by 2002:a17:90b:35c8:b0:3a8:2046:7e5f with SMTP id 98e67ed59e1d1-3a82046834amr1284780a91.12.1791205017933;
        Mon, 05 Oct 2026 05:56:57 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:5364:bba9:2adf:d611])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e3a7470sm761661a12.30.2026.10.05.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:56:57 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH v2] 9p/xen: validate the response size from the backend
Date: Mon,  5 Oct 2026 21:56:38 +0900
Message-ID: <20261005125640.274054-1-yhlee@isslab.korea.ac.kr>
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
v2: use dev_warn_ratelimited() so a backend that keeps re-triggering the
    event channel cannot flood the log.
v1: https://lore.kernel.org/all/20261005021157.207947-1-yhlee@isslab.korea.ac.kr/

 net/9p/trans_xen.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index f9fb2db7a0663..0ea8e17725c24 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -200,6 +200,14 @@ static void p9_xen_response(struct work_struct *work)
 				     masked_prod, &masked_cons,
 				     XEN_9PFS_RING_SIZE(ring));
 
+		if (h.size < sizeof(h) ||
+		    h.size > xen_9pfs_queued(prod, cons,
+					     XEN_9PFS_RING_SIZE(ring))) {
+			dev_warn_ratelimited(&priv->dev->dev,
+					     "bad response size %u from backend\n", h.size);
+			break;
+		}
+
 		req = p9_tag_lookup(priv->client, h.tag);
 		if (!req || req->status != REQ_STATUS_SENT) {
 			dev_warn(&priv->dev->dev, "Wrong req tag=%x\n", h.tag);
-- 
2.43.0

