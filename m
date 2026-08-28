Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DB73CB2E9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896846; cv=none; b=uei9nZ2pKZ4+trb9J/48KcIhrp1LO18ubgebkk0UNSZecOc+LaURXdjT37XeibqNKYRCC1fyOSArJtLWeiIBFPSkeXFZFTImsiXeWTgW0zeyix7ih14csTc74rZszMQauwSZIk04pI4Jk9rmBvQmeXv6tJ+xdBrnaNx4lIiBXDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896846; c=relaxed/simple;
	bh=Dzci3M4wYffoM945MQtL/Q2PsE8tGedgc89VN0a1iUA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XFqWNNyKigIQBPvj/47+Pw/roRnf1s/Ro04FmJ3pDCdLp/+9xq/nQA/UOtI4VwjEyrrm8KAreG5RORdkjPZf4RAtiTjG+iZNepl4htf5Lvh2h/UHhEbUZ06BUi7BCzf5+sB3lOXxV9hXqDIbWzv7yQLMg9lxqAzEFyjHTyXkUec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjIsgWu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTKLkcDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjIsgWu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTKLkcDs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3Jaos1263373
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HdQL8NnegaHyER5q8AZfRB
	ORVk1Puf3HLAKuK3i+JGw=; b=JjIsgWu3TzxTf30RLpbWvg07TDSUAPHUUHAu11
	Ft+qU4uVTKIuczCPjSh6cAw/QMRiVMWLMFL5kI2qZX6avq954Fng9SqOIejSowOE
	6mTKRc3X4dVVhk9WY9fv3SBVvnbMUKEi/ycGQab/MGEBhpzfiiiadAoONb8zNaGt
	ZClsr3eRcMXi1XBrOy9jYHUr/NG2qLH3xyGF8bR/2XiEsYpcU4/avFe12tVQS/Gh
	hB/5ex1gh00XTbw08HIbQIzWDf7lqvIBPobKqD8ZWUcWEe5cD03Jox5ndXLXF3s/
	VQTK8DTAMxdSL8DOgNQxSbIL2IiJBuHZMb6Joa3YkHMd8jvw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatkjjdxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:00:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso651992a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787896839; x=1788501639; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HdQL8NnegaHyER5q8AZfRBORVk1Puf3HLAKuK3i+JGw=;
        b=PTKLkcDse+X8AHK7quitENxaVtjAuk35YSQR+Zq2S5RQ9GvhZd3WJo3pR5Mi0cIcI0
         I5W4WVHjb30X9pMbDobH46EGmdqbokbv/ayZLkfR/Um7575a/HUeM0i9jtp8a7egEpRc
         lMxQg1YLj3366FpHZP55jKeosmxpAPtx7V9BNkWrz6q/9/i6qsLSsbTMjzE98yxc6Q3h
         S/YV/rsi7fI8YBsdNkThqZ96+NgnqrdvA4dwIfp4cmduFJRX/sPEwjo0MhWbK7qQdMsx
         r97ZJ06MphbCATjksoONeXPYK0U8/sDQ9Np1Vp/e/myUzzT1amNy+LzNJ/PghuUunq4b
         y/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896839; x=1788501639;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HdQL8NnegaHyER5q8AZfRBORVk1Puf3HLAKuK3i+JGw=;
        b=IJF+/RphlBXcKHqB+IfNlOocvTsR0hSjeA/Dw89ZRpOhC7y2moeGNbOFxIup0CM9F2
         SV4X2xPtl4WPN2nv+YndOX3nSlLLKmyGx5p49CsROO1XtvJL4th1ORrWVsFZvd7GicFM
         s1iHNoeVVUuVcb3to6Kdpv9rluXhYUVdQUjqsdu2QpW0uRIbEYEOhgIviynctuVfmsD3
         Zsr99yEd9P8T74AzGgfPKlqKBqsYLyUnuaWDpGyNYUUxyN1Bh+JbaT7WHNInOuJRKHxX
         9PHIiKSYjhGxzz0emfu847/j3QfzteHyHU8hQ/rimL59tnt4PdsSfvirG7W+NAURxL0r
         kwcA==
X-Forwarded-Encrypted: i=1; AHgh+RrWoGhWVC8jpEXEtPYhgWwaEwv51SQSiCUum3DEHgzthRZ83DlLoMgx2DW3wvOiN3zUSbSUC5tqJi419/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mAfDZwSQKLdetyPhMS79jIi4RbPIhWkfm28IdP4VjK0Q/nam7p
	eDQnB7/glnA3faXEhmQ7DfGtDoTUksfhJlxhmNn/tewiGPu8dIjcrd87u0UySHrUY5hUzyXkOz9
	s3pCLUGhZrIxCZBPe2KJekca5QlpDjUMCsZn3zop6vAfShvgGZz/8bELd26LrHSC6X2g=
X-Gm-Gg: AR+sD11HKUu8J4t2fOYl4ZK+XEtDiR2zjRaIHG/ymiVLYHcIIh1JZlsQ1L+Dlz3nF2k
	myOq/Z63BbjHlLxeddzkgpIEhTdIfXxqN9ZcARMft4YIgtY3v1JM70qKXpEM643fB6Ae4kg2TCn
	fRyBoXWw1qThGU+GBJf6a5RRAc8ckGHCYcEVXoRhFMzsypght8LmqFrt3TnRjG8cQa5eSFasoDz
	3zAvs5dApmBZgWwazl8iRExOWkrlhlJvESqlxxVU+q9VJvBYzenGQuj1C+cfgZ5bDBTMwfT+aRC
	NM/u8t4R/FKjmn0hxHu4eWxwBUUcmNDNjNI5kdOeahw9XZYxS8H8yUhmL1ibidmcG62JIXLMJ1p
	4HLIBvqRJEKMElxptyuBF8xet1IG1MYeTPEEEC7gkXKEWMYk=
