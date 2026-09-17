Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF294E13E8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646143; cv=none; b=Rai2ZYn6C8c94lCiYkIUjwqYPc1lYqHI9HGHlSIHGTSFRi+mO8bj5hG0dRZj6WyvFmpCVGEfZoiw1U8u8H1L5EEWdkLzF21L5mD2a7+CABBPkAa9hobesWExubb+BMxNQpppERULzmHuh5NNs87hKotEZvOHvmD5WUlg/H8/hvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646143; c=relaxed/simple;
	bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kChj5kM5cEDHhKfcXkrjk9bFngeNKIrDit4umcgWQVhTho6tTZpgyzTFUMK8TFs4FRWcCHrHHSHotEs25naXmVuGvfWagObYUjCY/p7zo2FCIRsPBb4EQ0N/EYm4lCZtaWI85frU4lHIuBBHk0WHFiQp42yNQsqFn0HRmne+fOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aj5iYwrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6X19oeN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aj5iYwrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6X19oeN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZkCF746693
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=; b=aj5iYwrbJT5InyMb
	S4FStayXNOWDoZnW8TWKshf6F2YJOi6CmORaZrMaMiHWkFfO6jWL03EsA2NGElFX
	f7TY8IxaSsdfUVM7Hl87IJCzAZ7ZfzODSfG6rUp18qD40cFpbvIYwEF0sIUCUX+V
	vFIgL5CdOYFMC0KfYb9qhlvgihfVlcXK8Lj/UBrX4xq/8d83YxrMv2eWCN7frEgN
	r/o7ofg4lTOHlmz/XaFuwT3wRTaFdIh8cVhXpThVZzB+/Ssoy2WOOVfifmug8MMh
	3d+GWvL2JeKTMqYn8ToWavwSIVLndy3V2HTY4xzbaJsnHH//r53bnRUdlgY0VGuw
	nzhE4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8t3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so1105974a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646124; x=1790250924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=F6X19oeNug5fpPXQgNlfYz6CPmZbLoLZRQyZiNVIMcgiPY8USnnNRjvtx4Qq6+3Qv6
         mJ0uH4w5uQ2DVZC/dfZXLH28ebxis9D9Fp20ydnng/7c8yHSAsoBUeoSKF5u6h8nxZkt
         zDJmncjUNnnG4gEUvLdAkJmIJ29kJ2ACfnoPC227aW/1HeE8Zj9hafDFr5vM19e/y7yJ
         IwM+SjQqNzWBc/bPUsylrXK5Asq0zcu2GlcHC2dQ6WOORrGa69OhKLCViCwyoWWLYV9h
         ERsNnldg50e/a5S31DL9KF3UfxB9cEfO8BP40iB7iPOsMu+aDFGSULS1ULXV2S29E9tv
         3efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646124; x=1790250924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=XYf/CTb7k7oc0Qt6K+Pyzgsib4kwxVUTHDc0f4lTBGPRNtiaS4hE/pSrTLVOMd47wM
         c2TINDbA4v4H9U61brQz/SK9n7v3id6XWyMv63z/pxqYUUNxjUIeJpDB1I/Y4tPbmWAJ
         KueWVKRokf2GBE0Icu5V2nXC5N51t6z1np5wAaogMF1XneYau0zlWFFzg0vVzquYn2T1
         Rrgj4OflaHAWOBbLcqVdD2kmj4oeK36+r9y5m3GtdPTHEl+M4r5WVSEcyxNAm6VYLDs4
         sI+2dMwz4GVQjH5u4io7LGsz6HTWIvtyjVV70u1N/jwz5aFvIdLaMvGens/to2Mn+9qS
         wXmg==
