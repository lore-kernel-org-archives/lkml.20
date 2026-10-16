Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8528B448382
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137619; cv=none; b=VAhyXt6jhVIOYCGyS39ztu97D6VTEiarUp1iECjcmoyS/8RCm9Z0EKIqMB5UmrrdYt3dZcIcELlao2/M8AlJSsC7T8+dRdTUwGaVjhHF2TfTM9jVB9ak0yMIgVRPAV7SCJwOSFbBfwpEkobbinl/0BMzlRaa6EQakhfroQV6gBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137619; c=relaxed/simple;
	bh=W9j2KZdjKaeyag3XjecHiDdE7lkCbXf4pdsC5aFa4zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MyHJRr+1ZH6FRT8gMH1txNVeRUdKjf8VbXt6eLx/Mz60cPhHerqUJn59MHmOdDvVBn0GiXY3klqp43STvVdtllcyI9Dy/tGtTLvgXkjGztbMZGZK6wtSJ4qkbk7JTrHMwgdeM2vqiWoB6pvW3U7EnzT4FIrmL0vXjQoS3eRVLhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mh7hDXQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cK9b97mo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mh7hDXQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cK9b97mo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2fq1X406042
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUmAqm3vXdqYAolFk/P0Rkan80/YYQAPrUcDWiq33Rc=; b=mh7hDXQrsuHOF0nm
	lSiPZq9Sf57XZaNMxySgyWydWn1qYu2d0JrFqsi8zUSxkEgBv1AxVXzIa1gOgEGb
	3f50HH5k9HTHhXvs65qRrEn1MqVQjLpwQCtD+OjOQaC444vwH3xWgS+K/uRHjHdy
	ZzYdMe142XbfybpIax6risXqFhJItHZMll7i53bU9VDvKB2wiQd5GCdZBZu/9kKS
	xeWQ3im8KHjKj3SgqT0qvKehG9GVZ4kC0giF1r7jJRo6aTgTtMqOlJ7pchDLqIPM
	dHm9i0Bsy0rAGT+28SF5WCdgIdPPO5Pn34N7/ZrFDPQTrq6mdBFJ/U6bwqsVN5MH
	BjkY9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2psp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1233303185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137616; x=1792742416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUmAqm3vXdqYAolFk/P0Rkan80/YYQAPrUcDWiq33Rc=;
        b=cK9b97moZCiDcQJ5SlQ98B0uBbAXpvoNrWlN72BKFoDJyKxoiY12YdY42OE+gCZkGB
         fz6y8BgZEPNY/anCc3IiTXqeLRRdTZTZr4eTjRrP7MoQPynQYYmT/Z4Cb/aCBx2ydraM
         /4bOMepVAh87OoHhr9mupuRoMx3DazGb48Oxumq1JZNRHP1uOCBoNqKPmKY3MnP3YhlC
         bRGaMHUwqfys+/OesF4xbL1D2n+SOAwtKGMSIrl4+Som8Hj3fWtXiZsi5/CYjS+kDZEs
         3ZnBV/emZa4LZ3kX/JwyQB5znUxhUyEFnU3LCkO8OM/sgY+ySZ9vYDqdJKd8NKv7PotW
         pwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137616; x=1792742416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUmAqm3vXdqYAolFk/P0Rkan80/YYQAPrUcDWiq33Rc=;
        b=ozHBBMQoTvv0O4VdL9szA6NqlUWAuYEJQhkFRByPEwdwDHWVsZKPGhMO3TPQvzwQ8S
         7z0Beu8p6HMGGjRRV6bGGzfDyAvVAvGqPm2nZVyWJdwOM5O7WJcffYBJ726uh9iebu5a
         fB1XBaEQql/ReSZYOqq0fx8LBIrp3OIGxgZPMUZTqcaolvrgbJqxZQpn/NdCYkUfdAje
         O4HHCiS2QxYWa9gmWecAUY7WJWW2VDk7z+hNgUb53LcjF7cbK1RD1VYWN/Mutl9kzvKt
         LDBblkx5nDJhNOid97ehvrQUakVxVyArIhG5Xr1PwgP2l1Kl0jqDX80OazK+yolCYiQi
         zqjA==
X-Forwarded-Encrypted: i=1; AKwUvBwdqYoMFrS1U8vdx+1lQuHgzqYRNknEtrymoLfa4tXAoc3McdhJ1CSYLitQ1dTyCJe+SiLDVu+lDbtpaTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZaC9naA2S3QpqTcnzWfzSW6fhBELrIIj/xo0/tk7BgPhJv6tG
	8h24t2ulku+skB3onI3McQ5EeXjRNvCwhcRVrXi6rJ2wJhDeoA4T4z8nWNQuGSIOXJOv5X/D6Jm
	mILE6eZkj+EHqkQQrEe/8UK5c1oe7u73+27WLx57C2eSfqBUJ/HEI1KkEYY8RdQxsfCQ=
