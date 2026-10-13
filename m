Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAA48F016
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870112; cv=none; b=aZE7O+IoSAgX3mKac0n+ouaBmz+/jHo4i1W4pc1hpExhEbeAW88wGv41UedBBwPA74Fid8EgM5NYqn3UKRKohMypZS6G3CCIM98EBqDjVv1no4iQCXoTAhZ0f5vgJkdTtaduBqtlgwiYIwaayBxVzbXoqfNSX/Win9j2NRk1kik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870112; c=relaxed/simple;
	bh=NaGwPKL5fWG1Gs/g9B+z4aHOl9q0GOpXbFWLfPNwPuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RCA52TYure/z+jETzjEEcCPzD99xTEqB8s8aG3lWSa+h41I09opp4nCaNzjkM2uHo/Ws9ZGotCQg9YgHSBck74udc/+5QI6dlEZ1cZM8Dk3T/KRw3LaLjYuJz9m0HdYSUq0MUtlofuWwG9lgiGUGxfCsszg2jgvYbVlHXOfrFdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kgs1HNga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COVhEmn6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kgs1HNga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COVhEmn6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D212J64071809
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhAsvG4R/uLP8ngKuMfxJ7kEdHB3Lqf98dmrr1z6uUI=; b=Kgs1HNgatN5NAoOd
	+fcEa8Wo/UkPFSI64uG/I0ZGiYU6b735Q4Q4jqDYYNnXV8MVdkZkDpNl5jjvOEDx
	PzZQfE8mGiSTO/0CewjQCc+HRB8SgLOG9uxqr6y/LLUBCXILUMw0D6tEF/utug34
	x5yvaAwQl5NNx50OjpJ48o484CiCKI5/MLPciPDjrWJCRViYSiQeFu49onlNU9Yl
	ES2GwjLDMVrJmP+2k6GhXPlJtMxv7ZkdhoDs91l9Od+lNxg+5jYuAjrxb4ZrsjK0
	e96Vytjb+12fFHtCS1WFw76WTfu5TWbPO5puSBI7Xpyw6qPSjIBYSCQg8y2d8WfL
	UNWtYA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjtvat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac16335199so1029823a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870109; x=1792474909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhAsvG4R/uLP8ngKuMfxJ7kEdHB3Lqf98dmrr1z6uUI=;
        b=COVhEmn6kwTPFvwdYdbHAaoKNX2k4iCLoiswNXLV8p3VG5Y0c7qnU+caDZLhxJoOWS
         UYZcihDX9Cb67AnXcOS6YFbl92qWY5vdttkpLOSgYVRnkddWf3rZ1QIN6Dom9zxzCq4X
         3EDxXjgI1X5unpHsPS6B7E/k5e/a/H/EEPDmChqXzZKR7mGXqxpZ4eYVKxLkqvQkWATy
         STVRVEvXG0WLsxZBjgvNBNfmKUuQURPB6UAgs+deP2GEjjMJZ02YNgrBaI9CxCWzYnJn
         LKTzPV1Q3EAw9bdVar6NuHGC+GrQN5rz3PrqdGRlq6PDWel7EwvyEHPNsGA/aybkTfcz
         IPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870109; x=1792474909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhAsvG4R/uLP8ngKuMfxJ7kEdHB3Lqf98dmrr1z6uUI=;
        b=i598qBcqj6ROsN9KcRr5KLIlCfEaD2tvvqzD49bGsg4ThKrnJ807hClaBfvL81JQJQ
         gMIi/9b95Sy4qTvKpdC4H5vDq7xEWP9GCOA39h9zbNSmukWc6ZizuiKb7/63JFTJViFE
         AdmcPKQFd1nhogmvoHAZo1cmZY+wrVJyG/62DDy1yyhc7eB+km8+uDgnw0Ip63KXjgvh
         eIrmmVFUWdKrSfrzfBJJTWt4Ocvw0+dd4s+R0lRqJwTp5fc7WGTm01Y52U0y8ujtCdsq
         hI4SjzOblzmWA9e492mNCX+C6tDTaDt8Z2sX4p1cWbF6ET5HfXJcLI61JHMIjxkoRH4S
         7tIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt8FKgud8/sRXkneLNTAYy6iCYwDEsUxnXyiF9HmG/4Agj3Yd7ZpBtLZ128fIzLR96EnpMn3EJLqL0J8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwWhS3kLAf728fuvvIHJD1takIxVgtUdon671h/OR7/QB8wFFw
	Fi7LV82nPrrY2oSDcLsikEyq5CzRjtCjgKJyYze0nirn6EAeuaGjwChRYJAyz75khG8uFd51UMg
	aUNP0KGDwmX7spsyA+G0BXGvt/8goJwzcqWoHaqLL25qOjY15k1olzsv0AciKP/JNKQ==
