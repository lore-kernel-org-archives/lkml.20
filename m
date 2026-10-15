Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94973F23BE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037580; cv=none; b=ee79TwAdLFfgBR0FbknXjw5t8o5psql2+UtlcMsLmvcVBLgzgWDQndtXC5qlsPJp933NFBK4apc5xtQ3KpHlfKR9JL1VTbTPmYBtTgHc6Bnh7evE8h8ehFyFfB5on1kGRd2aasb7WMOufUFSNMuaDo6yIbDgkwv9H9cpNpQ9c1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037580; c=relaxed/simple;
	bh=afn1e/fW2PzgzGse86o5DRe5vliScLobnb1hHsTpKUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkBL9gN9HUb3g9bcJlaMng9mwTX+XIRlzPVsGyNvGtc2tGS5/BA8njrzzAI9PlqIXJfpZx89kGADf3Y5BrVVnbZNPvf1sn2W1YfSCuFTzVj1M703fYeZcHPhNpWLgh2fPotm9D7nbI1URe8lUtG0D6oeaPTKNBuFmOZ5obSrXkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCDu7F9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KayJCsGK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCDu7F9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KayJCsGK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xZa62738642
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PsWl1HZsnwl
	MvuPPgNIxzplQvHxqyYwW76yfoJtMppM=; b=SCDu7F9uMaUOTP2iJVV7P6AAwjF
	kyJH9D+yRvU5gRQ8JQ+Te7He1P3ZMKoKGOw9ijbNqMyqyPedHDuC//Po4INnbrO6
	/nRZ9yc5r0w38hZ6FohjSwWagGOiRjJWhY8fksupWXcRhhkMABVzeNHelcgad+8C
	Pg9wIUN+fqOEl1taoluKcE4kEKzelMGrCLyBUIUboZuOWX5ZW7T/JpLD5JkwBrFY
	4wBtDKLq5Ax56s1vCcQcP6LjP9q/ejQUSe5t+CCc1XvTIJakbonxdL1KRx/XQWQK
	9C9CiIXgwGjXCIktEsS7qhDnCDKqXoln+2iEfVa3Iaek4sdTIiT4ncnZXxg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds81fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:12:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac6971ab44so380707a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792037577; x=1792642377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsWl1HZsnwlMvuPPgNIxzplQvHxqyYwW76yfoJtMppM=;
        b=KayJCsGK3vVeaLMa1i/yNstfdnWxFdDh684j0dwP2ANy2WgZwmdXtgc6meL8Iw1+oI
         FuObDny6fYER8AtaTLhDJ0p4hTszVhZ5dEk5ttLazsezbVYFX/a6P+VAbonyE9chFCNm
         V+dO8McnEAPMJur8dR0VLihWzYutGkN+AMQqIxvnzHbto6EFpWJjCma1sPtTTGdMRkzb
         Q7GGGldyZ5rMBPtKLCRY50CBb+CGvPG2ylnJJp1o665J9HmaPQ1RuTOm1HQNM0YvsNQJ
         Bwc/868OsdCTZinauzUP0au1KIIiS/8sVqQ4uX6deQ7LNqdmxcggl4QcNg/dXyS++W34
         4veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037577; x=1792642377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PsWl1HZsnwlMvuPPgNIxzplQvHxqyYwW76yfoJtMppM=;
        b=SXHENDsmLEN2MdtySD92OCr7lqIptZX2CO/Wvhdl2C9HKBpsPdEoNwRTfLCM1eAyRV
         k43uzj6honIB0TP/teQiz+78rGm2+3LQBejsSunk3Tk2/VmDS8BTKm/2tIEUYKPHVHO9
         qPdyjmhlf7FOSYukVGD6DSiwz8/wEfdRy0r9gCRA7ghzLEOe3OaCkg5W4d6vpH3mcvgX
         1OWfcaJHxDNH0c2+gN6ZmY/HhLY46gH0xnIudhl3YEdK/y4d7RBvBYeY2SGftd3FUsgP
         tv85ngt2ASyc5UGPvPeQkvZY5kjKa7WqZcF/wqPUu+sQIyO4j2FwcKDramXDx+S3i9AG
         88Dg==
