Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078132BD022;
	Thu,  1 Oct 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859439; cv=none; b=ZwUdtht5oczeB4PJknZQOApLIuFHoG316k3UUfjAeCKLmUitqgtN6dXKDrGUCuUNbNDySiz9uhMlCxGxjSEYA0tRBJrfLE04AZy1lcMr/1sDx7z28/ed27QyXo0Xj2RDT3HmRSz91cZgLsyXoBXTsd9UWGUf21v/NMzgA8ZqkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859439; c=relaxed/simple;
	bh=9QeW6dEBGudx82hfUh4TbLd8zTwONzsf6NEHsk2aThY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9OesqfIhZxGWTcB6lDsWsjBl/g74XAub1KYF37KRIaxOEhlRaJCfqJEUPtVwHB2CYF1wWes9eUG0fdS/lst7D0SjcOywhlzO5Lt6+ePGiZwMxR6BEhQzwz+qsJHynKWbKjC+Yvmrmv3+mNxQcAPsUswjhEq5EyjA45LiQTG6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWx0xDya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWx0xDya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A3A1F000FF;
	Thu,  1 Oct 2026 12:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859437;
	bh=xVLQUarHQJHENRprbSGIcDRrAF2ga5DsRylT2CdgwcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YWx0xDyazdEGelDTh5oqaahnEKeyy6OG7QtPiyfVCzTP6aZttFyKzZ/Wt3TDlDNfX
	 mWm+RJER+dAvO9M2vJ5BgaF025f/YtbLd1jT33ljxKRbir9Zi1Qliz3Ft3EX78EF4l
	 mOVvuWDCgqE5ubyMCsHbLZo1E8bttaHMMqxlJj1+d/tMZ/T4V9hF1QFbCf2wTEJ5ql
	 oh0/VLvDNOUVqikLAtYGCpubS4kK1/RnpDXObggU/PfpDDoC3xHZZcvnvTHi+dEfgD
	 hpJSC7h1eplpHT07PKkysoCvbgnMwKdOF3c1sFIZA+esyJL+NpYbiWMqWNA8Z5L0Ex
	 1ebB1mJ8O5peA==
Date: Thu, 1 Oct 2026 18:27:10 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Basant Kumar <basantk@qti.qualcomm.com>,
	Apurupa Pattapu <apurupa@qti.qualcomm.com>,
	Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 5/6] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
Message-ID: <ar5YpkQrkxbjVjAz@sumit-xelite>
Mail-Followup-To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Basant Kumar <basantk@qti.qualcomm.com>,
	Apurupa Pattapu <apurupa@qti.qualcomm.com>,
	Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
References: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
 <20261001-qcom_uefisecapp_migrate_qcomtee-v3-5-13df5c20c2e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-5-13df5c20c2e3@oss.qualcomm.com>

