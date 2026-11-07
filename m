Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069526;
	b=qUViVZ5aYDi1T53GkqLyhlV1YDWB3p0Z0ivRLDB4r0iNWci6xJPAGocoaIF0uIpLkjjo
	 5x8nkoE/vFjVKKaTB2QNjjTgDfw+hO7C2lovlgNp/NjPdvYBekmCBueQLN0Ldug0tLxYy
	 9o/IDIYsP0f3QxzLlBp4SGGPDOgAs4XZTGadSrXAwX49YsvIEujbG6i6N4XVbTDnXP8iA
	 /ujvZ6MB17FIIH2mslRNQe5hCJOaTYBEX0eNuJf1WB8PF2WmTnFQmuF2PJO7C0IDr+24i
	 138TmhvuWzPFIGGOtDBtWo1nuzaPE2ngqbqKMiM11h5mHCa4AjtYoPJGFjm7u4hBtPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
	b=MsXEkVjVk4LuoH9acIrG0LH5B4BnB0vO+y7qqjC6GCa5dlPEnabsy42CsrmM6AntojKF
	 7umdn1/iOOEnLQoHmlu2GRxOQ4ZshmrHdwrUB+xCmsfTv9s2UkkAMW1zYAopd4fGbUmr4
	 Kvm3EYYeNg/I+U8BVSWKfvkuhvqafOr6EB6QNtP86rxp+0kRgIqPctZDoj9LWjpqTZELy
	 p/S2f6u4cMIdzV1XwhKVIv2hlc+9mer9gENULBzdeTkJJW3SdBmvj9BZRtpb6BluB4oVM
	 Febygs8r+m9+SXvadH0sLY5Agoih/SA2BFDIg37Nez09HPe5kHOxJy3SKZSnUr132bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GEAP47jD;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D5E606A336
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D5E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GEAP47jD
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4630395e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069524; x=1794674324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
        b=GEAP47jD5XGySx5b6XgvhxRV9mT0rc12612iGPe8EAYt4d0giV4xbjAg9ILhUuRVUH
         OKMLMWAq1ixgw6LhuI/Xb6WujttdjIikOk3d4OfNglYkMcuis3HNb/CuyorA6+aykAhA
         0YhU5i1yM+uzAxpLCx9es/zerqeEVz5CvhMvow7R9+fJEohU/EMS6AQujjayYh9s07s8
         E/cm9AeHdlp6nytybfwvmrR1C8/WFkzqqkmRcsZMJR6gzw3yAV7JwLvdYNoImKyOHaPB
         nBsIw8m8kdTCNnhcUw9CPKHUuEEJnEQIgMsy4gMC/S2HB8swM61NgERHOXWqnxTWk+eR
         FQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069524; x=1794674324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
        b=jibcIhwAiA71JjKqlA9Il33JCMeqJKzt8oySiNC1ZwiT3HqmIM1eY8qI9RaKcfm8AE
         SFOtFNrMGXaPycu3uLuwlAnZiEWJXORb1OS7G5cu3EuUo1Id3dVcS5M2k1PL8LjqmpLS
         1BiUvUCGrG0iVg830JCjF1Y/Ym0RLLAXD+MovrBFMjfJaMzUd5OaPzHExRv3WqrTzmfc
         vLg80GlxDEZklfPvN4ACJv3pMGDUlmEtmob5q1VD+s/cUSl7XEEIkNIbnwa0jjcRJJVu
         mGM4ej5BcAz/WLEzIOBg8U6mNFR1395QHuRzCXA9Dr9b10prb9+yRccposv1i8NZGluR
         CWqg==
X-Forwarded-Encrypted: i=1; AKwUvBx8eFXcilrzfOaaJulgB9n+ECTS71F3SfCEVRFRAtwLOflg4fjCwnFrfSQBkLTrBPteDEMTyF1mQBUPT74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O42c6noyJKCAb0zK2kjmHYlITlW+SAi+zR+PmSBx5vMoSAs2V
	ikn65kVJZo2tH4kIKS/ibooiwewp9IfxxOo3/KKgBQtjjyI0WZ7L45ir
