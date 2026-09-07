Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E51943C061
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769583; cv=none; b=WUnyTVDTOK8b/LT/G5i4f3687iNTT/j8XdBgM1aN2SP4bvnHEP8ggwt2WpsmYfiHouKUj5Go2IN4obvjPTIsuQi1ductIZo9DunPXpswxjIgbHrqkDWzp2dY5oGFPYGh9YicQb13KWf2ZYg/H/LyWHC6LVhlKb6z9EY49mCGwGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769583; c=relaxed/simple;
	bh=WRsRiucV2U720V3z0WbxA1CeS1n7DYpjh9vQrUnbRJc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PNiG12rcKr60x87kj2snXUKl3zs9lOhh+6wksY36TYfAWwD0AEhci3cCPIEDOXB9gB5K6o6IjSCKB/cMQm2FzV4/+cwM06NmazHz5N1qgDb4e6ub6RsUUTV6muM0GR7qVFVniR+0yn/KcnQqd6sy/FXagXJMrAViihrPRbO0+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am1B1pGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPcaf5o3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am1B1pGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPcaf5o3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777cbN2146227
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ibxb+Q3FfqwugpDb3vLbkt
	1RoFpIRGq+fnKvNs5nEBE=; b=am1B1pGKdXwVUKUXROqOLPUUjKk/HOjxYG/WVs
	goVRRTEmsffg/L/+IaLpV8rnCcnIUvkZPLpP70hUHxuEHD3bc/GlPOsV91rT5+Jq
	OQ8MzhKmRW6o9iiawFRyES7xk1ycE7Uii2i8uknSgOXg7k6IUg0eWgtL+eNC4DV3
	1uP71l3K/UkDmBkwy2oriErFKYFb5PkTOJgkrgiqK2za0qf1JwL88CwA7n/zwwTL
	AUyKl2E/0lK4dk7udEnMPQlhz8RyJ+vV/a6n1+blETauPtOfBftlqVKqfFLDcSWy
	3Epp/6i6w55cwrPBmnKYE7THSZHoCXCtPvR9NFAm5DreeaZg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdu15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:26:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso4542942a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769581; x=1789374381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ibxb+Q3FfqwugpDb3vLbkt1RoFpIRGq+fnKvNs5nEBE=;
        b=MPcaf5o3JY7cz5H4rzIyQm5Qzcr1iC2VW+95OhaP6Cpuj7v+wVlxO++tzFK4H2/0uy
         jHB57M72OHFUYwzSSB5R/RRgF0/wSFRX7OJrYLPlCUl7nwsrc9g3AFcBLbjhulsLssCM
         Aw0GyP6LJgk0i4geqtTZpqJYJKab098SexKtJXgJHZkOGxlJnHBlDOsJj4+hpOOnRTHt
         8f2KyNFBDw1B6wDeKRfsluEwR8Ppswa+Nixji6fX26Ba4ao1uu5/ZqFiiQ6eAg3XFNCx
         ZgJPDZlRMm1p77REOsNxb0c6HbljLqP8Ph2N3MxTFUfvIPzgQclLT+cthcmbs7QV1BUg
         t8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769581; x=1789374381;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ibxb+Q3FfqwugpDb3vLbkt1RoFpIRGq+fnKvNs5nEBE=;
        b=sAbrCnYlo4liqNm03KzokVL4DZyWvXz6/3mDMJCUrR8bDz07Iq9Pmulc/M4+Aw+fTp
         1j5gNPY4Fj9mmw8O/ua9KeeSp/5n5fMz49A3iyyYcc4KXY1mXJ0s+OmGqpLDQ0/JtHOZ
         L4kDJ2EHLw/7M4A7YQ+mcHSyBCXcL2USJIOQR2eCr5NagylmlFS+ENEL+Ke+VWNkY0w9
         2dAlpybZd3MuJkv8OFPZQoRodsA2qCIdA1q+h0SVh2RYrz3KifgB7V0cb5WsSkKqk4Pc
         OzlQaGnXDEwgKxNMWh7COZe3XV1nGTvacvm8pUNFchrwSLgq2th0QPc3dM6YiMDDwDMM
         giYw==
X-Forwarded-Encrypted: i=1; AKwUvBym2yMG0fTf/QsHUQFFRZOXYvJEX2z7MLvCoj1YpZ7ZwWjBS2bB0/HVBbNrIs32i90JFLhagv7QaMewgJw=@vger.kernel.org
X-Gm-Message-State: AFuF++lXKT32WvO7Hvo0lIammxSZBt3TGjXoI5DtZRfR4+8lBzZZXOhA
	VcjbLwxJ4rBL1Elj+3NntG3HM3u+gyitIpSJmXHB/V1QQMo3qKNM5sTunEjlHZCW6xTLa+jat7Z
	NkLfcqQIv/34uWfb/LS6+gLImj/W5R2hO07VxiK5F19SkYA+ybfpqKWn+oqodiFT0y3c=
