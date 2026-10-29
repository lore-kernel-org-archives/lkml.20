Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254245;
	b=uO8tjzVB5fWygRxfvoFttfRKJtfHqK/Tq0Fa7hw9N5cCiiNlP8Cq79w9LS4JN4FKsapc
	 U9cWKV0l3qL2bLN91LfaFewU22qnFVqcnzi8t6OnYrIfPv5sZoTKq2v+8Qdx1Vr9tOvbQ
	 7zMKsg7EIjoZe+7wt/R1jTCyfzxKVeJrEVhIJkdy7YZTJIvaduPTYYYGAtRQelghaNkFn
	 c+VE/QEGU1rfyZJ6t/XZl8yT9PSsS6solKnBBlwFk1k5Dp/VfBxlqL61SasHyKYRboEBl
	 fI59kvRA885yHY/O/2Z3p0HmUZrGaFmsep+oYswyOK9NL6c34Q+POt+3Z3kAy+RQT0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Tr0oBFB96n5almIEsEiCDrAJB5b3KqP7AbXwp3w3Vk=;
	b=KuNSTjHZQmdTcGf9hBazPkZV94SOuBxywCHq4JsgTxl3hGQ8iOl6hBoPCqZEFsxD8fqT
	 UtaaeSVlsEEIivRyu4lKih+c1q4ETzqHq7siqCYJuP4e7VGFS2BTDtYQmsEOLvW61uSOe
	 TvM7ShEWZkgIVnexG5tEsbUjhJbOdP0uW1Ix889rtcGXXCUrNOyzqX8YhAqu2iWQZNw6T
	 DlixN7vONsGVWqGl24+6XjF+2mecYRP9Oq4eFvv19GnS07EIHwcudfTORj20PSulqcZYi
	 CBqo+v4QrnX5v+c8RALn7zfCzbBaUNtdYCKbLE3s6o2C8IPcmnLd9nMfNPI90NiYk2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cswlkksx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a90+cfBG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1115606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1115606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cswlkksx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a90+cfBG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H49i2793246
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5Tr0oBFB96n5almIEsEiCD
	rAJB5b3KqP7AbXwp3w3Vk=; b=cswlkksx3mVm/A6JzkaXKiodcGWmzIkS6wJR0q
	la82jaFC54tsCkxU7xTJWXtAWZd2yAM0CLjHBNu5Ecfs9GNeQP+VWzFSD3LSXnGD
	a/B6cEUGsksAoZUuiGpYYKrsqMrd5hWXHXb8F8Op2y73Za2yUcTZQz5iWb3jt+35
	wYidNhLt4VA25IpvNq0HLTG30V6XLnp7avdhAE9lIltRai+nZ2jarIzFmAi2Zu8M
	NfpoeJ/mL+rZPhsyxtrzAcx4EbkEE3Y5/Xgoo2fbAdzuRrRA+mao4Pene6swBKL0
	LmibYBzYGpeSjqC0BprlXsT9DLRieM9RvusQe6eLWe3uS/Cg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3n9jn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:10:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3771175eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793254243; x=1793859043; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Tr0oBFB96n5almIEsEiCDrAJB5b3KqP7AbXwp3w3Vk=;
        b=a90+cfBGAQ12WDV0iL2ZeyVXBKWASYl8+KDr6TAw+NG+/zmuQiw3v7NI/ZV/bUboYY
         hHFW257MqL2VSbgoQr665BI1WZRMVxoCtvc4GlNlqHf7YaTT5IuscOtXbi7eESHTs3PN
         kPr8CgBg+g+LEc0tRrP/DFl+oQdGB7k9vI8Ydf2kpiGdzg1JJ8kEgnqHEG+M5IeYmb99
         cnybC1ebfrlDKMCB9nCmcBHVJm4ODa0Vf/LxoT3W13jcdTeo4mpBjEYyB6DbX1AMJVFr
         wr8PUDFZhWzft3+LrdHEyCDA0bMUAnU7OGabqs2IEh8rQB/uLeMrgt7D97Ai9U1JQ59D
         llog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254243; x=1793859043;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Tr0oBFB96n5almIEsEiCDrAJB5b3KqP7AbXwp3w3Vk=;
        b=nEYSUxw+CvAcmiAmX+yMGdTF83IMuwt4BgAw5uUE4HU1PwYkSq70lmMgT6mq/VCkcf
         TlKgM4sRYb+Wl6oBawtyXWY9cNQPDfK23GoMPUWcfcyAYFTfQxFzkgCVJ618lvv9OIIy
         CT1+WBEU0ClI/9I0wOhBF1pbFLS5c7CqfDkgMdI+bAdVQ8qNdhbZko/g+XpSz2BfmHSG
         o/eWnmK3v4QZsnhB4/GF/aJNcDeD+7e1yxd0GaFO5LEdLOpmfCS3nptl72vAPuz6EnQy
         ZKHwmIsS6kiSITW6BhZXTs89DR19hJtRrnzSriK65Lo6QmmWIrGPKh5kdPYBYSLhWHE9
         bKtw==
