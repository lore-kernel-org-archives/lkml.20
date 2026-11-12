Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489627;
	b=OjiO2zotLoTaOxlSS36xCmJbZO3/Y00gEGCb+i/mbkja4CIdUcPSe4r8jj8JUR17H365
	 YLoUd4XRvodJoJVqY5szlwP+NFUzB1xC0Y7o2pEl129CaBoi4lMOwat3+CfJgF49+FY2q
	 fZ+mUGsJ2wTd7hmJH16GCkT2CRZGpOgc/71L6978tfXLLG/dWD0DGBpNx329/3YAs7fdC
	 6ASfDpb92EOldAWyk5esN7SSV7rJ1EzenNpTyXp10K9c1hV9Be5trpN0j26lju2+aW07c
	 0KKkqeadEXvpaG94IGZkAKSlsDNpdPchXz7mQKGMmior/nAtLTlEUm4I4i9gF4VwoSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aLXIU9/c/oBQdx9HwSD56FRLf9Mqallr//0FEe+4FgQ=;
	b=L7pQWa8qIn3Kz2UX2mKl9zBv6fb6dy2i6xgUu/77GR2a6oPJturpNMrsojl+2dNCyTcD
	 5cjwh22TuwF9C7ERrs4qay8u40wKpfRzrt91YW1zvucQUdaMNTvUZoGlJo8egxzn2SM9Q
	 bnvgjDCgQWZ4wzgGjM5z90BrGZciHSFA5cj3hd5S6ain+o6ubayuZzh1t/g1SQMV9HiHB
	 hPEkbbfGavhU8YdhmhgCUzAAumYp/3mHBudLXKXQsfsu/dolGjBeOSgU6kSsTNMJ2CPDK
	 L4mmbg2fKIBO39YCMxmcaqj1MKRDq6yQXhKJLwcYaKJJPtRSoV9cNs69eK0QghwwHaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cq+VVxjm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSY60v2v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E173C606A891
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E173C606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cq+VVxjm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSY60v2v
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAV6DR1630589
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLXIU9/c/oBQdx9HwSD56FRLf9Mqallr//0FEe+4FgQ=; b=cq+VVxjmNqDwCS8N
	0shV36yL0oqsUY1jBiqYY8XLJlD9qWtMecXDbCojpT8AYp0Q7UJOB59ShSZnj0qm
	lIJThHMTa9e2fDKtr+qbjKeSZrJh0xhbxaqbOP5jt/6UdPjMTQL8Q5KjQRsv95kr
	LQytuAq7LAeN1ccit4dXv9L2WwFC/5jQjlm9aI2QGBvYc94YH+wfmAIxtqM70j2S
	i+vWh4eDE9p+jZ4krzwRwwR8cVPV4bkvbZzNCwvqmHI1HYZ+3jocTftreeCxoOdI
	SrkeVJp0e4fKzZidafBd//1VuAE11cWkcHLVZn8rk8ObSfZyFsheHQwBV302wXkx
	hYkAFA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs00hya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:20:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c6c1e082bso14926586d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489625; x=1795094425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLXIU9/c/oBQdx9HwSD56FRLf9Mqallr//0FEe+4FgQ=;
        b=JSY60v2vACW8GeKoNxl0fjJznGpaajRqF8IBXBAi0rZ2cHsrMbvXhXISVwiNtdkHBg
         NxEcEgnQzzlT89QJMiFTdpDaTo4hvR8THdd1P5iXBKfcaUJqR8rNWECY8ryMUMopIdTj
         lp6yiut2VVGEBJNrTbR7XEj03TQnZvH6Yt3+Pt/x4uITDAEthXc+LEgSW8qlPTlQUiN7
         fEI8WtCkMvQEenI7iUx3zjSUSmzVyocaCdBJGlvbMJOvokRAqiJrWD1PaAZagY6W6EGy
         11diGqaZpFOh0i1IeHDe6rLMS4gUpgiT6OcNYS4Kx6p5HUlvqt1efzI/s/RK50n/n9Wx
         OrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489625; x=1795094425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLXIU9/c/oBQdx9HwSD56FRLf9Mqallr//0FEe+4FgQ=;
        b=MobsQGQ8otjSG+ij0OMah9s1VtGK9lz976AYL5G/W3ESQcj0l4JxNPnIJGlI+dGrMu
         P9L+AYTW76S1HEqBy1zVvT7B/cVm24FmpWbQ9pFtoGBGhNHpwfTaJdWaR33Bv82zINp2
         C5J8Lq1hgwV4SwYU+oDyO0iZG9Tfqks16s7/AP6hTIW20Lmvb9/WxmTGdXrTpaKIVUur
         FhYMZC1sATT8jVYaDSHVcAzPaUiszUgH3Pp1hAWIxlH2v9quve/99/iXawwW5a/qqAge
         mfrjmenx+qjllK7eDeEqSBODFefc7rgFUkNtCvrxq1QnCjzSYGuIRTZYbOMEKaGltv0M
         UWzg==
