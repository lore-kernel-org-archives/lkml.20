Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894358;
	b=rdEnIOEh2R0ScNUmd4TCd4z6daJH5LYSEn7f9cuj4Kx7J3U+eI30D3F9ZE1mcYlTMChK
	 qTfw6clDY5/ebQSRSvFML0k2Lw/5U1fOdVnA2AY0ZYdFpZ6Gimhi78bAZcXqxv6QsCTnw
	 XXs5lumknmKZl6nMNYS+C+mEn7WAoKno9bvXcTAZOd+c57mH/j3kPkdCz9HtB0QTyVuMK
	 +wuOZ9biXsLi4eQNmd1Y6IYeep6TtnqCfk5p1azcU3DVKVzerjfD1rR1rvsn+UGPwlqE1
	 Y8LiIhdUgryYs9abuQLPHHiEQ0eyb8qAL7cDsnoz+4i+w2eW5KIj4ifkOcurcZ8Zcdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+hWGsr6KFBkJnsArQ4dbK5v+XZDeY/Y1/v6u++CjxWc=;
	b=ZdDg4Ojbt/B4LWN7JD5t/8d1c0+0Kg9OgdD2+TIAozOwsW4vzm0B4TlXhzoeYxTU/4gj
	 E/iB+1+/L91T+tf75IwyQbQ7nOwMptkhNqTEvUgDakOpfZWf1ZDTp1CX7izmc8erjkLVs
	 sdHL+sYEiEdp7tKbadEhxpMBwBtQSrj/orKIEIjbs/VBKoBBlDdykKJ6xGrHotOk/7tBu
	 0QuSPoF3/5fqZFsUosWd6omH/UWdmDuO3XA2wPK3NPNysAA5ieHyeGGzJNi94YlSRXzNr
	 aD8TEan9yOxnfmG2FJosMApiMhvrcZFb+aQulvoQGKjbv30CMGOdsTlQUIiG8nNfe/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QY8eW4zz;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CCC606B45F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05CCC606B45F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QY8eW4zz
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3071099a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793894356; x=1794499156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hWGsr6KFBkJnsArQ4dbK5v+XZDeY/Y1/v6u++CjxWc=;
        b=QY8eW4zz++bTgr4WX1NDzJ3s/Wzvmhv/NKufMf2eIOibQeZMNGPrQSQ/z9T8N55xz7
         1lmFoihEpfz3yBQcykfKXUF52L9uyk7w1HWgzQFiF2ZohADDSNzZIpNETknv14mlckgY
         sf3Av6ms6EAvd4thsaYjexR/QDMoaLw2rw2O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894356; x=1794499156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hWGsr6KFBkJnsArQ4dbK5v+XZDeY/Y1/v6u++CjxWc=;
        b=b0R5ixbfFIWB932XnxnyRPuukfxVfheQCoEDQtymmQKusSZrdBSaFAKLkw7V1xC60j
         k8wdcY/iZkJUn9zM/dLxCIWPJa78nPHCzqeGBDK1Uoh5fCizVku+8ryKEOBpSFs+q36K
         JOd8s8S1vTCeYLEeXNAgGc0O6+GzK0R9p7ApMY9Hs7FbstqTDRNGP5PxnDmyozrEwrMU
         pxiTfsF32SOfcD0Ho3e2SGiQCTSfRv3Zk3LbcRsa0UPedOT6bRL2tPKQSPho+i3CYlam
         vrf7yjnbfseRnq0Tk6KfRZYdrPSry6CFgnNYXurTmHln93d3a7RFQw/mC2zfjMcsMBa1
         oxlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy8rFDk/MgrYYiWobvR4sUJcYUR1N5GHspqnSi8iRlCAlvH4rM0bXjwR+K3zlbwddEMsSBiHcQWJJ8/1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U9uqwUSOJNTbj6Rc+JfuM7O/ETVwQ2aOasmhVzbUoIansCGDf
	KI+KdylwMwF+DPjY9Q/Qi/1wdq2udjEyJTUM0BwM3M3sGezLlQM0kaJWZ6nm8ytv7nXRoMeMVGd
	YD8NHmw==
