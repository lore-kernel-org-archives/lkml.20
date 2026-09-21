Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CB243B3DA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008858; cv=none; b=lEFeaYJ7Ngz0KeczedMOq1DElEMM+FqWeB+JsaxvZFA97Q93QITg5tJ6kIMHwKX/goO3PXg7mTqBP5CymGbxJrrwwjLiZgGMNFeidbcO5qYGoFwWjLD21V0qjqCOINnLFxSQ0SigQwCZGTELsqgzQsjtQwnAbtCorqRvHH0e/yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008858; c=relaxed/simple;
	bh=aPRFTfaDdQ/cIK6dxLg1FkjHq781avSvKFMf9yuKRGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FaKAGUg5OpYWqeQWC3R500SkQyAC35FjCOs8sd4c6YuOr+uy3TUY31i5k+x6xSixSGTk5HmRDxOTldeZf8/yiAVTpf2ojNEeTxxsw1s2neRqzx1S0VSYtgGW3sJp7Z4QNmZ0QeyNc0nhiO2qlTTgPHRcKB1VgRh9cEBfYhl4yJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxtQFGb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvpWEHEw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxtQFGb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvpWEHEw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA79A2690773
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/pyCwnstMS7VkKSak/8GHk
	37JiiJroPOTNDhKBTMBlU=; b=jxtQFGb9bSXVOWE55VwC492u5Q484rpC0JeQLW
	cSRyyfZVfcFW7k2YBBmE3mO9tFR2FBPt3msp4TrGOsAC1W6kA6imopNUBgigQk94
	pGfJodZaMw2T0qnwSHTTHwMozg6YVswfyFwppWwleMQXEsvqa5pLRH3YwoR47iWj
	qroxxQIxZllRrswa5iIeJxmtDh26VN5aZxzFA/LOOrG7ql/Kwcn1pV8Z+qhnRGaf
	E47tN3ZkxBFaHEJlLTGg0bjCUzJZYp9A7/uYr0jqm1y+PvMQNtc+99Kx45Z8gW3A
	eGaqEJHbQOoeV8WC6cfa8E61QsyLG7y+0Deo8jyG5BY41DrA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wuead-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:40:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-868f443cbd0so2996567b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008855; x=1790613655; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/pyCwnstMS7VkKSak/8GHk37JiiJroPOTNDhKBTMBlU=;
        b=RvpWEHEwRP9LTlmNeh3m2VAqjtfKvbivWWQ7wQ8QMUudLHWqj5Z+H61A2MCL5bDUhx
         zYdYmSWKPdTcc+NB9CdSngKQbwYWNglAgowLXlRIqZ73KCMoUX8/18oAnbiVHh3mTCJt
         V0ZYR1ekLWELgpAiKQIAvtnsmDEN32HJW9whq3S8riogiBf32NRFEz53ZR7NgziaoXv/
         mJWZG0o9SouhKYERziQNeK9cW0LUq4/hXOQdAUKVr+gJvgDKWQopUSmTPu0sp+cugX6I
         9/RZsaxq5qWPJlonH6Rj9FiDwRa7QqlTwFpwHDB8oTF9va1fdFMR5rDaYKf9G45OxUf6
         i+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008855; x=1790613655;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/pyCwnstMS7VkKSak/8GHk37JiiJroPOTNDhKBTMBlU=;
        b=KVIH507XicsK6KeB4P0R7CF0Ne8p1OpTvgCPpyz3hzaUckC0tE4R1JJvVA84DcIYAn
         +9y8VcdwR1hDDskDj9R+hpGksPxAsq13o8gGQSevQWNi/ytRCTtnhs1JpkLC1gQTjFml
         PV7tcI+RjPd/pMpn5b/goNCWZyqZw1/jd79enjrD9lQ+0AMf4i7yqBqC+5Dvvf2SoQYx
         KuswDORAQbuNRWlRVuwvs78QNoqUl/bAfDTBKQ9sQigLmIUIXUjoI3Zr5aV8zvKsqzEj
         3URkTEcF7yimVpzyXeUUIgzbjmN4C6OVBmvq/apExORyXo+ZeiFsL5bxHlkK09scn6kg
         wzrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYCnVEPAX4UVfOrYSU0jCM/+o7vh+mlUrHBroeU9LrqUv44e3bpxyDr3N+6mYyudbowSs0A3WIy6cmnto=@vger.kernel.org
X-Gm-Message-State: AFuF++lSHB6HbIs5+ohANKTknr8aiOyrKUXrsrF2ytE6a4LUFObvL54H
	RzQ+FjifvTld9M9PfVz/AbxCWJ327WCDg29PW646Vl0bZSun0YgpgeDZ0YngTl4RLJVJM4uAyiY
	J7mhYjim84n0pGtUWkKlAmjFKxelp68+BMC0cel2LxmFPjdFTVCe8ZjyIeL4a7qIaTdA=
