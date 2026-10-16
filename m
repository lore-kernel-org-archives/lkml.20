Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDFE43E49B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137617; cv=none; b=c7/JqXNPx64XIQIUxIuxFp4THjxJh6dMu/PE2DGOXP0ppTk06GeBU9WJ7qIeb9MRiLV5z9csr4JaVnzETHlFf7acHNqVhUdBHuKHvqXoFUtb+lnTZ3KpUH5nIDdNoZCEGcZreZlvheaoFuK+q2doO15a5GboKqg1cEUPGeqUrkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137617; c=relaxed/simple;
	bh=bECPWxoCFafbgoF9TAu/YDGGMEKWZCvp7v83ZSvz6Wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2wrndhIwiQFGeUy0JFRYPKNjgNSKiVG60NP0gEHxH+XkPLvj7QObjdNc2bFkThx6JtalpSlkfWMpOiXLLDhCCi7qaWgkUFw2m6YMjQBiQUXFm7qDV1M3lIF5Seu2xxQJ+w0ylROFIicEX20u2wZjks2PEscaVMvefrg1wjUOaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjideLDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJpiv3Yv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjideLDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJpiv3Yv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7aZFW1635415
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tl4MJhCIYy+CUFhOuWvdVaA0oMfwH+iUrIWo6Ztr7M=; b=GjideLDAvPWKCpk9
	bThI1RVEsYMrohefnx2ACr21kduM9MY5+LLlNSeytRzVbgIuMHH7+tYtcCbvYvBu
	yBz+MqtpiuKgk7cZ6RgymDi7xpLMqw7dCV3lDhaxnMhFtB1fmlQ4LWEw+g22sY7w
	d1CPvJ6wm6UPMg4/APzV44X0imS1VP/ZaDWvT+/C0Hgp2ftD7UuG4Wf9vQxhg60R
	eK9ZLqlfl3jlpP8Y9bPgkNcZxUzyzTZScgbXXLMBbEEL3LUsPrlWYohQthsk+Nyc
	toU7XaXvasDEeSlIDvOAFiQMRCQSC8d9SMvMHDFzGJcAACaymQpJ8XBlMcHbLsV9
	FJgjJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11hxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so1232925085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137614; x=1792742414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tl4MJhCIYy+CUFhOuWvdVaA0oMfwH+iUrIWo6Ztr7M=;
        b=HJpiv3YvlHT3vrtUxwk8Kpcf42iVGVAT3SAe/4QmNMWw6JntV7GLy28dqn/WIIDvxe
         iRgUGG9VyUuzGIkDYFPMDKLciAvANdEEBvu81blt8UUqWWzq1mGSHXsyDc91WIswSdCa
         aenV/vrbeO05RuMfgR7o5Yv8odMxVc6v3323mgZnTzeZUBG100zUuAicxgoz9D0yGvkN
         PMSiFP89k4gQgIkZQJTbzefkdVE7lDU57L6Qs9T/5cmuzcMafJ4S7erbjBQ+mfn8jikl
         7jFq18Ntz30xaiD6+n5LrfAiNYZiFcv0ZuoT7CHb599KlqoEWzUo4AraMSqLDakm1LTw
         e2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137614; x=1792742414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tl4MJhCIYy+CUFhOuWvdVaA0oMfwH+iUrIWo6Ztr7M=;
        b=hSpJk32GE5IEXvUW1+tVp+7jq2neazmo2C/wlDCaewF++ZSKkvHjYKTAjh3zrb6aNW
         9W1oPNcmXHWILZgpmzc27lV6/qClRYsvFX4gPl871OF6u4zGDa/PQpU4Gsr0dfC77wgT
         ordkE+vIqDmFXYMP1ERGnODTYqRiQmKLWUFz0D9qToPxjCVBTja/TThYdkro2rWGQEX6
         fkDdRUkQFAZT0LW02qjvEXucISXA9AY+v3qKyYFLgVeI4zhbyKeqQfdcQMeTamsOSceP
         bGagMMTN1yujDsu1qfgxb993JwEKaa/DbVn/GFKDPBx5RPId2xQDiib0ZMkI7p2nDVu7
         HCPA==
X-Forwarded-Encrypted: i=1; AKwUvBy7Cf5hm9e3qIwUi85DBoDEObaN7MRd6UND5XP0YJBcC7JW1pEEhCtd6oztovWpnDHDrK9sJSuZIN/SGt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJAieWPQryzVJfF3LRGfu6GspzaJJ/LJLqGi8nk8tAkB6aXWFP
	OYNxnDccs+cg+i0aT85Q0AZHXuoKt9JZ96XYYKPqfQa0s+PosQazB2xyBjgL8Zs3EPJuIHjTGhQ
	A9YnV8+e8Cb9QFExjvVN/nI4eO4PPa4yQjIVOpYFRcqKBl492VTE19ir5RAwH3tOjaRg=
X-Gm-Gg: AYBFou1Cd+D3B7M7yRO5p5yV4Szr+Eh2sinY0tDS/tIR6eTJocQZEegpfI8yxrm2cHQ
	O4oqxjb6w0IcI8UGiWrm6tJUZfTVsPvCHvxxBK6ph1soXsNxCphQyi1ZyudfJ7nhdwU6VqRrTSu
	zLv16ZPK+0vAD3TmcV1AfE1lo1frrwo75pRXA0YJ4jxCaFnfneE+kmEV4r2CZlNbEHenK5L7DpU
	LkNoVFgUNLtTzZw2Fr2KSI7Vb8cuOod7zxqZ2yLiHuitN3Twv7exE1aovoAQ2MIjIfE8/w+4cRY
	QqXxgXmW8TTM6TBhwLw7i6hkFWlUxTPd+3rkk0yZhVJ+fRpmDe5J3MW14fR0JsdtaZMS3S++7wx
	2YGg/wQ+vgVPyMVyex+pjnlQzF6+kUDtQVvYAiY1aazGxjS0gUh3fYSXvachbX9yin8bzQYXML2
	WvERJJFTfACGFCOoC05acLWS7keOnan/E8mB8lTf/ihZ8FFtMryuI=
