Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D13C37A5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704295; cv=none; b=P70/Dkf+GxRAyKyni/Hijd6i/QARStFdl3VtvZJoQmExG883VQyx4O72EFdcZmr/SZuFU0z4tV4eh85UYAsZAVA1MaDzBXEkQ7nAeJ5mC91G6Ir2sL4wfjTnDynU2SWw3WtQN3ZaPPc3uz5DqRUqOX8+05vzNDcr1WgFLLTnr+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704295; c=relaxed/simple;
	bh=vStjqaB+Nqw92WBortmBbUZB1pNyr7BWWqyGcO0GRT8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cs1GJF0l7ZIzxZ9LK/wil/i8De8F4l0/LZ/NobSJ1OMnx1xkyZkEEKmG6G2lPTstDf24pX0pjpNpZR+vjiy+Xg1lTZvkbVFoPKjpCu17KT2Eco+F3tZLM7azJ+0xns1sbFLOrllx3O0bn1YGiyctmFPqkZB1RmBylt20VkZ8zw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foxwZ7kZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMfd0R6s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foxwZ7kZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMfd0R6s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68600DXq3654355
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 14:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l53u6UKvPGM2TSWpb1Vkl9
	V8N5ihswLqkEnQwa/MwAk=; b=foxwZ7kZkRw4B8DYtv4GuS/TCQ1RjqM+yp+rBG
	xTdzKGVQRiv8kGujRQma/omErYBUGDX7uAwOAgSt8u2JhUWT+2rV22U9ogpPHjcp
	V5pKlBOHvWEpCWPIU0MZkrH20/KtlIwHoycWMRKK1Pqp8MAtqg6oWkZVX5dAi+w5
	m+RD4WcP5YSAZZuEbXKTaqDpO4tYmIgIB2sbNV/YgLPkzYd+szoo4B15TJeLl9sM
	TPx1zs0J0nAQr7JvZJ1cR0G7bq0fSIFCYhbwjDDs/9bXHza/UEHnAhLEu7Cjfmzh
	FiiLP1DP/TODj8Zsuk/qSCc6RejwhCY9RAmW0r5E1ggk4uJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhkjbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 14:18:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso3259266a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704291; x=1789309091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l53u6UKvPGM2TSWpb1Vkl9V8N5ihswLqkEnQwa/MwAk=;
        b=ZMfd0R6sbnNvLuGF558iKFNMLb1L8OqsoNZ3qMb2xqnmDdQ3oefO7nW/DcsVUFhY2u
         xGi+T16tYbONy8Df+TJWhLDQ6cPmNoz3dPfKpXSZPwllioCPhG0uDrL263M8EeaH5DF4
         sfP7lHg6R+xKgFjxk3xWt7IbHD92a8rryRe5a1ZgmhaLan1yeQ95FqlB9knigtthwGKP
         YbZO4oFiyQm5HdroGP09LX9JoTxtZy4c3BuGzPBjimt8dXrW93ltUraiTr82Suwd8tH+
         xZ8gXEsB6h396owLnAVEerFXeEDul1Mfv8mpVWDXqXwN924LmjsMIMHhdUSPiJLrZ9f/
         MeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704291; x=1789309091;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l53u6UKvPGM2TSWpb1Vkl9V8N5ihswLqkEnQwa/MwAk=;
        b=NPcC9GSefH7X9Hz/KioinVOIyC1fIai0KCr+/VPnn1NC4xPvi3GhVeyW710r9Jd4NN
         kL5GFHGjGy+rIxkbCWjsRQx5vg7QaAfBr6W1Y2YI1jltGpkscgqeIrrlWzMZWK722Xu3
         bQhJlPqkLo51zGIhhS0to6e7yUwa1Z71yV+y2d4ARJO0SAHn7uYLJR9J7dySg7Ov4oU5
         4NHRFcvKHgfs+BchfyW6UTJZO9o4oXWGj2cziuEORdVPAbj6UtgpCiJLRvMAs7NGQEmK
         GhWr4tt9lNa9piUKSriVbwz6QtwF5qPYA4tDzf8BF/Kyp1AYJUNSDevqMPx3Z1mtXdqP
         j4jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVSHzoAMVGspO3cm/llAjgVeuw6cfLcJv3gfGtyv9Okq16s4mxKbduo3DEEJ8nBJ/pOziPHiiot4MiD7E=@vger.kernel.org
X-Gm-Message-State: AFuF++kbGib9f6RUOOzYsxurp2R9mL/pInxUvIWaHy+zhlSAyPXcYJKr
	N2lLb/lp2/CwKCRFQRrhAx49m5Y4z6I8ti70EfilY2CD3Ai1zQMr+nrWU8JnrcJPaWqGbyEqHlf
	CiGxOJUhjjyrde8VASnApo0YdgIK1XlNmgKgplXs5YNW6cvI6jfffkvs43rT3h+jsQaJWQ9w7sk
	tPrOr4
