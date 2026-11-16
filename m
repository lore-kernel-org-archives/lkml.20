Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829757;
	b=iq0eDYfumtcavac/ZY8HfyGYErDr/M+hvlLw0Zpohzlxn1pYwUvqK8lG+JH5mY7i/7Ru
	 lotDAtFRBPiyuiWLFtOCHfC7cHG2PonudFXVr2dmKxaSWnS6Crwat+LkAimNT0k/X/8qx
	 Lh58sAJbvv+UEcyGCkRjtYpR6Nh7f/c22uQaKKo9hn3Xbbt9cNcvniwDnLPMcqzDWVAlg
	 GJeOORjPOPFmMHDQhL7wffpnRg0YtnucMz7WRTBH9drClOrA2rMEVAFj6GFbzTXatSDO1
	 qnL7qMdCCP2ma8mAjk6ZkexpeKo9cc+AWwXc3rwkK7PLgnLe0UvF2XGH3rwzGoc7lBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY66xikX6Hs=;
	b=4tWYqmpqy6vXTOi5mqwew/DL0MIApPhKIhwfCJKuYcZlcb9JN8X6FnVXVd7V40AI4wCw
	 zpdp+Gs5vNN+VJj2FHXbOLuUv6Vbg+kKFmAo8EHClo2EAXAzTbMslFkLIF+OBn5AEqbwt
	 Uo1PVWVxeeiEkr0BLtl1ofvl0eZ878bA8CsyXLRcu2DldS6yfxLYHr0PzixpBUEfqrFmp
	 /4dtpIo7flwFnGgiN6fg4815C9fkaU2ReTD9sw+co3bzWyLd2ImH1sUiDMSVmwHMumHWU
	 U0APJvjkSLDCMGl9S9WJ5FMWhHPTaEvyZoCMuLqvTEnUSwkMyDZBhyQxp3hc5eZdLFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIstbYq1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DGzQ70hW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57519606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57519606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIstbYq1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DGzQ70hW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBMDjQ3033016
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY6
	6xikX6Hs=; b=YIstbYq1HSw9wRh/Tz0Yl2FqvHIkjNxVkMX07nq4NXy/tevLxKH
	eT1oBnw5ZoIUaLQxkW79sCo0gDLkP64Zscr0WiramjSk1Ed810LXWRajuiLbomr0
	50ehpcm3tWX48FoP5ixSy0Vr8lWhXfOkEDJDmmM+FtBrdOt3h38Ufw1NWw3ELdJj
	lQXjw4/61yqHJ+p12M6/+og7JkV7ss3QXD/Wtwimmiew6rsFLCQ6AJK4fapkyPuB
	WhgrATi4fuCJoVOcB1m3IUyaWOSWe9lvOQ8qIGpzpH7ZJjGrOr08vdgq3KpOw2Bx
	2AoN/tACnCps03nR11tjjM4/TH01HJ17f7w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxcf0pcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so4353649eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829755; x=1795434555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY66xikX6Hs=;
        b=DGzQ70hWDOkEcq4Jviv+NHlR7D4V/vObjJcKzwj9YMX//biZ/EKQuElI3nk3O+DSD3
         zu7xP5NMAU+sopbjUiz0VknR4dRBVLp86YRDyUivMobe3zfySlL1LNDIPf1bfkNCzQKR
         tB9IAqg4JBsPZtUuyMHk6qeYivPzRO5gw/Lc/NMWfOgjwIa6CgjGzHJxbSyQzuVWvddO
         LV7ED7hX0Q4dlgPQPU6+087NUYQ+IFEkCbIVbNWgSKZ3WS6zcLlfSSnnISFSNGXnxD09
         MGz3r1mjQrkvWW3U/KbsaXhW01W/bj6h2KG9Sk4fgai9zyO7lEoABVpuanQmPWqlgbV0
         546A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829755; x=1795434555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY66xikX6Hs=;
        b=hNrH2ha4VgE0/rHtufu9a+5MS22yGX4+ayW1qKmSTUGWP12ZpwEQmQhNV4NhbDzx6h
         Ka6uj1yqktXqh6sF+BTdr9JbbImp/ImcuGphzfLKle5K+d9m082OQOUCsekrMN5eL7Pb
         EJMSixX3vFD2oZVNlpfh2bOHRGyTX7gvKsW8OVHKZbFOaYDlqkbOh13heLugalhHF+xa
         55ICWPAEFZ9b/2FZs0D1+siploqQPT3gRp0SProQCy3c8tFVDu1DyVkRzSQpGrSNRPAE
         A5fG8HuPscO2weVuUJJIC9UqESraa7hAijEODTcQrUypeqbjMPYMucRMCK7rcr6jyaqn
         VXzg==
