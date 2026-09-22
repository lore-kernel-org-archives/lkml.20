Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877874A64CF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073356; cv=none; b=T3v+rGym8GflabV6v2RJSod7K3x/rc6i+t2Hd99BFpffnmV4Jpz9tI2SnLUikP7dIIAf9ULOXiOpotgt5Iw4rzqf31yLK6kN5H4rMg+P8xl8H7VQyP+wIBCrgg5uWKkjGEPFnvv7Q/edAsj4L6CXBjLFlBrZQW/jFpwyFfrSTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073356; c=relaxed/simple;
	bh=Mvw+mz3TiRsfwyViAQJbW4R5ZZHYd/J+NN8QTIyhnXI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hKIwD97r5RiPVIbWjmjzjU/4pMTIH0mKCXLIBQeRly0ymVvmPeWh9s2XxaSpKSml8pNL/FDCrSDEUkGATf/QlRHP+4sVMTQOUNc8sWqpdEch5P03vOaCAuBRUCbzBmGK1f67qYRe1zko6fVVpF2p0BcbE3D5PHaE6CyMPTh2WvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nCKMyDf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VikamvTa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCKMyDf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VikamvTa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MA39iK801553
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3hthntNm7rFPDf2HjRIYMT
	r3y/4QFrx1GbDOB7/vD+I=; b=nCKMyDf5ZRAvq3Q6K3N6BzXDpi7+fIRtG+FNBf
	DARx1XXgz4qWvqB1WX7KDGCWaCesHAohy2V6p56ZMnXPhQ+OMvnsNCJexC66T89I
	A1SauqPT9KPwISQDVpBxt2d7wdNHWlfm/ulIAcxIahh5j/8sitgMlX7aLlC5LhUS
	s/GgBqTSPNu+hMI6m5gJ5IlsKiyJeIOm/BC5I6n1WQcLKd6sNWUWH5X5NvYkNXpV
	ytis3+gmYIYnfhq6HC5kc5apBMZeV2X66Gn6gGwJNsrWpQwoOoWNp7Jcw70zq3CG
	sMzGyDp1jxlK8EEJNJJVxiwIke9N/ipGxnsowH6YPhfgvQgA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4r48n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:35:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396901263b6so6985542a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073345; x=1790678145; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3hthntNm7rFPDf2HjRIYMTr3y/4QFrx1GbDOB7/vD+I=;
        b=VikamvTa/oA14LA3t3/ssC3bixZTtYSqNYD56rgXla+xIKHFMg9oafj+21FlMIkPUm
         0x1rOwxfc7rKYIAoD2pjZW+BsbugZ9BQJN8dJPcwfTOv9nUDw44EeoXSv2/z/EW9RF0y
         o5PYuu/pQN5m6cpba9GkuCGfnW0xMrmIbpNAkUTvM/doyiHCkDBsjVZ0sMN+A5RigTEQ
         4r1CQ3agbOhfBU9SsJ18TJ8bijCxTXKOj/Q7+9UwhiTQzqIhKT53emxmPboFf9Owohl4
         Rila9bXR/YRB6Tk5ZTCOIVV2u0zI1tmazXZJ+s0NVQwoUqYLMTZTfyAO8+Axqb0ymh7R
         mOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073345; x=1790678145;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3hthntNm7rFPDf2HjRIYMTr3y/4QFrx1GbDOB7/vD+I=;
        b=LPWTPnDfk2vZNYHdKLVz5GdTb8HfjKdF7iolk010tEGYAE7tqfTZHmFgQM9qrXdsFg
         cpzQpgs7Olp9ZEtekGAngBBJ1+6xsRz6CGQ8y2W+zQu7O5jnjfbcx4/Ttesr41QiDsqg
         X7ZWD77gYzMna0TbuycAw3YJ3315Cl12Sx22MfD4F2pFP/N8x4eyqFf2eeIcp9lBrXGU
         4PC4dPL+njFLP41D1l9usZdjkQiyZOJoYNPOZNWh4e5VR2Yvaxll1LrpiU/qIhVwDsvP
         65xQrW7+0zsxvB6P7KNVNb7ONbLIIIgr13rtbPDNVGf8YnV/saHQuBstNlicdY96LEXI
         fKzg==
X-Forwarded-Encrypted: i=1; AKwUvBwjkEQ1ZX94p1Aop5ViNXLMWwuDN5QPLvdfrBuIOUb7/hgIukJawQk7PDl/kIcMjrYB6TjTSw0LGl0hfSE=@vger.kernel.org
X-Gm-Message-State: AFuF++kBTy2SsJz8jo7mdWB85FoOhpbwQ/BGgGQ9OtRrpap2DProuXtT
	gojQLZmn+jW8qTdG3M9Sx0rCgMHTSubI8gL9hwmbCPYgRRIzIhg+6RyJmdJelbCgusWmKtCRDNL
	5ZxlwUVkFsctnaaC9JqtCTcHK8wwZeiLE9cUVYBPpVCTPLCGJTYuDzqmgeSjGrwzUMj8=