X-Gm-Gg: AYBFou10UQhLC6kfnEhOZ9DONbUweixSvlgbbxBDvQ/KO6J+c0DL8RWAoT8vzc3Apa2
	dSgnDcmts2TFyTXT2TYguqdnNbuejykAjxPqtrqBINb6AeESYdodH9n545PHSnIV4534QWDjyIJ
	v/7m/8s38vtCkuxFvBUggaPv4Exs4PwJZue6bwKV3VbPhf2taai6rdOjMiPIj0885GW0xb2OFRX
	FE5X7yz6d5H+Cuqszib+sCtrAY2FMyplTvaxlsIJ4DMhnKlb/MltVl4eR0ufylu1hOUUK6/wvgB
	I7VKkLLLIn+j6Td565yDNxFK8WHYM8Y+G1rKuD6HAlJ7UJhb6TM6jm+Im3quGsRyHxrmhCRGDLT
	usIsVxce3aFXWRyEw8rQQnwquA6W7iDcL2vPUTe3PmQuTgYBUXeVDBHWclVsqoM3IpWmkxj35nI
	nC7NWynfi2o2rjiR7RhfGXGUnzqTuelCrlNcsqUg6vHjQDcvkju0uZeZt1RhnwjQf3wB3fWpuF5
	D6QZRqfxA/eIbeLQ2N/2QUMnsRtY3spvfCuowJI7JK+Eft0Ypzs2aJpD9qLdl4hxxmWO4KrHrLi
	vifKcksIMKURAAO9NVWs85ZiUIm2mcLeNgjSxO3nxYED1KkNeFb/lFLQgyqU+7Uh6jCF9Gd1UV2
	oE3BKy1p+yJ5f+ok=
X-Received: by 2002:a05:600c:3e8c:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b8190ec934mr45669385e9.3.1794069524438;
        Sat, 07 Nov 2026 08:38:44 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:43 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:06 +0100
Subject: [PATCH 2/6] firmware: raspberrypi: Fix indentation of return
 statement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v1-2-707362c710cd@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=acy165BVhCPBqoiZ1D61v2aa3PiKHUPL5mFy64dozN8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRJ+hcoxMm9BhTxucZQP53Xv5VytmSL0vNR
 hM/yQen/7qJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z+skD/0evTjnpLdC96W71Q/PNrO339gm0MFuRgF02GlQBQ1sfxxU+ep9Q1Wmq1TFJJC8VtiieS6
 PvExpy4gG3PFk91VME6RUSbKwUoGrvUKZXI+1BjorOI35X2XsDNkwlPFKYMiMDA9gUzSTNq3l3f
 pTLfAEvv9LvMZSSYrAhD3SLi3TngfDa0jRrfESyvG8m4OaojrPzin0e69eMO2ZA4bJGCrV/uxjj
 5C6Dihi7vGGulA1kWpE/m4yLS/UmWzVgsWQJoNQ6UmMUaWUMJ8oRF8A/4jRcMsR4tgHjU3Q5e/y
 yKe/IdWH7NHJleZdGz5mW5aBZ19n1LsuiA4POPq4lzQuu438OW4xqI4Y8TIK1aspA4Dq0HnupCD
 Q2o6Hpre2DhGx7mK8jFtCmQeFuAJeQcLFYYvVkFyzSAKfmY9B/Z3aePINqrl3XsfG0g1cURdw0P
 iHXGWQYWVR72pFeCWbn0FbkKUyh375LSIhzvR+/hXWxSMvKQ807tNii3PsNMGdjbgAQDp+MG+5m
 1XuHibsEncJulXJftasJyW2q3gHcJFuX2DmOotrPXHdAV2j+4F6v9okIxFBZW/eOVRzI0s1Lxhh
 9gi6cqqI53+mLSmKuIFiUNdYbKQEL/sbng3PzfgK50JJ+7LX1EOlK10wRVaX/PzmJZjN7WsTk/Z
 ilmmgAkdR8c4qhQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

The return was over-indented; statements should start on a tab stop.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 8f3653c4a669..e0c91719b4d0 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -267,7 +267,7 @@ unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int
 		 * assume the maximum clock rate is absolute maximum we can
 		 * store over our type.
 		 */
-		 return UINT_MAX;
+		return UINT_MAX;
 
 	return le32_to_cpu(msg.rate);
 }

-- 
2.56.0

