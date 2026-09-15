Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0351C470128
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464509; cv=none; b=or9WBRbyaCu7DtqGM810M5L4EmF6T8JA2c1h3Z96aQhFMF7U9hOTO/NUeZJ8Nw+pkJt0fK+wWEO6Zlhp4pM5X4PCqWUIJY5wv++3O/VFmE4c+OijzWCvoU3KJtnVUw7KetgZPKP6gzVRQ2bBf/UgcHjicbpTCR2y9yt9vXPq97U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464509; c=relaxed/simple;
	bh=bXRmq/LkVHl3Wkzce7EKsFKSt2ADGnLeNMNslKPB/Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkmDpnSuhdLHrcQ6CqNMg2C3sdyDaQwb7B82lAnBWM3+9tm/CRqOES4aBs6csZusrXZeC9wA2LurvcYsMXMQ12EyYyfIcdNl0U16aWwYpiokUVwicDjFN+nGz3QyBqY7W//BT7JN1/0M5uki6KSYM/oPBY3NlaqjexE5J7Yfgsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsL1ASB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijXPlcx5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsL1ASB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijXPlcx5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7AI2249685
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/fI3x8NiNBLG06L2ufKw48FjISxnkPuNyMTEtA4Tb0=; b=TsL1ASB1A+lZ/1eT
	LBJ9E2E8PCnI6ZHCD0cHP2aJRS13h7sw/uNwbdc1f/1wdebirFjchywIGCeFXLsf
	mIReachwmLdmCl4xj3Lf0iZXOk6zV8xvgEUi22eZGWj0half/PFs0+3v8m+wTd+y
	g16L1O1WbSioFZRS11P6rOT8i9i9aZcBk39wIqbt+y33wD9AUIGXr20/Swa4pB/3
	4On/NZaNuVDcN8DkmqQkNs9ACsrvirdrGPiO8PF/Dh6UY2K8LkYuRi7GHVnm4DP5
	AkouD21x/wcssxd+w+0gFo1YoBgUm2yLzxFNoHP+6BTTlYfzCPsD8iWV2/b4Ciz5
	sw8+UQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye7127y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:28:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0312937eso325472885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464504; x=1790069304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/fI3x8NiNBLG06L2ufKw48FjISxnkPuNyMTEtA4Tb0=;
        b=ijXPlcx5otuTB4poGEZzzeG6rqAmUX3afxX/K9gF/GvMA20g5ltST0lUlNxzlKg+5a
         LtJXguxnBLIyTts3qHlf17pjDxz87EUC4n0On/HhqJNA7TlF/N+BDzndTuxwnXoNId75
         IFeCLVXCk5bVxsiEhLZamTN5fJslx7ZUW2R54Tuzxzj01ja8Mhrjp3DfvBMNLojey9Yr
         gAVa1HnAvObWg5EJYP8A3nAADdnrEmsEjdulJ8BNPbS4E4DyvX7eoH3tw8khPxby5/pi
         ehqysBw1JVWgJMSEKu82ypds2NnbDCyEFKZGqm15njhJOfldB93c7BpZd8pOSzKCohUb
         3u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464504; x=1790069304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/fI3x8NiNBLG06L2ufKw48FjISxnkPuNyMTEtA4Tb0=;
        b=EMolgTaBYoYqkq6VseT1cCx6XaTh99JLJesyRH1+Xc6cUPhn3D/+IFQPZZ/hdwnSYM
         +03v8cEXPb6iqJwQo84a+x4uSvzh3gV0akuTJVYzrpXwLTCvNdDrtuYUcCgr5/vNy6kr
         RX1KW/5l8iipTWzuvGGkMa51q+8HaUN2j95m9gHX/VVycofepth8tdEYHHpHo1CSA1m9
         f2MHw4jrap5Yx71FZ0behBfN4j3qHdpenWBnLA0yd0eHQc0gdGQ4WIfIXM4nFmJWfagY
         BM/6G4W2c2z2h+L2EVpX4uKWUFyPyxs6brYQe2fuxY23CXv7TEhG/9+F+GsY34Imu1VG
         0EzQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3ALLE5YjK6yzgCfFAPgOu3NzX26NDKcPP0QnnTD3C+YLSUWMUZi4B4iICQOIVd2yTwi5qCuQwaockUT8=@vger.kernel.org
