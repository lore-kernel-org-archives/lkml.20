Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E22147D443
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373841; cv=none; b=lDPg+siuNf6giCVDA7G262N+f2Q5gNjVnU9fHSdu71myK2l1cPyBzj12oopilCQ5uU2qLRWQFeSKU4F6kPamNurndU4PR/jj6JlHWFS1YzJjfSnp6B8sG5KvfmnduZ1PYJ6eIawK5x8U99yEiWid7MfgXqMsEgrVUBh0F/CpMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373841; c=relaxed/simple;
	bh=bkBg8JCveUTUejP9e99kXQtFiCBa0ligbQaxs0F77wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwP0M6Rt/Ht+oFEx/qBvODSHIgcQyiBxPzUJZp0A4YHHTQbl16Fo0Xp4IIWChoMxHoKSlJUwHfULb5gV9aiBr+QSw7mYGEXpM27eWs5mwsdZJvLKc1grNMj3YQ1LY/FjrKXhWkBBXGKw+mkQslxsEjuHWUeDdHeOvHg1rFWqbD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk; spf=pass smtp.mailfrom=philpotter.co.uk; dkim=pass (2048-bit key) header.d=philpotter-co-uk.20251104.gappssmtp.com header.i=@philpotter-co-uk.20251104.gappssmtp.com header.b=sYnXJ1Jv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20251104.gappssmtp.com header.i=@philpotter-co-uk.20251104.gappssmtp.com header.b="sYnXJ1Jv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso14699575e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20251104.gappssmtp.com; s=20251104; t=1788373838; x=1788978638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1qbNEpl0QUNAOnPf9pwBA6dUXCvPRsbz2ZyzRlAtMQ=;
        b=sYnXJ1JvXYIy1xwxLmpJJnjSj9kRnEvoz/EtVDRJPEST/APRVpYVfRMLPFSNHkmEwH
         T8BZwYqseLDs7XfUznw+zvc1oarCLDovcscbJ8knVsI1FnpXFIvaA0cat6QVrWursVVK
         F/tANqLbvQexDB9+xuCp5ZSxd613Ne01fTvmpXMS7dg3a4BVpzImWLoyQUtq8FlB8yeS
         1SxNMU3ak0sYAxR+atlASbUswIkcGviQKRPMuRR6nvJsZBdSSYfIbhBfFQ7xuxqTOuuI
         gmwro8znsXXRJ8e60Ed/YeAaMhccHKc2bKH759iSd+/xgmyMxkFy1FBm2luUVscbkubX
         lSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373838; x=1788978638;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1qbNEpl0QUNAOnPf9pwBA6dUXCvPRsbz2ZyzRlAtMQ=;
        b=kOf+YuCqjeqbOt1VZpKM4K0vkhHj9JpEX+wE4bdFrQUTMyyyZ9RwEzYLTVyAXo51rv
         5LM9cR0dHfkNP8pGdjks0Nb31zJqfxgDQw0Jp/SGQlKowHpPogNztlBbYDja+4MM7f27
         X2TrT0sds+7VcXWC75sVOxOHN7ZOf5eUwrbaqNH5SKsPooUJQiSmDgmQK6J+cCFilQDq
         j6J3n/rIKFjPoN0RpTBAuYvV593396pRv/T9nDqv1s3pwxb3vyFtDtGIEHX11oiGAVn8
         zdMa2reWC8N7EB075Kz2I35F6sxpNVj1jlx/UgvdqE9tOSvb3QrC3NWlj81G2BFaI8zk
         ED0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTqT6C2jjPDsmADDXoQVDA+frp4FsZzooX71Ik20ZCe7prfFsUrH+qTaBSTNRwxo2NfnGdNadenCAimvc=@vger.kernel.org
X-Gm-Message-State: AFuF++nPP8oB8HQ3yQQKLzc5H/t2PlJ6z3d7K7KZixI3IEFa+TOBWRtQ
	s3GmdasOzw9eJXjajrgSDfQG7KtAMhPexmflG+OTYtCG5QUoDsWDrI2wNb8VmKJ88jA=
X-Gm-Gg: AYBFou2icx9UF0i3y1g7uGDIzFH8P4uLue04hfwP/CAZSgauRev8fEkCYzHC7bcFOiU
	aEde6U9YhEZ/rY+4SasGZztYjwb9vHbWTmOO2XGeLYaeF+csafd96SOXUzTfLds9VvLuBr1givY
	HRzNJ02Dy50aEeOrLrvpPMOOgUwYuh8rAboqcYW6uojizKSVrUYTRDhQpaRy4REXdzubchAWDZ6
	9Twv9/53hzoptR8xiiL3syiWX6B5uxumfnfUxTqgXqWXjAGs8Hzv+jX/TdG1uYWelfwoStobTNk
	rWdXV/5VE8jVxY61uLuvE+wReR5gD2k0JBhjzBCk6i4aDo/gtJukFbV/4/8ZN77hKmBTFlppxeE
	C1NsHABucu7sQq6umVBs3MFIHibxTTKQLfjxYPcHFaYFmiZqPFiv/eEct8vOXCS0F+SATgGubmH
	ZEBER9tc+ldkpsaEyWqXfQ2pb046sX8Y+KAPISkB1cKF9ZPdxoxr9TEJUPPoBLC49G0mmK0lZpJ
	6uUEIxQhKWYtDGTM0Qa1yMbL3rrhCkALQKnieQpTY/G5jE=
X-Received: by 2002:a05:600c:8012:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49ce5842473mr140567475e9.11.1788373838366;
        Wed, 02 Sep 2026 11:30:38 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm9134555e9.15.2026.09.02.11.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:30:37 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:30:36 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cdrom: fix brackets
Message-ID: <aphrTLxLO5F2adsR@equinox>
References: <20260902125431.696887-2-manuelebnerli@mailbox.org>
 <d254a0d6-83e3-4f67-8fbd-87b5ad3b2849@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d254a0d6-83e3-4f67-8fbd-87b5ad3b2849@infradead.org>

On Wed, Sep 02, 2026 at 09:46:58AM -0700, Randy Dunlap wrote:
> 
> 
> On 9/2/26 5:54 AM, Manuel Ebner wrote:
> > From: Manuel Ebner <manuelebner@mailbox.org>
> > 
> > Fix missing ')' and add '()' to function.
> > 
> > Fixes: e327cfcb2542 ("docs: cdrom-standard.tex: convert from LaTeX to ReST")
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.
> 
> > ---
> >  Documentation/cdrom/cdrom-standard.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/cdrom/cdrom-standard.rst b/Documentation/cdrom/cdrom-standard.rst
> > index b97a4e9b9bd3..b6dde1d1eaaa 100644
> > --- a/Documentation/cdrom/cdrom-standard.rst
> > +++ b/Documentation/cdrom/cdrom-standard.rst
> > @@ -1014,7 +1014,7 @@ How to update your driver
> >    just calls to the routines you adapted in the previous step.
> >  - You may remove all remaining memory checking code in the
> >    *audio_ioctl()* function that deals with audio commands (these are
> > -  listed in the second part of cdrom_ioctl_. There is no
> > +  listed in the second part of cdrom_ioctl()). There is no
> >    need for memory allocation either, so most *case*s in the *switch*
> >    statement look similar to::
> >  
> 
> -- 
> ~Randy

Hi Manuel,

I concur with Randy, looks good to me. Will send along for inclusion.
Thanks for the patch.

Regards,
Phil
