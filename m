Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855076;
	b=2RdUXoblwdrXNwLR6Vn8PmFAaZM8e1Tph5MLTufxcLoH1im10NBM+yA2pUAe1y7pqRrE
	 B4U8vMBc1VY2fYrx8hDVATWpZc5J+DgnGkb5pey6/2GUbMDb28Kq4ST4hfEK8lpNs/iF9
	 80M7Img7bWFi5Y/rZqT682aw60HWxE4h/akWsGG7wgwT3bKSCorq6ies6hEG54loGNIQi
	 QTJ8fsy9NhAlBYiqDSmGj0pt+1uwpkoxE7xkOjDkKmhdHUidTvY5LfaNmquJ0MEIUeDid
	 uAxiEM9KedXZwoJdCeehd8NCiQjne5ESBf/NMhofMgzCDiIGiCze5zei2+ZsRQkBRaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hWBkolssTHNzvJIk1CQ5wtq3YgSC+iuVX6t67s4RgUk=;
	b=uLwnRCJ2ssbTmzlxhGfH34y6927F4UWJl12d/Xixm6pCJXWwvs/pzX6V5LVM4O0GnOS/
	 mmN/d3bExJanIyvwWmaJfki0/o9bzMTfIe/B1C2L7yIYdS/QrFIx8AXXTmb5VMxzRK6kh
	 YLokxxePvIwwVTyByl2ToG5X5EHLlJFDZde7tn4PRTBaszSf1L5Ee2PIhx88LG3wzzNsO
	 m9QmqsrFiPBCbSfMNKOo/izTX8Z4Pn+6ogWIlXts0J4zkFAXxWT8doeait9XXxkFphNmv
	 wtHPiYQ8PGrIJVO+ND6SCjBvONpstB7+9Ubm2M4RNS0DRrmopnq04X/0Fhruiq4eurQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=RqasTIrB;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6C1606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB6C1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=RqasTIrB
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-537548b811aso26107161cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794855075; x=1795459875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hWBkolssTHNzvJIk1CQ5wtq3YgSC+iuVX6t67s4RgUk=;
        b=RqasTIrBSzc+pvM9KGxD0Wr33AoXUUv1zyExX4B4tgAyv1V1PFaFeiSw9ux/9T70MW
         x+HS4845fh5pUxQ01QWvbLQfvUziHiq9CBYZTe/K/HAyeEZ+C0HihAlsW7NVWIyraRLC
         CzTsQ5A/oXzCq9h2q65GaQGKmD5TS7ojd6kpJe0J/n9lzSSi3iW+8PeSnVc+Ig5Wac6h
         aWjLrm6GfzrjNLFGjsxn0Edhqy40Xjg5T1ZDvWfw3Epc8yjbd/Foc3nnE3g6xebWZbVg
         SG1Qxjbc+M+zmZQEhDWkJsx8/cJ3GypSrUoo3lkXZZ2s4QQw7m5C8hcMZ45Grr1jk1Mj
         hNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855075; x=1795459875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWBkolssTHNzvJIk1CQ5wtq3YgSC+iuVX6t67s4RgUk=;
        b=K3x03cb3aBfZUbp1IsapsC6uOul4veWEE56/TmHhQk55dX6YWQR1mOzNJ9u2COWYvw
         Zo89tiG+7AOORHFe1JoVmPAS9/iGlUVjtOTa0ggvMKGavYIUuPqq1NHTOsT8Z1HwkgTR
         CgiKecct+Q41H4xs5jzfN56arcQ/ZfF9hWs59dRf/667goTfAngqUHnapv/fWgzhTYqv
         FO+95DzhJN0Jk2juxTq9CK9OOu1YwxsLJjbQNKckZUGoP7MCzUZhmyEcga/J0lF4ZZdl
         pNCkgexx68KdTkUtijWNWepd5nMNMFoRgMY31igiV+/xfgo3HhVBNirJl4ry3lmz4boe
         5Dcg==
X-Forwarded-Encrypted: i=1; AL+hErHY1p8CbZ8kmdZzDW7M+UbiIYXDenSbIoZvRJTN+i0q4zjjzQtPTsjkJoenGx8rHmpiZLigb9KoCCo48qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PWpL7UV5CMAU11gW5LFDpYMivuKqfO+IOQ0z7TyYSPaHdyAna
	CNfv+KH+2koUFQhAbG8Sl/eqL4WzHAus5vb+bnR6D1l5cZs0GaZwJQQ/1AhSQO9dug==
