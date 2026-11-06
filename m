Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977318;
	b=PFten7VeWvDv6UH5WnOV1xZ7xUNAP16iSP55oMBDtaKRdHEylPKqm7c9BDE7e7v5decN
	 hyJm3yQveGrNp1VebPlNZUHNCEdjoYxBE0xnrDHz+1ksPxpltV13jgitSJ8AvAtJZN5i6
	 lWAguBib8A9/iJsee0tqcCeSccz+5KZfpOhu2x7iaW8L/MGpxuhcWLkjRWb4B7k/CiSrY
	 HbR6zT3bwTnAcuwyaNEKYd//qlynefCsII6NmzucxCy774AZmVnPz6HumXqEnGN493jBn
	 IojunhhSD5WQcMKfbQcZ0uzX2G1pH/xsjx7lx90TIxUfphT/H5pYzuoYtASHk+KykIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
	b=XOmDJwQ7WIwno5fiRFC4D550Q3WS0EVBsYc1zHwHDlLKLF8Rd0hmSlUNE53e6ZkfiFb1
	 +MJw7z95KQB376hlVrnW4gzrt385w8qUwzWH2ysh9IZwFIvHjgh/sp1Lij91Ddb00okWM
	 ad30DQBR9w0JC/LCUv+elLnEa274zfSMrZyZ4DDIew3bzQgoNqItNKxbH7ejbhuecEx1K
	 fSM/iEVSUybEbb8/7pCebKI0ro7jxxRVcb3Nu2OyJ8as/h4v4bjGwcy95NjfMQgeeEkVg
	 2o+MK28N//OU0TWkZWM3ODZwtqQpU0n7MSWJ9UTzLXRmFQiKQ4tuVYWrX7iNUzxs05w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpPNuUns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH4mubwL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0FF606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpPNuUns;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH4mubwL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F061O1122030
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YlRX2h9r/M7y5/J/Ewe1L+
	KbEKnvM7owZqTGSJa2SZs=; b=IpPNuUnsui2joIDxMx5HdCY8husIcj08vS9KY6
	ZUibYTbFfnKieTvHPHnTB7xwzC4mTuqLb+f+0Wekxqb0wCw/3r/RtUTlp6pcdxcK
	YRd+ReLYF8CywfaUnPAPe3kmLq3exlrCHcNESxBi8iUiWEYlJON+p0kLclKYF1yC
	heeq1p6JtLqNEPFyCR8MtS/2sHEwQMkMFQWfJGJnLEGaTpWj0CE6G8wQeTwB7F4X
	9mEUMZMcam2j6K7c69+HzuiwIF5u9GclPuAmQGXjh+TwcvIPsZ+OU650J/+3sEzH
	hF5s/DPr8+rR74xspjWIIbEmeI23CEkObHqqJF7WjLFi23aQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u8w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:01:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so687818a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977315; x=1794582115; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
        b=UH4mubwLRNi+uA5+H3EJpU7sNt/MJXsY/PFrgk3BCGI271d3WKB9inw/qyxH8Nw4F6
         56pUKxYvZCM6neE4gsG2RyJTv+Jfb7efv6it/ddFK4I0ebn3pmL3Nmk5zF+QxJfW/LkV
         sE5d/w5FGMIMZmQgob6VGjoo0ekwhgCgamJxG9E/NDAtNKceCdRmPorR9xeeYDc9Dsp7
         rkoCS6ZqbUNKwWqZCOwrcKNnWx0jETy2ur34avWUW30J1geN+BjWtvvWM1roNJrnKpFL
         IU9e/OF6fx+v0/ThbwPA0d/d7RrotIRZ4E+jC6rKm/DTMo4mNxnOL75O/LtYXLqYblv8
         VxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977315; x=1794582115;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
        b=Cl6M+6IFgeuwsBhkJ8pomC0MO0+Htn8GX/ARwZiaykV+AtJqQJTBwZKiR8AIK69gzy
         MAX8K00XNCPTHHuYYbqHOw6hfAQr9VCeL7/w03QBfjA0JW0/Qjogng7jXw6kYnYKa6e+
         NeocP0M4sUw/aHglW3eviJbV93S9vmFMdSuVZDZo6X0E0k1dBalvr9yDCEmtjXDP6uHH
         ZTiCPMRugfTIFMjz7BqRM1QRIl8EX/i/8adZ2v6aP9ihr/M4GKBld7CDWB++760wPOG+
         N1dS/4Z/Oh9mcwjxaDGwCojR5fbavD1L6ja+f/jq89+YMaV/58Ouhbs2Q1Vkg5MgmY+j
         Ozug==
