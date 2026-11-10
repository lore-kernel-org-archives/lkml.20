Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301463;
	b=Ps4Ng6wClcgbq2FI6X1ImKnC1OvwpGDXxZBs1F0NLvAy1LfBroMVltQT2Zdh8ce1Ljow
	 +ICn9nWUYR1jdsb7mGEBCVRvOVfhCeLIxV6mDuDIujNHrCN6elWP/MR+vgEgP82pxdHHi
	 8oSEGu/TWHB7IJR1pu9xRSeZHdrYi7W9nQoAsHTqOkD1ak47PHvN7fE8OP8n7Akt8a3bw
	 7mytaWR2xZesuWhXX9zwsf9TDb2GfqORhNKs2Pk0mdAl8k70az4jBd579pducpeTKuf/0
	 dToUfC4NZRo/xFbJqnZ3L/sEE2ZeA6soXO2uXwHAnsiglLwpPe90wEeBDrWvRTqYoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2U8BvVAz9intahmNBcPTvIKc7pOjctV7JcQq6cwhKEU=;
	b=wp9sopw+jm0diLDpJS0UKluE9I2t8ntgTd/9gTgPTchEOF5MaWaYEPU9EVS8a2Pk9fjr
	 Q2OUfFhOVjM/dk6xeJwhLmbZycJ854HRt4Fs4nIWlo0SOxk59WNBGe7d5YXaElKWpDlx/
	 lVLwfPEocW9PR/ErgAhObEsYZQCGs/nG6nViMbCwaDg0oQBXhwm8zwZVq+U04tKM0kTFg
	 upnef0WfE1t6Rb9PCZ5f33SIPYCHsRFHQ1FWxZ5bFhaA2Iq/fhrfqIf4mKl+MIEyyVE0n
	 QXAuE2VMyRn8nceN2bzijSG1tKCjf/95tniOBsh8IQL/JsS8ycTfgVltzA9FGuPRTYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHN4HdpJ;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E4660A2618
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44E4660A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHN4HdpJ
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b1015a4259so1181088a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794301462; x=1794906262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2U8BvVAz9intahmNBcPTvIKc7pOjctV7JcQq6cwhKEU=;
        b=CHN4HdpJjhaw6yzpMGiBtZd8Cy0+I3sGP/qWTxIbR8Fokp5GKuXtar3nTW/rK1SStB
         CLiQKm5t0b1dfTfrauLTo60yJ8QRnk0lOWJZ9tkP/yFythccsI1AcUH6aTfxAqRhBi14
         gKSSL/rvAa5bLnmVhUrukJz+d15GIb6iQZfPzJURtDsAklciwRmGGYvXfCdVcaOYmpWN
         WZelPjBGO26Z7Xdg6j0jlmgY8n4Wum0Irl6YjGVdoRIiPwovhB9FRcrujvvZ8oTkB6Yr
         xbNDEafkzI8bseF2OvaohEXDfdQy9EixptAiQyEdE5UWQJobyRYYD/vfStClGpJDa8KW
         v3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301462; x=1794906262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2U8BvVAz9intahmNBcPTvIKc7pOjctV7JcQq6cwhKEU=;
        b=B7bUG8vT9NrP+5qxIoP2gvOAWif1SSeKkTo3SZA976JRP/9qOY2C47CaDczTsNx7Y7
         fP970DN6RLlhW/lhr49a5zDqBJU7vdGpt1xLjCfgPoq2yGIlPpNz7mHmjcsj5UdNis5+
         Dw9oS6qyKihIipPRYK86KbXBGLBlfys7u03Vj0Saa7pHippMvE+ECeLwed9hn2QT4KbP
         R0eTpjUZEmQMT5yk7Q3ip0mgVJf6JDxYIhEh2P+1GIa+OciF362i73RKg5Iz9r6mSKYG
         HBPH7dEduFPE0lwofcowPVEYUlC+LjgAlghq+OB8KlqE2a9JQhWW58UqamV41VThSGEG
         eTSA==
X-Forwarded-Encrypted: i=1; AL+hErGcJ7PURLFTome+eM6R44ae2aHk/qlr2/bN1wDBwwiDn5e3HCQE0QY1sLrV0v6YliqtsOlwDsJve7hKi1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EbMni68QWyLd4esQOsWY4JHPwheOMDB/ojecw96CiIb16mD+E
	XqsEJEj/k0XkUGm/ChppcuOrHT9jEnYrPA96nKBj+vFzvwV4UdUm0/oQ
X-Gm-Gg: AYBFou3Fn53dvZCE2kqsA9ZYOs8piwWDIaLpDTUgzJP3h6ompHymXQQ4VyJlPw/VYnU
	HkIMDzAfwcShttgQq0JfsJ5DUBdBA+9sRr1aw66U6qcwSzPx66l+V78aDdzhL/+BGaEMcmmW8/Z
	R2pg3N0YpJZIG6ATYIz+VRr1/wPt76HmKv+XYci9YE7lgbkHC2df8aHv9sWOdr4qLEvdOHtr8vJ
	yTsZzWT3BTPWxydNr36QWEBJxL1uxJsu0jh4k4jwNfvNWhIs0WNL9PM8rzo6D/Fq33Sb4gxHL6d
	slXTAxCd9EMKp8DTwECFTZZlPmlmEaR66CSSXEUnD+VEqyXxPLJE655irJBAGAJZGQhgSNifMbo
	nFdYUH6eH2q1ZdhkzJ/el57zJw2dkD20k0IInys4GwsgFsCTf8O+pejihkug9vn4kDdYANTrgt9
	/i3l72UPrcrCzAwlRH4SMVH8ErO7f8THByjioOzhbNxC6A+tVbZEBEbIxCjCe/p/M/V5KDPs6JM
	8BF04z+WM5Ja5ikRJA3m0iEEKDFzY+blC1G2tPNxBQQeup3MuDfzGXisbTtwn1XU4f5UE4VPAoC
	QKAJPYlCk6pkri9v7JUs
X-Received: by 2002:a17:90b:1b03:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3b166c8486cmr2157706a91.14.1794301462591;
        Tue, 10 Nov 2026 01:04:22 -0800 (PST)
Received: from oslab.. ([101.6.42.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1676d83absm3051305a91.7.2026.11.10.01.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:04:16 -0800 (PST)
From: Tuo Li <islituo@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tuo Li <islituo@gmail.com>
Subject: [PATCH] media: dvb-bt8xx: Fix potential double-free in frontend_init
Date: Tue, 10 Nov 2026 17:03:43 +0800
Message-ID: <20261110090343.1245744-1-islituo@gmail.com>
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

Signed-off-by: Tuo Li <islituo@gmail.com>
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

