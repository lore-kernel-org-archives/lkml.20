Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172603;
	b=CjvCLBgMr1/LWpBPoWhfmHH1cAPqVA+Nw2bbt6759b/Um79OzbImJRkoUS3zptGHhyeq
	 l09GJU0ViSp9XR7u8U7jrtcsHu/Q3UciQmOWf6HlSV6wM6iPGAHFc9d5jegKEZc+msvVm
	 CTpiis/jaaJR9k9DxJ9LuZmGxiEHLnfEFWGL54/WUP4PrI4paeGMie+EX2pZn1rKmADRa
	 MsuraW7+WUj4D+VanWsrHO9AkSnPCZA17v9lSCCUljdPcvw3v/4A+u9/4k5vyZw9Don6U
	 WmYdg6cbMzPrbWEE6f4irVaIkE/1U4BmwCi+YD2FpNET7pqGIeRTN5ezcH8Cek/Nn4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
	b=YDlUXw09r5Fz7Pn4FF9mwNwCp0Ci9Nmrg+w3saUFZLU12fGMl8wU3bqD4mK7bdmI1vjM
	 825g7RFgvhg08J58hos6JGFssgzYxR3pLDo48HedXTSECxADxgxhNMzI46VvVrA3klA2c
	 +6x4ArY33z9c32qLJHx24YqXA9e1NjWLxcae+x8tvzucfP44zCxG2Xam374pSk3GqGDKi
	 H2cd4X5x7FLg9ISzLBidKDOG4615sozOCKiqpsWM1mi2ilouGKYtiRSCUyZ2cNx5UPysF
	 5k6S01rIkqL7VHpxgvLlaQo0SYx/mlLj2awynKTgAB4ShfYlZTZbjAqELNYB8LQalew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bU7xrZPo;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E87B606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E87B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bU7xrZPo
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-716b58a4365so123923eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172602; x=1794777402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=bU7xrZPocRyvtLJVOnoXh6L/jjLyxq00tlIIGhOgVA3WaAKC17vTodxlJPAt9hWJZ/
         QP9aBjG4hZWizdAZeDa7k+KUpFxwyrU1AK+T5N8QOmmdUmUHBpjetaD50TVGG7UHhDIQ
         nj0f5khFkvExeVTERE8LJ9uYXwGNrn5zkPVcSVsVyTUoP4eVdmkc8GzyayxHDp++uFiG
         Bx7ypym1TmnccE9DhF7ZVSWQIauxUwOcWMZSNt0dC2+F/oqgrQqYCdYvAOel1AW12tSf
         AsXzOCWOmmQNOoc4cfL2RU7qZgmSfiI3JU/pD62B06cpMOCCFE79a62D92eBS4YLAoCf
         OUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172602; x=1794777402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=E2ME27gkRz7EUuhFncJu215QRGcth9SlwHNWZ/58uXH6u9HTC0NszBsgVcbKPql2jc
         CKYtB5+VSMZIxYEmDIrcMXGZAV4zhm2XWQ4tbwZ8vWg6YFOM998/ySD43eKZ7upGok9u
         ZF3BJ6zxZClbK+Bl3/DSoD2pdosIBUKM2KHbHDPhUo3V6irB4ZnzsR4FaKCSf9BeJ9t+
         BCEvlApGAWa6RSOwMFGTooFg0HNGJgXpokHQiceCAuXj21/o23JmjnA1OjGE9BPIg/gb
         0gVKzKI7OK40n+Wsy19JPGd0nNDYJJVVrOAH1d+ql3vodtCR+8o1NO+QJrtI8NUksswp
         1hnA==
X-Forwarded-Encrypted: i=1; AL+hErE3n3O6yjxyu9CcUiUk0rbGccU06mFRKm/1/gOTTvjfScmggnhGbVpvsiWuqwyT2ND0WcnD27ZUOcCZ8SE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2nPNGvqV4NWKdlLdW8u4EGGU8w1Q3Dba1zY/das2sYemMUnJI
	Y/mZNELfbAL8Qn9J8E9XIgEKFRY1i1GU02AxjzriTRUEs45SkI6FWpAI
X-Gm-Gg: AYBFou2yw9At93TRJvFK6MMKCRzvHkwRZpHqMtteiQYSR+9LdngnJ9nRFXc+wUx7kBD
	QakI91ibq58pvFiQZ1bUclOAinv7KjdjF9Gst4sXhUP4qqMRSXGsEMC4iFYJWC2XVw6gdn7Lf0B
	tL2l01vne4G+8ZFuAGKzrb+jsHVLIOMOgPF4Z0qxUNorwTQH4w8p9KooEy7+es0z8eWN6E5VUlc
	qAKW9tzYU8ZIQAZE1py5tvpp6rz3MeNVf4velUFun748NTRYQLBbMKynbUeqwrd/shw+1knso45
	4kNU5vylmbZksyeMfF3azVV/r2q6Di0u+oFoILLhKlz3+7dE83Bc37Ea5F1nUZCLvK3d0jUB1XA
	pDTFXaorw2fYLizVdWhpHEzaGgNzTrW4MRmKSah7fSqfpBAn5chd3AYro7KjOe4oVAOkq0Xmxct
	mYdGxzktGLJI88AXGZvA05jJQadFQJKYyFyurswypDlHVStUbKp/yh/RbaYCFXim0/IBLokeSSc
	SQfET2aTUGpPyQZhlWkkBfBOUrW3tKSsWf9+74XqfxDSA2k3/65xSqMYKFlhAHR8JOVd+IXRyXu
	x+caqfwJ5X6EnQigwybmJTIIojQ4yRxM1Gjh1BocVQDyRvpuQw87mJQbU2xLQH0W1XNeg41ibSw
	Yt6e4JkPLOKGJ3Myevym3S6aEejs+hPyZdRt+3wPNTLrKeG0nTi1JC07eqAMYscVFeRqctrTCPx
	BHY1bu0ivvWwTpDPFClAXADiTD23VTiiby5/uxtUJNn2xxCwyLqA8=
X-Received: by 2002:a05:6820:83c7:10b0:715:2787:e1e3 with SMTP id 006d021491bc7-7170f2b53f2mr823230eaf.14.1794172602221;
        Sun, 08 Nov 2026 13:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:16:35 -0700
Subject: [PATCH 1/3] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-1-509f30a9e14d@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

A boot-partition parsing error currently calls nand_cleanup() after the
MTD device has already been registered, leaving a published device backed
by freed chip resources. Registration can also invoke consumers before
the boot-partition layout is available.

Parse that layout after nand_scan() supplies the geometry but before
publishing the device. All failures then reach cleanup without leaving a
registered MTD behind.

Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 2d98f79b492d..f240d1effa04 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2052,16 +2052,16 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
-
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
 		if (ret)
 			goto err;
 	}
 
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:

-- 
2.53.0

