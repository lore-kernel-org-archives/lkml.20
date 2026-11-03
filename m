Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742960;
	b=ucYkq0LrFO5Pc/pnX7f7EyO9+P0XDe0x72kvts4yJc8uAXKpI9i3DKOqLyMjwQFjMjKu
	 6mmyq4kiln9KvlapV4S0WTtFPYq+PJbezyMtUVOxJSvuybkQjPe0iGQnhXAc2e2UhES76
	 FitqL+hgHJa4A5BuDAKmEE1gkviKP3O2wIt8TjFf17sqll8w+XhgNh/BF1y2X0oyCUGA0
	 6VBR7Vv4idhF+6+RfBmdx3szx92pDLT2OWSQeJnFuloKqj/kcvPWXoZn2XinL/1pHzsSr
	 1eHbiffoosDvgVntkuYWOTZXotnaJoMloTEXE548rDWWFutqokLZswVPsRFHpMrCGHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s3fU+uIBacPNU5dcYXXxOIdYe2LuItJu7S++G+cSYLw=;
	b=auPvK4a7XLqWQAWyXfRIvX71WJ89xnErqR5o/6j8idxt36gd7NhzUPUs8SDPJNz3d985
	 Jo9bqEoGaf7KML3mMYd/Znhr7hIGOmsNxmiHaP3guvUcl5TF19TGZgwBrnjJo5LS1mbDa
	 UzYuP+Hmjbfigt9lPHoTHEwJVY6zWQyNo8yVXTg0RQAx/Bl4pOdL1wThq3XBaRgb8blmW
	 z2KKMP0xm8evA3qLurkHV1c8m8xgbEdAqEQLJHjUPfduf0DypuFbPu7iHFdceuWfjR4zO
	 rJQHvURvNoHzJVpr+EZ5Oedwm4HWMmoQpPZ2ASalrIAPpA4BQwJJox9ns2dhbEcQAIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WsfbYW2Z;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D628606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D628606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WsfbYW2Z
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so60227a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742959; x=1794347759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s3fU+uIBacPNU5dcYXXxOIdYe2LuItJu7S++G+cSYLw=;
        b=WsfbYW2ZnE3D8XrxZ2f5xlSnVCKbXaiCxJTYTHnq3f51CAcUf6YOaN+IvPYAbSvn2c
         L2djqS9YTEJByI/BIJRM1dvld7GHrEDPop8XK1JpkemEBdlNxKHTZMG+T6qdrfC0yDUK
         mFAx8sQ3tNPZQxtrAR9Z6YayVQWAGwyqXrDxnx11R4TBS1LDrdxTQqwxJuURltQPf1xY
         YGRk4Kpg40ZMLjJeJDY1fvO29slp+GVVSpm3mMWXqeVNrs+oTaIwZbx2BxX30gQFi9Co
         JqognmRJatCnyg26E8eajiq2d8xoHLoYN1X6vQZl1R41qwh/yS5HjsUY026ICCWICtH1
         DuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742959; x=1794347759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3fU+uIBacPNU5dcYXXxOIdYe2LuItJu7S++G+cSYLw=;
        b=oPp7TOoHjTD9iGrwXh1h0TI9VeQHjp9DKktu4WHRJ347lXv3ijxYAF/ecXCKQ67BpD
         QcOosD/QBXvwJ9ILNRsWpOZR/adiU3+FBSzc7KcehAcsLZz8StbyvPmx95IF9TUrvEA/
         nfB5Ymvk2SUj8odC4CHRDLMb21T6wJEDmy2Z9709mWSH2xjTT56jb6SkewPTynHJzZV4
         YUa2VpaXa89fMK3VSNymP9XchwdtTzpKLebypW6o/AdubO+onGzDFrhbtcBe7KUeLopM
         AeDJbT7umaeNqOjzWyWDJWfJvNFQGq+EmSzNZiLsEs8xv+JwgUEtnAHJI53gPci+9bAr
         wNcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBbB5r0+xri4jUrRsIZrdtGhxf4k6EoXi0xVmdcXMtt/sLyKNT27edzyTrYNv1S0AjBWaLqPCd/CLk/0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z97LpuE+ITAa2XKnOighqKad8jtdlxj22NsA9qFVB2yPtCmF79H
	/xOOwYDU7hdNxoYxRSwq6tKfiiUCF7IBS1e34yobf+PTAPQHMNS7HzZ4
