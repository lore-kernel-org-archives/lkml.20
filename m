Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370843;
	b=Q9BcWBYbExW95zZyqGeqh2egpYG1BCkbcmDDqEaM96b9Jg83wUbz9XCaMFHKl7UEbbCO
	 /fHJjmr1OVc8aP55m/+khG4kDyszjRwUvoXdPo/0a/FIqcoSN7G3G6ZM09L6KZxOX+hB+
	 EQMUkfLOtpN4XUk4ZhtrSowAG5CU9zRVauTM4lfWgN9xIwzKSy5AtRSHGxPNy2CGZX7T8
	 0qPGtkgfqiMzzQT92P+LNE0UfIGD6W3E7bkJY8BzpdHD8G5BwCczIins+kfwCV68guaL1
	 voMHuKsOugPNfoWufgkuK6oFBl9QgWtw724/ROqygfh89EwxFzZrKGxfNhGpFhyFF3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2y/k0vv1KZWvdv/tcZ3kHN2M7tA63Ao7aQ+R/TLoEBY=;
	b=qDyxWmAc55SqaKidM1sVYNpEGWA1fSFoen3y9UGKNz8s91GQEae9Jxv7dElHYMvSTHkR
	 e9eEuITpkVbxRWM81zIjjbw2W+D1xPn9NUtMXDt/jpjExdV9G8OHMMo37DNvgaevZazKG
	 EGAVOoizmFaE0oX91Wuh5BWAr2FB26SIPkFfiUwjJGhsX10oRls9EUoYN6Qh/4zEnQS4j
	 BX1eG+cqiP4iKlzlqKObtHzeUnGesMRtAdCp5MB0q6snRRZlvHfOqb4d/urub+/YNU3e0
	 AATgGzVFbp7iFV6/jIGPfNcgFbqRXsGFQG9yC1vVsLlmggUszl25wXQxn955OIdH8Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYDcDVWe;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C35606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C35606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYDcDVWe
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1202178b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370843; x=1794975643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2y/k0vv1KZWvdv/tcZ3kHN2M7tA63Ao7aQ+R/TLoEBY=;
        b=uYDcDVWeZFrbHF9vMV26+UGVFxPWRvQtoJIqvx4qNzOIngOFXdhm8vzZZS1gQ3fLAr
         JX0y8XI2F4z6eD4bqeXVvyLZNZnW332lc1+gbGjBffXKFTqCtgNPtHKnXilCmBQj0pRj
         Xmt5hAVOP0f/NAKzErpgM2gEZrRrggBAyor6jJp+a0iUAMb7DnoeW1bIBttmTa7P7Ana
         OtCzGqSCpUb9fbhZ5pfg9/3WLAzlucpqWbPARzhxp2pJlPFbu2P9TsgPIdBTx4Xwk6yJ
         F9x0H4woEb4gS85UMTVPzQArwPBs8/7QmVVF1Fd80irwKP4l9yFFUgy9Fa6z691zLIxj
         zVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370843; x=1794975643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2y/k0vv1KZWvdv/tcZ3kHN2M7tA63Ao7aQ+R/TLoEBY=;
        b=qO9k09UY+pcCYPa1w9BTiG6b7fxAYoN8KCYzhl5r9Y56XSKhT7ONB8uUvimvNiCrOD
         6Wgtsk+CNI3FdSGTjqM7sW0ptQGmuFRr5pdHnj6mp29/vpF7HNvnPk4RAoy+EpYaFLGd
         o8Ax5c7pDDctdRBog2yyqqi6tmBeSFRJEjX0So/l6pfCZO1id2EimaicapLuVsTUX5Mt
         YjbCHuH7BnSVis6zKJaXUN2ZLiwuAyXE6CMuTZT+xjcXIBOrTD4HbbOD3KFb+ynl+Jx/
         zcITaWxzVHgQppcnTAXt/9y18H1/PcFOpGaw6Vv+LeocIH5D5B/LpITdHP1ymPQYoglS
         hNvg==
X-Forwarded-Encrypted: i=1; AL+hErH/4nti8FIRjMXDySNgIgz+2mVh/uNteZycWsIz/arbQPte84Ir6L8/fMkt50kIAouwhUpsrlRKE/uwlA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8arU/e1Q5GrQjfc/1BC5xPv6D8waVf1Q5GPOpEOJMx4hDMupky
	bgmHjEgHMFpjJGsMBns+NugQwRUoB6OjaPdb/BwcVxxeQNTYxjw//kda
