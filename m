Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83349AA4B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455097; cv=none; b=IBoeBlg39FUOkFTeyO5B6y4mNCUpWQ+TZJVYdOhpACbZ+x+QG1EanwwwMMV6Xc3SUgiLcq1nTRCsr3fjFBoxrlm/UN8e5Q1Ldiy6xl7Teb0UpD/U1DpAIVW2SnHVdmAFCh/WMGbFbbqwIHTFGp7y6otQTlMYapN1vzD8CFnvOQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455097; c=relaxed/simple;
	bh=QgVnRMxXVlNk2B0erCzCAnkl4/YWHQVmaHD5aXG/R1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZq4kXtJWik1mZIJ1OUwT9si6HWyh+5vPUcfgxCjKoQl19Jivaxwv1G2bn6L5gXxpfV5+fiw15dLhIZZszAxerdAut2ATxkD3XhwbZlZJvK+R4jXR3f+X6aulEoyeIfgXfpW31aaklPybZ7C6RGF1YyH0gbXGZAmhCbcWJd/A8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgVSjH5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILYEdtJz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgVSjH5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILYEdtJz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KOrJ1846063
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=UgVSjH5TIZ5O3VV4
	Cjg7kD9hVCWT8y6IlLtWe71Pgz8ZI0/sHyk+yk29dw00hTzLR4Aye9pX5XGh0dQ5
	LgyWd9txO7fhuWsFGCFnTIu0U9xUGYsU5K9RAIhdfIry5uT3o53RP9sWDVdBRuRV
	0qPdlfcRMr4mY1gsm3wun0pqB5VZ4QvInvo2DYBVcaS5x9AXqjSxoqAxt3U09H9X
	dKBaltTvehieFA0D1XZlTRzWd0SfMjqibl7zA1Kq4s4gdgCDz+jMlIRqLBHqydDH
	kUuow9PYjVvEgiKuvvW4MBVxs2A7ia1XVqmuXPB5AJrPF4UBP1ZBKlgSRhPjWIrM
	O3YK/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jhkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df375fb9b2so54481085ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455094; x=1792059894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=ILYEdtJzuwKAgfXYa35hY8AYiZ72tIG4LCY57q+Msp9Eu5tyJ8YfWDvweCkyUfNB/M
         DuzeX+ZdqP0b98OvPCXHupzqDWKuoHlLyA4w0BI7eJrm+qpmd88Ztb8U7fv6VqORHGC5
         +IblOb1gyaxRmLQZVVHe7glNVY+Oqd7RWYTbQgZlRuUtBGHjdoLZmNIrn2VpxJb6xCZ8
         EfQMIA/0vk+iioZF2Jc7zbSbVf+YBcQ/xNSfhIXxO3zo7qA2fvtCO8cUQQIojpT71H+H
         icO+kWyzFMWBhxPUOh82YFfQyUcHO5h/cMKgBY9+mWdcSd/g/5Mohq6eOtae5mdedfiv
         CLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455094; x=1792059894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=dQwy9QbI22OOH4YLZjVB+4FN3eDpEG7SEaYIsCUHXBd+JQ6Opha9Qv1r8lg3pYUU7v
         67ssGAT6qNlXaa8TPEBZSDMlfR8h0FI26AOZL49aHnz1/6qDCPvHa8h02NeihVQyGrbL
         OQvnA+ZicKl3zgKg62CzXMvUM42seSUEFneTBMTys8ZUEiE+iFCMJdSoHRSD+YzZJpci
         ds4FRvgPUbGX4awzUyMJlCubpVmdXgV4xlDevE+pvZRFAgU5wGDxaLkdoaeiMMbOzrjr
         XAy2xihPLdKVWyNZpUuMAcFhBAC67rMZOj/HmGulvS3YEKqPB9jiLX1B+GIEzO0ZixAy
         wndg==
