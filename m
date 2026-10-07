Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461C34D17BF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393222; cv=none; b=AtBIUtc+fHLNb5LKttuNDznSVf94Pt8YaVDt2X7n2YW7eeeUaV4VwyTNjCkYWR7Tl2WxQ7FCIhDamZDmlxlDLivH6+bHomLzAk8KZCWFcmIDKm55Gz98ue6SNxGDwuZoNHDL3lq/8etjxAnDj9AAFkvD4knOyRMFwXF67i+gtR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393222; c=relaxed/simple;
	bh=cHujkfYRtHbWewechXi4nnWF5mSPOrZADaQK9qGyqUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FIWwA1ooLvl8CvwR1KrqN8483uvcI0lDLrokpbYIe22dsYW5c9AQfFS5W8PsK/Vq138EiZXhQkvcAAha2sn+4r1hFKOkjPvlW1H/A8Eiph0KfQnueH1Pui0tiK3hH7PTRC4mj1Na6AlyGtjn+geCtxTjzVexb5pRUiltdFIQEeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ff4sBEUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnh1a/z6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ff4sBEUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnh1a/z6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtVAK3646970
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 17:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtZjtjc9fNSIw7IFd+zOahsl7w8qgLjfOmNUe0hZ+X0=; b=Ff4sBEUzpM/99LDO
	hmc5mOUrcJvHrC2dn1wwahzvD4rPflTRvkpIYoYsFW0pkawfNtLYbEi02o3InpTD
	dKssEs5Jr1R4R43fcQ9e22IxJYui8yM+X6Z54mTZu5//hPGF2V6UCAKLIARZK2Gi
	+48MOuRQMWrUcKZBd1GQaTKQpMLzHTJ0sHoZAdD/Faz0X7LWIR5MKaArIftV732p
	JRf8SEF4NsjWzP5h1/rj+dX4RVt6z5R/UjdLy8LTr7eqatuRsEvk+rFfsTNnrb5d
	Ag+DVgJqgxSvLPCJudU/3Ar3YPeIXpjzQPX/mPmmOl2eq1VG/kWDWb1xlg3y8zNQ
	NjryGA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s390m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:13:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a82c7e8fcfso2959629a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791393220; x=1791998020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtZjtjc9fNSIw7IFd+zOahsl7w8qgLjfOmNUe0hZ+X0=;
        b=Xnh1a/z6HwU/dL5mVR/TLOm+4V1frwtnvu4Wwj+Uezi1hkq3nDDE9xxkVO4fqHJ18y
         q5lnOSPxIGASapN5LWAge8TBMKa0saWJcLsY+cZ5Ru+QghjbXwMau25lpwsczmVZxdt7
         uUIHkkS4nemcTUwpxNfl+lJIADHiYfBVa6GsMmf4ygc/Fylw8buus/HlUbFEFoAehIUi
         jO4lMF2KIqb9OLJPxHEv/F8fAYX54dI3LgY3pEDKesMNqn8I+jLY5HcdeaDZcftnEZOm
         bRfwLuVaMO/tNPo8mSwkc/h2h4NSICTvNzL6g6moKyecoALUbzwCrBlwT5FoL4gymlJt
         J15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791393220; x=1791998020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtZjtjc9fNSIw7IFd+zOahsl7w8qgLjfOmNUe0hZ+X0=;
        b=tKX22S1vIzO+F79tOuTvhrFy9x54V4Iw4Ltl+OePwmpPpaASqN9ywEDfWUGE8LSLyF
         ttkadwvsts5LKBVRqiM1lY+ze576/FzMpL05ak1u98adL6RwW3P85UeAnsEkEdBnA3WV
         h5gb4G9jkp70MY5IqHsltXkdm7q/+tpQATORfqs+OkUV1oHd0ZWfxUm9WbTJH7L6A1Zz
         HAU8KbJKbo5m65oiNaUNvMaP7tl9Rzb4rihK4E89p74HVv0GQjNYclHv/tLeoUZlICf/
         W/TOAoWyvt3R3kJYT5YhJfYezvtRvmb6rYzWReJSB541qajgIcW2f3SPaxCTnA3/upE/
         x5OQ==