X-Gm-Gg: AYBFou0l9b/342c4UUSj4h6X8hFkTmpiuGNVXeYKpYWnvIivObedI4LFFCrG/ddMuOy
	dCf//e8Kcy9pzw0+dqsrboo0l/hJyYuf9sgzsBF2bXLe3OCgAATcxPX7okbz3hZ68byopdO8mA5
	sTCC6g1PgG40VF/oaOnRaatAvEwdn7OPQceplyH+J1YakFXcMf/XnXnw1Va4QgYU0a1mDMljDAl
	u+S8Xp1bHb+rmSpzvnxNN7UddqJqQZTpguTGqhDjbaBFCzmaw72Zv59Mw2Qjt+3zMaPODfDXINs
	MNHA5VWBZNOlLH/OXlognUXqRZcB305SN0C75VYeDAuJuJ0Koc8GKUWvimWAW2QBAAthv+Q843f
	uuXFb0yw8chog+bDVG2rnCyhEs/og5CIR0vHNmWYDpxrK5J+WUrAeGiNONw==
X-Received: by 2002:a17:90b:5346:b0:3ab:1a24:56e3 with SMTP id 98e67ed59e1d1-3ab3ac9dea0mr8535587a91.25.1791870108384;
        Mon, 12 Oct 2026 22:41:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:3ab:1a24:56e3 with SMTP id 98e67ed59e1d1-3ab3ac9dea0mr8535570a91.25.1791870107775;
        Mon, 12 Oct 2026 22:41:47 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:47 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:28 -0700
Subject: [PATCH RFC v3 1/9] tee: optee: share the global shared-memory ID
 mapping
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-1-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: KRRBECJ1cfQsgrqlQToJs8mOhzAnqHfj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX/v4flhxas8zF
 JbdX2CxGaJcJ3G+XwdikAfAh2Hg3Vz6wq+AFMmCbI0xJYZEPFoicyGVQpDx/zZOX8n8V+54sDOe
 n7UWz1PC7aHF+2JHAOYkUkvJEJFdOOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX2jcxE99uino1
 nJJZu0XFVNGgIW+3BqvLjtgAlX6rOEv08VtcEA7wlbSQ+kMIetkULM0MFHkuvZeNfgEka13wZrs
 A/iBpO2rCAQASMqPdW7SezongAlTCsooYikmGipzidRcknALuXSw+F6I2/7h997WHd5LNX7eZqu
 Dk1FlFOoj5WFySdaHABRoY4NuDLdmGCg24pOxmv8dWGbWv8xG5+j9f7NiKUQaw6h5qMJixAjFVr
 7hk/odAsprqSwGvKrgiMsWzN44JCyIN+zNWzuwU65cRSdN/I4Cqk6rV4GtXeGPmeYC8B2t5AqcU
 EbZPSMZ2+z6SpPUCd1s1gkXa1r1ksWZIaDvuDQ2q61Xc3sTf1edp7f0aiHI+0ThXLsCGxbqLddZ
 wiG69R/At8NfHtAypS5gt+vpGVzG6gSR15siZsvQTi+926+sCRlCOak+4z1rw9urxMQM1gAmQuY
 GLmMIysOr+u2SFlvnmQ==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acdc49d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Hmcm6iJ0OgSZlEai1VoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: KRRBECJ1cfQsgrqlQToJs8mOhzAnqHfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022

The FF-A backend maintains a hash table translating secure-world memory
handles to TEE shared-memory objects. This bookkeeping does not depend
on FF-A and is also needed by the RPMI backend.

Move the mapping and its locking into common helpers and convert the
FF-A backend to use them.

This prepares the OP-TEE driver for RPMI transport support on RISC-V.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/Makefile         |   1 +
 drivers/tee/optee/ffa_abi.c        | 133 +++++++----------------------------
 drivers/tee/optee/optee_private.h  |  30 ++++++--
 drivers/tee/optee/shm_handle_map.c | 138 +++++++++++++++++++++++++++++++++++++
 4 files changed, 188 insertions(+), 114 deletions(-)

diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
index 183cdde1ac04..ec2efc27ef05 100644
--- a/drivers/tee/optee/Makefile
+++ b/drivers/tee/optee/Makefile
@@ -7,6 +7,7 @@ optee-objs += rpc.o
 optee-objs += protmem.o
 optee-objs += supp.o
 optee-objs += device.o
+optee-objs += shm_handle_map.o
 optee-$(CONFIG_HAVE_ARM_SMCCC) += smc_abi.o
 optee-$(CONFIG_ARM_FFA_TRANSPORT) += ffa_abi.o
 
diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 702da7d98fbc..5a926353c653 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -22,100 +22,15 @@
  * This file implement the FF-A ABI used when communicating with secure world
  * OP-TEE OS via FF-A.
  * This file is divided into the following sections:
- * 1. Maintain a hash table for lookup of a global FF-A memory handle
- * 2. Convert between struct tee_param and struct optee_msg_param
- * 3. Low level support functions to register shared memory in secure world
- * 4. Dynamic shared memory pool based on alloc_pages()
- * 5. Do a normal scheduled call into secure world
- * 6. Driver initialization.
+ * 1. Convert between struct tee_param and struct optee_msg_param
+ * 2. Low level support functions to register shared memory in secure world
+ * 3. Dynamic shared memory pool based on alloc_pages()
+ * 4. Do a normal scheduled call into secure world
+ * 5. Driver initialization.
  */
 
 /*
- * 1. Maintain a hash table for lookup of a global FF-A memory handle
- *
- * FF-A assigns a global memory handle for each piece shared memory.
- * This handle is then used when communicating with secure world.
- *
- * Main functions are optee_shm_add_ffa_handle() and optee_shm_rem_ffa_handle()
- */
-struct shm_rhash {
-	struct tee_shm *shm;
-	u64 global_id;
-	struct rhash_head linkage;
-};
-
-static void rh_free_fn(void *ptr, void *arg)
-{
-	kfree(ptr);
-}
-
-static const struct rhashtable_params shm_rhash_params = {
-	.head_offset = offsetof(struct shm_rhash, linkage),
-	.key_len     = sizeof(u64),
-	.key_offset  = offsetof(struct shm_rhash, global_id),
-	.automatic_shrinking = true,
-};
-
-static struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee,
-						 u64 global_id)
-{
-	struct tee_shm *shm = NULL;
-	struct shm_rhash *r;
-
-	mutex_lock(&optee->ffa.mutex);
-	r = rhashtable_lookup_fast(&optee->ffa.global_ids, &global_id,
-				   shm_rhash_params);
-	if (r)
-		shm = r->shm;
-	mutex_unlock(&optee->ffa.mutex);
-
-	return shm;
-}
-
-static int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm *shm,
-				    u64 global_id)
-{
-	struct shm_rhash *r;
-	int rc;
-
-	r = kmalloc_obj(*r);
-	if (!r)
-		return -ENOMEM;
-	r->shm = shm;
-	r->global_id = global_id;
-
-	mutex_lock(&optee->ffa.mutex);
-	rc = rhashtable_lookup_insert_fast(&optee->ffa.global_ids, &r->linkage,
-					   shm_rhash_params);
-	mutex_unlock(&optee->ffa.mutex);
-
-	if (rc)
-		kfree(r);
-
-	return rc;
-}
-
-static int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
-{
-	struct shm_rhash *r;
-	int rc = -ENOENT;
-
-	mutex_lock(&optee->ffa.mutex);
-	r = rhashtable_lookup_fast(&optee->ffa.global_ids, &global_id,
-				   shm_rhash_params);
-	if (r)
-		rc = rhashtable_remove_fast(&optee->ffa.global_ids,
-					    &r->linkage, shm_rhash_params);
-	mutex_unlock(&optee->ffa.mutex);
-
-	if (!rc)
-		kfree(r);
-
-	return rc;
-}
-
-/*
- * 2. Convert between struct tee_param and struct optee_msg_param
+ * 1. Convert between struct tee_param and struct optee_msg_param
  *
  * optee_ffa_from_msg_param() and optee_ffa_to_msg_param() are the main
  * functions.
@@ -133,7 +48,8 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
 	p->u.memref.size = mp->u.fmem.size;
 
 	if (mp->u.fmem.global_id != OPTEE_MSG_FMEM_INVALID_GLOBAL_ID)
-		shm = optee_shm_from_ffa_handle(optee, mp->u.fmem.global_id);
+		shm = optee_shm_handle_map_lookup(&optee->ffa.shm_map,
+						  mp->u.fmem.global_id);
 	p->u.memref.shm = shm;
 
 	if (shm) {
@@ -262,7 +178,7 @@ static int optee_ffa_to_msg_param(struct optee *optee,
 }
 
 /*
- * 3. Low level support functions to register shared memory in secure world
+ * 2. Low level support functions to register shared memory in secure world
  *
  * Functions to register and unregister shared memory both for normal
  * clients and for tee-supplicant.
@@ -313,7 +229,7 @@ static int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
 	if (rc)
 		return rc;
 
-	rc = optee_shm_add_ffa_handle(optee, shm, args.g_handle);
+	rc = optee_shm_handle_map_add(&optee->ffa.shm_map, shm, args.g_handle);
 	if (rc) {
 		mem_ops->memory_reclaim(args.g_handle, 0);
 		return rc;
@@ -339,7 +255,7 @@ static int optee_ffa_shm_unregister(struct tee_context *ctx,
 	};
 	int rc;
 
-	optee_shm_rem_ffa_handle(optee, global_handle);
+	optee_shm_handle_map_remove(&optee->ffa.shm_map, global_handle);
 	shm->sec_world_id = 0;
 
 	rc = msg_ops->sync_send_receive(ffa_dev, &data);
@@ -367,7 +283,7 @@ static int optee_ffa_shm_unregister_supp(struct tee_context *ctx,
 	 * this ID.
 	 */
 