X-Forwarded-Encrypted: i=1; AKwUvByyOgyfwKIoop8l2kpK3PozBkRVcP+d+0orBA8nQYhUXPbyq2gqblKK73w/FBsmklyiHpWp7S1Ag4IzUg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzerndN5AaUCaQ4SSpNUJmU40Hzf0eeQ6NF/G7fdk8qTGprOCO
	pOXkyvINc+khfSNR9qLVcALzuHB1CdaS92EiEir3F9tnWnUx84FAgEkTVpmjfa7qdJSx43RZk4K
	Aq4JICDlFr+koVJGDoC+BfwwbH/KKClBLingYFTJm4ZZW7dpBS/+W5VYPK47ykKl+/rc=
X-Gm-Gg: AYBFou0DFaakNQ4OlZOS7Xt7q0A2BuHGnk6qPpjYIHhTYZRVY3VS7A30sE1ddjYSYqM
	2ugfiujKn9PSHvRLOWrxYJM3OTreW+9m9Tq98N0zWEQHY3Oyr613fZxituzgi2Mw/tbgWwLz977
	Ht7UNDIUtoa6sp+dp+ZpIw+1a+OIMWF4E1v0VPvLP4j9nZcpm1HqxLPrYHObh4VkgSracM4ZBDX
	21SW0CySxeVtJFDa9S8jddZHG1LIL37opKouKDOhR8oz1YAVjoOOHM7kSUvKFNCWiTD7Aqi8KVT
	hwyocUbwqNfkRIVvlKq7qIc/uu+1o79k4da3Wo8kZ0N2t2LCbD3pU9zod87fxHrFcoIRuE52XY8
	MI1SwhUsSMs4pK3rojCj1Dn3UCjFYBpsmMJo/YfVhOm8RXqvv+3Hr1EnBQbdk8N4l7VqLMNmzw7
	8zn2wg2Fu97RLiF3gvF7EIXQ==
X-Received: by 2002:a17:902:fd86:b0:2dd:c0ff:e728 with SMTP id d9443c01a7336-2e600545a2bmr41630515ad.58.1791455093800;
        Thu, 08 Oct 2026 03:24:53 -0700 (PDT)
X-Received: by 2002:a17:902:fd86:b0:2dd:c0ff:e728 with SMTP id d9443c01a7336-2e600545a2bmr41630255ad.58.1791455093163;
        Thu, 08 Oct 2026 03:24:53 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:52 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:05 +0530
Subject: [PATCH ath-next 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-9-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX4Fj/kYbP4XmK
 rxag8mpnRqGgSNWj+Qj7j8LlVHQvUYuDOdVzc+X8TjM1thaa5fPE1I7LlSS7bLL3qEZaes53lGA
 VKI0yAGh0UeDSUUU8rf+Utmwl7CLwS0=
X-Proofpoint-ORIG-GUID: nY0zFCqEYmAV8qLXFudDeSu75IcKw2G1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXz2qObThOqAxq
 XzLoeP6hKVrPOUn55mEIcRtncex5pTdpCLk7r/pTYAMsK3upxdAUBjjDbULnD8l/lxk5OszvOcG
 Oxp7LTTW1kHVLWeqkBRM7U+JTww7jdlgYWPMoj/uN+oSU9HffNw/DhZfsBYeMfDinOYPKg8quzN
 B2erUO15j8DckfZA4kX4kwa2zYC7hNae+PypvZuJDc18z+Q5PB7s88cvJf7GNd1I7ut+77/TByD
 0HdmSmYBNiefqvayf0MiC1163b301lyVMGoz0ac+rU9a+vyEDQIaAHfPR6Tf2WcQPapScDLlOcP
 buf+cQnDKSV6KgqEePblwWndMfbZKk/9F88yzNIzEwlb2gDIcXTy5a+ObgnSHVGzdrHWW1vA5E4
 vj5jQH1sDQ+5AIRpo78d7oJRah32F7NMD5AKh5HGqH7NwbteV91JyEPQyGGAP2u9OG3cCWv23vl
 ipMegi4+Ww3gYSXMwQg==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76f76 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iclRB15sEzZHjfpwsoEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: nY0zFCqEYmAV8qLXFudDeSu75IcKw2G1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

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