X-Forwarded-Encrypted: i=1; AL+hErHvR+MdvVOw2iIplEb/1iut0L/TkwNLNAS/sDvb8U4c545lICMm2s3cZc85XJ7HMON3r88ZOT54Sc+GS34=@vger.kernel.org
X-Gm-Message-State: APuU4Z83WoY3FHV6DcPOPZ3n01lcnuYb8jXhLTLLUdGhqeRtsKU4j3f0
	mm0zfNTRl5LTd6aRNUhKOPc04IxkbYauEeRPEkOUcVPNxLr1zKTKCvGAC2cc6R/TP6eteB3tLXe
	yy/zfK8dcmuYkAYsiorb8Vo8StEgqTApq1VfmYffSXJ9dnew7RHeqZC0a2UVECZXVmGM=
X-Gm-Gg: AYBFou3aOgYeSnTht7/9OTJQp4wi8/mKBTjGqqW3NgUCKoDH81CUAK33ekDX3KvfySh
	SN1W3asZfzIf/bMng08DvnqQfdVEv20DRn4aivWBnCmZmNi6fyoXsMZyV561otZE3qQFrICxb0z
	RArt6PS2Gh+g99xlfPwMl+sLUsJE16wPSdBRCTFCVbzaXmQpSkvmLHeMs2zj1atLAMSofo1dzUI
	y9jkOPzst91ngEEbC2R8C44vTdXI/LQ+G9J05iHwQLAnScoOSaQAOQ6yDq3vnfWXGFO3Jr+W3T1
	V0iolzoG/vqsaCzn+LXrNX+nWyj/84zdeF8mZqdKtRa5zxH+/UElh1Km8z8J2gsZZmrU+HG2ilu
	Ye2A2iugxCOYHPXBn2uwX52vfqcwSezJoN2V0RhFJ1oHKtV7GlSNiFn4QL97qEM6YgsqxKtlNgw
	CYqcwV/XKIWHoA/ItfEstqK3MNHx23aC9iI5AOZj62FI6AkUTkXw2bsOdgrOd6O8c=
X-Received: by 2002:a05:620a:462a:b0:943:7e61:fd9f with SMTP id af79cd13be357-94932c86d83mr416870185a.1.1794489624826;
        Thu, 12 Nov 2026 05:20:24 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:943:7e61:fd9f with SMTP id af79cd13be357-94932c86d83mr416864585a.1.1794489624286;
        Thu, 12 Nov 2026 05:20:24 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm16744366f8f.55.2026.11.12.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:20:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:20:09 +0100