X-Received: by 2002:a05:620a:6883:b0:93e:6c77:6fc7 with SMTP id af79cd13be357-93ebd20afebmr3480328485a.42.1792137613633;
        Fri, 16 Oct 2026 01:00:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6883:b0:93e:6c77:6fc7 with SMTP id af79cd13be357-93ebd20afebmr3480323585a.42.1792137613076;
        Fri, 16 Oct 2026 01:00:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:00:09 +0200
Subject: [PATCH v3 1/7] i2c: qcom-cci: Factor out write command queue
 programming
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-cci-imp-v3-1-5ee7ec1ea1a1@oss.qualcomm.com>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 8R_n5-8K95TJLwwuvb3MKFFng7CxkjXm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX0EynMOXSnXKb
 VLJJtBMrPIUp1Mcc1xUvRF6p+0YGaVkIK8R5Svc2CPVUx1LQwtD+olxDPRrL5nigHRQ46Y9TDtL
 r0CnBAKbJc5gQmIADZHyVtm8O/wNVe4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX1ZxapvooTm1Z
 T5/M1KvlxNVKWjXAjl2lFEy+pKM3J4gYTCamEy9uZi+WIW7a4UE26rmMDNVvdFWBwsgtu6yXW7a
 SZpW5la0Fakj2JDlL84f4RTsuTnmjabkJf5ERITdqP0yPdhoHdDPio9xB+ubdheE1G76fL5/6H1
 QycRjJTU/IA1TqNkLcX2mlDh5XeLs1v58+94/9TwP0J+3yjbBFE5dJW1mnqphFuH18gnrHbxb9i
 y+87RYYoilgEtS9qByt5Kmf0YhpCiCI6DO41j1VStKfG47EAeWYkjSciI7ON2WG58oBkA5lMP6i
 1fNhLSbuLVjVOKu5z5P7oIl5Sq/PyP8ckhubdTkSNgVjuI2nEww3SYsH0hgl4A0Xv722eWkrzmt
 FiyNL+ma+1XpzfuD7rDFtUwCCtXqEBqsnEVYzrl9nZgBrfPiJv68jYMnNSSsObCCa8y5HZLScya
 a5r0kl3dl9MMMI8bsMg==
X-Proofpoint-GUID: 8R_n5-8K95TJLwwuvb3MKFFng7CxkjXm
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1d98e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EKMQ_w68-2WzcSmJptwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

Factor out write-command queueing into a dedicated helper and replace
the manual byte-to-word packing code with iowrite32_rep().

The resulting code is easier to follow and will be reused by
upcoming burst-write support.

A command can only carry as many data bytes as fit in its words, so
validate the length before building one, and do so where an error can
still be returned. The I2C core already rejects a transfer longer than
the limit advertised through the adapter quirks, so this is only a
guard against building a command that would corrupt the queue.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 44 ++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index d509dc1c14700d9c199d67df19082bae4f1ae470..5bec317c15deddc01d3f3a6418af4164c0d56fd9 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -77,6 +77,9 @@
 #define CCI_I2C_WRITE		9
 #define CCI_I2C_READ		10
 
+#define CCI_I2C_WRITE_WC	3
+#define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
+
 #define CCI_I2C_REPORT_IRQ_EN	BIT(8)
 
 enum {
@@ -485,42 +488,45 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
+static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+{
+	u32 cmd[CCI_I2C_WRITE_WC] = { };
+
+	cmd[0] = CCI_I2C_WRITE | len << 4;
+	memcpy((u8 *)cmd + 1, buf, len);
+	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
+}
+
 static int cci_i2c_write(struct cci *cci, u16 master,
 			 u16 addr, u8 *buf, u16 len)
 {
-	u8 queue = QUEUE_0;
-	u8 load[12] = { 0 };
-	int i = 0, j, ret;
+	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
+	int ret;
 	u32 val;
 
+	dev_dbg(cci->dev, "master %d write: len=%u\n", master, len);
+
+	/* This condition should be guaranteed by the caller (i2c core) */
+	if (WARN_ON(len > cci->data->quirks.max_write_len))
+		return -EOPNOTSUPP;
+
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
 	 * This is to avoid overflow / underflow of queue.
 	 */
-	ret = cci_validate_queue(cci, master, queue);
+	ret = cci_validate_queue(cci, master, QUEUE_0);
 	if (ret < 0)
 		return ret;
 
 	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
-	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+	writel(val, loadq);
 
-	load[i++] = CCI_I2C_WRITE | len << 4;
-
-	for (j = 0; j < len; j++)
-		load[i++] = buf[j];
-
-	for (j = 0; j < i; j += 4) {
-		val = load[j];
-		val |= load[j + 1] << 8;
-		val |= load[j + 2] << 16;
-		val |= load[j + 3] << 24;
-		writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
-	}
+	cci_i2c_load_write(buf, len, loadq);
 
 	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
-	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+	writel(val, loadq);
 
-	return cci_run_queue(cci, master, queue);
+	return cci_run_queue(cci, master, QUEUE_0);
 }
 
 static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)

-- 
2.34.1

