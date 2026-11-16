Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834330;
	b=yvHXz+yPaDH10z3jpyHdYj83ZmT95r1i1ST6wXpNCgRnKzn3ke9/bmVWxeFSTWK0Xwmf
	 a/M4R3heRELIhapUQQRBJOKON35jMxeiOo3OFgOokCYytAvsZxFbQcM37D70X5uNbPHCv
	 VwbQMjHqCuKWEcBF2W86ZbYJwuHQMI0wqUjwrSoPhgpM1drimzHPgsmEXYgZkJ7SsxlYY
	 JWmX7TX7YpA9k5gHslH1F6jWKZrTX8WJsp9kYjfpR3sGkk7DTsv3E1JfagO0x3en48FQp
	 PFwflU1RJDTtdytYYIK87pFGVMo2iZ5RfQxulvmqXDKA7u4zqYCnN2hWHvlTH6YVv0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V3YUcBNu4=;
	b=NhnODGoYWxufKQAVi6ssjPz5Byw7aIycwuVc5kA6sa+Z4esbhaPDXiuMXpRFO52WSx2p
	 bLPCJU9JcpythHXJTRTM0F1+VxrcFrjg/e8Ryu8Fl5OHKrwk+RqmSFoMBj+uJlNBJzkxR
	 hEVduXCeQGrdICif0rip7bctl1/XR2Vwwlvj7eIxz/A5pTemQEdlIcFo2XQI58YAtIRZs
	 qjuPzuUNpW3z/f4qzP0AFjesIMaMqz9JKgJ17xYMdSiyESs3jNbamsHzhpDTlImHKa5ju
	 h4a6GiN6p2ovZGrhz0gc+lNxSjp7CRqXY0af64vA7X45vQdqykUWpI1PpKB3/Hcqeng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPyvFpnL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xfc1Fo/o";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747DB606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 747DB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPyvFpnL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xfc1Fo/o
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC19PQ536601
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V
	3YUcBNu4=; b=bPyvFpnLgRKyROklELXNtZQ5kZezDQv1LObub5nqvucMHSGdO28
	mlwgUIXfsQ+t2SsrtcThzu9ume1EG6lshdi/LjOQcG1+onKmWL5TwCnDQeJcb3n+
	YYDALBsiH++ac/hT2paGFJfGjqP/G0FZm9jXbXAjht0KzuqTZVrCdWztVGKecsAX
	//HB/5el62HwqZIWpahyZvSbDhpbGZaW4o11S/ulfK3vlAViGmvzkYrIXQu8cirx
	WU2O0C1c64FNMhmWOZgDzNAwSo2DgVfED2i00nB9pkVcLbx2XxpWOXQPoTKHtGdn
	qkGXJhaEr4+DtakrL/5Xz2AD233PBX0iueg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqggmjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:05:28 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4adc1aca8c2so3605136fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794834328; x=1795439128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V3YUcBNu4=;
        b=Xfc1Fo/oSW8NVU2lqDz8umoMtSKlSPD/QCYq9VXrPvPnMHCUwBbBtHcmP7/iVpTOoI
         8BHxKBHbr4rQ2DUIyqKBP9mMXcYp+8t3VVn/0PleZN5xzEvozN5KE/XdUMoooVO0lkor
         Apz0xaxKjvMOAj/SaUOlUfxGyu/+W2RXldV7qAM0I8STu6UEXNqlU5q3z8lbsoCXtru/
         HpYoz2keKF1E/BSH873Db//9smYhWm8XB8J9P88thRUp7X/vIDX/hc0S/U6Hs5c7T13f
         KnzaAFdA1Xg8GmjrdYetlz1sKcdJGv50OTwBVEvglhSohWu9U9uLAx9ti4vIVwlHiaWf
         dLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834328; x=1795439128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V3YUcBNu4=;
        b=jRk1D6c4Q/m0mu58dlTOx/g0pFsxSAzoOYlv08Xj77pO2qUhHbd9bFs8zL5njaBZJi
         U8ywqNDPBXcnjHXCbzkI0N0H6140MHzuwAiVMYQf6+mjW0Zmoa1NqEZYCTuw8JaCYCNb
         +qv7HVMuy3Ncbt+VAJkzaQ2th6KU6t2HhUroWJYfpBtsLhmTHENhDnTY1CFTdzzc0AD0
         1VFEZHlFEqH+AuxGTVfhpcoWR26uT2SbwvBgNimZa+4I9WxUxwrpoH7VFp2K5t8LfGWb
         yQm1F7HeK9KzYxIQ4D00TWi/f439NdCjF/jxz68WznymOmDrJ02lzcbhTESSATfu4Rs4
         J++w==
