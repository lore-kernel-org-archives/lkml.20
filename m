Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240509;
	b=5q2aQpaq2aRlhcFFodqL4WAjF5zI3hjpo0M/lZt73CO9ySsC+SyXmF+CVRcmjm7tms8l
	 rZ15IUJCQxQqZExbJ5vrdOpjRrCZn85RIRND+2X8avaPOPPTL8RLmtCtofEoaf3UA1Yoa
	 jsQIYffF/5lzCVAVRQPXd0kUYVyjcrFns5WYwCZdSgmH7LczWIbkVUHgTmDoWgvZ64uGw
	 kQuAGhyWPgdCROp1JkzWo/APL4jpp0dQYfTtWFEbIfRzPscwZVV1Uuj42D3fqtyZkgvAg
	 S/DtMKZzUqCHbqFZrbFMZge5t+jf+qL+8rcDBACFMjrpPabe1onac08Jx3gmAtx5qhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4SBBPsSc3/Ep6nC8xR1PMHfDpiIh8UItfXg1xvFovQw=;
	b=dp1YWG83Z0atR32EOqsj1maHrSul3Su04iMkk+XfUzmGnM2Br6VmiR5y2Zz94g3NuNgy
	 b5gFTbTFlSC/fb2aVrFxGuSI5AIH/K4ZCUm8oO+soRmrUZhaGzkqerz1iox2RcCQ1lMkY
	 +BN1+xGrZvsJo+HVMBWkMi20XyvEgrD4ZPBKGXrIrjqGwn+ePjKJQk9DfMhIOQit0I+3I
	 TfcPAA/dvDLQZht9b9ZYKYL42ezqHQzRse7Ofk1GC75c2x+Wp2zf/AREWFiYGiCjA4y09
	 ZN+pRxJAR2CAZRgf3T645VWL19e1WcCFUG/4QVKcs2oREGrqDc+KJ2tiWNoFRUOpmPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=jJd+VzFL;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA49606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA49606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=jJd+VzFL
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c1f548f87so14239536d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794240507; x=1794845307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4SBBPsSc3/Ep6nC8xR1PMHfDpiIh8UItfXg1xvFovQw=;
        b=jJd+VzFLTL+ZpWFvm5Dym8sZpj1ikUvXlM0hb+Wyi3zxnNynzqBQeftpgrryufVtVJ
         y7chtGrXlZK2cVsDP5jFyj3gm1d5fXI8qtPPjKDodBkgyqIGTrGXm+P57mpFD0QriSYy
         iMHR26EC7QiNg1whxqC+RBFvOJ0VhK63ynrmf+ke50xcCvgvx8AqtMqf1/yLO3FNseZ5
         +fBWxztt94xZ4EToQBgtXfui+tFJ5cLhr6Z689dshtk6mC5Y5f0KqKoVwYMVnIlzQQGm
         6F+QLFbpspUK7AY/+08fIQ4H8eoW3ePVC6xrn80uov5Zai+rCx6Jp2Z4AIfh6WXDMgWz
         GiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240507; x=1794845307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SBBPsSc3/Ep6nC8xR1PMHfDpiIh8UItfXg1xvFovQw=;
        b=oAkNjx0UCxgLzgfYCW7yfy1Lf2DXIlAoKP3MbFBsSqaWFOghsPHYTwHDpnho7faXJl
         7JuCYYCAWjMDmgQ9F0p3ent5Z/ax7PKKjzrrBZ9xLVIlw9g5y2qiMb4QCWW5vtEakD6R
         YB5FY0JUAygWzuG7tqd0np5ibQgCPFR7+hH/f7SoMhLajO5ESKu5bp8OaVvu1jBUP6El
         D3ZLPf/Nm4KNZQ0MJdAQDznME6NZYiH5OtB+QTwNJhRfSlnVXWIolKDawuovPU7WgNAr
         PHIIHvFKkSC+f1h6SNDdwishGxW6JA9WSdFx1XgVKf3XXLTNHqRdmdSexNWWL81skBZG
         65pw==
X-Forwarded-Encrypted: i=1; AL+hErHlKNoolYc23A+cLccki8DVm+oGja01C+eTnDmhMk2VYv0YPNGQ2Ru/JFng+cO6ZLyH6vxsriQ1zAAci/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BE7//fOoI/WBq3hEzDfwUbcHs5wDM8n07aIfRXNLfsw5yDiF4
	wjLxC3Yu5FUOfCHdOBHEl02V47Ljenbs7TvIRQGnGLJBFaZcN3urh6BYxqaiAlK0Jw==
