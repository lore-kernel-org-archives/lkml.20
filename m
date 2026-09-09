Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14009377023
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933696; cv=none; b=EJ2i1G+BkLkrU28ID+sQfdbpInLiPdo9/Z2SXwAkzJ/vvvXxYTPt9FMJzBArzZbeRxPnOgtGZVUkHm9KHWXaLWx362G9EjOG+j5afR8G+txy1ENuk43j24YxdLcNYqQx67ai+HPjf7BYU6BL1TSFKsxKjmvVlmggdS4Cz7+p+VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933696; c=relaxed/simple;
	bh=oQcQQHOIXjxvnk9uZE9E4oYNRnfUpbFQZkWv35uyGXE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TdtFy6aEvua1RxWblMPg8miuts4P/MBzuuM1hsqwTDYHJCTBliJc2p/G6ufj6zJCZoOWjueZWMZByrgUIGRqPEA2zG6xZCBVM4ufrmG+Za2WVixXXl+p+GKASCsZwsbn5xGAVT1ZLc0Nw1Cc1GfUppg7/QUKr0pk4QztTsrHMYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTEcXHy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZH1dXUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTEcXHy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZH1dXUk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgrgL337420
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K0GzJ31h+P3OloWw2ZvMbw
	NL8F4ayZYlLsmS8xdExT0=; b=XTEcXHy32jtEvb8s+rBHxd4XPt7xs0PGJsQZKf
	kCiyN9FgLDE38l7I8LvyUmdf0EnR99pNJTpo3mPener+9cGe2TlOq6RXpLroT8l2
	qMCwgZPCz10N5ux87a8xz4BPKjVG7ypCHTNyy0Ecn4Z3wUbulbQn6c1ne90Z+SAG
	WSWAAqTKLaKNjURDBWqsIITpCXGmiweU66OyHF8I79t6VgFKuShF9DaVlDlwGU0M
	rzSYwelWl5WG5P7unjBxEsRFl3AaWljzBKjblXAW1CuRjJPRLxCWnMPZh725jVG8
	14B7EW1/pJ8KA575EaP15NMnjq72GnIratNahTUpoVc8adLA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqe7jbcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:01:32 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1b19eab8bso3144652eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788933692; x=1789538492; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K0GzJ31h+P3OloWw2ZvMbwNL8F4ayZYlLsmS8xdExT0=;
        b=DZH1dXUkcqN4HQ2NC2+H+eD0x2y3NcHmG/HGtTWlwd2WxN1Fsa4YkLrNnv8W615xd7
         vXVktoDraCNgpQUSPZ2WR86vHPrvrgbDnEWx2T0mLBGaIc5EeAs33ecTyuiUuKX2m6at
         pbwTbv9VDlZklHhjpeKOhSAgKDMGt7aEWYCxmtyJAjCAFRIEkO0vt/gHo3q/P1LT4ATB
         dpA1N1ENpA11dIc5pklNERfSIaMCmGvwyedl3fXjCmeFMS3e++BpHVGoWvIm8Q49Sqha
         ngCdqExFlKrjnFzvaUzEdwVTE0VmytGpRsd5ethhuximUHAcYrY2OS/shRpC9HpUoTKN
         eCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933692; x=1789538492;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K0GzJ31h+P3OloWw2ZvMbwNL8F4ayZYlLsmS8xdExT0=;
        b=pESa+Kae3mGy0QKxLQ5zEZTnjbbS8Y/UOHfo00GLh3ypn17GROd6e4aE1SBvUBdgBs
         fqsr/lkPrNTKY1xOONQVbqcDscxMa+0d84/L8DYcTcFh44Q8st8IdtnaNwyq3kmxbT4B
         fACrgTIJjZFRzyJw85CQafjtNLwAAIjcuwYuZ8hB1RZAgeE8pA+SNQ2MCW2/kY+Bra7V
         sihJ7zB4m4EPIR+cU9clMW87S7/GY6nns350U6ZyK+AW2nJYvjPLs6poCcXnpZVVO8gs
         7rq9AnY7aEYEHpItilyesvGQ376RwvImimVYh7OQVho3EV4P8E1taCGHiZNx8+9JTXhb
         FoHw==
X-Forwarded-Encrypted: i=1; AKwUvBzvwz0cw9jLYAkUZLZ1mAepfs/HhA9zPpOdJ+WYqmfU64vGQLx02BnNcfXWYpEBce6iziIDbyNet6hpzvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m20aztu308LyCaehCqslj/8uhQODctm7dvCENK6oMjnjivvDGt
	MQimhHGHMPMNbAtbE9KcrckbUz3+wP9pJdKTTc2aZUF5OxMV5KvP96yOiiTWGqaATBp9vVHJDQ7
	MKIoddud+lyP6Ozu+APt1YO/lkmtHYscNwNjZFLLvXAKYDm/lnehSZdPp7lnSmRvkEK8=
