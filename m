Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423021;
	b=IO1uIUE999P3VIA0abWAjNoFX1lM+/hm6EQ1q1DHFjpiBoMz1A0Sb2hGa3u3apcFyFJ1
	 e5gevPANbljhquX/olO1BurslGfBU9tE/gLC5x0jv2MbaP0RK/J+t3+lDNU+e/pT/AWxM
	 yA7Wz6+iB5ZupJANsgHL0GAAzRDuo7ez06fRCwy8NBli1rw/GjBZCO58OQdLFc8RAWv0k
	 EVHcyxmUX7gzIz2DU9BvYn/EouxZaU9V9GFnCaIuEX/eT54nJGW/3Di6ME6CWYhTZhIFW
	 9SsTf+tvUKgCrWf111JMznhrmoZNOACea6Nu1JCTPEsvhhXjFhuJgc+PwK4rFClXkYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lrlZ4tZZQMYR2hWboxUPUCUfGuJIMsLnJFeI+w+hy7A=;
	b=khvHkpxgODO4NGJTRgyMRiXMapoCu1A1r8RLjtMz2HRs8zJqfMr9N3bEBMAOwLosWouZ
	 TXo6xWT6K8kNaljxh6KOODP8ZKPe2Y9VxyZ/DtZHmTlinr9rCS8USoe59xPaUGDtrhoUB
	 bArN5Ypfkgyt4sHDecQVKODBxCCLUrG2TG7MCBUG7RyGIUOHy3VmwX8rVtjzVz7RqF39y
	 2MQlbk8CnkDfIVZPaBCfah0ZbfR/LhSMxUBNA6CsJrYO0Qhw4hfoUM2uNk4gCO9djaO4Z
	 ztXtwkTgP8uGpTmci6BRCiTx4281ouAq53CZCGwlTCLEr2+1sFT4YDpBk0HGt5/ghOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=truenas.com;
	spf=pass smtp.mailfrom=truenas.com;
	dkim=pass header.d=truenas.com header.i=@truenas.com header.a=rsa-sha256 header.s=google header.b=Q3IlKLeZ;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242C160A0AA7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242C160A0AA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=truenas.com header.i=@truenas.com header.a=rsa-sha256 header.s=google header.b=Q3IlKLeZ
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ac525c1f05so15809757b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1792423019; x=1793027819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrlZ4tZZQMYR2hWboxUPUCUfGuJIMsLnJFeI+w+hy7A=;
        b=Q3IlKLeZ8iXjajM3XQs6vl0qOp9phSvjXucwWzs6GpSNLr6OMPNq36UAM8JcdWbLLy
         BcgQHV9CavPHCIce1c15sJVfvltiCiVGH8yjbanTIug+0bAOBt+V3wQSI42wyail1kJJ
         +AFn9sBfKsHjRvsqG2fcTSV0hEGlmMXETmtjCdF6I4NDS3DufLq+0T4FiTj8IwAsD4dx
         9obE+88Imh7rhiJwqlhFBsmdOnrJo9QqWtMeOqyTZELJvnAVhJ4Ma0kQ+idO6CiJlVwu
         UhwZvZIGXeF9KncqvXbKlzp/ZXDNEjb9Zar8QX5Wjq3YqvYKirwGlmbYlUJzLqMFqdu4
         VbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423019; x=1793027819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrlZ4tZZQMYR2hWboxUPUCUfGuJIMsLnJFeI+w+hy7A=;
        b=zKqraRLGofPuh/VFrglDZgeIjPdGKx1p6M/SF8mP9WREspcxhyeyoklRClgNT0HDRm
         ElpOm/85HY8ow6KAu34kmMpNezu9nCU7Dn884cf2z8ICKJ3Mic64rvSV3LrBTEu2EYO2
         vxNy3+tLBvavnyS4IiknWORb9h1pP9Y1BX6nGk1QZR1msKLSBKn3QGYDFNx8Txgc0rfZ
         z0PQCfIJoobA6ja9nI978En9glbOkbh0kWxa6tS0xeUDwzLJyN84+DwWVOd1ubwuw6pP
         8/IwUDsibcAQzJuprWBuza+23XxP45yJDbebThUW+PUleHvEy2MmXIs59HeyCS4z1Zwi
         SHKg==
X-Forwarded-Encrypted: i=1; AKwUvBwmHtZdryx2YJGRvrRAfRBEk7p/+Zndb1sPkTtdruyeCIepniC5GKcFP6s9PW1uYt1NkH9gS9Q0dLrZcKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIeVeAUvHsYVCXNd/14vccFQN7/+5hDacmbcojPB+1Fgrv+c6a
	S87VXtxxffrOr+YAWW7Mn7d0ma090KF1i09UAzrxQKg8fDoQJY7MGaQeeTYRFOBRuw==
