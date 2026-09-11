Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710B4718D9;
	Fri, 11 Sep 2026 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130355; cv=none; b=acdUdUjWTiSOeSn/jySXD90t2Ps2ClCXkQpumrq8yboe7licbC5/Shvd+N346xWpcyuJefMFNr3QS8ORk9yrG3wX4BebK0UJHL8GV6GrEcjZ+LbcEYvUY+o+MvaQWReuiWojUclA5OTUuIA1aT/88Uw2bC8XrYF6/l8RPuIh6+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130355; c=relaxed/simple;
	bh=9a+o1zghkvN/+WOJNhLmsWPdTVgtZNIIF/cDy36ClLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EJARJQ88RN9tnQxPPYZfWUa0fa8Dycb8IvMrmBvvcK5W7saASWEPGrO4dESeUR1tD38TjgtrBPnQD5y9QTeqercHFGVsU1JSjJrSBRlutuuK19dvnspYSDjfFQYN/pCI1EGu/Al3Bkl7QGyAPEB/VWezfq4NYhTt24Ff3NFbJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G70x9L9+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G70x9L9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADA61F00899;
	Fri, 11 Sep 2026 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789130350;
	bh=QZDg0O/iXiCVjc0EVw1KEswumnkkgY6Y/5MT9GeGmUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G70x9L9+J9FDGx3n6Q3hSz9fK4E7J6xnwVPq17Oyzl7lc/lM0BohD22209+bAO3jF
	 BGzmvAKGOxFIS4ip1QfMlITqwrce4XlTMF2DpsX2mZvtR/3r+6SLkwxBek6Ty0Fj8C
	 ofYoI50mHqQikrRtMJ7XMjmXoLLjfk1r1ZnjfJ2cRDM62sGWKntqhh5tFXOk7Y7Upp
	 WYQt0hpN+oPROnoHDH2gTX8LntIGCg5TSVQ5R1y5V3scf4HNDqEgdQt2kno0xDHzwD
	 6cMtoGx9KXCIJfAOJIdbmft133WOqZk/0x8SrUrmHBGM17KJghrrjrEYw0nZacxQgH
	 3h6xwsoqlyIKA==
From: Sumit Garg <sumit.garg@kernel.org>
Date: Fri, 11 Sep 2026 18:08:55 +0530
Subject: [PATCH 1/3] firmware: qcom: pas: Expose the active PAS backend
 name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-video-optee-pas-v1-v1-1-7bbddaaac5ba@kernel.org>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
In-Reply-To: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
X-Mailer: b4 0.14.3

From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>

Consumers may need to know which PAS backend is active, e.g. to decide
whether SCM-specific calls apply.

Add qcom_pas_get_backend() returning the active backend name (or NULL),
and define QCOM_PAS_BACKEND_SCM/QCOM_PAS_BACKEND_TEE for consumers to
match against. Use them in the SCM and OP-TEE backends too.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 8 ++++++++
 drivers/firmware/qcom/qcom_pas_tee.c   | 2 +-
 drivers/firmware/qcom/qcom_scm.c       | 2 +-
 include/linux/firmware/qcom/qcom_pas.h | 5 +++++
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index 24485dd0fa10..eb9e8ac85860 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -253,6 +253,14 @@ bool qcom_pas_supported(u32 pas_id)
 }
 EXPORT_SYMBOL_GPL(qcom_pas_supported);
 
+const char *qcom_pas_get_backend(void)
+{
+	struct qcom_pas_ops *ops = ops_ptr;
+
+	return ops ? ops->drv_name : NULL;
+}
+EXPORT_SYMBOL_GPL(qcom_pas_get_backend);
+
 /**
  * qcom_pas_is_available() - Check if the peripheral authentication service is
  *			     available. Note that it is mandatory for any PAS
diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index ac33a00687aa..397f11aea3b4 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -396,7 +396,7 @@ static void qcom_pas_tee_metadata_release(struct device *dev,
 }
 
 static struct qcom_pas_ops qcom_pas_ops_tee = {
-	.drv_name		= "qcom-pas-tee",
+	.drv_name		= QCOM_PAS_BACKEND_TEE,
 	.supported		= qcom_pas_tee_supported,
 	.init_image		= qcom_pas_tee_init_image,
 	.mem_setup		= qcom_pas_tee_mem_setup,
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..d556f357fecb 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1057,7 +1057,7 @@ bool qcom_scm_pas_supported(u32 pas_id)
 EXPORT_SYMBOL_GPL(qcom_scm_pas_supported);
 
 static struct qcom_pas_ops qcom_pas_ops_scm = {
-	.drv_name		= "qcom_scm",
+	.drv_name		= QCOM_PAS_BACKEND_SCM,
 	.supported		= __qcom_scm_pas_supported,
 	.init_image		= __qcom_scm_pas_init_image2,
 	.mem_setup		= __qcom_scm_pas_mem_setup,
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index fb2ec3be6a16..6e23b806259f 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -13,6 +13,10 @@
 #include <linux/io.h>
 #include <linux/types.h>
 
+/* Names reported by qcom_pas_get_backend() for the active PAS backend. */
+#define QCOM_PAS_BACKEND_SCM	"qcom_scm"
+#define QCOM_PAS_BACKEND_TEE	"qcom-pas-tee"
+
 struct qcom_pas_context {
 	struct device *dev;
 	u32 pas_id;
@@ -34,6 +38,7 @@ static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
 	return ptr;
 }
 
+const char *qcom_pas_get_backend(void);
 bool qcom_pas_is_available(void);
 struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 						     u32 pas_id,

-- 
2.53.0