Subject: [PATCH v12 2/2] Revert "crypto: qce - Mark QCE as BROKEN"
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
Message-Id: <20261112-qce-fixes-broken-label-v12-2-7b5b9c7083ed@oss.qualcomm.com>
References: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dTP2OM2+e7NKLkzDC+WPH7nchMkBUgJbaO93VdjhD00=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9b0JmKrLP1AJ2kIffNsCs6yXcbF3sDHO5XOJt
 pSy15D8HFWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavW9CQAKCRAFnS7L/zaE
 w60cEAC0uUWQ5kQkPUz/Ov8Wb/2Uo7f8VDeC8/hyj8H74tQPEGSHz1t3J5Q/h/kULT1nCR2v6iZ
 gJS9rXcxB8PjxG8mMBw9rUL+Ku/xH1MkLKL/uAO1A0uSHePF6PJSEEVFcp9RSzBII5xBLf7ZdvH
 muzp5QSQlHCxld2wgcS0qVs35c3t1I0S7+XMWOCEVHhZXoOZJD5cHGxucvWG5uYbmwVv5u292D0
 GFngX+HJLzBkhEid1F5PAAiIaVmtpkWRoQU3ZhzwquVVl2W6MHXr/dZpl0ZwqAPFdugmqkKrvAG
 CZz8D9eRa3u3uIgzR7hqHPp8SWnoFuH0kcmo7vxjH4JkJpy6bxjzx+4UzlOVPCnWAZ7mbEbGjR2
 PmUQUlwIavhHTw3XGqP12z9CX29PXc8eDC6R+o/NkiIdHDcHwS5Gwt1AbjR6HWwVzvvLPOf+vwP
 QFR1RKdi776UsDGRL95ZcaUxXDUBMv23lKrYBq96e1mo4CqvabzajBVEOYQpEZyvNQrqcVFNRS8
 0N89wIzwPwXk/fDrVQiS3JBm9wrdWBOPOmVwaI85AWcPV91Xx2M4pFByD+Z9KiwJlVkhXPj8tBf
 Epn2/S6Qz7dH7foF2uf3zen9Lvr+KMy8i4PKm5FAUnR3Fm5M4mvH8s/Zps2eIe37Xsl31G19r2X
 W6xcBoqprEW9ixA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX41+kTf6OJ4UJ
 O5kkcP7pyaYUTQp3bVLET1UC9Tiafcwjsc4gpMegDf1mMJmOQ8DygI8Q72NcfJHdiqTMGJw4h+a
 3+1pvW9f9dawo+Z4Zjsw79wFrjCTWu8yijf9Ht8PMvyWcVAgFRheOsIf0TWzF6dBhhx3xKwAAy1
 4TEn3F0gf5tygnJvcKaJwHlRwp5CLJHW1CrgQNwOmzTJJ/otUae5XjcQZZRlh2HRYfRdf1FiBTS
 0Nl5JPm3aZ18t2DarO8jCfZTNAgn+PNa6G/QNy/F0MoJB8KEs2S2KEKzJqR3y2gb9M36b2GWmc0
 0xoU3FOWR4jbbpTiO3E9aXej2ctIHflzzjKTMV/pvWxw32oe5Q4o40OXHPoM6AaZDusydQQ6bl3
 WxKNZXvSbXlWIXt5JQipITdKVs5kUN7fRvqIOy7/x51fX/BJwklrOvbkEmrTSg9elkJDp0X+wKE
 RlnpXsPvr8NshOP6wzA==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5bd19 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX+a3le2NhVOFK
 eG3EQRsio7UJLJbXYXiwpIIcm4A7VGFrePSNif89UFzt2Cn/AnA0M3V6VwtFx2yAZ7PS0KsaEsF
 zWNQYuk0RzRnG5RzGGVPiIr18wS4IZY=
X-Proofpoint-GUID: qVxF2Xdv8MiiBI4lCVNOWjOO97zrvnl1
X-Proofpoint-ORIG-GUID: qVxF2Xdv8MiiBI4lCVNOWjOO97zrvnl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120053

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label so revert commit df373d39c6f0
("crypto: qce - Mark QCE as BROKEN").

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Cc: stable@vger.kernel.org
Fixes: df373d39c6f0 ("crypto: qce - Mark QCE as BROKEN")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 93144bc1474d9824e16a0801f7a1246746700227..fee64572027ece8a07524db7bcef5a4ccda71339 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1305,6 +1305,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 898f4f1d595203fa61b2a99473b6ea06ba7abe58..f9179bba64de773886d20cee388293cf9f538ab0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1800,6 +1800,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..adcbe15851899917fb3039efe89a77c8fe712bf1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -527,17 +527,21 @@ source "drivers/crypto/marvell/Kconfig"
 source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
-	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	tristate "Qualcomm crypto engine offloader"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This driver supports Qualcomm crypto engine accelerator
-	  hardware. To compile this driver as a module, choose M here. The
-	  module will be called qcrypto.
-
-	  This driver does not have exclusive access to the
-	  hardware, causing races with the secure world.  It
-	  is also slower than the CPU.
+	  This driver supports Qualcomm crypto engine offloader hardware. To
+	  compile this driver as a module, choose M here. The module will be
+	  called qcrypto.
+
+	  NOTE: With qcrypto.do_register_algos module parameter set to true,
+	  this driver does not have exclusive access to the hardware, and may
+	  cause races with the secure world. It is also *slower* than the
+	  CPU for the same algorithms. By default it will not register crypto
+	  algorithms and only scale down the interconnect bandwidth and disable
+	  the relevant clocks. Use qcrypto.do_register_algos=1 at your own
+	  risk!
 
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool

-- 
2.47.3

