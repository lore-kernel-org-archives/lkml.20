Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9A4BF94C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887441; cv=none; b=PVSDzuw7S9igN9ES9BmdBqHqskWeZp0ySOoBSyhh5kbk6dme4X6rMN/lTbbsZdb9kXZbXeWrox3dHXVvPzeH+/x9POVgZ/8Y9oefpnMOQK7IdJDC34kPXBomAG3q+dtiGJvqTWXeHatGyMzI9YBpH5MEawj14flPGUev2nFHBIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887441; c=relaxed/simple;
	bh=DY7jRWya1V7pBJnOdw6mxdVbCjyXXQemGfkmzifD/sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8sWiytXcb0yumz+/2iD6aqV/5GRvMMKSJkkKpdFRaoO5eo29iBcHnnKIAuki9RnQqIyMv+Z1hg7gUBledF0X4FvpOwNTzel5qbqDItJI1CDj9BqdbRGNs1o6isX3VOfkyIkVa5VARNDoy6S14MrTyGBhpJ79MAe7U0xqPLiI4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YeBph5Jc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8Ujsg0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YeBph5Jc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8Ujsg0W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OWl6015194
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/JpQ5rbqgRLuJ+aASIPnJlmyhNkhvx8AwZ8tUDYUlk=; b=YeBph5JcmibuCWG1
	rnQBm8jJ+PlXoJR/DLiNdOAlFJMapHa2IB6fm3InchofTisOT/DsLAr3OFxl5b8K
	6YsAC2jfo+BNvBShKrvBt7kfWyk0y6vJpe+nv4G8QDkyamtzDr3bKa7dh8VYFjN5
	6qfdkEIOiJlWht9GsktSLWwuh4rgyShQ82BYhufQy0BwsXyGiIiA+ziiVnaHNXS7
	tCBY1zdc3yHZkvjysBO360gMwXjk67L6SDiHZliFActBxLiUwciSYevPApC7rslP
	7BBnquy23w1eEp3mB42CHxK4+QuU2DKts6AJIcap7AaxvWIcYejCoFc7MPN04Qcv
	jsBWGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugs7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso922087085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887438; x=1792492238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/JpQ5rbqgRLuJ+aASIPnJlmyhNkhvx8AwZ8tUDYUlk=;
        b=G8Ujsg0WaQV222ryWwNXk5X4vuLJHUb9x32ExGqxaCgslSccezOAK3PSJTe7C6RKxR
         IldzXl60m0S//ARR9Soji/+1bWh0yDraJO9j9SH5igK6GbxNxtH757qM35YBy8A393Yb
         JjXXUTVjGwDc9FPUBymaRhjtA5AHsjTGBfS46f4FQHGVfvChkdXl6NR22+sSegcPCUnu
         cZq7bmL4/Fny91+ETvst6/ST3OQphYgxgMDv22dDQdrhs8SCmvZn+nhSoxdhZ8cJfIeG
         7AM7mtpMYkC1Lhv9gbzV/gHBR3ijLw4IaANmJFe3KkrAP0Pmrgrhj72m/VYVzV0ssD+K
         kk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887438; x=1792492238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/JpQ5rbqgRLuJ+aASIPnJlmyhNkhvx8AwZ8tUDYUlk=;
        b=dbOIg4c5yZ/MYVn1V5u/LEPalQbIh0EF1xLQdQueK22eLMvtTvlmOm2nq8sHuIA7Vz
         y4TMVEahz5/HZUSR4mgvpXNu86siXFBd+/gsv5PNIVhDCi0OgzXD3YWqUm1/NiQNaO+z
         T09zd9x5gO0grTabIQeHl8YhR0VQjuLuuCGV9AisAhk0J7fjJF16vhkN/NESaHSYGU2X
         LDrsIyzLVgO3FUsomSRDkPJkm/TpqLln94pulKHK0E2ftVcabUnSt1cylXKx+YTnBGof
         K2Nw+c71imPnuGNTbIxp1AhnaCFmh/blzPewnInQvypmBn2WQnycm9wN+M452mPjpXz/
         LM7w==