On Thu, 01 Oct 2026 at 16:32:37 +0530, Harshal Dev wrote:
>QTEE exposes certain secure services implemented either within the QTEE
>kernel or via pre-loaded Trusted Applications (TAs). Such always-available
>services can be readily accessed by TEE client drivers via QTEE's
>object-IPC protocol if the service is registered as a device on the TEE
>bus.
>
>One such service is the EFI-variables service, implemented by the
>uefisecapp TA which enables kernel clients to access EFI variables at
>runtime.
>
>Maintain a static list of such always-available secure services and add
>support for the QCOMTEE driver to register these services as devices on
>the TEE bus during probe.
>
>Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>---
> drivers/tee/qcomtee/call.c           | 161 ++++++++++++++++++++++++++++++++++-
> drivers/tee/qcomtee/core.c           |   9 +-
> drivers/tee/qcomtee/qcomtee.h        |  12 +++
> drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
> drivers/tee/qcomtee/qcomtee_object.h |   3 +-
> 5 files changed, 179 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>index b361d9c04de0..8fadb7b13e61 100644
>--- a/drivers/tee/qcomtee/call.c
>+++ b/drivers/tee/qcomtee/call.c
>@@ -675,9 +675,13 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>
> 	/* Get ''FeatureVersions Service'' object. */
> 	service = qcomtee_object_get_service(oic, client_env,
>-					     QCOMTEE_FEATURE_VER_UID);
>-	if (service == NULL_QCOMTEE_OBJECT)
>+					     QCOMTEE_FEATURE_VER_UID,
>+					     &result);
>+	if (service == NULL_QCOMTEE_OBJECT) {
>+		if (result)
>+			pr_err("FeatureVersions Service unavailable (%d)\n", result);

Do we really want to error out if a service isn't available? Is it
really the case that every QTEE firmware will implement each service?

> 		goto out_failed;
>+	}
>
> 	/* IB: Feature to query. */
> 	u[0].b.addr = &id;
>@@ -697,6 +701,156 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
> 	qcomtee_object_put(client_env);
> }
>
>+/**
>+ * is_qcomtee_service_available() - Check if the QTEE service identified by the UID
>+ * is available
>+ * @oic: context to use for the current invocation.
>+ * @client_env: Client environment object.
>+ * @service_name: Name of the QTEE service.
>+ * @uid: 32-bit UID of the service.
>+ *
>+ * Returns true if the service exists and is available.
>+ * Returns false if a service is not exposed by QTEE.
>+ */
>+static bool is_qcomtee_service_available(struct qcomtee_object_invoke_ctx *oic,
>+					 struct qcomtee_object *client_env,
>+					 const char *service_name, u32 uid)
>+{
>+	struct qcomtee_object *service;
>+	int error = 0;
>+	bool ret = false;
>+
>+	/* Get service object corresponding to the uid. */
>+	service = qcomtee_object_get_service(oic, client_env, uid, &error);
>+	if (service != NULL_QCOMTEE_OBJECT) {
>+		qcomtee_object_put(service);
>+		ret = true;
>+	}
>+
>+	/* When we fail to get the service, QTEE provides the reason. */
>+	if (error)
>+		pr_err("%s is unavailable (%d)\n", service_name, error);

Ditto here, rather convert this into a debug message.

>+
>+	return ret;
>+}
>+
>+/*
>+ * QTEE Service UUID name space identifier
>+ *
>+ * A random UUID that is allocated as a name space identifier for forming UUID's
>+ * representing secure services exposed by QTEE.
>+ */
>+static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
>+						     0x93, 0x4e, 0xa2, 0xf2,
>+						     0x0a, 0xba, 0x98, 0x42);
>+
>+static const struct qtee_service qtee_services[] = {
>+	{ "qcom.tz.uefisecapp",
>+	   QCOMTEE_UEFI_SEC_UID }
>+};
>+
>+static void qtee_release_service(struct device *dev)
>+{
>+	struct tee_client_device *qtee_service = to_tee_client_device(dev);
>+
>+	kfree(qtee_service);
>+}
>+
>+/**
>+ * qtee_enumerate_service() - Enumerate a given QTEE service and register
>+ * it on the TEE bus as a TEE client device
>+ * @oic: context to use for the current invocation.
>+ * @client_env: Client environment object.
>+ * @service_name: Name of the QTEE service to be enumerated.
>+ * @uid: 32-bit UID used by QTEE to identify the service.
>+ *
>+ * Returns 0 on success and < 0 on failure.
>+ */
>+static int qtee_enumerate_service(struct qcomtee_object_invoke_ctx *oic,
>+				  struct qcomtee_object *client_env,
>+				  const char *service_name,
>+				  const u32 uid)
>+{
>+	struct tee_client_device *qtee_service;
>+	uuid_t service_uuid;
>+	int rc;
>+
>+	if (!is_qcomtee_service_available(oic, client_env, service_name, uid))
>+		return -EOPNOTSUPP;
>+
>+	tee_generate_uuid_v5(&service_uuid, &qtee_service_uuid_ns, service_name,
>+			     strlen(service_name));
>+
>+	qtee_service = kzalloc_obj(*qtee_service);
>+	if (!qtee_service)
>+		return -ENOMEM;
>+
>+	qtee_service->dev.bus = &tee_bus_type;
>+	qtee_service->dev.release = qtee_release_service;
>+	if (dev_set_name(&qtee_service->dev, "qtee-svc-%pUb", &service_uuid)) {
>+		kfree(qtee_service);
>+		return -ENOMEM;
>+	}
>+	uuid_copy(&qtee_service->id.uuid, &service_uuid);
>+
>+	rc = device_register(&qtee_service->dev);
>+	if (rc) {
>+		pr_err("QTEE service registration failed, err: %d\n", rc);
>+		put_device(&qtee_service->dev);
>+		return rc;
>+	}
>+
>+	return 0;
>+}
>+
>+/**
>+ * qtee_enumerate_services() - Enumerate all the secure services exposed by QTEE
>+ * from the static 'qtee_services' list and register them on the TEE bus as
>+ * TEE client devices.
>+ *
>+ * Not all versions of QTEE support a given service. Hence, we try to
>+ * enumerate as many services from the 'qtee_services' list as possible.
>+ * Not being able to enumerate a service shouldn't cause the driver probe
>+ * to fail since none of the services in the list are mandatory for
>+ * establishing communication with QTEE.
>+ * @ctx: TEE context.
>+ */
>+static void qtee_enumerate_services(struct tee_context *ctx)
>+{
>+	u32 idx;
>+	struct qcomtee_object *client_env;
>+
>+	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>+		qcomtee_object_invoke_ctx_alloc(ctx, true);
>+	if (!oic)
>+		return;
>+
>+	client_env = qcomtee_object_get_client_env(oic);
>+	if (client_env == NULL_QCOMTEE_OBJECT)
>+		return;
>+
>+	for (idx = 0; idx < ARRAY_SIZE(qtee_services); idx++)
>+		qtee_enumerate_service(oic, client_env,
>+				       qtee_services[idx].name,
>+				       qtee_services[idx].uid);
>+
>+	qcomtee_object_put(client_env);
>+}
>+
>+static int qtee_unregister_service(struct device *dev, void *data)
>+{
>+	if (!strncmp(dev_name(dev), "qtee-svc", strlen("qtee-svc")))
>+		device_unregister(dev);
>+
>+	return 0;
>+}
>+
>+static void qtee_unregister_services(void)
>+{
>+	bus_for_each_dev(&tee_bus_type, NULL, NULL,
>+			 qtee_unregister_service);
>+}
>+
> static const struct tee_driver_ops qcomtee_ops = {
> 	.get_version = qcomtee_get_version,
> 	.open = qcomtee_open,
>@@ -778,6 +932,8 @@ static int qcomtee_probe(struct platform_device *pdev)
> 		QTEE_VERSION_GET_MINOR(qcomtee->qtee_version),
> 		QTEE_VERSION_GET_PATCH(qcomtee->qtee_version));
>
>+	qtee_enumerate_services(qcomtee->ctx);

