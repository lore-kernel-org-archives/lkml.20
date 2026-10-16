Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501F9282F1D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140427; cv=none; b=Q0DR8vtLN2V/YSXaJ3GutcGYMN/qwKX77hhoXbBFLi/iAehVJnF4zrhgvU+TPCz7MWfAwZiB3bdHAmcSuFm5BmC/6xb3jT6NGbfdOwhtrEUPb7G/c5DSWNkQBK+4MazOP7Ezo3T/JGUzkBiIZ/JReTRiA9cDCwA+aK7knRTZZmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140427; c=relaxed/simple;
	bh=YjG91YIz3Zerv4zWRDx1TpDi30zCwvUPs7vvdFiWhk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fH5muvnA+GciaCNvnQR2r8B+ikHt14kngq5ooMDw8V2K/nuqKrmbKrwaVJDSSA59Wed0O5/Wj76hMlRfHQsjjueimsIHYTSvvVP0Q9OLnc1BOUgCnFUWiu3UpXawLy1EqJFrH+3H5FTVQGK0bvBNwHi+vfaEHD9hK6A0O+ll1QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPIfyg74; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPIfyg74"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso44346255e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140424; x=1792745224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQ72dPFO/iBJ1HEQWMn0AbHuW9YDjx8PElC1gghKO1c=;
        b=XPIfyg747Hl4DqZJKgKzG7kb/8EtSKki40NRecok7H7zqS8iaq2MFIh2+WVaSxhMgq
         NxOXpqROZFEvlELM7NXLMupn6+X0Qg6puKS0klsE6PsqtF2Yu43HAgFHvhirgOCtEenU
         VDEC4XQoJPkFFP3hT8b3P/lNZLZ1qlm7qhXmEYB61zpWPL5DJyg9vN6eb03RS+U6Uq2S
         sckqsolYx64CNW3m40beeBzFt/GidITZhDdlyRwr/fQcaQQsEYvUMpDA7OUsERM1UuwP
         7uK8zq8qxEuN+qRKqowIVELZ0eYH4dZdWWiEoNdsnkCXSC4LN9A8QeMJSR2PbHqCpO91
         he+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140424; x=1792745224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQ72dPFO/iBJ1HEQWMn0AbHuW9YDjx8PElC1gghKO1c=;
        b=ctVjNI1RzJjs4QuTiLTlIjhdfOUQubXqV0gz3pMoj2wUlyGZvKerVwbYaLzY2RqDtc
         ulldQGN/fLLtpZo4Ugvy5sX/LuFiMs1kGeLGVPY7kxVeJYxqdm2fo41H3KvTRn+YVmLj
         C6pSGx4UYRBSw4BAX7FoDH4dFW5OzVKjwU+yM3436AvE5udLLBDZN/6u1ttGfG0RUvVc
         ZZsFOXcLvuBLdt4oHbg07isC3rPtcixvz60DlzUR0fIJXtqLb7uas2swDN1aOrMjRS9i
         ozYdY3P5Ny2iwsXdbT32ePwbLXaQW/s8x7n9PfOYt4ny350o7K1VaU0XhPyYC6Tmhmtv
         /LhQ==
X-Forwarded-Encrypted: i=1; AKwUvByk09Y+4lcensN+y1nY9vEHzOoYUOZOZR1Iiau1OZ09l5l4me+Myc+EcbXupZYzknW5CamODQYar+Ti3DE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTV7NppSCELtq+yFa25O8CdbQVa/W20xK2KqVeg16oDWsMtGcA
	DlntwclfAMwD5MEFodrJMln4JAGKbBBrghRLWIy47WFoM1ATUQRDvm51
X-Gm-Gg: AYBFou2APICuGwXZWM1f8f51u6+647FEgYUvgK+I2OK0sXBKhKXb5qr7SCPNMqQzMp6
	g3AgxigAxu+ioJvPszCIfVsaRGYjzXs1ANajBi+IW1BfE7MV4Fb1mFDZTse0vxvhzJ7IpJVZsVh
	RURLzstQjSLnwvPRnUB1Zz4dv6hjMSxQfwEFILrCT6gIgVuI6NcnM7pL0ZIwkFor/vkkBxIbFDh
	wiCnBIxYoW3MHbMoHvFqaSOG71pql6wYBzsU8KjV9ws1VxI/9dYRU3zZBZDNBZ352CUz3LcQBPq
	7ZuazveItRJv5CjrbvCoyYBRsWQLXkVoGz3RWIL2219xdu3Dcms9hOIu5QDCfbbnt7y0ouodew8
	dnMWSEmo2dG8SxMGToSQ38JolQI+QBDgrM/PmFgv42ASj6qTlw0g+McbUZP/jTZr6C3prKll5Vy
	YiJ/rJ4Lg4ZHa7HJqiZuP3kET8CmN01/hF6rXRP4F8POYqMzvEa56uv3SNnBiPDwyIRvk=
X-Received: by 2002:a05:600c:3ba2:b0:4a1:acab:234c with SMTP id 5b1f17b1804b1-4a1acab23acmr284700145e9.10.1792140424251;
        Fri, 16 Oct 2026 01:47:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a8a15sm131123645e9.4.2026.10.16.01.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:47:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:46:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Riccardo Oliva <oliva.scorza@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: avoid iterator variable access
 outside list loop
Message-ID: <atHkgyGbF6TR-lT4@stanley.mountain>
References: <20261012034020.100737-1-oliva.scorza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012034020.100737-1-oliva.scorza@gmail.com>

On Sun, Oct 11, 2026 at 10:40:20PM -0500, Riccardo Oliva wrote:
> In vme_slave_request(), vme_master_request(), vme_dma_request(), and
> vme_lm_request(), the list iterators (slave_image, master_image,
> dma_ctrlr, and lm) are accessed in the err_alloc error paths after
> exiting the list_for_each_entry() loops.
> 
> While the iterator variable retains its pointer value upon hitting a
> break, accessing list iterators outside the loop body violates modern
> kernel coding standards.
> 
> Fix this by referencing the dedicated allocated resource pointers
> (allocated_image, allocated_ctrlr, allocated_lm) in the error cleanup
> blocks instead.
> 
> Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
> ---
> Hi! This is my first patch to the kernel. I am learning the submission 
> workflow. Any feedback is very much appreciated. Thanks!
> 

You should generally assume old warnings are false positives.

There is a check which tests if we found the image or not.

regards,
dan carpenter

