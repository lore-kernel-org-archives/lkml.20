Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B47B3AD506
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854287; cv=none; b=OKHQwyA98pV/dbwyOmYMMCGeLROJrvIBVdFBDEI6E0cHnVu+qZgMlyREn1eTRcvXgWtMPcbwWOKay9ahCw2+OOiwx6V8oCWlytZVCWuRKA7YvlNAXQxEmpRn6ytWwKd0R6DI0QFQRf+eul2/09Q8y9A2fq9G1MCcHqfqr57IWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854287; c=relaxed/simple;
	bh=TdLKtRb4SEvTKzu+KCQUsmzinljqSC9tZozsram1pws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJ/5kp42D+Op1lHrxrGike8isrEBu0K909vKFFjUPkRN/1TAMd2Dos49bo6ja/wzEnAVqBOXHW02qvK59Dk1z28AXAMo6g4DkpgXymqn26NpnNUWwGzGkKtIFmhIhgPHQN1Qjv0Ma49Nk2NR3n65fxK9x9hXE9+fwg/nu7YKvnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EbYkI2AU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnvan/Se; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EbYkI2AU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnvan/Se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788854284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uLFjRbxpszKYFTPYbV8IRN6QAJXJZc4bP6C5VBeyph4=;
	b=EbYkI2AUU0mtKFpqc3JKIPM3nbSB12scIICErNGM8dGdc8ZioFTgxsaX7L9nhNv6i1O11J
	8J6dFKPDEezJRSDNyGIqmsC+DtzQwa+QfAHzk5fiu4GlnTG06HPqVOdnSid1+lOzpYWb28
	76oaUnJ23lKO308GhHjtlc8ZS/RgjCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-AeDvMMXnNHejP4diXJOBxg-1; Tue, 08 Sep 2026 03:58:02 -0400
X-MC-Unique: AeDvMMXnNHejP4diXJOBxg-1
X-Mimecast-MFC-AGG-ID: AeDvMMXnNHejP4diXJOBxg_1788854282
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so26437145e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788854281; x=1789459081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uLFjRbxpszKYFTPYbV8IRN6QAJXJZc4bP6C5VBeyph4=;
        b=cnvan/SesNgXWdn3m2NUV/rJKOXqWOPgtzn12roNVFy3Q5STbexV9RjwgQk5yo2bto
         D4pZU8hbkMVFiMHBAhba8aU5W4hkix8VJRB4PiBggShGMsEsYKAQWfigtHfbtCj3mECY
         NLZhUW85fR5Q5dYwrKQfZyqXi9/8HfolY6KUn7s4Wz8f5DErEPDHPmdq7pQ5U3uWn8FC
         cRbBrdWl5aGR8quFDYIZ9DqoPSkw76nGrKyCsBLluk+zuDiKcGvuvSwmMh+Iqfz6TJ59
         fouaGE4dveTV6LV3Bec59tscs1j8Z+fIlVwBFdVsiVBuDDfKVI1gJRbs+31EMxqyPEzX
         nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854281; x=1789459081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLFjRbxpszKYFTPYbV8IRN6QAJXJZc4bP6C5VBeyph4=;
        b=fp4/p1pDisTLLBKZIHUvPf6lb7R27ZYeZ9XzNNxsrFnNO4WUAmsuuZSoJXMgyeaynK
         Q1yK69pL92VwGJ/eY2cLeArP1RZr1jdl+ukP1aWdmKumr/hBzvhSGqno0e5TIUJ9CbGG
         LVfry9dKAOCHtG5aOO7jm8LwtAH5LCOxykjKKKbVJa9P3VFh50phelLKSh0Nry3iejIE
         VLIDmKe7iYoBzlABKxJyzL4CSKrssTtn1JQbOmO7OQFXTq6mmL37jF/C4u2jLJkcB1L+
         AW0ZenQSruZ8n47faYM4GxVhiVY0yyunWLil21UG3uZishv4ef4cijLzbqtwjXHWgMVX
         6NMA==
