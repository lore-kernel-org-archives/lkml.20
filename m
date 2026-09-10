Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F0D48EC96
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045298; cv=none; b=nyh/JPWTbucflmGv8lJnJ36AQEKnOB1FfRvXRewDUpzo+fH2pWErZdM8smYt0F3gc55aV0oQo14Lp+VJc+EUHQvKt1sXNZlvokxaDIp7bc5JCrrJ7K+XDpsVX3Ux+gMOUCVs9st8TymRHs/iVhbZ1pPDCtbpaOhEnUKcgb3PiII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045298; c=relaxed/simple;
	bh=BresRinsDjLU7I8KbFnNfeg2un9NXgFjbMY4oSk9178=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvNZdN6gHIefqmnJKn2LT1F9mg7TdxZTk3bdBuL0ClaZG44KGpXGMsGz4XgjlIjHRb4ir20PWYTUWptYPuu7Yq81cL5mqFqTN7ajgaKX90DnXP/0vd4eBaTDu/tAbRKPLAYC/+aB1dRUTAs1BKkMLKWFsxemIg7QzOlGSIPsjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V97PFYxE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFVwVzJY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V97PFYxE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFVwVzJY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7k9K1242016
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QaTek2Onfxdx39SUxr29UbGVlfItIqvvpD+sFEVufXI=; b=V97PFYxEKxj6ZhxF
	TBiIuFDJZl7WlCReqGQXXYA4oUoOLZnYRg7zejNzW/+sUD/Cvr0enXMqWo1WXe3p
	r63elQSI+NOympo564Om9QI5QyBFMz+w+jYsW7/FQmmtbQjH3GmKBhS6WIQ/LX9T
	05/g/g62Xupzc4VkRKw4E9VUlaK+sbC0AP4d9sehl/tNmnK7V+VOAlrejqcXLLGN
	VkQv0FrxUou9e1mmzlHREYaV+j6uSXRkxatiKNMN7HlR7wN5jjZ2RN3GxPd5CgtJ
	AatbE12bm1FG0JHsdmeI/2cYFUwC75caNK0gAYW/jvZCltqqPpFlJeKUNXNZ+OYf
	8HOUoA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjs7dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79013d05471so363210137.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045295; x=1789650095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaTek2Onfxdx39SUxr29UbGVlfItIqvvpD+sFEVufXI=;
        b=SFVwVzJYq0flZE4jFi5g7Qb4H/986d4rzI+7W/gGHLA3lAm83Xtnn2JmQ+nmXbtKVh
         vdpSppKzB3l3r/4kHpS6qb/cyRiuveiGP7wIhiOVL4UY5+hZNwmEsQgQtEosksEDFwo7
         eruOD7r7JswHQvPwAQnzZaziW+4TomQ6EGcnHquzHF+boHb0kstokaBN165+/Z7f80y3
         eh+rOWy0yuVBVZL5z3ab1U8dj+lbLI7CGj6FEVbDepZXnRso9BB9ZqfnX47NP3oD2hOx
         MF1oaxPtrcA2ay+W6TRfP98ejlTmpTj2+S9YYq4Lg/1cqfsATeutR6SsxLCj+7jAWG46
         ReNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045295; x=1789650095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QaTek2Onfxdx39SUxr29UbGVlfItIqvvpD+sFEVufXI=;
        b=KXJBZIOAC9SSM+rFT5AIUxtvsitWU35D9cedXgNH6MSmRbDP/2Y/LXJS6unxku7UGv
         Z249KReVJmO/rTLoX6zIb6XxJEo1r+JVorNSh9/98SG5A/OYXer/LKDgHCVTF3XzUSCk
         sAiLCdyLZWsb/cfXI6sp59xEHSj81SAvKJanuO+KkE7u5VYqZb1cWmszHFLsYfCe3TyG
         QaUv9QoVrs2x2JoQhWqiE4fPRer6zPil64ZwYL35vcg7RYM5uibfhTEAVHgwesSTDxRd
         nHc/FBqC/RvUEF4Aj+2W42/5frwZorkGGjImBJmPXgnDw8yEE2/t4UOohGRIzlQr1f7x
         3mNg==
X-Forwarded-Encrypted: i=1; AKwUvByreU7Eh8MJtvImVxoujxzuVtRDeZrb8jdI1wA0ibfZAfzJdEGpHT2HIq8rSqxPZeHWAhABoRDsiGpNNFk=@vger.kernel.org
X-Gm-Message-State: AFuF++nNqEaD1qliMCQDgmhKJNk9pqP0nAI/8t9JgSGp+zBBwXYSGWyy
	qTsgorZlZNZwBYHgdA5gR8jCm0TsOp81KqqGjnPWwZzsfvtuo2M1VP49haF1ROI+nIlcxndtRqT
	WDwZcHimAQCatGUVlnKWsxgmMdK+nZNBuNr/IhNIgg5HCoREfwXuxQinoFqORI3Lgjh4=