X-Received: by 2002:a05:6a20:d043:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3d265e3f83fmr9808149637.4.1787896839351;
        Thu, 27 Aug 2026 23:00:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:d043:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3d265e3f83fmr9807990637.4.1787896838810;
        Thu, 27 Aug 2026 23:00:38 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm1759033eec.16.2026.08.27.23.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:00:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v4 0/4] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Thu, 27 Aug 2026 23:00:32 -0700
Message-Id: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAkkWoC/yWMUQqDQAwFryL57kLYWpFepZQlxqgRqu3GFkG8u
 2n7Oe8xs4FJVjG4Fhtk+ajpPDmUpwJ4oKmXoK0zRIwV1vESBnrMlBa2nF5ZuuRjFRAZibq64TO
 Dq09/dP1lb/c/27sZhZdvC/b9AF/yYIV4AAAA
X-Change-ID: 20260825-hamoa_tcsr_qref_0826-00c0aaf8bc3c
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787896837; l=4316;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Dzci3M4wYffoM945MQtL/Q2PsE8tGedgc89VN0a1iUA=;
 b=IykzhaweUorA4KEtC3dkbgy9QRsSGjVPuH0Tr8oVb2u2BFgcZkBx1KmrNQ1pmR7sXggMpvYX0
 p7ocBDFCO7mBEcYiUH4lIUuBVJiClWHQiu58YD33dY4JJYJqT+DYiqQ
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: CZZyWQHu53SlT6jaiBIZ0dz9GWNJr1FP
X-Proofpoint-ORIG-GUID: CZZyWQHu53SlT6jaiBIZ0dz9GWNJr1FP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfX0qsPrG2Y5KQE
 Q/Yre0ikUfJ1BcQNOLCEH1ZjUkMzLGDzG9fpiiAg0c1twlqhZr7AeMJ04BuEpJIHVLs1stWP58x
 bmOEP1uAUnB/1oTUNSjJLogYpG4YyAxUq9mZEAgo9ARjWp/gRVnXxhb/cWe0tqAOvfE6cPRyIyn
 ev52MHul9L8oT+TcLlhdstApKS6g6ppiGzBf6YmVbaiBcRwYsZIH3EnKUHHNTZKIBDILO468Vtf
 dU+TVpstxbHYZ3b60TbbMuzsK9cyszFmlQcgOhSgnosqAxBiXHNf6z3zJljVoqvC2Jl4J5HmXkE
 yaBg07xL6o99CwooYzUZSbPP2M0UclUdo/lrSiszSPrDrXgHmks6xFOptkEuUjaEaZb2301cb33
 782GKo8lUz6NCaqxxhK+edzCduqso7UWf+LHVTpkTTGvqKsL2bQ1STTaDnaNL0UGefvY3jrAZbx
 YbnEESPQY6skVge0bXw==
X-Authority-Analysis: v=2.4 cv=Rsn16imK c=1 sm=1 tr=0 ts=6a912408 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=IpJZQVW2AAAA:8
 a=1-vlQt8Pr-clZXT10UoA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfX2cSa3YfVnME5
 4ol2rcHlt5goCWeomEMjH/DHyidaNG38s3vTb417E627INisyJmRQu808RGlJhWwTa5T2zd2jUT
 vwj3ZlPBn/Cko72OV73kfNG28tC2r2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280049

The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
PHYs and requires dedicated LDO supplies to operate. The digital
control interface for QREF (clkref_en registers) resides in TCSR on
X1E80100. This series migrates the x1e80100 TCSR driver to the common
clkref_en helper introduced for Glymur/Mahua, and wires up the
required regulator supplies.

Patch 1 splits qcom,x1e80100-tcsr out of the shared qcom,sm8550-tcsr.yaml
into its own binding file and documents the QREF/refgen supply
properties, mirroring the qcom,glymur-tcsr.yaml split.

Patch 2 converts tcsrcc-x1e80100.c from local clk_branch definitions to
descriptor-based registration via qcom_clk_ref_probe(), reusing the
common regulator handling and enable/disable sequencing.

Patch 3 removes reset-cells from tcsr dts node.

Patch 4 wires up the QREF/refgen LDO supplies on the boards Qualcomm
maintains directly: the CRD, QCP, Snapdragon Devkit, and the hamoa and
purwa IoT SoMs (purwa shares hamoa's QREF topology, so it reuses the
same qcom,x1e80100-tcsr compatible and supply set rather than needing a
dedicated one).

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v4:
- Drop #reset-cells from the binding entirely.
- Add new patch: Drop the stale #reset-cells property from the TCSR node in hamoa.dtsi.
- Link to v3: https://lore.kernel.org/all/20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com/

Changes in v3:
- Patch 1: `#clock-cells` and `#reset-cells` in `required` list.
- Link to v2: https://lore.kernel.org/all/20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com/

Changes in v2:
- Patch 1: Explain in the commit message about the ABI break.
- Link to v1: https://lore.kernel.org/all/20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Qiang Yu (4):
      dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
      arm64: dts: qcom: hamoa: Drop unused #reset-cells from TCSR node
      arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 114 +++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  21 ++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |  21 ++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   1 -
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  21 ++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  21 ++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  21 ++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  21 ++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |  21 ++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  21 ++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |  21 ++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  21 ++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  21 ++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    |  21 ++
 drivers/clk/qcom/tcsrcc-x1e80100.c                 | 335 +++++++--------------
 23 files changed, 626 insertions(+), 224 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260825-hamoa_tcsr_qref_0826-00c0aaf8bc3c

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

