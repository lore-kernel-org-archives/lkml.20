Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1684EB864
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974035; cv=none; b=R3V2tD8xlA78ejZmKBvTpTzBrpu3YOVIY+OzclA4sFsbbUz0/aiefkwuYPlOH8NzKEF/9bR4SsnzdWPq9To0tBmkF2LBzMelfWycdUb+vZs1tOeexz2aOcgXIv9hSHE6P7g3HUBnC8cFhFxA68tz5nKHW8WNhfSEbVI7qPGOYhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974035; c=relaxed/simple;
	bh=enlVM5o+eEXbQXYD7OqYQYhRuhOUQDes+wE0EecL754=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VueBVGyfm5beliTsSP1bunccVyi4EHx/7Z4jZR2WsaeJBRxiXonO++MdGHrZAm8U3Qvw3MNwLRGUHA5elRCYyhVptD03caVaaeq7H7lQ/g0hpCDi31dnGBq2p+O4gccV2p4k4ezsoqrxIYtl6/krcE1iyu/y+iVZbCUWLu+IqB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXsd4UPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIfljSna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXsd4UPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIfljSna"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E686EF2515949
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=lXsd4UPNBO6/YB+J
	ilad8erEj3k3tQOGf7LbcAnMwELGx5Meer5u6USFrKtkVstzKka381wpZBezaLMu
	lW3w9yLFJ8RYkjHXUW5qj0UjShP6RnkL+7nJuPbwTujzpHPQX8lVmywcmJscncZF
	hbJ0cVL57R1VlwJpAfYGLBRhu+YVBlQcGrrJzoc9h0Rj1OXbh+5gjJ+NnYLN46fs
	+MjsRq35JbcsAZsp2SrGQbNsAHfVk67cHrmh31CfjtwfUmJ4I3hu2vAI12KfkE7r
	vUGWX8z3g0lPbmEyUNdLdG4aXYaVf0AVnAKEb7IN2neSd3jZVztcSo4gh+CNqA/k
	X+SmeA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709368-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso3625925a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974032; x=1792578832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=jIfljSnap5kKoJsgXic0QiHMJnVdxgQib5UO6cQMv/sKrJ39ZGuqyb8Z4A0drRq/aM
         aZkqWbjBnVAb9agtdLHSFCdIlESVY350ctkbQufwb2t2qQBhnN17pjlaiV2WoRoOMBHZ
         W0JqZ5EHCcxiJgg5pFJfQ6GwBk3V5wVhiiYX/Ju7wwb9JMpDD8VN7xUEk7u5aC1edBf1
         deLmlyHFuEHhV5Ld4B6h4Y6KdH5nz3V/jirNRwATVh2k5R5mxCBG0vFKZEGhS9A6NzSa
         vmzdmxjR+9rTrGuZ3Fhr9ACBa2so4MeFuLQXm68iqbM6Drf7RmuenncVNOzpe+MDtiWn
         zj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974032; x=1792578832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=tqCnHPL4UsAHPvhbqoJU0iZL9+sgqqLgAf0GHQCJwp/RaJMSwYs2vyOTcnudMkOmQE
         mha/mZnQrV7h/YuzxEo8stBEfXBG3Jpys3WTzxqGEV1RNjb8iOas/WT+FGb2HJTfkPOq
         Gyh+xOm24eI58wnZPRVq+rj1eC6yJ0M4SkiktYrGSd/VmF6IMjB/FBy0i/DUeKmHHs0U
         Aq1R4uGF9E9bWxGu72eB8G80f1iTpEKCfiFsP2ia5m5l4WpaZs3oSiWDXc83WdGPi0Uo
         U3hK4mDCqAjiMiIc+JIsxEIKzHuMd7y4lmoj6hgwHCY0pvPkzg2BRq78eY6qxJZhM3as
         wGqw==
