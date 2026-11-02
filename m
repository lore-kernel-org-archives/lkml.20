Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612863;
	b=ngtFoPSpY/XKow0YtMS3YN5kMACGMftvA9qWkSXgefZZq6tZKBiLcjQI3HiPFKZnQZUS
	 c/KWS2FpZ5x1vKHq4flJ3yZr1iZlRDS9ueAL5DgL1nyXma10zM4FygIsDyON4BeqJtLKK
	 iXN2hc0Bm/80eYeOBO5mwSHgClVWiQp5gSw0BjKsmw0wxf2zvOt3wmSnm0h4BvXjsZGY0
	 uiqjTcF2YCSOfA/7xvLazGJePAC6OnjEnP4+T9DGOlPCV5onU2k5TJUpK95y//+2iuZU4
	 ZoYscP13LEsCh6kvLS+HZtr36R27puFYi+9rkmgImn8FU4JkkyzSbM1AJhQm+FcJY4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
	b=vQ7bnyKAs5XpiPD7DXaw4v4KQrFwNtMOHeRVGPU0rMvoKPkNztWvzyR6KBXBQLCb9DC0
	 G5UyuWe5xMOBQb5Ifiok2vsdunnOV+QMVrAZRVXL258VpyuGSjheYtOLLiwYP+wsJWwqY
	 RKkOhcrpBBFd6448Uczo97IT7/dQO3zybwxupNAMgfSO/dflylRTnnV+k4HDYifkM7cVd
	 RuMv/nh5NwKDiWE53DnjjjRigfPFvDL6Fz9of05Dlvnajhv1q97PIgty0XG2xzGSsWymO
	 HuQSoQowBQXXwdg3LPaMkQgtSJY0jQZSRaWXmGbwiqQo8isX1+xOs96K6iqh7HeI7LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNJUqfs1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXhF+0X5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A682F606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A682F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNJUqfs1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hXhF+0X5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQsN3440395
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=RNJUqfs19Sr+WHph
	sG8GJEuoIorB6oTdHRYnBL3CjwaUyMsTwJHoCk1DHgyOqlP3ep0vCNun1HXt/lww
	jd5BNpC4MWd68Qypmu+xgNPMzNGKQS+Wgu0I3O/XPf5r87btGZAcgvVeJaP4IKac
	VevRDpWMi4p3HI6prsN0ddgVJ27OMzjD1gpfkrGf3N7d6DcCHjF2Ee5j7Deu7R+Q
	m2SrraJCCpZFl2NB9L/XBTzM9jCRMMchfUL/WCX5ld6qmtgmN/6/u4geiIM91K33
	V/hAcQ8hPAATebK/O1mhDj6g0XBD1lTQvKYlQ2YxcUqh95l0BstczvPCv67e2Kmj
	CQyQgw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201qx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:47:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so4250329a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612861; x=1794217661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=hXhF+0X52so4HJEIfx2/5X0sAjV0rL2WBy7uu7KIZeL1B4nCqxyt746v9K0DD3+v0x
         vHsB5sTMHROQ1UxlHpx9cdagTzM95u8CUIF1sV+0wrpQpzdDgEUITBn/fcdw7tAY07wx
         L+Z3Jv7mGj3meL9uURAqLlfyiaIGxCgcionmBE5jEw6RmWuDM6m8HzuP215/8NEr3Wfj
         970XXnoHROjy49ubuDzQSllPNjX7ISoaxt0hUmUtuuq6wD6umouUDp7zMrwxQ7uxYGTk
         Yjuk5qYPhPMoz8A3Ov0ie3PhOow9lIIAB1hh6xtt5SviR0u9WlQdDmeOwvZazuwoBMGm
         /JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612861; x=1794217661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=1y1RtYMUv6uSMTd35j/bfzbMfU5viVdFp+bItHBNSEuCr3FQUTVWEcxQWq5FZKZiDG
         GwWnojPELFdB1KFIB/jWSBhIL46uCxJzkDeMFh8TVSiPafSnwSmJIxtUz2JNUOz4iyrL
         0mAcPr6luq/fCpgwxmnYAOZ/2BDgWRsH4qJ2R1fYm66PKwt9WgoI3E41Gt6wHGG/WeEF
         evOtBcLDcrubUSvC1bm3b5cBNJbiVL+PR3TlWzDk5SdwV1g9I8KyWZe6z78V9D6du11E
         QqalFSh5lv3KWLT43OtsOqZ8a+N0+MwOA1g+9A0W1vL+iPD23KNAIooDplUx+J7mjU6r
         ku8g==