X-Forwarded-Encrypted: i=1; AKwUvBypv8abTLHBOnnkF1SFUZ+6Gs+G2KSIIwdfb8nJEZB+WtPvJDTbgaAQduvOavNSYl6WKjPNEBASA13FCws=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2KdWwmR1NMGIyM2LluVlkvoct1ExFRiRGlLVq2pNQrToO+BFw
	f6V2FNg0hKwgOTZ5xZ/7z1/X7qP2rDrjJ234768MY8u0TrKGp5f0XsL4a/ovkojGS4H9pYci9GB
	GVcHIqnLjYqiBuObmCKeiWfxV+YYjEcxqQmuww3h5Xrvmf9I3V9EUilkdH7AL3QKWsSU=
X-Gm-Gg: AYBFou25p8wZVXrHhaHjxSpEkD1olZHwMYAIRTaphjcZI5+9EPlm2zt9c18l0xVcaPr
	W1Xaznc1fF7zdOkr35KpZOnLQf9Q/QKCXW+1T93af2IXBtR6YpF0d4hb7ZNiBQdAEFYBYdcOJyU
	g4EVZtAjJrdYjaJ/rFLlY1/i81JUqHrpv8rVW3VYb2mPKaE4ra+6VAEIlaUn9Pb8FpMq4tjwPLQ
	ngg0pvFjouP5E7I8Rw8J5tVIVsQ6s8q1rEa05d5npzhx6vKuHe6NHakaJgEnkMJekoSPGkx53oR
	sw/Jswq9TQJbIjg3hshK9UilZTEOzqcFk+AbpdUB5UEHdctTLRUNR/hy7z53UPcdyKhYTjKG8Iw
	qEjbZKM2dxQUWyaSDnwJtKHvmFVeMFDuA
X-Received: by 2002:a17:90b:2e47:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3a8a1b4261bmr2489354a91.36.1791393219690;
        Wed, 07 Oct 2026 10:13:39 -0700 (PDT)
X-Received: by 2002:a17:90b:2e47:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3a8a1b4261bmr2489339a91.36.1791393219176;
        Wed, 07 Oct 2026 10:13:39 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm303304a91.15.2026.10.07.10.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:13:38 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 22:43:19 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: kaanapali: add CDSP FastRPC
 extended context bank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-dts-v2-1-fa9e14900313@oss.qualcomm.com>
References: <20261007-extended-mapping-dts-v2-0-fa9e14900313@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-dts-v2-0-fa9e14900313@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791393209; l=4490;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=cHujkfYRtHbWewechXi4nnWF5mSPOrZADaQK9qGyqUY=;
 b=BgWPt/9v5a/I2fmKLmVC0yeUUZDeza80t5Dj3Kwe51NAD5WUOu27jfMS40H7sbkONJnaqQg8a
 fCKdQBbOfKYDgwkD59OVm1uFs1H+w1RzdTShP6mFDU5ruTHKf3zPBwx
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: Jtwcpo-_wsCpKr450eD8TcFlOTXqx-3r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX44yDkjbcTHRj
 vQxqOLzIMp7SuPuK9zsDCun3OhYutqgEh8Tbex53v0Vqm8MCalZaJowhxifWGPrTv+H6EuAD0xi
 hIPYm6a2bsKkpMqmcoUtnPwlp6Jlo434yk74FikX0mMiEFDFx2tSq3Q/2oAwWuxGRgKPNpWEc7W
 dfacP4veihxiYvq8keVrx0xpInDwX+7rItTQSM54DvSR6lhyw7zD9dRu950aOsVhpnpz5mWnsWZ
 OrDtE+urp8enYFdqNqDWyVoknzZNGC9chtRLDkPaWAMoapG++f7+AWkUh0/VKp9NaVkQJfgGtVJ
 PlXd6rSQJzQK/0pT6IqbUP2qjGZEzs/cYCFqefNPf1OXZJjMdUi1+JckD7rDrNR2s3xZBZ41/Za
 4fohuwoNk1KTXU5B70szbW58UqmMX9lre4rNnHGhKeC/U3eH5bjj46Sx8ex3umcg9g4Lg/XUd2/
 ZLfznAeEdtQrnUu8cBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX/woimdkPyRGY
 uoleztvjf0dMe1msW41mlKml0T9JR7dNAshZqf2ZhaxaFqK0M99LyNayHrXu4aFzKILa6SkzSO0
 SDvH6eCiLJc1tZlLymuesunHTyZNVDo=
X-Proofpoint-GUID: Jtwcpo-_wsCpKr450eD8TcFlOTXqx-3r
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac67dc4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Eg_51P1V4iClgTwtoi0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070067

