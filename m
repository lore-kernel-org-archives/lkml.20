Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864477;
	b=TqN2lulIt2WWi545WIAeYWFzDTVBdf+ymP9MzQBsxtJtRH2vEIrCqXielXOJGhMcTAek
	 roH75usEPZQ52pLR0V2CxcsgDDmdIrTNxApBGEnMzPS2xhBnjwOWMNZvMJcZxOGLyU+lC
	 +bjrwotGJ/GU9Rf/gPo/rDMRPnK+TN2aDp/nteCfcWrNgzE8WFZiuMhABNwmfNpb5ceRe
	 BT3gdFhbQcocofo52gM4NhQdSqFXMY7rtCv9shBWfLOFyyDlnwq0NjV3B4iC5k+hZu4tk
	 A0NVZ4TRkOntx3uODGICerpO2LGAkyeSYYe4OkojrLsTFQiT7m008XeVMVLrcp54neQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
	b=v7TJejWqmt+EbBvYkdYesh7O6V55mYeWAYEW1ww82HXNW8NG+oJ9bjTA44exjrIFrTM4
	 NcOXM/VU628C9iHwVQYpo/K+S0oAfwevulRQCjZ6AfJ2J350PK+bzHiAnSrWxx4S0xaUL
	 IJC8jxX77x67CHnco/9Gi2S6hrwPfmVARdzo9CvCp2Dw4R9ZqUMb/4DKGMmFPtDjt5+1a
	 KcrU9x6DqsAK5lS3lhAOSh6cFilviPXr5LerCeI8btHCWkrAn/1dzjPIeb9b0+8aMnD/T
	 Xa1GSXGzHY3sfALnHBSbWbBDpJMpnyw1L49KxLnlsI8LCqJwmkFpGnjTK7m664X6NVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpD0dIS;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FA606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6FA606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpD0dIS
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso194000f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864476; x=1795469276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=FPpD0dISyKSAsA/OfXo9aET02c5v7IUiKwrzM7OGBDFvjMvTZoNbDoYV4Ex3Y3uYhp
         Y6vCQ7xir6up1dfUVLJ23VAaalNZ4uISwqpeaXPNkJgGz301zcyyvNP+hYTj/McltQK2
         nHoILFZ40kLf7wxINR1Pp7egTSiFzWLEp0yKng4RRniW+DeMhQ4V0omBbBAyczu0GDB0
         pjCabrcA7S423UTuSJS/0gDXZklx8OB2tDXAufmuhZv6NgJh9UmOymUt4fRkyObYF2WD
         JPvPmLCEPG7sKQ2EBmwHpk+O5gd+zkO28V1bvTe+aAAB0Uos9QSDOxduGncYaIIXzqk2
         6qEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864476; x=1795469276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=LMDFCsf0I29YaNhqEWCfGWys+QbFYhd5JMjGEpCB7x8znSYqV4focxFvQLO8D7NOb0
         BI9rjtACeWK7c8WItp4MsYWXzIuWPtIrtWXDCrzj/xmZ4rkxmk0puOEqHDj+kcii3aiv
         316cWSUbTzQ3Izal0VtXDBTHdqwARngi58V/UpSCmz6/FTfLv54Pt7h+sMatxRPiDFLV
         nOfgPtuXgu9fvzEvdS07KslRVO84cRUFd+ISwzpKtmV3TuCXlMFTRKwQFsjf3FXl3bH9
         HK0j+1a19OILIiCGT9zZUMnhFh9JJDu7iYyUN473qV6M+n/+5VAiQhSYkZIM7C4w64Wk
         ebpw==
X-Forwarded-Encrypted: i=1; AL+hErGaVlszPTUuZmupdw4weF/LiP/x38MAx9aNMvoS8Z0ooa3N3ORHLmSeiRCjd5D3iuD2jgGlwDRvYqppTww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o6UFwCCpIuIi6b7WrpEppk+S31OyZOEIWfcuPt7orYnh+46dt
	mzqw88FZjsWspyT6ONSJLs6/5Lsr+N2hH6WGGNvXUXHWeselrWCM0ypA
X-Gm-Gg: AZFdTZdjNpbUvlY7+WMgEP6IMZNQLVgHYY7LPDpl3dLYx4KsQSYdRacaDvFvxqLskaM
	bc4u/jjI4Kj+yE+S/WL4K+aBGr3r0t0/ynx69RmsMnyiH1gewU6X0M4gT65HwjmU8zXGO6MxS+f
	PssSwdGHtnuR8Hr3pEAzG6s60NVAJF0FsKVmG1BKptPPj6IBDrHWPvyY3xPGQ99WTqdzGWncJ6M
	+UdwtcCt7oIML8z2q6XlDzr8m6X6Oj7qdX19JDAh1isc9hw1Ij2okeJWSIfS11WxtBr1rt31fOm
	ZvN0M72aON/kkiRtLirU9AgUTo7IG5K3IKR079beaLkDJJ4H3Rv/1635FMXRDtaVhnCYP/ClBpX
	CcMcE5kqTEkb2bNx8/wBPRbPbM2pnYRwm061riCXgQT8Kq8HQ1P6DahZTiH9GHBDY3GGNh6Y9xe
	AtIs0D8fPdcuhTquuPjFA9B+JHf/C8qtdXsRcws96QXlAJsvsBWGwrp/RDmWWfL2QVf//Tk8xLx
	HehOJw3WSKJJ6CXKU5Rp323rwNaAfRwn6pe5iC0yKlfIJoeFZxdBoLBdGCZD7/E9zHXltlKS+1s
	bklSl9iB4EHxNYSPD2lAynbu/i9lGHO4C0X96EI07y626nxN0eNwePGvAnguRA==
X-Received: by 2002:a05:6000:4706:b0:49d:8ce1:2652 with SMTP id ffacd0b85a97d-4a36bd51c5dmr1648244f8f.1.1794864475624;
        Mon, 16 Nov 2026 13:27:55 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:54 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:29 +0000
Subject: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for
 SXR2250P
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
Message-Id: <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=746;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wp4yEFlEeRirWebvDUNwJG87yvgwIo0fuTVgUjPIFVg=;
 b=c3M0oozAyWICul1zqZyYV4A722e/xl51QI136kZKSBBz/N4l9sptO65yuOtgNCZsSpOrbqAMq
 sRMLJj/ahy6AipZ7ofcwU1aakgIIwxaL8YroDdkKta3ZC/C45UuYvvM
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 135297027580..cbcab632e01c 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0

