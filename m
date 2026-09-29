Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4624B4C10DB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651875; cv=none; b=P6+6BlLzfZbZcHgTuBILHKBH/LZFtkG21jSaVfsRhpBQadQ/kkbKS+Y+SgjZGRjFvHG1/IVwDLP2LXe5HxfgPp9aqGedgRj1DXo2Vjgyq8XtBSrvHOpEgGTXveCySCdWxAeDa+a+gHL7kQzcpicrBL56Fh0qFiRFctwh2wMM4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651875; c=relaxed/simple;
	bh=N/GoXXPvoD19zUb9BSvoUOZ49eNN/9Uv+mNF62wn3GA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hx4F2fR0EMldXulAVZb5HldKLyJ+/j25RRp5UYMWFxXu40qCnfgzTzlmby4ECMDKYdPZvWBnFGco8SX+vVbKoYRoH9AuhBMOZWmjnTxwS43BAm9bCiB3AOkEO9B3ELli5MJbVM4wF0obFbEVvV0+xVo17pml6yaxxQq+2s3YjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2zUHReD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBasGQzH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2zUHReD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBasGQzH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0j9mR2342202
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=; b=J2zUHReDk5sg9gVd
	f7LIXb2G3xqE04HSQG6WjzxYb+O2OcWDxp+WbdXxvS4Y5/oxO7EVvtEJzK/ami+D
	fzk/xdp1+OjmzDAB2AOx3/c0lgDlcBs70OoyhJjwVeAW6QC7vEqg/x5IZvmz+o13
	P8EmMlPFJ5P7ay2PlpVxBlSNACF54mJNQ+ggV0G8YRjvCaRUascCDkPwXJ7xjnQc
	LqW2irlPPa1gfHmlJDYR6AePsQxjusmFHjCi3v08w6ntFgpIiWx0Uv8/cAQTqGpR
	TONhdK/TMB6WpyxZX2LJ9+0byySACPoasc5tZ8u4fmMBAEn5P82aBBXp7zok0iFs
	vYGA5A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw21w33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34afa104860so585099eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651867; x=1791256667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=;
        b=SBasGQzH45C5pDV5CeS00V7r5psbzbreC11aWfScx3LefTRL4lQg7EpxwFLqhk4R/w
         1wUkJqqZf1cyILMSG2AQAJzu+fv8pmValDoUij000XOC8qn0wEwqT7Pb3ibR0xqOt0HS
         pMNDSFLLu5aqGZo54mOam0ftJabSefDNgnkAZtPeAOyb/DachMAF+rd6tIySx7YmTEbw
         +cOAAMvr4SAw855/B4dCQXJkl+xnGd2cr3ZUi9rWFS8arL4HNaHYaYvl6tgQEt8PHEc3
         wCmRXdlfcUHrPRgjm32NZNz9P9oFpdq14fcunfXrQ3/7CZpIQdZU79jTMuRlm3y16fbU
         t7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651867; x=1791256667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=;
        b=CsV+HMv5YdVbwNvu1HrCylpVHzLQnbLJjyPIW4uTeHJNUfosxA6IzyL01rlqQjPg7a
         k3y8m/LtHB5B1ewpOUoefP0fRnhHMbxFB1lFcvPKB4QcTYCW+39DSLsrkPsCGQ/Vh8jT
         bZewRFCNjM1t0qxeAKkM2reSe3tkN3/GtKHfsaysDhx6B2xTpZeTD1ibV2F6dnHP407R
         WZZJlUUSlOGSAaqBsETqwAL0cxwrtFWofuFuEqcI4e7zXistvgTGVpV0Mhw1YhpQvUBX
         pCdL5E2CSGcGgIbV/Tz97t3NhRsGZC5N00RHsZEidQynhu6hnxyk03X+eknv9Rkn5f4a
         i/JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy2rJOT7A+Za1jdILyVd1cgxA/2NmPuDkASviUvXJ4Sl7GsyoU86eW5TTIcasm6Zj1MvpItVopMOFm+5c=@vger.kernel.org
X-Gm-Message-State: AFuF++lt4YZY+/wl6w+KvojOdpUQHd7CLNyDpIOdUFnRjHjQzYVvcIc1
	QGwNcJnVgxgEOfPn+behKVfPILyE8iq7sEuxTbaZZzG32MdSsVgW5zsaegwgQOAA3zGaj52uAbp
	UU9+G7jk0fhA+OpDvLvWRRT0FBCTfsbmYvWV5ANJvdlampJPCOycUF9BxujDO/MAreA==
