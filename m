Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738915;
	b=FNSQF7WVSokqGNjvFQO7ajw9wHLsQy80/dGdNS9DRnG2IMbLcWY1D4uN00bL9A7vQEdV
	 eHZs2RYcMKK7zgLsPWoUVILzOtFiB5Cd2qibXmR0/6vd1RkOi5QkJPBQ5hOZnGgSgsh2w
	 /F9G2vjcPKQHL+VnhMtR235hy/KpfvQpsxiPrMVyNd4hzEBDXqXMzWnsA6OGn0WgY7vs3
	 nUa3OJOeyLkgzwQPNRHTNiyfgiOZ1ioK4O1fTMKyTRpGpd5WrrkjxGisQOGp3GcsGi6vZ
	 wHTC/kq3Ns0VnZ5BHxX7apycRPyGzwPc3tRePyNQMn7gT9DhvNfBcnltael0Uski1vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
	b=LPEj9MqcjdvthrEiHnoGsv34ow0NwYgFTOezoG9rIQTtpfpk10Veiw29ivoF521RTl96
	 n+VIZYs8eZs/BLHK2AZWh5e23x6ZnivFysUV75ZUbFTBPLMqDfeLIrDgAdfj8q15yKizj
	 dnWNAGKISnZqnbOj2YQqHVBkYrNyFwz56CZs1CNfYMrjQ4JHGqB+4NGOx/ZhwHgnMooqX
	 tXPp2n9EZmaKuxK75nWQz3knsvf3NbglsqOl09OUU2Y6skNhKQhiCdFRy9iZduShP5SzW
	 KxBCTgAR2OIfnAg/jCOVOxaBAYU5pA8Wj7UKSFnSPBuMoG0MJVKLeokXZXd0dm3t2tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZofF8Moh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y9LYm7Kx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C9D60A6F70
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C9D60A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZofF8Moh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y9LYm7Kx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F3Sv1869045
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=ZofF8Mohc+USW1eI
	NDFrJvaaQSRAQsSPoHSy7cpknJ1bfuCth11Q0ARVxBr916UiFOSYxyLIywCyZS8c
	EExb1vL98f9mBJurk8W3rL57ammW8yryZRVgHFLwL90C/YHwz4rw3PeocYmh+cIF
	hrbcMPkVqKgo0EMJ2tFl0eZV7VO/VEj+h+/qGk7dfc4klK6KE1i+cjNhKCfAt/n9
	CgZ2mUC1FyeKmWPi1ZKLkBg4BdOsABv0IYfE+7S8dLJ692DDRJPuLgpNae64B5T8
	J50+bV5STkXSPKQyjh3uXpuUlGv3naULoEmaefn3ZYsiQq3/tneVE5zjv8g/NX0s
	T3aysg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjad88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso959541a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738913; x=1793343713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=Y9LYm7KxY2bk/4TtqZ+1UIE86CmBC42GOyxPhfmMQ0Uw7gRSux2XSGV81r7n4cqyXB
         DZm0ZryfoWQJ6lfKoqC0XLZSw1oDRXTK9tl0Xvw/+OGT1tl4S9aI9RwuVZmT9Hgud6Un
         xHJ1NDc2QY+KRAJmBCxGnkobkZjpJ6UR+cuhfDsuobtU2RXkH3cPs5n6IzDQadPeM64E
         WLpnzARcB8qb/HOHcdj8yVojsXJJu/gfkY8qsxaa/U1AcCGj64DLD0mEqon1Y7Ra//gO
         GZ/8t+O3EtuytBaRT8k77AJd19l8uocSbZGs6cjaBI1khCVr2SVkWeuhMuMTGTKJgrDy
         yDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738913; x=1793343713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=2lfgH0fMH57tMYm1NyJXzhtdC08FqgS40MVF7RZVf9MPDopBTjO/GsjfqLRCoBFdSW
         /xJ9aMJRm6y5Btypzv0c3vcf+kKUtdYtH0ww5EB0RwRXNKCq4QqjNOBYVZ+qafiQeDEG
         BuoPC06AVfZwRgbszQRKPQ3ed7szyMctUqwBVQ0oFt5kSxQw5StIFhjMzxOFGThPCqM0
         pTxwJp8UFzXGIwSz/ie61kh2UIArIvgcASOl5XTRJcrCSWNkuoRaEoJlKzMp/+sloTZN
         OJcMOxZEjB+ywcSn5LAZC2VH9oewjoXz3L2n4wAyO8kc1e9z6sqj2A+4uSVUmjtoEl8C
         KXCA==