X-Forwarded-Encrypted: i=1; AL+hErEPMGA0+U1aPUVimBAGTVHCx4ZjFKUIQYZLqWmClsQqwIoGU22DtSEBRSwDXXaKp7CjXjzdK2KRvd3Kz40=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rXqe+okG25FgJdCi5VjoWChgaxDXa+rKAEbn4cbrwYDi462Lf
	f9K6UFg5b1kYzAHNO2hF+wovpPnugnhEc9ds9WF2v78QliZA0vtJCUa5mtIeoodW3uIwNI/HgMW
	+lCmVjyGvTaIsPVLg30DOLKUZjYk5uQm1QDRCi/MoRBY5QJumwIoBF/bUfQe+m3ZXqCQ=
X-Gm-Gg: AYBFou1Z20fZ0j8hTgW2LlkrOHvHXPZgn3XRq2pHrnraMYl7ZKx7rX8stu/3Nv/JFEm
	tZnHHeMAryhYtQymp/fNfuMcctL7Y0km46uIYcenDwf3hKRJMJEvXoehS7ysXe2slyMjuFiNLxA
	MNXDPzY3yBKRu0blBBbYu5GTk+1O09hZ1iIh67auipz3DVS69kCLVphO3c6WtmsyBedAi39s9Sz
	+k+6QdMXtaM3DzvwaPdoi6+aVgZxRQIOxtJYY9nYwC2xgRaPPkKtorGAEIi74l04wE1JHoPNwpm
	STcy1aQ8HXh9vlDMWK208SigAgTDCe8Xd7b3fEFI2gDB0BwMrcbQgBSlRWvRN/+qzC7O6HCFtNF
	ZQ0qsoHewRON/hjlLxEgj8IJhN1BsMGk2D6ITHKMVYFFks87MB3h9wMP3ucNJfmIFs2zqU+KGnw
	72RpxbZiWs
X-Received: by 2002:a17:90a:da86:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b0db60977cmr1689176a91.3.1793977315366;
        Fri, 06 Nov 2026 07:01:55 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b0db60977cmr1689128a91.3.1793977314752;
        Fri, 06 Nov 2026 07:01:54 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:01:54 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: [PATCH 0/6] spi: qcom-geni: Add QSPI support over GPI DMA
Date: Fri, 06 Nov 2026 20:31:18 +0530
Message-Id: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAL/r7WoC/22NQQ6CMBREr0K6tqT9FgRX3sMQUvEjNZZCPxAN4
 e4WiDs3k7xkZt7MCL1BYudoZh4nQ8a1AeQhYlWj2wdycw/MQEAqBUjeU2fKsaPBo7blvuZZIkD
 lqI5QJyxMO4+1eW+312JnGm9PrIb1a200hgbnP5t3kmvvp4D/iklywbNanUBoBXmaXhxR3I/6V
 Tlr4xCsWJblC89vg5fRAAAA
