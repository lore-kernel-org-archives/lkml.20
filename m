Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431F517BDE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547859; cv=none; b=lHma9RXq5P7jOwgzitIM6MZ3xP8buOoqdVSymCPpNR+Z68Sziczd/RyZjWfySbvfJk2B661JlXvhQj9k/fsxaCtiofXlJ0/ZsR8O5YTZKWLuilhXsR3CBybHuh6SFHTlio42iQEkJYDaFMFAZV5nmb5NWwph6IcnshYOeZBeZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547859; c=relaxed/simple;
	bh=Vq/wZUjdUlnTEU0Qg8+Qz6QiPaIIx1/+oxRf0UA62M0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HrzsW0w6ZpJfq0eB+oX7Xh6u6k1DprXqxez9rMvt6S8Y3HNtphz3Z0jXcYjzkgGec4DxGqA+7qpILVsMLIBzNP7NwdYCv50oUuygjWop5WnflpdPVXKJ6VHf3NrOYhWFAXCPsuWyK8PYa3KhlbKpaW8AqlGmUFzT4H77u6fAOHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXTQkw4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFB2c0Db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXTQkw4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFB2c0Db"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHkvN3521567
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 18:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2itY/GTJjZwz0D43mAqqG2
	w63oKoNkuiN7PiSrRJ2vw=; b=VXTQkw4+s0Hj4CRl6etzx27xTkHhF2N5MShgqC
	kD2Se/OcNaPLOWDfODY9PaZyArN+7HR+FosvPKMfZz/BmtrV7NUQuuFza4JegGrU
	HfiydMMwbIl1a0wGh7hRHJdr6PPg9BuE1BR1huU4pn4PKd8Wo6UCficHcEluwqxP
	P+lXFI7nlZoojZ+aOlN+iRVu6axq/Fq+7rP8mC96n6gmOih9dOBEddoj0cykMvT4
	g4N+EbVPlAUGOssHZGdLxDmJm/yDG9cG96o0rlcIYqHqPw/bHP3vsCg+yaR6GxW8
	J0Gk6NqFVM1RprOug8t9I8LBc9pEzDi4uD7praP0taKYJRMw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg010h65s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:50:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso2260701a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547856; x=1789152656; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2itY/GTJjZwz0D43mAqqG2w63oKoNkuiN7PiSrRJ2vw=;
        b=gFB2c0DbSUWw+gD+PmwKLHvPsuxsm2wfIOJ7eHG4lamS0PNT7EelWnpk5Hs+mKFeQo
         xd5cwcujQ66t1SoLtgHoMxrHqEt34xgz0go24V9i6HtYPoU1coxOgMZxjevu0CLgxVVs
         21FQ1ZPOpmCpZtdHlQ/kibCPQFwZz1JFbG2rkq44LGW9p/4yUR71jIWX+udSRbBoUVtn
         dOF8jP4oH10leEVAS1S0yhMT5sOxgVLpyPAHqKk6WqvmtugKzL9NyHSygXOHXw1QhHWt
         fVvyDzP1wOOKAkS7K06yQlri2GVxx/EGG2OMWqzlF1ryJt7U66A/hoRJaycxULjUZDYF
         lFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547856; x=1789152656;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2itY/GTJjZwz0D43mAqqG2w63oKoNkuiN7PiSrRJ2vw=;
        b=MjT5/+Z/n9cciqJwDCfg3k/z0XB4CW75Rvibf06Qhg9MQT4zeoGa6XcUvPKiDag7o4
         QiSyr42Lbfd1AnGQuNfTCRRrviK6QYGUYrQ/Lx1VpR3eo8D5CL7FhMPaISvhWDOdwxPi
         mxhi4isZVcMxLKG5cFR4Am0kAv3U6nGKc0jQkP8QgFneQtbVvLco+Qlu3FwCW2JHMdSL
         B+vikpBxtPDeLentzlaICWiIkJtveOIZfXJN0GbV/+UqxbQiJDCPlRA+9TGnvviR3qce
         GW/D+51+SXpc+tvK8aNVXeyvpDwQGcKJuG9UqijIYx5IXdn8WEgzJToi2yIkpEkr6fxn
         UoKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7mihR9twEoKncv7QM4x3bX54q5V+CZZg8LRgmEFhgVVkqQpuOsAcAGE5E1//XzC4f9bDLql43hIqH0rU=@vger.kernel.org
X-Gm-Message-State: AFuF++lYZ7Kl6MoF/Co35ECThmKx7i7s45qTsZpCgrmrhlTH15Is4H34
	9H0rEfvzQ3owPAvotqavJlaqk27C/v4AhlDdn5Uq6PpCZf2ASdnlzJJ9KZLgu+w7suSj0JMNQTy
	zwwNyHU+fgYkKlFxsjPysTm/m4U+cyiTfD3fclyNzu/7LO/ut8T4kJUJ0hJLju5sCKvk=
