Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1CE35CB6B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182213; cv=none; b=oKwZmqiJwV+vorsxO2cD8fzyy25MU49yh9tUrpm9clgTlyjfEOmZYEW5BBw4ZsulYIpZbu87UptehOXv2UiL+Rvhc+4/Q6tYcoL1SQ5uQt32Ju169S6bOENIq8n/BnZIVPhxo0MzW7hCsfcfuuw+NgNwPjrzIz2CYYFCla4oKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182213; c=relaxed/simple;
	bh=jgiNldtjrq6+My8uOdCwiCVWC2Bi9PZ9E17T9SMDTZk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HvCnVGJSfixWjQ8Hu63Hz5rhj3A5euM7U02tJlGmXHV2njUMFGYGPh36HrJnhRR94VuRf3oCLIJXpldIrg1qoEi5U3rPe52d7YUYuVK0r0ugwHHpzETctcU0Bwh4JJNXaUemNthmYQlgQ/6mXnXA7T1kuvDLFqEY2tHiTzKmfFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6Q8Qeh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UH+TY07H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6Q8Qeh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UH+TY07H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6951024l470698
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 06:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jge+QnRU55BG/zelwO3Kxp
	qdDU0dzzUZftNxrkgOB7A=; b=p6Q8Qeh61Q4VpLRvN9zr5ilIQ8dn4JJMrBh7LT
	PbV1Lpq5RN8ROrCxQSRmdA0MbA7atyBJZxPWo8Aho/R9STwNF6nF+yzfNfoFQaKW
	yvFCatRkfjpIgdLI9jKC/zljQ3xPO7eem4TDi6Xo1W72oCK6Z+8Ah6SZ7DKZFhlW
	OUddcWqq7LIf70uIbYZS77dbtriBWEc4gN1bkDrGDPKTE/Zk5DIcLBcPASXmrFPw
	Lp2xLfHEBcRK4BKXhmS7tb3fIjOaBwwedoVmjmqqtANUaDuPRgv2uGo+J1JrA13S
	DkqIimLJJEsTozNNQe30/Gdqi/K2MGKrrnVrA+eHesyEkvoA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssucrmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:36:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510a481ae9so2712289eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182210; x=1791787010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jge+QnRU55BG/zelwO3KxpqdDU0dzzUZftNxrkgOB7A=;
        b=UH+TY07HWjkQ/3J1C870hisDiIdOCWty9Y0LrNluLSHMnYT5PtOlt7zsiQjuN+BKMx
         hC5f1l5BHTFTG1GHEgWWtI96GPs23CtAz+CQVNPrIX9LgiHHAonuCMPwY0ZxfrMlR64B
         TD4O24CDDovhNdoxj5TWL72oJYcbYmtxdMMp7kjzXBzIOYLiYvMmyW6ZyqEi3Kb0wyAO
         Z2vKw/9nrz9giofYHwMZb9q3YZiQ71bq5Gv+cG3bOuUUWwdTM8EMxMh4IinstGvbKGsK
         USlxOxeAEgRz41fdqFSRQH+820Nyj6qJhPdwW4gwYpl8a6vqGty1zEIjcxeuiyQD4FRp
         mqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182210; x=1791787010;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jge+QnRU55BG/zelwO3KxpqdDU0dzzUZftNxrkgOB7A=;
        b=j9z4SrhePoKrSNOtpg5SaRMg7s25SaDjc5v0hMBEaFiBAjEriQRcpqiNEKMumQW2JI
         /uzi1S48XEIxKdC38rUrlJqEHhHdW6aSPI70wh9p4c/Cn64itwOsB7pKQXubFTzVWPZi
         6aFd9ny299PvLUAw6AZ5acXBTexbuRpwE147DC3O1hmmv9lZazwe8KVQdgRRFEAO4+zl
         HtaCs63b/dneS0Ot4dVHu/bl5Skohlc8Tbb+qNFilNvOJ7amXXfHe6RLK+fEXt5HbDXQ
         uou8UCoe+hFlWlCpTUFdtHnjtP+a/UNsrse3tKvrtA1zXMm0X2I+aASzv24szZyccpaP
         arng==
X-Forwarded-Encrypted: i=1; AKwUvBzsFi+qTm+idFdTgCbhfx9RQ+5VzmU8cCJdjPjPumY7O51/Ghx02I9sYQOR08dyaz28zcR6Ukyfj2Ysq5E=@vger.kernel.org
X-Gm-Message-State: AFuF++mrdjeHguITEbkKGk61n2p1qAG5aCiMSjkL4kc1kpBwYQNdLppy
	ro8IR2J8p9VDgUWI1IM+LLqmGVxYox++PGEXCAJUr2SXbT6O9KazUfjwdB9gMfhsJdDVCI9Hyd8
	8SuvZlhT6gaQMRsxBWrEIPJhEfXOGv5m9lI4xIuROs5TNeJP1N/Ie1NiIRuq4dhPrgy+vpe3HVk
	0=
