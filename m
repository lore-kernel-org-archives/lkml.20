Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193850;
	b=CVV8+OhJBwgvoqKepWih86+6KWus7tCtaCdt93MNyBQpu6KBH76HUvagKtIEwN+1COx6
	 Xqp96SEdfL6fQhUasg7XPcd31DCNkN+5NOso+OFIVyRTpUU6TV3Dxm0TpsN1w64EULZ35
	 nAqthsarVum8scdZimLW+59ZrT5jpGZXt5fwPtKqRFtV6FtP7hNrP5lXO70hqluCUXU+7
	 PFuo/mNBIO7Fx6673FBAtaEKOfbAcQgWW//xmcK9VJA+081Mf4XkyS4iIuGY/7HfIV5M7
	 favZLZ5XUicL5P7SkDZBx083m9xXkR++z5CxUR1w9qbBnVD4Or/UXq5y8wQBbwdbA1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rbt4946R0E2yi/41+kWXH2sO+DgKgRQCh9Dm63iCQXE=;
	b=pSt0e/PaTl3cEVmerW7E9HYQxcvKrjO1StGu9O7FEoWLWdm695BGjo6WQbaP2N00h66O
	 33/YUtI0ipIZdc5MkQxVwTQMovkTOoW/KsF6ImA4oDQtFuY8W6KYaE67OETr6mNOndUB6
	 d65svV20gylwVdM60rNeR12G0JImgd4CYiG2R1wCsbZYW6t/Jz0NDDqGl7n6pwGspPacm
	 HU9SUO3JxVYLNnPlpAYu0f/191gJMk8b8PFTo4y873lGRIjfrQNqkYy8R1uUFzOKHcDrS
	 3TUYxfVXZRWV5do5O15E2BOcjf6lL8bBTRjveozMWLlC7/yGJXdMDLcIUz2Mtf2Gk3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ci5MMPFY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmGs2ba9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D7606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ci5MMPFY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmGs2ba9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4JT4154783
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Rbt4946R0E2yi/41+kWXH2sO+DgKgRQCh9D
	m63iCQXE=; b=Ci5MMPFYKHMqaVF4u7lTEdJ4WP7YpssWVbheAIabi32IkQ1OgKn
	ee2bcUMGrRoxKeqBD5dL5ZXzZtKtSM0diPpp/dVRkcxSOqTriChKVTG7GPA3ojmp
	wld43gQyFBR3w1JcRcyVwz2EmOUUwQOjKXMvaRgH9lcM1nM6zszVKoqzyxzKv6SY
	oiasfxImdWlsP34EhyqZzFTcisR9l5QNc48CPqPHtFqCa4AfDgfnsbin6bkuQiZz
	dbm2YZlgC4o/pVCXINrP74qZ5w4hh9QtcagGe14RalUsgdRrPeQUE6VaXkETfGMj
	eu74Gf1dNkvywtOEjVcws2Y5iSOuA5k0FTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0yns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so169404285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193847; x=1793798647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rbt4946R0E2yi/41+kWXH2sO+DgKgRQCh9Dm63iCQXE=;
        b=cmGs2ba93wBF/pStN8AF9As8K5JYX5UazxhOfQ5oqW5qnwEGMQmHc99MBCSBX+g+x+
         Ps6vkL9eTjepr2z4sStt5rnoVF1MWW2fxZ2q8SBaipEr/AZaazWQg1eAutlOlRAWIkxj
         ocv/LaaWRilaLUtLav8tcqqia04wq2jTT0vUI0PaoKLxi/t6xCL7T9LQXd9cstRNC3Z6
         Mi6C/Si6/qIMZLpNqniHmTYATQrIYynnBUg7s4riNbFx3ekvykIhM3VP9hHscwVBJX7S
         WjouO7TxScaIVHCfoNR6bgMJW7L8viGqAeNpzWzgR8bvwtMW63+MDh8VyxFCfGCjjiYn
         tayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193847; x=1793798647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rbt4946R0E2yi/41+kWXH2sO+DgKgRQCh9Dm63iCQXE=;
        b=pu/oTizxhKS09GWW0pgM9Tel6Fp6AeJlfawZTl7D4yatcSiXKVylYJCnEN9X12qpl7
         Gz84M0VB3uz5ZO+Gzv6z5l1oYFdl1Gckj+1LxNreJNoAWidVdrjloRAn/SVAlVPufbZp
         zEk1Hfwsfh4Pzm6qi68btaj5rXrK9AkkmRBKfP+tU3ahZYuTpOmhjdDjcSrphAWq06hQ
         DatSogHbpUq6y2Q6yJzxwWpV1wHtEAU3jQ4aHf+a1t1u/KzXZmL/JtRVHb8x+r86nK0h
         jvcXfutNwdcRbETHuPCMOzXSz/jISCR4ZxDIGX30IPNgGP+Ohi54nZ7+4qJyRA5N1ll6
         7z3A==
