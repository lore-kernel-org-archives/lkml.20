Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241336;
	b=vZ1sjDggz/d8nlivF+S8Fa01CQK6wNmH+rBxUgzlCTaPB4rZhSvttXeW1iDb3dhRDjMN
	 8AsJjTcJ8cYHbmg3qgmavjf5gmn7WrgQfHRGgDITq9ffdoiOgO6FZxJDTKUj0Ii0aseW8
	 EGdxxcr+tQxzklIpYTnqYRo77+GArMDgtrSdzxN/XvgFipCeE3Ts1+8ct3dNNf+vB7/LS
	 qJxb5QMLlxIKuBSwltJl+89ErmxRBNENWuL6irvGWZQqpY+n/zTH7o0BBCUSe6DJ5sY4G
	 9nAXb6vyln2jfxB5ZwhiDQurq6nlnJxWdQbAxQjCq1FmR4ksmg8AhbN0y+dO7ptLCSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uAScKcC7U5Gza48nvZ3dmH1iFZWDY2KqONvD6wJBBz4=;
	b=0ffP9/eD69s6gk8I7Z/HBZKqz0Ay7+JHrSFEr5nqXqCG+8UmqllwLM/IVaKZ7n8LwtQW
	 nBfvGyk3lEXXQM8isuuC5rzw71ej3z+5T0JVg1znW7PEIz6nCrsckJZ6pAtgj3kYrywcG
	 FO+IQ6RLRPbj0n11jnpYlQGt/Y4ykZfbhgpSDKCJSmBXPgmi39N3a6m44FDv1dkmo0l39
	 TdUMwUHmMBfpFm9+1IgfhHb+iL2p8LF6Bcp5WKJqKYhccpSqgOdBjKD6OQ/J2gsqiBuaf
	 q1QK3OrWv2sdvGbqeHCwcrNSv/KVrTMXI+MxlA/awNUzAt9CfUKmo8fCyjka6UHdlRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="dQmYVZ/K";
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483D606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3483D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=dQmYVZ/K
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-54f873cbe2aso10395501cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794241335; x=1794846135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAScKcC7U5Gza48nvZ3dmH1iFZWDY2KqONvD6wJBBz4=;
        b=dQmYVZ/Kx6L1CASTHctXlStJYQ9NvHkz1nWgQIpVQi/GzlfAUKG2m65kbAvdPMwl/n
         +67xL1nGlmPE/OJilzOJWTyeb2ELqyHoR71tQXawmP14Dfd9IxlgkU/swfm+3hpFW8SU
         9serc03+OCJtu7kSXv8dRJSAJRXWdXhP6rp3n/f4+bAfvzedY3/guccCo8Hm21Yuc2bJ
         tmtwX7ehp32YQZAP1+oh8xtagdiSUDXMvCGvcBZ4X8i4yJMWRrDE5i0zCxRhXGPgge8/
         hU5gb/Flr4xhuTrC4+At7rKSVudWi+Gsj6SjsBeMVOkxt+/UzQfnxf0m2RSZvwzvzPVA
         OBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241335; x=1794846135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAScKcC7U5Gza48nvZ3dmH1iFZWDY2KqONvD6wJBBz4=;
        b=ipalO72lUXuDFbBObVCAcjTocNJNITb7pQvyvnXhGwiHNcB/TUt/bjhURQU7/pPDsL
         1Lzjf+5vh27pDVBHcsflYhIMkAbRuwcg6ELyyah0ix4YgYTMjc4J9HrfOyIaau3YxW4K
         0wBjfi5ac439/sXkjJYC2emOziPWnQK9qCOpf9ecna/Ndd7xkdTqDF0Y/bhVd0X+r7Yr
         2nFP8hktW88fmxOtuliviTq7e+iCefkk3ADzVt8cwL/2+leoOTbJaNqfVvuIm6mw+dh3
         xQJB8V36TgMY9j6Eh5SLyoiqZ6Hrm72eQ9d4N9QJtVMSM9inTDf9kHSXSyevQzhLu2Gb
         sOUg==
X-Forwarded-Encrypted: i=1; AL+hErFXge+WJMkiP7weR1I6z4/cyWHsxw0LiPpe0fkI+jzYmhCsOknSmL1zLUOQllMkd8oCuRt6GX1R9jSBv20=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BEeey1+siJO+bpoYihLL9WU/5Hi616v+AdPOVQ+wO+8SAhW2n
	LoodSa22WfJZ1/PKsGm2AR56rZCgWPHHfUdrFHxScUQ25eSkMSNusFNPjA3fRjyFgA==
