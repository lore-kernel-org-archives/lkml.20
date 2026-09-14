Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F673468C34
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390145; cv=none; b=NQatgcZHK0BJRfv4QDOKzUgRMrppOzm7NHBwJaOtiWbwMIuTzNHXn/x0wFE7DpONqN3TwzN5ZDTBfKg1UFlkEiazL6vheAFMQAdWDfs/H1czGsSoPvlOwqwFMx/PrbUogsnjjOJUiLOchu+cO+GyYPYNd1n9cTG/Fojh45lvhks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390145; c=relaxed/simple;
	bh=iUAm59la2RPuw9YPE/Fxbi/Qk7PVnKlShGPZDiBCGGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VA0h5NtUx29kPw+/EFsgtUa41oAiRTIXNEdcyoJ6KX2Arw7fv9m8NxoEszMbhFVVDI2yufYJxDAnXxDE0e/4pIC/Kw0l6kc7CqESkaVj+Cq5mid4MhvugUwBGc0v++1O99aEJ4gTVkfYgP80UYCh1IWhI8lcf9KG+btMS1E5BxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMCmd6B5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKB9o+m0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMCmd6B5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKB9o+m0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwTa1460502
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0oTjF760GQe1PX8a83/x04HxHaVu5ptF3coIeHrZgo=; b=dMCmd6B5aoychfZF
	pnqnROI9h2DLw0Ne4BHWgxHfiktx+c7rbAd2VslstMdcBvgUiz613k2JKpaXWaMb
	Cw+XjHQoqGpf1IOd9L5HtDmaBoHg1Bm4+7NxKzPW4AJAO3nL37IqBsGSnRnmgmbK
	BRr+vPt5Usub3mfMw6B4VTTiDM0l2zO/dIU4tVinpD4MpJsIuT7tvWBskuQjOsKE
	XPGFLsjSsrLgpB+BK1gvOYpGK69zACLYMcS6Cgkt955eI/mRdzGStQbwu7zB70MN
	cwUID1A+w3VFKvMrY+y/GM4BL8kT0bk8DiKCjk0ndTzh8y/lQ7Zj0d1vvyjdDLFG
	z7vlBw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78d25a8ff32so878750137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390141; x=1789994941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0oTjF760GQe1PX8a83/x04HxHaVu5ptF3coIeHrZgo=;
        b=GKB9o+m0KTdl1yl1uV0YeghqScoZeJYvyQo/p7TXF4F433WIqo6VdRcDpcO9MlHAKz
         DnBPEntXzRLJF2oRuwg20P4O2VmjO3IyeUelEpuwvYmiAYEQWTC+B778K8XJ0ZMDRSIa
         cdzVRjmkODrxYn9UfhSpqaAfxFfwaqetq/dHXj23g1cvrBV19dg1cp4Bx13V75rmXgxC
         o7pKhBL+YIC6C0LOIp3E/1EdtSh/lUOwldwisklLQGk5vuvcbuIcw0ylFi/e3FpjXOS6
         L5A2ERvAS3wSdDFicph0RZYYj28I5ppHYm8eum5vN+THAg0J83HaE9rkb/E22TN3OHDv
         eQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390141; x=1789994941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0oTjF760GQe1PX8a83/x04HxHaVu5ptF3coIeHrZgo=;
        b=ew5l0cl0Eb2EnhLfVE71UJfkVUBjem8El97yzceK+cLA47FmE/Oc745VF+OC3qtkA/
         R/ZGlXLNmW1u2EbI4lvFq2B2553ok4bcvU7xPbvj2VNDdc7egVVpIBt+eqkH57mSKBHz
         LsyuGDuFEQ5RwFZGV7meTYno75PzYdJaAOIzT/YDSbOFT2vIKC+bquVjL8kiYJnFQkQR
         oLIynPcFizcCpq7Th08Ok4KELeJk9k3hYO0x3xAPuJSLHvc+q12GDJST9COec7U5lG5f
         QYc1QeyGu9buThyW0Mo1I9WHSc63q8Du6qzzfaCOo7YrecWQi85P/Zwz515L5eUgq1ZE
         mDPg==
X-Forwarded-Encrypted: i=1; AKwUvBy8/gfN/t6HrXG4cOp7DhqOJL5CUQ5YiYaQPBtpicC+4S5iwFsejN22kzieX/LQYa1FWz4NzRNgLloTrMU=@vger.kernel.org
X-Gm-Message-State: AFuF++k0zvFQkwpy1uCbvf0x4rrG3hSmoMVpVbWmqI1pWXDT5JIW/lGO
	Et+xeRNBDSmdW5NQwZQqlpY6QjXCdwsxQGcYuWTh2bJ4x8Rstgrp5MRTrr4tvLs8vSX6iNIFxdJ
	A0oQhAdms1hJZJpMLtoZxhQ0o4bURZvhrl/pDiiP+Qkgj7BxUpA1VzAM7Tv36AK0ej6M=