X-Gm-Gg: AYBFou1cKvhKGtOkM6tLNzM9uNPp8Fmrqv3rNw8gGTLtpLw+HYwCOs3F5jSxxqZqHVx
	7HRRsHBaPvp5odGer3+CwoSg5MiUCF588mJGz+BzkO1xrqS9wrjcYkrsh0tTuo+01xPccT5/wAl
	r/86NvMenOISSsCQE81inDG74aJvHEf1lBm2PA8yY4gFojF/weE+CR31k6OfOL+R6szDbdMMJTl
	l3C338w5LK2FkItzzDSA0c1SI15YrtBm7QRwEOqTOE0piIX5gf5pEfeDHwvwmaSB0DPya/+MONT
	dZ9Bh7UeGQyzEkDhyNiPQf8TkrkTbub/S0L1CaAuk9EhQjs20TFlFHApNUU5IxFExBxEv0iPWoZ
	pREhgqhu81cHhEUeWVv+VIsb7NrHQXOA=
X-Received: by 2002:a05:6a00:300b:b0:87a:861c:fed9 with SMTP id d2e1a72fcca58-87a861d03e8mr3404916b3a.36.1790008855331;
        Mon, 21 Sep 2026 09:40:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:300b:b0:87a:861c:fed9 with SMTP id d2e1a72fcca58-87a861d03e8mr3404897b3a.36.1790008854819;
        Mon, 21 Sep 2026 09:40:54 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe732sm3666086b3a.16.2026.09.21.09.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:40:54 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: Add camera clock controllers support for
 Qualcomm Maili SoC
Date: Mon, 21 Sep 2026 22:10:32 +0530
Message-Id: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAABesWoC/23OywqDMBAF0F8pWTcS4yPYVf+jlJJnHTCmJhpax
 H9vtAspuBm4F+bMzChoDzqgy2lGXkcI4PoUivMJyZb3T41BpYwooTVhlGHLoYOH5FZKrEujmGx
 KUTUSpY2X1wbem3a7/7LXw5TQcS9bCKPzn+1izNf2GI85JpjkSiimlKCsvroQsmHinXTWZmmgl
 Yt0J5q8/idoIkxBRJF+NKoiB8SyLF8cKzfcBQEAAA==
X-Change-ID: 20260727-maili_camcc-e4fd7c94b59c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX1TKL9c78m0Sx
 p4OPYZVCX5rchOtqBSYVAMUjCFf6BEHr77tFOKj6K13NhU+0kFcCcbp5p+gRa4u2DkbdS12uZmb
 zKbLPQ/iy1OVfntmPgHBCsayY2d9u/W1r5Fwp56ymuQxPFHwlMqozcuN+vF3Frc6WTxrGGt5HS7
 7WFCmoPYSrDYlN+OqKE3WFwqGoKFrbyz3H3alvyEr64ag9DJCHbqHTIeODPrYUKCJrTEyfGEwsI
 iF0ybDpoCHMK01kT9YoJAJ3bs9O3zVi8+JC20+CHytsLpTNH/c8n3q/BwmS0LtIY1OjH3ixsFmh
 /pfvXEPz2KipXhE8/hv8sNCCNMwyzXFJ2gpPdYkgdtWyZCtmlzKh5gUBKDE3/FYF5cakavj1B/m
 TZPrFdYiUZ5t2Wsca1xfP4Hz5xOZnDJ17QZ0c15Xvgsd/B93xwlGYkVDe7DR3a0CC3LHqsqr0l0
 wRIOV3YRnER3EEYoXug==
X-Proofpoint-ORIG-GUID: z30ReVAqGZanN5ujVTdnBx0FHTVHLJAb
X-Proofpoint-GUID: z30ReVAqGZanN5ujVTdnBx0FHTVHLJAb
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab15e18 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6kXFD9Q68pQua8COPXAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX5P/0gKJUUEz0
 et03mLMfKHqX2jJsoAm4vt1Y5Q6N7G4HmdTfqFwmBslJXzd+0fDPz+3UG7ow0gRYQaINPNulBuz
 kqi/i2cLMTIrBYF4KoePwTyPfrQI9PE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210243

This series adds support for the camera clock controllers on the upcoming
Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v3:
- Dropped dependency on Hawi camcc changes as they are merged into
  linux-next now.
- Rebased on top of linux-next tip.
- Link to v2: https://lore.kernel.org/r/20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com

Changes in v2:
- Rebased on top of latest Hawi camcc v3 series.
- Added interconnects as required property for Maili camcc
  bindings patch inline to Hawi.
- Link to v1: https://lore.kernel.org/r/20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com

---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili camera clock controllers
      clk: qcom: Add support for camera clock controller on Maili

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +-
 drivers/clk/qcom/camcc-hawi.c                      | 158 +++++++++++++++++++++
 2 files changed, 163 insertions(+), 1 deletion(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260727-maili_camcc-e4fd7c94b59c

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

