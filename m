Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD81459AC7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137629; cv=none; b=WNOd1D1MUGm/fc+sgehW7WpNL8DCluz+6QCq0SSaeRNKf1vUDkBzDQh0DKQGCCaW6LRKWW787wZMAjGuwVWv7zY0HjFQRICfqas7hjEKQuzcGK3CQ0TnzW7C7HpLUBNSOBRrD8s4eCSBLsfLNOOwB/uWWT3pwBKBpXV1L1j6Q3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137629; c=relaxed/simple;
	bh=0dB0dnF59RwKf/e4+oEENZva8v9+ihfzYURekeL81R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MHfiYBc3TTYUM6Tk9DdnJjjG3ozRH+edCseQbKTvTwyTh6Do5nOhqBFNeI9MrpKnMo5svRK3A0lifH553ci4O84N0XDriAvuc2Y2PewE8Uim9RaeA5B2TjD784TuiYl/KZ1638rTtngy0/m3cAXITwXw4G23zaCE0QDRml29koQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Omwq/rGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6hz36Ku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Omwq/rGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6hz36Ku"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7lhwd1890806
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WF9r9fugy+CQQ+2Giem/cxWs4pc35SfFrWU+Vf1TuwE=; b=Omwq/rGdXKf+PaD9
	Mu2Cmcm4Sl1nakUQgcuE7Rm8nmPMjYKd6eJ6Yyzf5YGwA0qPkLAzFexo7taf9+R3
	Mg1/tqZi7rHe/Z9/ffBz9BADXiT7ZkFtguptibNSTfr6SJToMs3YT6w7pNGX6wVH
	xssdkqtx9LzT/mZurooyzEjmnPItrUVse1LbpQkIObtIf+UJ9eKDAs75uNBYYX7A
	VYW+W62/idUx4TJmtO4eneaEAN4Ds7LRHw+DyMQtQkea3zeALQjck6jNnQyXZOdO
	mTTG6NOnvn/HFfGHnoziu46q/BbziD4wwgXLyJqJdJKJzY6xyKBhPdWbO9C/YpeD
	j94UUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba2619xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8067974so1443857085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137625; x=1792742425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WF9r9fugy+CQQ+2Giem/cxWs4pc35SfFrWU+Vf1TuwE=;
        b=g6hz36KuQp26Dbgft4IV+aVB5elsAOy0X8WMcgvtuCIoHDA8fYBZ+q5hOOlZ0tG2dK
         PZzs+YB1yV3JsuspHYWqiu+0XSBkQfujwFPoAdvhNd/mYCssjPVSWych4+P066oVWMxx
         FZms7S/9vDmfGsE9oIaqBDN/WKONkuS7Eyv13IDyvHre50dMFi2ItpmzaVxrv+NHvWHH
         lMG/CY2sf1ZtUS6J6UsDrByLcHzNen4y1pZWZVY4d2fYZS75NzT33pslfibe7PHsmmOx
         cKeVy99nPQRLnGx5ezVKNL3K4WpFoJyIx0N0KElTkyHGb/je7JjwtGWDMyUFsmzMX3LD
         qA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137625; x=1792742425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WF9r9fugy+CQQ+2Giem/cxWs4pc35SfFrWU+Vf1TuwE=;
        b=u/l4imqU3DyCba4NslyHMCdlBKYRuJXApYKiAHJ2eT2Y1PeZPLxcJhr+BrqwAywLw8
         IxMGUl901N/FJ9holfiyqcF1JbzbRPC3a+QkQ7iNpVblYr524iCgFX/J1XjTi8tMYKUx
         MdavK6bSFjKeMKt6gIKbWxriW6fbm/OqfGy+F9RRJbiCRhMJQjjpZrmN+joJfoyONdhW
         2c/xJYD//DRSCalJvr2+1p4cy0nGG0MBpO6Ik03h883pE8w+GO0w5ZnycZCcr1ykAl+5
         5apCRmF/zCkjRGiQ+bTEx1rq9qzWra3DIa/GURGsgXFxobRj0K5GYWDg68Sq9AG5e3b2
         JnNw==
X-Forwarded-Encrypted: i=1; AKwUvBzb/Zvw5oXaF1VIRSKViOwZI6wBQU7ZkdaxR9y+K6KsUJrjhrPIH97Em1VP2E/ftqJfQlRqDjbaXm5OOfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyYp/grCPd8PQooNORAZpDNEYldymM1Lenw32jC6xuuzL7hHqJ
	WTj5hcqv8FNPtwJbYCnQXh3+c2nRYb4XpaZ3AYvK9CXgdQfutTq/FoYA1I+svMbQJbTbzpWD5Fd
	ANCG95OXUgAeOAuze5epK9fFKjbFWkCwkNppjHPWD26oCOULO1khjXsMFHHLliX7kmoM=
X-Gm-Gg: AYBFou1LEgBGd2dxYnJXLoexYkeYNgOZA4Q46ZmfVNizJz4wMAIdg4IRrTCoc996wL8
	qHbhgI1qgMclVq/cEF7pvMtfIit7VO8CAGlil0XAUFCwawCg2qHWxhfCZdPguRANLVuotdtW4bQ
	9i34HAC5hjGQdn64o3bjQ+wcd6zIppMnB8SbTel3A0qppZ/+9G0sIQbIlB5aOfvIKOAZNsJMsaT
	LuaEqKjJMskqTZIPCYi0ChBO/l54LR3vPdbz2pggFa9DFEk6LlleQ/VDvL2W2sPokal9SzQSUUH
	tZrI1pdsfsO/zN++8sb5IO2RNrS1Msregi1q3cDXtxY6t3COocVy6dp7Ek2sUwr4PH8WaVkxRYX
	lyD1ubSjI+oAs+xEGwsdbelOmjoEoKs8NBanEZQmLBD6Y7aaR5jk9pRZCHp0SZW+0HUnm2dUk97
	DhiuU1FtaQ+ZJjXAvr0lBKHFDwVlcK9X8eDctqh8aCh/SbHgHY1G4=
