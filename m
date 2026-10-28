Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178585;
	b=mTksBWwk4eGvJFq6Gd1DVDBKisMxYnpxaHwrqrQQkbeh2+DUtahrwPtqp4aN3aoyyyCN
	 ZetJ8szPHhgmmyOjmqmR+xJvKM02QaXohpFaZhYc8bdISkhMCaarjLGOUVfjH/YCZd25I
	 Wm4pxztOq/r+JvSUzh8Miwys49gekuGatPiAFzczF31awqAZxkdLsfw04lXI6Cgsr5UWW
	 4+I1Y4vEl5xjrJIvklmcIg6+Lc19IWU9z0UGJsdGcwQDovJQedUZ+ygqYzDvCY2mboW0c
	 HcJ1tUu2CxfQ7ssx3sF5v5E5R5fOAU3Z1q/ROBuwhn44hTzO2qpIn23/Rw4kiB+hlkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X5gxbQQkcGFQMG1g4awPky4j5Q7AWCJEpP8DpLUAuiI=;
	b=VMiSFPrDDXNIGe3kHE8AiRDptkSSSfc/tucXA7HImMBbzl6XeG4D1O0VYQJYr9CtA4AE
	 0LZp+IXD3EKKJMlF+XrulAgfqFruSKk7wlK51suiDniDdMXYVjos349cm+oiAd5iUHjEN
	 WDhIia49DUOmWowN5T+hsX0wld338SW+89Af2vTUaIlNvxdc2PSWV94p2NaK3ro4biyQG
	 Eq+wG3kvz6Y8h7RJXgumS0TdLioMXg+TE0C5uMm4OJoXKJLtMqT+3edjjNPFkQTShePzy
	 xr9SurVmExaDXaHVSp6ve36THWunGL7DbBuOeZbrnkhTp588fr5axoEJUNBa4W/cHWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fQtkwQmz;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88981606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88981606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fQtkwQmz
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c434376dbebso128648066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793178583; x=1793783383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5gxbQQkcGFQMG1g4awPky4j5Q7AWCJEpP8DpLUAuiI=;
        b=fQtkwQmz4GnG18Og4wEd4Yug7pBolWQgQe70w/QqgRxHbjfK90XW8FYNR56TkHekRU
         I4eXIGDG9rmvHHivn/OPB6F80hO2ilMnzq8wUgys1AHVtxHDhNUDLwjQSVSNECRHKpWi
         iS+tzLvu8tZLZZgXuIFnKFH9jwXKXIYAnOvBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178583; x=1793783383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5gxbQQkcGFQMG1g4awPky4j5Q7AWCJEpP8DpLUAuiI=;
        b=IarH6g7a3kOj88SoHTAdUmEUu46FO+VFOJEC1XeNXVd+wti3tRLHUssRNyvtt2GZnI
         wSzMS9xEPY4Y3lMwjnztvXS89RALQVPmQgP3xp86ah3OiOM0hgBvNXkQj5I6y96/U+JV
         tDutUyNvFiWwYihn2jvlsGyXQhhbOTMz9epham3kF6Q8ZepiYYnsi+afFlDAZ4OHhKj4
         yDZEzIFiqoHb8o8c+hi0jqj1LfslvUK8M7lI3IfLUhwkMaXNzRRnuWtbrVMGKsQUMYI/
         0bViKldV3xKrMx/pFiho0biVUKYKt/H7JIzPQDpbief8iDqpWpfORu4ORG2yCqnodrEV
         fXWw==
X-Forwarded-Encrypted: i=1; AKwUvBw0V6kEfDK14zEAwuBEn8XqchNiuK+K1305oDEh5YQHQPpEVoyiQT2ibg67C12G/RtCyQY3qPbpSO1VgTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY5GBPRjhAzJ0NhYcZYkFYiTGWG1krM11Wye18g2awqG7mPV8i
	SoKlrQBz6vSBZ7JWteF25mI0ZuYoJPRcZ6BOXJ01oAnmupGZh2mQNiASEP1iHtpKUg==
X-Gm-Gg: AYBFou1F9I6yQn0cHusgGRg864HEGU20HItWujN0Nb4QFyMwhV9KDUEBnNk5I1vMYDB
	YefK6kM7xrGg0CaxZ3o/v9XdMdU1+Bmua6+fH8xt96UvV9W5ozxWabi0d+Fc3ByM+JebPzqpeBd
	Xxt2F9bUQfmn2oXKOYE7XPwmXsZjIO4yNzyU7R8iyd6/W7fi+qrlPot06MN17aJBD0CfJy76rRk
	udvkORUirLEgaMsVp60ssi+WAQ4K2WVQIRiJb7a024IkPpyq3Idt0UHdswI4o6fRf0kw5XKVx0Y
	wjdOHqqQaSn8XxLNPAJBjsaROlhJv0+d9ulU826ooKe5sHUrFqfH81YtH50IPVJYoVGowxXvxQ1
	xZu8KEOMnsM7SIGv/y6ByR5NeqreM7gKdfcgBiOvZs5AmRGrHeTdKmJ9AUJB0YUvNuAQqrm5hjQ
	KmOZ3amESR7tin4OGAbFvkgMhxKb/6Fu+HMDCdLsZldfFOx+aOOrqZY/5QSDe3Pvd30UvHlCBp4
	fDVzftU+/gfDwYGp22MtcS/UbVe+MQOCorROoHgPOgfB+JN+yEG+Sv7hgzXjrOo2FG6QdKhhmJ4
	o9YbQtpps3fGf8oyrsWhQijXEyRuJV7QYskjkNS3I8kyad0labjOEcipT0UmywKnHVJ8l0GC
X-Received: by 2002:a17:906:9fce:b0:c32:465f:826d with SMTP id a640c23a62f3a-c49c63455d4mr65200366b.17.1793178582975;
        Wed, 28 Oct 2026 02:09:42 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c49a530f520sm255582266b.23.2026.10.28.02.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:09:42 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
Date: Wed, 28 Oct 2026 09:09:32 +0000
Message-ID: <20261028090932.27053-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261028090932.27053-1-akuchynski@chromium.org>
References: <20261028090932.27053-1-akuchynski@chromium.org>
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
index 89d29ef040879..11d9589422eeb 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -406,16 +406,10 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
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
@@ -433,6 +427,17 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
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
2.56.0.385.gac671c819a-goog

