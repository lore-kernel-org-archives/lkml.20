Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A05377EAC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120953; cv=none; b=ER8H9Dw6u8b48US3sjkmFzDvj5/8Po23RjnGBtz/VB6rqxyy6erKANengnP+/X1QNHo67bheRCPbxNkY0e5wDuAZX/I/7vwPOjos8Wrpify7KQws19i3z0xgOrFRMjC/+3tGz6rUs5LS50k76Ak0lHxxaylVT8ccfFupthGDgwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120953; c=relaxed/simple;
	bh=QgVnRMxXVlNk2B0erCzCAnkl4/YWHQVmaHD5aXG/R1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QHzsDu5+17IaJzVaYtWdYN2cEqh+9MBR/avewOEivDmbrO1/3ciWfz9epIWWKiOH+1OixyWahTY6FLXP7SDTIl1hg/i+vruzMPb13n7sJEjfTqFXfXlQzKy6qd1MMuq+nj2h1ASj+RKq2Fo903VBdgJ/3GHIE3xNdG2aWD28gH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hs6xo075; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfgqS9sT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hs6xo075";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfgqS9sT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKKa873800381
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=Hs6xo075deQa5g+J
	HbNwJvBoKM6xiougM26CaneMWkgjJoqHoMdBsr/3z0ikWuAFVu8dFmenBqSLZtfa
	Cm4CidWmYQmdo2+2q5WwgCCeDN3cjY1XdNZtHW3itl0gaTucns7zo/QipzE+zXoM
	Ns2frhBo33vh33I7aeuSStJ6zr2OoHE2KYoJPFDBTecyCEi0CW2dAc1NFyGvrw5n
	PPPGTKwwPCwK7RKnOtThYGYO5yJJpA5vx67gMuydrpVx6v8UspcLk1gaefxuvdKx
	GF01L4+75etKT7YMKa8OEfeOry1ykHEHDsdzyL+vzN+tDpMxASf11i6w7Ig29Zjz
	3gUr9Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5se99rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso12163263eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120950; x=1792725750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=WfgqS9sTkitavvJgCWaP4mUzTA/TAdAL8f0egt9Bxj9Gi0ulGalaEcJOMHTZh7sw7N
         n7lg0zCWpYpsg4roH7NPGSHhItFGdrPpSxGMHKwysyUVRaBZaCTidx6uHr20R7kO66Vt
         XLRziOuiW49PztsOQWIkz+p8c27s/XGdhuJTMIlhLG/TgHJtwAa8/pwKX6x0bYCOEcjn
         iRyICi75qR1Dy0JVO4a1SgeQitLj6aN03qkb+LsX3SOok9Apy3JLl5JWaUHai+MHpmuI
         I0QwpvUpw/G2oGPvXFAcF10GTYVKMWINuSz4oDpIjaOcNuf7oDt+O/VT4F8b1gYZ5Ndk
         UFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120950; x=1792725750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=KayR9BfsouENGE7w0WDgiqlO7rywfokSf31Id7mfo4Py578BMMNJSZ2tpt5cS01jF3
         aYEkZy+kbq403RM3JkU1941YjVSbu1u5nJiH0ghICmhH1lwJAY0MHWAeg1tzdSBt9gky
         xnnZCIYdjCxwS3DGGbAbtPQxhAJhxiwx41kvpR0KQK2gxay/+kRf7uP/6Fx0V5RfrI9+
         SFb77tiBh8p/hkHDokK4XT1ujSncrRnawZ2fM1+vQzohkYQIWQ2Efn/uxovh6+O8jELu
         hOXLxHzFMaal8iLNBtfpKZ+munaZb7RA300GPQ0R8OCNRWWm9AKISBeFvyEOzp0EfFaC
         WWwA==
