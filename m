Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C5F330B3F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360524; cv=none; b=DSdPiUv91TJFmYSAOjBLqnUAMq//UZOcQLufdjUnGrsLtVMjJiHttipIU0nG76RaNJ+22f+2phZkxNxOy/P+cWbjlHn0Uyhsu57S+/qQxOJ7eZ/IDnipkIfzYqJHtWLglZafWuqRPdmDZAZplC2nFi5pERiCIEDkv4UpVL8Z4m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360524; c=relaxed/simple;
	bh=zP3AGMJL7B4Bo7qCYDIswEXSaOUb1jOQWhFwZ1GLeBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS4OTfgylzySCuQaXTyqPjjFEAXALWNFiYpNMf/DVh8kIjm6WtbqaPtO5BqJMQbFAVao+NNuXaLbZ35BmxZO68apP9zH6Eu8tLl69YuceNuseVUwAnQT3Fz04RBv0rEHUT2n2i0PBnnnwQn43RJDT9aTOTWiTSMw8/GCsItmdS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mXliq9So; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mXliq9So"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90e8e70fa02so14714516d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788360520; x=1788965320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/1/fXMNRLMn3t6QVeQ3hSYPZWIjUdxGd7Svrk7PTW4U=;
        b=mXliq9SokX+OnqRWa2tcG9tkOzQ5sapeS3GPSDuxNgX7O5nFkqLvhIY6oXZm/bpopo
         5rIb65m2teGanOXx6ktowFsXyD0TiXPetgKOHL803GiNkHPsUQ5x7zG0tvUtVG1iRKPX
         4dt1/qCwAT0LNMV92HDW6ZfWsHQiKleWnY4WyxtJzUJCEyHR5RDezsMf8biD6V3Xoe2k
         AgoRJuQVtc6ybmldq6YfAhmz9infa2M98Y1FpQyjtMSWah5ISsbSnM0ar0Uy8BKKf4Sf
         Mq4LEI67Popc4MLO/F0UMulc2Igkne8S6TEKKijctxpdnUMfSrPPnogN6PkOAv8vgW74
         khIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360520; x=1788965320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1/fXMNRLMn3t6QVeQ3hSYPZWIjUdxGd7Svrk7PTW4U=;
        b=QkDmFjkUuLvRBizEWCTtGP7ZhepnL0m+W82pOlXvSqeUaagEprZzl6hUqQVU6Jtt9Y
         SONt/0odgxP4ItSusWTXqem00kOgl8vli6WsPeg4M39sOjFjtHL+7JRedxyNcZXeFNlf
         5dWOTJPwa3UdU8xpe1zlUwqgmrE94+Spu4Axwwtr9wyKCOX5Blzaf/wSy3PMDgoD5S7Y
         2XmP958SHQ3hY4kT1bsdqNgK/Wh4yqRO8jVzfEZGlcC79HkJXR95fsX8KvdRpVA1kNYy
         rxzi6Or9IuLJH+JXa3NLgosmALpRDIzysEauKlgB+Ju+GAGduhr6GNQKRsBDms3fnrmi
         Q3pg==
X-Forwarded-Encrypted: i=1; AKwUvBy+BXpmZZfsogS2UByKynrR7Z1g9OHhQ4gbim0CTQig17BVJHDIRUU2mveh35HhxpSS10ZMyQ561jsBgGw=@vger.kernel.org
X-Gm-Message-State: AFuF++kajwGwnpA3bSrLWHdmxWcSpC747L5SCdNL/qkUcEw5IHjTu72O
	CwyY4Kg5GMWu6434If46NLRwqIKAKctyS9d1zUUGTmoHgOnZIEd0XzDd7BErLMpaxw==
X-Gm-Gg: AYBFou1LnNURdL5nLEWskQFIg1RLWDKgp6s5kBpWJhYb5nlhrjHrpN4lpCbkxwoeG5G
	eHJpy069AXPHia4Ss3A3TX44nkYF2trRwSExx0LdOziCL0TgpbH4cMxujM6jm9Pm61p9x6PC4hC
	veA3oA+yKGnobJ1q6MXoRdBqZMD7mnf5rRPUz8P3BXVEiBoFebUrbKvNUV2Cxp5O407aMkTJ+sR
	P3E/ds9fLLTPiMK/ittqZO6SnqrfYuwF3MkVH/9ytSwyN/oq7y/zlV+cOlCy81kYLlFJIkXgcnX
	IN7c1MfeuIY6OQO0ympg5DI9Vc6Lt2YuU2hlQHgGlW4a6QEqQK2/t14S/elvC1R2AtxDwgPmqe4
	U/SUZ4+1YabE+xTWZsZsvdEhu9wMNX07v9eAlridDJs31FS92kY+0jM0XlUxKtkjVOne/I6R+xh
	cjjmzkNxb7W8bEEIYQr9xMzV1zAAABkrFnRhkSG95hJldFLNF6Th5paukxdgsd5Mn+xtovjH7IW
	lLMWVY=
X-Received: by 2002:a05:6214:460b:b0:90e:945e:61d2 with SMTP id 6a1803df08f44-90eb6c5e9a9mr73341796d6.15.1788360519862;
        Wed, 02 Sep 2026 07:48:39 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm19396886d6.26.2026.09.02.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:48:38 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:48:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Palmer <daniel@thingy.jp>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] usb: ehci: support non-standard port status
 registers
Message-ID: <c3125487-c9af-4dba-886e-5f9467120b7b@rowland.harvard.edu>
References: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
 <20260902-gemini-usb-fotg2-v2-1-0057408495d8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-gemini-usb-fotg2-v2-1-0057408495d8@kernel.org>

On Wed, Sep 02, 2026 at 08:11:32AM +0200, Linus Walleij wrote:
> Some EHCI implementations place the port status registers outside the
> standard operational register layout.
> 
> Add a per-controller port status base and use a helper for all PORTSC
> accesses, while preserving the standard location by default.
> 
> Suggested-by: Daniel Palmer <daniel@thingy.jp>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

For this and the other two patches...

> diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
> index d7a3c8d13f6b..765338c2eb88 100644
> --- a/drivers/usb/host/ehci.h
> +++ b/drivers/usb/host/ehci.h

> @@ -278,6 +279,17 @@ static inline struct usb_hcd *ehci_to_hcd(struct ehci_hcd *ehci)
>  
>  /*-------------------------------------------------------------------------*/
>  
> +static inline u32 __iomem *ehci_portsc(struct ehci_hcd *ehci,
> +				       unsigned int port)
> +{
> +	if (ehci->port_status)
> +		return ehci->port_status + port;
> +
> +	return &ehci->regs->port_status[port];
> +}

Can you introduce a new Kconfig symbol (or symbols), which the FOTG
config entry would select, and then generate the "if" statement only
when the new symbol is set?  For example:

#ifdef CONFIG_EHCI_NONSTANDARD_PORT_STATUS
	if (ehci->port_status)
		return ehci->port_status + port;
#endif

A similar approach could be used in accessors for the other items you're 
changing.

This way other architectures won't pay the price of doing the
unnecessary test all the time.

Alan Stern
