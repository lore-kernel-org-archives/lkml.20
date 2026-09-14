Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B991A49690C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390221; cv=none; b=Od3dCVm/icHF4nuX3nQ79PCst3q/6poYzVIXWraaQ84z4pT1Pw+jyUVPp8njLgSSteh6SlyVGkDITsT8jKbk9hfEaYqPSCqiQFhz28Ghbik+TJhYVLhli7ETaAQpzJYn3gk6Xa9pd+ppKLDUlI3DnA1wj5SdY61XhSjzPeEvOdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390221; c=relaxed/simple;
	bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oa/F+J8yK1qqV0SX2KpOmhGE/YPST9PMntA41jiaLjiocP87rxdkkhZ9JAjUIfc16RPXYIgjURVn6WS1AGkYCduiXZSpPTKPKLRjo6oCydnhwqR1tgPp4S47fR4+cCUaXndByXi03WymsHwQ6YKMvD4cVMnzTFtbst2Mn3gj0j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmkpajkD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akSWUggI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmkpajkD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akSWUggI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNQ53432051
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=; b=pmkpajkDi4WGDb8q
	Jhohj62IJvtISjtbm/Z1cpKc0D0PQj0cZa4YS6pvWJNHyVodHWfPKdehSTqduJ71
	FomyvWmQPN1OqhKfB/5/RSH8aPu5nYlx/LNfxQXhmd4CBKPWI9+jXXY8BoW6cK+R
	C6zebb4/uo07F3V/CIEJp0uhSn3Q8/HFfH3zHeb3VxRvmtM6u+Kaz0Ivltkq2NzE
	6e/abVJgo8Qk5A/riASYUBJ/A1tLD4u+CGHh56myHz6D3DL/ENBOU/LLrxUmqz+i
	EX7mlia+ecyBNc88CqielOb9sQxX5HnfOhjPRWHyxAdtA+SAdcL53oCRvxo/1rh3
	7tF33Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg2vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-790376c9f8cso757271137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390215; x=1789995015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=akSWUggIBlB/A4AHax3y2peYJHeDuNitYqB+s09+dBVB3xkG3hIeupy5xUcZr2PRjf
         n1ZTxkrfyaxulr9cIhBBTvxWOh/faTkTQC0C9Qx5vkY1XRbr55oaa3nUXz2hVHzVO9of
         qGq3OLnhRpYuHJYKV0KgRveEgaWb4nQ8TP6KEOI20oJYM8KDq8x5EufyUQ9SbfwyYFVm
         ZCDHS0mTiEF0GHlH6Afa/gIYpmAdWEGjmBE4Q1rhB9+X4dtcT4ZlhExwDK/VP0IpJ9Mb
         UJRRUS03Swp1zEl/ZVQgjcpfttW4P0MLHPxaGM/U+yJexYJj0AjKNkzReLOHJdLeWjO6
         XUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390215; x=1789995015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=q4alqTL0COYoL7RUzh6jVOkEY8Z4dhMgq+wIw2/reZbXVMlVqd9SVepCCfqKSt4BTS
         zNAMox9kwHP8GOmkPFZfDKt8S60iwyptvSNkYb8ugcrSHG6Pk/vut+ZFLt/utBCN5uAo
         E//OtvkERJDW3A9pDIQDWi58Q/8xojhyIh+TDi2gUgLqsXAdvq1FjSmOgv1Yr4AF47/H
         So+1nk0wmp/AHJfikH6brdvggblo5JHfgnM43XyBMNdQGNMHZ0fA+zbOmXq57+oiLR41
         Z1AnJ9um2a0XMgHWoaBrxWRxC6CxAoQJGFi51Ev3KCRu1VSio1ZaQbAW7WslvmwnaHk4
         9lKA==
X-Forwarded-Encrypted: i=1; AKwUvBwlTCunpyKt6HpVSNm3gwFxA0ODD6MQWV5WjK3/2G5gb4A+B5dVU6Sm5YVPI/YPQbM4w44BObAv/MyZTLo=@vger.kernel.org
X-Gm-Message-State: AFuF++kO7l55rOhQbWb5cyzqfky8BA7i1mhbgle1KXq1eaV8ECHy/vdG
	6K7qUiDdSEClG4b9h68ROLFCG+ssNx7GtIAYZ5NwC5a66AnYZ4f0Lniu7bBUr/D03nlkx/LILM9
	yzOArKoEifNVaN6G6VtAQ6uZX/cx9Jel68VKg8Vx3jWdj6alXVQB9oEJQ+CgHlhlXC24=
