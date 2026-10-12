Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB893E3179
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800611; cv=none; b=JBlqU6hDls1Im1mLCqprjWBheoTpjuDC1HsBnzzQ+9gp34q4yttQx66g85+NaJTGmKZ66gHavqyyvGnzWC4oNzLO/3QT6msse+9NNDF7ShoAtqX+wmyWnK+QsZK3tJtoGGAJ7dryQIOf6ergoWP2uIbXVk9QGB5EqylTQvHrWnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800611; c=relaxed/simple;
	bh=IDdwL67v4rO6QNqOopp6U+IZA+rvoQANyZigLVP0fvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lt2zG59WG+u8Qm35QTUUEs+slEu/3ZSeqEVombFMaaZbHYZHV8H6kZeUkGmNQJRlkYz1TeZhmtByUUY39i2DxxKp6giKQvRPWe1XTyO5aAzdP8DLmrm1r9mSVmbrfLwaNsM0A0V2p/8hZ7E40osNUD7g+0zUUHfL/+suFHr4rB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EbabI0s6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EbCnblZe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EbabI0s6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EbCnblZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791800595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WMJvh9lEGijqsZWjeO3+cIRaZLpMo9guCvUBFf/dck=;
	b=EbabI0s6L7sEQpdIthr1fI4eHYOBDKXi3TG486UyOZiq5i7oRBHCR9QrrI/AwaUkE0i30B
	Kx/MCCK6g+iUtC9cP1cMBY5Hj6fojqJQWqZQ+0QmyvsO+aH6IVPSsRzyPlpSLpS9hw3eMt
	PC3M/1YDynn5/aJ1N7pxtTjwmMvkIqY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-n71MvNk2OPOaLpx1NXBm6w-1; Mon, 12 Oct 2026 10:23:14 +0000
X-MC-Unique: n71MvNk2OPOaLpx1NXBm6w-1
X-Mimecast-MFC-AGG-ID: n71MvNk2OPOaLpx1NXBm6w_1791800593
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a17574b5easo13441855e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791800593; x=1792405393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WMJvh9lEGijqsZWjeO3+cIRaZLpMo9guCvUBFf/dck=;
        b=EbCnblZe2t0cartQWRyQQxjetMTdB0B7OmLV0lFvMb2pfBrSyjyJBkRuEyM8yuAHVE
         M7P/OTR1iVB1yh6MccIFjFGGr1/TPc78xvUZ3U3HhwmbUC1ZRuGTaCmGKmjsHTRDD8wC
         quouNXInOLMi7eV0VfzxQR6FCLEHEuOHvhVdBRrDobcSOrXz8TfuN9QtWhpXpV8rAbIj
         VBbWkABpHHs7ScApgn4n3H7VjjNf7Vo8Hs83u3BpkJn6nDtBnAwyUgf8NgKcGUkEjfJM
         1+QsFuBs1jCRM3AdP/8SAobE3hdo2jJS9w+pKjZUlcbLSVk8CM4hZgYvU+v4dT7Xllwq
         Qtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800593; x=1792405393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WMJvh9lEGijqsZWjeO3+cIRaZLpMo9guCvUBFf/dck=;
        b=UM9CWb/Wn0Zf9ArELZInKW9Wpnz1siCwB6xUMrdvVrmIp46zsQYbFMvLCPy06ZH4E0
         m8zHAhOaE5aPLoqyQDocIOFmhjRQ2/9S3TN+Hsfuzx2v9tE5qutmgBrnR61cmakrSP01
         Xzwj8IjETCx1hgboW6s3Frd5WZrxXkDdD5zTn38lkrxWXrwKVauV/WnEpKr7jzJthir/
         kwtCO406S9+YOeNbTVyBsqNYCkrRHmKaInLH34ra6Ba8mSy+/5mzAWOyUgSB4edS1Aaq
         subV0YBG6W3ZT2W4PHif17ucQe5ovxPF+p7Cu0eKqNN09aImTkESPu+bpr7Gzyy5QfQe
         VQsg==
