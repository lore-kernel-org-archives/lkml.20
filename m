Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233005;
	b=xgY6Q+eq4JhcnRe9AHBtXyz0I5AsNXfBCDe3GEfko5Beqiq3Lffl/LsjwdtL9SnDOTZ6
	 9yeWUxqiJGggYtRhon4Zkc3nBI18Ehjn+H7uTHY4CRZMpuAMTpRfWUJvTuBBSzSH/YXdd
	 jgYf+VEjR9DpI1HLk2ahiXy6JtxhQ7ZVL7/owE68J6FIVgwCED0SYveoB2W8dXGs2xyZ8
	 CAbF2l6EDDkeS/mNet3ykfE80D8b9D6YvEqwU8IT215tjcHKxMnU/hNrpkQmnZvQmGae/
	 jouutzMvl6WzRHj22V1CYWzNNNff56eTx9zz2segCoiH+Z4GpKGdaOhKnSdndeJVYsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PrVp+K/tFEuf9iJ99Gnzsx1IjRK1SVHkagaubIClMPo=;
	b=PqFO2G105Si/YP+aU6jOymyWIxwWpHuju6vseletZwkoQEdHsexRjUSYFWPvZpJavjC1
	 U7VbUs1UKZ4dzUAlFqzNVgJLjk41aSER/HAIJ2BhSMq22Xw1JbTi7PbhwsBhfTxhmZ0d2
	 +ORsdE6+pYhjFl2GP38Z0NukryGgvQhD2ZgZG7cos3hwCPvyZ449Uj5FH4DzqwV8ug6oY
	 ZRQB5MR2m40YvsYxIQ/VKHvhfb0OWntbJRyduOEw5r6YikgPD5olrkn7ndq6Rw9zCIzSu
	 tKXWjQx05SUrf+cq/4V7bAAR8yvyOn3gThSFzudKmcgQ6SLlysABPVSS1ndntbhDIqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RIWR7qCD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkQVO2iC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A81606D803
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A81606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RIWR7qCD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkQVO2iC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF9Mf359242
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrVp+K/tFEuf9iJ99Gnzsx1IjRK1SVHkagaubIClMPo=; b=RIWR7qCD4J9UKU+I
	wgZvTOb4k8q16s19UJUTI0trJrDKVyB+uksWSr3uUAcV2LY39KbYK0dl1CvtVHZT
	BpluA8mj3Qp5BuNncxXXiNti9gPyNXGU6Zdpu8g8ejxDgsZJdEwBt8jzIrHl2APk
	3Yhth2OUgcjoAF2SBxQfd314V46OS8aL836RIkoJQnXFfXaIuUzJRKOb/LMmvaKn
	9q9+sK2+hNaNhu6X/gSPrVZJJIUPxgnVz2jNXOQzsOo3j6sSZvyh9UAQ7fQajaeU
	qU8RU9JOidOdSy++U7isH1osvvbWLVW/K8lIx5klcC8SHfl67Wu6LmRViH/n4tOO
	mI8oPw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2hxgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:03:23 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67532014b2fso1990833d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233003; x=1794837803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrVp+K/tFEuf9iJ99Gnzsx1IjRK1SVHkagaubIClMPo=;
        b=gkQVO2iCiivleuPGZBLhvmJgxzXXrUqnkrwnJ9s2095jGAoSo5GILApU/1XeCml48O
         0xShSe8dgylj2PxKxCLtIEpMFuP0isKe/4QEjCHT1q3sM5vWp35ofttvbFKFK0xKK5qw
         pVAKPGWLu+YuhqRwU3OUBnYj7Gt5Th24oUTbgwGapIpr7HS37mq7fwpYdMtgpAnXnjxE
         8fIMDJRLNKDUg9z/aHOUbWaEX7PKeT1oxVsH2A0t4o+nouRrl/RztLF2ZMTo+ezW1aIx
         p+DwajOwYkgPmOmV/YOkBxGlSBk7evF6yJBWOLhh5drlHJNr++WKGgwiwx9JXE0GbE9r
         eXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233003; x=1794837803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrVp+K/tFEuf9iJ99Gnzsx1IjRK1SVHkagaubIClMPo=;
        b=jvE9kTX4gqb0bpLz/EkaF/MHJkBToykWCJo1Tj4JxR54B5xcSlsQQXXSkYQ5eKVbl5
         LtgBE86Sj3LPEGbyltXVvY3TOhYB/5Uq3R1i/rIlneMOdIIAaVSupZfJu3UP6DpvaiUS
         zgLbP5mX3lSWjyXILTFXizo6ZK2hK7B8w2WTYFM0j0/wDX8RB1usDNU+/+LhEHgGNA6A
         h2t+MOBEpmKcDhsCx3/+6/AQNSdzZxzH43Yw7X8pEuHipeRsl7FfuQ7/Bb14fKWxNPuj
         Fthlaaog4h52CXht1II+Nk+YU8zfuCBL5rb4GhyJ1RDG6LjbSVUCQfCsWlPt9fTXyU8H
         ae1g==
