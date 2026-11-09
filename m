Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232993;
	b=j9KwYZuONIMSs69N3+Oac5Qzpj1Cr0p+P9NX6FYjzgf8gbJkSOe4XbBOt84h7OWnRkTx
	 zE8enXv1/cQG6zHO6AxO6vc6N2heY83ha7hpV/lHp7MimU4qYOVFT6Hm5CwttcvTAD/FP
	 +RWgO8Agi92JxCJgwCql4Ees8HkSGr8WzZjGQyuxhrRhb200XkMBZAorJyqQpXLPAXZ1j
	 XoaeZ24Lw03rr9AOQ+iW9zGLLawqlCzxVJl+9ygsk4pytvA7HepcafoiBaqrzKq7BV1tA
	 gBrwFZJHr+y/AouxbG/Xcdm+WjbA2iE8UjMr74h3yZd7OUWyzMHkQlqsNFGyQIjrOFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rMm4oZuo2z9W+nImaszEaAp1ADUmyI6URhH6NsR12iw=;
	b=h1qFMuNvI9sJDz/gQEsCqwCu6Aqz+ABMoLdoJgynIpN/QX7F1i1ZYEjSp70KJGl+pfrY
	 IGmfMIvIMJx2FgwEdqJ5DgES+J0DMFuQNziVDDrGBXPuRF0DVi+Ad+tqzyZAEdxRIBCJa
	 HrOYD5GwGtK9iqGNnfotDm6Lcw3AeXA2PzOZXmnIWiye/Mvrak4u8KeEt8nPe1orn4HpT
	 +xr5OPBIpVPf7zUCMSOh8nyDEk7Z1FWwNt4Cogx9nqt0D11POAlGw4Ugyp3bKr/esr/uj
	 26ZrnPx8UoHxmNsfM+oKw/wgQLvw/U0hs/X8nICOqHYgwsq9y+XRbq+hIWEnm+NsngA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nrl/FBq1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4dd3nam;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A3C606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A3C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nrl/FBq1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4dd3nam
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF2RQ2928709
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMm4oZuo2z9W+nImaszEaAp1ADUmyI6URhH6NsR12iw=; b=Nrl/FBq1tchQeyEO
	usYUOiM6DNJ7kNmTpsZ/+DRm/R2l5HRmmarw2ynLWaToVnPHX2hAKzNnX84norvu
	S2zps9VRww7nd1KgkeE21hnbQwrqUhe/o2UerwID8HUk9WNUEpuzrAiQ+09Phcbn
	YKZRBd6K2FaLMtZTElGPsB3/PYU7IOH672Xeo1ib2oQceNXf0ppsl2jLuvtpTo0X
	ITrQZB10mI5e49KvdKI8XU7BlNBIcT4t00Nue9gpZFZTWbL2HqzurrDemWf1HEU2
	JRE4cl170BwjEdORL5zL5VEVJPdSjX2T/edDY2MQbJ22GptU6bde52z5bqAGPbZu
	ujkHsg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8ruv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:03:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990835cec5aso696849241.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232991; x=1794837791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMm4oZuo2z9W+nImaszEaAp1ADUmyI6URhH6NsR12iw=;
        b=g4dd3nam1MCzoRnGGWYaCz4GPC9D/NGBggObDqLf+9ErWA2Zxfr+q28aV2M+za4nP/
         qkr7MrVJ1l0VTSkzTBJ5nvv3b6asbW+/3/rwYqmoeLokecthQs/Vq5aFa5cLAGCnOnu0
         wMmXyIdZfuARhZExk6Ot1f42VITsLgIhqXkgSAMpPgKdf11kMi3KdQYGrFlP//S2PqcT
         Wu3Ug6KqYO30a8kMD1SkpGUZhiFOP2KinMGaFTZenm6mbhUimPtar8yUEu4zX9d/GrNA
         YMNjgFoDE2r08e/UH/GxwM4tcBf0fXiXLCA0TI8KzbbRmL2JXmTIv37trgikEXxQfLog
         ZjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232991; x=1794837791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMm4oZuo2z9W+nImaszEaAp1ADUmyI6URhH6NsR12iw=;
        b=OG/uZnBkahL209aRRlf1eo3nZHtK3k1CFu6ymT0JIX2LrOlV6b4bULiuRo4UDKLQeD
         uVMNAW7x1fMk9HyZ3aCpXIBW3c0/trZggASGCvUOeP7Tim4gnOwtMFnbny8F9O0r+3za
         h1EwUsRhUDDcuao238PnIBNmSu8E/I02bf4HofdZvqY+j9sMv+l4JBM3j5pnKQEDIo9Z
         BxTue2bSXG+XWASDEdRoIvp05RX5sybEB2+9y7Bhcb885JKbZ1o389w5/ayF3WGbzBhb
         9G2wJgqIBJny8NaAfrEtWbIL/Ilgp1OE63WFty+kGB+sL4TldCR5epK26GXCKHjIGeUR
         5VLA==
