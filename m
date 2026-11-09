Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232996;
	b=h9wT1Ir++QQ0MI/dYuwvWvlKlf3EA8yZD6Yp3Hja4RBPdn2ya5MaUAcpOufAY5F4R0gK
	 smxBoyDgjUO4B3/Ne9IUUnqLEEm12D0oiLJkF8z2GzBLBkA+Wslcg+90jqZcDCOGWL475
	 5mjDWaSBHMg574shSewidz8YXoG4x4+fmcNth4y2SyW34A+KrLEVaa1NtDUatZjwb3gf/
	 OvHc0G6JY7pa0MksgYhh3QZQUvatkjbcSrVBvm8JiFHgD/+Pt4zeom2O6S7CSkiHiniqO
	 vXmv1396Jwe0ZuGjpTmERGHYo14MZyjw9ksSTGcMBpU8TKa3iNS0uYifMy1R3e26mKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bzUDjoYzf7fPf/riUB3Cm7ED6nu44j+BYRwBBoXgSpI=;
	b=4r9GtU8dDEIyuiTBEWAEp3CaKKQVTQorcBKS3O8fz+J0cL2U+8pvSaFZ+yt77i6oj2tT
	 XFu+gSJ3qgy8QRLYHGXEGQl2tI0XAGPa3xE/z+LwuDj5vEbf8YCpcJo6/faEZ+/23BE6w
	 x1HSPHNdIuglV12+Fq48IH5wUv3JDURiGqwzMj4MgkhT4N6F5To8+dn7eNxbOulT8suEz
	 2fZH96jhFawovDNexidFNeFWY8Ef+EtO/Lcg99NX4NlgAjOWQRlzXUCqlorpOGQNyzXEs
	 HAiPYOuXBzAdgi2o4MlLC3WMAihXG4af7e2+ByrAfgnlMXEr+Nsemi2PiUJIQtOBhHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="L11V/teK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeJrSghT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C3A606D821
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C3A606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L11V/teK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeJrSghT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFX48985821
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzUDjoYzf7fPf/riUB3Cm7ED6nu44j+BYRwBBoXgSpI=; b=L11V/teKikPLjWhd
	o0MG3H1sE84/Taj3zYC+5B3uf1shAg0QVMpf/V/2YC/qaJlPjD86g/JXjyRtBCC2
	6dL2M6DVatCFTNm3o0mWKcz0PjBCDCNqAbuwtUw9cG2z44Wu5G9upf87v0MPCKzO
	2twTSJWt1VHplC7q5OYUicWwMAEyH6WWHkw07nR/4tdZgtu+4Hw/GMn2Zpi8Bxtn
	tSfEw39TGGdpD5XAOkiquJyS7sPEUaV8c97UIrnP40Hk4F5zhQFsTg9Aax/iHniL
	FFrWoZSPBlKzCxDEhe8zYVugxnzI0QVab4w51fhCyCsfDRfMSoWZjrD09BrA7SgM
	K2EJNQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxep09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:03:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99859876e19so166245241.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232994; x=1794837794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzUDjoYzf7fPf/riUB3Cm7ED6nu44j+BYRwBBoXgSpI=;
        b=BeJrSghTx0gltL/eqmeoIpBW+c4eT/VE1u8GI4Wv5ncLa3iuAGkAE6VDQPqgZclYzc
         cOxmtp8GQgRY35s1RXwKLT6/Zo2fmh5u5xZt4GzZ3hAOKoksLwePURudi5jSvfZY6nty
         HrJ/MkY4q9ZLmo3NDVC2EhdeMPsK+RjsPa5RR4DMPk01ucWBvjlOBKZMHC2qmoyZSQW6
         7PsiT6LZeHG9SWiph/Y/zLfBz78jKQcvbOBlkw4Uy19rjIgCi0kGFqVtWNKECcUYDq47
         AICaIaY6HByiDVXwLYpF+msfvsz0MLHsdKS9jdShwQTiv+ueWYF6TSyT005uuSQ0pQke
         L1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232994; x=1794837794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzUDjoYzf7fPf/riUB3Cm7ED6nu44j+BYRwBBoXgSpI=;
        b=1kg8eDvHROxebKZJDzgzm4UaLGwr7NcdO6ACDWUcfQKoZLOBfqNMDcphEL6Vv5fDYP
         NyL4rj0NE4AO4uwu1B7fHpTZXqi1/63QgQxS0+ukL+CwBr/Dx/fKJeO7K+XzqrktYeLp
         biMyYgANcMzKcTiRxYCFNn1ANhqa1SI4/udvNPZ0BP1maL4u44qxM+i2eRGsJZkTqoxY
         CiyibAmEyp13sHf+QTONxeiKMfnsioaXViKoIp1kw1BxrDODpU1hZrT9RcGzDm5nvCK/
         h/eIhbXFpjvWMkfBULhppuRTgP3ZeuQmaHPUBLhNrFN677h3iIbTqbsegTeNx3S755wb
         3+1A==
X-Forwarded-Encrypted: i=1; AL+hErHwQqYGZ32Jrs0MBMXO44v7cJ3yxYwmjaKgdgrdCnQYNUVVFvif08sOTEBIuKJlclxQwxkLC/JwdgHsi9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i2eJHEwlU/vU/2GuQ1hBxPuR6YNxJ/SLnvXa5po6i39S7aYer
	YEt7v8LSajNsykWdhv89B0CMymrBm/SrHjTaUX5iMXLsWp1U6Ch5THPvvzEqdfenBVXnh+ip/71
	eWiJA78X/Ir8FFzcMlm1BMtwtTbSzWxeyR2z6RvdEYYUYdzPq34WrrsAYomsEL5j95Ds=