X-Forwarded-Encrypted: i=1; AKwUvBynH0kNLg4tlYEvWRP5ZS5j0Y6wzm00HMRxVhFu40d5LUFALeHGJJQBrcj7dLcycd5g/vbJRK/hbTEiCfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd/RlCnx8Z5Lo6WYO+KKdzuZQNqPXZ05PjJCFFN94R+V5RU9Gz
	drZoLOejmnC4hRrnOiz25hyeg7fK4yDkNt2RWMVsxe8gft2m5v2wfwDYWJs9A8D5aVFrp8tK6Hh
	WimWVw/n1uyt6GJ1PVO8Pmg390r0CVNJS79SeWeTUZ/29Sn10j9iLnTCqOCiuZ/aZdnc=
X-Gm-Gg: AYBFou0EKxAk/p+MM0y144AqbBViCC85z5LA/Lon56NxvZ8JjcNi4SJiAm+a6cGjeC6
	dO0WDEK7IgdwqRPH2vT3kfmYgif84YWojA4vwkHtl6BLePL6JpICFkskf8YlFiq9zfmKR1I5B5A
	kmT9Xp4xCWsyyPKVz2AEGnt5G4yJFZKOo83cK0LLH/1LsKKRjo04nRuC27SLsByLtduFS3nuqwi
	6jXPQFK+rigttY+tMcUve0bHzH30tnE5qvQZcLBw28nATlr9w7NiIHF8To0cs3jyY12DP9Fev43
	s2k6u2KopN2zaVF3BFti0baiGYbTCQRVAq4vTWnx3tQQd2AiYn8aMcXBH7tbdDAekWBqJyV/6Xk
	zSIjFFlnPePHYxjhpDl6UjxPwFQHmY1+/3MwGTnb01HEy8Fe1NIep/shjFuGjMBRExCM1w61Tjy
	A9xga1OQM=
X-Received: by 2002:a05:7300:a8f:b0:368:c6b9:d3bb with SMTP id 5a478bee46e88-36a203f18f1mr6931740eec.14.1793254243139;
        Wed, 28 Oct 2026 23:10:43 -0700 (PDT)
X-Received: by 2002:a05:7300:a8f:b0:368:c6b9:d3bb with SMTP id 5a478bee46e88-36a203f18f1mr6931698eec.14.1793254242577;
        Wed, 28 Oct 2026 23:10:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a2e29sm14038935eec.26.2026.10.28.23.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:10:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Add PCIe support for Qualcomm Nord platform
Date: Thu, 29 Oct 2026 11:40:15 +0530
Message-Id: <20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEfj4moC/3XO20oDMRAG4FcpuTZlck688j3EixxtxG500y5K2
 Xc3aQMuaG8Cf5jvn7mgGuccK3rcXdAcl1xzmVoQDzvkD3Z6jTiHlhEFKkETwFOZA+aSaDCJBGE
 jaqMfc0z561rz/HLL9ezeoj912ycOuZ7K/H3ds5A+Nyopv1UuBAM20jimlAPF2FOpdf95tu++H
 I/79vSaYcTGKA80UaeVFPav6dcsdLtPD0ubJdolYQIxQaY7lv1aA2ZY1qwDq6mixAuu7li+sZQ
 My5uNAYSXsf1y+Meu6/oDjuXQLJkBAAA=