X-Gm-Message-State: APuU4Z/s4OibdciVtWJdoc//KgBB5aRLVuOUoEJ7sC8ybNIlwtE0sN6g
	yfh5r/ZcJtZ2RVLrSGMCyJ8WOtoRUyaPJnWRra14745EbApaU07LAAVPn/kep+1zz9EcWejKVMQ
	fuiDpp+f8xRJ5WMt3VHfO+DvWvDbG33PzWxEpVgyu/VcSoT71CQGd7y57I48N8DCud58=
X-Gm-Gg: AZFdTZfEx3hTbCtgMZhtHkrX6Kqgep13EqU8nbS2vXdmVkBQyWeL1ZfJP7AIJElc11U
	x22TopQ7fXwZLvIG8VPVJYzngbUVW6xQNoD8wj+HMqFms2jOa4ri3Sx2mJUWWiA0soofvkqGd4O
	oQhW1ys9dZoHm8WbwNV2zeWmroaFmaCIfCQYN0QL1k5EXya097P40myyc5UlY5mBO3bC1kKK4bw
	j3rgCpNwYgVexNlfPGVPfbGQB3Dwkpwvxz+sYEmIwCVleT3tsGpnDo/H6ACmP78O+Wf2GI0dB4c
	4ekzEUZK9USxniQwSwbLDmJtnOnBSJ9a6TgCLy5/Kasw1gmmx+xwW5J1ZV7OC0nv7hONLv2TIXb
	pKaZaqiuENKJdPQ+VZj5TElelUfIAypKbxOi2gMn9mCTx79OwR4s8eQReF57Hlz7/ZMT5gBm49O
	eg
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr8694953eec.30.1794829755120;
        Mon, 16 Nov 2026 03:49:15 -0800 (PST)
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr8694933eec.30.1794829754617;
        Mon, 16 Nov 2026 03:49:14 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm33802844eec.10.2026.11.16.03.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:49:14 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:16:39 +0530
Message-ID: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX+E149YKaoF2e
 0cMD/jV4FEoZqwety5i+G/b5bGZ6hdTvQb2sdxfmHQVkREXMbudVG62gMquxRD0tvKCRxqK+Pgw
 MjumsjjsaN1AP4pHxELLtfbswk5Giu9kKfjz3WKR4M7PAKWTj7sHTRCH58ddZhjRlobO8wv9qE9
 Xff5IcfdFaPlxfX6lOoXIFJkxkySAYq+GOPjeBPE7Hk7cbFw/UYD7SxhsqenICNQ0vhix3Rh5OH
 4IqECXW6aJRV2d3WqJqMS3Cle7QeSutsAh6Efmo+kz1wjOktaq89Mg6lkLpOzivi4R74oo+Ej2T
 hYjyVy6j6y8/EciSUDzJF5QoWU717U74N8FvU3+sWAqKvK5reMb7KEW/nKI5lE57wmR6Wxm4lCX
 Sq8soR57q/t5oZ4NF4MdrmHLT5BlotK9cuzu/FDuZrxMK3eGORGmg0xugjjgDCGOdWO+CCGtgXZ
 KgJV/kFs/IkoU/gsorg==
X-Authority-Analysis: v=2.4 cv=RtZQvymK c=1 sm=1 tr=0 ts=6afaedbc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oVCAav2c3y0N_-OfdZYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfXyUZEtL63teIK
 wJ3HFmjXf2iKJifqbwHkEHHV0nQOqQAgAH2v6dWqfIW/ttjyYgoVZdlRcOahT7FeWelAp/jGf3r
 QqAGEBt5kOq+jLM7iGPkPmijpXkxIh0=
X-Proofpoint-ORIG-GUID: _W82jPWmrOqKYao_IXYm8G7BveADCAQg
X-Proofpoint-GUID: _W82jPWmrOqKYao_IXYm8G7BveADCAQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160046

This change wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [1]. This v2 splits the change in
two and addresses review from Dmitry Baryshkov:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

[1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---

Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 +++++
 3 files changed, 187 insertions(+), 11 deletions(-)
---
base-commit: 87d33c3916a82e38eedec53f4afcf2c620add47c
change-id: 20261116-talos-lyra-cypd6129-v2

Best regards,
--
Akash Kumar <akakum@qti.qualcomm.com>
-- 
2.43.0