X-Forwarded-Encrypted: i=1; AKwUvBzhtqYoLhe+H3yfv5rKD1mD4EMbXj2MfLIlNHnm0Z2ZTzh6akZEWrqf3RCxz59Fybj9lAcSAe7v09baY5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOV98a9ucsxISK6eryE8LTXfCJWfccRXoygzbAUlB+lx0hZ9tj
	o0IVy1+KXROnXPndn9RxCAtU+kT1bsO21cq/xiqhwORyu/2rupL2MhePwH9q2O9B+4Fm9b9Hgv2
	hzwA/b56UIpGn3gcWACdPROZtxQiWz3M3hzSGLfEVDIcsDIcPl8YdAWJSOyA0mCdMGffBmOxamr
	bX58m9
X-Gm-Gg: AYBFou16tzS4fbCmKCAo0HcAkiaem3t4S5pFEN7uNDGEsa+iiOBRDZRLHx7pYdBgIfa
	iZWmHaXuLTXFr/XkaRSXiJoTFq9EU7a9Wr4CvOLe1aoEYqVaNzrnHN2HrAUVonxzMOFOCBqCF71
	AUghD7WnhoaDAyJXxcHTpt+nfNAF4RXsfl0UgKdWg08HeoQsqOnPSGXEXIlnWHXS4K7LSb7Vah3
	6cGX9d5L5OTJ6eTU9devFcPlzE4BCklwpJCStpnzmjkAL7LX9zoQmYEZhRMmfWCnj7pne5qURnd
	ZTS7VifNsDZjwFwRYtuUNVddM1vpBdTnjUZ30wdJVJ3+CqnQvF1gmtVCGtWyuoibu0F0zQdKQTw
	rBkZia/JwG9Kbq6hTQn1XCbmD9I2cLVMtVcxdqnHA6PfBZmE65mhR5nXlFv22Niv889oBvmYoQI
	LiJ3xaNXEjwER+SnJwBtMbaZ69zYH9xI2e4M+vyy+jkShRuGYjw7k=
X-Received: by 2002:a05:620a:2b4d:b0:93c:5952:5765 with SMTP id af79cd13be357-93eb93ef568mr1900260385a.6.1791887437527;
        Tue, 13 Oct 2026 03:30:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:93c:5952:5765 with SMTP id af79cd13be357-93eb93ef568mr1900255185a.6.1791887437013;
        Tue, 13 Oct 2026 03:30:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:29 +0200
Subject: [PATCH v2 5/6] i2c: qcom-cci: Extend i2c read limits based on CCI
 revision
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-cci-imp-v2-5-6873326b44a3@oss.qualcomm.com>
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX2oPZ5dBmGugV
 3BQTH1BO6Ow7NA+YXQEJDa8yubXIus5rXYWHHHXQAwWZiCb1Z5IrHKLPqf3qOodmauGqqdiGWfH
 6p4Lhn2eFcslch9lHQWU5xdrHhKaitBf3+kSHohfplqNMCKwfKl1B/VEPe0kFAUEYV78L0gj/Zm
 WTDtEZ4if1OfZ4sUVa5k231VJFZXKyd8IK0b+aZFFEY+Uk4UL0GN8UW27XD/x+/pVwTbMIrGyEc
 1nU3lAQ33Rtn9nF7StCxjRm9SlGWVIH/O4LQpU6K1ZRWPXTAsj9exes638/3OSZc1anpwyXYvTO
 yYnoTknnAdJQ6t8bIuLQqRRjJby1imZuaaEwUpqxHKtYFbWYJ8imSUSo9J5xR76Jmpeo2Qh4dWs
 s9WxOrt9j+DDH+/c8OcWRTReNDvG0aEQ628lSaBzG7sk24WGDFx7Aa/aSkwRfBWdgyl2aFg7JJ9
 X/wYSs52+Ry387wXE/w==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace084e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Q-BVT9UuQ3EDAlpGIL8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Nb3Z5bWOAyAYWDiyuRSVFqGilke1UQMn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX3gtgIHdcvKHP
 4id6fAH2iAPp9NsITvWL+mef31FnQazXZTywJrh/OA8WOlP/8bw8hSqf8/5ysQ7FpAt4IqS2eRS
 MEGZ5+2RnXUz51Rkak3qtPC1cr9pDzk=
X-Proofpoint-GUID: Nb3Z5bWOAyAYWDiyuRSVFqGilke1UQMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

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
index 27bbd1e196f9c55c1af14168b83eb6e6d51c75ed..9a8d201c890622d6c1f7b6b7aa2e0d7c075008ac 100644
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