X-Forwarded-Encrypted: i=1; AKwUvBxe4/W4gv6ZrPU22hE53U280nI4kFbzPOPoZw6xTd/2qa9cL2xxTs5yON1MZLzoi0J++PVVsvubWhOOz4A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGjO4jOI7gog320CrOGhF6BCACWEpaqlnXKggJQIaW9yCcVTIW
	ElrUgD7KA4CkDMo+gfO6G5wQTRRlr5fOfiE0eyxf1uglsYRhmg1b0B4T1La+ofC+8ZDvSU4N4f/
	7qEublcA7FzZcNkiS9uLthqwfZ8KbtGi8wuSPkNw0Nj0MvyhGZnKFtfmZQKrgRfN84ys=
X-Gm-Gg: AYBFou06xRxrV8s7ib3MxQVbHfUSdSFoebhzN70mbAx78Ds+9Uj3u5o295xWPLE7RBa
	djaDOaB0TcVaFOVDRVY01FzXKPsGemhuQMYb5HkfqdSVXB7XBYxSvm6UQ3PeF9zfuvU3xAY4tH3
	YmTtZXVlTU0i8IZnSlz8H44TqNqSDzpA4vE4gcHm4yY8feYP1M3IM2vsx5LZqfwKlOK1ciPKX6H
	OUK8wcF272Xw2j3IYRspf1/iTzt/8sktObrBmTAeANN2OjKYvsU78bPNGxO64HKIJfBynu67d1k
	dUCb4uUPneFHIzaoHooU14YeUlBvlBOGOWiPeAwxcuEpwhbWZnkh09nErE21hIS5uUcf5wteolr
	X9lgQbNA187EvCy7WgHwnrg9r9R+kVWDFb1uHCT/JVxN078+OkJci+/FedrMlOlKaSYI2wAGogw
	==
X-Received: by 2002:a05:620a:4009:b0:93f:115:7338 with SMTP id af79cd13be357-94408d15e9cmr322519085a.54.1793193847010;
        Wed, 28 Oct 2026 06:24:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:93f:115:7338 with SMTP id af79cd13be357-94408d15e9cmr322514185a.54.1793193846425;
        Wed, 28 Oct 2026 06:24:06 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:04 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Wed, 28 Oct 2026 15:23:57 +0200
Message-Id: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Unv8gLHKdmYdVrSMiS_jzvNzgufY8n0u
X-Proofpoint-ORIG-GUID: Unv8gLHKdmYdVrSMiS_jzvNzgufY8n0u
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f777 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=_tAXh3pcZ4U8UltSem4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX2J4xLJyp/Vk7
 jax5qJ1/HnfALcJxuFgbgW5bAv+S0iHZSD9ek/4O2pxtdRM3OiQLjI9Z6CjKEGG9dia4ZTCUhlB
 7VQ2s2sYw8OYCGwcDgnxzDBB22o6gHXeoSb2jEnSriuVGoVlLyK9xE/zKaHbX5SRNBsBdW7oiFG
 Qwxkn3j4RiCANEY9ZL9Sbe/wJt+R+VGNgq7glox6pHPfgtLZceuD/Bew+Q/hu+u0nNVimJgl4Sw
 /7spjiPst99gNtwGQpuPOewKlz11c7ouelV5WJ4Hb11M1jQpG9eCJz4y/kiGOAfmXxhRD43Mc8n
 q7MEl9GSEGqi9zHUvfkb3JhajI/GutJQvpoKNxHoKG9XzGcpWExD1KDB9FYRkE3+ZohvDIrGJo3
 tnFJ4MXiyFG5k9EGw75KnxWNJc2jDDmU4o7qjnKLk4JDYzzBmKGADqJQd4UnQj3uoByR3VTwv2o
 wfb11hH/g6ctgXi1Z3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXwlouiYW1bQlI
 kHWmcvD29vQQAMDGQmthl/c27aLT9N2BCEtwTKT9Yap9orC76FFdsoRL6TrG9Oaews5S4Rlk4T4
 iyUy53v2U/i8Mr2VQPQ435+Kauhgpu8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

