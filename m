Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D0E4BE444
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474079; cv=none; b=KbwQ2PwYte0KJGhHY8NrFKRi849L1j3J/hspWAiQSwnx6ey+JSg9CEoH6O79FDOHixn6UA+kVTfvdGfBSJ32P5JFjDfJDmaqhbgE8WcdpcUtTAUK8/jMya6CWhqjcjgvCgj+1tvm59OP6oLPW3dWXY2hoEvap3wPjvk11VE4nAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474079; c=relaxed/simple;
	bh=GEjLPBrVnRdlflgxLLipFE/ZN11/LiXjHbHLTZLfx9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ekmg9POjYOlmbPj8amN7mJRK57QounWVFwsrNUF2DEnXIWa2RbPaRDJoOJedKK4KsHIob1GOr6BBVn9eG8QCkza5YzmBQ8FBibfnx7OtNM8gFhrLKAlSMp2TpDGjDb6OU9y/Be5qb7kA+Ssrsrp041X5OJXAp+tb5vNZT36ARM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAzvNJFo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J70+E0Bi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAzvNJFo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J70+E0Bi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvWB2584523
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y24/WIErvpDgnwR3OkPWRb
	s6Sun6MQs9JmUqk5jN0Fo=; b=TAzvNJFo3Y5FG27lkHkf/XtiA8Xma5OGpUVDdL
	lB4IeDVKeGXpSFmgdVxsXryXkjeA4tD+eSGSgf+6y9Gyt7grACeLNKEx3KiJeT9z
	MRSA1PF6cAdbpk5sPEmtE9a8B3Pd3scAuN4M41co4IOpCmLOGA5pHHVo2DgWW2mb
	9t71JedWMhkdLwWcl6xYtrTzL9CFs1ME33s+gpPFOH2Y0uJNQIuOWBftIlMdyh9e
	4TftNOFSTG0pwNDwjp5kiGfeqtQQlKbOe+Nz4p41P+zpHbJIt+EaENJyzuBdeNMP
	S/H9Ih587rvQFndTddUlp5PzWhgRKfqOpcY79WQKyuXAK95w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9wf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:07:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so3466263a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789474075; x=1790078875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y24/WIErvpDgnwR3OkPWRbs6Sun6MQs9JmUqk5jN0Fo=;
        b=J70+E0BicFH4PWtaxiCAaVFbqYQdl71x0QPkjBmexIGBsxDwJ27YslRzCywSqgrQPf
         aG5xCbDG/aX+hzuHmEOg5csZ5rtvJ4IFwKaOYQApsAw49Ft25wLxT3INx3Edqn7/iw/N
         R+E9Jeg9KQbD+JDM2lWwAB6o0pTdPjQnvJHqzrVLgMTDoYp4Dm7gUaDuj2vLUZp6xHvq
         ouq4M4bxkVIIf/3VLXZgk+Lq0ulWOBSq2tOMNgtnfJDHLe8ByhZqWHMZVuFVHSuCir8i
         TpL2V46pwLgcy2oBUFSdC4qYC195uVktq1+IsZJxB7bLLjZkg0xGL/oNnJ96Yr2XyQ0F
         PbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474075; x=1790078875;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y24/WIErvpDgnwR3OkPWRbs6Sun6MQs9JmUqk5jN0Fo=;
        b=cLn+ujfmTOrEY9crwXIIl1fc/aShaRouFZXOGyAGDUGUyrl90yjs2YsePz+mYQ9Y/6
         ha2czLuake0oIyoJJomiHtvzy0atWr/UotcYSWl36VEPmyh0NXkLi/qQord8zndcdKbM
         94D/b/7McpfKSdoaCuHatjQg37wEapXl51WWdlv2aR7k/fCj1u37N/2Ut/gvEovhmhbx
         F2EFdXPdGm9KW8PlEDVUAMQfB+9L+1SR/mkq6N4u6QGczQSZJNjv8fLKMpzSxNAyxulc
         +4h0AhKY0umZOD2VgYkc0KY8jiGgf+JLDGIbRmKa3Nglpk+vcxK6BEw2pUvlscTFV6a8
         VtwA==
X-Forwarded-Encrypted: i=1; AKwUvBxn7wrHX/lnIuQpnOUT9U/Zdt4cyezwv1rCqS+CaGyhg9TxCrhIKeb63QIEt0G7TGp03/YZhXikJ6VaxP4=@vger.kernel.org
X-Gm-Message-State: AFuF++k2HsnO9fPPfzvRoQFfktNFqQ/9UMru48P0B6U1xQ73Mk6ELvaP
	Klzs2k4kdIWydBSLscgBg4kVLIZvqgOFNs9/EUrcAgsn8Ot+23+MmHG2ptG8g0lxW7LLgbF+8KM
	W+C0bW9GI3fAgGx3OvvEYsldXVcF1RNjD6JMoaucsoVjxkeh8dVuPLixBs9+eeP9P6S4=