X-Forwarded-Encrypted: i=1; AKwUvByv5LOjMCbbHgqhu+Mw/EP+mhG7Pj6HlSXByAQPjgt1ukDyu9dEsOTjS9616t5Dvd2jMnLQfH1oo+aHDms=@vger.kernel.org
X-Gm-Message-State: AFuF++mr1rj0hwZ6u9wDdVUm2/9qxUl0LGFsfkaPm9lYsvYKneu6o8/R
	biEDp7DYYxEVeDPsyZ2tG+R24Wp5i9/6WS+oTXb74Fk8k5lBOZuIU/mMW4+h1IEN7Zmkj7PkXiA
	3kHESLqyDp7CfxN00P5mn+aPdekw8RoAlJ1KU8bgq7LRPeZfiEWVRV008d3pwjNHskw==
X-Gm-Gg: AYBFou1dtRjHgK0Bd7TYf+Un7FWrtyvMnasQ880PuzhNHZQK1QBKQ0Q/Yys/odhb0CI
	DPvKwvxmJJl09/DspoGsfVpwVy7MHNL7Ha6fVFeyvdtKuXQFcIrUEsFZJlS4eyIkpGI9/JzKnU/
	yGVskDjlN8bwvQwJoCXa79pQwWLsH1HfjuMzraijm5bcYsU0QzSCTbAG6+pifOFu/aa3SmU3K1v
	Ffn+01jg4D8VghFWkVO6tDeq8Z2nJbQOqv4yI6TIOtZYuclrmAd6zId79+D5+pxNzldtLMSEunE
	zzZxcWIsVHFwtF8bzYr7uUAIxq0Q8nV+pYSuQDX5QnJFG3ldrVw201V52clEG3sev+kyapR38zp
	XbDfNO9s+f4/OXAYnSUyL4vg=
X-Received: by 2002:a05:600c:190d:b0:49d:72d:9ba3 with SMTP id 5b1f17b1804b1-49d072d9bccmr177643635e9.14.1788854281452;
        Tue, 08 Sep 2026 00:58:01 -0700 (PDT)
X-Received: by 2002:a05:600c:190d:b0:49d:72d:9ba3 with SMTP id 5b1f17b1804b1-49d072d9bccmr177643265e9.14.1788854280929;
        Tue, 08 Sep 2026 00:58:00 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm326431605e9.3.2026.09.08.00.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:58:00 -0700 (PDT)
Date: Tue, 8 Sep 2026 03:57:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linfeng Sun <linfeng.sun.dev@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] vduse: return compat ioctl results directly
Message-ID: <20260908035646-mutt-send-email-mst@kernel.org>
References: <20260908-fix-vduse_dev_compat_ioctl-v1-1-62264d9bfb8d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-fix-vduse_dev_compat_ioctl-v1-1-62264d9bfb8d@gmail.com>

On Tue, Sep 08, 2026 at 03:31:51PM +0800, Linfeng Sun wrote:
> The compat handler handles VDUSE_IOTLB_GET_FD and VDUSE_VQ_GET_INFO, but
> then calls the native handler. Their different command sizes make native
> dispatch return -ENOIOCTLCMD.
> 
> For GET_FD, this overwrites receive_fd()'s return value after the
> descriptor is installed, leaking one fd per call. Return handled compat
> results directly and use native dispatch only for other commands.
> 
> Fixes: 455a2a1af926 ("vduse: fix compat handling for VDUSE_IOTLB_GET_FD/VDUSE_VQ_GET_INFO")
> Signed-off-by: Linfeng Sun <linfeng.sun.dev@gmail.com>

indeed, I will apply.

Cc Arnd.

But ... how was the original patch working then? Arnd, what gives?

> ---
>  drivers/vdpa/vdpa_user/vduse_dev.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index 4dea4d6a3855..49a231bdf948 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -1882,11 +1882,11 @@ static long vduse_dev_compat_ioctl(struct file *file, unsigned int cmd,
>  		break;
>  	}
>  	default:
> -		ret = -ENOIOCTLCMD;
> -		break;
> +		return vduse_dev_ioctl(file, cmd,
> +				       (unsigned long)compat_ptr(arg));
>  	}
>  
> -	return vduse_dev_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
> +	return ret;
>  }
>  #else
>  #define vduse_dev_compat_ioctl compat_ptr_ioctl
> 
> ---
> base-commit: d7808b37da0a619cf1fa541c2384e783fecc2480
> 
> Best regards,
> -- 
> Linfeng Sun <linfeng.sun.dev@gmail.com>

