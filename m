Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371955;
	b=SzR7AxnngYrJbgPA0SEV1ST3dAVDiBvvM3kkorERgf/5Bga5HZQqEQT1valrqlZog9XC
	 Pb2ag0mmfJ/GPz1u9zOX3lDN1I5EbOb3YB2IdpEcuaOf5r0Ovn+FwX6GV/7X83bWorXAu
	 kMRX/8TqhLZ+w8beOPszHe5fM35wanilSzpc8/YxrABezvWd3DnhxlxYMKCMokJmyKNhF
	 sEa31TXSY7SZPMlkVBlZHj/lqIdfnFiZSBMgqDPHuhh1LC8A/v9cNcxIqIDgelVDqEwpv
	 mQt6R3Fe7r61MYUL1MEIIxMhZOCLAwENA6ZA51xrLOgHOKNid3/s/Erty9A8HmjvSsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WryfGeT+vcA0hEKns0lAxIOc3DwXOBIlLJSuHcQeNLY=;
	b=1LkibTcf8nn8ebTz8vPiFDMO61TmaXrwZamMG2aAW1Vo1FPo3O4RPVsll0w9cM5pWOIf
	 RbPvm6JdfojstVpjvvEE6bvZ7E1bRWw3ITbL8duoahGl19U6KS19gixMnzrDGuvBYrp7c
	 c9XocxVqkPjBSCtNzrfegFVMuPhvFoaGAjyLNhn5Tv8xa7YUJNtnNkmf7Hdn0RewHuiul
	 Cv+cUFylkqbKU0pqgG+rrZE1oCbE6f3Cv67rVvjv17IMjOzJ5Md6acZGmi17lmqBzGThp
	 ZlewCs4bhBJKTPhN2jNYUiB+uPNSeFhc3Vrjr61iaqWtvsWIdXKL/SOdDk/SPFVcRQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJ1Zy7hr;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41958606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41958606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJ1Zy7hr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7264235e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371952; x=1793976752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WryfGeT+vcA0hEKns0lAxIOc3DwXOBIlLJSuHcQeNLY=;
        b=DJ1Zy7hrePIrHOa9f3Fq8iYLUF3Fqht8+4qjw5mvNj2VWsuqmC24QmTaO1CNTffjlR
         geTlZkqqQhjaliRasXlK07WGKHsjFO90VXFnjDsdIx/7kigEoZcsROEC2NHL6BBsEJy1
         ZvdaYrIcwm0UECAHi/rREokTP/dFemT4pyy2IrqzvlDfu29TVlGgnY5l8b7ArO7kNW71
         mvAtRtENnkfpvyDWpO1BXxH6Y7PLGiYU49bznbfKLlWC9+wSIraOiRMC3T/Xx2UnYw/q
         B+6CPB2adIJCf/heTjdR5vmYjGWhqiHbkxUY4s54KTjb+rqEdSw0YyLlNJ9B04Xx9vWG
         0gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371952; x=1793976752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WryfGeT+vcA0hEKns0lAxIOc3DwXOBIlLJSuHcQeNLY=;
        b=Pw1Xv8FzN+JWkWRIDNTmZTBdHoWeI0AdhQwdW4IZ+wldBHSfq3bLGnHCDCJ8sxh0ph
         kTETSMwj+kd0z8ZVItQAFbJN+0zsG5EYWl9O73XbBmU3Tj2w1YcqjBwVLguvv8L/lFhx
         pdL4aAl3m+Gl+idvjeaUh6H3awRAraBwAPocYRRZnkvCo1b7zuWWYzC9s3QxgSZbrAZF
         A3hCX1rEwRLMrGakwIq+73GM3zrjZhWqtPo1FSN/kzFLcEedaTIQ4SNhGfGMBVua1G9P
         YfFUHwAi30tNcwdN/LLJwgCZQmcmLUts15mXpzCZqdBd/oxYhPWngmXs4P1+q/K6pf8u
         ipdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxD9eD40n1kX63RHLRTKRP0uURVJzd1FXCBJEt59cQ7ie//T6qXb2bzXToWzB300G+RgMtjPA6K32/Mauk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaia/EaYYThXUnKRtaI+SEim+qrBotiCCK4jPW8uW7DG0MX+xZ
	p6YuCB+GZQOkdDSzokY3kf7QuziY0H0YVH5W/S/apI3in3gfgQoM7zk=
