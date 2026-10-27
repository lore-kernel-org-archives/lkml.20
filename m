Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124521;
	b=V/ElgNYkc6yGEEHtQS2Y/MSKqGb9YyDLa2QfBQ9jjKGlmgL+NAp/cph9A6bSX68V52Hb
	 4zkzNepmjJUsjcienrRU43J8/f1xAM48KNSr6ucPFE0bdZnELk2s6eMbE2NguIN5STI2f
	 1wNII0CofJTZS+6cXkTFasm9oDJqRkq5Zh+d2h3Inz+EpTMqv3Z3lxgjujGM5HLobZtZo
	 ZZRlm61tWjtv+ocElFb2KSl+TbDEYWIAgREbAD4o6APiS5Aq9WI8Plxf6WY6OjHHodfsq
	 H6DAviwjuuasD0Zb7Zzy9p1FIygE1S290wTuV3HT00IRnhZZOYFQB+2fWygXqF5P0kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y8i+0/bYzkCsLjnd3wJ0YPHFhoKgmno2YUxASoV3BzE=;
	b=fPgF8Ne/BhbpOImEz4pKyJF327xhg3OgOyzv6OaPFbkSI+YhLSjravKuub96qyun4XDM
	 95V8/bczQp/jvMtGG1Nef/JQSAHW39zmLAZPZZbe57BdSXaHRj3GTv9/842ag3/l2wGO4
	 qt6/KTvJ9x3/AqmCpSnviGNi9hOOiiVWnX8YCFmj+wttzg4aF1jMMY0ySwbpsS32PQA2e
	 rpLrN5dShv6itBL5vW+2oBlNPNTFjinKtihn9XKhsB92oN1DLob1k6czAgb4oTFuA8y/9
	 1tFtbO7O1sLtzodmvscl/Kv/g/en7B8mlZPaM5CqH83oUJc0QnczAYDKRjqXnyBlF2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f8g//xNM";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hv6GFNR5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2604B606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2604B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f8g//xNM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hv6GFNR5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH06xI1743312
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y8i+0/bYzkCsLjnd3wJ0YP
	HFhoKgmno2YUxASoV3BzE=; b=f8g//xNMWARPJrmhNIZvM2Uf2d32EzrzVbirA8
	bOnsZ8u1Q+5QMeB+xxuRJiEOGcpFuX02Mh0XRNv+RJp8R6u0szL6wFr1y7gaG+dn
	HawiE/+/7MBgF45zk7X0fKuwJGhJ84W1J/4gWmKIj0O6tu3KHg15w4p9JMH59rN9
	gO+CHVNDRYEW58UZfwudfxvJbRlffKe+DQLKLqi3eIM29UsRTw2fUxXT9+iuNU2m
	8NXtnE2tpj4ekgTOwdhDEVWh9cm2d52xPZwzzVFELBD4MLcQaDu4msqNbZGo3Rr8
	kiHYtsWznAGyV77PjI6Ad1wjZVr3id0CpaW+7eLhLk+qT8LQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux99j77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:08:39 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a2f2ea3c3cso162871c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124518; x=1793729318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y8i+0/bYzkCsLjnd3wJ0YPHFhoKgmno2YUxASoV3BzE=;
        b=hv6GFNR5AjGYikFcKglsYPutYre8VVxY2P6NJpOMP9lhefPYt/vk6k4Tbj1rcScMLn
         t2VE8Ug4eNp5qfW1SXfWAXMd4+xvm8oaMHQO0YOVwKFVHxGJ38duKmF3hhVciAeEKyNY
         Fss3eGDYizKTeLqCLLJU8wCj7AhZxXJfQ54sIuXIV6mDjll8GA7RP8kcecfCJzqFXkWM
         oLYMXgm73BEMBjxyDX1HpL5/WjTHEeH3NlUPoSDq3KSmfSeQsNDNJPNi2NjAN0XIpZ2g
         xbcoUm3eqG3hxNX82q4JuXv1TB3qWd4bRF6AHyG/UiK7bZEZ1v9qMFgil6hkwSewWn17
         VJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124518; x=1793729318;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y8i+0/bYzkCsLjnd3wJ0YPHFhoKgmno2YUxASoV3BzE=;
        b=z21CLfJn/8P/lHZWNMkuiKyQY2J3CMj1GO9Nb2X0CpZyCtmv9iyv9QUow8PZ96OGrt
         gp0c7LkgRXoE4M+ESXYmZDMOKIHUJSDl4gjn0ELoDin4rQlfCyM3+Rav/LFQJ70GjuzU
         +kqTojK1OtX1q0W0f7FI761FDOos/dsL/2Ib7RwUcXpKyBxKjl7BY7IWyUW59EPBTi3W
         J35C6hD9sBVEVdFc5L371a03s6PqNWeFEqHF/Nh7xLXHaX9IUmDx7UrbA+nUlOcYqMkX
         2gvSP9BDnoI1aZ0xNLf4GrGE2Pmoe6oq2lVckPCnw4nnsv0FHZ7uMe7Hya/ZIH+6kMPS
         exow==
X-Forwarded-Encrypted: i=1; AKwUvBxHY159jZkQcLZ5xPrfDEM3HqIfNktV7cEYvDOuZCHE1B3nLZ8Rh2Po/MV3LJG4QWkexYiHwKnGGXGMpTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcXL1LyYF0qsDIx0zvOq8o/DhWcRiLsjnvVVVI+LzlU4Jh54bm
	FZVjUo1RCiXjARk0ULuyFeBIZi3BSL6TsfqtXCIRbW36/GC43lgs32EY+ftIIIJBCn8vjYX3A7t
	0+H+jdu2tX0/4rneXlnmwtLVui9QRImpDmHpvscnJQoJDbFXQaVHaXK7/TrykRAKuKy0=
