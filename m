Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EBB501F45
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071333; cv=none; b=OpDE7WHgry1hhjmgT1VaPFO3apP7y0F2BHvAYp89yZx5/Zz3up5GSsPqm4GtIyPjS3AgtotFoJ/Mmx4ve86UPoheGNdOHXjX0ihPHw3wpur0DmY3O5C728v5DT809B5vxeubR1ITst3rw9jqLPA3yS0yI0hh0zf0v+UfBPNHdSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071333; c=relaxed/simple;
	bh=p7BPGS1LXtvuUc8w2G9p04MnVlzpfe4Yci0/HvoooT0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d1RCk5PfzZjn3Mwf3Ux2M2w6jg2p7AZ2LmXjxb0FtiCfYXfI9SWPdgKGP3v3JxXZTzVyLuc5MTSM9Y3iry3ZGSx/dw34txEkkZ8y+smA/jH2iFQZKPq6H2E+V4sT0WX02C8NwGOj7IdBuE0UDYBl7PEuoL23XwE7vdLQLMHNzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUQEN9I/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmSHyMR1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUQEN9I/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmSHyMR1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTBZ2809304
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AkNLjViojIdmORaj0ULI3j
	aSXfiWIQ2kdr4Wgh24Tkk=; b=BUQEN9I/OYuMHAn4lw8BpOZnumnaEbzNkS+Unk
	YZ26B4kJdPlDzxy+mew88p/SSQ0Qvk1PywOEHlnf/ioa9ravUM3znnWStSOMTa1a
	Eqrm2FnFq9vuAk7KbtIvHbbLw+DAGbf1GDnq0IcboswlZ0/ouoixb3yvLwnacxmY
	ByOWjZ4YyEGi4qaYoW5WomXxqH/Mgho+XDDyt0XvOO1K9s04XIL6gMWs+9gStz+l
	o/ElFok7aaU6Fldq8OoQyku0wmEpNpQxXSUfcDysI+DS3LpfRr9dtSAnuVDq4RLg
	X+S8ZDxRU7kWEvzlWyv7s8UsseY3VcDpy+pBe3CjhfGtkyjw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54ttxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:35:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88bbc27f85cso7139032b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071329; x=1792676129; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AkNLjViojIdmORaj0ULI3jaSXfiWIQ2kdr4Wgh24Tkk=;
        b=UmSHyMR1EqULHjRF8Byq9L26Gbv2UHCBpARQqzKSodCM+pihd9ANMbP9p/Nbrfdac9
         6H/0sD+WoezqEwLsPuxqFrDQzsPtMjNvQDPILp5WT/kyjD+t08VmfMqIHEBqfmIuckNH
         ysNum1Crot5+Ga329dPAlZDgMRKkxW4Kobzplp40N1wxSCLYKHigNnVJ80F0lcBtNalS
         mnG0lqvT8vXwvvLbSVBdTdK6TyzIkvuVq/YFobtva38oNuc18gGNGjBzvqPCQUIQNPeX
         eBUCxk6VlFbha51WHAAtnYRY9RCpqvs/MLsuOULtfwWwDJTF2+y2IJuaAeihIkjxjz8q
         9aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071329; x=1792676129;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AkNLjViojIdmORaj0ULI3jaSXfiWIQ2kdr4Wgh24Tkk=;
        b=DIJ/MKoq4AigS0H3CDLXZIpujFHyYAyQcLwJUfjG3hRm3EgF0bN/K/ZZVHlCy+kreZ
         2CHrBb90Oo+I2ak/OyxzDcY/peNn7W+JtrSlqnNu6HSUXGxtjQ32unYP/V/IQwFUuWGY
         8KBBWSrmMu0MfzCrlsyBL9s4clZfP/AedaverID83eK/7QJ2vCf5nGnUQL5wiG3OcI72
         k6ApMv98DGbcdVJrzWv5ByZo4FqO+YLk1f/MLX0VvXhI9T4fnaOWU9nRbs5g6vL1UVfI
         l7hl+/14lGwm0Y3w24STw9j5DqRnAV18v7vG2AOyPnWYo2PTCsSlwU/PdiwcS3MUd6++
         zvRg==
X-Forwarded-Encrypted: i=1; AKwUvBy7n7IAZ1YB8oTN2A1+RaYa0qhUevWz2yl+YmLCR2H8l64WX0OkGyGcSMv7n+bpQjBkCEJMJ+D6OOe3L8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZNbZkMN5kRYZ2LqkKHHMkH/bE5PgU9LQYvL+25ux/qHVMn5+s
	EpoKzDtPQQdgYUkNhCn7hJJmV8DjxDs+3RL73Akb+RLzYuE7m/uEAElSj8oZT+yxjtCeHqpBd4u
	2/0b1FFY6fFotRuSJgM3FUekuzYSHZ7NER8RvMZuGgyc98fypsmDL21jlZk/kE6XgitU=
