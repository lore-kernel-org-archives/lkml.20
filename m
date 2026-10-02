Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617B947D44F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935962; cv=none; b=CtZgdb+17yW6y15QhUK+55DPvIgT0xuuvdriRr1ufzn3wQ9yuLe/jsKoAaoCB+K3IloFG4FNA5RWGXxXzvSjXeR5653u/mgl98PUx1yX8ikwTWMS51+EhkN7oMtZCbuoR5OxvB7sgCtFQIeW2REvyRzs/v0nLvsxwLPFXWokYB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935962; c=relaxed/simple;
	bh=+1tRa6NQhjbQz60INnGVt086+xAynvy/dda2ZO/SBm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dcYVqm/dxXh3HZCbykI8kXfsmNj83bDRb5jUSAe4+N5lSXr25ouNDJzLTFMuz+V1clB+3rzAnCKc/1EJQsCO09KAx+zSYRql6WnkuSkZ14gqqglDsDErdhB6vdwOEHm46MbCB9wrqD5MUsdAevOZb9DEFXRgKWYiNLDXQNiS0co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6ImauJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtuC2gLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6ImauJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtuC2gLb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929njjq1434226
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 10:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rTSHNgonIML
	sd9mJgub6AIUvnub6H5sPMi0feN74edU=; b=L6ImauJTv7kNPn0uLyVILVJuTu7
	tNjURx0stl82oGNtWT4BntDHeyGc/ee1dYoffVkgprUyLpGkIToU2vuuSH2ggBXa
	nIRD1Dyolvu1ohuKt4+UOnIruonISjJ0kidMlQ3j2ohokpyKMYMaP94cwUGoAlGS
	pNYpgv2f9zro4Rc/0gQqm1T5f/CrwVgXNwNUZENdyfMiCVCJrWPqgQn2LOSglRLp
	1pgr0xP/bX2ZRSlem0BKB7hhmeBZkAEMB+V2PWFbSyA7d4UUHNxtLm7Kg0XaOxHH
	Cx6SIfN1oMMe+MGfTlgJLIojrD4zBgBpjcoNukvzyAgrm0FJVms8RqxuOLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh1umc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:12:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca4a2b9c4so548672085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790935958; x=1791540758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTSHNgonIMLsd9mJgub6AIUvnub6H5sPMi0feN74edU=;
        b=LtuC2gLbEoAkex5teSABnlLVeuejVr4VVYy4o4yfakDYCXGz6WAiXgnEAs0l0Nmq49
         5OCpmhChWlzQcj+jw3FDQ0KzQ4wa8vWEgRxUqd7G9AcIEyo2YFwsC2+LqoCs9eRoFsP0
         CuRCI/p8jQcxwzcJ81PM+kGLNxukDt/8z5G0f2xkseAvWaTIEKl3lTIQOwbN3bsQc5nK
         B2n8VXQje20OzjpK9WIYkQG8ywFHXuhY3OzfvAN9c2Q5OTwS6yZ0f3owF2sdyGYOeR9b
         cychJGhWOahi8o1oNc43ZMtI+7X5oXEtYCp4c0srgs2mrfOGri2SjFqAWaaDp8Lf5yMf
         9BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935958; x=1791540758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTSHNgonIMLsd9mJgub6AIUvnub6H5sPMi0feN74edU=;
        b=S/F95mbv/V4XUycSl/3jIULyq+9TqWcQR8bdPKM7VpE6fGbd7SpldmoFstXMbf4TCL
         iqwBWymiuGyRD87HUByEzHmA0r9YspElTJYNgxfnv8ZossXPRHCd0yrj8gEvU6FuzS5F
         HK+Aar6zDtF9E7pofu/a0frwl2QF5Y+gjduVWriiPudCkufaDpMv3XJiHPzwp2NRJYbU
         gDIhW8X9LNsSGLqCPY70950oRmu8Xs6aY5KImT6P95xFnlI78QzPuWE7206Yl3HdpXko
         76D9vX7ih8zNY1zWNvYyGLNoAEIfo8XTkJOnNpredopmOXxXXiouwYvhEdPcop7n/745
         LfAg==