X-Forwarded-Encrypted: i=1; AKwUvByXTQGTDfoOtSwQu8ipXbca1ZRz6SSrgR7v+K3UZm6izInq0tWIMw4/jSAaFU3Mai1Ep25i6Xmj1Lb12PM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCtcusCR8JRZpjKGes/oWsZ4OLHwoef0BKErldRNr0T/X4WOyY
	lhNBeWaaYjKB/gfIsflhSpoI61YMMnz3H6RxVZf7Y8kzMhz00RDqIVFe14OM9ZiYk/xziOkxpD/
	PUX0z6rySCBHmkstT9HSFoT1t7nyw6HrTfq3PwP7OjLG5H6c+Fy0PC47lx0peVOEPJ88=
X-Gm-Gg: AYBFou2rAQPWMLT/GCHe12puIdgXiZpRbUl3nIL3B1tHf1otH1hlKkItbLbJpAve3wY
	ZQS4FfwTi3czdn3H5aD8hDDLFRf3oR2eztZ4/qn90fXpA13p06JzxgiZUZPeiR32p6D8bB/fAg8
	+pzAgbeOb4xWmOv2U2JMgfvgIQV2ure29HN9SJDIAFlypFxdNFthtCVeb8pZebp7NhfqvL5A+lX
	v4WpqPWysKIQu07d4QkxQoeH0VlkZpilIFY+0XKASMN4QMFbvXl2dOnTtX1c5zpvYhsHT62K9W1
	Ecvg+ZV+zM/BhFulQjSdRX3plw+mXcPKT3M80mMMPduT8VWh8AtKC7MES9XbKfarg8b54PNtc5i
	EUMK9RLZq85/Hb5Z+I9eZC8uMXcXHqreQv4Z5bmVB7MibQYZDdN9dwzd+HJxHPcqs1Q7BX7qH58
	b97DCk30quyq2q3b9vGWtcdw==
X-Received: by 2002:a17:90b:3c0a:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3adce0cbffcmr1184621a91.37.1792738912720;
        Fri, 23 Oct 2026 00:01:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0a:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3adce0cbffcmr1184601a91.37.1792738912170;
        Fri, 23 Oct 2026 00:01:52 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:51 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:12 +0530
Subject: [PATCH ath-next v3 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
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
Message-Id: <20261023-mpp-bringup-v3-9-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: h3QJdTPuiHqBS384NDsjem7sFD-c03rS
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb0661 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iclRB15sEzZHjfpwsoEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXzLgbGfQV3y3c
 JFTQKzUdyymrPR9mgIoxRVeNNW5MSaVLl9/tmu1SzgaEKbKlq2KjHaORfOQQ++WhhI5O5dRCaWE
 pPqam9BMQC5d4oElyZILMZKIoEl+HhY=
X-Proofpoint-ORIG-GUID: h3QJdTPuiHqBS384NDsjem7sFD-c03rS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXwQVEMFVOOCTL
 PAY81B2FYSs+/jBFc9QaUfEBS/HKv0Kq/LvZzM1swx04o8UL5vSseXQfAqxe26WTGY2uZsJ/F20
 4KUUSBSHD2ym9JF1jojxUKX+Jtudwzq1soWKINf6snnDl1+WSgpK+JYWA4867yZp28E+SP7BfvU
 MhJQxDutkx3FlE4rJXZdCN9g+OpStksdJSnduUlrF/h6FBtukndx3eNzmAcHWeEc8C87cdjezW9
 XinKEMHP8iR6rlgbx99rnDM9zfYVvMDDWDbKXAJHkieYvwWljR8TqpsaaELhqoSAvgirwsHPWpJ
 TkDGiqJxIVKq/1BdNgp0cggEqL91amB+VCOLiaEsWZswTDUhV8tva3g/QHzwny2wsocAL0IWfe6
 uzPbuztr5rWaGi9QnQR4UZ63QJJOH7fuoX19Qsoag2Rc6jMrWuehHba/Ml3WYZIut9Iu6rMM8wJ
 RErqNCPKecUb5AzQnXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

Add support for devices such as QCN6432 that provide the M3 and
calibration memory through a unified data-region reserved-memory
node. The QCN6432 device tree continues to provide separate
q6-region and mlo-global-mem regions, while the memory types
mapped to M3 and calibration memory are allocated sequentially from
data-region.

Track the allocated space using an offset and allocate each required
memory chunk from the unified region.

If the data-region lookup does not return a reserved-memory region,
fall back to the existing per-memory-type allocation scheme using the
named memory regions such as q6-region, m3-dump, and q6-caldb.

Introduce a helper ath12k_qmi_map_target_mem() to initialize and map QMI
target memory chunks.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 83 +++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..cc488cfe2b2f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2842,6 +2842,26 @@ static const char *ath12k_qmi_get_mem_reg_name(int mem_type)
 	}
 }
 
