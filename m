Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E88423EB7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199942; cv=none; b=Cf3qjjXd+RFFTFW8+uww51L9oNHUju2s3SwCZL929CHpMy0CvHFAdPggl5daQNm1cWVrM5CqyzVqskDsO69n8FXe9R2uLlF2rUHl+FEtjAVDg5QeNU0pZEJwKkzNTCVnpgzdBq0BYLAFS+30HcZK+I4Yyu1lhlGbjWobxsOFtas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199942; c=relaxed/simple;
	bh=MtFQVVY8ii0aQ8edUoqsdnczPPq3oMjj6fjAb3jD7mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmqZXHHr8GeME2Ih+YYqdErzRv0OsWhNdVGK1/VjM6HPrMAVjPjY6vHLm9oyFvCoDu0ljrDfja794GWxonrbElVd96zsuF7I8bAaqUmB9N6DSRI8UabB4/vE4OsVpQFZaUqykVRCwVbGg4yBUQosfyO9DouYY5EC1MYoKdiQw1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WOp7eYni; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WOp7eYni"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14327018b37so43250c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790199939; x=1790804739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwHyWIRHXY3P9Fw/TPrR57c0xVbvLUEWr30qF/TORsY=;
        b=WOp7eYniOf58CILu8cCtotg2NhrePWAEx47u7v7qyU20d1o9F2zWO3NmVlOkfQ08hw
         QfAPNIWZ4p/uWAApE3hQ9BqFZ3S5UoBZTOjg5A6wWsSyouQCIstuxKommvmU9rDYAPN/
         73QNLURCNKJ5X37isvNfrVK5+CoqEBh524J6i8XkEy2JhUyBeedHrUnv91I04EUowMWL
         xsY9f9OLD3z9Ruf2Fo+eEi510SsoPmtnzTMHvTJpcqz2AdKsI8njDZUz6osHZylVLH/E
         0+kZLnhU/sg6w7bNfvtoHDrhq+IW2kHoQDJ2xZuEMsf6mf/EJSGiHicS9lxy+3cC2Ggw
         aX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790199939; x=1790804739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwHyWIRHXY3P9Fw/TPrR57c0xVbvLUEWr30qF/TORsY=;
        b=HAkXOtbPMXCZ7Sm8G5QCtGk39qkpbl4SU/7I6r9jB7gnGbp79KbnVlNY3R/2f9tuA0
         LA7mnIKOqo/HG1/pHHsOybsUJqx1OkFzhPx9UsBSjrsA9r6U4YSC56r6FTwMSKTb5GBc
         y6ErKOv5IG/VYC1/gObMotYbsAfPZNn9aBT+YntoJHSrGC408IxZQ+yPUm+pbjDZc5Qv
         hpA20Ohm0E0DIl4fJm22T62IEa0oEAwcYDG5j+05QB0DoRwh7cerko6vJKq+KD1ztyvC
         dyfxtFZhxklG7JD6wq/B1cLpzz95CpQnBQdjvMaLwBap3+WzRJZsX2NDa4B7ie5xv9Xi
         LSnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLoFOzMuEnrlEjFs2mFOQh42FsFaUi79dljSgkH0wFkzrCE5xR9x6eEMq9tgIVgso/5O5DvfMDuXjq3Tw=@vger.kernel.org
X-Gm-Message-State: AFuF++nVUwuQgOSpnY5dn1ywfJ4unY3W70rHns386cQbVEJ0Sd0BHY0l
	e/tI9yxVDW405M2ePRsq/VxtkOjHcvP5sYXBPldjErJOIzjCeFMlwfLfndwoMfE269M=
X-Gm-Gg: AYBFou0BUkLql9WklpldWuZ2pe5NtMdWhKUiST9+QV1KDKbVe9cpVDWAt5T5zsk5zlQ
	avmMj7tpU2AgNx3kun+2mjdb1g+u/Sn0HPpdFtP7HiftDDAfp0HcfBdRxUfOpFtCczqPl3KJek8
	KJFhE5pb3yrD2KMwD+zfQ/3gnJNzLs1k4TtPGmiPC41iWa+zbHBNGBckaR0s02mUGeGnCeQmWWs
	9G/y9F9/MNg64ZAykv321EJIHHS7h62XjWSB4yh2O8z3oCWJ45o3F1xTe3ooTohXbK9ISenT1I+
	Phk1TKaXGZgCgvHk6b2vKj/VWL/1yUtUcP0qIbe+vV1g4SL4ijseUZLQYqHeGq8dybbY7GkWaqg
	5kN5KHbVy5mP9dghkoQJirAZ6d6Yo4u0tME7+G78XXA9cHvVduJtdsIigSfBqWvmKB+ra6jxagR
	WoHTF5ZG8S7BjTY15YQGefwEvDmL88KPGxN8TvPgxTWGNHDuGkj8Sz3XsiipY9n6HtUqzgaHqCX
	i5Q7iwVU7eEnXLZs6A=
X-Received: by 2002:a05:7022:3a8b:b0:13b:32f4:e826 with SMTP id a92af1059eb24-1450404480emr343521c88.11.1790199938984;
        Wed, 23 Sep 2026 14:45:38 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm7892192eec.8.2026.09.23.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:45:38 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:45:37 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Chris Leech <cleech@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvmet: Add traffic based keep alive support to
 configfs
Message-ID: <20260923214537.GI2931-mkhalfella@purestorage.com>
References: <20260923202003.1776271-1-jtaubepe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923202003.1776271-1-jtaubepe@redhat.com>

On Wed 2026-09-23 16:20:03 -0400, Jesse Taube wrote:
> Add the ability to turn on and off tbkas (traffic based keep alive
> support) via configfs. This is useful for testing and debugging.
> 
> Signed-off-by: Jesse Taube <jtaubepe@redhat.com>

Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>