Wire up compute-cb@13 as the dedicated extended IOVA context bank by
adding iommu-ranges = <0x4 0x0 0xfc 0x0>, restricting allocations to
the [16 GiB, ~1 TiB) window. This allows large CDSP buffers to be
mapped beyond the standard 34-bit limit.

Bump #address-cells and #size-cells to <2> on the fastrpc and glink
ancestor nodes to accommodate 64-bit iommu-ranges values, and update
all compute-cb reg entries to the four-cell format accordingly.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 146eaf9f0b9a..2b00a813414e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -6304,6 +6304,8 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,qmp = <&aoss_qmp>;
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
+			#address-cells = <2>;
+			#size-cells = <2>;
 
 			status = "disabled";
 
@@ -6315,17 +6317,19 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
 				qcom,remote-pid = <5>;
 				label = "cdsp";
+				#address-cells = <2>;
+				#size-cells = <2>;
 
 				fastrpc {
 					compatible = "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
-					#address-cells = <1>;
-					#size-cells = <0>;
+					#address-cells = <2>;
+					#size-cells = <2>;
 
 					compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
+						reg = <0x0 0x1 0x0 0x0>;
 						iommus = <&apps_smmu 0x19c1 0x0>,
 							 <&apps_smmu 0x1961 0x0>,
 							 <&apps_smmu 0x0c21 0x0>,
@@ -6335,7 +6339,7 @@ compute-cb@1 {
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
+						reg = <0x0 0x2 0x0 0x0>;
 						iommus = <&apps_smmu 0x1962 0x0>,
 							 <&apps_smmu 0x0c02 0x20>,
 							 <&apps_smmu 0x0c42 0x0>,
@@ -6345,7 +6349,7 @@ compute-cb@2 {
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
+						reg = <0x0 0x3 0x0 0x0>;
 						iommus = <&apps_smmu 0x1963 0x0>,
 							 <&apps_smmu 0x0c23 0x0>,
 							 <&apps_smmu 0x0c03 0x40>,
@@ -6355,7 +6359,7 @@ compute-cb@3 {
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
+						reg = <0x0 0x4 0x0 0x0>;
 						iommus = <&apps_smmu 0x1964 0x0>,
 							 <&apps_smmu 0x0c44 0x0>,
 							 <&apps_smmu 0x0c04 0x20>,
@@ -6365,7 +6369,7 @@ compute-cb@4 {
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
+						reg = <0x0 0x5 0x0 0x0>;
 						iommus = <&apps_smmu 0x1965 0x0>,
 							 <&apps_smmu 0x0c45 0x0>,
 							 <&apps_smmu 0x0c05 0x20>,
@@ -6375,7 +6379,7 @@ compute-cb@5 {
 
 					compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
+						reg = <0x0 0x6 0x0 0x0>;
 						iommus = <&apps_smmu 0x1966 0x0>,
 							 <&apps_smmu 0x0c06 0x20>,
 							 <&apps_smmu 0x0c46 0x0>,
@@ -6385,7 +6389,7 @@ compute-cb@6 {
 
 					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
+						reg = <0x0 0x7 0x0 0x0>;
 						iommus = <&apps_smmu 0x1967 0x0>,
 							 <&apps_smmu 0x0c27 0x0>,
 							 <&apps_smmu 0x0c07 0x40>,
@@ -6395,7 +6399,7 @@ compute-cb@7 {
 
 					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
+						reg = <0x0 0x8 0x0 0x0>;
 						iommus = <&apps_smmu 0x1968 0x0>,
 							 <&apps_smmu 0x0c08 0x20>,
 							 <&apps_smmu 0x0c48 0x0>,
@@ -6405,7 +6409,7 @@ compute-cb@8 {
 
 					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <0x0 0xc 0x0 0x0>;
 						iommus = <&apps_smmu 0x196c 0x0>,
 							 <&apps_smmu 0x0c2c 0x00>,
 							 <&apps_smmu 0x0c0c 0x40>,
@@ -6415,12 +6419,13 @@ compute-cb@12 {
 
 					compute-cb@13 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <13>;
+						reg = <0x0 0xd 0x0 0x0>;
 						iommus = <&apps_smmu 0x196d 0x0>,
 							 <&apps_smmu 0x0c0d 0x40>,
 							 <&apps_smmu 0x0c2e 0x0>,
 							 <&apps_smmu 0x0c2d 0x0>,
 							 <&apps_smmu 0x19cd 0x0>;
+						iommu-ranges = <0x4 0x0 0xfc 0x0>;
 						dma-coherent;
 					};
 				};

-- 
2.34.1