+static int ath12k_qmi_map_target_mem(struct ath12k_base *ab, int idx,
+				     phys_addr_t paddr, u32 size, u32 type)
+{
+	ab->qmi.target_mem[idx].paddr = paddr;
+
+	if (paddr) {
+		ab->qmi.target_mem[idx].v.ioaddr =
+			ioremap(ab->qmi.target_mem[idx].paddr, size);
+		if (!ab->qmi.target_mem[idx].v.ioaddr)
+			return -EIO;
+	} else {
+		ab->qmi.target_mem[idx].v.ioaddr = NULL;
+	}
+
+	ab->qmi.target_mem[idx].size = size;
+	ab->qmi.target_mem[idx].type = type;
+
+	return 0;
+}
+
 static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 {
 	struct device_node *np = ab->dev->of_node;
@@ -2851,6 +2871,48 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 	const char *rname;
 	int i, idx, ret;
 
+	ret = of_reserved_mem_region_to_resource_byname(np, "data-region", &res);
+	if (ret && ret != -ENODATA)
+		return ret;
+
+	if (!ret) {
+		avail_rmem_size = resource_size(&res);
+		for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
+			chunk = &ab->qmi.target_mem[i];
+
+			if (chunk->type == CALDB_MEM_REGION_TYPE) {
+				ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+								chunk->type);
+				if (ret)
+					goto out;
+
+				idx++;
+				continue;
+			}
+
+			if (offset > avail_rmem_size ||
+			    avail_rmem_size - offset < chunk->size) {
+				ath12k_err(ab, "failed to assign mem type %u req size %u avail size %zu\n",
+					   chunk->type, chunk->size,
+					   offset > avail_rmem_size ? 0 :
+					   avail_rmem_size - offset);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			ret = ath12k_qmi_map_target_mem(ab, idx, res.start + offset,
+							chunk->size, chunk->type);
+			if (ret)
+				goto out;
+
+			offset += chunk->size;
+			idx++;
+		}
+
+		ab->qmi.mem_seg_count = idx;
+		return 0;
+	}
+
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		chunk = &ab->qmi.target_mem[i];
 		if (chunk->type == CALDB_MEM_REGION_TYPE) {
@@ -2860,10 +2922,11 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			 * Once cold boot calibration is enabled add support to
 			 * assign reserved memory from DT.
 			 */
-			ab->qmi.target_mem[idx].paddr = 0;
-			ab->qmi.target_mem[idx].v.ioaddr = NULL;
-			ab->qmi.target_mem[idx].size = chunk->size;
-			ab->qmi.target_mem[idx].type = chunk->type;
+			ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+							chunk->type);
+			if (ret)
+				goto out;
+
 			idx++;
 			continue;
 		}
@@ -2904,16 +2967,10 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			goto out;
 		}
 
-		ab->qmi.target_mem[idx].paddr = res.start;
-		ab->qmi.target_mem[idx].v.ioaddr = ioremap(ab->qmi.target_mem[idx].paddr,
-							   chunk->size);
-		if (!ab->qmi.target_mem[idx].v.ioaddr) {
-			ret = -EIO;
+		ret = ath12k_qmi_map_target_mem(ab, idx, res.start, chunk->size,
+						chunk->type);
+		if (ret)
 			goto out;
-		}
-
-		ab->qmi.target_mem[idx].size = chunk->size;
-		ab->qmi.target_mem[idx].type = chunk->type;
 		idx++;
 	}
 	ab->qmi.mem_seg_count = idx;

-- 
2.34.1