X-Gm-Gg: AYBFou2C4O3lh9KQRPTIvpIA2AVSDINuzIbSVk7CqYkujc06MpG1yhSimGJWRFfQG1S
	J7MZPUZk87/AIC21hwv2ajR86996rIALTUHqDNVPzCcaxuwzOF8WI7ngMYwSrAfKd8aByVd2OoW
	tkq0pHmS4g9wiY2UVLD78UUvTs2aS2FUc79MiwMsPWbwveZsUE5ZRaAN10+1lRNn/lfB+bs6nLx
	2PH+ozx1W//RviGzXgDMuaLY3VxYLMUV1QQBYedtPuKZge8xby3eFHXG2+bT54rj1pveX8bTKKo
	9H9sAyTWrbYShrPMXoVgX0m0iHT+xUHJvAZ8KCsEZ9lNAg4EvFJEw6uoyuw5CRJ2Hb0nJC6KTFs
	5gjxxplur
X-Received: by 2002:a05:6102:5792:b0:792:2a1e:f9bc with SMTP id ada2fe7eead31-79b5963e001mr1188700137.6.1789390141031;
        Mon, 14 Sep 2026 05:49:01 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:792:2a1e:f9bc with SMTP id ada2fe7eead31-79b5963e001mr1188663137.6.1789390140503;
        Mon, 14 Sep 2026 05:49:00 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:21 +0300
Subject: [PATCH v4 22/52] clk: qcom: gcc-sc7180: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-22-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iUAm59la2RPuw9YPE/Fxbi/Qk7PVnKlShGPZDiBCGGw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zgt1N3nv86WTjs2YRAnQ7k/mJJtIa88toJN
 cVHUmCJpY+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs4AAKCRAbX0TJAJUV
 VsCwEACQXcYBwT+BHYhg0d6ZXVHu72G1VBkt6PdxBQmXkWD4VMnToj9dZiefq9XQlNaiSTrcqBx
 IThxrhK8SICXgGiizxKZ/x3ogpRoDDK2WcBZkmEs/J+REm8t/ErthqCXXfTRVhbh8gGNO2HHCLY
 W9p4ByMI2uucngpZPpUGcCDg4IprjIMOtjEi0lx598MJKrpaQcPZbgmEIIPXrLsp0a2TcwvbOpW
 bnWV5WmhD8QkTZdRUWC4Aa46CsU7F/KvI58HqktDer+Hqft7PZDVQkBN0VSXJ0G5mmx2XkubHX5
 YTotGZJO0arAqOkMPy4Ib8NGS95mUrxC9Gquedjvl7jyQvRgvNcQSkozavWGLeBEQb0+HBtIm5X
 V9tXAMSvGg8FpMp2r9vZTmbFjLKKfbNH4AckzSQa0AeSdKLO1EogleXqTFAZXjOx6ODi4doyKLG
 eZ3z611P8hDzPfP5UpfPvBAceOFQRvz65f8TZaww1x9UPNaQgtsRyKzH8xcf8XGP5q9LdQesc12
 Z7zJS1oDUEPsrATMEtJeC/rcD9IuqadEPQTwgs+nsWu3ZGv2ajzQqlw0F70ZqLd6q6RXTtgRqmQ
 YaLS4DLTlFunPP8t+Up18Jp2bhTen3+ArmZJE3wLurYtqu1YJMkmqan5lBtpZiYfKWFI43qjb6v
 Pbts9xRx9jJQ+oQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX8pojoE3OLdBB
 WXrLW0w88GMJFwmb8z0IT3nH6psMPmAExGGAlVLuLtNRRMz5cDWAPoYFgRMQVUXgJ7uVyCPHSxm
 RnyInR83bCRScXI0V2F0qxPX59ZE32wSWqbEimgZllCeJgaw2lTcMKzaOSBODLG2Fi9PoIezpbM
 hVOlx5OzxkbV23zdVQA6A5IIlordUYEJl8bKdY5VG+TOBpQAZAe+4gE55gfwB0IxE+lxTlhGML4
 v39qoZjoxHhCjH1LeYOLq+06Y8j4F3gm84OI2FHh5rjjih94r9jLai33GOlImtHo7+PBULGcTQL
 9/NBqx0XzGPSQUVFsf5CnfTnvWRtOZ2cV+rnNc0surX0u5jDbhMGOjd5MFXIsHR8CrNIIHAd58R
 3/VROgY/RC7H/KsV12YGSQVX/IGoaOMRYEfGvZEQ20dstM3aBnYvYb/AL1unK2wQupFlCnSyQlH
 KkGrpGIWv+cmE9ByI4A==
X-Proofpoint-GUID: J7Vsv5ZSl7HlgMhVT5anF5VH5KJMN_kw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX7hstxtd6Jldz
 O9ecZgo8/NSQTlB40URchq4z4fPTkJ/CysJ3n4Z4OCqZ2bJzLv9QM8lgiaETk1cTOE3Sjtr1y0a
 wZ/02XYLuYfqr7AZ5UI0O6frWpFhMdE=
X-Proofpoint-ORIG-GUID: J7Vsv5ZSl7HlgMhVT5anF5VH5KJMN_kw
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed3e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7180.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 4a49ad7a9e5b..f3a245470a4d 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2418,6 +2418,7 @@ static const struct qcom_cc_desc gcc_sc7180_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7180_resets),
 	.gdscs = gcc_sc7180_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7180_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7180_match_table[] = {

-- 
2.54.0

