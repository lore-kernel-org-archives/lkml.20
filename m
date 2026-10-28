Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183910;
	b=bre7+Bt2islk+7TfLwBDGjDMrnnRvrTXS5kaUmgz4vAfhsY7EK8Vbg7dy5jTBt1L5Jfh
	 bbg3+KC6pramHJVYGqFBqGL8vNObsN01DHuGK3TgcRw0Mp88aVDnXzpY5l7XzqyfcTdVZ
	 7RZGk0OoYDUnLzEyee6rsoXWXp1W0s+Pm2/rvVYGfSbMEyv/qRhLJfCPmhYD6RSNCgC+l
	 F28PjW5mXLsvRzjMknaEV95tOYyuS6UDs9NyVqtWaGxOsmMYbwjdCQFd4DIC0SC9r/XVH
	 g4XP8ZkFNI0vcGXyWiYSZagdmYs6RudSPc0HwP4xfCEMzp4S7Oox+kW6RkcpfgN+Gqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J2bm/qDTgSxReYWyWffqNNipT6wXNIBYCGlOnXmCCs0=;
	b=CWSX/TYCWxQ87CqPZvePrjpLu3bZFEEt7vhlfeLQXpj2lBlPnxbwGhcLPnF7jann+dr9
	 n2+tnJRZMUNI9JicJPcqC2wZnQQBNgfKmDe4R8mkbCen1ObST2z9eRASvoqHco3eJgkhc
	 yHB4zqmGFy/7WQ5REIgDYB4wGq3n8N1hIM64FqtKDm7Di+GI8UiYdVTatlikEp6wwRxIR
	 zzUCLt19I/4wx0pMC33c4H4W9Jn5fmqplamNC1alrWBnWr6aI8ocxjlrJEYiwS8eMwfGv
	 0lGpetD2S6CAWG8mV5r55rsdxDDAihDA0ZktlWZuy/mAxhqmnjPHuaPHeDG8KIK208g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2Z68TzA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFoSepn6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB58E606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB58E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2Z68TzA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFoSepn6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K7QY253360
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J2bm/qDTgSxReYWyWffqNN
	ipT6wXNIBYCGlOnXmCCs0=; b=T2Z68TzA72krlfPT0XfUS1avcntHxaGz2peDSr
	1Dw625Kvaf2KY0N4Ya4yBlQaYIH+iRwwUWsXk/7P+IiPLejLV2d4KP4+OFKdEteq
	ifD5mK/OE+/d38vpYi6aHcTyyldqkXYS9OidOe6Jecxsvuv+CKnRtTAwkNBRPGU+
	7E3aDDmN6RCfreeTrJstDMpQa6QtHSL3PHj/bZ0pQQSq3cEgf95Pcouw22zQNJ9q
	SgsNIkPx7g+4AhjHR/aCaQ0D11tEmV7xHIB3r8lmWlOqSH+2jXhp1esD2zZKMX1Q
	C/T0WnMA4DvWBHyVWgBWjMKIn3IB66+hKVaowRt33WLV/+9Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be219w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so1778907eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183907; x=1793788707; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J2bm/qDTgSxReYWyWffqNNipT6wXNIBYCGlOnXmCCs0=;
        b=HFoSepn6Lfggkdj6YRqMqTaTqQkZIs5t5HzSSuDzAz3UIo08VcwJZxAwpvNhQoSLvD
         3NxDXafjcvx4UCyocfXdFXb1aULf07oAIW8oPzZdVhajgOkDxAYybok5I96GAL40R4W5
         9M4wy8MM33GRlliEoQTtd5jcFGS0BceczF7c7OSnM4Q3HT7hNPXx+KWvUvC9YsMAhJ15
         TKPMGYTZc50A+TUDcKI31dBrwAID+iiCUDGFDtU5k9YLZfmosgeFQXAyHqQAd6niPEji
         e1kdIFTuiv4wvSpc1zaIfVbPiNvLNqKk1FlyePqq7vIwh4923OvNh5OT5AAMT9Yd5+cX
         +Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183907; x=1793788707;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J2bm/qDTgSxReYWyWffqNNipT6wXNIBYCGlOnXmCCs0=;
        b=WjZ6jYS4zffWTl99Voa39mU6OUTLSt3i7dJreYYlHYQV2HNFndREWm54IJBuRZsQdt
         zC9yOYdTXRGDeLhJIcbXAZIAf5dZZgO6SJI7rQCCV2CwebXMom+x6BlYSNGZrchKcyiJ
         64I9yUBQE4eai5qPC8v1zN/3dAxvV/dpUgmhMhj7rz96h4uaSLPaKSYmb6V3tQm8ZAEn
         ZXcnO7mxr1cqwHMA8GiQW6waDTi6UqhzHzIwm5ZXtMHo0aRJXogBYFSnHYDJEdfNf7ju
         zwglOI7xSfmu/uQhPxlX5siNET7Zm6sGuwUqod4l/JYff//2d1SQAsoMzNaqbcD97juq
         xOUA==