X-Gm-Message-State: AFuF++l8KtfRa3xkdzeB2QJXjSZSq2MYfy2F2AMpVARqY5iQ+Aq5bImt
	s4kZ3Hbm+EcqLb0phy3prEzhIPiN03iWBI6P2df+SbLS6+7sVB3+t248FCd/t5bthYubf3DdsvS
	ju+6pIsYgHluN5ZSG8UZ9YIiT0dIr0YBDjLxVhY5FLx22CEu7532gbEqRmxYdLE/NRyKikom7Os
	c=
X-Gm-Gg: AYBFou1kFMo5+iyRTl88Cg5zJQSdr8OGL5V3Zo9Uu0zK6oQVhHAT7VITwJYIzWHRpxq
	41ehKz2of0pmVsMogG3NielAK8CbTnuYiaz0P+SiPDUNG9UxyrxychSSx0vYBGihuYIqupe3Glq
	QhOUw8937Hk9RbEtng95HKt7sZzQFXrCwzHGmZJtYeeWBmRqQzlw0t6c00q0CIk9Fsm62HgM1n6
	WZbqe4wTxhzX0VC8giUN5DFNZpgb22nuD+TASduGYxtjX8f/NmKMSelBs61OJYa2PXAxL+vy/yO
	8nXWeg8QUSbKoc2rodzg5MkOWKG+eo723814Fv8Y98Tbm2eZerJlGYGf2NpA2rhFM5BGUfoP6Ui
	gy1UdLjac9K/y
X-Received: by 2002:a05:620a:3188:b0:93c:6e1d:96b4 with SMTP id af79cd13be357-93cf18bff2cmr350735485a.62.1790935958141;
        Fri, 02 Oct 2026 03:12:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:93c:6e1d:96b4 with SMTP id af79cd13be357-93cf18bff2cmr350729585a.62.1790935957551;
        Fri, 02 Oct 2026 03:12:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff2280csm39689195e9.4.2026.10.02.03.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:12:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>,
        stable@kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 2/2] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Fri,  2 Oct 2026 11:12:20 +0100
Message-ID: <20261002101220.1084101-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101220.1084101-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002101220.1084101-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX+RwEUgOqSqGX
 5CZjVo3UWGGYzAm9tHHAsdlLpKSYrVfPIj3RWEv/weV0GQqqOFBAmSov6D6Aa3200QGKA+p8U5K
 zXIeskAi3c/fDmPhl/1/xbF4LQSRFTw=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abf8396 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VefhmIsWxTc4_m-6q1UA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfXx69cmHm8fbA2
 Q86ZTOhhKBosETUmKfNuRu7W9s8Fm1qjfNQdy0ELgc5Qz/bpNbnyI2Bqc6NEdrOUO48z9rseu1i
 vj0p88MOzp1e7wXd1IeMH/akuPdnKnQcdwxT77kz3aw4G6FkfTE6dwYTmOL2fk2loK2WCG5ydoj
 lrLhjtC4wbQNSfy+M489PE3/lTsbq9/Qt3aH3/1oL0jNOJiJ/pBj5yF8xD405WFJ3dWoM6Z+5pB
 ehper7pxub67rozxP+tCxHJ9VZyBkWgVn7tdMhQxB2gxCGYcuDq0tsrqkXSEHN6gtxRoFPP/zn6
 XVqFzdpCwstwckXqqSivQ63tiqEqoCgo48nbFK6EgqaBMcqzEn3cInQrcBZdScR0RWYALTxYnX9
 G8HqineIeoX0huTkZBMISY4eJEYU8TH7qVyEjQ2JoJgBKx6FYnYxmLRNshuUFmmWDa0IPKTGk4A
 3zBlzr9m42H/IqMfK/A==
X-Proofpoint-GUID: wE279Xv2xFcL7gl5PATiEjyhPlfvyv9K
X-Proofpoint-ORIG-GUID: wE279Xv2xFcL7gl5PATiEjyhPlfvyv9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020040

From: Jianping Li <jianping.li@oss.qualcomm.com>

Allocating and freeing Audio PD memory from userspace is unsafe because
the kernel cannot reliably determine when the DSP has finished using the
memory. Userspace may free buffers while they are still in use by the DSP,
and remote free requests cannot be safely trusted.