X-Gm-Gg: AYBFou3ivSAwXq9Ep/2NDJxF75dqrR7RUur76M69StuCNEjZAdHqCrEH/aAc8Z6KgEe
	SjlR6pMrFpttG8HyuI4DROd0UpaF6pLjUo7ISw4mdrNEC8EcC8Xjcjfetl8nafJQcbSGlxf9vWp
	fSXP4B1bRQvMTplQoWt3HfAJXs2RxfAWkdaxKlDjm0L/yIIfe3SZo9p0rXfENNmh2THhUi0nzez
	Ex8JemG4yL+gavN1X+JNGgEQIMUenc0KhzBXC/syRyc+xznkodMnJ1mBbyRSoX0K2XXzhcikhKy
	Iz9pvjiq3unBqHg5nWdKzA/42suTZ5zokVy+6HfN15+uEvQbKSSrwcVaQeELPMlNiRElRNHA14E
	z5YwGYoI48RMN7Ts6VxuKQPWN
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr31098441637.4.1788769580618;
        Mon, 07 Sep 2026 01:26:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr31098420637.4.1788769580163;
        Mon, 07 Sep 2026 01:26:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm3423284eec.14.2026.09.07.01.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:26:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: qcom: Add Nord DPRX clock controller support
Date: Mon, 07 Sep 2026 13:56:12 +0530
Message-Id: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACR1nmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3bz8opTi+JSCogpdEyA/xTwxOdnCxFAJqKGgKDUtswJsWHRsbS0
 A1/qXEVwAAAA=
X-Change-ID: 20260903-nords_dprx-4903d7acc841
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: ErvYtAEMAwUW21HoJ6AA0e_bXU_Ykivi
X-Proofpoint-ORIG-GUID: ErvYtAEMAwUW21HoJ6AA0e_bXU_Ykivi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX18DZ0Ly6H0J+
 r/g/GqjuMjITCyn5V4J2cTsUeavasOGkKqE+NFBq2xdRqEAHFtO5EcnuUe03wmY5USiI8QZo4KG
 sK5bUE7L6mafykn02l5QIQE5a7W6zKfeHeHGiTKwOq5jPvqou4lFIKfwBWTbA5mkp6dbK4dsLTc
 jmnsEI6NrZ+A7uROp4UxLJYAdoktBZF8yh0WYWQwEC76cO6FF2u0lsdbBiU5Bfn9KXVSizXCxLF
 Ighr4ebOYXrXYmzJIzSKm8hLIb2PcwUNWMRXP29BeXZb/fGaErqrZwUKwhfITjHsLzbMWBZjirM
 qDyZbCdij3vK9Oow9yj8Vtcy28VNMh7Fwoi+C8efdbfMavnYPjGkeeHsM/JC2UQukSxq+yWS06v
 D5iLvZh6pE3hMNIIbvbhNtnb4GRU24nml8GNW4bXf/X8JLRUO/L5EalcISk7HqTU5DhQKcAGp34
 Tca4c/dxqACS2gsCs2w==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e752d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lgvwsS_33UyABBN7wXAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX1L+8r5gmyE8k
 bTHmiHzr1GqDcX9rDmkT9AMQNmXOFReWGH4YaMhgY7ygyP9/oiGWrVo/gyqBJhtdAyd4f5j+Tp8
 2W3GCHLe2C/MDgiFLWAYB+5za/Bhv/I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070090

Add support for the DisplayPort Receiver (DPRX) clock controllers found
on Qualcomm Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with their core PLLs.

The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
been widened to 28 bits to carry the fractional word at a finer
resolution. The existing alpha-PLL core derives the ALPHA_VAL width
solely from the register-map layout and can only express 16 or 40 bits,
so the first patch adds an optional per-PLL alpha_width override that,
when set, feeds the recalc_rate/round_rate scaling and the Zonda
set_rate L-adjust MSB check. This is a prerequisite for the DPRX PLLs to
lock to and report the correct rate.

The series is organised as follows:

  - Patch 1 - alpha-PLL 28-bit ALPHA_VAL width.
  - Patch 2 - documents the Nord DPRX clock controller device tree
    bindings.
  - Patch 3 - adds the two DPRX clock controller drivers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
      dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
      clk: qcom: dprxcc: Add Nord DPRX clock controller support

 .../bindings/clock/qcom,nord-dprxcc.yaml           |  68 ++++
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   7 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/dprxcc0-nord.c                    | 436 +++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c                    | 436 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       |  27 ++
 8 files changed, 986 insertions(+), 3 deletions(-)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260903-nords_dprx-4903d7acc841

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

