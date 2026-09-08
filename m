Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9792553A88D;
	Tue,  8 Sep 2026 12:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869643; cv=none; b=QqMRlATq93zaV/NYLalSE9nxDIMrmdIbxgcNs4U2N5GiyEm0PgOueB9wAQ9U3bjPa/HkOle05PNX8jp7dM32mNJG8qGF2p1/o8OVociSoNsa4c1hEGE3Jhh73qtPv/CMySCgNZwad6ODJF8Kl7WSsOL+yy38ZkDGGRKDfy0ONb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869643; c=relaxed/simple;
	bh=iQwe+29YDoknEaFxd6AzGS0RHPiNwtK21Yn6SRenzgg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ss7bn6H8g/NtVab6m4JYne+TFD8oI3QA/dt7uMD9PZBH9rQFqx5AUYJXd1xYizU8Eg4360rYWFgAI65XnaNLzeJkT+KnSyGBxGpsHMXsjjoicUNt9OwHoRCvpBWpPuPoXiQvL6l2OtGcIrZ0a4dKE6g5ZzVSHOpXWGdtErkd4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNr6x3ia; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNr6x3ia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923121F00A3A;
	Tue,  8 Sep 2026 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788869621;
	bh=oqwyWCvNJ6P6oUdMwoUCml51kC1+AGWjzeei46hOJno=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=oNr6x3iacKiFtLiwJwmLue48h6YUOIJxRCZTjQfGuyuPDh87bTWJm0hUcjqljr3CW
	 sO8phBVFz1yASYM+JcqRucToMBb+KuzkPHTDyFkhRvkvKKbBBacnjIrmxHkDGslEvU
	 f7EsGu9zSmxpJ8O5v2u5aKUl+BQrv9m2+aLyqZ0ZtR5Al+30t67nN3q5ohqNAp6Co4
	 Qj7suD4rOEI++QdfDzIsXax8kA95q1Msi4ttkPassrPYYtFTIjqIRn5njeuyFHAA8+
	 wVsJcwhCbLppCwk9qAtoeERFwkK3iFr0UhsxbA+1ah+UoyiMr5o+8+o/Is+chk2yg/
	 yNIVcmbDgP7ww==
Message-ID: <891a848f-96df-40eb-9daa-f0812915d603@kernel.org>
Date: Tue, 8 Sep 2026 14:13:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH] media: usb: pvrusb2: fix slab-use-after-free in
 pvr2_v4l2_dev_init
To: xiaopeitux@foxmail.com, shuangpeng.kernel@gmail.com,
 mchehab+huawei@kernel.org
Cc: isely@pobox.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 Pei Xiao <xiaopei01@kylinos.cn>
References: <6C2D160B-37DD-40F0-B8A2-089B8CAACB58@gmail.com>
 <tencent_B85DFB2210B877A85021C1BC064E70E61C09@qq.com>
Content-Language: en-US, nl
In-Reply-To: <tencent_B85DFB2210B877A85021C1BC064E70E61C09@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/06/2026 03:47, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> The driver attempts to register the same video_device twice if the first
> registration with a specific minor number fails. However, when the first
> video_register_device() call fails, the underlying device structure is
> released via put_device(), which frees the video_device object. The second
> call then uses the already freed pointer, causing a KASAN
> slab-use-after-free error.
> 
> Moreover, the second call always uses -1 (automatic minor allocation),
> which is redundant because mindevnum already can be -1 when no fixed
> minor is requested. Keeping both calls does not provide any benefit but
> introduces a use-after-free vulnerability.
> 
> Fix this by removing the second registration attempt and using only
> the first call with mindevnum. This preserves the ability to request
> a specific minor number (when mindevnum >= 0) while falling back to
> automatic allocation (when mindevnum == -1) without double-registering
> the same device.

The video_register_device change that called put_device was reverted (it
was a bad idea), so this patch is no longer needed.

Regards,

	Hans

> 
> Logs:
> BUG: KASAN: slab-use-after-free in pvr2_v4l2_dev_init
> (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1221)
> Read of size 4 at addr ffff88810a2aa4b4 by task pvrusb2-context/2009
> 
> Call Trace:
>  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
>  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
>  kasan_report (mm/kasan/report.c:595)
>  pvr2_v4l2_dev_init (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1221)
>  pvr2_v4l2_create (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1249)
>  pvr_setup_attach (drivers/media/usb/pvrusb2/pvrusb2-main.c:40)
>  ...
> 
> Freed by task 2009 on cpu 1 at 594.064509s:
>  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
>  kasan_save_free_info (mm/kasan/generic.c:584)
>  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
>  kfree
>  v4l2_device_release (drivers/media/v4l2-core/v4l2-dev.c:225)
>  device_release (drivers/gpu/drm/vkms/vkms_configfs.c:690)
>  kobject_put
>  __video_register_device (drivers/media/v4l2-core/v4l2-dev.c:1080)
>  pvr2_v4l2_dev_init (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1218)
>  pvr2_v4l2_create (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1249)
>  pvr_setup_attach (drivers/media/usb/pvrusb2/pvrusb2-main.c:40)
>  ...
> 
> Fixes: 0c0d06cac63e ("[media] rename most media/video usb drivers to media/usb")
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Closes: https://lore.kernel.org/lkml/6C2D160B-37DD-40F0-B8A2-089B8CAACB58@gmail.com/
> stable@vger.kernel.org
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> index 101b2e9fbaab..f9df813ca09b 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> @@ -1215,13 +1215,10 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_dev *dip,
>  		mindevnum = nr_ptr[unit_number];
>  	}
>  	pvr2_hdw_set_v4l2_dev(hdw, &dip->devbase);
> -	if ((video_register_device(&dip->devbase,
> -				   dip->v4l_type, mindevnum) < 0) &&
> -	    (video_register_device(&dip->devbase,
> -				   dip->v4l_type, -1) < 0)) {
> +	if (video_register_device(&dip->devbase,
> +				   dip->v4l_type, mindevnum) < 0)
>  		pr_err(KBUILD_MODNAME
>  			": Failed to register pvrusb2 v4l device\n");
> -	}
>  
>  	pr_info("pvrusb2: registered device %s [%s]\n",
>  	       video_device_node_name(&dip->devbase),