X-Forwarded-Encrypted: i=1; AKwUvByhjJlFWXDwFHAXJ59pbgj3sP8+9MpO1SFunansqhpqkfRGOKGR5hzPSiiHb1Bn8/dz2oS0qfHcyZwXquM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL67R2bn/zGDW/w7KEmg89zR8/rRAodKJVELmjndXrkusPUEadQ
	pPtkqZimZ8W+gdd7m15RMnyzgOvnJothbxkrI1oMscuHQJcv+IPIDK2Ji3T0vbheqJpjBP44Led
	Gi7lrn5M2Bz66J3yWbJ8OOXwBnhsOR8k33i1Jkux5QZQhENrWnWThGob4Q6XSZ3NAScI=
X-Gm-Gg: AYBFou1LRUJdzql2yPJmkR1ksA4nXd+uVJgzGzX5U9HJCCBEQYJRcPlRpbsLLRwy9ti
	QwMSAEbcFgtP/1/bpjERb05jEVU5GGb0z1IM4C3y1dT8rkvXcO9di5EqrmDmak3npuDrwkHGaA5
	2rH5f3MbhgXnyh5rfFrofau9mC8u7FCbaS0DS//pZjlgI+ehSuLwLYbtD0bgXRxrkJgedy8McGU
	J1fMt/r9DSnDlMv+8PdG/vxeUAP8bHECgwpExEi0h+3djfCk+O0xoTrBBn9fIW+7Q4fkFXt3KBS
	9K5AG49KLY4aL9C0rQs8TTyaIYBuhcRgUIu7PqQcBenhe7k7pT1VxKKyrmVhpgiXO4KIgWirC0W
	ATw0d90gxjLbhElDHLb/8bSvKoA1qpjsxG06raXUIvBcSvb3lAq0jsiinMW9N6noHNyGzqiS7p6
	w=
X-Received: by 2002:a05:7022:2204:b0:144:ddf7:2570 with SMTP id a92af1059eb24-1a6d00cf3e4mr3833771c88.39.1793183906790;
        Wed, 28 Oct 2026 03:38:26 -0700 (PDT)
X-Received: by 2002:a05:7022:2204:b0:144:ddf7:2570 with SMTP id a92af1059eb24-1a6d00cf3e4mr3833697c88.39.1793183906147;
        Wed, 28 Oct 2026 03:38:26 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:38:25 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v6 00/11] phy: qualcomm: qmp-combo: update DP PHY PLL
 programming on Glymur
Date: Wed, 28 Oct 2026 16:07:56 +0530
Message-Id: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITQ4WoC/23O3YrCMBAF4FeRXDuSJs1P92rfY/GijRMbsY2bt
 MEiffdNXBYXFYbAgck350YiBoeRfGxuJGBy0fkxB7ndENO34xHBHXImjDJJNavheF6GOcClXyB
 x6KQytaLsYDtG8p9LQOuud+9r/5vj3J3QTAUpGzb4AaY+YPtwFav+u8aPFlIFFSijG9oIwYzAT
 x/j7ntuz8YPwy4/RetdnHxY7vUTL1f/muqnpnkoaFTcYK4suXz1SuFUP5CGviB1RqxlDEUlqOD
 6DbKu6w+066Z2VgEAAA==