X-Gm-Gg: AYBFou1jpmDrRmjR42EZegBnY9zs3qx6HlRM6mvpFnsiEXKLYpgtUSYFksuIBnGLApf
	JkrXEFKDestTdqNaKX6UeElzi4MohUt7aROLOyech4r7VBWMlNJVubRnQcw3k+yjqgr3RgzE/yT
	KWJOCUBCZrMXrlwyVcR/MIUvMiFGq8bfKZr87kAhoUyRMkveWDD+X/0GAApyUTvzWdKOs+K7ZHw
	Tp2iKQgsTbCY0OQ1TlTr/1bPKUjaS8r7iE9Gy8AG4NGL++bnC0o67Ot0ChSgjOcQ18VpGEqZP4j
	zP0yuXps1ZpJ6g0WWEH5EaA3Jz2/u2/wA0bE1pVQ3qhT1PNL4YgEWut7I2LYKFVgj4LgEf9yWUw
	rtj7sd0yI0AezB5TIViRD4oGHWmvG27gzvkZ0lxV1/ODWqmyZPZhDpl1XR8Y3OgKZGi6t1hBRK9
	g3a2PoL3vNHitvmg1yUVRhZmmwEBbRyc8/N+1yoIqcZl74aeicJSCgXBaT1cvhHpwqCedxqxQh9
	lW6EhySrB2oiYosSRipqITOD3zlpuMJYH6Pf/5SJzNua+p5bqEww/spoJ7hBtF8V4P5nhV6HPpN
	WBwv8LlCliIpOx79F94=
X-Received: by 2002:a05:6300:220d:b0:3eb:affa:32c9 with SMTP id adf61e73a8af0-3f2f72992e9mr1463244637.0.1794370842730;
        Tue, 10 Nov 2026 20:20:42 -0800 (PST)
Received: from oslab.. ([101.6.42.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm1319947a12.30.2026.11.10.20.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:42 -0800 (PST)
From: Tuo Li <islituo@gmail.com>
To: mchehab@kernel.org
Cc: Markus.Elfring@web.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tuo Li <islituo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: dvb-bt8xx: Fix double-free in dst_attach()
Date: Wed, 11 Nov 2026 12:18:43 +0800
Message-ID: <20261111041843.1278057-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The caller in dvb-bt8xx.c (frontend_init) already frees the allocated
dst_state when dvb_attach(dst_attach, ...) returns NULL:

  if (dvb_attach(dst_attach, state, &card->dvb_adapter) == NULL) {
    pr_err("%s: Could not find a Twinhan DST\n", __func__);
    kfree(state);
    break;
  }

Remove the redundant kfree() calls from dst_attach() to avoid
double-freeing the state on failure paths. This keeps ownership with the
caller until a successful attachment transfers it to the frontend.

Fixes: 6792eb0cf931 ("[media] bt8xx: fix memory leak")
Cc: stable@vger.kernel.org
Signed-off-by: Tuo Li <islituo@gmail.com>
---
v2:
* Update the subject to refer to dst_attach() instead of frontend_init().
* Add Fixes and Cc tags.
* Thanks to Markus Elfring for the helpful suggestions.
---
 drivers/media/pci/bt8xx/dst.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/bt8xx/dst.c b/drivers/media/pci/bt8xx/dst.c
index 110651e47831..5cdf8a77260c 100644
--- a/drivers/media/pci/bt8xx/dst.c
+++ b/drivers/media/pci/bt8xx/dst.c
@@ -1694,7 +1694,6 @@ struct dst_state *dst_attach(struct dst_state *state, struct dvb_adapter *dvb_ad
 {
 	/* check if the ASIC is there */
 	if (dst_probe(state) < 0) {
-		kfree(state);
 		return NULL;
 	}
 	/* determine settings based on type */
@@ -1714,7 +1713,6 @@ struct dst_state *dst_attach(struct dst_state *state, struct dvb_adapter *dvb_ad
 		break;
 	default:
 		pr_err("unknown DST type. please report to the LinuxTV.org DVB mailinglist.\n");
-		kfree(state);
 		return NULL;
 	}
 	state->frontend.demodulator_priv = state;
-- 
2.43.0