X-Change-ID: 20260810-nord-461809f1d5ae
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793254236; l=3557;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=4TqTUrItcs5aJg0p14PtRmd0tQ+G0Qe6xJFnXclq78k=;
 b=rwy+wLV5W6OmAgIpW7//Fsu4l6jr2rAnCxEosmX7/UaB4LDAITlpnQG0Humjx/gOMygNCSWWR
 q578t8p+nBxCxMJBLdyuvm0f3PiRwJCmdB5RTJeQTMRoognTw8oI3BE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: UyeCimcSjxjFc1oflNwddRLlNt9D8_Yx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfX2gRUhTfXNqG0
 TAW3PI+/oU+9DHf+qIPbx4FUzeZix39YLfFZHmdJS5lakPqtSwp+dG8d9jnUB3DiMBaCnqiosiA
 i36S/KB+YNle4RZwwVDqV0e066rBUTfk9U+cyJjBULgb5JPZrWrvj5XASkJNn/zdTh42sfhHWbf
 DMP1Zk7kANlXb7kAmpmwCSnmYTcv2zJG3qWCBMePUMdDPiHrfSfwSzEnqFcdzmQBcpDe/Tfs2ve
 Fal54LIPbTr778SBOV98oagX6Q2P/GBEgABI1F2kh8RqjoF0PrqeumXJkIL9mL4W4Y+YLQPPztg
 JkSltvql667QaVLkMyhpodLlr5rWk/BFZWKJbcQ7mwPNDCDnT7BfMM7EtHBY6qEwLiqYwaNDyhM
 tEJy5+tQAf87d7PB/lTt0V/bKqz/Pqeg3OlCpyZoGMPZS8O/kA8fV0sSS4eEu6KOrK+Fbq15/F8
 w+pWvVnbX6+e+2J5GZA==
X-Proofpoint-GUID: UyeCimcSjxjFc1oflNwddRLlNt9D8_Yx
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae2e364 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=1XWaLZrsAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=_HC7VgZuvUK4spJUPywA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfXwsUibOxsEtH1
 vUY/RjHGbG4xlYv/6ApDqbB8tykygdImY1pMVBPolsrB7fK2i4fW7UelSn/bEIxNZAlxjIUyk71
 Ig2j2U6uksQnL9pMpmCz3igSzQIuWfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290023

This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.

Nord has a single Gen5-capable QMP PCIe PHY block split into four
independently-clocked and independently-resettable ports (A/B/C/D).
Firmware selects the active lane topology at boot via a TCSR
configuration register, and the same PHY block can appear as a single
x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
is similar in spirit to the Glymur multi-PHY support already posted,
except Nord's PHY registers are programmed by Linux rather than by
firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
tables along with the power-up/power-down/soft-reset sequencing needed
to bring each port up.

The series also documents and wires up the qcom,nord-pcie compatible
(reusing the existing SA8775P PCIe controller binding), and adds a
CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
convergence issue in the PCIe power domain.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengchao.guo@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: shengchao.guo@oss.qualcomm.com

---
Changes in v5:
- Rebased to the tip and removed already applied patches.
- Link to v4: https://patch.msgid.link/20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com

Changes in v4:
- Couple of nits in dt binding & phy driver (shawn, Mani)
- Add proper description for link-mode & phy-cells
- Remove soc node and address cells from example (Mani)
- change cgc_dis_workaround to disable_cgc (Mani)
- Split common changes and nord changes (Mani) 
- Link to v3: https://patch.msgid.link/20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com

Changes in v3:
- change the name to quadfurcated phy (Konrad).
- remove min items and change clocks order (Krzysztof).
- Factor out the common config and create overlays & try to use common
  symbols for glymur and nord (Konrad).
- create  qphy_setbit and qphy_clrbit (Qiang Yu).
- and in qmp_pcie_exit() apply settings only when nocsr is present (Qiang Yu).
- Link to v2: https://patch.msgid.link/20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com

Changes in v2:
- Fix dtbinding errors (Krzysztof)
- Link to v1: https://patch.msgid.link/20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com

---
Krishna Chaitanya Chundru (2):
      dt-bindings: pci: qcom: add Nord PCIe controller compatible
      PCI: qcom: Add Nord PCIe controller support

 .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml       |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c                   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20260810-nord-461809f1d5ae

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