X-Gm-Gg: AYBFou0w/bu5KpT3GlNp9CyZDzhlzmFU2y4ivnZRbzK5SJ+461M76+X38O8QIs0joAE
	QrofZ5zukfIG2+wnhpm0ksEagT4e+9VNya3d0GjMzqT2DzBUoQ3ap8sJRzH5s9xEIaPP7vYFmXj
	ngpEbfdj6iJ8mAVwtyCJkPOt4VvKwkr1h/8yEFFbzluwvuRjv6xfgRzHE+U4K83Scx08IEJCIpm
	nZqtxC67eNzTlvU9rfQIHoDlDN0z+rHGrfXEY9TJiY53jv+7TF5J+5U4OMowAGc5xldpESDjGlB
	IrfVasumBnwcDGJ02hfMnMSY2Zw8XKVXHhwItgn52+BoPCAcnVDDGesB0oD5OHXYJO/QzcIRchi
	5DQ8JUdgpv+crhK0WTLIw5FJdTbeP
X-Received: by 2002:a05:6102:e08:b0:789:100e:3d1b with SMTP id ada2fe7eead31-78f70e265acmr4187696137.0.1789045295573;
        Thu, 10 Sep 2026 06:01:35 -0700 (PDT)
X-Received: by 2002:a05:6102:e08:b0:789:100e:3d1b with SMTP id ada2fe7eead31-78f70e265acmr4187645137.0.1789045295027;
        Thu, 10 Sep 2026 06:01:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:50 +0200
Subject: [PATCH v7 09/12] crypto: qce - remove the BROKEN label
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-9-cdbd2718af14@oss.qualcomm.com>
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
In-Reply-To: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BresRinsDjLU7I8KbFnNfeg2un9NXgFjbMY4oSk9178=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoSw1zAVU0Ymhsj/oLmPX2Tqm9nj03vEbH+x
 E0E+2e+i1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqEgAKCRAFnS7L/zaE
 w5QUD/4nPFFJn8rB+N4iV2FEfnliZc9W5qwW0KgaNwSEMeAmJnO4aUdqU42tR3YLXFrE7N3yWvi
 MfVZWprgceNoYtNxA/fSStmocMDGmD8SvhBgbw94ag5uhcAmu/IAg5ev6VTLyiGzN/Fks3Q8cYc
 jJwYX7tDOrBFYsIi0RlXHZfAQvkIgCCMnfKdWmHaJ0F5J8em6x+DMp2Dis8pqpjUCNCCrS563sz
 PaIOMO/NX10m2VOw/biB7uEPSSf4NIrA5r2smwm7g9xoiU6zCXtIqgT1rc8bj7lJLPDiTdZCgm0
 RKbSB9mFEP/K67rU9NwTLLdUPAYUYfhSxVxs++Ss6Vs49KHoeScZZse2fjq9ZDXL8irvwXU+EAu
 BFUb+s0akyKaJ/GVkGO2TJc2OoH3Rfmi8tY++3FmEbK73QyQNVSG7+GgQRLCiIPLf+B/Hp2jhbf
 0/G3gI1M2DV2amI3DcdFo/PP1bYYMIdVzngGE6+zGr/fpJayrfz6Q8jDf9tpOfES3hRcbTNFr05
 Fmb+CsgD13D67I8XZO8zMJ5gsvNgGt0Rs+Pki+VB5lvmmr0bwzXW64eSjIW9O/7UbejhJf2Lgm2
 IItUmBbEH5UT2HhXyabC8Nho18PJIUXU/Sxi2QYhspU4Sgh4o5xld9mszudQcwu1AiW6fL4kyVT
 1Ct+ijsjfIEcrDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX1zveCkr9oL42
 mlXpXe5FfXJ3rNC59K7V6a8kO4e4FpKHyc1u3lS8ZxCVxKRHeRYFP53XV8h6Bp7xMNaWgJooIGz
 Q3XV0bya4PRImEu5M9es+/UhrTAli9g=
X-Proofpoint-GUID: bhbkpFhHP4cjZojXzlTe6sXv8RtNt2hH
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2aa30 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0MPpsrD0zQiP_6dgn8YA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfXxmhmBjwyW58X
 PgL3zV1JjS061KBuSMX5+8eIAxlhTlp8PtzN+vKMREphYqAOoRqi2ZYdy7DzTCKr5RQi9kXRL6o
 nfinzLdv8i/g/KDZdJLVE0NS7cklz6ztWqZ6y7UpAguu7Tv+tJ6lF8kmFCoYvIVwVXAcng7GAAf
 dm+Dr9mRRk+Z+Souj0iufVX6L06rYc43V2alaBNdN9JlryZyWBY9uuJxFHuwezZLqdiJmJJ1e56
 hYHxiXaKGcufdt0ioJPZ8tkjuOk+xQhyZvgP9Fam49AAvDTxUpI0sPZbJB8x0FRZXZAu1HGDZOI
 NsBkVk1pYa030rkAtZq6PUYVbU56BGZ6MOZ1oO+sAdfqpMdmtyx66IMCz1wMRxTxIbrNwe4KkmW
 KXl0Hx8vVm4r8gG2lx/mCiPZPWy7jeOpZdla6asYdf4qCcx/Jg2neFGtN2PZ9HNzImRokipA9R/
 U9w0FiijjCQnBCDZcIg==
X-Proofpoint-ORIG-GUID: bhbkpFhHP4cjZojXzlTe6sXv8RtNt2hH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100156

All self-tests now pass. Remove the BROKEN label from the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..9f6aa82301a5101d57b3651c9b2ba33213e41d3c 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -528,7 +528,7 @@ source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
 	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This driver supports Qualcomm crypto engine accelerator

-- 
2.47.3

