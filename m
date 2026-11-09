Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253554;
	b=gCM358I7mdUMPBnXzrx8rUyv99XlqShdEn25/7+WctKSRAqOw0sGfLnFPrDyJEb13yCv
	 80HdOuw/HAiqcjbgn/T7pYikng9kZUhRb0aWxqnLT5eWIKUzyfoHSCCrJ/Hnw2rby4x1J
	 /PgFUn3ayqYiYtOqIYZXp730b8zartH2f0G8Gvzwov8YBrQ6Bt6RrjmZcSJp/FD+J0XvP
	 E+oUh1I7ZHUhiMfBLSftMonf8NR8tS2ZLxYuJt51G1Bryr+84zLbWpky/2/6BMJdBTOqk
	 qZLjXxWxBir0LJsyavF704wCVKsOQCoUHUxDoIyFrFRWoxLYuF7162AqN4ONcpQlX0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=REA9zYS3lDwM4a+NO/u7pA9WoH35x7u2DKZsMlZFiio=;
	b=a0rPgeS++gbck+HYTLR5KfMGBt08afhxin0G9EDvUov6crmxEuCl16KFPmDZHI+RLgrR
	 fNvVz7rQPt4Za51m/TwZq16oNh2TDvMyOgblbhq4He35zSCrXJd0RzL7p07UuV9xPmp3P
	 JWthAhfyi02GUSxiHDCgN4/hzTAjQaT5dFukE3OqsyY5s+zpv5EcsREafueyVgHhTfo4V
	 uBQrEG7qLpGhViFVmD0PUwO7QQKpsHTfL9AY2twT7SEljimXY7kpaael+0wunOm04IiFW
	 ASqf4DFaUk4HrH1haIeDvVSo6QL3SwOmFx5FpEfqxwvG8iLwnE+WiFre00FgFy8d/jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UgmynCVR;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAE606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DAE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UgmynCVR
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so10015ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794253554; x=1794858354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=REA9zYS3lDwM4a+NO/u7pA9WoH35x7u2DKZsMlZFiio=;
        b=UgmynCVRiJZuJ67iWctpMTAZHaQwYKR6tzKsgkrcAG/rv1oglwJdEN0B8DsgDNnkGc
         BFIfsICxYcxSQarrveN9Rmx7vvN+pQLamaWPZusjCXWeJUhyz80eZEamVKcwGKM4dXOH
         URZQUeCTt7hYbXOvdCZqCM8R6aCfV25UjHVBOUMH4ue/0ABUuUX2FDUfr40nqCqF7WVC
         61Pa9s+VUle9A49kV1GOqijFcJ2H8kzwv9nHnoJEoLwQUXaVBxP1z+BNXN32qG2KlFf4
         dLglm1QL0NM5uW4r0VHXUhB4FdOe54Owf9IGs0PjWjtpb18d/XSjXBS4D9LZ14uczp7t
         fixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253554; x=1794858354;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REA9zYS3lDwM4a+NO/u7pA9WoH35x7u2DKZsMlZFiio=;
        b=D37JRgB6FngkAYZ8CUdv0vZtpC7I8Fg9JQ2ijP4C44QE+fD34NlJAgYfKQFs6+tJG4
         7gw/wm+lSIPKHHrwVPfXZxoHT7oXbGc9+Jr+nQDcSzB5ReYv2g6WISmD5Sp+dTOVWGYW
         tPi8IGEgAT02M9R2kbJ6rXL2RGtbKkLs7DsmPeRZ1P+Krj0LJN7nLJtSkScoDieCW1Qp
         55dW+aH88Z5+PFd7KkiiGTc9AYdAL87vCJIk27hGvxSFgwMCUhBK6QyCMn1SlScn1YLi
         v9fBkmJF5iWhRuvlaQfIw65OSvGbKMq4xnTNwHGVPNzYZCVLPDcCQKWgLP3gSOO9vkN3
         9A6A==
X-Forwarded-Encrypted: i=1; AL+hErEbG9vbOEUvEYe51eOfKRSH9OP/D8K8KXU+bQEj9t5mSqH0T7xl5KnUfKFegxMIap5cHN02XOuyeJlDP1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QtPu87tnc7lt79SN34uvc5MDWKOfUrq7+zS/t08R/vDxMNjmQ
	56UB4bfytEoG+XYAWdU9XcITuvEHRSCYEoMi20NlFaxA2Z59xcns3QsB2rTffoJwD0lvb01TbEn
	prSUjow==