Rather call it qtee_register_services() matching it's counterpart below.

-Sumit

>+
> 	return 0;
>
> err_dest_wq:
>@@ -807,6 +963,7 @@ static void qcomtee_remove(struct platform_device *pdev)
> {
> 	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
>
>+	qtee_unregister_services();
> 	teedev_close_context(qcomtee->ctx);
> 	/* Wait for RELEASE operations to be processed for QTEE objects. */
> 	tee_device_unregister(qcomtee->teedev);
>diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>index 60fe3b5776e3..4a523a95bf0e 100644
>--- a/drivers/tee/qcomtee/core.c
>+++ b/drivers/tee/qcomtee/core.c
>@@ -898,19 +898,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
>
> struct qcomtee_object *
> qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>-			   struct qcomtee_object *client_env, u32 uid)
>+			   struct qcomtee_object *client_env, u32 uid,
>+			   int *result)
> {
> 	struct qcomtee_arg u[3] = { 0 };
>-	int ret, result;
>+	int ret;
>
> 	u[0].b.addr = &uid;
> 	u[0].b.size = sizeof(uid);
> 	u[0].type = QCOMTEE_ARG_TYPE_IB;
> 	u[1].type = QCOMTEE_ARG_TYPE_OO;
> 	ret = qcomtee_object_do_invoke(oic, client_env, QCOMTEE_CLIENT_ENV_OPEN,
>-				       u, &result);
>+				       u, result);
>
>-	if (ret || result)
>+	if (ret || *result)
> 		return NULL_QCOMTEE_OBJECT;
>
> 	return u[1].o;
>diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
>index f39bf63fd1c2..66d305a46c0a 100644
>--- a/drivers/tee/qcomtee/qcomtee.h
>+++ b/drivers/tee/qcomtee/qcomtee.h
>@@ -17,6 +17,8 @@
> #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
> #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
>
>+#define QTEE_UUID_NS_NAME_SIZE	        128
>+
> /**
>  * struct qcomtee - Main service struct.
>  * @teedev: client device.
>@@ -39,6 +41,16 @@ struct qcomtee {
> 	u32 qtee_version;
> };
>
>+/**
>+ * struct qtee_service - A secure service exposed by QTEE identified by a 32-bit UID.
>+ * @name: Name of the QTEE service.
>+ * @uid: 32-bit UID used by QTEE to identify the service.
>+ */
>+struct qtee_service {
>+	const char *name;
>+	const u32 uid;
>+};
>+
> void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
> struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
> 					 u32 idx);
>diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
>index 5d7b21fdd368..9278a361dc70 100644
>--- a/drivers/tee/qcomtee/qcomtee_msg.h
>+++ b/drivers/tee/qcomtee/qcomtee_msg.h
>@@ -105,6 +105,7 @@ union qcomtee_msg_arg {
> #define QTEE_VERSION_GET_MINOR(x) (((x) >> 12) & 0xffU)
> #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
>
>+#define QCOMTEE_UEFI_SEC_UID            413
> /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
>
> /* The message contains a callback request. */
>diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>index d3740099fae0..901ba3565a73 100644
>--- a/drivers/tee/qcomtee/qcomtee_object.h
>+++ b/drivers/tee/qcomtee/qcomtee_object.h
>@@ -317,6 +317,7 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic);
>
> struct qcomtee_object *
> qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>-			   struct qcomtee_object *client_env, u32 uid);
>+			   struct qcomtee_object *client_env, u32 uid,
>+			   int *result);
>
> #endif /* QCOMTEE_OBJECT_H */
>
>-- 
>2.34.1
>