X-Gm-Gg: AYBFou0mCDHDRjF0MEV+l5MwhLlHOeE9LAhkes9GaLzLYo9ExkNywENX29GKhEnKaU3
	7I/wW52JD1RiR6yrIktnP1pHh8EsjUpDpYcIWq+yRN5YEcKW7sPa0+QC0ln2vhyd+uMB+MQJUtn
	ER67slaJZYAtkfRtH7hmzhJ54SNd3MZhk9j1eDG/e5X18/i3cS6xfn6ak5sHNCXr+sgHO8GscY1
	G4YhUNmLA2/YUIw3HbH1tEw6mZXK+mmOqNiffmjCwrwMrBOuV/78leQdEjz3Kiy5aRbKilSIiuf
	8qNyG3WibWIfeHpUuXFaJIFcYaTDHrWwSSwIqWNw9blmvhbj/G6owk9hEgR0LhnJALYSuXAwpky
	ckUSVC1RyPsSIEJg6MG6S2gzaMIMXsQ==
X-Received: by 2002:a05:6a00:9503:b0:89d:7d72:3433 with SMTP id d2e1a72fcca58-89d7d724361mr5473464b3a.21.1792071329375;
        Thu, 15 Oct 2026 06:35:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:9503:b0:89d:7d72:3433 with SMTP id d2e1a72fcca58-89d7d724361mr5473440b3a.21.1792071328933;
        Thu, 15 Oct 2026 06:35:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89ec1705f5dsm476617b3a.53.2026.10.15.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:35:28 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add support for Glymur AV1E clock
 controller
Date: Thu, 15 Oct 2026 19:05:00 +0530
Message-Id: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITW0GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Nj3fScytzSIt3EMsPU5GRdc1Mjo5RU81STVDNTJaCegqLUtMwKsHn
 RsbW1ALRlwV1fAAAA
X-Change-ID: 20261013-glymur-av1ecc-7522de7e4e65
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0d6a2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JZxBUJHeOsY6iHg-7A4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX0RBEhZyyad4z
 DfH+Nd5up+wb3eOA+OK4m78f4iKQPYaqTBn/cruK0TV1OgrCsA1K50QduFkYPkI6GZWagHjS513
 abUCQVJs/7P08eh4M9hx9ZGozXnHQ0TUX2E7gpp+tCMZRrl34VxUtwp6vCXHsSa75A3f+2xbBnU
 7JXhXNqO4VSKgWz93TOO+W8dD/SCGuWevF28LkSAPhzRqNlHivjWtVcUHAf6pyXLN6ZQB8tRrj9
 1UeUwvjl0hxx/fTV3zbjhzAIku5T6dtTibJemzBj7yK45dYeU0grEN1PXm5j/9LF/0gagXvtYnZ
 irhUuZzWmOWyvzExBHVIpTSoD1i85ojnFyyMyG5zoM13aUbJPAY5HqogGQQnKpL9j+rSHRDHQDU
 cEFRT/96TKxfjgHRJuIxdDkp/tV+Qc8tkGK+HfqFbvwaZCPy7q6ZPz9CiIRK6LenuipkeEWBX1z
 8PzlV2wYthKIA0sRKew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX9hi7Ffg7/ozY
 Wp3Vg0QqhTuNeCakL8DgNAXsWmNCXaYdYAUdoPApvNmVsGd4mPQ12bCLCae9nVJ+DZ25QZwr0mF
 nSRY6c9dvZSgev3hMPQ/QAgHhbQO0V8=
X-Proofpoint-GUID: 3gOr1zYLgY2ucrBNS1344yzURPq9hozM
X-Proofpoint-ORIG-GUID: 3gOr1zYLgY2ucrBNS1344yzURPq9hozM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

Add support for Video AV1 encoder clock controller (AV1ECC)
on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO clocks as critical
      dt-bindings: clock: qcom: Add AV1E clock controller on Glymur SoC
      clk: qcom: av1ecc-glymur: Add AV1E clock controller driver
      arm64: dts: qcom: glymur: Add support for AV1E clock controller

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  16 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/av1ecc-glymur.c                   | 393 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-av1ecc.h     |  35 ++
 7 files changed, 460 insertions(+), 30 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261013-glymur-av1ecc-7522de7e4e65

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

