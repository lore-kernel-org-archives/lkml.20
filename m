Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104776;
	b=iJeJal/gHrms0ZJYKQM8eCt2PsHbanS8IJUjxua/4uFZnW0/YBx0Svwh6vGgTVNRNsak
	 TlC38H+G19ZAGZgyYqZVMbet3totNMwiQ6VpSQdU9D2xK/D3GxFhrVg9Lzd9GUG3nuT7H
	 /nAddFYKhpt2O7fGoxoi2mAq3RGXUgrZQEFKPnaDYawgm3cmjoezMxW6NekEIirtcIPGk
	 amD7kMmMrQCRogXiVoV5JPYENpMHvefqhQsHlmJG1r3NmZ3ePZPmGvGL1F54VAISQia+n
	 w6L6YafSZdSYjAV0Fjfdnnz9bGNA7QHueJp3pjfSdSeh2PJRMcwpwzxaRHR4JpfdwwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104776;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=9+Bv5bXlyOJI4wUaOUPLzIAPyJRpqI4o3zxPdiK7cZA=;
	b=Aq7wMclPGXvMAde4se+tOHILxT1gX9ToWEaKc0RbUldia4qbIJtKyIYua55CnZEVpdbq
	 U9ubBogHwxle1HsjCnqv7do0tk9oKI71qm2NQ5YJ0uEUbLaqVABW+DoklogfFPWOYiy+M
	 ITl+Lit1Nd1rrsoRWtmp6EC3e8Raqea++kTeGcu8IEBmc3JBgrTm1MSOSxC2+0D/SdjOs
	 s3giU5dlMX8Kh6CIysUoh5iTcXCnarWzLp4Dr+uNHEkEjdjzivU4NxtypBDVqg2V+1nFQ
	 1xS7G6hosQ0J/DMk4MnE79togiOmlwBpS7KEUXL3m7ss9DjZIoK9gKrzvkr11YSDNZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0u0Sz+a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964BB60A2626;
	Tue, 27 Oct 2026 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0u0Sz+a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC411F031E4;
	Tue, 27 Oct 2026 12:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793104776;
	bh=9+Bv5bXlyOJI4wUaOUPLzIAPyJRpqI4o3zxPdiK7cZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B0u0Sz+aXScU3QfamsKCCXgvy9FF7W/tuSCLOIgRfhKsFRV19vMTBDa0IPJRifDGF
	 +wM0l6VSqIvz4jW3Skllo9gmpEIPIOenRaowKVD1wBi058cn8qzVLySSFyeqSIuGOV
	 BJEgLFH/bZPlFRpHu6f+jdX7TjgWxCnkZIRusmJcu3rTP8nCLT/JGOUf4qmN23SpyD
	 bgF5blp8wxkcO5t/RmbF1GLhl81jTQqJ0jy/eBV373Tihwz/lwLNGO2e/dunfO++8S
	 7sdvuQNAEeDNzSzJnWAq9CJsHCa+ADZsMOuVjT5XUU7WGtLlt7D6fuJZsFNoC65Cr0
	 H4dRccXl3O67w==
From: Sumit Garg <sumit.garg@kernel.org>
Date: Tue, 27 Oct 2026 18:09:05 +0530
Subject: [PATCH v2 3/3] firmware: qcom: scm: Drop export of
 qcom_scm_mem_protect_video_var()
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
Message-Id: <20261027-pas-video-v2-3-5b52bca5add6@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

All the users now go through the generic PAS API, so fold the SCM call
into the SCM PAS backend op and drop the exported API along with its
declaration.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 44 +++++++++++++---------------------
 include/linux/firmware/qcom/qcom_scm.h |  2 --
 2 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 5445c1aa14cc..5746a41800b1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -985,9 +985,23 @@ static int qcom_scm_pas_mem_protect_video_var(struct device *dev, u32 cp_start,
 					      u32 cp_size, u32 cp_nonpixel_start,
 					      u32 cp_nonpixel_size)
 {
-	return qcom_scm_mem_protect_video_var(cp_start, cp_size,
-					      cp_nonpixel_start,
-					      cp_nonpixel_size);
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_VIDEO_VAR,
+		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_VAL, QCOM_SCM_VAL,
+					 QCOM_SCM_VAL, QCOM_SCM_VAL),
+		.args[0] = cp_start,
+		.args[1] = cp_size,
+		.args[2] = cp_nonpixel_start,
+		.args[3] = cp_nonpixel_size,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+
+	ret = qcom_scm_call(dev, &desc, &res);
+
+	return ret ? : res.result[0];
 }
 
 static struct qcom_pas_ops qcom_pas_ops_scm = {
@@ -1214,30 +1228,6 @@ int qcom_scm_iommu_set_cp_pool_size(u32 spare, u32 size)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_iommu_set_cp_pool_size);
 
-int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
-				   u32 cp_nonpixel_start,
-				   u32 cp_nonpixel_size)
-{
-	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_MP,
-		.cmd = QCOM_SCM_MP_VIDEO_VAR,
-		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_VAL, QCOM_SCM_VAL,
-					 QCOM_SCM_VAL, QCOM_SCM_VAL),
-		.args[0] = cp_start,
-		.args[1] = cp_size,
-		.args[2] = cp_nonpixel_start,
-		.args[3] = cp_nonpixel_size,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
-
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
-
-	return ret ? : res.result[0];
-}
-EXPORT_SYMBOL_GPL(qcom_scm_mem_protect_video_var);
-
 static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				 size_t mem_sz, phys_addr_t src, size_t src_sz,
 				 phys_addr_t dest, size_t dest_sz)
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a0a6bc0229c4..48e627079e97 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -75,8 +75,6 @@ bool qcom_scm_set_gpu_smmu_aperture_is_available(void);
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
 int qcom_scm_iommu_set_cp_pool_size(u32 spare, u32 size);
-int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
-				   u32 cp_nonpixel_start, u32 cp_nonpixel_size);
 int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, u64 *src,
 			const struct qcom_scm_vmperm *newvm,
 			unsigned int dest_cnt);

-- 
2.43.0

