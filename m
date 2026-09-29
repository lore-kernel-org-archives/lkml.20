Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA534B95B6;
	Tue, 29 Sep 2026 21:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718311; cv=pass; b=g2sF+sBqePa0KmJv2slCyiNbNV7gOqk9DLiBFzsvr2CLaAnYfgzRUyPHeHchAjVdTgKuU34IFE1kl9wUQyIAEx0KEjLT8Tk5jGZWuvpuEJ4t+geRAyIu4TKC47CbyIscNV18hONipSGU0hcNHIvQDGOutJk7wK1PBxuePbPsJpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718311; c=relaxed/simple;
	bh=AhDCjG+2EDzMeuWSo3ACu4OjpbkJl7HTe1D26AYlcCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIulRdM2RlSXhjFTZVp8feFG01eGRm5wUAwvfl1jomt5hqcctzoQQHsDsRZV+VOTrOH6ZyfGLfLslvtthZjNV5KOHmLvfkQub3YGJquA7iW25IOl5CWoTZ1J2viOQrWAVQDm6UOk7sTnLkqekebyjdRDOTZtyfKz2looGoe1h4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QRLjotwd; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QRLjotwd"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hvWtC37clz49Q6d;
	Wed, 30 Sep 2026 00:44:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1790718292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jmbMmBpiSqX5Ielk6c0V19Tn22PIfWy6yUMpcq85DZw=;
	b=QRLjotwdNeKdPNL/mp7an2E7iwN5QD3deLa2GXOP2pRIUFe5dEeF/GXPb3yOTDoWCiCMGs
	iFnyx1LGH+KH+rIqblDSNAEdxLycDElER4hmPc4MnKHQL998WtxDUMdJ7BX9skyIdvjpVh
	4o6HbpFd741HZUzTc/zjf8qr4PZPs0bMTeIHKflR7YIaBSbNrG+924kPhU4a+py3SJ4X41
	jaN8VTyow+7IHCp0/fIKVH7gkUopoACZH3B8KV8tJlljEiJCwFZcDni9bwywZSSmmikGFa
	kElW/B9joE+2vHbancGIT3hsetzBVlJUqXYW9Wv9B9GpcGuXFoJSys1Rmn6VGw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1790718292;
	b=D4OFB7zyuli5tHIgIl0adxDyfcMjdtd95DxjH17JuLMxwsaA4u9QZhrzAg+hmCreY21WG2
	2IOeUuTH+ET+hMAv3sDNQBH/A8uA44h+6SshU90Ncg7t5Mhkqk0b9CA9UDAbY2630X7wEI
	zhJlcVjWycHLUOuhmfFNd8pHm77Sus1Nka/zDDcUGq7kQUCqtbOQbsCWLxgnHYb/wtHhtL
	37VAKytfMqJCerKegxhZUPPtDMJ4kxa/o36yFPKJSLKLP+2BpI3cCY+FdpYfhquKYNVB6e
	C3UN6iAW9UuELZcjDHB8tviMUImsarJzMSZ4BD6DA91aFFhBa4eqfQhs5PSKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1790718292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jmbMmBpiSqX5Ielk6c0V19Tn22PIfWy6yUMpcq85DZw=;
	b=S04deSzt2V50MapSBZoOwTfDs15HfX8sEvuXFjDd9uSVAaXjkP1IdwrRQPY2qmCIs0rtO8
	HtwUoWE/DbgE9A5ZsT18RDh+pajWR84S65dnO11FEA1iRd22OwvKL/gXIx5QFeHI2/vRH/
	Bm/o5A/pJ+hXL5FL/hh036FmlxMBa3HXVag/SBHaoG5o0rPl2uhNimmfKmhUpa520IDZx8
	v+3BONhACIR0cRp7FjEtw34H/cyD8i78h1YJ00l/JQhzohl57VD2PW5/C/FkJZL3ZDoOcM
	Gk/HWI6iKk6sHtDOPS5r9LydLGyEBtqyIEz5JfPxdkAkd+c5c+DiIkIRod32dw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 77189634C5B;
	Wed, 30 Sep 2026 00:44:49 +0300 (EEST)