X-Forwarded-Encrypted: i=1; AKwUvBwDLmOnZE2AZXBUjpJJon7RHlyrkcklrW3u9A/xfuEj03tEkSWypm51US25cSliXGsCqCsSxz3vFk6otAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlc9RB+F58HrJi/oNkICz8qBeKCFUJfj24BFnRfemWeQu/yv4U
	v9Oc/nqWWKK95rL9vNTt7zvOUlZdo4xylsHEWdbjOXcRUJsw8NsAw+IIJOzUVEWZo2O/X2Q/vxo
	ay4aIEBR9RMzQJmZvfaND1QWVuz3hgIjpHcaedF9ssmIaS7+yG0mkAzpSZFla4UB7aaY=
X-Gm-Gg: AYBFou2zuVSwPEua7eG/v78hiMG+Er7Ew/Sxcef14htiP/lLY6tMYhitVaibH5HjQfw
	qmc941DrDYKLbptM7wET3119F2desJDQFWabIoRMSygJ8Acg3PT+qGROO0GqDt4/1KodfeqesEa
	FB4i75EVYA/eOt/vxf9gOFF4mggNFM7zYbdEHGGlBRItaXF7ibXjj30TsgW5g5WA91gOfhyI98e
	L+UUGm9dEmR/wRG8biTJwe4NRBBDm74jOlp8NVJcgc7xH8IYqmukALGlH4Tcgat40/YcW8/r/Vo
	EHNhZQSLzL22gzS0ZNYorqPwshvcKjHFPdy1k6YKbGkf/wpDOdpTcf1+S9hAIz/VlrFPuuXP46j
	ofevuPu0ArGaYCwpcv4aMtd0G2O+acwFZ2UntFI5IRpUG3osvnoC+fuARz6zmOQaPOI0tAtaGL3
	4xxwDfm+PZiuDjgfui1c/ZhA==
X-Received: by 2002:a05:7300:cd91:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3537e13248cmr40625986eec.31.1792120950128;
        Thu, 15 Oct 2026 20:22:30 -0700 (PDT)
X-Received: by 2002:a05:7300:cd91:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3537e13248cmr40625950eec.31.1792120949655;
        Thu, 15 Oct 2026 20:22:29 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:29 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:46 +0530
Subject: [PATCH ath-next v2 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-9-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX4tdWRF0dXMgs
 KeFICD67DXWu9FyPT8ry/QOCqZh5oQuCWdSZINXAinaovktSIQfNqHJ2xyGjqe8wJ+RMQfP80Bx
 bbJzftrz0q6CjaXudWRgdWXj/gE+tgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXxN0ap/uMmX48
 A6FoGZv/3s/GvViz89noY4MFg4+jvce39DlG0vvCtI7c+UvEXrDFGMzpEhGym4sunzVQrYkGWAf
 tZuI+7Bo0Xwu61k0o7BykjJEcjeRDOfLSM/3luto8Bchxm6/QuQKHx+BGNk353qDEFsI2I5hyK3
 5BDXtGLiRCsx6E/Sl6obFvm3y/3KbmMaGgA4EUE+x5wXp+ZyaunHJv8JL07vijcRtkkuqbZ74UX
 oUSQicX/7Kn2kTjjWUMOUm2qojl+EXifv+c1LYF3cLS5d1NOhEAaWfNsiOqjKaN23bFQHHKCpeD
 Z9Lx22akKq1wlEfsCsIVFYHMlc49w1O8cjlXg7WTZr/qQX/XCxy5pfMNQ30d+A4I2RBRDLPQj9Y
 BDKf4IqTEYxbzHEPw2uGrzKzyT7B6QbI3WaEMvUEENZiv/TqietMmeAOihBeESCMtAkjeYMdFzV
 32MS+VS07emtVFgnrJQ==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad19876 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iclRB15sEzZHjfpwsoEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: V3aeumTT1HW_pwAR5su3JfZzUE-CDpJI
X-Proofpoint-GUID: V3aeumTT1HW_pwAR5su3JfZzUE-CDpJI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

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