X-Gm-Gg: AYBFou3Jb3HPUe2vcOvtJnPXR63P+kug7BWvkk8eTzrBkgGZXQxzGwwFsP7dpqT+kvD
	vuE5oVKgJC45iqLuQWgh+zs/lUNaobORDeOhSdgaYHNiyqvI75PmqXJMnDUu7yjgVqsLWShvBTQ
	Oxmi1uC/+PeJP16+dW3SgaIxlhCNI7tB9EGxCYNv3wmT+3gY8Vgt6HBMQPh4fnELDWAEYFZLu0X
	sd4XLIJNTr+DH8xiRIY7rszWRsMqd7w0/fEO7twNPVdqeye/MIbTMYWiXfZu1SyNI4zjIkHzuwl
	GOPzgF7uUwvOS9njJWIqfKXRFxEPzczDQf92Cx3EnC7weCzFy68BiPBj1nIMBUwqmSNzJkEX2Hf
	1B4JjbMj4ASTcI/ZrVxX1g7uIT11VpXeA82IFf9JfUop1EEiEXGWPvermky8BzXo7ukshz3EsMZ
	1g4pEjf/WMtYCG/kbF44btw42Nd+9MuREv4pKjo8kepOFJgf2SS4ZnE7ODIuy7euYKGiKS81ZEJ
	8H5bVAGyVKe4v/C+FLdrvUcMZ9jCDLqZdmxgrlCSgAfLhb/3hIEEgL7smbksuTQxsY7LqzdsZbI
	ZAafODr8MCmo7NyMMKWWt4CD9xMq
X-Received: by 2002:a05:620a:440f:b0:93e:d5c1:da49 with SMTP id af79cd13be357-947842cc78cmr674785385a.82.1794240506826;
        Mon, 09 Nov 2026 08:08:26 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61c333sm7310285a.3.2026.11.09.08.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:08:24 -0800 (PST)
Date: Mon, 9 Nov 2026 11:08:22 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, linux-usb@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: usbfs: replace __get_free_page() with kmalloc()
Message-ID: <b39fd45c-657c-46dd-94e5-af7d633d297d@rowland.harvard.edu>
References: <20261108-usb-v2-1-c9209d527559@kernel.org>
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
In-Reply-To: <20261108-usb-v2-1-c9209d527559@kernel.org>

On Sun, Nov 08, 2026 at 10:39:34AM +0200, Mike Rapoport (Microsoft) wrote:
> do_proc_control() allocates a temporary buffer for the data stage of a
> control transfer issued from userspace.
> 
> This buffer can be allocated with kmalloc() as there's nothing special
> about it to go directly to the page allocator.
> 
> kmalloc() provides a better API that does not require ugly casts and
> kfree() does not need to know the size of the freed object.
> 
> Performance difference between kmalloc() and __get_free_pages() is not
> measurable as both allocators take an object/page from a per-CPU list for
> fast path allocations.
> 
> For the slow path the performance is anyway determined by the amount of
> reclaim involved rather than by what allocator is used.
> 
> Replace use of __get_free_page() with kmalloc() and free_page() with
> kfree().
> 
> Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
> This is essentially a resend of the "USB: usbfs: replace __get_free_page()
> with kmalloc()" patch that fell between the cracks.
> 
> Alan and Vlastimil agreed on v1 that the kmalloc() overhead does not matter
> for usbfs memory accounting:
> 
> https://lore.kernel.org/all/8cbe558e-7f53-4ce4-be8e-52fdba9105d4@rowland.harvard.edu
> ---
> v2 changes:
> * drop already merged patches
> 
> v1: https://patch.msgid.link/20260830-usb-v1-0-aa349c302246@kernel.org
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/devio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb94254809..9a7cc7cdf00be 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1190,7 +1190,7 @@ static int do_proc_control(struct usb_dev_state *ps,
>  		return ret;
>  
>  	ret = -ENOMEM;
> -	tbuf = (unsigned char *)__get_free_page(GFP_KERNEL);
> +	tbuf = kmalloc(PAGE_SIZE, GFP_KERNEL);
>  	if (!tbuf)
>  		goto done;
>  	urb = usb_alloc_urb(0, GFP_NOIO);
> @@ -1265,7 +1265,7 @@ static int do_proc_control(struct usb_dev_state *ps,
>   done:
>  	kfree(dr);
>  	usb_free_urb(urb);
> -	free_page((unsigned long) tbuf);
> +	kfree(tbuf);
>  	usbfs_decrease_memory_usage(PAGE_SIZE + sizeof(struct urb) +
>  			sizeof(struct usb_ctrlrequest));
>  	return ret;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20260829-usb-ad052ea1ffad
> 
> --
> Sincerely yours,
> Mike.
