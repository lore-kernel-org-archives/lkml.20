Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BA34AA01A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284521; cv=none; b=kiXAPdxOwg4BG9ohoB7CCXDl/twixayK2ek+30hNBARsROPdAJ8olvhR/PQ7gbgKuEW9QbacndbO2V2Ns5DDMOYQBPANk8aNk6T2iJYwEj138xY+2x1tlTARuyUtEWv3NxKVpnLChLgX0bASTFkKDKxnVutcatXGOVrwPTUlqcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284521; c=relaxed/simple;
	bh=NMfZqugoEO/0q2ugQAcHFhaYmO19tdYtxAa9pCn1gGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASfoFFePcHOQzxCspiEaF2rq9dB7RImnzOd8oRHhsPoEs7s4KTmi9oco8kaqRedy6JUBMJ9JhUWjsBrnJl0k/t88qWQav7uPMMEpwLG7vg20YDGZssPV8P4A2/V3F73+H3QOJzAo0oCkOWZOe5HQggqyFHRDJadwTioX5vMvhhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m84GtUdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGX7mT2B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m84GtUdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGX7mT2B"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIeYIL2304027
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGkBawBsWkDYfJFvup28CeJU80F1RrPvHMm0I/iA3OE=; b=m84GtUdNnS3RSDz/
	2LcMPv/qnjHMd6nCe0Plp7P940I5ry01S6tnXMgIIZ4JgijUaB/F9l51/yvhErmL
	6jhZ6DvMjzIPuynDPZzho6V0mFZHBxQpeE93Kc7VqcxQhlyiIoyvQRi972OYZDcK
	VJJYrvTqULfeZB1kkJDlZXcVxgh4v/tQynmIq0hCMrqzY/LXXADTNJ5Fk/ofg6X1
	x5CRNCKDYbgnyhH84AwZPVpa3T7v1glpL2QDk7UtFrq0q9CXcUhewX3O1visyfMf
	A0MRxn2Wlv3wnnHkdGv2/dz/q3vwLF49FCE3uIrR6hQcwuj98I0I9ymPjcSrIAxW
	VV2Tmw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7tp1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:15:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-143803143c4so646525c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284517; x=1790889317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGkBawBsWkDYfJFvup28CeJU80F1RrPvHMm0I/iA3OE=;
        b=EGX7mT2BvBM+UXgiKgeZFwWo/iHbkTcRTY/kW+XUu5KSEH4epWH0qKeH1ZWzSlY9WT
         HvUmi/cB6YUdBZpELmP7ZnYsejGnJT9Hii9sw4p61M/ECNOWMzvvoozJvUy9ThTGDZRC
         jWfZWfVyrf4fRaXvIEV97ZTtiyd7aNz8XbJonc2fchQAOGwpOk+8FUHPqJCTAeFoU95B
         7GvNU939nB+ploqx/8iAF1CAFqky7X+wu/0AQW4gl8M+Jr7HnM866948mSEHngC8vxHp
         kGG89k2DlszClPEmlXNuWtCnq0SCshKAC/tQXrnrk49dCX1zrCzkuIbuvAOD1XAHwHEz
         8l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284517; x=1790889317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGkBawBsWkDYfJFvup28CeJU80F1RrPvHMm0I/iA3OE=;
        b=pQLlIlvzwFCyI/xHEHwegwWW9vmKsbA2ioIQUI5eXA0ExJCezATKDxy5qkgJ4pKZJx
         534nFZ6JOFkLLi/dbHs792xYgFTGvqKKm7/5+Ds/Htu+2+u0KlVlK/swMzjUuQKzSl32
         YOnkcjXv+OuLfdm8eJ85gYxQvV/JytqK6CgdknyNbVBz9BihJkcpKZxDRVxjzNjuaQDT
         sjak62QpCnvrVFhq9dCn4Kxpg+/s/n08XIhfIvIwU5mL+iL9OGR7gZxPODek7zWkKGZH
         ji22i9grUs9kv8Mrf6SIhc/Z5Fe9wQ1RFgnp1r4wYDPf5xEHNvuwKYtRhqmt5LQuu+Ys
         lTyw==
X-Forwarded-Encrypted: i=1; AKwUvBx5L0jTt0V2EToI2ero0h78Bs0CJGuzNILfgZP+y+QJgVDKTmswzDAsfyugaFTyUsvZOxWJamuWHGliI8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lql0sq0IPWnl04+m66rAND3nMN0CbQZJ+Voy2YXSLbQ2HR7H6u
	/p5OM+czgXP7Cj6RWQV+6E/rBVLb2bfn2nxrRO30T3ZuGfDSCK6lWsMufbEE0Zgxpmi0cQPJa4s
	uOSNV9FABmlJzYbBDZJbkavnxxUTltMADorjf1NVueuNTNa/T1s+3c+e2+tCHYmeSgFg=