X-Forwarded-Encrypted: i=1; AKwUvBzXnLK6OosoT7t+e13a1sAzoZsT6r0XmWE2uDuqlgy/WtVu2yCkCsceq1kaj3XLI0V8jUartbKdtSOy2oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL/JhZFwuZRRRRLmLQNP3qg5HiBfzhb4XLAneiE7riuJE13RAC
	414U9lXTp4/MsZTLvj49ufsfe6Rx+uNAJfmAQil+HChU++MbLD8AVVjL+wBv5ZHf91/yFsc+zjR
	qQRxlQtihEq5VUReuy63E9PF+i4HJ7CTLPEW+Rr5EngmdrQ1e10BSmXJYMUnQVdoImvc=
X-Gm-Gg: AYBFou1PH+UeZ5D3j8dupOseNtclkUIREaV/ta5pPuHxoSjvu6TOGCI9AQqq8MZ3UxC
	VLyjhiKn+7sNsnavJr8/aUIkDe+zau/1KZhLnsW8y295C+F2gxrPtNR9EntRa+ja60gUdBnve0N
	Kd1ZVWsQflfg0mc6LOME/ZDrkJ+TywdzZL/tLGbod0qxs5SlNpIsXqKoieMJeMDNreY1T1d5f9A
	U38yskfsppebL8IbDm/1dIdvw0pSzO8lbFVR0oozpzQ2Bs3yt89vHtoCSsZRy5EPxbGoU6OYh0o
	JyjLIfcM33In/yAl42uY7cjqFJNcj/JABkB/A5WF43FH93yurGWXuwGR68I0RdQgM4WBzjnNSm/
	lBktYz9CwDAp+kF+7q+c=
X-Received: by 2002:a17:90b:3145:b0:3a8:a62e:d6db with SMTP id 98e67ed59e1d1-3ab36f1a530mr10793124a91.54.1791974032215;
        Wed, 14 Oct 2026 03:33:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3145:b0:3a8:a62e:d6db with SMTP id 98e67ed59e1d1-3ab36f1a530mr10793101a91.54.1791974031698;
        Wed, 14 Oct 2026 03:33:51 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:51 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:03 +0530
Subject: [PATCH v2 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-6-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=Zw/Q9BnX6bpofeZoCCycn5btSpx6AA3/gXSih61ZP5aQT9Lata18DN8UkMSJdabPDQPEhRy1n
 R+frcNtudhyCJj1fXFQkwILIHsnWWVWoGsceskQzDdCXrtsYK5h+zs5
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXyOB2xM/Uo5ZK
 KhQJiNoW6XuwywPQVC41E1rk7Rjrqne6D0D3jQSN/YeFor9xubxoLtKb7ObTGWo1uv3qec9vHg2
 fHhhiHjghKsUEt2Q/qhviDYIzubX680y4jHQGtR3bo07tznqZOCg6oq4Yl644P4/PvZFuKJ0Aew
 1sXohThWIbhkTTrqlp5ReByjB/yhrXWt0/veriO9j33zYMzslrmt4u/xOLplCTvYYTuhliAgbVj
 mUb7PZHQ94TNceSqKX1SQQQLcTZSv6ZM9rbKloTrbaB2dgIfvXhTF5eoiQGbJA+4aNLVmIxRD8y
 TqWsa/G6JoxKW7WDSYqESBN61/EkW4CMtBLElc3Qi7HyszoIy9tj53hn9mSK12ipP5RnFrDlQiy
 kLYNoZmGNqW7IywopmVexMhS6Cy1hoJ9odc0nIUVF5+sXb8N/wvywmVBY5yUPIDH93rebYs8gr6
 89+iG4aqwpGQItQMmnw==
X-Proofpoint-GUID: 2G3LstNVRToY9MKGYCuIdZ4UIOwho-yk
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf5a91 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 2G3LstNVRToY9MKGYCuIdZ4UIOwho-yk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX3TT4Gwq/pCJC
 ob68iOkJgt6B80r07/GQYnnH4uOjSKxjPnyCv0S9Gh8Y9fAbhnHJK4xfCr9o6zEoIM7tyGeI/tY
 7nOiZLd8mzzbETOXzXuQNrl4AtqYdMo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

