Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104765;
	b=Zl/mw+yUXaVLH2Aqb+UZldsOW0oSvIZxrvKSITAjLx9GsE1tAEnSyqK5H1IFmx7LysqG
	 Kk5JOl0rNuJAcg4y1GfwMTePPw5KrOchv6EuzaoYIBOeqy5dc+h9baEuhHyM1yTGGaxGG
	 guqBf1r2tKujfpMQ8hmeaJNboPr01giJtqoEOtybhAxCyP+O4xVIN9jpRQOGa/GrBdxfo
	 TB/wLvsfzJJbJRfX91FYQPSzRrR7Rm6w24bRDu31eutS4SN4e8FtW1K7FrNt0JXGst5XP
	 Hpl9+sBmYYthwm3JZ8KnBXFvUHS4nkwtFjd8ah+jiIC0Vn75Tk4WpDT2r7lo2r5r42w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104765;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=jF+5u1yS3PlTua1yc2TSsk1QKaKcuY0Xwd0owpaBeIA=;
	b=Sxdq2ui3AShFKDcuihvkSshbUzcpi1txyuOQ/IyjgrztHf8sRVdr6DdhxIfscJZrb81P
	 FBL9o7utkpelMMjEM4xlSoXw/S+/v5bftUtDmBbQKjVN7HNRJOtwkdZyh14/8nYN8URGe
	 dQXgoIKp9OD70KVr3Z8P8CQHHo94NNQJ1JgMWwbdwWfRUHws7IwKFs1YxMbTGeCsMwuhu
	 Gy89XN0WDYGyElrUbceOsZlNZJXkCnqRUNJ2kmqHj9qF02OIXoljL3XmGwoFafNf2A6H5
	 Zs+zQyOtCRg7uLxhX8VJktuHsuKkxdEhKBmCHs41tTauDZmoHatskbSpNTzXLj5+AgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NAhU/I0U";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80274606A32C;
	Tue, 27 Oct 2026 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAhU/I0U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE53C1F031E2;
	Tue, 27 Oct 2026 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793104765;
	bh=jF+5u1yS3PlTua1yc2TSsk1QKaKcuY0Xwd0owpaBeIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NAhU/I0Uz0GpZUGiBGyRvIJDsGUKf5pc2H0Myy5W6YVujfNmi3XeYpnGFMQGqSr7B
	 VxvK0L+12dbc2cfPhdgZw1qSgOf1EQap2m4poB/fqpanMdS5qbLhQnnsL69jNdRa2R
	 v9mepn7bDTjaKQ4AHWhDNgFDzccqEVLf2YP02xmBQ4NtOvsL4XO43JeEbJtHC1vD/O
	 ZKoUaWeKIJAPDUvZ0tLrhkCNLGbRiUqMUGiz9H8f1ADGGzt5DYUDOC0uHpBA4h9cB6
	 3dOzfSxAdZysY+2pvTZ2KOct/8rMjnFBmjEhdDfp79Ys9UcYbKVkGtsfVYpybzkn9F
	 2JN/cVU5bzN2g==
From: Sumit Garg <sumit.garg@kernel.org>
Date: Tue, 27 Oct 2026 18:09:03 +0530
Subject: [PATCH v2 1/3] firmware: qcom: pas: Add optional video memory
 protection op
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
Message-Id: <20261027-pas-video-v2-1-5b52bca5add6@oss.qualcomm.com>
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

qcom_scm_mem_protect_video_var() is only serviced by the SCM backend.
Other PAS backends, e.g. OP-TEE, own secure memory protection and don't
implement such a call.

Add an optional mem_protect_video_var() PAS op along with a generic
qcom_pas_mem_protect_video_var() wrapper so that clients stay agnostic
of the active backend. The SCM backend maps it to the existing SCM call
while backends leaving it unset turn it into a no-op.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 27 +++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_pas.h       |  5 +++++
 drivers/firmware/qcom/qcom_scm.c       | 10 ++++++++++
 include/linux/firmware/qcom/qcom_pas.h |  2 ++
 4 files changed, 44 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index 24485dd0fa10..d478171e4697 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -237,6 +237,33 @@ int qcom_pas_shutdown(u32 pas_id)
 }
 EXPORT_SYMBOL_GPL(qcom_pas_shutdown);
 