Date: Wed, 30 Sep 2026 00:44:49 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Nick Rogers <nick@getfieldwork.ai>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Brian Daniels <briandaniels@google.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-ioctl: zero the ext control built for
 VIDIOC_{G,S}_CTRL
Message-ID: <arwxUcipqjMjA1D9@valkosipuli.retiisi.eu>
References: <20260925080206.45261-1-nick@getfieldwork.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925080206.45261-1-nick@getfieldwork.ai>

Hi Nick,

Thanks for the patch.

On Fri, Sep 25, 2026 at 09:02:06AM +0100, Nick Rogers wrote:
> When a driver implements the extended control ioctls but has no control
> handler, v4l_g_ctrl() and v4l_s_ctrl() pass VIDIOC_G_CTRL and
> VIDIOC_S_CTRL on as a single struct v4l2_ext_control built on the stack.
> Only its id and value are set, and check_ext_ctrls() clears reserved[0]
> and reserved2[0]; the control's size and the rest of both structures are
> left uninitialized.
> 
> A driver that forwards the controls rather than handling them through
> the control framework sees that stack garbage. The virtio-media driver
> under review takes a nonzero size as a payload to copy from userspace,
> so VIDIOC_G_CTRL and VIDIOC_S_CTRL fail with -EINVAL through it whenever
> the stack is dirty. GStreamer's V4L2 encoders set their profile with
> VIDIOC_S_CTRL, and cannot negotiate against such a device.
> 
> Zero-initialize both structures.
> 
> Assisted-by: LLM
> Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> Changes in v2:
> - Assisted-by: LLM, per Documentation/process/coding-assistants.rst
>   (Alexandre)
> - Collected Nicolas's Reviewed-by
> 
> v1: https://lore.kernel.org/all/20260923160936.33445-1-nick@getfieldwork.ai/
> 
> Alexandre asked whether drivers should fill the structure themselves.
> The core builds it and passes it down, and a driver can't tell a
> translated G_CTRL/S_CTRL from a real extended control call, so I think
> it's the core's to zero. He's right that virtio-media will meet kernels
> without this, though, so the driver now guards against it too:
> https://lore.kernel.org/all/20260925080140.44696-1-nick@getfieldwork.ai/
> 
> Found running the virtio-media v9 series [1] in a VMM with a host-side
> stateful encoder: GStreamer's v4l2h264enc fails to negotiate because
> VIDIOC_S_CTRL returns -EINVAL. Tested on 6.18 with that series applied:
> VIDIOC_G_CTRL and VIDIOC_S_CTRL now reach the device intact, and
> v4l2-compliance 1.30.1 reports the same results with and without this
> patch. Build-tested on media.git next (arm64, W=1, no new warnings).
> 
> [1] https://lore.kernel.org/all/20260917171921.2810550-1-briandaniels@google.com/
> 
>  drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae70..b7d248ab7 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2357,8 +2357,8 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_control *p = arg;
>  	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
> -	struct v4l2_ext_controls ctrls;
> -	struct v4l2_ext_control ctrl;
> +	struct v4l2_ext_controls ctrls = {};
> +	struct v4l2_ext_control ctrl = {};
>  
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_g_ctrl(vfh->ctrl_handler, p);
> @@ -2388,8 +2388,8 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_control *p = arg;
>  	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
> -	struct v4l2_ext_controls ctrls;
> -	struct v4l2_ext_control ctrl;
> +	struct v4l2_ext_controls ctrls = {};
> +	struct v4l2_ext_control ctrl = {};

These are needed exceedingly rarely.

I'd declare them where the struct is filled now and initialise the fields
in declaration, too. That way there's no extra zeroing step and the struct
is only filled with anything when needed.

I wonder what Hans thinks about that.

>  	int ret;
>  
>  	if (vfh && vfh->ctrl_handler)

-- 
Kind regards,

Sakari Ailus