X-Gm-Gg: AYBFou0NHfgwwoj0SDowcYvVIF3d6sQbCj3rXRU5DH+CnulUuv+mOmrVT2sgxojK+oP
	2NUl3boqMmq9CNYRHZbwtec5GtPLtx1JWLTKNhg8zjriELkYOaBDyb+4naiQL/xMuHBMEdN4XxZ
	yTAj02JgxN1rRNQK5fcATkr1mOTL7I8yCRMVhJEx6C2vxrjNC2ZOVLkzUJci541eukR35PPZeJi
	k1uMtuWFjAQGHSIg2K2ngjLj/uCSQSWiUi4fVEUSPyWJMNVrpBU9ttu9VoPHbYsGaTFA5O+Hlkr
	MMW+10QAwCfgXdGM+ST1zhmMburnvxXkJ0Aj5nAfsSS5uj5dOBdafUzf+vYtI0fQ50d891g6MKl
	u0htfG6ziPaUMwkGsOMVhpAI1k01dgSrXdTfZ41deOPdNEoUKzXU+ZW6f1jY=
X-Received: by 2002:a05:701b:42ce:10b0:143:5c63:23bb with SMTP id a92af1059eb24-146ce4958fbmr12821645c88.11.1790651867392;
        Mon, 28 Sep 2026 20:17:47 -0700 (PDT)
X-Received: by 2002:a05:701b:42ce:10b0:143:5c63:23bb with SMTP id a92af1059eb24-146ce4958fbmr12821622c88.11.1790651866843;
        Mon, 28 Sep 2026 20:17:46 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:46 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:53 -0700
Subject: [PATCH RFC 02/10] mailbox: mpxy: add direct synchronous send
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-2-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb2ddc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Tu2Rjsi-ZZ_FYV3k_IYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 6nEhnrx9SIpJFunv9nVqqsKhy2m9EoZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX8iE13BhlXEjV
 Lfp18jG5bt5ut1GkJmzoaTFrk7B3bP72773Uatu65UqKx9zyf9rUQyBHimPy06AmJBGrBaJq53R
 XE07UATrKYDEEbvw4BURFKmqUWf8fAr+LuPlFdWT31U+xU5R0cBa46sT5cQu+jZBPINceghvejd
 SlJFClnamwJH1g12RftUxXcroTnGT+WUPPUtvIESNJ0laa6Jno51OyC7u749YpidV/+3e/T/Gyr
 vGbyGQWDSjoDIQCugPnS8fuxur4iXoK/0kZGNPh9XF/L+rn3vpCOEsJ9xRWpitZSjNXIaJLh2/8
 smK/oo4HtrUbCxI9XmhF2ut8wPpfdmkUm30M5cVj+KmAMlqbwU/GqMOpw+dsjYCG+49gJe8ajXN
 +3TbrjurNqNc1H3syhJLifVEJkneKc9iE6f2swhRjeN5mkL/6f4NYAU066XB7PfgJcnqjgu/ymO
 2VFW4UdZZ1u//Eb1wcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX0eZzT7iF8rIE
 9lmnYBKpJGkIIWjmsg1tqXhWyY9I9KPeIjkyGMXsUW3TaLAtSL3xvHLkr8Az4bstHAFmzK+ySRe
 zYmEx2MgwWCelh2Jll79eFWrpUM8p08=
X-Proofpoint-GUID: 6nEhnrx9SIpJFunv9nVqqsKhy2m9EoZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012

Implement send_data_sync() for RPMI MPXY channels, reusing the
existing RPMI message dispatch and returning its status directly
instead of going through mbox_chan_txdone().

Factor per-hart shared-memory acquisition into mpxy_shmem_get()/
mpxy_shmem_put() so both the queued and the new synchronous path pin
the CPU around the same per-hart buffer, keeping a request and its
response on one hart. Calls on separate harts remain independent,
subject to firmware support.

Add rpmi_mbox_send_message_sync() as the RPMI counterpart to
rpmi_mbox_send_message(), for use by the upcoming TEE transport.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c      | 196 ++++++++++++++++++-----------
 include/linux/mailbox/riscv-rpmi-message.h |  13 ++
 2 files changed, 139 insertions(+), 70 deletions(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ea69c6b6b4f9..5ca1b6d87f5c 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -125,54 +125,83 @@ static DEFINE_PER_CPU(struct mpxy_local, mpxy_local);
 static unsigned long mpxy_shmem_size;
 static bool mpxy_shmem_init_done;
 
+static int mpxy_shmem_get(struct mpxy_local **out)
+{
+	struct mpxy_local *mpxy;
+
+	get_cpu();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active) {
+		put_cpu();
+		return -ENODEV;
+	}
+
+	*out = mpxy;
+	return 0;
+}
+
+static void mpxy_shmem_put(void)
+{
+	put_cpu();
+}
+
 static int mpxy_get_channel_count(u32 *channel_count)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct mpxy_local *mpxy;
+	struct sbi_mpxy_channel_ids_data *sdata;
 	u32 remaining, returned;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	/* Get the remaining and returned fields to calculate total */
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 			 0, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	remaining = le32_to_cpu(sdata->remaining);
 	returned = le32_to_cpu(sdata->returned);
 	*channel_count = remaining + returned;
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct mpxy_local *mpxy;
+	struct sbi_mpxy_channel_ids_data *sdata;
 	u32 remaining, returned, count, start_index = 0;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count || !channel_ids)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	do {
 		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 				 start_index, 0, 0, 0, 0, 0);