Additionally, the current implementation allows userspace to repeatedly
grow the Audio PD heap, but does not support shrinking it. This can lead
to unbounded memory usage over time, effectively causing a memory leak.

Fix this by allocating the entire Audio PD reserved-memory region during
rpmsg probe and tying its lifetime to the rpmsg channel. This removes
userspace-controlled alloc/free and ensures that memory is reclaimed only
when the DSP process is torn down.

The reserved-memory region is now mandatory for the Audio PD domain.
Rather than failing rpmsg probe when it is missing, validate it in
fastrpc_init_create_static_process() and reject only the static-process
creation. This keeps the fastrpc device probing for all other domains
even on a misconfigured device tree.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260814101955.234238-1-jianping.li@oss.qualcomm.com/
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/misc/fastrpc.c | 188 ++++++++++++++++++++++-------------------
 1 file changed, 101 insertions(+), 87 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4a18081845d9..9310ef1cb4a6 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -70,8 +70,6 @@
 #define ADSP_MMAP_HEAP_ADDR  4
 /* MAP static DMA buffer on DSP User PD */
 #define ADSP_MMAP_DMA_BUFFER  6
-/* Add memory to static PD pool protection thru hypervisor */
-#define ADSP_MMAP_REMOTE_HEAP_ADDR  8
 /* Add memory to userPD pool, for user heap */
 #define ADSP_MMAP_ADD_PAGES 0x1000
 /* Add memory to userPD pool, for LLC heap */
@@ -314,10 +312,14 @@ struct fastrpc_channel_ctx {
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
 	bool valid_attributes;
+	/* Flag if audio PD init mem was allocated */
+	bool audio_init_mem;
+	/* Audio PD reserved remote heap region */
+	phys_addr_t remote_heap_addr;
+	u64 remote_heap_size;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
-	struct fastrpc_buf *remote_heap;
 	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
@@ -1454,15 +1456,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_phy_page pages[1];
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
 	char *name;
 	int err;
-	bool scm_done = false;
 	struct {
 		int client_id;
 		u32 namelen;
 		u32 pageslen;
 	} inbuf;
 	u32 sc;
+	unsigned long flags;
+	bool sent_heap = false;
+
+	if (!cctx->remote_heap_addr || !cctx->remote_heap_size) {
+		err = -ENOMEM;
+		dev_err(fl->sctx->dev,
+			"remote heap memory region is not added\n");
+		return err;
+	}
 
 	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
 	if (!args)
@@ -1486,31 +1497,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	inbuf.client_id = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
-	if (!fl->cctx->remote_heap) {
-		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
-						&fl->cctx->remote_heap);
-		if (err)
-			goto err_name;
-
-		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
-		if (fl->cctx->vmcount) {
-			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-							(u64)fl->cctx->remote_heap->size,
-							&src_perms,
-							fl->cctx->vmperms, fl->cctx->vmcount);
-			if (err) {
-				dev_err(fl->sctx->dev,
-					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
-					&fl->cctx->remote_heap->dma_addr,
-					fl->cctx->remote_heap->size, err);
-				goto err_map;
-			}
-			scm_done = true;
-			inbuf.pageslen = 1;
-		}
-	}
 
 	fl->pd = USER_PD;
 
@@ -1522,8 +1508,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	/*
+	 * Audio PD is a static PD and retains the remote heap
+	 * information across daemon restarts. Therefore only
+	 * the first attach should provide heap information to
+	 * DSP. Subsequent attaches reuse the previously
+	 * initialized memory pool.
+	 */
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!cctx->audio_init_mem) {
+		pages[0].addr = cctx->remote_heap_addr;
+		pages[0].size = cctx->remote_heap_size;
+		cctx->audio_init_mem = true;
+		inbuf.pageslen = 1;
+		sent_heap = true;
+	} else {
+		pages[0].addr = 0;
+		pages[0].size = 0;
+	}
+	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1541,27 +1544,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 	return 0;
 err_invoke:
-	if (fl->cctx->vmcount && scm_done) {
-		u64 src_perms = 0;
-		struct qcom_scm_vmperm dst_perms;
-		u32 i;
-
-		for (i = 0; i < fl->cctx->vmcount; i++)
-			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
-
-		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
-		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-						(u64)fl->cctx->remote_heap->size,
-						&src_perms, &dst_perms, 1);
-		if (err)
-			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
-				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
+	if (sent_heap) {
+		spin_lock_irqsave(&cctx->lock, flags);
+		cctx->audio_init_mem = false;
+		spin_unlock_irqrestore(&cctx->lock, flags);
 	}
-err_map:
-	fastrpc_buf_free(fl->cctx->remote_heap);
-	fl->cctx->remote_heap = NULL;
-err_name:
 	kfree(name);
 err:
 	kfree(args);
@@ -2090,7 +2077,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
+	if (req.flags != ADSP_MMAP_ADD_PAGES) {
 		dev_err(dev, "flag not supported 0x%x\n", req.flags);
 
 		return -EINVAL;
@@ -2101,10 +2088,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
-		err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
-	else
-		err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
+	err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
 
 	if (err) {
 		dev_err(dev, "failed to allocate buffer\n");
@@ -2143,20 +2127,6 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	/* let the client know the address to use */
 	req.vaddrout = rsp_msg.vaddr;
 
-	/* Add memory to static PD pool, protection thru hypervisor */
-	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
-		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-		err = qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
-			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
-		if (err) {
-			dev_err(fl->sctx->dev,
-				"Failed to assign memory dma_addr %pad size 0x%llx err %d",
-				&buf->dma_addr, buf->size, err);
-			goto err_assign;
-		}
-	}
-
 	spin_lock(&fl->lock);
 	list_add_tail(&buf->node, &fl->mmaps);
 	spin_unlock(&fl->lock);
@@ -2537,6 +2507,45 @@ static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unuse
 	{},
 };
 
+static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
+				     struct device *rdev, u32 domain_id)
+{
+	struct resource res;
+	u64 src_perms;
+	int err;
+
+	/* Only SDSP and ADSP domains use a reserved remote heap region */
+	if (domain_id != SDSP_DOMAIN_ID && domain_id != ADSP_DOMAIN_ID)
+		return 0;
+
+	err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
+	if (err) {
+		/*
+		 * The reserved-memory region is optional at probe time. For
+		 * the Audio PD (ADSP) domain its absence is validated later in
+		 * fastrpc_init_create_static_process(), so keep probing here.
+		 */
+		return 0;
+	}
+
+	/*
+	 * Audio PD (ADSP) is a static PD: cache the region so its lifetime
+	 * is tied to the rpmsg channel instead of being controlled by
+	 * userspace.
+	 */
+	if (domain_id == ADSP_DOMAIN_ID) {
+		cctx->remote_heap_addr = res.start;
+		cctx->remote_heap_size = resource_size(&res);
+	}
+
+	if (!cctx->vmcount)
+		return 0;
+
+	src_perms = BIT(QCOM_SCM_VMID_HLOS);
+	return qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+				  cctx->vmperms, cctx->vmcount);
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2584,21 +2593,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
-		struct resource res;
-		u64 src_perms;
-
-		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
-		if (!err) {
-			src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
-				    data->vmperms, data->vmcount);
-			if (err)
-				goto err_free_data;
-		}
-
-	}
+	err = fastrpc_init_reserved_mem(data, rdev, domain_id);
+	if (err)
+		goto err_free_data;
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
@@ -2698,8 +2695,25 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap_size && cctx->vmcount) {
+		u64 src_perms = 0;
+		int err, i;
+		struct qcom_scm_vmperm dst_perms;
+
+		for (i = 0; i < cctx->vmcount; i++)
+			src_perms |= BIT(cctx->vmperms[i].vmid);
+
+		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+		dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+		err = qcom_scm_assign_mem(cctx->remote_heap_addr,
+					  cctx->remote_heap_size, &src_perms,
+					  &dst_perms, 1);
+		if (err)
+			dev_err(&rpdev->dev,
+				"Failed to assign memory back to HLOS: addr %pa size %#llx err %d\n",
+				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
+	}
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.53.0

