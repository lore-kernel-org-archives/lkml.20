Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8AF353A6D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369190; cv=none; b=GjWH4vP7C5InsbPmQgwVRXdWJMH1jllpFS0fLG1Gq8MFwwUr7ztiOCyvcZNw5ieZ2pkXYAsWThchPlZhu+eiBBzTN+SY/r2Q1hg/H7Km7KCPdaAvnGBRsAwcoHMXem2jZtSzvM7VV8fkhSWwKzDpcTut82NNcO3swrsb3D+PFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369190; c=relaxed/simple;
	bh=x0vJnkEfpKaT9BhUG6vVeYfLAOaULge2kWrXrFOV0t8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OJokkTVD1nAvDvHC7fG5g2FBrZx7J2RqdJ5iUZryKNjaf9GHCA07u0tD7dpX3Edsu5ugEL7lcFPu26tp18PnSj1O46IJghP26+1OTUYNZPg+xXP7uewt7d7eKK1atHkhvVrtbXSsmzYGy8N5m61dI0h+UE0qTlIL6CM+RM4oLoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIS2LRC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWgjk4zy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIS2LRC7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWgjk4zy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jeds3843056
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GRaM1xY5vWZusktj3/85Es
	bjVq+U9RR4nprtasfubeo=; b=GIS2LRC7D6u+Us4bNQ9cQP106RIFMu1I9fuKT/
	HMEteof/67JXWOZYVrh0o79dldOPmtMuqp2AHB1L3upyB7+k7M3U21kf1RAkOzLM
	ygAHlrO9hKca+H3kO0Zp1N24HnfSKiJyNV91Fw4tgSJOTk8r0p36vdJ2KMGRSKwM
	O7yqSp3RiG2Xh5kOil45BDhRUjYsvFsAuqKwkpDRXUs1/+13topn/Ff57BTecVrE
	HLWdgRhlk5JwWK7llMragIKBa1/OtWCWNY37Rltwa/Q+Jwoc6ZlSlH4OeEgFAXXh
	fttIek91VyNuCDedxZ5BnVdseijm8f5FWcRO2fm+Dr/1CRbQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5e8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:59:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so4877376a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369186; x=1789973986; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GRaM1xY5vWZusktj3/85EsbjVq+U9RR4nprtasfubeo=;
        b=PWgjk4zyQt3+7psRoFRrtWwugH/g7UKO/lZ3gVLmjtdT8wikWVBDUaufGwxX/i8ljp
         P4jVZ5EObkejf2sbfR3GlaHqCtPpbnsiUgj88dBsueZ9vxc+Xx34FG5PVMNwcWEQI1tK
         GhHiPbVW+pGEqp6GxQW2zj7NJsUBO5ah+E1sjHvMHn9PFQacaNo2dveJ9wOOUhBG8wcq
         JhdfgBuNf+jvN6nu/SXEt/0cHZcqCHGkG4j2wz6WHSEa17gtR/9UfW3Mkg5C1HXgTVSg
         xs2wPT10xaMXF+OUlsHKtoP9wJzKvws9yUHT0gmLTrNfJpFR4Y/ZlnM0XOuO4CzEXqLU
         0nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369186; x=1789973986;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GRaM1xY5vWZusktj3/85EsbjVq+U9RR4nprtasfubeo=;
        b=By4EFZ2tLEWh5uFhhKSwYQEebaI/VKpdWntztHdVsJYMevqBWYr8a5Pw6B/3GXwFv3
         wSZhXa4QlO+vmMCmSMrvOzKefCG/myIyN1r+zwtKJdaA+dG9evll0lGqKIyH0KRWEozW
         we7YBvZJXrhMaX7xJiw0LdcILruMhL5fzAZ7inP9mgm6ZNLSHsYKtS8rbb1h0J1xDRWF
         Gz20F/qd52aiEU7X2wrKnu6AkJ8TQxidBIwmvqAO+1BQ89vXpDSRpP7kjxA1OMgpDnNF
         ON7nmufXMVreX2QE9flro29e8o0b9FP7jrrA/kPaN4it61vXfLK5hGU73wwsafbaZwYy
         oDCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMwpjsiXHBCIEDmsveg8lYP4QhSTeQxvsDiEzZXVR5g5AtWRKHMspM3fzT1qq9NuFaPpnUMXre9nKfrLY=@vger.kernel.org
