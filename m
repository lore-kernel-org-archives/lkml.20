Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785AD450402
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137624; cv=none; b=ay+qrS6j21oe6/gfShW1VA/1qVue76n+VTuHX5ffvffu0PBOWwQFn+c4hyDj49luAIQaAI9+6fFA7+CYA42QC5knlCzgqAJZ0+jyilbCrYgWmDWFg3YEIQPiy3mfK4l07mjKTR32kxhhZxM+41Y4QrrLKodOOC9IWXLd0+3z4vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137624; c=relaxed/simple;
	bh=s4Xv7K4OvAD0uBwBVLJBBqdtGCwPrigiXOi+IUrvax0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDWP6Qb2YK/uCqyqtLay1s7YkqlYk5n7pGr+ZgBEinPlKFztUxEca+oqcQbuoZPc+9l5b+i1Q/GfzrFIEUZLwUL0IdXM9/X+VXqodp+0P3yX7mkUOwo9G2bXHfUd4YDNAqo8QYRL4femq4iL9SN4oei5agKjI2FU6GHPBCYXCHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofe7O7M6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hO3Jd4aG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofe7O7M6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hO3Jd4aG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6rh1p3492972
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NM/U8a44rlIT9UeEhwV9SbSD3GlJLAGz8cAmI6y5EAo=; b=ofe7O7M6GTGQTGg0
	dL1vLLvH9QtF3MIF1wwDevvJKELK//Hipsab5yjYEr0kl/Nu74wFeaayShL1fJ1X
	UH2bJiW8zv+CeAwOLhXyhlwIOWbZ7Bw0uzMucRACC6/DrXQR5Cl4vxE2f6gADr2m
	guiJESHVzy7m3S0QKO1N2SJlXYIg+L75mFJ9DhwCIHVWYfO+QMipZy54NQEg3FKc
	7fm955ov5VcjDr4qhM4RiZJ98jbtoUTBOMKpoLkKadjW1CjOo6m5nYvD6dRkT96I
	S/T5ZAXdk5DlAldhTX72qPOpxJeuFoSfTeCzOyr1B5Xbvor+cWXYfM0XyT36DvRa
	OE6M+g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wu7rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bb074ed1aso69099616d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137621; x=1792742421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NM/U8a44rlIT9UeEhwV9SbSD3GlJLAGz8cAmI6y5EAo=;
        b=hO3Jd4aGPG94Xj1uM/f8euZ23kelrWhQEW1HSNnMNG1wrylj72TmmEjShIR5vtvuE1
         5JcPrlAiViQa5RZ3ZcvoGgOM6hNONrI53Iy5M/mFCzEIU6sBGGxoF2eAlW3drgyW6Naa
         LJGj72p3zjYFsMZHpqgmXhmjwrbCQUnmg5rDJmk2r4+JCVd8PLTKl0rJmhcozn1helf6
         rnPKSfSvzP4/4tRemRksk0a4TwM7kLEzE+T637zY5JnokCACj5+rETX2DK6CZsHWtWPq
         62KWMWQB2HgYXShnmj8kcBKVLsytaQeTi4vUif03j9OPTvAxKO9ROeYm5edFT6p2qx0q
         HGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137621; x=1792742421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NM/U8a44rlIT9UeEhwV9SbSD3GlJLAGz8cAmI6y5EAo=;
        b=UH491KMPXatpRf3/V+dyLthz/8hCCZrGn5KGrWd3qWpKWou5srJ6Q+j44Vo/y5UpcY
         3y3k0M7Aecb8YxTnQCQhlpiuOm6t+U7OxPtxQCf9pU7NsFZwb3+OLyf6TJeZzfzH5ZFk
         WgP5zAxKVPu3UdrnRdQ+6HuhIsQ/WKiIwkYrrUMMvOIYB8EN5IJMyeG4+QymOy3QxOZK
         fAIywNhMnwIEyAl360Z4I45+aPfUjgYFIAb/m2sx6zUVjbkVeuh1A2kq2M4egO2ASFrx
         qdCDA2FUJCctmyPvQfHDSszVxZiCwXJHhzKPESI2nYrpqT7viJjvJuW+VhKjwch0vzek
         iXZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7dVVtGSf3Ih6r719qaL2KKwMgczOp+pfnyRTyLusucCqq69U1J9z9Jt9t/xxLE/QkdIBgXgcAVXSVZ1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgWGny1CKv4HaFBoMo10Ie04SiAcK54mQRVUkjcNa3ia+vTXzD
	Qd/Fd7AdMMitMe3lRSQnYxLVhG89kQyOAnYHnxDWGFkJ7klt9p3fuAeSchKYfq1Nimare9Ja6bt
	fqG9avYDT/N/AlCQxOA4f6/S3n/WoXln0QGL50PCCdust3cMHTWOFrJjVLcX0qsOu8wI=