X-Gm-Gg: AYBFou1GNMS5gGPxy4FjGSol4HllaqCSDB5TpYkdy6cQPBu/N7RcKTVCVvUOF3RoBvq
	BH7SSYahNMyUZvfnjgAowVWvHbDDzDiBkXXcWNvpCMhemO7lREZuM5WHVS7wELoHE6DvxVOYpm0
	86IkHqk2OIkLj4yVWTYiexUm545M8cAx049LxtOVcv0xlh3jVUFYlagkk+CiHAztDQ1kQT2m37f
	9cX9V6TwqLzptmK/mJL5B4N4GeWpzmPX7diQFjozSxQ4sGqY73TOfyOOZQyubnCg4d3pNePbjUf
	cjo1QqYM9anI0di1yUmRNBX20Wqvs3D7i4j7SSR9kxPLOje7NHoOSh07G1eKzTOwaV9I7OLS5o5
	UfgqigiaSQL5Ps4ibsm2gL9CQ8ipZWZH25CWXVyIbwSrCvPVzftsF4ycaPFaF10yHl96SzfPm+s
	/6N+Zn5UCu6MqEab3wftR8wEaecMhX999T8Y7CgSzeobuVh/kj1dzA69Ql3R1UbvOCpLVKU9OyD
	p0AdaST68aF+wr7+S5DjQ/X3YLqnXLonKzmUuN9inlG1cCC051pK77/v8YQnRFNU8Y/RdNQ3GHi
	wiyaS20BT2CA2ZHRnCHICuP9FEI1WFYgERbWH2wKWRbZxwamtYSaAax9Ya9nedybMQDDo3N5vyd
	o51moYSS0OWQ+VCXLxA==
X-Received: by 2002:a05:6402:2344:b0:6b3:e575:f4da with SMTP id 4fb4d7f45d1cf-6b4d33ab55bmr15476523a12.4.1793894356329;
        Thu, 05 Nov 2026 07:59:16 -0800 (PST)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6b58c868e70sm298094a12.24.2026.11.05.07.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:59:15 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
Date: Thu,  5 Nov 2026 15:59:06 +0000
Message-ID: <20261105155906.2670094-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105155906.2670094-1-akuchynski@chromium.org>
References: <20261105155906.2670094-1-akuchynski@chromium.org>
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

By default, alternate mode priorities are set in registration order, with
the last mode registered taking precedence. Changing the registration order
of alternate modes prioritizes DisplayPort over Thunderbolt.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index aeb3de4f09934..b13b0914a2cea 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -444,16 +444,10 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	struct typec_altmode_desc desc;
 	struct typec_altmode *amode;
 
-	/* All PD capable CrOS devices are assumed to support DP altmode. */
-	memset(&desc, 0, sizeof(desc));
-	desc.svid = USB_TYPEC_DP_SID;
-	desc.mode = USB_TYPEC_DP_MODE;
-	desc.vdo = DP_PORT_VDO;
-	amode = cros_typec_register_displayport(port, &desc,
-						typec->ap_driven_altmode);
-	if (IS_ERR(amode))
-		return PTR_ERR(amode);
-	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
+	/*
+	 * Alternate modes registered later take precedence. Register DisplayPort
+	 * after Thunderbolt to prioritize DisplayPort over Thunderbolt.
+	 */
 
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
@@ -471,6 +465,17 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
 	}
 
+	/* All PD capable CrOS devices are assumed to support DP altmode. */
+	memset(&desc, 0, sizeof(desc));
+	desc.svid = USB_TYPEC_DP_SID;
+	desc.mode = USB_TYPEC_DP_MODE;
+	desc.vdo = DP_PORT_VDO;
+	amode = cros_typec_register_displayport(port, &desc,
+						typec->ap_driven_altmode);
+	if (IS_ERR(amode))
+		return PTR_ERR(amode);
+	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
+
 	port->state.alt = NULL;
 	port->state.mode = TYPEC_STATE_USB;
 	port->state.data = NULL;
-- 
2.56.0.398.g882cbad275-goog