X-Gm-Message-State: AFuF++mjRpfFvXHqLvpwOgDBmGSI/Atom1cMj6RUT1kU/HOzabMUVRvw
	kyjYXxC6h+cQhY1dJem7bVeSJV29Z+njjJCSek3Eqcb1T+E7404pmsm2hYnWu0jDLOfBeNv4vKn
	xwieGR7k3I8SzPEHO64Z3UuW1YM65Ft1OEI/6ZgZmAIg0+8/uz47ma9ka9rvQoexcQp+c8WAW0K
	0=
X-Gm-Gg: AYBFou1Rq48gMzAIVNsjx2Fi9MPhhmyCE9qeq6kqsexbNriGutp0EqC4KIAdRYPW3dn
	TCpfWQh/InZxw6QnhqZiNiGSPFBOJp5MMVRdhNN3QsvW5zGirg8wPn8hZVrpIUWiBzSlr/NnPM9
	FlZK+l/coBBCaCK0YOwy1M4HW7BC+x8ZXZbUmYI74VCQbYZ8Gb415J1ey+3EE1z63HpDnGCyYTn
	izHu59gXEWTnlzWDKNLbZbDZTfNpwtT+fWqfBp7oKrSKAlwRCOOuHIJ3JwiR/ywmcFSzjKFCWxn
	77XLM8rGvA9UDcpsd1lKL7K+ZFusvS52Esa6rgQZBc4PltXawFFYBV6E+swipbacsZosQ4pRMtx
	rPV4sZj8EO9tnqZxNjXizvXQs2n5O
X-Received: by 2002:a17:90a:c2cd:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39df2a10424mr440180a91.15.1789369186348;
        Sun, 13 Sep 2026 23:59:46 -0700 (PDT)
X-Received: by 2002:a17:90a:c2cd:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39df2a10424mr440144a91.15.1789369185906;
        Sun, 13 Sep 2026 23:59:45 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.13.23.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:59:45 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 00/31] Add domain idle state names
Date: Mon, 14 Sep 2026 12:29:32 +0530
Message-Id: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFSbp2oC/yXM0QqCQBCF4VeRuW7A2SS0V4kudvWkI7XFzhqB+
 O6tdfkdOP9KhqQwOlcrJbzV9BkL5FBRP/k4gnUoJle7U93JkUNTljvYss/g6B9gab20aBCcCJX
 jK+Gmn1/0cv3bljCjz3uJtu0L4xXAx3YAAAA=
X-Change-ID: 20260913-b4-idle-state-name-18a18e4eb211
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=5551;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=x0vJnkEfpKaT9BhUG6vVeYfLAOaULge2kWrXrFOV0t8=;
 b=/6liIrO8KnTWTvi/M/0OaVknL2ytpH5XQC9LLl5mIZSp261QPwuuZAy9w2e94kGIWTgz4pz8k
 p2d71F1IiE6DEi3EqhpvetQVI9EU0fDtplDHCpH1cYxpuRX9Kdm0u0V
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: hCXBcsoTtUn0nBtJf8nDfZjMmqLYdPv1
X-Proofpoint-GUID: hCXBcsoTtUn0nBtJf8nDfZjMmqLYdPv1
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa79b63 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jFV7RcXvLLdWMHSRyDwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyLPtX/5AwbAh
 4SY9C+axJMaUKIEXanbeg8vrZ/j+j1IhPKxthy9Ju4mcxdlHKGSp1ZtbW3kpgqvgxmCSKDasM01
 2wU4E8wDamPj6MCGWcjbUUCvY5JfWWPBjZOxxpt8SwrMwsUN6DtAhK03nuKsWKsPNeu12LnvVKe
 1AhTCknSzFJz6Lgl4DrCOFEr0bdquSK9ai1jRRMeGJm8nLoQOjPGss2G0MlYt/ig8RlOqqnF3Vc
 +BXXsuVqY9jzkGP3636iVCSYN/9sfpJf0D0Yl3CsNjyIHr8+wQ/Ai79Tmup1O4BmXX5Dg0s6cD0
 3lDFjTT2hf9n+RUkQUyJOx/gtDX4jXKj/DVAqqxmGT5IEZv0R0huvhG1dnrf6bJ1pon0ccGb74Q
 ZwYStyLxDrC5Q0o7A8kXONosO1mxddmfLSh8sHFAiDI+XfBK/JjbapkJlR8S0d7NxiEpW5IBTXu
 K0EbNzt3dLfc6p2yhCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX3RuW/A+fXBHA
 qtFRn6T0LFeu+4c2efpCEvEwggXTlAKfdX0JS3VDxHUOw9BWJOLLZyBQ/z3ihO5M7RcbX+nU/8I
 biZljFcYrsH0NH33m2m2bSWyER5mJDo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add or update idle-state-name properties for Qualcomm CPU and domain idle