X-Gm-Gg: AYBFou2xHtb5Vnq8RNjDKvEyEt0WWtw+E7djoQGdQcid+4pWPhNASr7eCOhBd0J65TV
	PG35yY9dI/hpH2e2ib4JafPqXau8rYMqamJj57/RsP/go2tJFgSmNothYfGiv7HkOuDgzdlJAph
	/HADUHRRtGgLpnHGqIULnf3cMftmADLCqGOeVeHSXwQsaHdNeTtgl46e8BRJgpL9KDYgeLfpf81
	1oXGyHi5u/WNRqM8bL57eOyzbfJp1q/+Y+awcg86EEmdzxciym5mhT7WGThw6lUbXricK+Fc0y9
	KtiM83K96DDbpgGC9wr1Jdf1mpP3ZtjH4RZicpAlTGQVlZj45nCz4CV3B9qYX8uaytNCA9c7NC0
	FY9E7yaSDF1O3Mmpb7jmQspqnl98iyu7fPMsaQ8O1cFq2lj1zwEemv6VGl6eQPEJA1q64nP3PNt
	FCCGiM89jH0c/0y8tmeBX10cV0O6Zv9AxJn06oMyLaccxiJn6zbke/CcSwSmlAflB6bsAhKtTFX
	BoF7yyPPN7+wzyYdEjolCfj3v0LRdlSGBk9nfFnyY/WovDRyPzZaH/nuKujxYAX0XFV13XTnHEs
	B/2LigHO9ZLXMTV0ALS0UqViSRVu2WRGdYn5cxLTX1/kYJSu2nc7eGbVJWIjUfzRZ0KYeS6uz+W
	hwDPFiLsuBCWowh6KGAmB3FGF3/yrzE4KOb+d8NbiLjKtWlZJGsbuu5DRS6xRkHwDwffH1p2bIK
	hHZuf7PkOK4Lohd4obwvrCqoA=
X-Received: by 2002:a17:90b:4f88:b0:3ac:b185:fa16 with SMTP id 98e67ed59e1d1-3ae898185bamr11970368a91.43.1793742959303;
        Tue, 03 Nov 2026 13:55:59 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944ea360sm830523a91.14.2026.11.03.13.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:55:58 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH rtw-next v2] wifi: rtw89: acpi: check for _DSM function support before evaluating it
Date: Tue,  3 Nov 2026 13:55:57 -0800
Message-ID: <20261103215557.183459-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When the WiFi device has no ACPI companion, or the firmware does not
implement a given rtw89 _DSM function, rtw89_acpi_evaluate_dsm() calls
acpi_evaluate_dsm() anyway. ACPI core then warns on every probe:

  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:10 (0x1001)
  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:6 (0x1001)

Here the handle is NULL, and acpi_evaluate_object() returns
AE_BAD_PARAMETER. All callers already treat failure as "no policy
provided by the platform", so this is only noise.

Bail out early when there is no ACPI handle, as acpi_check_dsm() would
otherwise hit the same warning while querying function 0. Then use
acpi_check_dsm() so that functions the firmware does not advertise fail
quietly at debug level, as rtw89_acpi_evaluate_method() already does.

Seen on an RTL8852BE in a desktop PCIe slot.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: check handle separately. Remove Fixes.
 drivers/net/wireless/realtek/rtw89/acpi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/acpi.c b/drivers/net/wireless/realtek/rtw89/acpi.c
index ebb6cf555747..3396d42594b3 100644
--- a/drivers/net/wireless/realtek/rtw89/acpi.c
+++ b/drivers/net/wireless/realtek/rtw89/acpi.c
@@ -372,11 +372,22 @@ int rtw89_acpi_evaluate_dsm(struct rtw89_dev *rtwdev,
 			    enum rtw89_acpi_dsm_func func,
 			    struct rtw89_acpi_dsm_result *res)
 {
+	acpi_handle handle = ACPI_HANDLE(rtwdev->dev);
 	union acpi_object *obj;
 	int ret;
 
-	obj = acpi_evaluate_dsm(ACPI_HANDLE(rtwdev->dev), &rtw89_guid,
-				0, func, NULL);
+	if (!handle) {
+		rtw89_debug(rtwdev, RTW89_DBG_ACPI, "acpi dsm no handle\n");
+		return -ENODEV;
+	}
+
+	if (!acpi_check_dsm(handle, &rtw89_guid, 0, BIT(func))) {
+		rtw89_debug(rtwdev, RTW89_DBG_ACPI,
+			    "acpi dsm func %d not supported\n", func);
+		return -ENOENT;
+	}
+
+	obj = acpi_evaluate_dsm(handle, &rtw89_guid, 0, func, NULL);
 	if (!obj) {
 		rtw89_debug(rtwdev, RTW89_DBG_ACPI,
 			    "acpi dsm fail to evaluate func: %d\n", func);
-- 
2.56.0

