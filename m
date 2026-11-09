Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232934;
	b=Le43RdFpi9IX/5CJllO6YN3cv7DoYlL+0KeFlyT3pNbuTWuwu4fRaqwHfhdh8oKmB1Pb
	 UZJRSb5DIYXblvLxhl7AQjNd2IQ85TBUSyggniR0kBNmR0cL7trjAKixe4+W3sDl+iX3n
	 94MVjL79H0FoVwJjv0oWTD/zDCDeR54nxQr6CmFMj0MPH8pGqGYjJ1OppEFiy3VrIEtTj
	 PXLcj9GTHUidn5dBhF6sd0jb6ozJfIN0pBsWzJT5mQelWKvikfl8WGJgSCtTqI45XlDKL
	 ZMDuYU5B5PEt8xr0aSnyAQ01tHy9MhKGWNXY/x9CVNIzDPjGQiX8clMASqa189PUZHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9cUE3n2XMFbQDb3izV4RNIRB1UH4e5dkhEIQq9VArGw=;
	b=lu7X4uOOX0uO7Y817EkdKbrrTtUAzLR2Oe+oeKOGFdS+QH4xxIEKxvnWXW/AkJMKXHbx
	 S1X1LU87Sc7obx5v2k9HMf5RXc/FAycAtK6eJdSos4ZpTLTaHjB0e/xZQlUJigonZoAXF
	 Z8Jv2tlRrbrn94VvXE2Ol+DuKJEo2yNgXfyhqSm5O824urI+Jr+O7PUjOqFCIzSYeSvU4
	 40fjz+h8CJ8G3DQT51/zVNbjzFfVfPNMbi+kq8ZjA5d5xOOW08in+opkhh4zF4QdUJoQt
	 prv6jt91ckgYar5bYszI37Nbhce9DvQ49631X1BeyzzW6TBwo/99pCtVw+joQAlXLrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAP+gnZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XekX05/q";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF5606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DEF5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAP+gnZV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XekX05/q
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF2jt334749
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cUE3n2XMFbQDb3izV4RNIRB1UH4e5dkhEIQq9VArGw=; b=kAP+gnZVS15Be3hy
	M4aWI2V4HwkP9Kd3jMZd/AiZfS7Z1rsJZ6C7vXXjBqyb0pcQQ/cif2URj6jPTGN5
	Dic6FlcXyFbjzfZqY4rrg8q+iysEdS29fY5R/+ejNg1ZcwA6VfqtSf4dcsFZ2qfX
	cQHaF9BQL2kIz7AZQr+sAdldki8PoqgBXV8hCxxfqtq5ELTpkVW9OIvVdKXg0fDV
	VzGbjfUNnrBaXVxSy9qPkiW+bpocWN4mlj+CdFni/AgmrkNjBkrv45E1TC9Raj+8
	xBzkrgjZ/lBhli5+mS/Flt/j6OQe/+GQd6xr8MkRjkEEA6HiP/KCgWJRa2G4B4D6
	rSksMw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58fph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:02:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecdc55c03bso43370e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232932; x=1794837732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cUE3n2XMFbQDb3izV4RNIRB1UH4e5dkhEIQq9VArGw=;
        b=XekX05/qzodfTgvNKVh7RQfoRZjMCpei9MF4MZDh1DEXOMMo0hGdLB1CwbgnKzQXEl
         7oWkVJA38CE4DyWRPJueHtZyWIrgZXk86umOerNTwhnfFmwUvGqjWZPhUdvLsjIGCb7b
         g7ey9T95/G1x/0NcwL9KbLu6MgCfayi6Fn6auJDzjsyEZxOp47UImLRQLZ1SDx5by+C+
         RhGa7OXKrpTZuSDb7jTPZ9a8rs0x718UrmWk3SHItyLCZuLHUf9UwxDGQrKZtD5551zf
         0b8QCONi6EPuHShnKx/LDmnlH+IygoCY6zVQrLFJ6ofqn+aCMWT13Qv7FQJdE0AG304v
         lqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232932; x=1794837732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cUE3n2XMFbQDb3izV4RNIRB1UH4e5dkhEIQq9VArGw=;
        b=nyUkKyuNNCxld9mMP+//ZI+ywWrv4iQlOPLCHGyhoaVO2ZS0WjWAjZLebsPySP727Q
         ImCtKz7k3adpU6mZ+xusSSfbYj31Q/kNY6QjEEHa1qOLlsC5fC5FRTsyzODqbh1vuy06
         mNUWG1/Ylq6ngW/xvMxMJxWhrCo3TwdJHNH5NqjNv9IGWUIcc43tyKqZwP6Ex0FAOuVo
         poPymtX5uQtA+wVcs37uew+5U894MkvTdje7ZQU3qRj8VruGeUHAam2kum1lxurhg7si
         40SIi3Dtpgnkj6NIMY1NsKY9PSkXIMAZTh1cA8f5MCc9wwLoSulaHYo8EJue8Ds+Bx3w
         o2Iw==
