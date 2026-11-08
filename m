Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171317;
	b=xAD/z4vI4f9RcMwOqyDbuJ4ugqM+aTweL+ab+Iw/9P0q6RnYiIzAuqw2cyAgS1H7nGye
	 Sj25NCMZI1IVX9DmqqdOo0xHPXmI0dhAAaIgUXgECgVX9N6tLUhtF9ShA4o7T0gWMi2Oo
	 EH2gn2oYCLX2Ph93NX9B94hmPzhwPlmEh1N6Ow/AGMF+2N7PzsrvyX90Y8DuSuUOZ49r2
	 4gCAOwb9A/+TiagU6QoCeb3UNoaLPoMs7XwpeStAgCEeicGZwfaOX96KyAqFKj5vSCooE
	 C3Zwc9eaYJeAZM1pmWAGqGyLIoNuHWmcGUFXEfQ4v2H113Su6aBJVuiJLxyXLGrN3Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=K8i6P0KFfzK6HjaSVdFTUucMIIRoYWICC8FPLMcToIg=;
	b=mMgWqz+8O4ZYAcIhBoLAq9RpTAsYoQyIylXVc/jMHpiBO1cMc9pSMDi955F9uDlmP9ft
	 494Fd2TfcdpJOkRft5OUJG6UIiEQoOm7QTydWJhp1u+8FgQJ73Y/VMiGBnQVJYxN+tFVx
	 RKrQM2n/q92hgEhL01o/4idhfEvlYquCCxlDWs58y1Jmix7p6LdJiGpgf39TnWEv8IMW2
	 z8hpuFbsVfgXikjDklLOp6ywWUgSbkcDxkgJHMllRE5/lzA3kUZcyttpfnzN6hseonXd3
	 bg9k0lDa/oiHEao5fjvAEKLtFQg797Dkv0NLg/rIfeO6nMfZTuMKVB6W9q0olSTsQxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whNDWi9P;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6AC606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whNDWi9P
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-705cb6cedd5so198379eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171316; x=1794776116; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K8i6P0KFfzK6HjaSVdFTUucMIIRoYWICC8FPLMcToIg=;
        b=whNDWi9P/wMPpOxbhJWbE+G1PIf+SUj073zHhzveLYuBL+gXp63KNki+nk2O+WS9F/
         7ZdHvZRem+eR98OQDvIl/4+Aq65lTCdN4EkYsn6wxZm0jIUzSC+ya3XbeOnTEO6rOGX0
         y9ubIOVn3LycZBFFKjRLMnZU5XqchVLC3+IlnZcxYhXqbIhuekH+76qQ0ZWErG1Xlbjp
         vUaIepV/CRGUZWHwGpdHljjcVNAjUXYMKseS6UQ5DeZKGe0wK0aj9XSJWB4viZIZHjGn
         DXxH9hCm0eZPzha2SX/hRzArUu5UH+XfqR+6f9oVaM/2TTadoOZtf3T5D8812BySsc3c
         dtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171316; x=1794776116;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K8i6P0KFfzK6HjaSVdFTUucMIIRoYWICC8FPLMcToIg=;
        b=pM1o61sPWdCTmznTNFmJ89teaBYGWXV9W6lndvaD2ld4bKvsXMax/aldTE5RePdpUT
         k57vGoZsxTyIhgfmCi0D+wKsgm+6CwOV2tvVvb1YxPZ11uM0pRbsqY6iROAeLvVonsUj
         VufdRYQRIw/DI3zsk0XPMGGBnffr+DuZo81AjT6FEkQwNEcqkk7okGeC3TjLc+Z92dOx
         gZ8becBkPynnQWnpGFhvSwkw6AdCjuWAtLp7WMAWa+10byVeQ61VW7wsbEf1lPUsDTlK
         HOQ/Lv9G3RojtunTevadcWJz2Gn3sDycc09P36820QqF/3eQNXNN4eFRYxklwzC+Z0tP
         T/5w==
X-Forwarded-Encrypted: i=1; AL+hErG4SKTxNlZyFtZ9mYY3ko1D/ViRuG16zwD1fMLUod6iR8q4GduHrKXgTf+PuYjLddX4fHqXvBaU/q7iu1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QqAKZ/egFZ4MrVwGZNlt+sqgdoMRcOOFEd8boJ/D0RnGEqYsF
	NTWS+xBz6He9CKKON7Sdg71mhZyd9WK/f/9d1qJJut35XyIBvQImG9Lo