X-Change-ID: 20260824-glymur-phy-v3-b67c4702dfb2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=6120;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=HmDH/BkWANBmegqO8kQ9LRJWbpkyKSCUhTt+cMKlvF4=;
 b=IMbJj7kB+cQoRMNzuDUqSaD85srLMsW7ginF6ueevCn2+B7wfDW4ZaOjLiZqo7PwfdbD66AYC
 tGtwKYtO2A7DafmpwxRRruKzayb9OWmMMmvF6TeAbDn6qysgIxr19Au
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: Vkphh8RuvLcEMBP5pLwiwNlW2mCxrVih
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1d0a4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=xD6p01Tg4BUkAB7hO_sA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX79VpG7eNNa8c
 +pe+vPqmlpg4WAuf5b1d/0EhvXM9jmSr0JvwkhfZHIGpxshU96o73gy0WDyfBAQEc5XxscSYcph
 3MHnAdWeNaz1RuYa5X17eC0bvmuwL5I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX+xe2uS4Ec8tt
 4k0SlY9tqqqA/5d7hYk78IyjRn03jweOtpvpql49fIC2RezgRckjD4Rh2bhCbbtgCgm0ODXFWuW
 U7Suvn1OzwtkmJ4iqUUr1suIgVbsd5/dlS4gL0AGSuZ69rbWuvCR+192di7Mphq1i9zHpeoDOo8
 D1xzK6hXFz7jH/pfzW+K1L8oU4ia0hEH7CRdwc1a4GTG6A4uF9g5a7KxvLQmBlzZz5fSFuNc/AT
 LBJPQEUGK3ySjtyYyyD8pzi9hqoc8g1987NNmCuAaMiV+V6+lwhCfsq1a8GD92BgGurSt25EhMn
 rAL5lzBT8iZ4zQ0B+RXSy7PoWbTNEkh8OqUtWg/ACcggvNK2QrLH/bAIyRl8OA+T+xwOvH9nA0D
 uKjB/lTgSe5rl9Vxu0yg18rgXQaJ/dNxxJyjgiC5xH+/QPZ1mj4gIV+jN1KagtNn2gdjIyqvcmF
 NDYU7/RVr9zrv7p0/wg==
X-Proofpoint-GUID: Vkphh8RuvLcEMBP5pLwiwNlW2mCxrVih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280042

The existing DP PHY PLL and AUX configuration for the Glymur platform
does not fully follow the Hardware Programming Guide requirements for
DP over Type-C, which results in DP link bring-up failures.

[   38.158644] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
training #2 on phy 1 failed. ret=-110
[   38.160656] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
training of LTTPR(s) failed. ret=-110
[   38.167330] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ
0x01000000 when not busy

Update the DP PHY programming sequence and PLL-related register
settings to align with the latest HPG recommendations. With this
change, DP link training completes successfully on Glymur-based
platforms.

Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Changes in v5:
- split two patches into more logical chunks.(Mani)
- Add proper Fixes and improve the commit message with rational for
  the change.(Mani)
- Fix the 2-lane DP that was broken in v4.(Oleg)
- Link to v4:
  https://lore.kernel.org/all/20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com/

Changes in v2:
- Use the DP-specific v8 COM status register definitions
  (DP_QSERDES_V8_COM_C_READY_STATUS and DP_QSERDES_V8_COM_CMN_STATUS)
  instead of adding new N3 USB/DP variants.(Konrad)
- Drop the qmp_v8_combo_configure_dp_mode() implementation and
  reuse the common qmp_combo_configure_dp_mode() helper, restoring
  orientation-specific DP_PHY_MODE programming (0x4c/0x5c) and addressing
  review comments regarding DP_PHY_MODE handling.
- Include phy-qcom-qmp-dp-qserdes-com-v8.h for the DP COM register
  definitions.
- Update patch author to Ritesh Kumar.(Konrad)
- Link to v1:
  https://lore.kernel.org/all/20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com/

Changes in v3:
- Split the monolithic patch into a logical 4-patch series (Dmitry):
  - Patch 1: Add DP COM v8 header and fix register layout
  - Patch 2: Update DP PHY common init tables
  - Patch 3: Update link rate specific DP PHY tables
  - Patch 4: Rework DP PHY runtime configuration
