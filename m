Received: from mail-dy2-f31.google.com (mail-dy2-f31.google.com [74.125.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435F44239F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115134; cv=none; b=E8Cbz/ZbMDzeuMs7wvvc6mt07+v8nHuD82kOHRCAbnMYhwvl3pyYeX1eShiBFA1wQtud9uVBJGXlMBsCFe+XdSEJQkRW/TpL4E/MH+mWtqwtdsqmRhXf500Fyj7ZNanEJbf1hlV+Q6OOZ0j9/vOC5O7GHvO1jEFZ3pqi3QeqIIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115134; c=relaxed/simple;
	bh=d9e7atHlpzB8fwkN/XpKtahF7qOD85GlN602XpBAv/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHB4AJDswqDqsUrs27/xovRumvW7q9APin9gsJE/DSKKbE5A/gpNTPdn1JrD9eEz2e4M14eZomKze4aZx9+rYFDau9bb36xJ4KIco9nLcl8qhHxPWRPLBJWTsg01Gy4HIF2Poei9MQVoK/0ahFDCQYuqFKRsq4AcYlQvMfU1eCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=RJ2kt/X4; arc=none smtp.client-ip=74.125.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="RJ2kt/X4"
Received: by mail-dy2-f31.google.com with SMTP id 5a478bee46e88-33c11ef641aso367342eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790115124; x=1790719924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0EGwnJqLTgLZnLrZ6Z5AxYK0hsLKxXP9M5c8Jp/5Ro=;
        b=RJ2kt/X4XNmc7UdfTZRIsS+rpe1zySJWiF93FezLxyCByfMvZASzI2JPmYnKkQu2HQ
         rkeb61YnEox1XJfIwXBfu++gVAs8SJmZevdKn/TKqCO4xy2v788I6bSYI1cyqjHofySj
         sPzZlRvvks13lMq0MHnPt38fYpxc3AdbhjxzlTjDHGrkbJks6zFRIc38c/oJKjpogenF
         wvQiUHUoACFaxqCxWmHVMcxbtcoWA6HlH/YA5QelyR6EnPz+0EF9tkj07TWXZwFBvKyd
         qjSdxTKyBPPH+kQysgw2F5n/qyiW2sdeQzvbSBkyGpIZAJmZQLnIPHf0vebA0/YrscT4
         tsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115124; x=1790719924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0EGwnJqLTgLZnLrZ6Z5AxYK0hsLKxXP9M5c8Jp/5Ro=;
        b=ehtyva85E2E6yuhpvOk15sViTTJe05SKQa/ozanQMIMVbvZJwKLl7z1G5u4d8zzlye
         W17hlddJS5jV05Hqd/MsUGNCkDe/Hb2KSQBSfzjH2+X29p3brgd59tE4YQL55QndkKu9
         j10XrWmOosopFMeh5ZTmvVMWoAz9ZYbkUQuS/x37jpPoJN68gRtoat52y1YNJHSzp83p
         k+ZDjErd3ir/7FwmT847/mtpNRFhS6WtRkqldUPoleH8ZcwNXr1eRr4mMPrsY4Vu7PDB
         o892raKIxfLDDl093COrInW8umKPfpVVEcFoeNw6MfUP0FvFv5NW/XMLGg/IBMwmjGzA
         3ASg==
X-Forwarded-Encrypted: i=1; AKwUvBzgLjbf2Glgq5q9Kt1Q8LLnxTvsvUysaiJCns6O8MIuqH1NZwRRRjAceaOTVQitDXMCrhiQ/8BOqqwOiLw=@vger.kernel.org
X-Gm-Message-State: AFuF++kXDIH0c4ZgJTFQ0KbnpQq3qmJSKAv/HeGv5WWC0c+7ILmTEbgu
	ZnihDZcnuBUYlnbuv668U4Wdw2bzh6PFZ43upZq4YLjfTXMJK3fri0xSIyqFwAiAWLg=
X-Gm-Gg: AYBFou2at11TjcdMA/cwx5tUlmDJ9t7FW8gSm3DyETb7SlAvwz14wcEeZ1JGqqyVxJT
	jRHJFOoq34MUPJYimp2FfT92NTplPMGfA2Hw4G2zFYaP1b5oAmhS4qF4NVL4Lj37J5R0y1GTEt8
	tuKUVCFtSLz5UXrW81/DiKt7g0tD5NH37qovwPKvYbd61Uyq1sF7+dtaomMgqUBdIEFMxQTd/tT
	BOEmwZx+TUzCIfQ+C1y2m0JDAnRX5uHzVzmzSNITHxhc+1oVdKOtcFxMNIS+E27a1kCt11DsSL7
	8xmO2tUveKGbodmQeC/Uzxnl9XYFLs+xC0aKhLbl0kX/uS6WP8V0mNuqlkAVRUWxRP5ifV2DY9h
	wCPAn3iRvCLoGEaQZYixnmrYyXgY8u+xkkLMoJjeejDjTpOMH3XmN18zRH1n1Ul3RAArJ50SWPs
	4u46+nj2qrh4nHwzUUmpPOz/L5oIEAsZXe7LomvUHYlb+7mGcZs4Ksl60Yrbjk4jtvnTrevslih
	RvL9xymy5tXp4TvPRkILosb3y6ImSlgU0jsRemY
X-Received: by 2002:a05:693c:8810:20b0:33c:342e:f408 with SMTP id 5a478bee46e88-33e8e2b3e1bmr616215eec.35.1790115123397;
        Tue, 22 Sep 2026 15:12:03 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33e96d46f48sm2056578eec.23.2026.09.22.15.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:12:02 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:12:01 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Chris Leech <cleech@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] nvmet: Add traffic based keep alive support to
 configfs
Message-ID: <20260922221201.GE2931-mkhalfella@purestorage.com>
References: <20260922202257.1434980-1-jtaubepe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922202257.1434980-1-jtaubepe@redhat.com>

On Tue 2026-09-22 16:22:56 -0400, Jesse Taube wrote:
> Add the ability to turn on and off tbkas (traffic based keep alive
> support) via configfs. This is useful for testing and debugging.

Yep, this is indeed useful.

> 
> Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
> ---
>  drivers/nvme/target/admin-cmd.c |  4 +++-
>  drivers/nvme/target/configfs.c  | 27 +++++++++++++++++++++++++++
>  drivers/nvme/target/core.c      |  3 ++-
>  drivers/nvme/target/nvmet.h     |  1 +
>  4 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
> index 7764a3c0195c..e734e4b68784 100644
> --- a/drivers/nvme/target/admin-cmd.c
> +++ b/drivers/nvme/target/admin-cmd.c
> @@ -696,7 +696,9 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
>  
>  	/* XXX: figure out what to do about RTD3R/RTD3 */
>  	id->oaes = cpu_to_le32(NVMET_AEN_CFG_OPTIONAL);
> -	ctratt = NVME_CTRL_ATTR_HID_128_BIT | NVME_CTRL_ATTR_TBKAS;
> +	ctratt = NVME_CTRL_ATTR_HID_128_BIT;
> +	if (subsys->tbkas)
> +		ctratt |= NVME_CTRL_ATTR_TBKAS;
>  	if (nvmet_is_pci_ctrl(ctrl))
>  		ctratt |= NVME_CTRL_ATTR_RHII;
>  	id->ctratt = cpu_to_le32(ctratt);
> diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
> index 6286e38436dd..5766e594e724 100644
> --- a/drivers/nvme/target/configfs.c
> +++ b/drivers/nvme/target/configfs.c
> @@ -1369,6 +1369,32 @@ static ssize_t nvmet_subsys_attr_serial_store(struct config_item *item,
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
> +	bool tbkas;
> +
> +	if (subsys->subsys_discovered) {
> +		pr_err("Can't set traffic based keep alive support. %d is already assigned\n",
> +		       subsys->tbkas);
> +		return -EINVAL;
> +	}

Would it be okay to fore reconnecting existing controllers when
subsys->tbkas changes? Similar to what attr_qid_max does?

I think this will make testing more flexible by avoiding need to
recreate the subsystem in order to test tkbas on/off. Also, you may
consider adding ctrl->tkbas, again just like qid_max. It will be copied
from subsys in nvmet_alloc_ctrl() under subsys->lock.

> +
> +	if (kstrtobool(page, &tbkas))
> +		return -EINVAL;
> +
> +	subsys->tbkas = tbkas;
> +	return count;
> +}
> +CONFIGFS_ATTR(nvmet_subsys_, attr_tbkas);
> +
>  static ssize_t nvmet_subsys_attr_cntlid_min_show(struct config_item *item,
>  						 char *page)
>  {
> @@ -1706,6 +1732,7 @@ static struct configfs_attribute *nvmet_subsys_attrs[] = {
>  	&nvmet_subsys_attr_attr_qid_max,
>  	&nvmet_subsys_attr_attr_ieee_oui,
>  	&nvmet_subsys_attr_attr_firmware,
> +	&nvmet_subsys_attr_attr_tbkas,
>  #ifdef CONFIG_BLK_DEV_INTEGRITY
>  	&nvmet_subsys_attr_attr_pi_enable,
>  #endif
> diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
> index 43871a8f56ca..20aeb9624be0 100644
> --- a/drivers/nvme/target/core.c
> +++ b/drivers/nvme/target/core.c
> @@ -1227,7 +1227,7 @@ bool nvmet_req_init(struct nvmet_req *req, struct nvmet_sq *sq,
>  		goto fail;
>  	}
>  
> -	if (sq->ctrl)
> +	if (sq->ctrl && sq->ctrl->subsys->tbkas)
>  		sq->ctrl->reset_tbkas = true;

If you add ctrl->tkbas, then this will be sq->ctrl->tkbas. It is
guaranteed not to change during the lifetime of the controller.

>  
>  	return true;
> @@ -1865,6 +1865,7 @@ struct nvmet_subsys *nvmet_subsys_alloc(const char *subsysnqn,
>  	}
>  
>  	subsys->ieee_oui = 0;
> +	subsys->tbkas = true;
>  
>  	subsys->firmware_rev = kstrndup(UTS_RELEASE, NVMET_FR_MAX_SIZE, GFP_KERNEL);
>  	if (!subsys->firmware_rev) {
> diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
> index dbda55895f4f..241eac4fa969 100644
> --- a/drivers/nvme/target/nvmet.h
> +++ b/drivers/nvme/target/nvmet.h
> @@ -343,6 +343,7 @@ struct nvmet_subsys {
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