X-Forwarded-Encrypted: i=1; AKwUvBx1vpQP/oc1ZC1GbqoBGV0/OZXDJ96LSFZdWODcwMez4kHFY0sh6dvCqYNSPK/M6P33NWLA5HOgJIoBaz4=@vger.kernel.org
X-Gm-Message-State: AFuF++llUoJsaKtAbPc2hR4TCs5cUfJCp/M1+ypQz2hJ1Yj+f6F2rUIn
	Z5/qoulGG5t92bYf7Hx7kU9A8aKZr53xLVgK7BO5Hf8bNuxiMMm+e1Mh0ZRoKll7Aj2+zKcIDdh
	PJ7mJgEjCkcb6O0GvPMrHlXEhb0xAUj3ZmO8DjJCFRuqbJlWFzqmeZRmtkZHT+UNm/sY=
X-Gm-Gg: AYBFou2ecmAq8iQayiflPXnfd47n309w8M+MVIe1mtYsyWUKkXmVcGjg31RdQGU56W+
	FAgOLB4FTeyUrTIkxjoDK3TN8cNzgAjhO38+h2BJ7zm7KO/e3t3fhaE7VRYm60Bxno/FekWuxzp
	1rqzrNtlX4F6o7fhPlKAOTjsDFDjsiboV1g8VA+EEj9aissHUIogEGStyupl8yDSAWA3WyCyfo3
	Ak3q+tDdGgEVUSL9BxiMvmocy6mPIQoUn534ewmr2N/Z2S+VcZK6xAWr/Xga7pl8MngLgJeMB7L
	8x6zD8q1Mvnaeid9PTAh6y+k8af+iDl4i5BtXCfM0rB4+boeusU4hxOQMnI25U0IihGDTxD/4vF
	Qq0P3r3rkM+HXG/YEt6y2PLVR2ItXGWYj9Q==
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr21988793a91.10.1789646124408;
        Thu, 17 Sep 2026 04:55:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr21988636a91.10.1789646123700;
        Thu, 17 Sep 2026 04:55:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:20 +0530
Subject: [PATCH v2 12/18] arm64: dts: qcom: kaanapali: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-12-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=933;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
 b=u+BLxxMOlJ7ECpdh06aQcLMRLS+92yOFFdrZAV3wlY1eCZwlJYhFKOu4PN3tg2k/saHs0ZRno
 Z92NVXuWgcpD3jF0KWF2OOdrv9hwVzwcsaTv8H3heV8g/Y3fVk0Kn6p
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXwFBABHHKI/FO
 C6B2wRds5GKd8QQhZWvYBCAdQNZvCqocRca8uSH2HhxRLBJYMEyHZ/A2YD4q5Vc5tvdMvLAg4Kw
 7ATg6NMymdUMe8tXR51dvyZz0QJULoM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX+s7s+TfiybOb
 AYwFyYdQzHpeXdwmumV2hlxELkxwrThYGdrM5KXm/fVNFuPdkrZUyFUeogBYNj1aS35ZPMl7fXw
 mmI3DLrFBpC7Oor3E04LH1lpOhRdb0zpwu/NkWbpOTfyS/0mQpm+arHaFgH4vBcPGnTafBYInjo
 T2iy2C3L/e/oCXOoyT4EpYfR0+RWPA+qhfjiRTpoeXUtKlGtkd0fYvJ9j5SCZ0AeiWxU5Kj/cb7
 bitGCD9chbbIunO1fuPkyAs2WI4sNABVYDFAFy7fih6o4cGkBFm3wogIIJ04FLRnpr1X+M4Q5Jm
 tPf8b7MTMGZQ3l44V+JdPgTHaS4SVFm7mj3YNNxF5O61Wl/bFOy38V9g9/d38qKc8kRASNhSdwz
 HDikPOElRtTKUfMUD2+1spHN+OyX7GRr6hpQWabLzF9XqzGzXx+6yIDFxYYDGReFmBYg0NthjT7
 Vf4DigO31s7+7QHVZIg==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabd52d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: V8jJg3D37J9qKhldx77JR63hgSo9CRoK
X-Proofpoint-ORIG-GUID: V8jJg3D37J9qKhldx77JR63hgSo9CRoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 6d817381bb37..83c4f93a654a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie_port0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