X-Forwarded-Encrypted: i=1; AL+hErGsMBwzJjX+UYmruoQcAgvX9P89gCUG4AcJJOOagVq/jUuFi3jvUkRhepHYHQFaV7twITRmFN97MUR8yq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PJClfpSs8OZF29S2oyegCheMDmY5jbQeFP2bj+YoJ4KeKPo8g
	EaFMnQmLnJWiV/ctBcHe3So0LjR6CA4cLdicSCdvjOIx8M66MGONTzXgQQO7AJB0ULFu4aw7Pgx
	SGCqXUDUe/hR07pItYL3xXPp8PLHea+QG5+24tCRowsuiO2I7olPxmOynfTbq752kr9c=
X-Gm-Gg: AYBFou36TNxoMfOuA5iK99s3d6mwr4vAPdqteKreRJdGJ80vKIqB2VjQofMOx9kEF+6
	dD/L99+vWHnb6yJ4s3hqf2KOzsCQDmIkKSL0FH/HjNuPYNIKn/8laU3r9V6ILAt/AypqL9oRtBN
	v9GZiekkE0SS/qkDcBpwqhdCqVN0+ZS20PqAnvRqZDKjiTrQy7Kl/kD6Z2cSLpcSLd+mdcP9GgC
	QLLL0FJBlAYQ18oFllSIph81qXDFSaUwCko1KDYK+EIQXsajsBdRnvOt7LJaDC/VYi7MwxivjjJ
	P87i0l+MSJOs33Kej/75FvjXcLgTXomRweIR+/G2b+16zu7c7pr0FgOwnSiSsetkqqkvtBPYHSj
	4ODqkHA0HVy47qN1EytlEisE+z5j/6Bsixme2hCkUDYz9UNbHHyBvttaVFxXkqXTf5670yxEQTZ
	mjjhJ1XtXYm6OfNkfxvradoG+2Y/LVOcliMZqBAC+GdFERnRe9ggwz1w+aa9QQ4yAQ9TJI8CKjT
	Y8hwRWpHdIIOBQLTrxjNIy4ZJlV
X-Received: by 2002:a05:6122:179b:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ece713201fmr1021561e0c.3.1794232929789;
        Mon, 09 Nov 2026 06:02:09 -0800 (PST)
X-Received: by 2002:a05:6122:179b:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ece713201fmr1020992e0c.3.1794232924706;
        Mon, 09 Nov 2026 06:02:04 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:02:03 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:01:55 +0100
Subject: [PATCH v4 2/7] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
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
Message-Id: <20261109-cci-imp-v4-2-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: RazQL-ROfeHOTSULAT9fTP85HV9-NEvb
X-Proofpoint-GUID: RazQL-ROfeHOTSULAT9fTP85HV9-NEvb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXz+9HqU80U6Vs
 aB1uSXtcE9wttPsrcmBLJ1ngy66TpWBEqjRfn401WYsYkds05Ob4+IfFpzFNQPHNMZmUbDgKWZZ
 LcBeiqvF0K7HYA4R/TCUn4Bofz+yiKQ=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1d264 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=L19FZshse16xndK5FkAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXycibKUDGluAW
 z9zyXDHz95EEqs1bdCTKNEv94OFS4is4UKeEVKNYhOzq12KPUKDOfEwDdRF7M8V/WXaQnnq5tSz
 OnLUHFF/rGNcqNqb/DlWK6J41GyYDxyZaAQko0TyEWG4k/RGDAdaRuztWi0dVXWXnDPU9Clg8Sx
 Dv7Db1azVfeDxrPjuWlR/o5e147zH/3TkVU2RV8Rhg8sCzO5P6f0uwrUIIBW0lUD1agUMD8Ke51
 Uqb1eioBN2GhbxO4WY9Uqap6pD0wgBSlwPEMxItaExWK+VXoIpolprpAlcyD5pGX0k78B6Cy6MO
 jdfMq0oTgd1Dxj30tjBPxZHeSsGNOFsgLFtSx4GH/nbg+46J2CpPQyMZ0Uj1wUVCISIQdKLHDeU
 /HBW3TmFmVOpAhBHyoEAmBGm/c75BT90IFLqjsuxTlh+hBI0xquUyqLSYMxftXSFuTNp0IKI7Tt
 tQf1btI8HeaAhH8+kDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

CCI_IRQ_STATUS_0_I2C_Mx_ERROR aggregates the per-queue overflow and
underflow bits together with NACK_ERR, and all of them were
handled the same way: report -EIO and halt the queue. There was no
way to tell a NACK apart from a FIFO overflow/underflow in the logs.

Decode the individual overflow/underflow bits for each queue and
report them with dev_warn_ratelimited() as such errors are not
expected in normal operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index e7e2650a05ab125c2ac619c90cb61152cd787165..3ccb5cc90f62b0996acde0b1df568ad4e022907b 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -55,10 +55,18 @@
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