X-Gm-Gg: AYBFou0OvUbBd4Cx2ymhAhyKKmYzN0IBC4lZAoPuQjL7O77U4nD0AOZVflKX2wTqYCb
	1o1/6CAFAmIpKZlpuFEh4uGPJVYkd5FW0CsxU9aKUJcoq4q0m9YGy/nhttkP9stvvvzkEfAuG/k
	2x9IUUetbVH41NkKU8+Vnnfh8wOH57RdOXrdjUXPHcfgCcBhThdNTH1eSktDIr1+P6BVbBtq3BJ
	TacmjxPLczcEMgw4JDLdzD19gzdfIOPAglWGZhty6xwngc4KtdGSU3lfSa+dWWxS1JVeLW0VqT4
	mJcAtku7K0GKOOEAl0M6+nEyv1j9x9oydyZtvgUG7rK8QKz0dtf/hNvRTpbYx2Q39JzHPTxnd8o
	HLftSBRL25qiVOH1I4uvK1Kj0GafwvY4ItMyWscsiKFDpDF1kzInmCWjYh2x1YOCiIaUN3of7k8
	HJn9EEcW1KD5W6PYBkVURl/ZBIf6NrKDuvZqM/+0KVfnaZzE/EXg==
X-Received: by 2002:a05:690c:c507:b0:8b0:ad62:19ca with SMTP id 00721157ae682-8b0f2142987mr27317097b3.15.1792423018742;
        Mon, 19 Oct 2026 08:16:58 -0700 (PDT)
Received: from hamza-PC ([2400:adc1:158:c700::2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b11b812a6esm1636737b3.22.2026.10.19.08.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:16:58 -0700 (PDT)
From: Ameer Hamza <ameer.hamza@truenas.com>
To: Alexander Aring <aahringo@redhat.com>,
	David Teigland <teigland@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	caleb.stjohn@truenas.com,
	ameer.hamza@truenas.com
Subject: [PATCH] dlm: don't set RSB_MASTER_UNCERTAIN on rsb with no master
Date: Mon, 19 Oct 2026 20:16:27 +0500
Message-ID: <20261019151627.3324886-1-ameer.hamza@truenas.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a local request reuses an inactive rsb, find_rsb_dir() sets
RSB_MASTER_UNCERTAIN if res_master_nodeid is not our nodeid. This also
matches an rsb that never got a master (res_master_nodeid 0, res_nodeid
-1). set_master() then trusts the "cached" master, copies res_nodeid -1
into lkb_nodeid and skips the lookup, and _request_lock() hits the
DLM_ASSERT(r->res_nodeid >= 0) in is_remote():

  rsb: nodeid -1 master 0 dir 1 flags 200 first 1 rlc 0 name pr
  Kernel panic - not syncing: DLM:  Record message above and reboot.
  Call Trace:
   _request_lock.cold+0x3e/0x3e [dlm]
   request_lock+0xcc/0x110 [dlm]
   dlm_user_request+0x110/0x340 [dlm]
   device_write+0x605/0x6d0 [dlm]

Such an rsb is left behind when a request is cancelled while its lookup
is still outstanding and the lockspace then recovers, e.g. because the
dir node died: dlm_recover_waiters_post() completes the cancelled lkb
instead of resending it, so no master is ever set. Once the rsb is
inactive, the next request for the name revives it and crashes as
above. If we became the dir node in that recovery, deactivate_rsb()
even keeps the rsb as a dir record, so it does not age out.

Before commit c04fecb4d9f7 ("dlm: use rsbtbl as resource directory")
the flag was only set when res_nodeid was > 0. Restore that and set the
flag only when a master is actually cached, so that set_master() does a
normal lookup (or becomes the master itself as dir node) for an rsb
that has none. res_first_lkid is still cleared, as the cancelled lkb
leaves a stale id behind.

Fixes: c04fecb4d9f7 ("dlm: use rsbtbl as resource directory")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Ameer Hamza <ameer.hamza@truenas.com>
---
Reproduced with two nodes: pause the dir node for a name, request the
name, cancel the request once the lookup is out, remove the paused node,
request the name again. The second request asserts without this patch
and is granted with it, also when the dir node moves to a third live
node.

 fs/dlm/lock.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c715e171bab7..2323c7709aa1 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -826,8 +826,12 @@ static int find_rsb_dir(struct dlm_ls *ls, const void *name, int len,
 
 	if (from_local && (r->res_master_nodeid != our_nodeid)) {
 		/* Because we have held no locks on this rsb,
-		   res_master_nodeid could have become stale. */
-		rsb_set_flag(r, RSB_MASTER_UNCERTAIN);
+		 * res_master_nodeid could have become stale.  If no master
+		 * was ever set, there is nothing to confirm and set_master()
+		 * must resolve it as for a new rsb.
+		 */
+		if (r->res_master_nodeid)
+			rsb_set_flag(r, RSB_MASTER_UNCERTAIN);
 		r->res_first_lkid = 0;
 	}
 
-- 
2.53.0