> V1 -> V2:
>  - Add tbkas to nvmet_ctrl
>  - Force reconnect controllers when tbkas is set
>  - Use ctrl->tbkas in nvmet_execute_identify_ctrl and nvmet_req_init
> ---
>  drivers/nvme/target/admin-cmd.c |  4 +++-
>  drivers/nvme/target/configfs.c  | 29 +++++++++++++++++++++++++++++
>  drivers/nvme/target/core.c      |  4 +++-
>  drivers/nvme/target/nvmet.h     |  2 ++
>  4 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
> index 7764a3c0195c..26028be8fe4d 100644
> --- a/drivers/nvme/target/admin-cmd.c
> +++ b/drivers/nvme/target/admin-cmd.c
> @@ -696,7 +696,9 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
>  
>  	/* XXX: figure out what to do about RTD3R/RTD3 */
>  	id->oaes = cpu_to_le32(NVMET_AEN_CFG_OPTIONAL);
> -	ctratt = NVME_CTRL_ATTR_HID_128_BIT | NVME_CTRL_ATTR_TBKAS;
> +	ctratt = NVME_CTRL_ATTR_HID_128_BIT;
> +	if (ctrl->tbkas)
> +		ctratt |= NVME_CTRL_ATTR_TBKAS;
>  	if (nvmet_is_pci_ctrl(ctrl))
>  		ctratt |= NVME_CTRL_ATTR_RHII;
>  	id->ctratt = cpu_to_le32(ctratt);
> diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
> index 6286e38436dd..2b879b1d4c3c 100644
> --- a/drivers/nvme/target/configfs.c
> +++ b/drivers/nvme/target/configfs.c
> @@ -1369,6 +1369,34 @@ static ssize_t nvmet_subsys_attr_serial_store(struct config_item *item,
>  }
>  CONFIGFS_ATTR(nvmet_subsys_, attr_serial);
>  
> +static ssize_t nvmet_subsys_attr_tbkas_show(struct config_item *item,
> +					     char *page)
> +{
> +	return snprintf(page, PAGE_SIZE, "%d\n", to_subsys(item)->tbkas);
> +}
> +
> +static ssize_t nvmet_subsys_attr_tbkas_store(struct config_item *item,
> +					      const char *page, size_t count)
> +{
> +	struct nvmet_subsys *subsys = to_subsys(item);
> +	struct nvmet_ctrl *ctrl;
> +	bool tbkas;
> +
> +	if (kstrtobool(page, &tbkas))
> +		return -EINVAL;
> +
> +	down_write(&nvmet_config_sem);
> +	subsys->tbkas = tbkas;
> +
> +	/* Force reconnect */
> +	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry)
> +		ctrl->ops->delete_ctrl(ctrl);
> +	up_write(&nvmet_config_sem);
> +
> +	return count;
> +}
> +CONFIGFS_ATTR(nvmet_subsys_, attr_tbkas);
> +
>  static ssize_t nvmet_subsys_attr_cntlid_min_show(struct config_item *item,
>  						 char *page)
>  {
> @@ -1706,6 +1734,7 @@ static struct configfs_attribute *nvmet_subsys_attrs[] = {
>  	&nvmet_subsys_attr_attr_qid_max,
>  	&nvmet_subsys_attr_attr_ieee_oui,
>  	&nvmet_subsys_attr_attr_firmware,
> +	&nvmet_subsys_attr_attr_tbkas,
>  #ifdef CONFIG_BLK_DEV_INTEGRITY
>  	&nvmet_subsys_attr_attr_pi_enable,
>  #endif
> diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
> index 43871a8f56ca..6b4bda231bd9 100644
> --- a/drivers/nvme/target/core.c
> +++ b/drivers/nvme/target/core.c
> @@ -1227,7 +1227,7 @@ bool nvmet_req_init(struct nvmet_req *req, struct nvmet_sq *sq,
>  		goto fail;
>  	}
>  
> -	if (sq->ctrl)
> +	if (sq->ctrl && sq->ctrl->tbkas)
>  		sq->ctrl->reset_tbkas = true;
>  
>  	return true;
> @@ -1677,6 +1677,7 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
>  	mutex_lock(&subsys->lock);
>  
>  	ctrl->max_qid = subsys->max_qid;
> +	ctrl->tbkas = subsys->tbkas;
>  
>  	ctrl->sqs = kzalloc_objs(struct nvmet_sq *, ctrl->max_qid + 1);
>  	if (!ctrl->sqs)
> @@ -1865,6 +1866,7 @@ struct nvmet_subsys *nvmet_subsys_alloc(const char *subsysnqn,
>  	}
>  
>  	subsys->ieee_oui = 0;
> +	subsys->tbkas = true;
>  
>  	subsys->firmware_rev = kstrndup(UTS_RELEASE, NVMET_FR_MAX_SIZE, GFP_KERNEL);
>  	if (!subsys->firmware_rev) {
> diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
> index dbda55895f4f..2bc0e87ea981 100644
> --- a/drivers/nvme/target/nvmet.h
> +++ b/drivers/nvme/target/nvmet.h
> @@ -270,6 +270,7 @@ struct nvmet_ctrl {
>  	u16			cntlid;
>  	u16			max_qid;
>  	u32			kato;
> +	bool			tbkas;
>  
>  	struct nvmet_port	*port;
>  
> @@ -343,6 +344,7 @@ struct nvmet_subsys {
>  	bool			subsys_discovered;
>  	char			*subsysnqn;
>  	bool			pi_support;
> +	bool			tbkas;
>  
>  	struct config_group	group;
>  
> -- 
> 2.55.0
> 