X-Gm-Gg: AYBFou15N8KaJRmW7tu5prUIV+zWJOheDpwLRY8+B7GCWXecpWQDGHIvkU4f43cspwZ
	FMPux9FHqg64AqrxVWyI+oVsjkw/dW5ppYZQoQiuK01bH9w1fh/OtHNGg5NjkW8akWS+brgjqf2
	A3cU7jYrWteZZXOgGtE3dy0Z8XH9EPdiych7QB3RlEA9/HzFTLQsTIauu5vmjuNUBOjEV/gfPMt
	IUc931yYxVE5IE+zRcTclYy2v1As1mpvITayytlg+vbwt9QKZRyKhkPyRwPsry6/CLUBX6LUDDM
	tWnfM8mPjviGaJ13L6h9f+oOCbkhSZAofNJr0v30JyLD9yE3OUVsWvGLUIMlDTZIU8pgCiMo3aN
	pb7x7iXyCz6Uv6ujYjY4GgmjEsgjBG1fcXHafxBeTTm8VgcYCIEeiW4KLhw+ovuM=
X-Received: by 2002:a17:90b:4cca:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-3a0730988bdmr742294a91.1.1790073345393;
        Tue, 22 Sep 2026 03:35:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4cca:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-3a0730988bdmr742279a91.1.1790073344913;
        Tue, 22 Sep 2026 03:35:44 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0699aa221sm3670692a91.9.2026.09.22.03.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:35:43 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/4] Add ETM devices for multiple QCOM platforms
Date: Tue, 22 Sep 2026 18:35:20 +0800
Message-Id: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpZsmoC/x2N0QoCIRBFf2WZ5wZUtqX6lejBxrEGdDXHIlj23
 5Mez+VwzwbKTVjhMm3Q+CMqZR1gDxPQ068PRgmDwRm3mLNz6ENA7hnDkIkVY2mY36lLTYwvKhl
 r8n2sWZHscrxbmueTiTAea+Mo33/tetv3H45xCWB9AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073340; l=2208;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Mvw+mz3TiRsfwyViAQJbW4R5ZZHYd/J+NN8QTIyhnXI=;
 b=ESiPGaZ/YCaICmlWizgbKhp0mGiUbEEzmee03ibSW6mrSYHxV7KaDf8IMQfvP8RGRnoTVAeiU
 xJA6/ubJWH7BEG0nW0AGELN/6ZKxkqqkc+PLMPvY+7s6GJZcM603WBy
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfX76ye3xmeODMA
 gWvncK/zUIgjzgQfBunJ6DTv9ZAY42ugIpyBQRP009JiCo+nKs2bg7fx8v3/Pq13U/5eAB4pu0G
 XhntJ2dnMW0LhsnDbV3npNOjO6vzuvTWjZq/qrJucRXUqzK4jYZKdcfQ5wSOslt9Hx6qCoEqtvl
 +Ds+ElbdEoKZICeJg5fGMjszQKv9EYRRTrCvPQmaQ5Cu7t3LhDY3Yvi4y/hF1cV694rGlDLeXoy
 0z+VyKAhnLcSQHV6OWXWtACwDM1YfXscLAdo2hXePQlfGBbGObssWkDi0VQaWvA2bLU+/TWxgKZ
 CNngFn7kTMwcdq0ZZqVmUYXNU/dIBqk2G/2+4fmDwtxTQjClGaXYYvAgZds5utajvDl4KAFgBqu
 76dV5WiboLG+TB0bv7+6xyXCvheUSY3a3WaQKe9tJ5BVLFkr1YKyp0sniI/bqHaVmNYtwGFWOYN
 TpF8tUn19QGobPcM3xQ==
X-Proofpoint-GUID: 68ndk5nEYwTIiccQ2BTQBw6DML3H5xtc
X-Proofpoint-ORIG-GUID: 68ndk5nEYwTIiccQ2BTQBw6DML3H5xtc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfX5JFqka2C3bDl
 B+Ww3XtqNGLD4WOL47UAClNfRtibv4zIh/oo5j/BO35MGpMKNCiBULx7p3hKjR9zxcullWzWfTF
 sli2PeBxuwfhy9Rmg+MXMgdgxsE9aro=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab25a02 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cTPyU1gMRTErOVnJLxIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220152

This series adds CoreSight nodes for the APSS debug block on multiple
QCOM platform, covering ETM, replicator, funnel and TMC ETF devices,
to enable ETM trace on the CPU cores.

The replicator, funnel and TMC ETF nodes in this block sit on the CPU
cluster power rail rather than on a dedicated always-on rail, so they
need a power-domains property pointing at the corresponding CPU cluster
genpd. Exercising this property correctly depends on two related fixes
that are in flight:

- pmdomain/cpuidle-psci: Fix behaviours for CPU PM domains -> applied
  https://lore.kernel.org/all/20260914150146.187622-1-ulf.hansson@oss.qualcomm.com/
  Without this series, a non-CPU device (like these CoreSight nodes)
  attached to a CPU PM domain cannot wake an idle CPU to power the
  domain on, so pm_runtime_get on these devices can never succeed.

- coresight: handle runtime PM resume failures
  https://lore.kernel.org/all/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com/
  Without this fix, CoreSight ignores runtime PM resume errors and
  continues to access registers on an unpowered device, which is
  exactly what can happen while a CPU PM domain is being woken up.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (4):
      arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block
      arm64: dts: qcom: sm8750: Add CoreSight nodes for APSS debug block
      arm64: dts: qcom: kaanapali: Add CoreSight nodes for APSS debug block
      arm64: dts: qcom: glymur: Add CoreSight nodes for APSS debug block

 arch/arm64/boot/dts/qcom/glymur.dtsi    | 1184 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi     |  884 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi |  567 +++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi     |   16 +
 arch/arm64/boot/dts/qcom/purwa.dtsi     |   12 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi    |  599 ++++++++++++++++
 6 files changed, 3262 insertions(+)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-add-etm-devices-for-multiple-qcom-platforms-c165b1c4480f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