X-Gm-Gg: AYBFou12E2ymF07RMskvGW/mLK1lpdH5yzyG0f7FKqdTA0+1hk7/ZyXN8sFzBdJO9EE
	FBfmbmuJ5Kdc3USC30gJO3Sa8yFcrqG6g9JFn3c/Gw69ktafGugl1jkwFXz0j6gOy5oAZRQ0Vd4
	ZldAWxID2G6vaMvvzRBX4hJU5CsQPCFd7Lse4gFNhw33tJrwdyopBx8Buvi2kppFR+IS1dSM/xM
	gj0Q76pLIpzoUaWFqzT1Oyj5V/nokKK+nT+afvIhUQ67bdd1AVLFvmIsLVQMsmrFVFK/vGmX+Cd
	xTO4V3fB5D+V159tXQ5RSHv2CPpjh/w/aJDwxX6zqEY5coKW42zSXXRKkhLa84vS8EBgI4os0Z0
	3FCqEYy6lSTr3VW4rewzyFdr5kU1/krRnvS2gXjzQicSeFblcmm2/jiaB22dd/TPPP6OEcO8YOE
	Lw/mgiJB9/qGEdMsPtevMmKpqQVLPkYmLvJe6jKFfHUJ5wxc9bjmNe+Q+0cbxXDfZh91NfwDw6d
	z1m2O/mBLh5JbHG0Z40PuFrDDqxHtugY6ykxnmz2+DRS+f0F5ZG69hPy60goeNegxt2BkC1ZAnK
	uzBGTVvwpSZRoCX6ZRoqjJ7L0VTIHsPhPYsJgBz6yHK42+SDOxBLNlqGr4PuS0Fxl4zMPNPnISX
	HQImWJGhhH2L8rCzQo+g5tZElCCOYuJ9vOCGHEluSuvlH9BLWMXB8+q3b1OdR+dCHxvLNqAtfvO
	ylYiEOCUfaWp4bhL6bGslG/eFG34tyi/bO6H/QWG04uS8t0eQ7feal
X-Received: by 2002:a05:6820:3389:20b0:713:da3b:9530 with SMTP id 006d021491bc7-7170f2f0ffcmr657630eaf.44.1794171316382;
        Sun, 08 Nov 2026 12:55:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8b5825sm1917175eaf.5.2026.11.08.12.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:55:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 13:55:11 -0700
Subject: [PATCH] mtd: rawnand: au1550nd: fix the memory reservation check
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
Message-Id: <20261108-submit-au1550nd-resource-claim-v1-v1-1-8f4c694fdd39@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wrCMBBEf6Xss4vZSFvxV8SHXLZ2xaaSpKVQ+
 u8m+jJwhuHMDomjcIJbs0PkVZLMoQCdGnCjCU9G8YVBK90RqR7TYifJaBZqWxU8Rk7zEh2jexu
 ZcCXsqe30cL14rwiK5xN5kO33cX/8uUhe7HIV14U1idFGE9xYqyn7czChBG8ZjuMLnW8gEaUAA
 AA=
X-Change-ID: 20261107-submit-au1550nd-resource-claim-v1-71562f83dd01
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Artem Bityutskiy <dedekind1@gmail.com>, 
 Manuel Lauss <manuel.lauss@googlemail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Fourier <fourier.thomas@gmail.com>, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

request_mem_region() returns a non-NULL pointer on success. The inverted
check rejects a successful reservation without releasing it, and proceeds
to map the NAND registers when the reservation actually failed.

Reject a NULL result so probe proceeds only after claiming the resource.

Fixes: b67a1a02d463 ("MTD: nand: make au1550nd.c a platform_driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index f1e99197ab84..6796afe9cd29 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -276,7 +276,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto out1;
 	}
-	if (request_mem_region(r->start, resource_size(r), "au1550-nand")) {
+	if (!request_mem_region(r->start, resource_size(r), "au1550-nand")) {
 		dev_err(&pdev->dev, "cannot claim NAND memory area\n");
 		ret = -ENOMEM;
 		goto out1;

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-au1550nd-resource-claim-v1-71562f83dd01

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