X-Gm-Gg: AYBFou2C0jjydX/RJ5MRBY/goHV9jbg+eTk7jjL9VoRwBEaYbQUIuKyefWTDiJTmWZr
	CGiB1D2R7xd80/Z91SeqITwyff6m3kF7hqb/7fi9fWDIOGsJwA8uk2433i0p7Y9mjDtbOU/pkgn
	lwtTqEwCRbyLheZe9c4udjqxZbTx68oUc4hbmY6Fo5EhjtG8GMCfdLONAD0GQzsXXcc+e6LrYrh
	goHQMVOzU/YIEZgE7rGcOIMcs6pIuHR35dcUGxRg5Kgt1CVuC/gRjP+8XfKxi7GEZCQOcsrlsf/
	MNlR08UkaactefQuUQUqW0OZU/edx9CNFhM4q9AWH3FFdpQWnMi16uhwluES/sTajDJS3n1YXzO
	K9Sv1Thv8rb3yX1HMB5iIZYyKjm5O553B3JHGMDIF45ORu6BfpWeU05cESEhgMC1N6akroXdmIA
	==
X-Received: by 2002:a05:701b:2405:b0:193:3274:aac with SMTP id a92af1059eb24-1a6cf72b9c2mr932c88.37.1793124517466;
        Tue, 27 Oct 2026 11:08:37 -0700 (PDT)
X-Received: by 2002:a05:701b:2405:b0:193:3274:aac with SMTP id a92af1059eb24-1a6cf72b9c2mr894c88.37.1793124516585;
        Tue, 27 Oct 2026 11:08:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/4] clk: qcom: Add Nord DPRX clock controller support
Date: Tue, 27 Oct 2026 23:38:25 +0530
Message-Id: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJno4GoC/23MywrCMBCF4VcpWZuSG0115XuISMzFBmxTMxoqJ
 e9uWhAquBn4B843I7DRW0CHakbRJg8+DCX4rkK6U8PNYm9KI0ZYQ/aE4yFEAxczxgmL0kYqrVt
 BURmM0To/rdjpXLrz8AzxvdqJLt8vI7dMophgIyRTjjtCr/QYAOrHS9116Pu6HLRoiW0EJn4EV
 gSnBG+EJa207o+Qc/4ArZ2sUu0AAAA=
X-Change-ID: 20260903-nords_dprx-4903d7acc841
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0e8a7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dhWb7Yg5Oiobcms0P14A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 7LSI1xMcpT-DJCXvbCLhmpEE4tyFHPo3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXxTcXKZ3krklo
 JtrarJYZYnVN0NBI0SWdydkisSOMv8MkIYBQaj1cCZvPEsvpXywd+3Yw6kWKbPeNASsqegciyJ4
 xkrA9pIPVhrV1aG4ghDP8CLGXecKWVOXmb9XbFN6lcknPqGm2rGYsJhk5FVVTwqKaojSVTkwh/B
 +WfVB/9f1NKRAU90xpxjU0y3Gqhq87zbZNod70DfiPwBhOibr25ksV2/ZMox7EpliG8kOYyVx3E
 6SlkdJ79dpCdapie+WxxhuYYuObDFeLofi6yJPGvVjsr01OLStWHjQ9Di37YhI7nX9fXupIbaF6
 nz1jdAyx0qsqCOQduXT6/4J0ZFzsIlE+/TxrhusA5hEA2g8APh77B9pUwhcSiArTnN3Z9VikKY4
 JdIVg8nbZxe8ys1Zg0emN7iF7LKYxqEgNqe5lxQAtifYE89tvMO2XNEGS//49rW31NolJw9P8JJ
 nlOgGBGwxwaTs47RCPA==
X-Proofpoint-GUID: 7LSI1xMcpT-DJCXvbCLhmpEE4tyFHPo3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX38IxjXUYrfAQ
 /fCGOs1wgsmGjsX7XS124+y/plW6KOlTu1T/uzAVxCV+eLttz4Yqpv7QA2J/UI95ysu5T8mfeXl
 o1CLtKtV3l5yX4OraUE+06PfP9qhBp4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072

Add support for the DisplayPort Receiver (DPRX) clock controllers found
on Qualcomm Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with their core PLLs.

The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
been widened to 28 bits to carry the fractional word at a finer
resolution. The alpha-PLL core must support that width for the DPRX PLLs
to lock to and report the correct rate.

The series is organized as follows:

  - Patch 1 fixes Zonda PLL L-value rounding.
  - Patch 2 adds alpha-PLL support for a 28-bit ALPHA_VAL width.
  - Patch 3 documents the Nord DPRX clock controller DT bindings.
  - Patch 4 adds the two DPRX clock controller drivers.

Changes in v3:
- Add a separate fix for Zonda PLL L-value rounding.
- Add runtime PM support and use masked divider register updates.
- Use the preferred items form for the power-domains binding property.
- Link to v2: https://lore.kernel.org/r/20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com

Changes in v2:
- Address review comments: remove unused definitions and includes, rewrap the
  alpha-width ternary, and clarify that DPRXCC provides clocks and resets.
- Add RB-by tag [Abel]
- Link to v1: https://lore.kernel.org/r/20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: clk-alpha-pll: fix Zonda L value rounding
      clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
      dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
      clk: qcom: dprxcc: Add Nord DPRX clock controller support

 .../bindings/clock/qcom,nord-dprxcc.yaml           |  67 ++++
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  10 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/dprxcc0-nord.c                    | 441 +++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c                    | 440 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       |  27 ++
 8 files changed, 995 insertions(+), 5 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20260903-nords_dprx-4903d7acc841

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