X-Gm-Gg: AYBFou1DJ/mqDSYEQMebSI9G8qaPcZTiUMtZB2IpcJLEiP1pMcTEVdtjTQFhyA8l9TI
	dh/WPNL1nxLcJTF5u7/A95iAOfDVBXr1W+2KoIxbaVmwkNgZQX25KaKV3sT6plVn6G6mtjTgbtv
	2oqG42xF0v5cgiE1ztoplTeOlqf44/EjVL0kRD/djBb38nxnp8xFXlD9TOdQqdCe4Aacui8N8R8
	ENNZGMa0sd+h0d+7FmInV7ldZngSVhxCxvQ3ilIQBc48ZwfEhTkJPBk0RZPwXljy/90QEIuhwtu
	cJ5Y05sYOuOzZWYny/YJPREfOJ5G5u4huRMDpuMvYm81+jRwGRGeWzV1te5GeTAZ/rhDlBY+aHY
	gRdWdF/lVGuF7V/6LYitJRCeDzzyzSeKmrA+ZGndXNP8=
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr24705016a91.17.1788704291092;
        Sun, 06 Sep 2026 07:18:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr24704942a91.17.1788704290497;
        Sun, 06 Sep 2026 07:18:10 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:10 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v4 00/12] clk: qcom: ipq-cmn-pll: Add IPQ5210 CMN PLL
 support
Date: Sun, 06 Sep 2026 07:18:06 -0700
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB52nWoC/33OTQ6CMBAF4KuQri3pFGjBlfcwhkAZpIb/AtEQ7
 m7BhS7ATZOXvPleZ2Kw12jI2ZlJj5M2uqlt8E8OUUVS35HqzGbCGRdMcp92qqli3XYBBxarqm7
 LkjJMoyQSEGR5Tuxl22Oun5t6vX2yGdMHqmGl1kahzdD0r212grX3f2ECymgSpqGQUcYhyC+NM
 W43JqUtV659yDo08S8VMrFPcUsphRIshwrkAeX9UHDwK89SHJSXpZ4MBcAOtSzLGwWwj+hlAQA
 A
X-Change-ID: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=5989;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=vStjqaB+Nqw92WBortmBbUZB1pNyr7BWWqyGcO0GRT8=;
 b=wV4tEyHa1+AU0gXj039QgbKwuOGzpOHcoBK3bElVW8INsOrKh3EnPGADiuNc2ccftlWz/SWWB
 HJKPjbWbrKAD0PUsibNMqOC8aDTZLHmR8HsQESLR8QTXIb3s9BdzwPJ
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: Nm2XDiVssbZpb4UMp3ft-Ffkl8-hgb2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXxvQmCDCh9qnL
 6jMHGwFNd/cZgr8YcG8i8vCizGIin1avyYDra82FSjMqu9CnYKgNVQMXWdVJG7SPFWGYBfGf1QD
 eEj8csMxKkkeQIfYmydJQ5IofgJqUfMkUfTk1NkYSEzVctrh9fTHfLG0g8xVDqboYLSoIfnGiNi
 r7jX83LqVOyh0gbOiNyVinKo41RyTkmkp9XtHqnc7Sazkdp3GFvJuCyajQQkuzzos4FN80ya6IV
 0QL07Opa2GR4jem3dYu/nUQkYfLdZmgesFw7K5UO+0nVfK0cus54DFab8GIoNHvHau0FIvTct0M
 t2K5Fq6kfJD2oBDgfoYVH6Yfu3Le30brVLrD5TvsZh7weXr9EnCDLAKu0D49lqzS/2iGQge2Cr3
 VlI4lyVFildcDl4LBtRD76NCmxyj0o7fZeqCrUTgPjBjDDnRKALtqciYdQvpBVp30uQgk4kJJxT
 OLlzhGuZ78WrJmb+SCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXz/ZD5dYSW1DR
 u+M+52wXTx5b7RQ6EPvxiL3JJBsOpBpwlQzSmzNM7DifeUiHw58dWjftG3sWqu+4qvfCQy3o8Qh
 jcV1hsbysxGu5IMoYHjaKNGtQ/cilPI=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9d7624 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_tJmgOXO7FCaeRF5PkUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Nm2XDiVssbZpb4UMp3ft-Ffkl8-hgb2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

The CMN (Common) PLL block of IPQ5210 is almost same as that of IPQ9574
which is currently supported by the driver. It accepts a 48 MHz reference
clock from the on-board Wi-Fi block and is configured to run at 12 GHz.
The difference is in the output clocks.