On SM8250 several VFE clocks are fed by one clock source: the AREG
clocks of the two full VFEs share the fast AHB source, the two VFE Lite
share one core clock, and all four VFEs share the camera NoC AXI clock.
Each VFE sets such a clock to its own rate, so the last VFE to power on
wins and can lower the rate under a VFE that is still running. The CSID
also sets the VFE core clocks to their lowest level when it powers on
after the VFE, and nothing sets the camera NoC AXI rate, so the camera
NoC runs from XO and two concurrent streams stall.

Two examples on RB5 (QRB5165):

- VFE0 streams the CSID test pattern and VFE1 then starts an imx577
  stream. Nothing sets the camera NoC AXI rate, so the camera NoC stays
  at XO (19.2 MHz) and one of the two streams stalls. With the series
  the VFEs set it to 300 or 400 MHz and both streams complete.

- VFE Lite 0 streams the CSID test pattern at 480 MHz and VFE Lite 1
  then starts an imx577 stream that needs 400 MHz. The two share one
  core clock, so VFE Lite 1 lowers it to 400 MHz under the running VFE
  Lite 0. With the series the clock stays at 480 MHz until VFE Lite 0
  stops.

This series lets the VFE own its clock rates:

- Patch 1 moves the minimum rate computation out of the VFE clock
  loops, with no functional change.
- Patch 2 keeps failing when the pixel rate exceeds the VFE core
  clock, and clamps the other VFE clocks to their highest listed rate,
  as the VFE clock rate tables need not have the same number of
  levels.
- Patch 3 stops the CSID from setting the VFE core clock rates.
- Patch 4 sets the VFE clock rates as minimums with
  clk_set_rate_range(), so that a shared clock runs at the highest
  minimum of its running VFEs. This applies to all SoCs.
- Patch 5 lets the VFE set the AREG clock at a fixed 400 MHz.
- Patch 6 drops the unused camera NoC AXI RCG from the VFE clocks and
  lets the VFE set the camera NoC AXI rate.

The camera NoC AXI clock is also used by drivers outside CAMSS, and how
to aggregate their requests with the CAMSS one is still being discussed
on the CAMNOC interconnect series. Patch 6 only covers the CAMSS VFEs
and fixes the concurrent stall today.

Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
pattern generator, on single, concurrent test pattern plus sensor, and
concurrent dual sensor RDI captures on all four VFEs: all streams
complete, no shared clock is lowered under a running VFE, and the
camera NoC AXI clock runs at 300 or 400 MHz while streaming.

Also tested on the Lemans EVK (SA8775P) with imx577 and the CAMSS TPG,
on single and concurrent test pattern plus sensor RDI captures on all
seven IFEs: all streams complete and no shared clock is lowered under
a running IFE.

Changes in v4:
- Keep -EINVAL for the VFE core clock and clamp only the other VFE
  clocks, without a warning (Bryan O'Donoghue, Loic Poulain)
- Use clk_set_rate_range() on all SoCs and drop the vfe_clock_ranges
  flag (Loic Poulain, Bryan O'Donoghue)
- Add Suggested-by to patch 4 (Bryan O'Donoghue)
- Drop Reviewed-by from patch 2 due to changes

Changes in v3:
- Replace the CAMSS clock domains with clk_set_rate_range() and fold
  the rate ranges into patch 4 (Bryan O'Donoghue)
- Fix the VFE AREG clock at 400 MHz (Bryan O'Donoghue)
- Collect Reviewed-by tags

Changes in v2:
- Split the minimum rate computation out of the clock loops into its
  own patch (Loic Poulain)
- Add the Fixes tag to the CSID patch (Bryan O'Donoghue)
- Split the clock grouping from the AREG clock change and add an
  example to the grouping commit message (Bryan O'Donoghue)
- Rename the per-clock entries of a clock domain from user to vote
  (Bryan O'Donoghue)

Atanas Filipov (6):
  media: qcom: camss: factor out the VFE minimum clock rate
  media: qcom: camss: clamp VFE clock rates to the highest level
  media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
  media: qcom: camss: share VFE clock sources by the highest rate
  media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
  media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE

 drivers/media/platform/qcom/camss/camss-vfe.c | 182 +++++++++++-------
 drivers/media/platform/qcom/camss/camss.c     |  44 ++---
 2 files changed, 136 insertions(+), 90 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