X-Forwarded-Encrypted: i=1; AL+hErFvSNgISpERpUd2hbOFPZoCC9qFcVMBiV2KvEpI+1FubDKRixyWr4GIeo+94iJD242Py9CxSBxB54Lk/RI=@vger.kernel.org
X-Gm-Message-State: APuU4Z900aDOrd/hfZs1mPbPbFJ9OEaEr+ooad8wA+mfcuhhENg2f3Hl
	JnkoEIjYdk0zYjZvfyz7iK7lQC77LwiNHtkZZxBJoVLUhOo+Iv9Y5KrkYj+5Z/usPZveHsxmXuF
	NZPORlxEblcUEtWv9TQt/RVfNhaXkt/q88bDAoudoQky4ErllFOuVAYxgeHrE0AjYSPdAI2Zp5F
	ut7Q==
X-Gm-Gg: AYBFou3iDoklPTJRBSoKZUa+cDAkiUcSzM9FsJ3xXDIstmIr4CFa7XJlGDIAEj9Ovu9
	7gFoNBNO7VUvCwRyl70j6UMr7Ifu2LxlEkW0FehYgIot9gMQwiB6JFRC8b87DsjUMz6I/NqZMdA
	HE87egxDt21n60WK4mRgcH92k2RhPrwLAPinuQoq86POE7STk6m29XLu2feULxC4oCb5+7669GK
	pIA0MHaVHitD4MogbH+1Rg1zhJtq5qc6I9ij8DuNcqCoAjKXYORrlj5KRv0cj6OrXkXx7PASS9Z
	UYEcpoGSrAA7lCBlp1pnJCIlqpTydm7WRWHY8dbEGX5k36RVgCdtzOjINan8rZrmPBJTqEvBJX9
	r1u7r57JP93rnLa8WBnV/iJd+mES0Zc0PJenSJx+MK6wuK2VsKdZz+wUG8ShjtsIKJLwnFmgAD3
	0sN9kz7IHqx+Z3iknD4kxbXyf2S8TwxlQQhIAmFfra7IdNxZis4XGkoUCBDY+3XMFPcHHK5BAcj
	I+5mkRCR4ICgHsA5GKKogjF4ufP
X-Received: by 2002:a05:690e:4887:20b0:679:887f:a2ba with SMTP id 956f58d0204a3-67c3d96b515mr1935255d50.24.1794233002492;
        Mon, 09 Nov 2026 06:03:22 -0800 (PST)
X-Received: by 2002:a05:6122:e266:b0:5ea:e7aa:acb9 with SMTP id 71dfb90a1353d-5ece720b077mr1148155e0c.6.1794232965445;
        Mon, 09 Nov 2026 06:02:45 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:02:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:01:57 +0100
Subject: [PATCH v4 4/7] i2c: qcom-cci: Add burst write support
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
Message-Id: <20261109-cci-imp-v4-4-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1d2ab cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Yp3SuMTfTe4RQKdpiVsA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXwy+KkCdaEKA4
 ctVdOcjtmBNkB5jCUrZV4fPpoIhQ1BiMLMcg1gGt6nrua/IrFNQcoc1EuZ/5KUWfBLd4TM9da1P
 ymB7QCgnH0SeGsFJQLmbU94DVnbBgt80xUHUMU0NymxEhmYnSmAcAOqtNRmLmgMBMULZimYNOjN
 3sA+nJ16lyMSVwfUuw2+/AJbkHXpWfFi3wkfQVFlBYZKq0aTYsnAnzcnNTEk6BZ+XjgDp3D0VuU
 H4851S26ObiDCUlUhLyKMPK+viRWy0FCXEmNl2AioNoiMSabcGz2gJZ0OHOPkJI+SR6hui2oDHx
 ws9qnyVNZZUTOm4G2Au4F8ypFcIIrYyKk5d1HHlE7NQvXt++n4lZU1yqzdGgZjlCEi9k7/RSyi9
 IOrWAHFggSzje1hxLEthxJpWyw4PROx2el0sMsYDs/mQItfF8H0jIt49eH9Ghcoqpnz9SWmXHya
 j6M2kl0BIOVbhyPNaKQ==