X-Received: by 2002:a05:620a:4006:b0:93c:c96c:a592 with SMTP id af79cd13be357-93ebd25a1a0mr3499208985a.36.1792137624690;
        Fri, 16 Oct 2026 01:00:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4006:b0:93c:c96c:a592 with SMTP id af79cd13be357-93ebd25a1a0mr3499205085a.36.1792137624187;
        Fri, 16 Oct 2026 01:00:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:00:15 +0200
Subject: [PATCH v3 7/7] i2c: qcom-cci: Build command words with
 FIELD_PREP()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-cci-imp-v3-7-5ee7ec1ea1a1@oss.qualcomm.com>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1d999 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=aws9h2sAfGIhmysyGwIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX6xTX+XVT9RRB
 9uSYeSmodx4dHo1fQURxc0Vrykp+yX4UMfW/NcDt8H+qok56yPCPdOLnXGjVT7pxfLVeIXkSk9S
 YAI8t92YfS14K208af3lKynfdePEeRpqgE4I7Z6ba9UlQcdFqb1VALlpxZ1s1f1DXAbBR8j9Xns
 fWt41ww6UVT2S9yvVtloW0svwXjybat4hrOftJW28q6inkgURcNWghDRlcyjX+FcQ6VjDY8iQJD
 /G4XuqqgPRFNRRbdfsMtTqx0E85BkdMRLjyD7zs2tQ87faFK44pyrVT1g3b0mYNNpFsa5hC4uuW
 0dg6cuusOgPyM74Dtp8jNCkSwOMvmKmwet4CWfW8QgOTdRkYpWdGQLJaEzZXlCKlTYssXbj00M7
 ++nyw8nT7pnDipksk5/M/sQQJvaGChiQN4fFjH8r1Li/I36AoEELdBkTnaf/tC8BeSrMSXkdg1s
 hJPP23iC8eXCv30JwsA==
X-Proofpoint-ORIG-GUID: RuRSgOvAcZ76Y65T6n87BKcL-gjE9Y9-
X-Proofpoint-GUID: RuRSgOvAcZ76Y65T6n87BKcL-gjE9Y9-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX4X5uuWiJKtVr
 A7wjhU9qd8ijvKQP9hULYacecFMSL6eIzcdepvk5kaXoiipo0Ewb9XRoQLhJmmPaQfvxcE8fmwH
 N/vp1W8BxMiudkMwiQt01V63s8FFIpo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

Every command loaded into the CCI command queue has the same shape: a
4-bit opcode in the low nibble followed by an opcode specific payload.
That payload was open-coded as a bare shift at each site, which hides
how wide the fields actually are.

Describe the fields and use FIELD_PREP() instead. No functional change.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 280d34b54dde6c505ff627ed35fbbd392b6f7c25..843144d74a97ebc179455ba0a2b013012653814f 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -101,6 +101,17 @@
 #define NUM_MASTERS	2
 #define NUM_QUEUES	2
 
+/*
+ * A command word is a 4-bit opcode followed by an opcode specific payload.
+ * The payload width differs per opcode: a write carries its length in a
+ * nibble (which is what makes 0xf available as the burst marker) and is
+ * followed by the data bytes, while a read carries a 16-bit length.
+ */
+#define CCI_I2C_CMD_OP		GENMASK(3, 0)
+#define CCI_I2C_PARAM_ADDR	GENMASK(10, 4)
+#define CCI_I2C_WRITE_LEN	GENMASK(7, 4)
+#define CCI_I2C_READ_LEN	GENMASK(19, 4)
+
 #define CCI_I2C_SET_PARAM	1
 #define CCI_I2C_LOCK		6
 #define CCI_I2C_UNLOCK		7
@@ -576,7 +587,7 @@ static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
 	if (!val)
 		return 0;
 
-	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_REPORT) | CCI_I2C_REPORT_IRQ_EN;
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
 	return cci_run_queue(cci, master, queue);
@@ -604,10 +615,12 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	if (ret < 0)
 		return ret;
 
-	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_SET_PARAM) |
+	      FIELD_PREP(CCI_I2C_PARAM_ADDR, addr);
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
-	val = CCI_I2C_READ | len << 4;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_READ) |
+	      FIELD_PREP(CCI_I2C_READ_LEN, len);
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
 	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
@@ -659,7 +672,8 @@ static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst
 {
 	u32 cmd[CCI_I2C_WRITE_WC] = { };
 
-	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;
+	cmd[0] = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_WRITE) |
+		 FIELD_PREP(CCI_I2C_WRITE_LEN, burst ? CCI_I2C_WRITE_BURST : len);
 	memcpy((u8 *)cmd + 1, buf, len);
 	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
 }
@@ -687,9 +701,10 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 		return ret;
 
 	if (burst)
-		writel(CCI_I2C_LOCK, loadq);
+		writel(FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_LOCK), loadq);
 
-	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_SET_PARAM) |
+	      FIELD_PREP(CCI_I2C_PARAM_ADDR, addr);
 	writel(val, loadq);
 
 	do {
@@ -701,9 +716,9 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 	} while (len);
 
 	if (burst)
-		writel(CCI_I2C_UNLOCK, loadq);
+		writel(FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_UNLOCK), loadq);
 
-	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_REPORT) | CCI_I2C_REPORT_IRQ_EN;
 	writel(val, loadq);
 
 	return cci_run_queue(cci, master, QUEUE_0);

-- 
2.34.1