X-Forwarded-Encrypted: i=1; AKwUvBz29O7ZmiKFsoDA6wW5gZKeBE2ujqfXFzbvhg4yOKTe19w0fsj3I05WZpJ5PX+Doxq4X8a1m9fMh5vSe2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyshaIAmnWAvrlG117FA5cmNHMb4Wjo3p6SxSKE/5jHvIWPtwZ
	lYoHFWERvHjvaBoyJQh6MtIfWLBeJYT46AA4osq0Gr+fYvT2/KJALTGwbUhiAOhZo408Z6e+Qxc
	6Hb1Hxb+62u7sJfyZ2AZwqVjpQKf87hxNOp9ZjgFw2cYAWSOV2IDiqWIpWapi04JF8bc=
X-Gm-Gg: AYBFou1eezQeKTqUiXlKDl2I+ciDGrW6shgo5t6zHdki5/PsL0qt8A9UiEVKWYtRPNj
	5STQ65MaUW61YPQ1vLsUZVfBh8DKKWZIBzif/cW1taA8TRH2/d3etVh6Ajw5rO9oDn2tJJG2xOv
	ZSSwDrqDsscRHBcQLvldvlX/WTJkziWwWmemDTaww3CnlpXMP6UEexQ8Xe7poZWWMLoUqPRgVT6
	3z8MGCSxU5u2K//zjjPQ2sIvC5vo6OnVV4aa31E9Lz6YBTv6ML4uZ15Gwva+a6OzqhV/HKMG1HU
	J9Xbla4PfZ89eePA35HStKpZI7lFxqpdIgxmgvLMJ0+0JdxabjspGgWNhujg+fknOZ41h8oIBxR
	8DDT12sVWAVtzObvUON9cgSvRb/o9
X-Received: by 2002:a17:90b:2d86:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-3ab3ad0fb5bmr23884497a91.6.1792037576667;
        Wed, 14 Oct 2026 21:12:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2d86:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-3ab3ad0fb5bmr23884443a91.6.1792037576053;
        Wed, 14 Oct 2026 21:12:56 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2267762a91.15.2026.10.14.21.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:12:55 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [RFC PATCH v2 1/3] dt-bindings: power: sequencing: qcom-wcn: document wakeup-source
Date: Thu, 15 Oct 2026 12:12:39 +0800
Message-ID: <20261015041241.2186521-2-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0RXGukBlXXz17g2ovvW1NxPhcuDwFGBl
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad052c9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=brVOnVl_E7YOJ4RIXMgA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX2Nz7G7pcdqqF
 b93QZEInVsHVa4R+AhG8+XxGaFDtF+mVFT0G3zJtsrX8C6vbI6PHX73MGZYbYh8rT4VplO7wrAc
 MwU70T5/1sfD0+medxzN2hkICiO62/IybhM9GvDMBHZpxHq00VkOuDXv9XzUgNomKdJP3rCzcSr
 jwHMRBWO0GqNuPuzxb8SiDaPFa4bVRD6jYoGBm0hou0M1dMq1WxCzbeX+UP4nxcxB8Gkg8HSquP
 f8NsDXaouYBu28e+3jvDQNh5w9fgDoo1CXhGtpGh2EearLXdmaRk9AWJnUt6udNLYPhUzqP5Fw3
 IIJHnM0kYGhXMoas+UgPz/K5n1OVhI49rXCEW+OTU8VrDVmcFx4989DmJj5LnRxohxZYRVfwrtP
 dUwk/7X4XHcqcsFbz9IrIZXHkZ9LcVSaWu+NxAfHgFp76hrSq6YkhQhYDKUDS8ERN9XQEF0FXiH
 Mf2fAQ5u/AIs16aWo7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX+PG1ryR0JNtm
 NvUh0/Y6Ca/WFQsoa3kGnfJCSBhJaQIvDmGeCuxQ0ivlzhlqdTWKvs9ebFSkGH8GMtVWH+gkU07
 9zXOittCAJENy5/kHMIgknhpNcOAra0=
X-Proofpoint-GUID: 0RXGukBlXXz17g2ovvW1NxPhcuDwFGBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150016

The SW_CTRL GPIO can be used as a wake signal on platforms where the WCN
device must wake the application processor.

Document wakeup-source and require the existing swctrl-gpios property
when it is present.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
index 9a7abc878b83..f0372e28c99e 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
@@ -42,6 +42,8 @@ properties:
     maxItems: 1
     description: GPIO line indicating the state of the clock supply to the BT module
 
+  wakeup-source: true
+
   clocks:
     maxItems: 1
     description: Reference clock handle
@@ -67,6 +69,10 @@ required:
   - vddrf-supply
   - vddch0-supply
 
+dependentRequired:
+  wakeup-source:
+    - swctrl-gpios
+
 additionalProperties: false
 
 examples:
-- 
2.43.0