X-Gm-Gg: AYBFou2+IUK0W0he5jle52qwILPs+2kpnn7ke0TRXPq/SDpHkZBtArWcCJ/zPjm4Qq9
	fQ5aJXu25ZC5tt6SCdwgGNOn6XG5Wfo8acroG/9Rp+kLn6dIg4Q4RAurVX5ZwQJbThntLINkmHf
	yOXpwjtYqyRTfStfien3dPzQbPWeq9dGRf3h5WYDmCn54wzrrNXe5EvoVKpJQEUUd3TdgTfRwK+
	ZRg8hy38gVqwhQr0vBltaamrd+ZUoETFJfGkqp6fhQ2396sNkiGQiaSvufU9hsbWPoU+vjokoy2
	ZnAniNOJ5c7WzXzYzXMLlP0K0vc/l+M1F7I+LonCR7oW2iuyYHb8MVpg1DwK/wrImu+J3JfmRhe
	LdYjO8542z0Gz/xUiZHH3MAP5u6PBkrxTmYg03kEOq9I5FWuEuLOTq1nxWx3J0mvYDlWg9LUL1I
	/rF8T1WqIMXKLSmI1jmBpcoNe0Rv4F/Qk1IBkeilPR53V07em+hCW5UH2TF0Mj78gWaAr1Adfky
	+ECUmRrvLt6KW/bHBcX0FnxZWJ8E53hzaIhPhYVurhWzOnN6swH5rwwphEAq8270ee/omWHk1CL
	gBvrdIAZV5cMEvDbPxHxsNwhXJnjHp7rDtuSHl6p7Yy7ADDBPw==
X-Received: by 2002:ac8:5f82:0:b0:530:d429:c70a with SMTP id d75a77b69052e-552a4ccc613mr69150011cf.26.1794241334989;
        Mon, 09 Nov 2026 08:22:14 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eced95bf3sm45903146d6.14.2026.11.09.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:22:14 -0800 (PST)
Date: Mon, 9 Nov 2026 11:22:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 3/3] usb: gadget: gadgetfs: avoid writing through the
 const setup pointer
Message-ID: <2d4f4553-e9a0-4649-ab17-d62f7f1f1c5a@rowland.harvard.edu>
References: <20261109-b4-gadgetfs-ep0-v6-0-b410e3dced89@gmail.com>
 <20261109-b4-gadgetfs-ep0-v6-3-b410e3dced89@gmail.com>
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
In-Reply-To: <20261109-b4-gadgetfs-ep0-v6-3-b410e3dced89@gmail.com>

On Mon, Nov 09, 2026 at 02:50:53PM +0800, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> gadgetfs_setup() receives the setup packet as const, but clamps an
> oversized control IN request by casting away the constness and writing
> the truncated length back into the caller's wLength field.
> 
> The setup() callback has no business modifying the setup packet.  Use a
> local copy of the request for the clamped length instead.  Userspace
> still observes the truncated wLength in the GADGETFS_SETUP event, and
> the queued request length is unchanged.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Jing Lin <kayano050408@gmail.com>
> ---
>  drivers/usb/gadget/legacy/inode.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d8dfc1897..7c48214ba 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1543,6 +1543,7 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>  	struct usb_request		*req = dev->req;
>  	int				value = -EOPNOTSUPP;
>  	struct usb_gadgetfs_event	*event;
> +	struct usb_ctrlrequest		ctrl_buf;
>  	u16				w_value = le16_to_cpu(ctrl->wValue);
>  	u16				w_length = le16_to_cpu(ctrl->wLength);
>  
> @@ -1552,10 +1553,10 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>  
>  	if (w_length > RBUF_SIZE) {
>  		if (ctrl->bRequestType & USB_DIR_IN) {
> -			/* Cast away the const, we are going to overwrite on purpose. */
> -			__le16 *temp = (__le16 *)&ctrl->wLength;
> -
> -			*temp = cpu_to_le16(RBUF_SIZE);
> +			/* Report the length we can actually handle to userspace. */
> +			ctrl_buf = *ctrl;
> +			ctrl_buf.wLength = cpu_to_le16(RBUF_SIZE);
> +			ctrl = &ctrl_buf;
>  			w_length = RBUF_SIZE;
>  		} else {
>  			spin_unlock(&dev->lock);
> 

This is kind of silly.  There's no need to copy the entire structure.

In fact, ctrl->wLength isn't used again anywhere in this routine except 
for the line that initializes event->u.setup by copying *ctrl into it.  
All you need to do is this:

 			event->u.setup = *ctrl;
+			/* Report the length we can actually handle */
+			event->u.setup.wLength = cpu_to_le16(w_length);

Alan Stern