X-Gm-Gg: AYBFou08kwnGl2CXTTSfKnUHZgQR7xyQge/hSL+xkOonq4vWEXOGylkGNsaMQaYX0MM
	vwrs4qhp8wGW8nb4bUvjWjBC12foQdJGxBY2qZrbDKu7vyo6M3SG0h9hD7eKN0U1IQQ54IvvEMM
	TdtbYk7m2OevzSKNWbWHcaJCf+vQPG4ZSn8X66gNr9QrEPAleSpI7pi6ByFX/aeF0wMjhb+Uq05
	KFt4RXJ5Iz6iYxHA8OxwHOG5IIiZPVY48x/2Pvt+BUcWYVp2NfOTe6bevmhk7tiB8bOU/+3ED2n
	1TCBUEFIQ7l5WlyOUksG7NVcK0kq4m2PZyeHE48EX8YubOVmDdroq6EseBxsSj9fiP9nxWx00MK
	dKnl736mjvFrptvAiZkiiElixHMsAyb93hhjWYQtxs3DI9HwFDSTdupQ=
X-Received: by 2002:a05:6820:1501:b0:6b7:8396:f3d1 with SMTP id 006d021491bc7-6b78396f93amr17677372eaf.51.1788933692186;
        Tue, 08 Sep 2026 23:01:32 -0700 (PDT)
X-Received: by 2002:a05:6820:1501:b0:6b7:8396:f3d1 with SMTP id 006d021491bc7-6b78396f93amr17677341eaf.51.1788933691744;
        Tue, 08 Sep 2026 23:01:31 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm41342098eec.9.2026.09.08.23.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:01:31 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: add camera clock controller support for
 Hawi SoC
Date: Tue, 08 Sep 2026 23:01:21 -0700
Message-Id: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADH2oGoC/03MQQ6CMBCF4auQWVtSCqWNK+9hWLTjKJMIxVZRQ
 7i7FTduJvkned8CiSJTgn2xQKSZE4cxh9oVgL0bLyT4lBuUVK3U0gp0A6Lo3ZNF48laQ7UnryE
 Ppkhnfm3Yscvdc7qH+N7sufp+f4xR9T8zV0IKI7VptUWNjTmElMrbw10xDEOZD3Trun4AJo0Ls
 asAAAA=
X-Change-ID: 20260508-camcc-hawi-4be887e3beb5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788933690; l=1391;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=oQcQQHOIXjxvnk9uZE9E4oYNRnfUpbFQZkWv35uyGXE=;
 b=omd4L/lc3C8G4Mx71ZdVJHuuH8ESomlGOvnnYbzG4aBqo8U4/brVVUwnHwBjbr4KjhPKU7o/S
 EdQqHI70rttA/AOI4tKYB4DFcEPTknYb9vmrhMPL2lOeg7NwWdQuj4C
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NSBTYWx0ZWRfX4wWuk8/3QwIo
 FMZHhzwd/zo+OyhaD81VVHi3fL8/EDpBRckxM7093uwsR8RxqDiKKBWmUiyrslZizz+8q0UVClr
 96hcJ3PrAZ46d2HjLWSg/zliGBCe14k=
X-Proofpoint-ORIG-GUID: g_ZRadzIr7dA8wTte-a9AwysiBoLD8iu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NSBTYWx0ZWRfX2yW8aEBFvvml
 o8M3uvGwSFd1BW4+lOYAaM7rDGHCF5NAIoQGvKvL31ubZyrt2Q0V6KufuJY+kMEhNOD4TOKLx32
 zTwd/dP9FyMDxXo3yllh+FUjiHMiPTrsVeKxwWpzmRfkQwtoLfh1v/Wyr3+69LlzkK/85E3wVW5
 VN7NQTXatUjcv14Xvy88dnRplnkeMs1bheqSmGF7+MI3O+EbkD+kf74Zmu+YmkFBrQTD4qOUpTx
 eAjKf9aupyzqbz89YZ0txt0kmwYX/zwi16RaxC0bJNWPwwdRlR4wRDHwhIk2NYjmMJJz9LHdmfl
 o118TMAliREcHfGS2HBY7fBlXlI4e84Zw5t0GUL8QRwV7nlk3Nr4Vnv5BcvMgz1mmJuHEM9Vo8W
 3xgrKC2eAkPOSguwWxP66Pj/vrnpMZDP6xZP1XL0qt018X8r2otN4jX9YKBTcRtpVDeXeny9H9w
 ZeeWwDHzWwb2LAhanag==
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6aa0f63c cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0ofaL8MKJGBdPcn-MXwA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: g_ZRadzIr7dA8wTte-a9AwysiBoLD8iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090065

Add support for the camera clock controllers on the upcoming
Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v2:
- dt-bindings: Improved commit message to explain how Hawi's CAMCC
  block differs from Kaanapali (per maintainer feedback)
- dt-bindings: Removed #power-domain-cells requirement from the
  binding; will be sent as a separate patch (per maintainer feedback)
- dt-bindings: Rebased on top of linux-next tip; added qcom,nord-camcc
  to the compatible enum alongside the Hawi entries
- Link to v1: https://lore.kernel.org/r/20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com

---
Vivek Aknurwar (2):
      dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings
      clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   27 +-
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-hawi.c                      | 2984 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 ++
 5 files changed, 3178 insertions(+), 10 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260508-camcc-hawi-4be887e3beb5

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