X-Forwarded-Encrypted: i=1; AKwUvBxyZFEqzGlTB28/qH8yeY0xhLUF3dF9WVNGOPp8kkhExNg60STJeMVSxDwBydr9IcgOIURcbd/iXmBncz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdByqpOco9t1O7Zfx6N1TsaxdoKwHxu2iMpTMojDcmGdNtmqHx
	SubMLcI/U6JDmtNRC5uiHQA3qhcRroOitvc51N+clkERPpybgB3kipao1RAQJSNJBH0fOjE3mru
	dOr7+erp06yxfXNnRdtF9oP5r7W3lXe6HqamxpCmgcjkikPlStBAHuTI0Guu+89KLbg==
X-Gm-Gg: AYBFou3EwnhreFK9Bjv5pUT3rz415/6epdllqfSb1Iq9o3hvh86sSWsfFntKOu6F51C
	ZHFEzndwfv1LIDsviYnOmjlYTjNefSCT58oV/UCS1UjTzgd3HWqD67BtqcgIG9y0bjMzP7sbdHK
	eEWZ2Tn3l5jezqAOGz2AYN2NVWKDopGmdop2htvGYLvaQ0KHqdEifuD4T90hdSQO9FLWKcX+WkQ
	YcHTTGaDzinCtXtLaK00e6d7qcUrdRofG3OW3bcnmKWQON7AiG75yQ2JR9fsUeAnK52DyOEmFGa
	oOgUf4Q7Sg1blsJ0R+c/Z05M44em9f/wNJNT7gdImoKj4Qtq2lfeMOG294UEowmuVlS6toxgcjd
	ikQ==
X-Received: by 2002:a05:600c:c167:b0:4a1:a3cc:3c5c with SMTP id 5b1f17b1804b1-4a1a3cc3c71mr12615265e9.16.1791800592709;
        Mon, 12 Oct 2026 03:23:12 -0700 (PDT)
X-Received: by 2002:a05:600c:c167:b0:4a1:a3cc:3c5c with SMTP id 5b1f17b1804b1-4a1a3cc3c71mr12613895e9.16.1791800591497;
        Mon, 12 Oct 2026 03:23:11 -0700 (PDT)
Received: from sgarzare-redhat ([94.32.38.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm109697305e9.2.2026.10.12.03.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:23:10 -0700 (PDT)
Date: Mon, 12 Oct 2026 12:23:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Stuart Yoder <stuart.yoder@arm.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Chu Guangqing <chuguangqing@inspur.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tpm_crb: Remove dead code from crb_map_res()
Message-ID: <asy0K_6VkuAn9rTB@sgarzare-redhat>
References: <20261010235500.2915629-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010235500.2915629-1-jarkko@kernel.org>

On Sun, Oct 11, 2026 at 02:54:57AM +0300, Jarkko Sakkinen wrote:
> In all the pre-existing call sites both @iomem and @iobase_ptr are either

Do you mean @iores ?

> both NULL or have a valid address.
> 
> Add an invariant for the expeced conditions and remove a dead basic block.
> The second block is dead given that if @iomem turns out not to be NULL,
> neither can't be @iobase_ptr.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> v2:
> - Updated the commit message in order to clarify things better.
> - Updated the invariant in order to address checkpatch.pl --strict
>   errors.
>  drivers/char/tpm/tpm_crb.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
> index ceb4100ba400..833226966fa2 100644
> --- a/drivers/char/tpm/tpm_crb.c
> +++ b/drivers/char/tpm/tpm_crb.c
> @@ -570,15 +570,12 @@ static void __iomem *crb_map_res(struct device *dev, struct resource *iores,
>  	if (start != new_res.start)
>  		return IOMEM_ERR_PTR(-EINVAL);
> 
> +	if (!iores != !iobase_ptr)
> +		return IOMEM_ERR_PTR(-EINVAL);
> +
>  	if (!iores)
>  		return devm_ioremap_resource(dev, &new_res);
> 
> -	if (!*iobase_ptr) {

Sorry to insist, but in the commit description we talk about @iobase_ptr 
can't be null, and I agree, but here we were checking the value of the 
pointer, so IMO this code was not dead.

But again, I know nothing on this code. So, if you think it's correct go 
head, I'm surely missing something.

Thanks,
Stefano

> -		*iobase_ptr = devm_ioremap_resource(dev, iores);
> -		if (IS_ERR(*iobase_ptr))
> -			return *iobase_ptr;
> -	}
> -
>  	return *iobase_ptr + (new_res.start - iores->start);
>  }
> 
> --
> 2.47.3
> 