X-Proofpoint-GUID: svsGrK9snA8QfeQWUfxFws1ll64LVpIr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX2g9u9D8FHF+X
 XTuyh6up8+x1uH23yH9RqJWjamkS1W/i2CMIpc9JD+pKm+So/fu21zl/IALsheNPnzumvwlW+eB
 f7esrPAv0wyBN3rcBhb6BdqyYgbORLI=
X-Proofpoint-ORIG-GUID: svsGrK9snA8QfeQWUfxFws1ll64LVpIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

A single CCI_I2C_WRITE command can only carry up to 11 bytes,
so every i2c write was capped at that size via i2c max_write
quirk.

CCI v1.2 introduces burst mode support, where consecutive
write commands (marked as burst) run back-to-back as a single
transfer.

Use this in cci_i2c_write() to allow longer writes across the
whole queue instead of a single command's payload, and raise
max_write_len accordingly for every CCI revision that supports
burst mode.

unlock/lock commands are required to ensure the commands for
a given transfer are executed atomically.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 48dabd923b690864eccc29d232847c80f3c3b46c..a698130f4712492847336e401c0789b1a64dd02e 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -87,14 +87,24 @@
 #define NUM_QUEUES	2
 
 #define CCI_I2C_SET_PARAM	1
+#define CCI_I2C_LOCK		6
+#define CCI_I2C_UNLOCK		7
 #define CCI_I2C_REPORT		8
 #define CCI_I2C_WRITE		9
 #define CCI_I2C_READ		10
 
+#define CCI_I2C_REPORT_IRQ_EN	BIT(8)
+
 #define CCI_I2C_WRITE_WC	3
+#define CCI_I2C_WRITE_MAX_LEN	(CCI_I2C_WRITE_WC * sizeof(u32) - 1)
 #define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
+#define CCI_I2C_WRITE_BURST	0xf
+#define CCI_I2C_BURST_OVERHEAD	4 /* LOCK + SET_PARAM + UNLOCK + REPORT */
 
-#define CCI_I2C_REPORT_IRQ_EN	BIT(8)
+/* Largest write that can be bursted through a queue of @qsize words */
+#define CCI_I2C_BURST_MAX_LEN(qsize)					\
+	(((qsize) - CCI_I2C_BURST_OVERHEAD) / CCI_I2C_WRITE_WC *	\
+	 CCI_I2C_WRITE_MAX_LEN)
 
 enum {
 	I2C_MODE_STANDARD,
@@ -516,11 +526,11 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
-static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst)
 {
 	u32 cmd[CCI_I2C_WRITE_WC] = { };
 
-	cmd[0] = CCI_I2C_WRITE | len << 4;
+	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;
 	memcpy((u8 *)cmd + 1, buf, len);
 	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
 }
@@ -529,6 +539,7 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 			 u16 addr, u8 *buf, u16 len)
 {
 	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
+	bool burst = len > CCI_I2C_WRITE_MAX_LEN;
 	int ret;
 	u32 val;
 
@@ -546,10 +557,22 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 	if (ret < 0)
 		return ret;
 
+	if (burst)
+		writel(CCI_I2C_LOCK, loadq);
+
 	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
 	writel(val, loadq);
 
-	cci_i2c_load_write(buf, len, loadq);
+	do {
+		u16 to_write = min_t(u16, len, CCI_I2C_WRITE_MAX_LEN);
+
+		len -= to_write;
+		cci_i2c_load_write(loadq, buf, to_write, len > 0);
+		buf += to_write;
+	} while (len);
+
+	if (burst)
+		writel(CCI_I2C_UNLOCK, loadq);
 
 	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
 	writel(val, loadq);
@@ -719,7 +742,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 64, 16 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
 			.max_read_len = 12,
 		},
 	},
@@ -728,7 +751,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -737,7 +760,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -746,7 +769,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 1024, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
 			.max_read_len = 12,
 		},
 	},

-- 
2.34.1

