Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD55304A9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169416; cv=none; b=Q9L3tbFwd8i9SzIzwkRXnDXZJfHbd5sz5kfwFsFlWkdR4goNEiBCl8AamTvj7jyik2bf6hXkN6pLkFKPkDN4XP4StLxI79swv1LWkSjgyEgj64+0L7FTjZbSoAiGIUk8y2KSEVTOkhTpoOhEpi8yhRir/aLnnhmz34UyvDbv3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169416; c=relaxed/simple;
	bh=4PmD9sKEf6enSkeXjaLlo1GTe0Lu+qKyK7dDCygAwiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMZaWk7ruAewF68QtCHRvz+B0hXtTRXxsTWXMODnO+FQcaAj+55kY0P3yUYzfLc0TF7XdrWr6bPAVblNUbr47+U97E5nKaBOnEXeUAGkwanTRF1KCZQysjWAkGzWHWDkUpi93ExgkDNgdm4lkH3vsiiopQKkNygaH2XBKyn1tLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MYSFe4du; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MYSFe4du"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so710593f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790169412; x=1790774212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJ2lf6agIg0afXcQeH7725FscBqXfQeNmWKKgrMh3E4=;
        b=MYSFe4duh6lzmk1tIhtjA1gc722yas0HAQ61OQKwBZQQZmjDH7AqrbfN6g07zjcqio
         JDoid6oMwGS+DiP7HrbnR7u3vX4QtbfyKV3NvVs0inqb0GDBmsmMV27+XRAJykLEsyO8
         EO87emxM0WXXOKweHYQA/alLxsq3eQiF9fASo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169412; x=1790774212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJ2lf6agIg0afXcQeH7725FscBqXfQeNmWKKgrMh3E4=;
        b=OcQJlTVsboxucJ2ZBr6aIQeOTRs/n7fgER4e+CQR649pgsbbKfhhpbCFrdkts/2Dzk
         idOVg8fMFexD7u1DVTBz0b7j4TRXqvs0LrWKJ/1MOw1QbAnDlDAPvqYVbq4VcTMHMJYF
         H60I2mTeiiPLygOJs2DDzY8JPDFIBBz1m5r/UIfebiIRz0mWdVVwIq6UgJLMLeHYMp/f
         51vrdK8YgSG0LxQHmzowXG7EYpB03/zW7yR3WP7GW93M8ul+nX36B3krzW2e1gqiWyLa
         6wFPZZGvJhmQCiTQdjhdibetQkOqyDtIbHEyq72z2rL4cixRyJcqQLchS7d3PmUYUp7V
         qZAg==
X-Forwarded-Encrypted: i=1; AKwUvBynbsc1u5iG4QHKD61w1+wxeXK31FjNYj2QZ0l2jUERS0xgwpG+TG48xkqhTnMT3jB5HlJ8fiZyswYGXmg=@vger.kernel.org
X-Gm-Message-State: AFuF++ld9k1jaEpPoHdkZcXFc+ZIGkZp8O8rN4OMlaIMUjy+HOYBJ4iT
	OBl8a8zVRv6/yQlAfi7vaES+CiIjaGyWXbh2aJ4IyLcp+pqQOm8/f2rxcvEj/LPUPk8=
X-Gm-Gg: AYBFou0SGbT3V5vyRnk1WHb1pdaaq9q7aUkIjlWVDbY2wor5/yq45eAcy1MicPErUx5
	ztgfBBBBvLjMm1vdk9PVlCu6mVvluHDkakUV4QAKd4OLKxi6rr36yGVPjeDdFk0Ic0OWpI8CE3J
	3j1AjF+eU6+oGtcTRV7+b5d2suirQ8TkwRKqE/QNCjeKpled5FkI7aZ+tgBsGnEfcC50d04AZHl
	BYbWgyqc+OBCoEfb+LUpQHSFYohwKRcSy1KnNkxfxwpCLPr2lkR23KepGlmty6vQctg57/mARp6
	SKT/RTaoBz/yfRLd+wAMz7aAB+j08tT+skRQ8A6IirFK5d+fTYEu4nnPbhiQ2JOUc1722GvzuAB
	GJyNhBzd6XL4X0yTz6pu4wphlxBpArIjxa9YNzQfbchya0qyNiJmkplcmfZbQozYTBYBiAyx8R8
	OxIwCVqyReKUcFIpaz773ny+ypaOrQp5qdaXu+yHXVhbB4nu2jwDEpw+nZwGka/V3G70gFgahQP
	pntrraU2IH+4CS+uQ==