X-Gm-Gg: AYBFou2se/78NGWNrMKFxrYw4AJlvUCTKHvp93y4K8vhWAQEPqGD/c7YwEdCzLzi1kj
	GQQBEuEigxKGyWBzHf1rcno+FAHfBt19klUzEVuqq6EPFQKKNz0gb84EElbWdTEyU/UZ16Z9lno
	w69gxptSCvaEfxdtgazdLS0+uiKwp1Xcu4FI+XVKF7+XjIgU80igEbp5IRFUa3MErBZNI76lOEb
	ryxT23oTfzOygA/viKLcmXidaY+j+th4EzNYtEtvn3/8YaSafXLiK0E2fpHgkUaiwgyj0KMe7H5
	Tm/Ml8hMuvf34TyHYdcGarehKoOcgOEFAAMINALxmOwwRcC4/mzBSP01orVItCrPIL8yEVkCEYr
	1gcPx9qMqd+6plREM6tyoIX/Q06kbuvwvvVtB9/rB7d6sLzv1CD7GWKiU/iVaLz6ZiKx+o23QQ0
	WA1UN+FKXIWsE6qirhJR5eSBzA5AbKtPWX26bCDyGiQho0O6yJSAKq1fSZZRhSeLxLXhaJkDaVn
	ZgMGAFC9Fcw7VLsI9aJ4EwsNyM6
X-Received: by 2002:a05:6122:4b18:b0:5ea:b1f5:a657 with SMTP id 71dfb90a1353d-5ece7220ac4mr1174165e0c.7.1794232994033;
        Mon, 09 Nov 2026 06:03:14 -0800 (PST)
X-Received: by 2002:a05:6122:4b18:b0:5ea:b1f5:a657 with SMTP id 71dfb90a1353d-5ece7220ac4mr1174095e0c.7.1794232993087;
        Mon, 09 Nov 2026 06:03:13 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:03:12 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:02:00 +0100
Subject: [PATCH v4 7/7] i2c: qcom-cci: Build command words with
 FIELD_PREP()
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
Message-Id: <20261109-cci-imp-v4-7-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 2HD9TJmu7GK9LWU6zC0ToPGDt936xAkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXwO3Dx1PbJh0N
 jnkeUW4oQqD9G5uWdqVasA7eZRbayCYxEtinAv7c3W9WBRSWqTpimW11nQ6wPsjMW+Ei7CE3VGF
 3sn7nPLZrY0JM7yth/FKX+KTQbRp7lwq3wujZnsyx95AbRXTEQZ7O/R0D2ct/9KAL/tH0KXrRCF
 KmHqqYFM9uHR9aa5T5kE5kHSkLeIvRJPmTWNrelgqWS7zKvJnwo7WqkWBoq4F8EkAN5H1EDuMV4
 s8hJlGOfgVlJ41Xqn84L2GG6cdbFYGtYPRcaI4VBiEmj+CjqfsC6azkstYQ/VgioQVdsg2wi/sQ
 rCb7hGU+dkio9d4s/K/ivxrERcsO8im1QetUUir+7RzjkOye96jwy7BSxNGgZDL10E/cc3gjRRc
 v52OicU48zefioD2O0xqB/KMA8OHQ5FxCJ/B+iwFLN06JhTjL2IONEKlMnd8UN/JvQl/a8vjIKt
 IN9RAdQgjCaCR5ERPNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX0pBtIlYnNexY
 dRGqblkbEUe6C8QToY1PmSNwgRWkEVTvhThHbA85YoYZ/mABB8uoDLy6q0OkvIzrlXrB2rzTuFj
 lmfnFud40SSBjOGTPNr1gTqivPZ4YFY=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1d2a3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=aws9h2sAfGIhmysyGwIA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 2HD9TJmu7GK9LWU6zC0ToPGDt936xAkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

Every command loaded into the CCI command queue has the same shape: a
4-bit opcode in the low nibble followed by an opcode specific payload.
That payload was open-coded as a bare shift at each site, which hides
how wide the fields actually are.

Describe the fields and use FIELD_PREP() instead. No functional change.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 7452ee8eab0635bf6562f4dbfb2342263211cbb8..66cf68837a9112f83503ad7299775d1a2c6953c6 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -102,6 +102,17 @@
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
@@ -574,7 +585,7 @@ static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
 	if (!val)
 		return 0;
 
-	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_REPORT) | CCI_I2C_REPORT_IRQ_EN;
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
 	return cci_run_queue(cci, master, queue);
@@ -607,10 +618,12 @@ static int cci_i2c_read(struct cci *cci, u16 master,
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
@@ -685,7 +698,8 @@ static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst
 {
 	u32 cmd[CCI_I2C_WRITE_WC] = { };
 
-	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;
+	cmd[0] = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_WRITE) |
+		 FIELD_PREP(CCI_I2C_WRITE_LEN, burst ? CCI_I2C_WRITE_BURST : len);
 	memcpy((u8 *)cmd + 1, buf, len);
 	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
 }
@@ -713,9 +727,10 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 		return ret;
 
 	if (burst)
-		writel(CCI_I2C_LOCK, loadq);
+		writel(FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_LOCK), loadq);
 
-	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
+	val = FIELD_PREP(CCI_I2C_CMD_OP, CCI_I2C_SET_PARAM) |
+	      FIELD_PREP(CCI_I2C_PARAM_ADDR, addr);
 	writel(val, loadq);
 
 	do {
@@ -727,9 +742,9 @@ static int cci_i2c_write(struct cci *cci, u16 master,
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