X-Forwarded-Encrypted: i=1; AL+hErFbGvqiyEWZgdxbjor27T1H/45hs4jqvqK9ImMBwc22DZYH8fd6mzpub7jugcXz2sbA0h02XpKRGHLB0Is=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZjtZ1OhyybQmx/9LPykLWKh3zN2DUtwj5B1Se8emrKD7TNZPf
	Jwabx8fl3emzc1/K3fTxBoHBUTMRJTv06KzyCi0rrtYatW8vga9fbqBosiYBkkqEMU3MERxeeCH
	4rvyYNVyGbrsUrrygBlYJKnt5DBnSsd+IwG7R3cXUy05hqUIzFGxqwm6MMd6ngFf+djs=
X-Gm-Gg: AYBFou3UfjqMAU+M4XI7asnVsJR7AO/clKPbuP6aE8JSVvPaaG+GkF2l/DQGSbb1d5+
	Rk4k6MCUMmZcLMq2CUVv+m1MDZDR5buFPsvFGozWUom4jPBd0tG0hQ2E9o++L88lilgD/aza8kl
	LSJXfKaJ89/H+cBQCQjSWrRR7PIq1ykKZpc5i4eTExB4ZsAGKGct9HQbtXgnJQSu+0bERGaA5bV
	HzASkJeDvvXqKnE6K9OIMYOTodpv96vt5TyHVSsw+FNwPH1yvo+AOUfNb3WOcttnwBUxvOiqzkh
	ad2Hn50TUuP3kqbIDjk574dx+hi6qVv7gOHtkgdkfUtr5wafrvBaNHt3gB5cqf2r5DJNYnHOtYo
	3SsUjgJQndztoyIEgeBn/KES3AbFBFuVqmXowv07c++pfR+65zsEW0qvaJbClMRR3I1fTiDVwFD
	YV
X-Received: by 2002:a05:6808:4fce:b0:572:f1d1:d6b3 with SMTP id 5614622812f47-572f1d1e88amr4376808b6e.21.1794834328022;
        Mon, 16 Nov 2026 05:05:28 -0800 (PST)
X-Received: by 2002:a05:6808:4fce:b0:572:f1d1:d6b3 with SMTP id 5614622812f47-572f1d1e88amr4376778b6e.21.1794834327578;
        Mon, 16 Nov 2026 05:05:27 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3eaf6sm9895641b6e.5.2026.11.16.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:05:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 18:35:18 +0530
Message-ID: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX7rwRBpBCS1Ab
 ysHOafF5ejRBKvzCnqbvF5tI9VsyuKagcnq35smCQXc5xZBHxBcaJse4eeiAjQINStW/09ttQcM
 1EgV4wUY/49wfB524P6f5UtLSZ49Mcs=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afaff98 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oVCAav2c3y0N_-OfdZYA:9 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: AsDXnHdpmCMDZD6VHLeEOY5x9NKbwPyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfXwkJQaJ5qcBSc
 JZ55XN+2BC0BnYiGTE8VEXt8RISXoypsZ/vT3WVgkTq55wqk6WAtW3zxIHZ5dK8WrYKmdFbynCZ
 2Xv4c3OBEvZCflq0n8MrWuCAAnM9MZPMqXvrwiPutfiX6tX/+DnGmuDpvIx0vLUczs5z88/eU5E
 nMl6JD66hN/h3M9GJj9Bc2uLwy3TXeTAfgbIgkkheCoPVtLSlRVFvMSdya+Vmj0WdfMbdkzQqDl
 rRXlXQsls6IC6xHRadLdMTUAx7SDkD1j/NKLd6Vv7ralVWBMq7Fg9j5ubUa0Z91H7GuFACao9MW
 BEzs9sgvk1R3TOSTKGqTCKyp7xNAzOKTlo9rZwBsJUGYHvQlZCucETc/6SDap8GZ72Lp58Grh91
 bBGu6tMf6SHNGVOqiFC63qGSK5FbVfFAV1oXsDHHD0Ixr3A8DNL2JqERRzlWnwxVxUnU1k4zM0y
 zx5xlG/UHp6AZTRpPSA==
X-Proofpoint-GUID: AsDXnHdpmCMDZD6VHLeEOY5x9NKbwPyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160051

This series wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [v1]. 
v2 [v2] split the change in two and addressed review from Dmitry Baryshkov:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

v3 [v3] only added the "v2" tag that was missing from the individual
patch subjects in v2 (only the cover letter had carried it, which
caused confusion with v1), with no functional change from v2.

v4 adds a base-commit trailer that v3 was missing, again with no
functional change from v2.

[v1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com
[v2] Link: https://lore.kernel.org/r/20261116114908.1701258-1-akash.kumar@oss.qualcomm.com
[v3] Link: https://lore.kernel.org/all/20261116120623.1726089-1-akash.kumar@oss.qualcomm.com/

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
change-id: 20261027-talos-lyra-evk-v2-v3-3-658fd5a7ec99
--
2.43.0

