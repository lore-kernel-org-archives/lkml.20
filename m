Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898634BFE8C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885511; cv=none; b=WX8u7VqhYApfIsg6KFbTnXtQZAhELOwpaRAIx3OwWB0zYMSFWSLwjDZNyFH0pp6sVuEkIV5cAR+hFZnNBkwcxSQPajO9kPpupaP6NLD6wtx2XjXpKGs0zBFeJqyoakW10lPVhslKoV1H6aHq6Nt5QG5q+rYCAj0SOKHZgOtltU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885511; c=relaxed/simple;
	bh=2nd4EPjmP5Thck4Qs6pRTamguHQZC9cCn0nzKiIG47M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7DgzcpzmZwBYLuz7KXsv9tcdLNNLFp+0nNgO6dwmaEZk5ZvrEx619HsT1IQB997cH047jesotup7C9Hqa4hrt/0PM0y89TvTKzEGp98FscKA/1IxCyPSAx0ySnUnfs7hDA6RfnmaAzycA/j8S8QzD3yu2cL/nPvjqyhyobjH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYMsEAHC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Er+GJhn5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYMsEAHC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Er+GJhn5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xv48790856
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=; b=BYMsEAHCcWicA2IB
	hxBdA7dJpEQNC0n7xDLLbl7NE2S280nt1WJsVdjbjiBMwVcm7N7qSowOHArvHRNu
	0OCqHvZEoDnSz77pTtTqfNqiizOaPNLkYGlDBr37aZNCVj26mA/Eh3xIg0ouabPJ
	YQuAhFXk0mwvqD8Dc/q1kxtM2Zgjk5fllXr2cAqKCMSHhuGnZLLq+e9djw+1wKaE
	U5ekKzoSq/ccaYzTcs6t1u3s7GdPepkzrzDVty/1sbpXM0CKKWLMawO9ngcMRi/J
	1Fda+JH/qjVXg2k7I2K/LjYtZTxQD3pLDVhGOMiIfcCD7xwmC5KKsf8gWSDlkBMZ
	k0lQKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjr8dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso487356985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885508; x=1792490308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=;
        b=Er+GJhn5JlNS2hSc6Ij5Fw0CPs/32c0dxWX6irNTzyf3wd9p2/WN6Wcb2WK8xDhYfc
         Xjk4Qp1mNowhTuV3+fjk5Uo2Dz3YGRKHRBuhG3qX0qf2CqIRVOMzmYqSvBQhmNBELI9p
         B896cKvEf1dUtKke4mKQ+/vrEqPDEluThO29R5f3D7c0W2VgmkVh73+khT2rmIHACDCT
         k6hx8cgdIV28+eJA1BmSKnkt9+fkV0gYBlqYbpvN1G+pmzjA385UXTtICUXnWkLcNPuV
         U/U5od4Tqtoyj1YEUsFJHPMwyAeDc1Dr2239w4nfx672Mcjofo56v+neRr5ED/CCcz2p
         p10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885508; x=1792490308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SgBA5Rn5KBb65U5F54CmtVMwrreygNCGSwYZM/hwX0=;
        b=svptSBv2+yib3wLKxz5c5gEnhl5hmeDbE0QRJUds9YHQyRto7ZVqKuqb854btoKYmR
         jlR/RHqVx0gotWnBNoF8mhqIsUvM01EaMielomSDFT8/ZLvh6utxmDMR6Er92/mf/F1m
         X1gzo9zGe6YoWYe9BAdlqcoxZ1xOAFlsZVewII+Imm1cJ/0w3Ymt8GNb2+cqWCxmy7QC
         t9EXR9S+Fak5b3Y/+R6X5gwRKXtj4RKlCkEjwaV62QTpDMPvlRUX8HuqcUmgHi+8oZ46
         bT9I9NNxjT6/k1HfHS9PQlfgJ1nABHviPugyJi5VNmhhMF5AjE4AdjMzT6sj8s5bkiRc
         88vQ==
X-Forwarded-Encrypted: i=1; AKwUvByz/IdTYleyvTENjpvMLHXcwm9dvOs6jiCheUNThxKUhXlp1FnzykeKZXcVCH+gaUViWh4hsaH6+GEWuSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPDGZAcaaXx1X77XrKpPICB8GCHcqVlGxSMEjG5PpwMLpIIb7t
	UhLkXmHWS8deyygM487FtZmu0gLuxXaFurkiG2wPk1Jai+X9QlzpkIHstGnWS2Z/mcndduS7Mme
	zLoiV8lLsL6r6WVL93xFMTxb82aCstsf//+bQitpWqUKRtpGbeV4GbjO8fqLtq4pgxTI=