states.

The generic cpuidle parser can fall back to the DT node name for CPU idle
state descriptions, but genpd domain idle states do not get an implicit
fallback name. Without an idle-state-name property, those genpd states are
shown as N/A in debugfs.

For example, before this change a platform may show:

  # cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states_desc
  State  Latency(us)  Residency(us)  Name
  S0     5790         6118           N/A

With an idle-state-name property in DT, the same state is reported with a
proper low power mode name:

  # cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states_desc
  State  Latency(us)  Residency(us)  Name
  S0     5800         6118           l3-pc

Describe the affected low power modes explicitly so the CPU and domain idle
states are reported consistently across Qualcomm platforms. Shorten
existing power-collapse and power-down names to use pc.

Most Qualcomm silver CPU idle states do not turn the silver rail off;
they collapse the CPU and turn the PLL off. Name those states
silver-pll-pc. Gold CPU states often turn both PLL and rail off, so use
gold-pll-rail-pc to reflect the low power mode.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (31):
      arm64: dts: qcom: milos: Add domain idle state names
      arm64: dts: qcom: sm8750: Add domain idle state names
      arm64: dts: qcom: kaanapali: Add domain idle state names
      arm64: dts: qcom: hamoa: Add domain idle state names
      arm64: dts: qcom: glymur: Add domain idle state names
      arm64: dts: qcom: sdm845: Add domain idle state names
      arm64: dts: qcom: sc8180x: Add domain idle state names
      arm64: dts: qcom: sdm670: Add domain idle state names
      arm64: dts: qcom: sm6115: Add domain idle state names
      arm64: dts: qcom: sm6350: Add domain idle state names
      arm64: dts: qcom: sm6375: Add domain idle state names
      arm64: dts: qcom: sm8150: Add domain idle state names
      arm64: dts: qcom: talos: Add domain idle state names
      arm64: dts: qcom: sm8250: Add domain idle state names
      arm64: dts: qcom: sm8350: Add domain idle state names
      arm64: dts: qcom: sm8450: Add domain idle state names
      arm64: dts: qcom: sm8550: Add domain idle state names
      arm64: dts: qcom: sm8650: Add domain idle state names
      arm64: dts: qcom: eliza: Add domain idle state names
      arm64: dts: qcom: agatti: Add domain idle state names
      arm64: dts: qcom: lemans: Add domain idle state names
      arm64: dts: qcom: monaco: Add domain idle state names
      arm64: dts: qcom: msm8916: Add domain idle state names
      arm64: dts: qcom: msm8917: Add domain idle state names
      arm64: dts: qcom: qdu1000: Add domain idle state names
      arm64: dts: qcom: sar2130p: Add domain idle state names
      arm64: dts: qcom: sc8280xp: Add domain idle state names
      arm64: dts: qcom: sdx75: Add domain idle state names
      arm64: dts: qcom: sm4450: Add domain idle state names
      arm64: dts: qcom: sc7180: Add domain idle state names
      arm64: dts: qcom: sc7280: Add domain idle state names

 arch/arm64/boot/dts/qcom/agatti.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |  8 +++--
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  2 ++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  3 ++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  6 ++--
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 11 ++++---
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 22 +++++++------
 arch/arm64/boot/dts/qcom/milos.dtsi                | 38 ++++++++++++----------
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 11 ++++---
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  4 ++-
 arch/arm64/boot/dts/qcom/msm8917.dtsi              |  3 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |  3 ++
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |  7 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 11 ++++---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  4 +++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  5 +--
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  5 +--
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  5 +--
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |  5 +++
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |  4 +++
 arch/arm64/boot/dts/qcom/sm6115.dtsi               | 12 +++----
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  3 ++
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |  9 ++---
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  5 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  5 +--
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  8 +++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 30 +++++++++--------
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 11 ++++---
 32 files changed, 162 insertions(+), 94 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260913-b4-idle-state-name-18a18e4eb211

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

