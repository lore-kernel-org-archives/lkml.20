Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604594A2E21
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359915; cv=none; b=DgIF6T/qkm1bZB+YbiXW5tAFnMnSee8M9Z3X54BJiQ9S2UaQ/4+wcmqEnO3RHEp3wyi7tq6/9V6ms4tgzmuZ7Cyqmr6mpeSmD25NZ5yQ8Yi/NGkZ2mIgDY2edlqc9KBamR0/fgd4MyEuTT7No6oYIbt7rsEaPsyvxVCMaX+XvsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359915; c=relaxed/simple;
	bh=+1IDDljIxSMHafSRdVxB3cfBHwPZvhJ3wm0LqMjtL2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7wrvugL5RUcPECZtajeT3oRCvbkcKvmigk21wcGLsjvnDWUvTY79FE00ci9XZYvfDlfaRnNUVEHMGWfL4XL1NzYUTR3H7uibM3jPKZwKTLdEaO8IuRJeXsjn03OLgMG0P1ioaE2K1uQ1FOehQzpCDV6wpMiIP9+P+opK0FIr0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uwrOBEgG; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uwrOBEgG"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92ed19f4d60so112312485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788359912; x=1788964712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Z/b4QhpQvqmWwtZHPfVGo84g0AhpzBEmvQoIe1Yy7w=;
        b=uwrOBEgGR93sslE2Y0YpeRcNw8c+bEzPgsHwN73ng17o1ZJfEAybRdEOQsFlqwQLl2
         cUzowflqwd0eruR0TygJK/5YwbOX0x4P5ROoxbaHcsOmYpeGaF2fJV7J3uYc9K/lSa68
         panr+BWYqRYGqreEZEGnI9hy6n2vEdBNYKhXlTxvyGk3KJq6ECF36X9qB7CPgAXqbFzu
         z5on/+qmhxD5pvaeWwmj+n9XWkXxGEy7mI5Fvdz0oJe1FuFkAC1YnpqV31WzM8GkDWrK
         xrH72ugmPcp2vUVyCbqisU9w0Af2Wv/k9hDNH9lE0hW5QZmT2GFh0YEo1sgB0pYy7/7o
         Rmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359912; x=1788964712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Z/b4QhpQvqmWwtZHPfVGo84g0AhpzBEmvQoIe1Yy7w=;
        b=fSvMULOMe6FAE2zkHBcv4v/UPohMLoAfBY8DO2C9DBfiXAEUdjQJGBmNUFCjJSp5nc
         8iVrVsEDrISJSdzPwQGCU6PaTljGWOMmJX6aLmAcbzIlPbSAnqwUqaU+hxQbbUhGzXE0
         Exezp3MpkpZ07Tv6eWh1pPDd15DTDhiMZbSizmRn71uNtKYz1gA9p985y7JPPe1KhnBT
         srfwpePja71LNDzOSvcRTwQeOv21f/VCLiQceA+Rd9frnhqQiHzHc6QieACV6L+uI4te
         HY22bHlqRKfS9sVJ5azcCx9tGKU21m+hsT1YcmmPXgKq6qWfA4SjXYlG8jqjjezpXYiW
         7dVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPzirvhH1tdxMEx60Gm0aHkd0eDyNjV+sJNzGBv7drK/13PU+oEGZQQ4hredFO8MmxvGbL3beaLuNdNUs=@vger.kernel.org
X-Gm-Message-State: AFuF++nDEThNDuIWAQY+iwPoTupuIQltn/LfAqBjL9D8SOcoaT5FB9xt
	k3Tu5B1RpuLVcn7Htk3kSc8lsD98cZulsUMFK7alPq4XICK01DMJCqDyFPWVFOt3pqbk/d5ABij
	YN94=
X-Gm-Gg: AR+sD13N0NtA/uuAsMNChOyanlj/VctI8D0sbFWLyaUXVHXSCgJtWryPQ+9CJ+Qm13m
	wfUHGqHWAllCM0OaDeG9aJcMFk7k6yGEPnEsyDRP+XHJbsel4v4PAi0lepTr3+VfNdSlwPBV1yD
	r5/pWOiAKNUahs9HfuBLKCGvrl2eaXZu71dTqPb0ZPLP+P1x9s5G76aDuRMD5RcJnfU4ipzQZf0
	cM+pvPGnA98RyAaFHNxre6QxRHrAjHjXAhn53Covq3tP2KEyFbLmNaE/EyW8n3UaJjPJLrmF29Q
	wuIdra2/nH0mENptg9NWnFbr8iFb40386wmoZJgof5pSiO7ETVc76Xcwu6UkCbfJLfY9c3Bk7cr
	5ehZhjH8w5Yp4PlSjw7BJcXGAveo3UWb9EAB13kC13wKSy/RSeSgGKUzVzctk5BbZW/3UN7FoXm
	Jl6qCm41hfO8AAWmzi64lJ407FhRQD0+l/o9KJp6yGq6GIIa/jhctzxKGhN69imhfRblmBpfUB9
	psVPgo=
X-Received: by 2002:a05:620a:4446:b0:936:9253:897a with SMTP id af79cd13be357-93965a3fda9mr380173585a.9.1788359911966;
        Wed, 02 Sep 2026 07:38:31 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f153035sm224286785a.5.2026.09.02.07.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:38:31 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:38:29 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v1] USB: gadget: Fix UAF in gadgetfs_fill_super()
Message-ID: <b99e8d15-9031-4d77-b1c1-2bd8cce6013e@rowland.harvard.edu>
References: <20260902050127.3767049-1-rafad900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902050127.3767049-1-rafad900@gmail.com>

On Tue, Sep 01, 2026 at 10:01:27PM -0700, Rafael Alejandro Diaz Cruz wrote:
> UAF is caused by syzkaller reproducer forcing
> the failure of gadgetfs_fill_super()

Just a minor comment: The fact that you used syzkaller to cause the UAF 
in your testing isn't relevant.  Memory allocation failures can occur in 
real life, without fuzzing, and the driver needs to deal with them 
properly.

> When gadgetfs_fill_super() fails, it's error path calls
> put_dev() which drops refcount inside the_device to 0
> and frees the objet. But the_device pointer is not
> cleared, leading to point at freed memory.
> 
> VFS will then call gadgetfs_kill_sb() after mount
> failure leading to put_dev() to be called on the
> already freed pointer.
> 
> Fix by setting the_device = NULL during error path
> before calling put_dev() inside gadgetfs_fill_super()
> so that gadgetfs_kill_sb() skips put_dev().
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
> Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>

Since this fixes a real bug, you should add:

CC: <stable@vger.kernel.org>

> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

>  drivers/usb/gadget/legacy/inode.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d87a8ab51510..3e2bce7543d4 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
>  	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
>  	if (rc) {
>  		put_dev(dev);
> +		the_device = NULL;
>  		goto Enomem;
>  	}
>  
> -- 
> 2.43.0
> 
> 