-	optee_shm_rem_ffa_handle(optee, global_handle);
+	optee_shm_handle_map_remove(&optee->ffa.shm_map, global_handle);
 	mem_ops = optee->ffa.ffa_dev->ops->mem_ops;
 	rc = mem_ops->memory_reclaim(global_handle, 0);
 	if (rc)
@@ -379,7 +295,7 @@ static int optee_ffa_shm_unregister_supp(struct tee_context *ctx,
 }
 
 /*
- * 4. Dynamic shared memory pool based on alloc_pages()
+ * 3. Dynamic shared memory pool based on alloc_pages()
  *
  * Implements an OP-TEE specific shared memory pool.
  * The main function is optee_ffa_shm_pool_alloc_pages().
@@ -428,7 +344,7 @@ static struct tee_shm_pool *optee_ffa_shm_pool_alloc_pages(void)
 }
 
 /*
- * 5. Do a normal scheduled call into secure world
+ * 4. Do a normal scheduled call into secure world
  *
  * The function optee_ffa_do_call_with_arg() performs a normal scheduled
  * call into secure world. During this call may normal world request help
@@ -488,7 +404,8 @@ static void handle_ffa_rpc_func_cmd_shm_free(struct tee_context *ctx,
 	    arg->params[0].attr != OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
 		goto err_bad_param;
 
-	shm = optee_shm_from_ffa_handle(optee, arg->params[0].u.value.b);
+	shm = optee_shm_handle_map_lookup(&optee->ffa.shm_map,
+					  arg->params[0].u.value.b);
 	if (!shm)
 		goto err_bad_param;
 	switch (arg->params[0].u.value.a) {
@@ -736,7 +653,8 @@ static int optee_ffa_lend_protmem(struct optee *optee, struct tee_shm *protmem,
 	if (rc)
 		goto err_reclaim;
 
-	rc = optee_shm_add_ffa_handle(optee, protmem, args.g_handle);
+	rc = optee_shm_handle_map_add(&optee->ffa.shm_map, protmem,
+				      args.g_handle);
 	if (rc)
 		goto err_unreg;
 
@@ -770,7 +688,7 @@ static int optee_ffa_reclaim_protmem(struct optee *optee,
 	};
 	int rc;
 
-	optee_shm_rem_ffa_handle(optee, global_handle);
+	optee_shm_handle_map_remove(&optee->ffa.shm_map, global_handle);
 	protmem->sec_world_id = 0;
 
 	rc = msg_ops->sync_send_receive(ffa_dev, &data);
@@ -785,9 +703,9 @@ static int optee_ffa_reclaim_protmem(struct optee *optee,
 }
 
 /*
- * 6. Driver initialization
+ * 5. Driver initialization
  *
- * During driver inititialization is the OP-TEE Secure Partition is probed
+ * During driver initialization is the OP-TEE Secure Partition is probed
  * to find out which features it supports so the driver can be initialized
  * with a matching configuration.
  */