X-Gm-Gg: AYBFou2H2+QOtAN3TUbtzANYUMVDB4Hye7UfPuN3Cq5w/YSQ0YVMJJWTeAyiKL3D2yF
	yXEsFvvdj/DzWlD3S1QtLUW07rIL1RsHlolE8rak14jCDzcBZIRzHmDuld3mbw/VG4QZQbuhaFz
	rR2zxahJbDWF/Iy6lOfkNytoiFkCSr2pZl3hdN7nPTaXm2bi9lfGSLj3Xo5STCQlPRZ0IelRatJ
	DRqsb0sXDFXFhHjTTKjDrBWSQ6L3tApZTaK92JU2ZH7dNfKgu5/Y/GOUW8NRmYrw0N+lZzF50JW
	lSXemx8RqDQD1G8q9Z733617ibGRASun2xN7loB88XKZ3eM2my4MUOkF4WajkRdfPV//HV5Gulj
	bhteEfXrYBpCnNrDXvFls2eG+6x4ht2lhd3ftNLULeJihVsVvbRA9/AC4Jxp0gaqqA3XZ1ShjgC
	nCFgJGV6uOYuqnLSQvnLViZ00+x0SJ
X-Received: by 2002:a05:693c:41d7:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34f21865577mr11543790eec.32.1791182210108;
        Sun, 04 Oct 2026 23:36:50 -0700 (PDT)
X-Received: by 2002:a05:693c:41d7:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34f21865577mr11543766eec.32.1791182209534;
        Sun, 04 Oct 2026 23:36:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:36:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Add support for USB phys in IPQ9650
Date: Mon, 05 Oct 2026 12:06:25 +0530
Message-Id: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpFw2oC/3WOQQ6CMBBFr0K6tmY6RQRX3sO4aMsgTRS0RQIx3
 N1SNLrQzSR/Mu/9eTBPzpJnu+TBHPXW27YJIV0lzNSqORG3ZcgMATPIEfi1HnmWpVRuyAAWyML
 l1VFlh2g5HJfs6HYPsm5ZMq08cdNeLrbbJQ0NHZ+FAgDZDNTWd60b4xe9iMSrMI2FveDAcbMts
 1xJFKD3rffr212dZ+c6jKjp8YMWIBYUA2pMIUuspBa6+oPKL/TdKgMKeU5bTWAqpX6g0zQ9AdB
 jdfpEAQAA
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX2m3rFBfcUmZh
 1UC5mwvE0g1IphmncMXCijhLUdLKWzIPAC0o/8fCgDwIaN4YKD+K7MNEPZhz51jxrODRsr0SCuV
 xMcyr1NJ+ulN81SkTNpshRHbCkgMWVw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX4OmOIySYlZYq
 t6tH7p2rS7CuMO3iIIvRqyHoPB3RDSxzY6Za22omzGZWjUDB7hdubngD+771k1zYiyuS9l/VsMU
 OM5mcmi2DkTqo20qvIzAfnS0PxuaQwpNb81CQiWgnYGvUxFOAJE4SRzb8iklCW0Uf7FI0ILTq2Q
 T3/Vf3jZ8v0c0PNpw43dMbnRuHeosNIfDgHhEvjOQxJnvMe0K2zKtE/MwEVTyQycNDq7FQaZQpT
 8Qez96yw1CFqwTAU7vHdsAPG7xJ23Tu509Tk1MjTKiD5FGKuQ9jS0sotIqNCnQOCztvz+cQNwoR
 uzYLA3DBL2Nugz761BqKQLtlk8K9RBInZV+Tpvpy99JE4kAQPnXIiw1EoaAOoxvZPkaVLk05riI
 +WAdchV6V71cGci1a7y908ItkSjp/BKzW7vO/H998EmLVqmQZeoxT8rTSZpvehLaSY657BAYisT
 hLZs3l7I1A1mc+0a0Cg==
X-Proofpoint-GUID: Kz3y5pS0Wl0BKTzaWa9JpYo8kNvraCjY
X-Proofpoint-ORIG-GUID: Kz3y5pS0Wl0BKTzaWa9JpYo8kNvraCjY
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac34583 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpprtx7nRKxrkFoMJnUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v4:
- Rebase to top of tree
- Split 4th patch 'phy: qcom: snps-femto-v2: Move PHY init registers to config tables'
  as follows:
	phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
	phy: qcom: snps-femto-v2: Move PHY init registers to config tables
- Link to v3: https://lore.kernel.org/r/20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com

Changes in v3:
- No code changes
- Rebase to top of tree
- Pick two R-b tags
- Link to v2: https://lore.kernel.org/r/20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com

Changes in v2:
- Pick one R-b from Krzysztof
- Use qcom,ipq9650-usb-hs-phy directly instead of adding a 6nm compatible
  and falling back to it
- Change pre/post to pre_tuning/post_tuning
- Use array count instead of terminating entries
- Fix value/mask mixup in 2 places
- Link to v1: https://lore.kernel.org/r/20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com

---
Varadarajan Narayanan (6):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 188 +++++++++++++++------
 4 files changed, 263 insertions(+), 47 deletions(-)
---
base-commit: d64fba75362e3459e48b74f0484f82fc1b805d8c
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