X-Gm-Gg: AYBFou1pCDwEL4B1+t3APPR1l0vwCcpPqztL3kXoUbpw+CP+zJreIemP+YFxr6ppJsU
	wh+CsitcsjHftz26B1qunV0QhrOmQj1Da4QSHX7W0SapLRBtOBEITUEZtjm23iZLoxie2F6lJyA
	UA33pboWqKFBvzr0Lv/3ZXuzAfvLftkgXRkFWASvp1H2C31QJjuEANrqa+VL6J+sDSKC9oRIOnZ
	La3LrTKy3JwiZjUjt8UiT9/AWIFty4ZRgT3lj4o2+MzNDQtVjj258WBYFcn4D5N0eR5/zCYE3nn
	btqBolcMW8ALQLq4ZECiQLtQN95ZlNi78Dw3nfdpbmIwZZavkcf7bwsNAEgVOR0N1Hw16oTHCfj
	vrXXKHPpok1+JYLK94Um27icxMCErCiS9UDiOGnFqfXfN+t6vfWXu58Qh9ZG9c4nwAYns+v8q6Z
	cnq3+i6Rw1Pi9kSmsgift1B4idJSu+/1/O0whoyVXVXLEciwrO7aHzUtuuEzPhUndH2Ra+fNAqs
	fNULrmMBv3dAvZz//qgE7Vi0m6Yhuxhg+NRHS7yN88131FWgDzZC0Nzq7O8r7sD2z7KfrKK7w==
X-Received: by 2002:a05:600d:1a:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4aa86e16223mr144024615e9.2.1793371951450;
        Fri, 30 Oct 2026 07:52:31 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm3304241f8f.28.2026.10.30.07.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:52:30 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 ipsec-next] xfrm: check state validity under lock in xfrm_state_find()
Date: Fri, 30 Oct 2026 14:52:29 +0000
Message-ID: <20261030145229.74412-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

The output-cache insertion path in xfrm_state_find() checks
x->km.state == XFRM_STATE_VALID before acquiring xfrm_state_lock,
then inserts the state into pol->state_cache_list under the lock.

While this insertion block is currently unreachable -- cached is set
unconditionally at the cached: label, making the !cached guard
always false -- the correct pattern is to perform the validity
check under the lock, matching the fix in commit ddd3d01329203
("xfrm: Fix xfrm state cache insertion race") which addressed the
same TOCTOU for the input cache path.

Move the XFRM_STATE_VALID check inside the critical section so the
pattern is correct when the cache insertion becomes reachable.

Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Reclassify as hardening: the insertion block is currently unreachable
  (cached is unconditionally true at the cached: label), as identified
  by sashiko AI review. Drop Fixes: and Cc: stable tags accordingly.
  Move from ipsec to ipsec-next tree since this is a cleanup.
- Reword commit message to describe the current state honestly and
  frame as a preventive correctness improvement.
 net/xfrm/xfrm_state.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index e45aa1ed5b965..03baa50f0df7c 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -1632,10 +1632,11 @@ xfrm_state_find(const xfrm_address_t *daddr, const xfrm_address_t *saddr,
 		*err = acquire_in_progress ? -EAGAIN : error;
 	}
 
-	if (x && x->km.state == XFRM_STATE_VALID && !cached &&
+	if (x && !cached &&
 	    (!(pol->flags & XFRM_POLICY_CPU_ACQUIRE) || x->pcpu_num == pcpu_id)) {
 		spin_lock_bh(&net->xfrm.xfrm_state_lock);
-		if (hlist_unhashed(&x->state_cache))
+		if (x->km.state == XFRM_STATE_VALID &&
+		    hlist_unhashed(&x->state_cache))
 			hlist_add_head_rcu(&x->state_cache, &pol->state_cache_list);
 		spin_unlock_bh(&net->xfrm.xfrm_state_lock);
 	}
-- 
2.47.3