@@ -991,8 +909,7 @@ static void optee_ffa_remove(struct ffa_device *ffa_dev)
 	}
 	optee_remove_common(optee);
 
-	mutex_destroy(&optee->ffa.mutex);
-	rhashtable_free_and_destroy(&optee->ffa.global_ids, rh_free_fn, NULL);
+	optee_shm_handle_map_uninit(&optee->ffa.shm_map);
 
 	kfree(optee);
 }
@@ -1137,10 +1054,9 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 
 	optee_set_dev_group(optee);
 
-	rc = rhashtable_init(&optee->ffa.global_ids, &shm_rhash_params);
+	rc = optee_shm_handle_map_init(&optee->ffa.shm_map);
 	if (rc)
 		goto err_unreg_supp_teedev;
-	mutex_init(&optee->ffa.mutex);
 	optee_cq_init(&optee->call_queue, 0);
 	optee_supp_init(&optee->supp);
 	optee_shm_arg_cache_init(optee, arg_cache_flags);
@@ -1193,12 +1109,11 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 err_close_ctx:
 	teedev_close_context(ctx);
 err_rhashtable_free:
-	rhashtable_free_and_destroy(&optee->ffa.global_ids, rh_free_fn, NULL);
+	optee_shm_handle_map_uninit(&optee->ffa.shm_map);
 	rpmb_dev_put(optee->rpmb_dev);
 	mutex_destroy(&optee->rpmb_dev_mutex);
 	optee_supp_uninit(&optee->supp);
 	mutex_destroy(&optee->call_queue.mutex);
-	mutex_destroy(&optee->ffa.mutex);
 err_unreg_supp_teedev:
 	tee_device_unregister(optee->supp_teedev);
 err_unreg_teedev:
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 02d6f79df407..92428945ee33 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -157,6 +157,29 @@ struct optee_smc {
 };
 #endif
 
+/**
+ * struct optee_shm_handle_map - Shared-memory lookup by secure-world identity
+ * @mutex: Serializes lookup, insertion and removal
+ * @rht: Maps opaque 64-bit identities to shared-memory objects
+ *
+ * Owners keep SHM objects alive while their registrations are in use.
+ * Never hold @mutex across transport calls, RPC or thread-availability waits.
+ */
+struct optee_shm_handle_map {
+	/* Protects lookup, insertion and removal. */
+	struct mutex mutex;
+	struct rhashtable rht;
+};
+
+int optee_shm_handle_map_init(struct optee_shm_handle_map *map);
+void optee_shm_handle_map_uninit(struct optee_shm_handle_map *map);
+int optee_shm_handle_map_add(struct optee_shm_handle_map *map,
+			     struct tee_shm *shm, u64 global_id);
+int optee_shm_handle_map_remove(struct optee_shm_handle_map *map,
+				u64 global_id);
+struct tee_shm *
+optee_shm_handle_map_lookup(struct optee_shm_handle_map *map, u64 global_id);
+
 #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
 /**
  * struct optee_ffa -  FFA communication struct
@@ -164,17 +187,14 @@ struct optee_smc {
  *			OP-TEE in secure world
  * @bottom_half_value:	notification ID used for bottom half signalling or
  *			U32_MAX if unused
- * @mutex:		serializes access to @global_ids
- * @global_ids:		FF-A shared memory global handle translation
+ * @shm_map:		FF-A shared memory global handle translation
  * @notif_wq:		workqueue for FF-A asynchronous notification
  * @notif_work:		work for FF-A asynchronous notification
  */
 struct optee_ffa {
 	struct ffa_device *ffa_dev;
 	u32 bottom_half_value;
-	/* Serializes access to @global_ids */
-	struct mutex mutex;
-	struct rhashtable global_ids;
+	struct optee_shm_handle_map shm_map;
 	struct workqueue_struct *notif_wq;
 	struct work_struct notif_work;
 };
