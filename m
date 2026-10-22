Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676646;
	b=Aqkogsazl5yLf2Lfa+n/uhZ900fUsxFZWGjUa98CNRrgsTlid4SRFQQW4GG8mtMOl8rz
	 eBA8n5VS02vDVqVCyMJgYyrFTkXFD1RP0u/cyveSijjT+vYtooA70i9lGZOnfRrPlHPYb
	 eTB9AjH9iOUmyf2ctgtbnGAR/3UEMq3fK7PRh3/ONR4bG4eEu03XL0KPwVXqF/eB0qVcb
	 evULUNbhZVWB8D2PRusSUARtJmNVIZoVLtqLCKHIA0gWhs1Uc4EXssVDilDlvZzIx3g3k
	 MLoTzgDmxPy2f9yw25MSoiOAi7HywGOvKWgJgsBieozPpRxcSxmy+XazJTeYgLktX+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IGum0Dhauevbw3Uwf/HnryttWD3FBap3x0GWqK5kUvw=;
	b=J9x+oY40xiOzj5lEJYZjclXRK6uExsHwnOorbqRzkPRBQkm+LDObFJeir+EHJE30kjl2
	 sKwiIDUo6ECApuIUyIxV4kL8CaReB96DMGySkuIOMSkFBljD8UClPyLs24F8sYulyuC1T
	 cfYHxpxXC9ybBvX49F5ux6UKuis6AM+qnEap8X2ocuixM+/o4KioT9o/1grJ8lVogVucv
	 cL7jU0mIX6D4ZS/ml6Qv2kERkgMoQtqvzogcKl/gmpBixRGPbFHPbT+EXU6Xx4mEfQFSB
	 ntKxcpallW+zVqFFtZ0iTS0JOX48CGFNYG9WkytH2MUorEbmySjslQe/Uz1hGrfA+8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RDuE7dhM;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF14160A4AC5
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF14160A4AC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RDuE7dhM
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e0d1da913so813944f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792676644; x=1793281444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGum0Dhauevbw3Uwf/HnryttWD3FBap3x0GWqK5kUvw=;
        b=RDuE7dhMDt1vV9VLy12Ek2t7MzQ+oYNV07RvBAd8r1kjlXbCDVxyLhJNy5Q6rPNH+M
         w87bO61Ixv3pZoLJuOR6TLEBQNdCOdDVR1h3h3pOM/OkBhz8Grs2doXeUmuO2vZCYs0O
         c5utiXuvyfxxOSOsItpycomUxvIOnNDEshoXG8F+S87tooFO+4bDyiZZC8PgLWuI9CDd
         cqHPFLb25X1GqhWVYkkUazlb3GkOOXT2PxOlrvyOP+LgXeSTwOEMvT5j5B7MWosfqP7R
         5GN5M8+Ox0aiHXkw0nz82TKxL4bi9iqJANtd3AlqaSn82uJFBYAcwl/7WTZavtSkJE9q
         5FbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676644; x=1793281444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGum0Dhauevbw3Uwf/HnryttWD3FBap3x0GWqK5kUvw=;
        b=iLwk3heJa7OHa/mn720BySBc+r9u9YmhwkLmH+sqZ6qnLwteHjWFY7WzaTLsTHrV7m
         6lNpXSrXWqpzr3gzhrrSATJX6ysy4yjSoaZjItQp7bozSESrKRHM8HSJKB2Mes1CW98l
         YCT5AtZboHVZ3rgDNL+DO/a4SxHcdN5x+oxsv1/gsJVakoMJbqBtB8Icr+/rmUYWtrG4
         3H8CKLDfpyqY3Bi+jpFzk0DF6lCT5h3hT2UAU4pTUF2H/EIQ+OWryeDE9pFePcsWu9bA
         jS49FxxK0g3sFSZXl0VNyHOIqW0jKBzpryQzopZT+oWuE4R4aQTAD3WJkIIK0L4z9UuE
         t+DA==