X-Change-ID: 20261021-qspi_upstream_series-850249e432f5
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=2393;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=sT9UgwhMsmzsH1VR9CYbGXTbSBlB1pzQsIePFqgsQYI=;
 b=C7A6XrHKQ4XQj59UI1RyunXvtophOtPfyUZ40INZlB0wVQ1WwavhDZi/XQdHdag/KPYoESnrp
 /DA2fyYU2OiCiJkgXkeSKhD9clZFrHFuhY4Ck116NuLNZOju5EM/9dr
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX4OURgQJMWsQN
 KfNHR5FaKd4okpEYIxJ7F66Aq1x2Piy1lFrJbT2xeldmWPeG2J7xxbtoD2YNt0i040YZMBU6Cu5
 b8mUZIv7Ul3p1nk4oIT2eA4IS3/FT9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX2Ushzq6ky7rn
 zvvrZQSxvrxO0lE7v10tlZK7LsH5kkYHIaY3ezWw/f8ZAMcZVpyhg1LD+iF2ZkLuceVGLndgnvc
 208eOpY+VNHa4h401DtEFiofSk+U2hD7qAEQ8+gpzIdCdkXYP7fuacqPsXFTQSPnxy6bQxJn4z0
 EC7d51Qu5nmqKr7KPVauZ/hOsEj68ySf9zA2jMzwdQ5hg5MXwHQqr3K8cFxb+AJ0uH225ldpu9h
 qYJ+U+o11EhjS0+9ozXsJ6Otuu6Hf3HTboMPBYLuKrGUAxrNF6OayG07GuA21O/Y/LiIJxyL4jY
 sI34UHqxMquIAWHEXfKdCOxf4f0sdSWhYHZ9KUStV3p2dnRb4/q5PZettcNrnzOVzOaTzdooYDM
 CJZrlilFkUgxAd1JZ0NTpJ+gIM5E1D2pxFpjxblkFo3sezCbX36+N85dGHzBW8HZVcbgYAHBk/M
 YPWKipD01PL2eauwZsw==
X-Proofpoint-ORIG-GUID: 8aOpZ616Z2r6nqQZ0o6XQPGpBf060f3Z
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedebe4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z6aUeMXpdRP9Q2--PI4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8aOpZ616Z2r6nqQZ0o6XQPGpBf060f3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

This series adds QSPI support to the Qualcomm GENI SPI driver using
GPI DMA. It supports single, dual and quad SDR transfers in controller
mode.

GENI QSPI reads require a command/address TX phase, an optional dummy
phase and an RX data phase to execute as one hardware command. Add
driver-managed message sequencing to combine these SPI transfers
into a single SPI_TX_RX command.

The series is organized as follows:

1. Add transfer_one_message() support, including completion handling,
   GPIO chip-select sequencing, delays and DMA buffer synchronization.

2. Define QCOM_GPI_QSPI for identifying QSPI channels in GPI DMA
   specifiers.

3. Document the qcom,geni-qspi compatible.

4. Define GENI_SE_QSPI and update the firmware loader to accept the
   QSPI protocol.

5. Add QSPI CONFIG0 and GO TRE formatting to the GPI driver, including
   dummy cycles, transfer mode and the TX-then-RX command.

6. Add QSPI support to the SPI driver, combining read phases and
   accounting for them in message length, DMA synchronization and
   timeout calculations.

SPI and QSPI transfers have been tested using native GENI chip-select.
GPIO chip-select handling has not been tested on hardware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
Jyothi Kumar Seerapu (6):
      spi: spi-geni-qcom: Add transfer_one_message() support
      dt-bindings: dma: qcom-gpi: Add QSPI protocol identifier
      dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI support
      soc: qcom: geni-se: Define the QSPI firmware protocol
      dmaengine: qcom: gpi: Add QSPI protocol support
      spi: spi-geni-qcom: Add QSPI support over GPI DMA

 .../bindings/spi/qcom,spi-geni-qcom.yaml           |   8 +-
 drivers/dma/qcom/gpi.c                             |  22 +-
 drivers/soc/qcom/qcom-geni-se.c                    |   7 +-
 drivers/spi/spi-geni-qcom.c                        | 455 ++++++++++++++++++---
 include/dt-bindings/dma/qcom-gpi.h                 |   1 +
 include/linux/dma/qcom-gpi-dma.h                   |   6 +
 include/linux/soc/qcom/geni-se.h                   |   1 +
 7 files changed, 446 insertions(+), 54 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20261021-qspi_upstream_series-850249e432f5

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