X-Gm-Message-State: AFuF++nIKe2CSsbEugiWNxceci8Lfm96o+uPe9IckYpIyfZlvrfzRFkK
	uCEGpL7dgXKHVKP0Ks1B7amxXwJk3Rh3vXeJ+uVbziVq1Zb+JsUKaX6AFnZ6FuszBwJ8xSfm2xA
	c5YJe6lu0d8s3wbuFutH++DDdDPlA4sTgqkxKauWceoVvaCP+eVgSrUF8dCPYoRmacmM=
X-Gm-Gg: AYBFou1JolLyV+rjYH959cMYXwR0tsaAzFKLHjx4lcO+BBuKeHJLg8YAAcq7NyY4W5W
	n/ioOVgfIrwQiMNi+vKSu1EmRXW/Wy/KPulSIDGXqPvZGfqUROUxUlE7xHF9shWg48Yv/yM3HaH
	CXS/bwqQ2yMtemTv/7YRrXx5ccHwrxGLb/3M9iVhKo0ILO7FvH6Anmj6ynRpBOBDJ8YnXYq3wpJ
	kX0chh3G4D1rFefWj+G6CJ98IHQI2rZA19rktr7cRrT7Fk8As6YW/nB25EL9MDzAy8KYb1gl36t
	ZtlwY75k2dYQchcXw9ElCYafnT4Sg2PQBVu+rIiTtd/1QFUgWK/SkiEPy42gtO6i9HbJ/mxpyVj
	oo+LbfVh0SX8CkIHFR0LIqfXRhkgd1uyLl4L7rUT4ZwP9zgh0yDYJhcGbeVf28HA=
X-Received: by 2002:a05:620a:4808:b0:93a:12eb:b632 with SMTP id af79cd13be357-93a297e5c8dmr961287985a.10.1789464504607;
        Tue, 15 Sep 2026 02:28:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:93a:12eb:b632 with SMTP id af79cd13be357-93a297e5c8dmr961284685a.10.1789464504190;
        Tue, 15 Sep 2026 02:28:24 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a3f467566sm18939785a.39.2026.09.15.02.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:28:23 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:27:50 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
In-Reply-To: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464471; l=1099;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=bXRmq/LkVHl3Wkzce7EKsFKSt2ADGnLeNMNslKPB/Js=;
 b=pXi5y4Y0Fm69ZEAcS81pYwIUOtYfvuA2eymuS8KiMJtlmzTHrX7GfKEKbi1NipcnkJiNQqRSw
 vSSUuKpKEFVCyy2NKvGiSs7QgaYWpj+xZScpuo6dRvIffTF/9r+cMi7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX5IsxXUnwgZfP
 pOXb6oNC88bZIIC4xby4/2Puc7EVQi86OSAvy72JT4Q1zszoJ2cjBj7q3ckRT4VK1QlTWSiYWJ1
 6poDWOioTgQbW7ysBAN0F/ITHRuhySdC2KwgAco3bjIL7iFCTV8ROOlXw7iCgqKejHKnQlmqt7N
 K0ciu8/0lapeRK94OHUZ+xPI+hUGutWuFm+LpqiSwrOsvOHKv7E8/ZRQjF8DjQOjOOlMuCaiI8H
 6HUeqwfDsrJYMCV2ltf/Q9M9Fpaj23dyDFrMZABhq/7FJAn8ATDJYRCvVpn5iMb9WQ+AEBsRUam
 ygwaIfItcQMTfNWbfsqEcqvwQPPmNog9m5/iyfEkTF3rVI+/OXPo3oa6nrKHZmf3WCw4mwui4oQ
 IY7+fFf/zSjmTK0WxmDtDNBf5lc2qY45xZUshdZJ7zkrVgt2LdnSfA87rR83+vHdOBsvTgmTdE2
 EUUIvmGqxmnPEzu+6oA==
X-Proofpoint-GUID: 2bpF5x1iBEkQsKNkRxEzsUtIRxgowpk9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX7/XNowochrFB
 1CES8N4aelDfLHCzOa1R+aLrLiLMud+kJc0jDCiBr7329KDBo46PIcWlwN1fgap/ZJyeOYTr7Vx
 lYlk2+ouTPwtp6oJTCJ+bYGky/gNw9U=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa90fb9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aCRQ4ZZDzeq032jGe_cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2bpF5x1iBEkQsKNkRxEzsUtIRxgowpk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150135

The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
the display-controller (DPU) node, alongside the existing MMCX
performance-state power domain.

The MDSS node's CORE_GDSC is unaffected, since it continues to power
the rest of the MDSS hardware on its own.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ace19b8b12d7..b3e3cd1d311c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3619,7 +3619,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "mmcx", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

