Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658800;
	b=24n/Kh4Vgsktrc+GfkWMoP7pyKNVtqt4u9fF20ZqhikOrsPeg3QE6OjdKc9glPjIO3qR
	 UX37r0+9EwsABv3xMp1FWeuTQHrmcSE4CIIeiyoGohuaIS7UZ/zaa7kMiOkqxdy21GhjA
	 iqXYkpSuRq7jFw5gke9oHr2IkRLX3u0RGpzt/EqOQBtvYq7S7oOE59aHEDv1U1OG60hdu
	 P/6vqf/6mp5WUqTlsOMPvfof4lfV2bfoHaMNPCJbJPMP/OoIOPVcqcqJQzg7KkCfYNrgK
	 PUBs0LJl5KSFYzcXHWO5/Cw1lPg+l05MMPb+4z/t7Pz0ZrtfHOJ9UiJR+M2nAmd4O9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nkM3J4QAu8kIsGHpB1EKb0NRF0JxtY2T/gqGpQ/nt0Q=;
	b=e/aDRWUX5hx0In5wJ8aHnG4g0+Vo1+byQM5qoPOb+fXWd4cihpbfwjdl5b4HKqdIwXsw
	 voKEzipMpfXmlgTpj7qB2bOsme2DvOKGvbDL5Fh0Cgo5PBmCMNQM+Z5vw98j2R+NR6W/x
	 5mXw12BMA59aWLAJ/FZgmPT8OHQANEQKYUqmfbRPlXoxSjgdtEn6oz/ijDkQp3ATiwg7Y
	 wsoZExt0iW8LghNBln0bkL/uH8q/PWS5sGebm8Hy4BY1EVBpdQRne7BGZlSomA60e9aq1
	 BQZx1o0RwypJqVhkNBObc7Tn1x4xultaCiUvHDrL3JPS4nmQQoyQqbsoZJb5lHjPXag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zvg2B30u;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5C606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F5C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zvg2B30u
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e30c26a4so402487066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658797; x=1795263597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkM3J4QAu8kIsGHpB1EKb0NRF0JxtY2T/gqGpQ/nt0Q=;
        b=Zvg2B30uBzOFFo54OpfHCzqSK6TOyxTRmwNZV7t2nfrBwunaCrRH+5tI09/jIosXZS
         GdYk6iMfyO0nJ3moVzjaSKnXCCWxcV1Ye+R/4YjiwdwGG8ofIv4PWH24MjP/VV4CkNiq
         nSM7j6UNEdEDdNWpjUjn43q9YL/wt1IFltOrsPhL2VYrn8g/yyR7Uz6PFelA0j1tolIT
         QTqiv37OCVMy+5oEwlNBsw2cKiejzgZGAC7AZW2QPAu9cR2dMcfIteYf8vq02JyCIN53
         /PYiFz/vA+fp7KPo0fCiRfu55fCeLd5qLFIcUMGbAUVH1mkivaDzQTprXnn5n1PDT9pn
         6ZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658797; x=1795263597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkM3J4QAu8kIsGHpB1EKb0NRF0JxtY2T/gqGpQ/nt0Q=;
        b=dde3tNTexnUYQgvtI6hmVecfvydls/v73v5Pt+NG/EyDhFFwNE2R33Q/rz7GOX5S5z
         A5kgC4VzV7gsjWyoqGhJixjd1bH+nb3vFYxKjAdL6Sh6OkZkhVmHudk1ActaNbR4wayQ
         UKrWwwfJRf2iXoMqvzEAHvIGD+nTx645V9VJAv9OHNwolNTzrqQ4jbrsvIOrr1spid8A
         5IccYqLTGAddmb1Dy7ikPSWNcEzHEoRK0/y8uclg2V07+qaOe6xShdtBJGmRQeDuofyR
         haEj19kZ87yTm2sVfWFMaFT275QpFsHJ9ipIw6guDqBcB9uzn8Y1VY0irrmC/7AXpy5q
         Epjw==
X-Forwarded-Encrypted: i=1; AL+hErEmsiQK8op7QPwX7jjIc7WIfHJ8tKgMkmdOtDHQNz3Ui0UBBNW688mbQcC7/RNsqgH0Zq8wkmKWDAT1qjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yeeYRUo2sfeeYBqCBkROmc4jMCsEE4lZLtCJe2miL7xjIWjQk
	Pu5Fl5h1RidD5Tv1eTWwNoPgDFWPiwvKdZyvwVnkBql3bFfEwUHmREIM
