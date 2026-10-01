Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1216327473;
	Thu,  1 Oct 2026 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858792; cv=none; b=JRt2d9VFnFYRFwzBGp+uH2UWvDJufeihOXGTki37ED/LL9b5GoUIsz/qQpQGqzEg0x7pctS1AUhI5QSedGVgqCdZzftOCmpzcSJ1rIntQPUSFeqal+vj3fELTtWEY56ZNaqukWLteyM1g3bUrNHr5Mg34jjIEIN95Y+1AVCdg20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858792; c=relaxed/simple;
	bh=ZVo574l+B2ceBlnyUHqv3njhm8W0ZsI/TflcQGJ2gg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1ktWShqpk6deLttBH1ruk2xbNJJwFZy/RMuf4KV+RRgHKjRClp/f/XK71p9jN6IUFZS5eo4Kzew+Fj4aRYcjCA1AM3mwEK3bG5NVOqYqCXP2CePJdx8vYuN0NZ7Xmo2rtQrfjhaYQVMH1TjA4auTo/LgowdK1COj1c0Bx8vm5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IE3+OzXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IE3+OzXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4132B1F000FF;
	Thu,  1 Oct 2026 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858790;
	bh=h6t6ly3RWQcrMYeDssmderTujtT/pnC/r0uUggP8a0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IE3+OzXlxssqlUXJy3f3XyvVBeIF6LlPosZQIpOvJ9YDuW4w/Nz3lcatySRd/lRcF
	 B3RJpZmZi8T1b020q4OcKwnDOVFshX4RbOzBXejKudHqCOj8Y4ldAvZp8UPkmNPSxf
	 AKiXKKdn+doqFh1cWtez7ofwQbgXTY3DQVIlgLBoPpjWU7/nEr4db2d7rEawZbYGmW
	 ROIedk2JRzzQOirYBcKaotRG266CCGAt0aG00A7lLnqYNhmliRYyv4S3zAXIfxQU/q
	 6AiYewQTufYDqbvcNNfo5T+KrcE4VMya+qLL/S+Og+Ud9ZpGTgGs5ZWdfI0uiE7vbK
	 NPWjuaQtn0p5w==
Date: Thu, 1 Oct 2026 18:16:22 +0530
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
Subject: Re: [PATCH v3 4/6] tee: Export uuidv5 generation for TEE backends
Message-ID: <ar5WHsyKFhIn_L4m@sumit-xelite>
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
 <20261001-qcom_uefisecapp_migrate_qcomtee-v3-4-13df5c20c2e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-4-13df5c20c2e3@oss.qualcomm.com>

On Thu, 01 Oct 2026 at 16:32:36 +0530, Harshal Dev wrote:
>Export the uuidv5() function defined in the TEE core to all TEE backends.
>This enables the TEE backend drivers to generate a UUID for identifying
>and registering their secure services on the TEE bus.
>
>Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>---
> drivers/tee/tee_core.c   |  9 +++++----
> include/linux/tee_core.h | 15 +++++++++++++++
> 2 files changed, 20 insertions(+), 4 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

>diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>index a03a3d645dd1..2cfd302d1393 100644
>--- a/drivers/tee/tee_core.c
>+++ b/drivers/tee/tee_core.c
>@@ -135,7 +135,7 @@ static int tee_release(struct inode *inode, struct file *filp)
> }
>
> /**
>- * uuid_v5() - Calculate UUIDv5
>+ * tee_generate_uuid_v5() - Calculate UUIDv5
>  * @uuid: Resulting UUID
>  * @ns: Name space ID for UUIDv5 function
>  * @name: Name for UUIDv5 function
>@@ -146,8 +146,8 @@ static int tee_release(struct inode *inode, struct file *filp)
>  * This implements section (for SHA-1):
>  * 4.3.  Algorithm for Creating a Name-Based UUID
>  */
>-static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>-		    size_t size)
>+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>+			  size_t size)
> {
> 	unsigned char hash[SHA1_DIGEST_SIZE];
> 	struct sha1_ctx ctx;
>@@ -163,6 +163,7 @@ static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
> 	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
> 	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
> }
>+EXPORT_SYMBOL_GPL(tee_generate_uuid_v5);
>
> int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
> 				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
>@@ -228,7 +229,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
> 		goto out_free_name;
> 	}
>
>-	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
>+	tee_generate_uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
> out_free_name:
> 	kfree(name);
>
>diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
>index bcb5418d6fdc..a3f4f88b8423 100644
>--- a/include/linux/tee_core.h
>+++ b/include/linux/tee_core.h
>@@ -272,6 +272,21 @@ void tee_device_set_dev_groups(struct tee_device *teedev,
> int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
> 				 const u8 connection_data[TEE_IOCTL_UUID_LEN]);
>
>+/**
>+ * tee_generate_uuid_v5() - Calculate UUIDv5
>+ * @uuid: Resulting UUID
>+ * @ns: Name space ID for UUIDv5 function
>+ * @name: Name for UUIDv5 function
>+ * @size: Size of name
>+ *
>+ * UUIDv5 is specific in RFC 4122.
>+ *
>+ * This implements section (for SHA-1):
>+ * 4.3.  Algorithm for Creating a Name-Based UUID
>+ */
>+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>+			  size_t size);
>+
> /**
>  * struct tee_shm_pool - shared memory pool
>  * @ops:		operations
>
>-- 
>2.34.1
>