+/**
+ * qcom_pas_mem_protect_video_var() - Set up video content protection ranges
+ * @cp_start:		content protection region start
+ * @cp_size:		content protection region size
+ * @cp_nonpixel_start:	non-pixel region start
+ * @cp_nonpixel_size:	non-pixel region size
+ *
+ * Backends that manage secure memory protection on their own do not
+ * implement this operation, in which case it is a no-op.
+ *
+ * Return: 0 on success.
+ */
+int qcom_pas_mem_protect_video_var(u32 cp_start, u32 cp_size,
+				   u32 cp_nonpixel_start, u32 cp_nonpixel_size)
+{
+	if (!ops_ptr)
+		return -ENODEV;
+
+	if (!ops_ptr->mem_protect_video_var)
+		return 0;
+
+	return ops_ptr->mem_protect_video_var(ops_ptr->dev, cp_start, cp_size,
+					      cp_nonpixel_start,
+					      cp_nonpixel_size);
+}
+EXPORT_SYMBOL_GPL(qcom_pas_mem_protect_video_var);
+
 /**
  * qcom_pas_supported() - Check if the peripheral authentication service is
  *			  supported for the given peripheral
diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
index 8643e2760602..481343669e1d 100644
--- a/drivers/firmware/qcom/qcom_pas.h
+++ b/drivers/firmware/qcom/qcom_pas.h
@@ -22,6 +22,8 @@ struct device;
  *				callback.
  * @set_remote_state:		Peripheral set remote state callback.
  * @shutdown:			Peripheral shutdown callback.
+ * @mem_protect_video_var:	Optional video secure memory protection callback.
+ *				Backends that do not need it leave it unset.
  * @metadata_release:		Image metadata release callback.
  */
 struct qcom_pas_ops {
@@ -40,6 +42,9 @@ struct qcom_pas_ops {
 	int (*auth_and_reset)(struct device *dev, u32 pas_id);
 	int (*set_remote_state)(struct device *dev, u32 state, u32 pas_id);
 	int (*shutdown)(struct device *dev, u32 pas_id);
+	int (*mem_protect_video_var)(struct device *dev, u32 cp_start,
+				     u32 cp_size, u32 cp_nonpixel_start,
+				     u32 cp_nonpixel_size);
 	void (*metadata_release)(struct device *dev,
 				 struct qcom_pas_context *ctx);
 };
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..5445c1aa14cc 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -981,6 +981,15 @@ static bool qcom_scm_pas_supported(struct device *dev, u32 pas_id)
 	return ret ? false : !!res.result[0];
 }
 
+static int qcom_scm_pas_mem_protect_video_var(struct device *dev, u32 cp_start,
+					      u32 cp_size, u32 cp_nonpixel_start,
+					      u32 cp_nonpixel_size)
+{
+	return qcom_scm_mem_protect_video_var(cp_start, cp_size,
+					      cp_nonpixel_start,
+					      cp_nonpixel_size);
+}
+
 static struct qcom_pas_ops qcom_pas_ops_scm = {
 	.drv_name		= "qcom_scm",
 	.supported		= qcom_scm_pas_supported,
@@ -991,6 +1000,7 @@ static struct qcom_pas_ops qcom_pas_ops_scm = {
 	.prepare_and_auth_reset	= qcom_scm_pas_prepare_and_auth_reset,
 	.set_remote_state	= qcom_scm_pas_set_remote_state,
 	.shutdown		= qcom_scm_pas_shutdown,
+	.mem_protect_video_var	= qcom_scm_pas_mem_protect_video_var,
 	.metadata_release	= qcom_scm_pas_metadata_release,
 };
 
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index fb2ec3be6a16..bfd4a9e5a705 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -49,6 +49,8 @@ int qcom_pas_auth_and_reset(u32 pas_id);
 int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
 int qcom_pas_set_remote_state(u32 state, u32 pas_id);
 int qcom_pas_shutdown(u32 pas_id);
+int qcom_pas_mem_protect_video_var(u32 cp_start, u32 cp_size,
+				   u32 cp_nonpixel_start, u32 cp_nonpixel_size);
 bool qcom_pas_supported(u32 pas_id);
 void qcom_pas_metadata_release(struct qcom_pas_context *ctx);
 

-- 
2.43.0