X-Gm-Gg: AYBFou3yXmm6Xu3R0/8UGWyIY9PC9D4roJ2q3mrj2/cq1ZUj+kDN9iAqeMEv7OIlh9l
	xVIher30KovQ7UPZxQunuwY4/9J7nNKVYyoOmvcWq1Ys11YXaEjSH1YxqfvC5AgKD7XEiYkzNsC
	gqf43hN6hJ26dXGceMUBqWW1S0b3CuA1b2wRHpgdkQDNk54mSV1neC/iLHFEepfYloWmJTHU6le
	yNcgg6ZevFrs7/R4a6X9fN4ichx0q0xa6ZfoP1Id1mpvguWo383xduxXmIgABobjd+xjT2A4ojE
	MgP1UOK+brJeWQPpAx8PzhIrHBkZlq7I0rwtSMEo7FXafSKAS0l9srU6qh3Jh7ejdtUQ25SzrLm
	nqMfHFW6cojgLmCablbQAyZhC+1k7E4soxX6iBXfdim3pWNxmScprVK4O4Vr9sQGsMXsUoXuxH5
	DnQc5s4wje9SzZDyl+k2c4Q+Kh5MGpa7vAAbQJpPdsQde9Ao2tJiCXXuddudpWUFXCeSp/H+jB6
	M3Mgmram0lOgiI5Sr274H1Z7zysIvhcN2UD5gQZHGWKYzyY40g8syZ75/Qti3NL7SdIzkuTrcsD
	Jb36LaduexB51FNusayur9JLiSrUxMTUrwMHgdrAZuyapdcrhVQJw6PPvIDe/VvRBIHkN5gyOFU
	RGrSJhehi99Uu
X-Received: by 2002:a17:906:1001:10b0:c41:4512:560d with SMTP id a640c23a62f3a-c5096387b02mr309942166b.16.1794658797424;
        Sat, 14 Nov 2026 04:19:57 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5ac2asm211518966b.55.2026.11.14.04.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:19:56 -0800 (PST)
Date: Sat, 14 Nov 2026 13:19:56 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Shakeel Butt <shakeel.butt@linux.dev>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-unionfs@vger.kernel.org,
	bpf@vger.kernel.org, linux-nfs@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 10/12] ovl: take freeze protection when storing the uuid
Message-ID: <avhR7DbNbVDCyPDO@amir-ThinkPad-T480>
References: <20261114-work-fs-frozen_writes-v1-0-f5ae61c898b1@kernel.org>
 <20261114-work-fs-frozen_writes-v1-10-f5ae61c898b1@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114-work-fs-frozen_writes-v1-10-f5ae61c898b1@kernel.org>

On Sat, Nov 14, 2026 at 11:47:17AM +0100, Christian Brauner wrote:
> ovl_init_uuid_xattr() stores the persistent uuid in an xattr on the
> upper root. That happens after ovl_make_workdir() dropped its write
> access to the upper mount and before ovl_get_indexdir() takes it
> again. So a freeze of the upper filesystem that lands in between lets
> the mount modify a frozen filesystem.
> 
> Take write access to the upper mount around the xattr update.
> 
> Fixes: d9544c1b0d9e ("ovl: store persistent uuid/fsid with uuid=on")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> ---
>  fs/overlayfs/util.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index 521717209b2e4..67aa7b71e9c83 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -829,8 +829,12 @@ bool ovl_init_uuid_xattr(struct super_block *sb, struct ovl_fs *ofs,
>  
>  	/* Try to store persistent uuid */
>  	set = true;
> -	res = ovl_setxattr(ofs, upperpath->dentry, OVL_XATTR_UUID, uuid.b,
> -			   UUID_SIZE);
> +	res = mnt_want_write(ovl_upper_mnt(ofs));
> +	if (!res) {
> +		res = ovl_setxattr(ofs, upperpath->dentry, OVL_XATTR_UUID,
> +				   uuid.b, UUID_SIZE);
> +		mnt_drop_write(ovl_upper_mnt(ofs));
> +	}
>  	if (res)
>  		goto fail;
>  
> 
> -- 
> 2.53.0
> 

