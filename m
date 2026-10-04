Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B57495AE4
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141009; cv=none; b=qME07nE10Nz2AqPLVl1r69u4KXN7AepVleojDEyJOIyPVBqtDA1jQXDKDwE0QqKvo7sVHXcO3Vn0pOEkfmGi1bXFoDvgI5gg8AI/WUZbHTOq8xyLDTT5hn6lH5jtolX8xE9dNVequyxtaix3/6CLAcLYsvsgTFpO3Wj7V+LyG9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141009; c=relaxed/simple;
	bh=/ABKmRz+An5Bn3368VFxSkFJ9qR7FPRL6Lo9VQ0OZbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YiYMWCf+KemtGrYV4nJBkgMLg0eiS0LjDMd8m37EeTOLdYJhi3x7iwSEbGuZqVdcldy+se2QiPeWoTjL2UN9wFbi+dn73MeuCtnE0qKqR3ADHBiJkonSXJaawrYaRFeoNm1qANZU3OHyUkHgayKNl8MtX4jnMUUq+ogDWVNHDVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I16uhrj4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVeTZhsh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I16uhrj4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVeTZhsh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IHS8C3672338
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 19:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qoPuxed1ucNnLMpcshtIwUzD9v2n/H9d5gS0vW5V+w=; b=I16uhrj43GbL1TnN
	hG5m7c0z8rw3b3zT3cMH5KszxTR88x9kxmzA1ulQY/KIez3xv8ONvT1VvYcFwFyE
	TV36eeIQlOOtnKoNmSLrw2vbKBO2F9SLPf11yIRr8Vh1SHsRtkQ20Y3MYvdg+WgZ
	mDOqrs35JK8ccV/QBzvuZ1WpeyRac3Fa3s9JEnzUCXGQK21rpTIzBsn++3uSTljj
	Iq94ZEIjKeDf40D04LxfAScbONHpEIlt07GMWVdVkmncHjuAbPpKDKmKGIjDgEMS
	A4iKpNTn98Ck6h+qxihCCQnSO2bdmg6PHZ+9ua7IsY00B9y4zhOF8lOOWlCpqZUO
	PaNYJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06ukwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:10:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350c2b31c8so19710561cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791141005; x=1791745805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qoPuxed1ucNnLMpcshtIwUzD9v2n/H9d5gS0vW5V+w=;
        b=CVeTZhshlXuGhbE7srf2u9ydH5HzZIp9Ry3gP/nLWY3Xnm+GGWPm3CfUdkOR0TFf1r
         8f5Wd5/CkpHTZE9j043pcFtglnlaYOe66Lr3+hQxyIX7r+cGvna1Lehn7G+OGhQFwdGS
         G5VPwpRaA5p3h14rhnWC1toXrCpPxHQzSzdPvZjPdT/ex7xbqhliquVBFmL9za8oIHN6
         xPNlZ519CMWnQlIP4/8GCaFfWZu9nj9NKeWe8CbsrvOhIUw4U3T6kBRzoh2wghA28HHv
         uzv0meXWBLfRrxOmEturbxHsTZ9Z5ZExQBFuAY7X5K05b/55651rT3/K32ZSMAKIrPT0
         9yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141005; x=1791745805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qoPuxed1ucNnLMpcshtIwUzD9v2n/H9d5gS0vW5V+w=;
        b=cDbuWN7EcffzOk1Dv0iAGUR9BU3uZfdIxnazSZtvwNlunljQtpKHbHp9XFhlNZsaMW
         B/fAqTw2aOJ3lVKD+q5Me5X4O7zGk1JmI3FAS8TQATMwPkB77AN8UhtNoJGEkqRmpRgM
         9XB+1X+R6PxJ+tZ4xyZPA0DbvjPM2v3gravgMMzh/IyT2AxSE0yjxNaPwhq8Q5TVBRZs
         k74b4FYSnNKQfJA8G7u0T+y1dy0Q6vg95t4EavszowTQQ1vNrKzVvn+vb5uIJFuamjxL
         GnEwBPQqiUhKNaumcD1DdUM8cXQE6UgnwQMzDi17WZVJMrwm/IFSYLJEaadJ1fuSJJDj
         yRvw==
X-Forwarded-Encrypted: i=1; AKwUvByC1wZvdpn5FV/06jI1d/dwStCX78jubWhZfnSO/ARhvkvmaIV9Cy5C2G9HK90fOyzALjBvqX0Mr8QK7bw=@vger.kernel.org
X-Gm-Message-State: AFuF++mF0ceJ8NVtnXL/QchoOGu9dVLS/YD1Pzyn1TYanDNyganFgolU
	CZmgmpio0GfovAt8LenlURj0Kd0CPZT9Mu2lL/gxcz52uBW5DV/+GYQNcrmj72V0QZuktkC+UWB
	UjnqazBi24MUnovE0U3AZYlwFmPbbMCqLKNn6zDHKARrKGNTKK5BfEKhCu3c3m9rsF4I=
X-Gm-Gg: AYBFou1pYCD2sQfRUD56BMNmyBZHMtzmC3TibAQx5kbZX1vrLb2PkuxJpcYkLV/XjRH
	MgDaszsjBu9y0xxpBM59MTA0g3KHw2V3rdRvcw1s31/UgZ2ARjANf7/9E0EbERHkj+qDKjQY0Zu
	+YI35r5JackholdBe1H2yuu+Gqhlvm/gHun858KD7MtgeXEDfI9t10DcdEHzf/XxRvmi/DLYt5O
	brWSFUvA6FmATgYJVPfw3FlYqaCDzy6yiB/0HPoqvCVCVAjsUn5cnQQsd/vZ2GsnD/GjZGzt5XB
	blVrG3bAqhHD/mf8UJOdB9jv0vfG77aUbJJ098NsR5IixX3VZ5GbjOM8IkoCZ1sbAEPCDq+fc91
	3OV/pv+JMgQ6kc7G9xTOiitxCNC9BgLNeKSywLu73qJwAUadHGvModST7dCuuG5isUzFad/8YBw
	8S1o4BG47PE0NY5/zwVuDqlk0FCt2/JQCwBvYRUoU4KslewL7lfw==
