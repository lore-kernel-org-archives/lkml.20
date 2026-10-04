Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1FE497B93
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141008; cv=none; b=gfV8uT2oC7SrkT7FykelB1tU/+XpRGTSvwjjqp+b/ywtMwOgXQ5JpxJMognYdNkHdUK+gQ6sTlB+RVF1OFH+MYCCz0tAPdzhvHdoXwyeS4bw5Pl2kmnymljw9oR3vlzxhEwtCeQlv5rgnMPsXqFHAoWnJvxF9fk+WmXnTCDqCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141008; c=relaxed/simple;
	bh=+BFjDkLLGiM4Z4BilxjEIUHw5Q8uQiEcFlpgHQFk4iU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OcQwRLjxThmXMAUhHuFiayy/DEKLlpgtpvvuCznQaBfe93qbW7sOpj/FoicEI55LSXWSSIwExGm650ZMScO3G7SRseEPPJrMqsFdpymrvANp0IQr66pRRYPoT0fYqTLVSnmz3JSDH0saGaMlD0h/+N1OIBqNS3t1fuH4wb2OTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpeB5qLj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMVM9wwQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpeB5qLj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMVM9wwQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IHUtB2884785
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 19:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3rp9e5dLRcm3b9/yRcUca1yu8dnsEO/hPj3KPAyrCQ=; b=QpeB5qLj+BsZ0PG2
	h9rYqLXwrHtR+rZL51iB8LZ+gHAOHE3MzcDF7jQJDW65BKKeWoS2YvuJSqKgp+wh
	cxZbHbcnMx4aGXXlgxMKSZ2/NIn313OD9zcP8EaYsryi5IhZOq/PMPfswYRHZKAd
	IO944Nr+QA0ahhR/ltJUl3Co78AHD6thfVRH2Sa8aAhF7fCQi0iX2eoD6rRHhwpl
	W0bkpWbVEGmghoZ/jTPOZh+iPk4TrjPK5kxC/RzdP9poEprnivNmn6FRM3s42EVV
	/Xjs5NhoqmD32t2ouPi0Xk/Nf7bgUAJObGcpUx8FRH5F62YpjxeeWUX756b0SGs+
	wpr+FQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfhh8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:10:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338974c0ceso27694401cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791141003; x=1791745803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3rp9e5dLRcm3b9/yRcUca1yu8dnsEO/hPj3KPAyrCQ=;
        b=WMVM9wwQQUz9taHGJXysSlfN5CqcyKhsTGxO3Ya/FtDIiSgaWPxsawrplF0nmSQT6a
         E+D2WGdp2OekCOtPptsDZ4Nzz2ANuFnDTRgHF9SEr9i3VybCaRH+dPOpKkp2Qni22PUs
         SJK6C8DAXbF1v2iYfR40GcE2KsVCCEk97Yu4HvYkAGaC711nJJ6m4b1oWpr+0ncCFJcb
         SAwXHK2J9kx/TMsdXe1Zgh1b41Ykj6Biu3aBScLZMu6MXws6BsvQ2kve/QM5ZhyuPsxi
         VhvWfPEKjPR40HpzWbAKVSHoKRp6vLmsmKYw/2Jub0gUOTVYSremGjRCbu8K8dmEwllr
         lIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141003; x=1791745803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3rp9e5dLRcm3b9/yRcUca1yu8dnsEO/hPj3KPAyrCQ=;
        b=KR0p1YTKW+hHiYdlTYqhXuP4KtBPY93g/UE6rXHtBkiR0IuOLbYk6CGC3Tx3WNSSp2
         ZV+0CJMEkBViRVkBSm1chjQpeeMi1jchEJrAiK1vGDs0TD5NzPFkNSxPZE0A4bU7NVjV
         hipV+5tO2mansQG1zLUlytp6H7EEZvjLsSsAiZm6YMwVUETGhST10P8TS7oP9dqvfECZ
         KuS7+inPmwkq3DopI8Jif133X1HVG0Oh3PjJUJJomdZC7E/hkGE1/mC2gdxml14R7/tC
         biX41YJH5mzQCTqf3aOjuVRt5TzcdUu9Rnfm9/ZRO5WiKfUqPMJfafN9s/Fa04fEkwcc
         d9oQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdGTYhcLwIPTXg2yvAwRWlRK96B3ASJqtChWSNUGTi/Z7j4+2IM7qNVKPojkeIqTdYqoM9tNXAmB1DUyc=@vger.kernel.org
X-Gm-Message-State: AFuF++ko08/FxfgtgslhgRJChrfjJ4eonfsjPGiBI81j8x/S94Lqt4qB
	emdQzHnJ+GLKnWhzHfnsJ5V+WdTOHLQAKIF2R86heOrEpxFeFZNWSKrEx2nn/zI8ZHIrhQObfna
	5UjR0iRjCp1Q5mcF8k4ja+wAG1HgwJ2S2b7cznnPdHqon5LeblxnTaICcuSmbk/R7C1URlJGYnB
	vZBg==