X-Gm-Gg: AYBFou3Lxm1XAh3JxJpmZgs2EfDU8nH1n6CFqkT7nMrvkkCLQmG6su7WtjUPHbopQeF
	kgtJ1Nt9vhO3720RF5VLIJmNG1mK2My8gyGhrblsyXu3dVeAqGfmGfEPBdA6m/Z3ebJ1WVFgjlj
	TRv85HPFQe8septNkqa+uM55sXluJQj5726vlpQrMWXUQ30wpVsqmURdiUG/0KP6ghNsOGhbllM
	UBHoQRFDYri8i4KYh3Sw5jCw9OvADWZDNSOov8Ww5PlfdsSpddMtb5hGLI6xBhV4W9UpkMmlnbE
	MFviIUedNIYuI5ks1rOLGbEmr5vYMvU2a41DGRJKJHbW4yfVD5u45DnSHtbvTST9TOhAsQwmZXO
	DdcRLQfPU+GMOJpTK42t+53tb8LJG/oE81f8yoWBMirIB6GS4T74f4A3PHM5uhSq3gZwk2HtW3X
	v+0IbVFrLsvjTJpdRiDJh0Vf/q/0nAmcVnJSx5S90Was6UPVAPZh4=
X-Received: by 2002:a05:620a:6844:b0:93c:6963:ff3b with SMTP id af79cd13be357-93ebd2634c9mr3364277385a.42.1792137615551;
        Fri, 16 Oct 2026 01:00:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93c:6963:ff3b with SMTP id af79cd13be357-93ebd2634c9mr3364272185a.42.1792137614897;
        Fri, 16 Oct 2026 01:00:14 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:00:10 +0200
Subject: [PATCH v3 2/7] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-cci-imp-v3-2-5ee7ec1ea1a1@oss.qualcomm.com>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXxRWKoE4pIciG
 DVzXXoTAgRudytW0dj6Jl8KxG8Z7yfM15hBLKsrWvQWgMgjsHg6MM2u4brGTCcLh72QbWxBV9iY
 HL38fODZRDkP9miVZj0LRFECWKVxA3Y=
X-Proofpoint-ORIG-GUID: GdzBq5fpfbEAqMI6LRCs51ATAQi6dE3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX6cbtaiSNHMA3
 W87cPcaRbL1afw3+7n2jkivvdtdiEk2mcwete6miatxCCx1qJ2BT3e5ONdT9tDvbsFdP01TgvlR
 2cWdDrjoFVQfoPNObPN0Tl5m8y2eoRMLRc1eqo6IacCKC6H6o9l6zgj7/seCrdZrWsjq3Z43Tf0
 wG2jYYbAjZdRjJIXjKQ9tDQqyoBRX3XgaY8Js+BFWhE81XV2KZw6Slb1a9HIDF1hyBHwiGRsDpp
 ikkPWZilMmg1FjnpDqt21n6qXRA+pah/dnSaDp29h6C68exz2BlGyjbdb01lQKj5xbWiFNn5qiq
 aI+fEFaEiW0jg+R0HvpZzRwaqjkpTjW+q2CMHXc5ApPugCcPUvkB8yZfHq7Dl7vjn1AaV8yNXi7
 fvBwhTivywGq/QnqAAKViLemUWzZSbBFmjv0m1BHA1CIuCe10je5gpwtp4WN1nqsSH5KGdqsM+F
 DCAcEv1rFUaqJDfjFcQ==
X-Proofpoint-GUID: GdzBq5fpfbEAqMI6LRCs51ATAQi6dE3R
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1d990 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=L19FZshse16xndK5FkAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

CCI_IRQ_STATUS_0_I2C_Mx_ERROR aggregates the per-queue overflow and
underflow bits together with NACK_ERR, and all of them were
handled the same way: report -EIO and halt the queue. There was no
way to tell a NACK apart from a FIFO overflow/underflow in the logs.

Decode the individual overflow/underflow bits for each queue and
report them with dev_warn_ratelimited() as such errors are not
expected in normal operation.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 5bec317c15deddc01d3f3a6418af4164c0d56fd9..897502f55e42ddd6ea591ec756606ac07044dc0e 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -54,10 +54,18 @@
 #define CCI_IRQ_STATUS_0			0xc0c
 #define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE		BIT(0)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT	BIT(4)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW	BIT(5)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW	BIT(6)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT	BIT(8)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW	BIT(9)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW	BIT(10)
 #define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE		BIT(12)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT	BIT(16)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW	BIT(17)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW	BIT(18)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT	BIT(20)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW	BIT(21)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q1_OVERFLOW	BIT(22)
 #define CCI_IRQ_STATUS_0_RST_DONE_ACK		BIT(24)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK	BIT(25)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK	BIT(26)
@@ -190,22 +198,40 @@ static irqreturn_t cci_isr(int irq, void *dev)
 		writel(reset, cci->base + CCI_RESET_CMD);
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_ERROR)) {
+		cci->master[0].status = -EIO;
+
 		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_NACK_ERR ||
 			val & CCI_IRQ_STATUS_0_I2C_M0_Q1_NACK_ERR)
 			cci->master[0].status = -ENXIO;
-		else
-			cci->master[0].status = -EIO;
+
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 0 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 0 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 1 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 1 underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
 	}
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
+		cci->master[1].status = -EIO;
+
 		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_NACK_ERR ||
 			val & CCI_IRQ_STATUS_0_I2C_M1_Q1_NACK_ERR)
 			cci->master[1].status = -ENXIO;
-		else
-			cci->master[1].status = -EIO;
+
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 0 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 0 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 1 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 1 underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;

-- 
2.34.1