diff --git a/drivers/tee/optee/shm_handle_map.c b/drivers/tee/optee/shm_handle_map.c
new file mode 100644
index 000000000000..54324c9c3644
--- /dev/null
+++ b/drivers/tee/optee/shm_handle_map.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, 2023 Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include "optee_private.h"
+
+struct optee_shm_handle_map_entry {
+	struct tee_shm *shm;
+	u64 global_id;
+	struct rhash_head node;
+};
+
+static const struct rhashtable_params shm_handle_map_params = {
+	.head_offset = offsetof(struct optee_shm_handle_map_entry, node),
+	.key_offset = offsetof(struct optee_shm_handle_map_entry, global_id),
+	.key_len = sizeof(u64),
+	.automatic_shrinking = true,
+};
+
+static void shm_handle_map_free(void *ptr, void *arg)
+{
+	kfree(ptr);
+}
+
+/**
+ * optee_shm_handle_map_init() - Initialize a shared-memory identity map
+ * @map: Map to initialize
+ *
+ * Return: 0 on success or a negative error.
+ */
+int optee_shm_handle_map_init(struct optee_shm_handle_map *map)
+{
+	int rc;
+
+	mutex_init(&map->mutex);
+	rc = rhashtable_init(&map->rht, &shm_handle_map_params);
+	if (rc)
+		mutex_destroy(&map->mutex);
+
+	return rc;
+}
+
+/**
+ * optee_shm_handle_map_uninit() - Free a shared-memory identity map
+ * @map: Initialized map with no concurrent users
+ *
+ * Free tracking entries, not SHM objects or their secure-world registrations.
+ */
+void optee_shm_handle_map_uninit(struct optee_shm_handle_map *map)
+{
+	rhashtable_free_and_destroy(&map->rht, shm_handle_map_free, NULL);
+	mutex_destroy(&map->mutex);
+}
+
+/**
+ * optee_shm_handle_map_add() - Track a registered shared-memory object
+ * @map: Initialized map
+ * @shm: Shared-memory object kept alive by its owner
+ * @global_id: Opaque secure-world identity
+ *
+ * Return: 0 on success or a negative error.
+ */
+int optee_shm_handle_map_add(struct optee_shm_handle_map *map,
+			     struct tee_shm *shm, u64 global_id)
+{
+	struct optee_shm_handle_map_entry *entry;
+	int rc;
+
+	entry = kmalloc_obj(*entry);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->shm = shm;
+	entry->global_id = global_id;
+
+	mutex_lock(&map->mutex);
+	rc = rhashtable_lookup_insert_fast(&map->rht, &entry->node,
+					   shm_handle_map_params);
+	mutex_unlock(&map->mutex);
+	if (rc)
+		kfree(entry);
+
+	return rc;
+}
+
+/**
+ * optee_shm_handle_map_remove() - Remove a shared-memory tracking entry
+ * @map: Initialized map
+ * @global_id: Opaque secure-world identity
+ *
+ * Return: 0 on success, -ENOENT if absent, or a negative removal error.
+ */
+int optee_shm_handle_map_remove(struct optee_shm_handle_map *map, u64 global_id)
+{
+	struct optee_shm_handle_map_entry *entry;
+	int rc = -ENOENT;
+
+	mutex_lock(&map->mutex);
+	entry = rhashtable_lookup_fast(&map->rht, &global_id,
+				       shm_handle_map_params);
+	if (entry)
+		rc = rhashtable_remove_fast(&map->rht, &entry->node,
+					    shm_handle_map_params);
+	mutex_unlock(&map->mutex);
+	if (!rc)
+		kfree(entry);
+
+	return rc;
+}
+
+/**
+ * optee_shm_handle_map_lookup() - Look up a registered shared-memory object
+ * @map: Initialized map
+ * @global_id: Opaque secure-world identity
+ *
+ * The caller must keep the SHM object alive; no reference is acquired here.
+ *
+ * Return: The shared-memory object or NULL if the identity is absent.
+ */
+struct tee_shm *
+optee_shm_handle_map_lookup(struct optee_shm_handle_map *map, u64 global_id)
+{
+	struct optee_shm_handle_map_entry *entry;
+	struct tee_shm *shm = NULL;
+
+	mutex_lock(&map->mutex);
+	entry = rhashtable_lookup_fast(&map->rht, &global_id,
+				       shm_handle_map_params);
+	if (entry)
+		shm = entry->shm;
+	mutex_unlock(&map->mutex);
+
+	return shm;
+}

-- 
2.34.1