-		if (sret.error)
-			goto err_put_cpu;
+		if (sret.error) {
+			rc = sbi_err_map_linux_errno(sret.error);
+			goto out;
+		}
 
 		remaining = le32_to_cpu(sdata->remaining);
 		returned = le32_to_cpu(sdata->returned);
@@ -182,55 +211,61 @@ static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
 		start_index += count;
 	} while (remaining && start_index < channel_count);
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			   u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_READ_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	memcpy_from_le32(attrs_buf, (__le32 *)mpxy->shmem, attr_count);
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			    u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	memcpy_to_le32((__le32 *)mpxy->shmem, attrs_buf, attr_count);
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
 
-	put_cpu();
+	mpxy_shmem_put();
 	return sbi_err_map_linux_errno(sret.error);
 }
 
@@ -239,16 +274,17 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 				       void *rx, unsigned long max_rx_len,
 				       unsigned long *rx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	unsigned long rx_bytes;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -259,8 +295,8 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 	if (rx && !sret.error) {
 		rx_bytes = sret.value;
 		if (rx_bytes > max_rx_len) {
-			put_cpu();
-			return -ENOSPC;
+			rc = -ENOSPC;
+			goto out;
 		}
 
 		memcpy(rx, mpxy->shmem, rx_bytes);
@@ -268,22 +304,25 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 			*rx_len = rx_bytes;
 	}
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 					  void *tx, unsigned long tx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -292,40 +331,45 @@ static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
 			 channel_id, msg_id, tx_len, 0, 0, 0);
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_notifications(u32 channel_id,
 				  struct sbi_mpxy_notification_data *notif_data,
 				  unsigned long *events_data_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!notif_data || !events_data_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
 			 channel_id, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 	if (sret.value < 0 || mpxy_shmem_size < sizeof(*notif_data) ||
 	    sret.value > mpxy_shmem_size - sizeof(*notif_data)) {
-		put_cpu();
-		return -EOVERFLOW;
+		rc = -EOVERFLOW;
+		goto out;
 	}
 
 	memcpy(notif_data, mpxy->shmem, sret.value + sizeof(*notif_data));
 	*events_data_len = sret.value;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_shmem_size(unsigned long *shmem_size)
@@ -402,8 +446,8 @@ struct mpxy_mbox {
 
 /* ====== MPXY RPMI processing ====== */
 
-static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
-				     struct rpmi_mbox_message *msg)
+static int mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
+				    struct rpmi_mbox_message *msg)
 {
 	msg->error = 0;
 	switch (msg->type) {
@@ -474,6 +518,8 @@ static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
 		msg->error = -EOPNOTSUPP;
 		break;
 	}
+
+	return msg->error;
 }
 
 static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
@@ -516,12 +562,21 @@ static int mpxy_mbox_send_data(struct mbox_chan *chan, void *data)
 {
 	struct mpxy_mbox_channel *mchan = chan->con_priv;
 
-	if (mchan->attrs.msg_proto_id == SBI_MPXY_MSGPROTO_RPMI_ID) {
-		mpxy_mbox_send_rpmi_data(mchan, data);
-		return 0;
-	}
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
+
+	mpxy_mbox_send_rpmi_data(mchan, data);
+	return 0;
+}
+
+static int mpxy_mbox_send_data_sync(struct mbox_chan *chan, void *data)
+{
+	struct mpxy_mbox_channel *mchan = chan->con_priv;
+
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
 
-	return -EOPNOTSUPP;
+	return mpxy_mbox_send_rpmi_data(mchan, data);
 }
 
 static bool mpxy_mbox_peek_data(struct mbox_chan *chan)
@@ -713,10 +768,11 @@ static void mpxy_mbox_shutdown(struct mbox_chan *chan)
 }
 
 static const struct mbox_chan_ops mpxy_mbox_ops = {
-	.send_data = mpxy_mbox_send_data,
-	.peek_data = mpxy_mbox_peek_data,
-	.startup = mpxy_mbox_startup,
-	.shutdown = mpxy_mbox_shutdown,
+	.send_data	= mpxy_mbox_send_data,
+	.send_data_sync	= mpxy_mbox_send_data_sync,
+	.peek_data	= mpxy_mbox_peek_data,
+	.startup	= mpxy_mbox_startup,
+	.shutdown	= mpxy_mbox_shutdown,
 };
 
 /* ====== MPXY platform driver ===== */
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index d5362b5821f9..16fa85f65d80 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -251,4 +251,17 @@ static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
 	return ret;
 }
 
+static inline int rpmi_mbox_send_message_sync(struct mbox_chan *chan,
+					      struct rpmi_mbox_message *msg)
+{
+	int ret;
+
+	/* Send message for the underlying mailbox channel synchronously */
+	ret = mbox_send_message_sync(chan, msg);
+	if (ret)
+		return ret;
+
+	return msg->error;
+}
+
 #endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */

-- 
2.34.1