X-Gm-Gg: AYBFou0mbbmYICa9jIzqiiCITZMol4jj8DsjGK6ArUodW6MinMpyt349l1FY/KXoGL7
	v9dZtSs+CYMa53UKqIZ/jwORS8VV3XwvmN4q67K751HkvtlRcSGv92tCMxvcRMDCQcY5lw8YLTa
	vrfiqA6Q0nOQConRz3qhR2Le7vmz9IiWPeVNCfmMFRBuwMEUYP8dYCBMvi3veuBGM6Evhbj/orj
	BUFyO6JXuOII01/VOLK9HiakIqZAhwhZkWETaGJK7+1GGVqnYEzXAWIrsa43hWJ1v1nZG8wYtS7
	qLbezLjSOw+DD7xZ55F4ML+P6PTsr2HVOB/WjdvNgUVLtr0FO6EeQMmnLKWNv9bkCRwDXtGIEvR
	HBROINpEYv7P3qQJSLj5lGlE8Fh/g
X-Received: by 2002:a05:620a:44cb:b0:93e:e5f3:7b6e with SMTP id af79cd13be357-93ee5f38b69mr855791585a.79.1791885507522;
        Tue, 13 Oct 2026 02:58:27 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:93e:e5f3:7b6e with SMTP id af79cd13be357-93ee5f38b69mr855786685a.79.1791885506845;
        Tue, 13 Oct 2026 02:58:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:39 +0200
Subject: [PATCH v10 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3392;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2nd4EPjmP5Thck4Qs6pRTamguHQZC9cCn0nzKiIG47M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCjsgSGKAcbR2tqeAj2xTZFeJ9Fi13XldMI6
 dDL/XwiM2+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AowAKCRAFnS7L/zaE
 w8zND/0ayJnr63lmfmN8N4rxT3vmnYWCFPxjF78PqCiLvTCv9aOhtNqf5fvlibCZamfgGl2Wh2g
 TIpKMrt/OdA8QJUOTCZwbvNuz2ECEuGvfD1gtZ7F2hrXNDtf/Hqdd0tpziq+zCUfjQI9CChJcNe
 JcOUhnRLT+O0ugnuLmWeS7oH5xhFN8G8pKXBQx8oAKp/kmc8qPkj6VWFM/ehGOnIl+Vp2I6U3kj
 t9MN0TZiVRcy3qQB+CDhNXKrFvX7t6PHLrRRBq2qX0+x5cMvnwNEbvRQFY49+BicPh3BlvPRne1
 1Pl7ULDtSdmHkfckkXfz6wvEPM+OJ/Ku8RiPlnfBsgYK/wIlVtpUH+Lyi9gnJMYlIVN4jIw84tJ
 CTg8Tfuv5BRwfI1yGtttnIKj4F9WQVNQa7f2alvmhN+8cL5/Sl8TlID/lOfYcjeT4aYicE+QPZ+
 Hzch9+IxHSNM7bAH7Nw0HJe2JOdRsVaExgnJnQBjDlJqqtuPKZb5pJcw97rnUJ6US2rTsXK3lEB
 wf/2Mt2xb20pIoPHedW/K5bWW+l2TIRyJEHhqgUHw4EI1zhy/0+0wHbaimzuyaiWB3/1Z2QDwAc
 CoVI5t8mwhISEHfcl7j/JVygbCs+5B3R+p60Dogmrz65ItId18SC/skioXrwyG5+8n4A5wn46Du
 WSsOrK6TPEiSchg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX6yGejVfv9Mmu
 m1EFejuRlAA7AT1a/g/e3hv8eLtTPKS6uLtfMCRd8PObxNDGCnICrM7bj+5nR8QDXF2M6h1Bu1O
 5g+0ZvF/iwlVf8nPkSYqG/AX+/TQ3hU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXzQK1GvopItVq
 7chehfm+L++groYkgkQmpFwYL2ijEnX1TwuZUnYEB8zdXeIJx8Ca1vhcDSlpfXhXJ26gXbkjNAr
 fbzd8DEFBqppdqcrMIMiKQTHcHP2GlCKrXSHetYfKBiobmOoH4P71V4hChYezWI6rTsI0xe4SkF
 yioEp3PI/Vp2OBcKeHeoPmLQUQVoTOHQmwuvYNaDyPerKgWjGt9cODV5LBdAQ1WZ8rwgbh6GuBh
 0CGqT3N+FXYKEbqq/+ep6zyYemzlgD7JG3TY42HufXu5NWB/+4CPE2bizcf8/YNNvySQylYppzY
 nNNbe059kFs5HcBrHVgBR6MKdj5bSEsRmc9MQyPexQQrz7kxbMHSncpI3mgHfsqM2bSR5oqmqki
 iH0hZ/Sm3NwMEiri3tMT3c0h9sfDrEMWQQv6aeaCeP+G7VxR8KgMW3r8pbZIs2421/v1vnpcact
 LqozZ3OXNpXNudH/6yQ==
X-Proofpoint-ORIG-GUID: q-f8mWmkN1SBfPkP4ps6_X1op-zV_yXz
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace00c4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: q-f8mWmkN1SBfPkP4ps6_X1op-zV_yXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label.

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f9b8dbf9318c9d4947e56ef0159311634bf0c1ee..2d6292f8cab39596b540084fbd8b30f4c25cd4ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1323,6 +1323,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..e80927f87ff26fe3f51db6409f509fb99ad614a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1949,6 +1949,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
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