X-Forwarded-Encrypted: i=1; AL+hErHI31wYu5DYGua531L79XQA+HINefALLz2Z4LD6xmZcSS64+TlFhcitjkCfsqWGdH79eKpj+PgTSfORN30=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JD1Z0ZmWa1aGVXFi+bCO+v+MfGajOU2BcyUoxv50GR8RVnkEL
	DQLH2ykmXNmD8xuL9tS972HtUBzZafA5h32ktvoZcQ47WFrR1FYbBEBXJD+LCe+NUj/rzvkDMjd
	KLw7Pg3+R/lp7mlrfqMYATKHh0TYXOJtPYkLkOtVYdLss404mE91wyQwu/i7/ODAd2dA=
X-Gm-Gg: AYBFou1Fq67KQ1DEFLua5RS85jZhbkXslI6GUvFUWilzd+gmRkDXoOBBb/YBBMxz73W
	KmT1p6Y9VYwU4b7FToPUJtOY33g2FBPcQ+u/JnmjfdjyzyGeRVxPw0kOl9zxCfcm/ZtbdVPmxpQ
	L3ClwlhM9thqgLQhe3bkhrdK+5iN65k8Wn7nP6d9fXi8RpwmOOiQ2f/CF66loNf+3M3zedQBif0
	FLVos/CjJ+WxXNfKY9jg0rf2QcgB4PzW2KBJ9nw+nZRt+XIcJo950oWv7ub1XI7ALkhAEUdcybN
	ZaNlGcwNrWlon+55OcCupsEYIQ6FFZfeuaaJG+OpgDHUn+gvoBYTEQCCADXm4dfTYJ8XSHuL9g8
	uYdcYEYUi4MX0rYadzutaeRDo7rtZFfRGs2HagqW7A2KJKnyAux7GeyOdJucZ92G2F/G7/erix3
	13Od9MlyUz0Di+IIwhogiRito/xKfzPKtDa/+cWD5IJTQGkPxeCwBaMw/RIu/IeYeyEfzNvgd3h
	rv/tg63D9AnyiJgQk9618HvxJsi
X-Received: by 2002:ac5:c001:0:20b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ecd1fb88aemr1103803e0c.15.1794232990364;
        Mon, 09 Nov 2026 06:03:10 -0800 (PST)
X-Received: by 2002:ac5:c001:0:20b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ecd1fb88aemr1103759e0c.15.1794232989817;
        Mon, 09 Nov 2026 06:03:09 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:03:08 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:01:58 +0100
Subject: [PATCH v4 5/7] i2c: qcom-cci: Extend i2c read limits based on CCI
 revision
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
Message-Id: <20261109-cci-imp-v4-5-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX0xaQJZ/4/z52
 t7Y4YY5zhvZLjf5JoR9zJBj5RWUyz/mFxieBoCnMcxQcyCyK6GJufJcrtBYAzDO+kJffOmNpG2d
 5EaoOQP6TBnV+DRMbTLkjO6Pc+KgwHFxDrNkgX6AIxut1wkky1+d0MUP8K6W/Emn3pY7/TjPPWf
 CU8961ciAzuZ4mOuia4ZjfGkJc8eK0pxI+D9nQxkJLVdAIIYKxjux0xmkrb01MiVgWFtinCuX+E
 h+Urvsd9ITvoushKeoDPkHEfjqiK65fbDb6uqUYYA2zYiUNMBqZhbGuiwwUJnlfGHDrVX3aEo7W
 Uzz47KqAuGfpkFUOKtQoIdr1Ds4GlsTTSRmYwKijKXs1eM9Ysnakz/DgxWoayKRxmMW4j9+uHws
 xJuMEyMudD4+HHmhd1eohApn3lEpK4S7F7vMkbVIhuirvoXSbxGzFjhTd8PMKueZWXh3Z7gsiaV
 EgJw4pZU+nTkOPPujOA==
X-Proofpoint-GUID: FuR8DiPzH0VII9bPVLpPMrAkrS1tQMoe
X-Proofpoint-ORIG-GUID: FuR8DiPzH0VII9bPVLpPMrAkrS1tQMoe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX3XeFkYLnqJ2K
 RKb9YwXEwR7HgFon/KCjzTK57B/KAye6N+aVtlWZEEvF7RS7srOcI8pWZaTEyyIbrvu5JTcjK3b
 DH5NHToKpxUutCLy5woDwXuwE2SqZLs=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1d2a0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Q-BVT9UuQ3EDAlpGIL8A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index a698130f4712492847336e401c0789b1a64dd02e..2e10e9775cffe57f291c48176ceda4ec14411db3 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -106,6 +106,9 @@
 	(((qsize) - CCI_I2C_BURST_OVERHEAD) / CCI_I2C_WRITE_WC *	\
 	 CCI_I2C_WRITE_MAX_LEN)
 
+/* The first and last bytes are reserved - not payload */
+#define CCI_I2C_READ_MAX_LEN(fsize) ((fsize) - 2)
+
 enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
@@ -479,7 +482,6 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	u32 val, words_read, words_exp;
 	u8 queue = QUEUE_1;
 	int i, index = 0, ret;
-	bool first = true;
 
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
@@ -507,21 +509,16 @@ static int cci_i2c_read(struct cci *cci, u16 master,
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
@@ -734,7 +731,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = 10,
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -743,7 +740,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -752,7 +749,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -761,7 +758,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
 		},
 	},
 	{
@@ -770,7 +767,7 @@ static const struct cci_data cci_hw_catalog[] = {
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