X-Gm-Gg: AYBFou1kXTGz37wYf57j1If5KtHKZQC6q2QA4wiHiH2aVsn85cwXOIfEbxViO2sBANQ
	Nkgfb8RC4R6AbpHcmorkBym9EyHReHfIT5deM3qyDZ5+OtrmjLh/QrwWpWUnTLOs/t0Y+Cj8MoY
	XGascpneTsMl8uxdbXdxepcBH23r5OVBDTWBXS0Urmy2kvQyFrStLkQp7rF4ZnwXrpQjaKPaSbQ
	a82GYhzErQl2pnq0KB06Kk6Ehr4Atmamtmz9WyilPmLCbNkxdaFXrItxRwvjqfbkFlBjnfys5l9
	U4nMBuN2sHrGrsgJ2qXnAconhk6zmUPmnGEVoLGA9BhUw60vsbGSgjysWK13z2gCLeCViSwYhLO
	sgk2ZhirjuzVUveHMMIAiPITe/Oe8VcE=
X-Received: by 2002:a17:90b:268d:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39b261e1beemr12469948a91.16.1788547856173;
        Fri, 04 Sep 2026 11:50:56 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39b261e1beemr12469881a91.16.1788547855653;
        Fri, 04 Sep 2026 11:50:55 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:50:55 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: glymur: Add rpmh LNBB clks support and
 update UFS clk ops
Date: Sat, 05 Sep 2026 00:20:41 +0530
Message-Id: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAITm2oC/yWMSQqAMAwAvyI5G6ilLehXxIPUVIMrDYoi/t2ix
 4GZuUEoMglU2Q2RDhZelwRFnoEf2qUn5C4xaKWdKpXBfrrmPeIeBP004i8JWqudIVs6ci2keIs
 U+PzGdfM8L1yz6EpoAAAA
X-Change-ID: 20260904-glymur-ufs-clk-changes-55264e596e6a
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX/pSDLIsfzVxx
 /xU42laN4bFS4A7IhomPanGyVud1dhyUEvPQ2ghfxhko2lbRK43sLu1LVepR5jkJngd+o8ziA9+
 tXIyZAYcBWw6gn2MDXVHCIWX3qlBFlh5PVWnW9USeEZDkZsuKzrfWDgm/x2NmwC3krJ0fGzJ7us
 lqIX0p+/iMzH5S9hpuSj5x1q/0VX7PIquPz+HNlv8rp5rG+zhDcf/VqTMFy7XE2/SmzD8XfGESe
 xHb0lQOssUFNJprya9F/PoHJyAKp1T1F+6L0imgI+0C9tKsLPxrxMCjPM31vgGNx5Ji9baQf3Q+
 RARwW3n7DBsGF9wVCj22Oa2z+qcyLuoRSkzCTw38m+4kri4Y7c5urWya3D3v4m4rxHg7gPz+vnB
 CWjH1e2kykUc96eKLeGMlFitzCyro1bGi1tUrk6dCAi+9mIoLh3Xk4g6mDW7nR8GjPikex95N9F
 nuTGJL0dGvSld5mEo1w==
X-Authority-Analysis: v=2.4 cv=YNavDxGx c=1 sm=1 tr=0 ts=6a9b1310 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aGb7rr2t1h3agrlECr4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: l-Qiw97xDfMRuBH5QLPrAbfiuCaMc5G0
X-Proofpoint-GUID: l-Qiw97xDfMRuBH5QLPrAbfiuCaMc5G0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX/A2i/Q/ZL4/n
 YZhKgx1RtvO/B7eyexabRiV/xgQIs3kwIJcf07Gj3e8iNfxxmMSS2oI0a6tKrgF1/RvHedY9zOi
 E2NVf4Z+WrvDTV/UxkaCF9ttcx0XOkE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040172

This series adds support for rpmh LNBB clocks, define TCSR_UFS_CLKREF_EN
and update the clocks ops of UFS muxes and RCGs on Qualcomm Glymur
platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN definition
      clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
      clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for GCC UFS muxes
      clk: qcom: gcc-glymur: use shared ops for GCC UFS RCGs

 drivers/clk/qcom/clk-rpmh.c                  |  5 ++
 drivers/clk/qcom/gcc-glymur.c                | 77 ++++++++--------------------
 include/dt-bindings/clock/qcom,glymur-tcsr.h |  1 +
 3 files changed, 28 insertions(+), 55 deletions(-)
---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260904-glymur-ufs-clk-changes-55264e596e6a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