X-Gm-Gg: AYBFou2tfuSAnAFp2KL3hNnMVAYtC/6uSFfLtTAQX/1jYv9VXgeRqQyTaiNYObtSyHb
	i30oMX2nwIazKTbGIJcyJiyajTubTIyPSlBejPNJEYP3qAl49nhiex/MuM4cvzfLD3YVCr5U27o
	Ea1Jm3gRYRMKGJhnz91455ab+sJOLXzBlbc6ZRTwzAu4VzkRYoIMFiaq+6w3KpOLFUDBO0ehuzT
	l+I+qsCVJdMiAgHe/Y3pdbOcngmEKpiEIKEk+RNzOfORudQM8/lypEZcrZ2tm6WKyAj4rNcCJ9N
	GMlnDIIFhq2ZGGHGdEkPViJhxW2drU2zqbGiMPaQGFbKH3az3Vf8TGtD2bFffhSI0JtAo04x1Gs
	pWQQMSdoQM+Q1Jw92c0tN18sojK/jYLS8Yxcz/Sv9j8AkhCodohHa/ZBhuE0MEcV8aqrUEzY7hv
	AYquCWLepugbdV3rTmYe9IJDjrzYonmreCQhrdganmcEkH58YTfB1ynPpBAijFdbY9NlzkBPV6k
	dy433uD+hNAehUU5AO5qgq1DOtyh2CjiBRYxGYoktQ0RwQsGylhjA7HsnkTpaQdD9NsKzgZ7qi+
	hxiClVFjUX5bL6+Bxa9Rpnp8oW+/rcfeCk8xz3LA72gXmZXq8pu/bfb62/ifpWz8qOrNehO60rW
	l1DzziSpy+g3JRVUdSWPfn0ZQY+66AXlYCCX7udEWh3GUOctgQ0RYpiy8hgtvu8DeVSg0uvVTD1
	LR6HS2gRsq1JPXi01NFQ1ANz+5BmAsrZ2nu8vseH2hijs3+cG3nVwP9MEOBJWeuIQzwK7Dn6EFW
	tn02qWxOq+J9Q==
X-Received: by 2002:a17:902:fd86:b0:2e6:1735:f645 with SMTP id d9443c01a7336-2edb812a739mr621795ad.4.1794253553217;
        Mon, 09 Nov 2026 11:45:53 -0800 (PST)
Received: from google.com (25.229.125.34.bc.googleusercontent.com. [34.125.229.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167973294sm674397a91.15.2026.11.09.11.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:45:52 -0800 (PST)
Date: Mon, 9 Nov 2026 19:45:48 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Adhyansh Verma <adhyanshverma2010@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust_binderfs: fix minor number leak on binder-control
 creation failure
Message-ID: <avIi7IPY5bVbxxw8@google.com>
References: <20261102144532.123432-1-adhyanshverma2010@gmail.com>
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
In-Reply-To: <20261102144532.123432-1-adhyanshverma2010@gmail.com>

On Mon, Nov 02, 2026 at 08:15:32PM +0530, Adhyansh Verma wrote:
> In binderfs_binder_ctl_create(), a minor number is reserved using
> ida_alloc_max(). If d_alloc_name() subsequently fails (e.g. under memory
> pressure), the function jumps to the error path.
> 
> However, the cleanup path only calls kfree(device) and iput(inode).
> Because inode->i_private has not yet been set to device, the eviction
> handler binderfs_evict_inode() returns early without freeing the minor
> number. Consequently, the reserved minor number is permanently leaked
> from the global binderfs_minors IDA.
> 
> Fix this by introducing proper error unwind labels so that the allocated
> minor number is released via ida_free() under binderfs_minors_mutex if
> dentry allocation fails.
> 
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>
> ---
>  drivers/android/binder/rust_binderfs.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
> index 5f020226720d..3f7ff0fdbdb9 100644
> --- a/drivers/android/binder/rust_binderfs.c
> +++ b/drivers/android/binder/rust_binderfs.c
> @@ -400,7 +400,7 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
>  	ret = -ENOMEM;
>  	inode = new_inode(sb);
>  	if (!inode)
> -		goto out;
> +		goto out_device;
>  
>  	/* Reserve a new minor number for the new device. */
>  	mutex_lock(&binderfs_minors_mutex);
> @@ -411,7 +411,7 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
>  	mutex_unlock(&binderfs_minors_mutex);
>  	if (minor < 0) {
>  		ret = minor;
> -		goto out;
> +		goto out_inode;
>  	}
>  
>  	inode->i_ino = SECOND_INODE;
> @@ -427,7 +427,7 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
>  
>  	dentry = d_alloc_name(root, "binder-control");
>  	if (!dentry)
> -		goto out;
> +		goto out_minor;
>  
>  	inode->i_private = device;
>  	info->control_dentry = dentry;
> @@ -436,9 +436,14 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
>  
>  	return 0;
>  
> -out:
> -	kfree(device);
> +out_minor:
> +	mutex_lock(&binderfs_minors_mutex);
> +	ida_free(&binderfs_minors, minor);
> +	mutex_unlock(&binderfs_minors_mutex);
> +out_inode:
>  	iput(inode);
> +out_device:
> +	kfree(device);
>  
>  	return ret;
>  }
> -- 
> 2.56.0
> 

Is this patch any different from this one? :
https://lore.kernel.org/all/tencent_8D7B76C623DA3A29EE73D38217ACB08AFB09@qq.com/