X-Forwarded-Encrypted: i=1; AKwUvBz0OhTQCYTpt3qZ3Now7+8KMIIzOnlwmYY+36xI1nOtI5/AQyF7UcsIRyo/w3QynsF2Q89ZhppOzVnEULY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZOnboAnyFxMpjmpMdxBZmOMGeDHP8o6K/yV1lDNbt1TCeYlAO
	H5A10H8015Xgmwm6eBF8w9BzbQUpJMW3o/ANWdJszJEWzqWEkzMP/yRiXKBEybyLayyKm79Oetu
	TpG0hgG5IYFCqT4Md4vQU/dlzoKbC1gpAccwuTLvNkQ/wOlzuRJZUj761/k9TpA/9uao=
X-Gm-Gg: AYBFou2PgoT/zXMBfGQYHXaqCwwPKq9k36kJ9V01xUbOp1mplj2j78czjaJraY857RF
	KVHFWe5BV0QQ87lKYzJEyI2n6U6SNWvqNWClbJ0hxCA61aQPbnTNikG17Z2Gzb14Nyh7LJhMSPV
	9YalkgAT+xmYRJEuIBC0x3GbQ6XxTphIFGNkkazc9joBVd5gxdw76HyX7lMJkBD2+M331bdDW0N
	TVCMw4cLf9zMxv5I4N4wVPEavMeAwaBkYULhvrYPZ9xsLdGCrezunnIMeZaT378h5v4cHMoJJPN
	CxJbngaRC0kpSIpiI6gUc9T0F9CDJ7oKrxvKEg/XTzIVXxlNMuqb8dDeq+fNDx/vyFeoqc7GTt7
	vKigxBCrJUYrU3or9YxVcw/Acbc2PZuOPw333OnUaRc1mO2Y4AcNAWdpiqC9jjhD2e2I6qMV67s
	3X2fKEHlse/HL/zHdHGKUIyXHe+9JMSIbEAJg=
X-Received: by 2002:a17:90b:1cc5:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ae89879e16mr8145689a91.62.1793612860656;
        Mon, 02 Nov 2026 01:47:40 -0800 (PST)
X-Received: by 2002:a17:90b:1cc5:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ae89879e16mr8145657a91.62.1793612860131;
        Mon, 02 Nov 2026 01:47:40 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:32 +0800
Subject: [PATCH v21 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-4-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=XOtbNXnqwviiXVD8GZTLVAet/X/Y4w+n5WKiPSE7hWjDS/8H+PbLlGjs1lIIlzUiBsF3QkomK
 sZNwCEDZXiZCRBkij9CKD0mQfXzZzsdGowRUGPYmnHp/M6nIMEmQ+/Z
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: twU0HZKa2gzCOS8RZ6ON0EaW_uv4nN9J
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae85c3d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: twU0HZKa2gzCOS8RZ6ON0EaW_uv4nN9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX9JnNjYTnf7A/
 leI5/QmyieDrLZO3qg6Iegxb0I//31CgtCYwvzILj90HvQVixV+jAbk4wya2w2wLUEh0Z8j2fdJ
 nI3RXlwVnsvh2oY/A5DT60wTqAoHJXPWhxWVGndOh1tUXv9f8FgYUZzUXkOs1eTG6ybmTnh8krO
 NLGEA8FxwAKu/QCLoaQaJrso0U330I9/pueC11e7u97QEsBhRZ/tk11723eQ1vK+Tqeo1Gbs5xW
 OaxLv9zUEU+wX/icGkgfsg8K/yI/cZL1cLWQ63c0PqAa0m3V9FNQ4egefEqM9uavsmvwFnlhxSz
 HVqvurcsoUYOMzloRsPwQ6GwjhdZjqKatZ5hS0xqHhX4s+G9iTIXuZK/drf2vO829MItkGe99Df
 ou+YSTIFfhKQRH5d/FwbW8cCjBSggKV+h9IWgoQz0NT4emOD++lo+GwymWUGnNtiBSaGVNEHoRE
 G5W8U8rm8lHqbfMa9Vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXw9/tTAmtN34b
 KHpfy0q6UAYmHrbnE1hHavq0WH20ov/D3GH/vfm1aDpgKhVoaD7QAhvShVueO13nkv5WO+JpWSv
 4l/yVYpa0Sr4qYQGbIpQDvwD6fdDG9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 30b15c38b080..36c80918958f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -263,6 +263,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -294,6 +295,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1