X-Gm-Gg: AYBFou2CrNT+UPPrht+T9NorNZiaL8WHTFIE/0tYpqDtaef8aueYpXIHT3ZHBrBhU8z
	kd14llvS1YlxYRcPt9M0E5rykZ8zO/m1FxkrOBG27eYgiEeoG1wjodXG1NA4fMYaExR5EOamxab
	L7E6IroGo9MuSm+mAjcFLEmWDFo760bcv8aQNI51OIYrJqcVjXRSG/HHyxu0cyzhnPaR+tPRaSW
	5zGYpN9PCDABAiiqbEHQVAcHADqrgaOoGTl53FPQHc1XRQe7tjqTfRuy/AyN0sOu7Ctvimg2Vnm
	jxefUIcaJLARDR3o4XBcQdgit/NVXCKAGxKSX+QZ12h4GYGjHKgnYiTaRFaPLGk7oFvJM/5kstB
	s8StUcbwc
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr1433743137.4.1789390215407;
        Mon, 14 Sep 2026 05:50:15 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr1433710137.4.1789390214855;
        Mon, 14 Sep 2026 05:50:14 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:49 +0300
Subject: [PATCH v4 50/52] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-50-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z8mK/oWSEVpRJwgU0xbo0T38BnOn+vWKHsb
 YJzITytGoGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs/AAKCRAbX0TJAJUV
 Vq82D/sGnPkn33GHFFej/nprGeJVi2SFMJoCvR330SzAdyXLy1b2zg+6DU9CYwbtgm1yn4EkAR9
 i6B4Lw1XRa0D3o7AOSbh1WTcZWvoqEU4e6Ehl8DRy/iJVlvShznKHhL76QDowOXrF9WjHxXvkUc
 lO2MaH8ONXIQBon4g0NgknZ1FzLgBHnxD632dsU+A+dJ5gdgrGrLYRJyBdJLbTKsV/M9Fqy96nD
 fDaQXwsj4Ws+BC1kcZiUYZ4tkryHZQZ7vpqRjOMP2f7/llsgoIEU4ZdGpwcE9W5w5GALAv+Uz2k
 SNThHeghJ5+MCdY2saQrdBngG9QkUuUANkxsGA+vg+xI9U1+4hNNJGt8wWnmncSMHXMViW4rhCs
 x6yPERM8sytE3x9E2ckB4+BZQ46Y5L/4qfl2QwdJxuY4HTl7JvTtzOj+Ol7wrt6Fc72H9AhT1JD
 Sp5K1esqCgp1nuEFxzE9pct1DIqHRFmzc8OyrMY27Q3UzRZTYaRPLA5gE6awtyuYChpdplKOB4j
 kIpYEV0Se9ABMjq/tzlJ2sD+E1J21abZpBOnkStknU8qKxBmIyVASVZFvACdU8JA2+QMVpKX3WO
 AQswQE7c8HPtJ0jEmm2deExLf69+DTdTWCt29/DQWDuHEvZwV8Q+ywFJsoCeXMHcXaYoFxVjyDF
 khkXhEZsSvf6utg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7ed88 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/V4VsVWTq1iL
 Rc++l5v3I8VxtHe8W25WbIoz9rdx/sw2w+SZ+JR+gbzA1F0OPL/rgtvq2/Mbi3wdgHWeaqrbPax
 Na8JwiQt4v0D3Mx1hk6Bm5d931KhYy5nSn1ZMiwN5HBFTDwt2SdOX9cYprFTDrNwMxwTegP4N1m
 NQoMZ29ccKXR+iL/7F+W7BGoAE3frgkYLqWhOK3dYFVJb8NQxU1B/ANHp1C9tuEERHPdi+Nqq2R
 6S2Qs0d7ru1yICCKtCj9UM+q9zGsNT5UPeIOYi0rKPLzU6Z+Vv/sSaKdsops5O/GdVuPTw+qGD2
 pkyj+XvISaXo2Ah5gyE+RZkLxcmX33xAIFq2EAsHwVMFFE+36ECRR6omFxiKqfxUHWqRJZIV8Wo
 /SAsayNE80ATr+Xr41fTBcq3wITb1SphZHN9AHq0yJJ0zx8UtRWx2DyOheXulSapbGpzGDpeje5
 ey9ZgAsAKjixMoikVWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2OzGTHXkC6NZ
 Z1Ye55DMyDSsouAqD2CR3ztUPWFLZJ0PJiKMd+x+iYD3oqn7DojCnDEr/KirsgFZSG6Rdv4i0Y+
 Ux1Gkq3U55fRiHXAEgyu2aV/idhoFzw=
X-Proofpoint-ORIG-GUID: f4lbAHfyXWVPdcj-qndgJQ2kxQbP74Cb
X-Proofpoint-GUID: f4lbAHfyXWVPdcj-qndgJQ2kxQbP74Cb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99509305f970..9cf38a7e0b94 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2018,6 +2018,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