X-Gm-Gg: AYBFou38FEGl+VnU5hW+pvOcl6Le8Q+4eEXkAQXQcOWl1mutNf6rF3pD8hgW33HbTNN
	rXlE3wzZvZd9zRGLmTrpXbvba10ur4ioOrlD0YJGuu5msMjKj7PysagG0HPv7/grRtIVrmL8MMJ
	rA4T9Uv2+sT78UIkwvlM7ZxJhRN0Yh07BiqUbwySKFkDHmWYhAGlMz310FXydVEKepnDTLC0iv6
	R/lLblPIUZs5Ds8UFtBYpnIEE8udRk91m3piZOasjRwDnxdQf6a9YwZ2MCz7RnDztvXk5FQIAw0
	6214LPz06xiJdBsyEjV2pdtCMW1ew0aF61uIbJLT4f7eevtgEz22CwRHhDh/TA9Jqkz+8L0u/Y/
	wWOLB8qYS4IxCgBA0Nb3jzympeurdp3eFmLtkORIqV0H8Nx9cIupvrcltnEZFLRTjlagN4VddHb
	YVk4k8QctMK8z5vX8HAsWLfPMDiEKsM4yXmFKLzkO5tUYa/gqGmdrDB+zEXC85aZUzeU6jHbAif
	j9XvitVjpYZTCVSpjxjaR4RLboTB1bENuHjOn+uAF/nT/ma4hsbqhDfV1qsqVznLUTBBDL7V9gi
	gjKedSrSeqanO7B+Lg5ZIKmrGc7UYk1tXgwiqhlEzqc2fcvMv1s=
X-Received: by 2002:a05:622a:1b8e:b0:535:a5fa:ee05 with SMTP id d75a77b69052e-55ac9f6070cmr183600311cf.69.1794855074811;
        Mon, 16 Nov 2026 10:51:14 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34f869dfsm37676731cf.6.2026.11.16.10.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:51:14 -0800 (PST)
Date: Mon, 16 Nov 2026 13:51:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: core: wBytesPerInterval checked with unsanitized
 bMaxBurst
Message-ID: <77330361-136e-4e26-b5ac-9c4259f90978@rowland.harvard.edu>
References: <20261115163701.226491-1-teel4res@gmail.com>
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
In-Reply-To: <20261115163701.226491-1-teel4res@gmail.com>

On Sun, Nov 15, 2026 at 08:37:01AM -0800, Cheng Yongkang wrote:
> Hi Greg, Alan,
> 
> I hit a corner case in usb_parse_ss_endpoint_companion(). It needs a
> SuperSpeed device with an invalid bMaxBurst or Mult, so it may not be
> worth fixing.
> 
> usb_parse_ss_endpoint_companion() clamps bMaxBurst to 15 and the isoc
> Mult to 3 in ep->ss_ep_comp, but then computes max_tx for the
> wBytesPerInterval check from the original descriptor. The stored
> wBytesPerInterval can then be larger than the clamped endpoint can
> carry.
> 
> With wMaxPacketSize=1024, bMaxBurst=16, Mult=1 and
> wBytesPerInterval=65535, bMaxBurst becomes 15 but wBytesPerInterval
> is set to 17408 instead of 16384. usb_submit_urb() uses the clamped
> values and rejects isoc frames above 16384, while
> usb_endpoint_max_periodic_payload() returns 17408, which xHCI also
> uses as the Max ESIT Payload.
> 
> On v7.3 with a virtual SuperSpeed device over USB/IP, the kernel
> logged "setting to 17408", and 16385- and 17000-byte isoc frames
> failed with -EMSGSIZE. I only tested the bMaxBurst case; the Mult
> case follows from the same code. The code is unchanged in
> next-20261113.
> 
> Using ep->ss_ep_comp in the max_tx calculation fixes it:
> 
>   -		max_tx = (desc->bMaxBurst + 1) *
>   -			(USB_SS_MULT(desc->bmAttributes)) *
>   +		max_tx = (ep->ss_ep_comp.bMaxBurst + 1) *
>   +			(USB_SS_MULT(ep->ss_ep_comp.bmAttributes)) *
>    			usb_endpoint_maxp(&ep->desc);
>    	else if (usb_endpoint_xfer_int(&ep->desc))
>    		max_tx = usb_endpoint_maxp(&ep->desc) *
>   -			(desc->bMaxBurst + 1);
>   +			(ep->ss_ep_comp.bMaxBurst + 1);
> 
> I can send a patch if you want one.

Please send a patch to the xHCI maintainer.

Alan Stern