X-Gm-Gg: AYBFou13OSLUI7KlenDaIUMWwmW5fmlB0XHobCPFVeCAm0SxnKj8/OPTJa1OQoTfMP8
	eru5OO3BsVLlQBLzOBCNAGm9tbo0/PNn2gyqvBfEK+2Mtm09fVaHkzUJTyHjlWQRRP9iK5/VH6+
	gNdGzR8sB5VdNWOH9LCeCmyCkmwr8QzQtCiGHLcYiPHcKjJ7TFGRgZmV+Y3hdlFhZqimLaNRN48
	U0o3HSqMUGZnwTPtk8LTzjQ6DVAQbJpo57FqDtm6eAlJjToAJhxipPkxI2bUj26woIl+OsdyOPI
	xEtAMQAVMKmzEltXe6Jqra/wWcvp7yBCcCVO1Wfgwq7/x7V/usExanBXrdPlx30+jCUkNnRFlqA
	SSJ+eyfPKSl+0G+bBLIL1W4c=
X-Received: by 2002:a05:701b:280f:b0:143:7330:7fbc with SMTP id a92af1059eb24-14503fb7d58mr2637784c88.21.1790284516763;
        Thu, 24 Sep 2026 14:15:16 -0700 (PDT)
X-Received: by 2002:a05:701b:280f:b0:143:7330:7fbc with SMTP id a92af1059eb24-14503fb7d58mr2637727c88.21.1790284515607;
        Thu, 24 Sep 2026 14:15:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:33 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: glymur: fix Adreno X2-90 GMU
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=927;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dqFAneSd4zL7363Qe2/8VcryWwTx+SO9Kj4pOL4oJBY=;
 b=Vebdhc0T+mrn5mzFGJiB8rbqLfgC1XngpTlhfJp4Xocf8bgEq3CCYSI3kLNcd7cYnxbcdvSi0
 6T9GY23MvQZBL0DnKWA447FGx116TyNTUJWbfajiYPcvipqc2JR7efQ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 6keYSgTx00BbJwY5JQPE5qLgzlLhUM1j
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab592e5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX9Ze1CgkG49gK
 4IG9a5L4yn/Jic+IdxG8l+R30pZIYNahm2gIQ3XOov2eqZEACgaCCvFGJtivfv1P0fko+RjO9AR
 rl/X6wsDLkS2i89JSVgqPXQeOmmsvnr1ViSLW/boTvq9R/yoY6QsWvrMzu/KzwwxFWLQ3uGdWW5
 Zaqiudjj9yYddtFUSerWcIPzPj7lFEW5m28wBbAFKLC4ztf2kZtSTEMDbY9d5vPIbBAe4d/rhn5
 xrJDWBVu2khZu0aohaR0mT02O2Z6VTGWD0yoKkBsEp/KeFS+9L7i14Kbd93QollvDF4mhYD7JAd
 y2RNN8BgIPXMQg6C168UVY+VOce5pbT7eNt0+8bIaFUJBjgu7UbKzg7gIbpPsQxVs0weBQcYr1m
 BVkNj1V3CSPDe73Dtx/2LgWQItgnQuCt0u3JjRNLZYyJJLbpkuFyEk4O7xLBrJGlMyVih5RwrcV
 salv0/GFLztbuXpmAxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX4QyiBOPoXeVS
 FNQsdPi0K4oEtwgfBzfjaBpFEuiTK7w8Tnc75zSVN9ZIDCQEEj+/1y7fcvMeS9WyKcuBHdzvOn/
 3JKJsxpZxrFoXL4N+PBH+RVnQonBBgk=
X-Proofpoint-ORIG-GUID: 6keYSgTx00BbJwY5JQPE5qLgzlLhUM1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

The Glymur's GMU compatible was set to the wrong string
qcom,adreno-gmu-x285.1. Correct it to qcom,adreno-gmu-x290.1.

Fixes: b6ff8cec8aaa ("arm64: dts: qcom: Add GPU support for Glymur")
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..29c62118cec5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4286,7 +4286,7 @@ gxclkctl: clock-controller@3d64000 {
 		};
 
 		gmu: gmu@3d6c000 {
-			compatible = "qcom,adreno-gmu-x285.1", "qcom,adreno-gmu";
+			compatible = "qcom,adreno-gmu-x290.1", "qcom,adreno-gmu";
 
 			reg = <0x0 0x03d6c000 0x0 0x32000>;
 			reg-names = "gmu";

-- 
2.55.0