X-Received: by 2002:a05:6000:41de:b0:487:a9f:4fa5 with SMTP id ffacd0b85a97d-4886705fc4cmr4022730f8f.4.1790169411691;
        Wed, 23 Sep 2026 06:16:51 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684863fbsm6210249f8f.11.2026.09.23.06.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:16:49 -0700 (PDT)
Message-ID: <163c6036-3115-4b3b-9d3d-f53accb5b5d8@linuxfoundation.org>
Date: Wed, 23 Sep 2026 07:14:20 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usbip: vhci_hcd: let the driver core manage the sysfs
 attributes
To: Deepanshu Kartikey <kartikey406@gmail.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org
Cc: yuyang.du@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260903121938.7661-1-kartikey406@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260903121938.7661-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 06:19, Deepanshu Kartikey wrote:
> The vhci attribute group is created in vhci_start() and removed in
> vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Both run from
> usb_add_hcd()/usb_remove_hcd(), which are called once per hcd, so the
> attach attribute is live while only one of the two hcds exists: it is
> created during the first usb_add_hcd() before vhci_hcd_ss is set, and it
> survives the first usb_put_hcd() on removal. A concurrent write to attach
> can therefore reach a NULL or freed vhci_hcd_ss.

How does the concurrent attach done in the setup where attach is run
from command line from usbip tool?

Had this patch been tested with usbip host and client running attaches
and detaches after host exports devices?