- Improved commit messages with detailed explanations for each change
- Better separation of concerns: header additions, table updates, and
  runtime logic changes are now in separate patches for easier review
- Link to v2:
  https://lore.kernel.org/all/20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com/

Changes in v4:
- Split patch 4 ("Rework DP PHY runtime configuration") into 4 separate
  patches to address review feedback (Mani)
- Add named constants QSERDES_DP_PHY_CFG1_V456 (0x0f) and
  QSERDES_DP_PHY_CFG1_V8 (0x2f) for the DP_PHY_CFG_1 magic values;
  use them via a new dp_phy_cfg1 field in qmp_phy_cfg (Mani)
- Set QSERDES_DP_PHY_CFG_1 to 0x2f on Glymur instead of 0x0f (Konrad)
- Update qmp_combo_configure_dp_mode() to ignore TypeC reverse state
  on Glymur via a new dp_mode_ignore_reverse flag in qmp_phy_cfg (Konrad)
- Fix ignored return value of cfg->configure_dp_phy() in
  qmp_combo_dp_power_on() (Konrad)
- Make AUXLESS_SETUP_CYC, AUXLESS_SILENCE_CYC and LFPS_PERIOD writes
  in qmp_v8_configure_dp_clocks() rate-dependent (Konrad)
- Remove duplicated LFPS_PERIOD write in qmp_v8_configure_dp_clocks()
  (Konrad)
- Make LN0/LN1_DRV_LVL writes swing/pre-emphasis level dependent via
  new qmp_dp_v8_ln_drv_lvl_hbr_rbr and qmp_dp_v8_ln_drv_lvl_hbr3_hbr2
  tables
- Make 2-lane drvr0_en/drvr1_en values in qmp_v8_configure_dp_phy()
  depend on the reverse state (Konrad)
- Patches 1-3 are unchanged from v3
- Link to v3:
  https://patch.msgid.link/20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com

Changes in v5:
- split two patches into more logical chunks.(Mani)
- Add proper Fixes and improve the commit message with rational for
  the change.(Mani)
- Fix the 2-lane DP that was broken in v4.(Oleg)
- Link to v4:
  https://lore.kernel.org/all/20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com/

Changes in v6:
- Drop inline unncessary comments (konrad)
- Fix QSERDES_V8_LALB_CLKBUF_ENABLE value for dp_tx lane from 0x87 to
  0x8f in qmp_v8_configure_dp_phy(). (Konrad)
- Simplify qmp_v8_configure_dp_phy() poll sequence: drop the redundant
  intermediate error check and the second readl_poll_timeout() on
  QPHY_COM_CMN_STATUS; return the single poll result directly. (konrad)
- Replace mutex_lock/unlock pair in qmp_combo_dp_power_on() with
  guard(mutex) and drop the goto out_unlock label; use early return on
  configure_dp_phy() failure instead. (Konrad)
- Link to v5: https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/

---
Nabige Aala (1):
      phy: qualcomm: qmp-combo: Fix error propagation in qmp_combo_dp_power_on()

Ritesh Kumar (10):
      phy: qualcomm: qmp-combo: Add DP COM v8 header and fix register layout
      phy: qualcomm: qmp-combo: Update DP PHY common init tables
      phy: qualcomm: qmp-combo: Update link rate specific DP PHY tables
      phy: qualcomm: qmp-combo: Ignore Type-C orientation for Glymur DP mode
      phy: qualcomm: qmp-combo: Add hardware-specific dp_aux_cfg2 and dp_phy_cfg1 fields
      phy: qualcomm: qmp-combo: Add v8 PCS-level drive level tables for Glymur
      phy: qualcomm: qmp-combo: Extract common DP PHY init sequence
      phy: qualcomm: qmp-combo: Remove VCO_DIV programming from qmp_v8_configure_dp_clocks()
      phy: qualcomm: qmp-combo: Add per-link-rate auxless/LFPS and drive level for Glymur
      phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY init and configure sequences

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 352 ++++++++++++++++++++----------
 1 file changed, 241 insertions(+), 111 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20260824-glymur-phy-v3-b67c4702dfb2

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