This patch series adds support for IPQ5210 into the CMN PLL clock driver.
On the IPQ5210, the CMN PLL block supplies a broad set of output clocks
to the networking hardware and GCC:

  - NSS (network subsystem): configurable rate via 6-bit divider
  - PPE (packet process engine): configurable rate via 6-bit divider
  - PON (passive optical network): configurable rate via 8-bit divider,
    plus a fixed 31.25 MHz UNIPHY mode
  - EPHY-RAW: 125 MHz or 312.5 MHz for the SoC-integrated Ethernet PHY
    (EPHY), which supports up to 2.5G link speed:
      125 MHz for 1G/100M/10M, 312.5 MHz for 2.5G
  - Gated fixed-rate outputs: PCS 31.25 MHz, ETH0/1/2 50 MHz,
    EPHY 50 MHz, ETH 25 MHz
  - Fixed-rate outputs: XO 24 MHz, sleep 32 kHz

The patch series is organised as follows:

   1/12  clk: convert fixed-rate registration to devm, remove remove callback
   2/12  dt-bindings + clock ID header for IPQ5210
   3/12  clk-regmap-divider support for CLK_DIVIDER_* flags
   4/12  Register a shared cmn_pll_div2 fixed-factor clock
   5/12  NSS configurable divider clock
   6/12  PPE configurable divider clock
   7/12  PON reference clock with enable/disable and divider
   8/12  EPHY-RAW 125/312.5 MHz select clock
   9/12  clk_fixed_gate gate clock type for gated fixed-rate outputs
  10/12  IPQ5210 output clock array and device match table entry
  11/12  DTS node in ipq5210.dtsi
  12/12  Update IPQ5210 xo_board to use fixed-factor-clock

Changes in v4:
  - Convert the PON reference clock's and clk_fixed_gate's hand-rolled
    enable/disable/is_enabled ops to the clk framework's
    clk_enable_regmap()/clk_disable_regmap()/clk_is_enabled_regmap()
    helpers.
  - Convert the EPHY-RAW clock's registration and ops from the
    CMN-PLL-specific struct clk_cmn_pll to struct clk_regmap and
    devm_clk_register_regmap(),
  - Drop the comment above the cmn_pll_div2 fixed-factor clock
    registration call; the call itself is self-explanatory.
  - Sort the ref_48mhz_clk node alphabetically by label.
  - Collect the Reviewed-by tags.
- Link to v3: https://patch.msgid.link/20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com

Changes in v3:
  - Drop the new CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag per review
    feedback; add a dedicated patch registering a shared cmn_pll_div2
    fixed-factor clock (this /2 stage exists on every supported SoC's
    CMN PLL block, so the clock is registered unconditionally (Only
    IPQ5210's output clocks currently parent on it). Reparent every
    IPQ5210 output clock except the plain fixed-rate xo-24mhz/
    sleep-32khz taps (NSS, PPE, PON, EPHY-RAW, and the gated fixed-rate
    clocks) onto it, using the existing CLK_DIVIDER_ONE_BASED flag for
    NSS/PPE. Same output rates throughout; more accurately models the
    hardware's real shared /2 stage.
  - Remove PON's now-redundant internal /2 math to match, and rename its
    pon_refclk-suffixed identifiers to pon_clk for consistency with the
    other per-clock-type helpers.
  - Reword the clk-regmap-divider flags patch to cite CLK_DIVIDER_ONE_BASED
    as the motivating flag.
  - Collect the Reviewed-by tag.
- Link to v2: https://patch.msgid.link/20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com

Changes in v2:
  - Introduce a new CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag in the
    generic clk divider framework and re-register the NSS/PPE clocks
    as plain clk_regmap_div instances instead of hand-rolled ops.
  - Replace the composite clk_fixed_rate + clk_gate implementation for
    gated fixed clocks with a dedicated clk_fixed_gate type that reads/
    modifies the shared gate register through regmap.
  - Replace the rate/enable_bit/strcmp(name, ...) runtime inference in
    ipq_cmn_pll_register_clks() with an explicit enum cmn_pll_clk_type
    field, making each output clock's registration path self-describing
    instead of implicit in its rate/name/enable_bit fields.
  - Update the EPHY-RAW clock's determine_rate() to pick the nearest of
    the two supported rates (125 MHz / 312.5 MHz) using the same abs_diff()
- Link to v1: https://patch.msgid.link/20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com

---
Luo Jie (12):
      clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
      clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags
      clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
      clk: qcom: ipq-cmn-pll: Add NSS clock support
      clk: qcom: ipq-cmn-pll: Add PPE clock support
      clk: qcom: ipq-cmn-pll: Add PON reference clock support
      clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
      clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
      clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  27 +-
 drivers/clk/qcom/clk-regmap-divider.c              |  16 +-
 drivers/clk/qcom/clk-regmap-divider.h              |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 535 +++++++++++++++++++--
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |  30 ++
 7 files changed, 591 insertions(+), 41 deletions(-)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