X-Forwarded-Encrypted: i=1; AKwUvBzFOphSnTSg1xGi1yQAvGlvfvKXaETmB7tDp92MA40sd+/IQBC6U/EhElykJCAWX5AdndkCEOswA5s5cck=@vger.kernel.org
X-Gm-Message-State: AFq9FYJblGUQDs2ora8TaBBcq5Aci5twynyQv+1WBL2pmPG5Vo4VlteQ
	VKGd/i1hxBtXedFwUwwSKJcID26H29as9czQR7zDfuN45ccoh1R9gTAgksvopg==
X-Gm-Gg: AYBFou2yzSL081Y7MgD3gHh3MFmt/Istsf9ulriFIqYKsoYDU+/znIIwgD4n3CcuE8w
	49QklaWxIDO5CinUmIRsqhKYH+uQkTzIWixDUvziZcohktKWxrPBUYxT9Wg8aKl2SygK/KpIMKg
	F1+4opymrh2i84BxUQV29TLu3JU1gsk8uIuX6VdcFRKwgLlS2kYCPfOsflpgbOalQ3qOosyeitP
	STUzG9v4SKvHlzbMk/0j5QqiINe0m6GYRYapKxgL2VR876srUxEIAkvu22WDiNbJK26lOM6/XUq
	xeZQzkVdKrYItWkGy5e2j5cRSdObnMSckPkexcFMRcxV3kqA4Y/3T5riy9ypUWGpx0J0MxW1C2P
	0tN/QLTHeUg0QNfCxuGsFBCcVUV2KT8or7sRLfzA1kzjhEdumTtcvDoubNmr2fEBt6ZsJnucD8r
	Gfuz0YHgwlGivf9Zvk8CU8uDSPoMGY/Z66BC+KX+SVr5WHw7dKGmVzAEVgjOA+T2NeU89AldeVF
	NuRBezUXAiScyfEyFgHB3yAD3XA+dj5bz1qELPO1McbxqcL5WjIOPwWxQ==
X-Received: by 2002:a05:6000:22c7:b0:48d:f852:c66b with SMTP id ffacd0b85a97d-48e2d26b3dfmr5786135f8f.22.1792676644028;
        Thu, 22 Oct 2026 06:44:04 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835b1dsm13621390f8f.40.2026.10.22.06.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:44:03 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	p.zabel@pengutronix.de,
	Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com,
	andi.shyti@kernel.org,
	iav@iav.lv
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] watchdog: dw_wdt: clean up error paths in resume function
Date: Thu, 22 Oct 2026 16:43:51 +0300
Message-ID: <20261022134354.534642-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022134354.534642-1-a.shimko.dev@gmail.com>
References: <y>
 <20261022134354.534642-1-a.shimko.dev@gmail.com>
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

Clean up of dw_wdt_resume() function.

Rework the error handling to use properly named labels that match the
cleanup order. Use unprepare_clk for clock disable and unprepare_pclk
for pclk disable path.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/watchdog/dw_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index ec6a09673da4..11caf40d6771 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -393,16 +393,15 @@ static int dw_wdt_suspend(struct device *dev)
 static int dw_wdt_resume(struct device *dev)
 {
 	struct dw_wdt *dw_wdt = dev_get_drvdata(dev);
-	int err = clk_prepare_enable(dw_wdt->clk);
+	int err;
 
+	err = clk_prepare_enable(dw_wdt->clk);
 	if (err)
 		return err;
 
 	err = clk_prepare_enable(dw_wdt->pclk);
-	if (err) {
-		clk_disable_unprepare(dw_wdt->clk);
-		return err;
-	}
+	if (err)
+		goto unprepare_clk;
 
 	err = reset_control_deassert(dw_wdt->rst);
 	if (err)
@@ -417,6 +416,7 @@ static int dw_wdt_resume(struct device *dev)
 
 unprepare_pclk:
 	clk_disable_unprepare(dw_wdt->pclk);
+unprepare_clk:
 	clk_disable_unprepare(dw_wdt->clk);
 
 	return err;
-- 
2.43.0