> 
> Register the group as dev_groups on the platform driver instead, so the
> driver core creates the files before probe and removes them after remove
> returns, and drop the sysfs_create_group()/sysfs_remove_group() calls from
> the driver. The attributes have always been created only on vhci_hcd.0;
> an is_visible() callback keeps them there.
> 
> vhci_init_attr_group() is moved into vhci_hcd_init() ahead of
> platform_driver_register() so the group is populated before the core
> reads it. The attribute array is still built at runtime because the
> number of status attributes comes from CONFIG_USBIP_VHCI_NR_HCS and the
> preprocessor cannot emit a variable number of __ATTR() declarations.
> 
> Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
> Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8753715f05759f1a10de
> Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/20260815143427.19066-1-kartikey406@gmail.com/T/ [v1]
> Link: https://lore.kernel.org/all/20260816015051.13184-1-kartikey406@gmail.com/T/ [v2]
> Link: https://lore.kernel.org/all/20260816061034.17769-1-kartikey406@gmail.com/T/ [v3]
> Assisted-by: Claude (Anthropic)
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> 
> v4:
>   - add Assisted-by: tag (Greg)
> 
> v3:
>   - make vhci_attr_group static, drop its extern from vhci.h (Greg)
>   - drop stray blank line in vhci_hcd_init()
>   - fix indentation in vhci_sysfs.c
> 
> v2:
>   - use dev_groups instead of moving sysfs_create_group() into probe (Greg)
>   - add is_visible() to keep the attributes on vhci_hcd.0 only
>   - move vhci_init_attr_group() into vhci_hcd_init()
> 
>   drivers/usb/usbip/vhci.h       |  2 +-
>   drivers/usb/usbip/vhci_hcd.c   | 36 ++++++++++------------------------
>   drivers/usb/usbip/vhci_sysfs.c | 21 +++++++++++++++++++-
>   3 files changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
> index 5659dce1526e..f3993238f91d 100644
> --- a/drivers/usb/usbip/vhci.h
> +++ b/drivers/usb/usbip/vhci.h
> @@ -120,7 +120,7 @@ struct vhci_hcd {
>   
>   extern int vhci_num_controllers;
>   extern struct vhci *vhcis;
> -extern struct attribute_group vhci_attr_group;
> +extern const struct attribute_group *vhci_groups[];
>   
>   /* vhci_hcd.c */
>   void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed speed);
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 39e8faf4c18c..22b9bad7ca31 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1199,7 +1199,6 @@ static int vhci_start(struct usb_hcd *hcd)
>   {
>   	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
>   	int id, rhport;
> -	int err;
>   
>   	usbip_dbg_vhci_hc("enter vhci_start\n");
>   
> @@ -1230,40 +1229,17 @@ static int vhci_start(struct usb_hcd *hcd)
>   		return -EINVAL;
>   	}
>   
> -	/* vhci_hcd is now ready to be controlled through sysfs */
> -	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
> -		err = vhci_init_attr_group();
> -		if (err) {
> -			dev_err(hcd_dev(hcd), "init attr group failed, err = %d\n", err);
> -			return err;
> -		}
> -		err = sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
> -		if (err) {
> -			dev_err(hcd_dev(hcd), "create sysfs files failed, err = %d\n", err);
> -			vhci_finish_attr_group();
> -			return err;
> -		}
> -		dev_info(hcd_dev(hcd), "created sysfs %s\n", hcd_name(hcd));
> -	}
> -
>   	return 0;
>   }
>   
>   static void vhci_stop(struct usb_hcd *hcd)
>   {
>   	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
> -	int id, rhport;
> +	int rhport;
>   
>   	usbip_dbg_vhci_hc("stop VHCI controller\n");
>   
> -	/* 1. remove the userland interface of vhci_hcd */
> -	id = hcd_name_to_id(hcd_name(hcd));
> -	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
> -		sysfs_remove_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
> -		vhci_finish_attr_group();
> -	}
> -
> -	/* 2. shutdown all the ports of vhci_hcd */
> +	/* shutdown all the ports of vhci_hcd */
>   	for (rhport = 0; rhport < VHCI_HC_PORTS; rhport++) {
>   		struct vhci_device *vdev = &vhci_hcd->vdev[rhport];
>   
> @@ -1513,6 +1489,7 @@ static struct platform_driver vhci_driver = {
>   	.resume	= vhci_hcd_resume,
>   	.driver	= {
>   		.name = driver_name,
> +		.dev_groups = vhci_groups,
>   	},
>   };
>   
> @@ -1541,6 +1518,10 @@ static int __init vhci_hcd_init(void)
>   	if (vhcis == NULL)
>   		return -ENOMEM;
>   
> +	ret = vhci_init_attr_group();
> +	if (ret)
> +		goto err_init_attr_group;
> +
>   	ret = platform_driver_register(&vhci_driver);
>   	if (ret)
>   		goto err_driver_register;
> @@ -1568,6 +1549,8 @@ static int __init vhci_hcd_init(void)
>   err_add_hcd:
>   	platform_driver_unregister(&vhci_driver);
>   err_driver_register:
> +	vhci_finish_attr_group();
> +err_init_attr_group:
>   	kfree(vhcis);
>   	return ret;
>   }
> @@ -1576,6 +1559,7 @@ static void __exit vhci_hcd_exit(void)
>   {
>   	del_platform_devices();
>   	platform_driver_unregister(&vhci_driver);
> +	vhci_finish_attr_group();
>   	kfree(vhcis);
>   }
>   
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> index a7ede6fb3da9..d87d9e449d72 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -497,8 +497,27 @@ static void finish_status_attrs(void)
>   	kfree(status_attrs);
>   }
>   
> -struct attribute_group vhci_attr_group = {
> +static umode_t vhci_attr_is_visible(struct kobject *kobj,
> +				    struct attribute *attr, int n)
> +{
> +	struct platform_device *pdev = to_platform_device(kobj_to_dev(kobj));
> +
> +	/*
> +	 * The attributes control every controller and have always lived on
> +	 * vhci_hcd.0 only.  Keep them there now that the driver core creates
> +	 * the group for each device.
> +	 */
> +	return pdev->id == 0 ? attr->mode : 0;
> +}
> +
> +static struct attribute_group vhci_attr_group = {
>   	.attrs = NULL,
> +	.is_visible = vhci_attr_is_visible,
> +};
> +
> +const struct attribute_group *vhci_groups[] = {
> +	&vhci_attr_group,
> +	NULL,
>   };
>   
>   int vhci_init_attr_group(void)

thanks,
-- Shuah