X-Received: by 2002:a05:622a:2288:b0:533:8900:4eb2 with SMTP id d75a77b69052e-533d96e20c4mr164538671cf.58.1791141004753;
        Sun, 04 Oct 2026 12:10:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2288:b0:533:8900:4eb2 with SMTP id d75a77b69052e-533d96e20c4mr164538101cf.58.1791141004155;
        Sun, 04 Oct 2026 12:10:04 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([37.169.59.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm176318385e9.1.2026.10.04.12.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:10:03 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 04 Oct 2026 21:09:51 +0200
Subject: [PATCH 5/5] i2c: qcom-cci: Extend i2c read limits based on CCI
 revision
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-cci-imp-v1-5-227d12cb4829@oss.qualcomm.com>
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
In-Reply-To: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac2a48d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=1Gfya9YG+27Uq/30OuQ23A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Q-BVT9UuQ3EDAlpGIL8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: LcUHQaFC5I2w9yUkBBnnWJskNVHI8gMw
X-Proofpoint-GUID: LcUHQaFC5I2w9yUkBBnnWJskNVHI8gMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX/KYKVW9JxnGp
 geGjSRa2Nsf6h+DbVMarfTqrB1xS9EqRGIZRrNf8YH7LQsbUv2zMXVFABWrijVN5wwcKAyZ81HM
 mAY2Zq/JJWdPd44y0BnpRlGgOXdBPqqOLvpjIybGmlVYjo9GSakJTNRa8PN0B/UDiFTAIp685Be
 U045k7uK+Av2/I/WUy2yf7rKewu8bG58AijKsB/GS3qooqIcPM3s2YKu7AK1IMrWDkejGx+7TYP
 KvgArWroFN7ZPKmSKZp1EAWn56SKG+mGs6Lo4vKgsclbaLzpqGTLUje4D5tDh7hFEiH/8YWgCmr
 GD2frAJUIX2Sgif1h29H0VFTJOWzncpjbUFEiTvQh/XUu1Vz+Uf8Ext8KGx63eTU4fM8muILe7h
 is8sAPSFVbzpCMfsF3TjARjS3TIg6f+9gXVYV9eBCnti6P3JxuzIz4YJQrurRWMP71bnmNwC/h4
 GypDUOmuBJwBf440sgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX/xhaF1ARUlFA
 rIu4lg2VXd9olxJthhosWdR596w+wXkgNQX6fW7aote0h5rigYVN1Km0+DsU+PrzOnQwG9TdpbU
 JgyoRzn/Vx8h96+WDgEDTAZR4DKkzqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040076

max_read_len was hardcoded to 12 bytes for all CCI revisions, but
this does not reflect the actual hardware limits. Depending on the
CCI version, the maximum read size is either 14 bytes (16 - 2) or
254 bytes (256 - 2), corresponding to FIFO_SIZE - 2. Two FIFO
bytes are reserved by the hardware, with the first and last bytes
used for metadata such as slave ID/address reporting.

Add CCI_I2C_READ_MAX_LEN macro to derive max_read_len from each
revision's FIFO size instead of hardcoding it and adjust the
values according the hardware revisions.

Improve the FIFO read procedure, read the first word, discard
its ID-echo byte, then drain the remaining words in a plain loop.
Switch to readl_relaxed() for the FIFO reads, since the preceding
wait_for_completion_timeout() already orders them against the
hardware's completion interrupt.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 9554d42e6b976ef33f6421a98209c2fb837e9698..586283b2cb5f4d54a13e54da70812c1fc033b242 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -104,6 +104,9 @@
 	(((qsize) - CCI_I2C_BURST_OVERHEAD) / CCI_I2C_WRITE_WC *	\
 	 CCI_I2C_WRITE_MAX_LEN)
 
+/* The first and last bytes are reserved - not payload */
+#define CCI_I2C_READ_MAX_LEN(fsize) ((fsize) - 2)
+
 enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
@@ -483,7 +486,6 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	u32 val, words_read, words_exp;
 	u8 queue = QUEUE_1;
 	int i, index = 0, ret;
-	bool first = true;
 
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
@@ -511,21 +513,16 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 		return -EIO;
 	}
 
-	do {
-		val = readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
-
-		for (i = 0; i < 4 && index < len; i++) {
-			if (first) {
-				/* The LS byte of this register represents the
-				 * first byte read from the slave during a read
-				 * access.
-				 */
-				first = false;
-				continue;
-			}
+	/* The first byte of the read is the slave ID echo, not payload */
+	val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
+	for (i = 1; i < 4 && index < len; i++)
+		buf[index++] = (val >> (i * 8)) & 0xff;
+
+	while (--words_read) {
+		val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
+		for (i = 0; i < 4 && index < len; i++)
 			buf[index++] = (val >> (i * 8)) & 0xff;
-		}
-	} while (--words_read);
+	}
 
 	return 0;
 }
@@ -730,7 +727,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = 10,
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -739,7 +736,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -748,7 +745,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -757,7 +754,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
 		},
 	},
 	{
@@ -766,7 +763,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 1024, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
 		},
 	},
 };

-- 
2.34.1