X-Gm-Gg: AYBFou29sIOt2LulUOBYOxOTLwa5UZ1PilcMOsvmAKAoKA60UHAqMO2CzMibted9r0b
	dwVGGwMSNHcK4nRS/woLGkquGCVOi+AXE6gfACTkyKOYu6qyvEuOwaExdD22/a/XKlEN44ltkLT
	8SgP5BHe4GTBsZ1SeJkJLk4gmy8acR8r7rnpUSRuQ1Jh24pAAMOYcIDRSqcbMZl3izPyZKhFCE3
	z7u5wBYPDL+yErvMmS1bdQOOnCKhAlZ6jbNDv9TtF1jU0Pve7+H1iN8BzQspfWGShd61m+zsLfD
	yeRZeCMHHxuycJFr/9OrrKidcK6ofWT8ULGXbjzqzncoCMkpo5ymRgv+hREarouqoU9YOWU5fn2
	4cwb1Vlojgtf4XkYJDAlBU1JAvJEK+dRc8ZYEki2PDVgWHZjUN+lzbo5hQZBYZSd1fkm+QgPyUH
	Nmc/9V5Kas0NzJ4GiuO7kObVdHGK5j6DUZ0wFAyoJzxpW8Bw4ONg==
X-Received: by 2002:ac8:598d:0:b0:535:2568:c7b7 with SMTP id d75a77b69052e-5352568ce3fmr40815151cf.9.1791141002894;
        Sun, 04 Oct 2026 12:10:02 -0700 (PDT)
X-Received: by 2002:ac8:598d:0:b0:535:2568:c7b7 with SMTP id d75a77b69052e-5352568ce3fmr40814881cf.9.1791141002482;
        Sun, 04 Oct 2026 12:10:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([37.169.59.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm176318385e9.1.2026.10.04.12.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:10:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 04 Oct 2026 21:09:50 +0200
Subject: [PATCH 4/5] i2c: qcom-cci: Add burst write support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-cci-imp-v1-4-227d12cb4829@oss.qualcomm.com>
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
In-Reply-To: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: JvXqN8uId8tLDBSO8iFUE0Rr6TOxLWO-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX3BPNoUSYLjKs
 MzlOzeFt5XHYxYJooNDIT9RTLj9vHZaj9l9foUpS41juz/99EeFxAzHkGjEQD0W9vf14cXHcvEu
 2XHFCBiIkU2YWNOF32UHmP/AyiyLo1g=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac2a48b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=1Gfya9YG+27Uq/30OuQ23A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IknTBVmojEPKtAEnxLoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: JvXqN8uId8tLDBSO8iFUE0Rr6TOxLWO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX+1YO57ToSLnw
 5kCQQPdEuFtAGWbzPqYUKICIESaxQCXEdnRHx5uZSLbRiwL3gujHRVc8ipftqPEkkwtlWMItcCQ
 pjUZUeIUyjsxqYqlYCOrSfJ6IcvPmCXXMz0iW/sq7JYYU51IZX/uS9N52QL+AOCjUSyW7QHoHIm
 orSENExR06pQ88kJ8tRA7wWzVpVtnEwdlyshNSJHUOOm6deWqF4iVkw4Z98X1N6vjWETdUpb8r9
 rSJOhc+AMmUR4BWqErfJFyhNA2E6zFfaqUVz1aRGq/rdPrH5LFhAWkyJ9BJfvuAcCoJins+DL6d
 MR+8nE4PgoQ841pX/Nwnlx4HDWZ5LMGeUoU2TVKJpFwgTMmhdU/1dQLJDEyyDpZ7zunfbIuuAo0
 1+TbeDU5s7OqMrHCy5NizvlHbxN0eQyhyeF4+7chUnlvRPLdMvjnA5mBDh87YhZ5qJV0QkzVI2h
 G/xEzVLJQJpdi/Zk6DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610040076

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

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 44 +++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index c0b39d419e296454a083d38ce302940875b8ad2b..9554d42e6b976ef33f6421a98209c2fb837e9698 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -85,14 +85,24 @@
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
@@ -520,14 +530,15 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
-static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst)
 {
 	u32 cmd[CCI_I2C_WRITE_WC] = { };
 
-	if (WARN_ON(len >= CCI_I2C_WRITE_WC * sizeof(u32)))
+	if (WARN_ON(len > CCI_I2C_WRITE_MAX_LEN ||
+		    (burst && len != CCI_I2C_WRITE_MAX_LEN)))
 		return;
 
-	cmd[0] = CCI_I2C_WRITE | len << 4;
+	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;
 	memcpy((u8 *)cmd + 1, buf, len);
 	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
 }
@@ -536,9 +547,12 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 			 u16 addr, u8 *buf, u16 len)
 {
 	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
+	bool burst = len > CCI_I2C_WRITE_MAX_LEN;
 	int ret;
 	u32 val;
 
+	dev_dbg(cci->dev, "master %d write: len=%u\n", master, len);
+
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
 	 * This is to avoid overflow / underflow of queue.
@@ -547,10 +561,22 @@ static int cci_i2c_write(struct cci *cci, u16 master,
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
@@ -712,7 +738,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 64, 16 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
 			.max_read_len = 12,
 		},
 	},
@@ -721,7 +747,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -730,7 +756,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -739,7 +765,7 @@ static const struct cci_data cci_hw_catalog[] = {
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