X-Gm-Gg: AYBFou02Br390MVaLAJhkWznTa6ZQQ++LWgLlPE/jnq4aolmotqFvDTkPN36q2lQ5SP
	EbDKavwMpo3tNBOJZVCKVGTQnuNkIRKvNkeGAIjecIZp835teNuy6IvyxAfNBydys8HDUpEmFuE
	h00G2Obzso5t6XTxKaphZKGDCsladEvz6y/qFOhqMJ5AkCxjVggBtA0i+si3vBt8iBlUQiUOeKC
	vAt/lSFaqjmbzu7/l/I0UUe7pph1whspGLcG3ThvWKMD7ipsMekHmPecNLiOGgGzDC75AcFGRt7
	Cetl68tdIGrkESR5hjFrBE5yUFd0Ix6iTPw1hXFGGHovjERtDihSOjG6gO66BLXAJQW9HUcEPzl
	cL9Vzhoo9/s9gSDXrXkt7P/MmdqhaQW9k0/F0X2OignI0Kiy2O6+l+GvsQcDHp89GoeMubLXS9q
	8gpeWse15MZFX5WqLQ8CbczjgHmeMIP9vzvRH6rXwJ8dX+c8KvxZ8=
X-Received: by 2002:a05:620a:2626:b0:93c:61ec:d17d with SMTP id af79cd13be357-93ebd224f79mr3279619785a.14.1792137620354;
        Fri, 16 Oct 2026 01:00:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2626:b0:93c:61ec:d17d with SMTP id af79cd13be357-93ebd224f79mr3279615185a.14.1792137619741;
        Fri, 16 Oct 2026 01:00:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:00:13 +0200
Subject: [PATCH v3 5/7] i2c: qcom-cci: Extend i2c read limits based on CCI
 revision
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-cci-imp-v3-5-5ee7ec1ea1a1@oss.qualcomm.com>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: pYALaMSJ6XjUH6Ugn6naREB0t2xHKO8I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX1XDzEohtcelC
 glVzo6PDthKt6i5uLgwBZ4w3Si3uAxsOpbGfAklC8HNVgKHMWB9Y/yH5+A5/I8Ux5Hanlsx97c1
 FtXbp7OVDPiHjH+RoD+Z57J6nnRywnbzlW3Glchrv+K2SKEKhq++HIzzUI+IUHc/QirWlyune+1
 sPuP4Un088upQvPo5C2bm816tenUgMw6qmZGBMBV4qwZZxo5g8V/bst6Hs6horFfpmmo90K+Eo1
 RIFlSZH6kxDqPqwMQih0AJKslfpyzF4Nw/FvlphsgC5jaz4d/OqdAJMCJ0Wefi8zezJxVp0jktQ
 +GDOj62FPm1/4RONk6qUvcDQ3kTpcG11comL8nPF5OExSogNJKwF9/XYb2MhFmdS7v0UDh9kHKX
 kGsmWR5h17MZK1qWeAXPXhz3v9zwl7XUNMLXvIBpBkllfTOgmDAK3eQBXFwdoNd5LOxt8W6iy4b
 EJw9UeB20rfxz/JdV7g==
X-Proofpoint-GUID: pYALaMSJ6XjUH6Ugn6naREB0t2xHKO8I
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1d995 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Q-BVT9UuQ3EDAlpGIL8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXy38a3xx/miZJ
 x2PwlO9j55y7wTFTL44VB5JFv9ohi9TVgqV5Q3nkJtJYN04xKAkUwlm2zcy5axhu3RPHaVefBG3
 vmBsSHDBKwGVrt7nct1F8pJsT7XsbT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160031

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
index bc4aa3c6431f385e07a74c67323674c183a31f97..18cfe03439e204691a9ea873f67faeaa119b45ff 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -105,6 +105,9 @@
 	(((qsize) - CCI_I2C_BURST_OVERHEAD) / CCI_I2C_WRITE_WC *	\
 	 CCI_I2C_WRITE_MAX_LEN)
 
+/* The first and last bytes are reserved - not payload */
+#define CCI_I2C_READ_MAX_LEN(fsize) ((fsize) - 2)
+
 enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
@@ -484,7 +487,6 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	u32 val, words_read, words_exp;
 	u8 queue = QUEUE_1;
 	int i, index = 0, ret;
-	bool first = true;
 
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
@@ -512,21 +514,16 @@ static int cci_i2c_read(struct cci *cci, u16 master,
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
@@ -731,7 +728,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = 10,
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -740,7 +737,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -749,7 +746,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -758,7 +755,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
 		},
 	},
 	{
@@ -767,7 +764,7 @@ static const struct cci_data cci_hw_catalog[] = {
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