X-Gm-Gg: AYBFou09cZngyR9s7lUcMGVWQO8ZnV8Tonwyg4uprn50ca5Om8IHwOi9MCRjZLfjsjd
	LZjFmk2eIuEJiP7c7onIsmfIQbijfvFDfJ6kudAnY7vkxt8cIvVxkqtiFYty9kUrVtr5ub1aase
	s21AFZ1sBGJlc/Fx5D+m1vUtv1YX2YLhyDe46gw92B0EHn82PAOprsLhm2oJZ9NfLgg8NrPBnox
	kk7jGLc/hvL6fPJ0BftlDUv2iItGx9WewqqW48H7QnsPpIFg7bgQRzlx6uRxUlNHEC55p+hXFjY
	EOn/mnv+bGvYRIw8UdpuBNuu4SBy45o2fNNJqawY0a0Zv7U1u5TdYy/w+Wsbsgoqnsp64jwYzWq
	SJOeG+5c6w6VGBbzilxB1M3N6za2Mulk=
X-Received: by 2002:a17:90a:e7cc:b0:39d:fe64:5725 with SMTP id 98e67ed59e1d1-39dfe6461f0mr7275112a91.5.1789474075395;
        Tue, 15 Sep 2026 05:07:55 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cc:b0:39d:fe64:5725 with SMTP id 98e67ed59e1d1-39dfe6461f0mr7275025a91.5.1789474074785;
        Tue, 15 Sep 2026 05:07:54 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdcb618bsm4905004a91.5.2026.09.15.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:07:54 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: glymur: Add rpmh LNBB clks support and
 update UFS mux ops
Date: Tue, 15 Sep 2026 17:37:30 +0530
Message-Id: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAI1qWoC/3WNQQ6CMBBFr0Jm7ZDS0CquvIdh0ZQpNALVjhAJ4
 e5WjEs3k7yf/9+swBQ9MZyzFSLNnn0YE8hDBrYzY0vom8QghdSiEiW2/TJMESfHaPsbfkuMSkl
 dkqo0aQNpfI/k/GsXX+vEnedniMv+Zy4+6U+p/innAgXaxjlp9dGcrLwE5vwxmd6GYcjTgXrbt
 jfaLLIswwAAAA==
X-Change-ID: 20260904-glymur-ufs-clk-changes-55264e596e6a
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX3Xc7dgAwkBUQ
 Q6/UNRCQFCygtyv4AAJyEfUy3zv1fJZsuC00xLL0uY1Rtr5SAztb6T0WTYRKOZ5fsll8t2Up2gv
 lcIocIaRn/TmlATfn+rkN/beWptpJ0w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX1zwk7fo7x2A+
 KhV5gohEqOFkQzDaWs6heVQhosYLtASiba8HAa35H4MZ0LsiTIPalS+t2DDy9j9Y4QRZZCY865E
 1xRPe5HVCivbCWgMHsOcTtW5hyEXQJojdft64Dzu421kbtqAYWKlpnj2CycokuAQ5DuOJASeDkA
 AmkbNyLW5sKvGb87I8LZrdwg7Sc8JB1m+POqEUsLP0Mec0lZCTx7cTUEwBZ+jGKZpkChZMuitWV
 AgHxNjPHgVaPLtoZ5yaKTDwYqCAJeRoTMRpt4XYaFDs+M3wwNLbyyUOSH+0p7YZHi//oRyEIWzd
 y7kB5EygFMv83pkTxBwY6gJOp3hNTZOSPDjztIcRwJtmpIwHz9ueBv9cTQCZ3oRYDArQruVwUyA
 VIjSKTKVAbQKvoq9AqPFzPEs3BDXwrkZzcrqKuNzUOORAft3YYnNs49n5xFcHjYjW/ZuaWL6+Sz
 ovispRNEunqdMVZ5RIQ==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa9351c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i2ruGUmHugH7EZfeDigA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: y5mjzeaUHU2ezZWB0WGUa9mwiLPXHwpV
X-Proofpoint-ORIG-GUID: y5mjzeaUHU2ezZWB0WGUa9mwiLPXHwpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150175

This series adds support for rpmh LNBB clocks and update the clocks
ops of UFS muxes on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Added R-By tags received on v1 & rebased on top of latest linux-next.
- Dropped bindings patch creating alias for TCSR_UFS_CLKREF_EN
  and UFS DT node will reuse the existing TCSR_PCIE_4_CLKREF_EN binding.
- Added Fixes tag for rpmhcc patch adding lnbb clocks support.
- Dropped patch updating GCC UFS RCGs ops as it is not required.
- Link to v1: https://lore.kernel.org/r/20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com

---
Jagadeesh Kona (2):
      clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
      clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for GCC UFS muxes

 drivers/clk/qcom/clk-rpmh.c   |  5 ++++
 drivers/clk/qcom/gcc-glymur.c | 69 +++++++++++--------------------------------
 2 files changed, 23 insertions(+), 51 deletions(-)
---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260904-glymur-ufs-clk-changes-55264e596e6a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

