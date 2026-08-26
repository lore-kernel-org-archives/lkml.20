Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A543A80C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754347; cv=none; b=aU2tm0KDq3T2fUrmMDcg0SyahBcDcEU5J91MI8FbFUALPysqL/DRxEcLtkSB4xmfWAquEAuqBozOeEU0qzmqcOBRRUUjKE7osN+nrE3cXehfm+sMkZmWFnmidyuxCjllm8eCK6azaCpaqeFyV2oeA40kPxrGwTnduJrsAg2gSuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754347; c=relaxed/simple;
	bh=el41jJYiChJ+vjXmRIToeNHzqTCXYoqkbICWX2N1awY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNKuGrMZsaNTGuARZxEk5rONs7zjhGO3ucFVfAABo8tQifcKyM8jSS83WxeHR4NElVN9piJnx7DF0hV0EboDinySmB7Gv0GeE8X36VCoGnTZk1h8ix5ZQPM7425t/JPas5T/Y/nQ7yq+oIX4waYpWOQUzyXXasi2i3hB6ieoO44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lyGqHBzH; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lyGqHBzH"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90cd3aaf01bso106456d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787754345; x=1788359145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=skZHhH369VPUOeA1qWU/JjUNfYqgeJvWRZG+FN1ThEI=;
        b=lyGqHBzHG1QG8/37OH/ETU1iVglRFFBy6K4sIL3KaO6r156maH5eadKD/C7ponmUFy
         QEcDwQIW48QuNp7uq2lx0yMtltKyk4THSPLZkIU9Rg/soTv0Hw0y9bDXIXlREL9Sfgo4
         0k2E4+1LAfWtDideUd5AOZgUkh8502y+kzXOFRIAznbOmFB7BtwgI1npDFSitEQ24WD7
         BHcW4CEVlrD/UbWBT/O5XpQqepi9G7kY2Dmipof0KrvPFnEljDkb5UwwIHiaTr5vqpO7
         LhhPmMDF7U5aaPPCFFNGvBRniDh0xc2hJ2oH0hBwOQuvnYj4FzjKJs117c+vNh/ehj19
         h7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787754345; x=1788359145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skZHhH369VPUOeA1qWU/JjUNfYqgeJvWRZG+FN1ThEI=;
        b=Uyi1WWQm/R9tbHOyZnCHn7x+/QPzLj53EGPloLkDFiQQF0+0C0DnB0mIsPqB7XaCf5
         MZ5MumGnROZd50MZM3F0aQeLnGd2qarKUoZUOl4GaekYS9fvyW3N2jhZEqqkk6sOb0GU
         fmhYQYn/q5gTPFoEkK+y2P3njQBmzm6DG+gw/g4rHuZ+3NbHHYTu7RCA9YezSwBMFFdi
         EDRvtY7WjMWBwDQAwEZKsxJD6513geR3LOmNKJoSGbk6eubJVcCktJfehIrFDLEPz7Al
         nDFP5C7/j+JdbyOVhJ/Z2znILqKz0aeUBeICCtFDv/fbPcL4pSfu5o5GRsQzqYJ6RA0e
         8rkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqU8YVOjKU4jgo38nbpfPUhkPatPyDaMFqAl6v3cLlzy7NCzFOy/y/7TQgO4pqigy8RJVTDUc70Q+XsmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mkGA1bg2K6APLs9HhGdTRgG5VfI7T0m1dbJauS7UHoS7H0i1iy
	/q1jPHuJ+NjHhO4AAs+tmykrK78mHOxkjBNJeYKACWxpcBonwzQsu5ltZK7uVQT0/t7vU1f0rW5
	rSRY=
X-Gm-Gg: AR+sD12QHzJ8P0ZL8mEeLfcmLTRscfwEJFQRJrnNTAvMpcu7aXpVvTAtDvl4zovdHsc
	0UPVF+E7uoehZQqorMVlb5nVQjuXCr7BtqJq1wNsvL0mIQ3pYJHM4kq4OzzC/gISEZ3runrpFWD
	08n/oOJix+YP2oL9/0TqRUiAVOS2XjpW5va1rGc4kOsxnDTAOOaOxQ8lymzbwqtoH22ogF9+fSo
	MP81KhbG3zAggAtpy/YQIGCzKfFR8gWHA9B0W1t3lQE5ge37AE9O8mrS39vYLRNfZ9zsrbB+lZ+
	YFvOHOjDLlRoohaHzloeSxFn6Wb9MYQX6P7+S2dTZMPk6ysDoaP29rKDbmdU6BeKWF8JxNkQfHM
	qBlfS8eHh/1tT3hnpjyH/0XNy/bG0fHppzzOZEvfVw7yz7oQxcqvnekyk8mRlaCH+UR24QbNzDL
	aftJSwT9p2mbJywaZhHDlfip3GWXZ7d4l2oCizHOqBWlwA6bhuigfzHDdsomfDlQTZ/mHOMgB5I
	/os49CODErKGU8vpg==
X-Received: by 2002:a05:6214:611a:b0:90c:d36b:9095 with SMTP id 6a1803df08f44-90cd36bad1cmr4129476d6.27.1787754344510;
        Wed, 26 Aug 2026 07:25:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc65283bbsm26904326d6.35.2026.08.26.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:25:43 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:25:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Ignore remote wakeup for Fintek ttyUSB device
 to fix S3 auto-wakeup
Message-ID: <b1b67706-6fa7-443b-acc8-8fad20b1b505@rowland.harvard.edu>
References: <20260826085924.2083522-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826085924.2083522-1-dengjie03@kylinos.cn>

On Wed, Aug 26, 2026 at 04:59:24PM +0800, Jie Deng wrote:
> The Fintek ttyUSB device (VID: 0x1934, PID: 0x1202)
> has wake-up capability enabled by default, and changes
> in the RTS/DTR signals can trigger a remote wake-up.
> This behavior causes the system to be automatically
> woken up from S3 (Suspend to RAM) state unexpectedly.
> 
> To prevent this unwanted auto-wakeup and ensure the system
> can stay suspended, add the USB_QUIRK_IGNORE_REMOTE_WAKEUP
> quirk to the device entry in usb_quirk_list.

Shouldn't this problem be solved in userspace, by disabling wakeup for 
the Fintek device?  What if somebody _wants_ the system to wake up when 
the RTS or DTS signals change?

Alan Stern

> 
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> ---
>  drivers/usb/core/quirks.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index b5b577f0b931..b0856e05580e 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -528,6 +528,10 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	{ USB_DEVICE(0x1908, 0x1315), .driver_info =
>  			USB_QUIRK_HONOR_BNUMINTERFACES },
>  
> +	/* Fintek ttyUSB Device */
> +	{ USB_DEVICE(0x1934, 0x1202), .driver_info =
> +		USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> +
>  	/* Protocol and OTG Electrical Test Device */
>  	{ USB_DEVICE(0x1a0a, 0x0200), .driver_info =
>  			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
> -- 
> 2.25.1
> 
> 
