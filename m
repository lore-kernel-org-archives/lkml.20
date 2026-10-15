Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B53E52269B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068732; cv=none; b=ml7PAL7mAbUWP927h8RbMe/B6u9svvk8u2jn+FdrYRHcYdw3cw4wJ9XWX784pIZcAhNKoMQvCMTJODODyWq8ET2gTd7N9EtgzwQ4JAdW1n3jot74xg4pH3EmMYutt69PHgBlq/t/8BfBTr69YAjOLBQ33mC6C3oerc01CP5GLh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068732; c=relaxed/simple;
	bh=Vqs2r6yrFjKU91M2JbFSTZKNGVccvtHOSjGLjryQhTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6rYkbE98L0c7ijLUS3CWj8kifQDPrGU1vQ3xeCRUu5UxOzEALKHKF2CqEKXmOJ9sl1yC7Ia5Zxax93bfc7MA1H2anze22yxs2cVMu6B3T2f/93tuCFY/Ujb4GDv9OwnVbTtEecV9KOpuwW07XRoIrH6tXt50gcdc8D9T8trvuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ByzE9tDl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ynd5bVtD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ByzE9tDl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ynd5bVtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792068729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wcpnk+xBeaA1jme1SdTW5ccMBBDrq+w8aENCxtFQmP0=;
	b=ByzE9tDlhZuR7BUm/yMYbFh6PnZfxcQD02n4Ol/2e7zNKnLrlU3LoIrvXv9nDdljK4P83L
	ssbc3as+3Ihd3zVr/xC4G4sYDTfXdU1l+QYDNKqzz0M0HIaWJ7kW8jVC935rs8YG55EVhI
	cUbzHYbP4QNOyXkLP5Eu5j8ZU2+P3pU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-r1f9FePaOxSwWNVPEbBR3w-1; Thu, 15 Oct 2026 12:52:07 +0000
X-MC-Unique: r1f9FePaOxSwWNVPEbBR3w-1
X-Mimecast-MFC-AGG-ID: r1f9FePaOxSwWNVPEbBR3w_1792068726
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dfa054f26so102459f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792068726; x=1792673526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wcpnk+xBeaA1jme1SdTW5ccMBBDrq+w8aENCxtFQmP0=;
        b=Ynd5bVtDVfvYsl85STueeMMSH4C6BauLrOpiH/iHyycH2KpTyhHopr92DaKS0VZ2Zy
         80BUALQxHiOhfvHZnmT+MzTnWxtl443K46fEzi+2RcmUulqD2q7g6ZFhT4EsFDnWJAzf
         SDg3PkUucl4tvew0paA7F4f9s7+CD/w4EzYKg1fXjTwxNZynrWJGHhBQc8H5bCSO29jH
         IRAHjbcNPzAGe9t2k6d0v+LOt/YSsuTA80bKjmeWzNQrk+5GAWnLn4+C3JMyp/UDz9oO
         nsKgPAB32y8l8wfebv297oN08AfLq1VgaNl5vTgNAC5yOUIIHB3pf6+W0256fo+699ev
         ZTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068726; x=1792673526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcpnk+xBeaA1jme1SdTW5ccMBBDrq+w8aENCxtFQmP0=;
        b=p7JA7NPyK9BU9l8Xb3CWTitls+Jy6TSEvy7+zl4a+JErSnKK9lalTqvDoka2bYHEoO
         meUKMvJXO50k2djryaHYkXoSCTs5aMFBkyOMfpo9mciRz7IlSLrrrYGGamVeSYOfz86k
         A+YEwACRl9zpPQQYAoBnJCHETVXt5Vx3xDfFycN7iuzdopZRLdZyuOXqiiRdoT9cKLaC
         5V2MJSrnJKm1qE/2NnyD4pfwLpcT4jnSf8HsEDe1bawO2teZHQIsrF1+NJ4M+AEjzuzQ
         nn/33QzDHshrp+tJ8hUtJLwKYKepyEV3/6YcrGO7LTM91OGab9EbMqS7nhWNWY/aTVUN
         +4Uw==
X-Gm-Message-State: AFq9FYLFsyau0JLNMXUAUkyvMAXhu1E5kW4WSzwrNg7iRlHSxfBF30Uk
	KRt9jUDFywVk/zg7J7xpudhOwHOuYnZzTxieXLrZOXN/ktY6lc1vcQQp7K3QzLhgJb8s4DrNoPg
	cGhWbbxqfTpg0pL6abZlOZD5j1yFi0KThEsxvJYLl+jE6u9yT+hb8wxmTq2nNvNaHdw==
X-Gm-Gg: AYBFou0Vznj0xec6Cfugmi+QAjEJaR4bcAhbhhZ5TV05mmPJyhvohkZOV4pv5E1e/zV
	xIA1RODuOu35gUHAJWI8bRBcSvrY4mu+72JR+wnlQRhpDpjJknMP177HTbjBATwRE8TjCwGlNxK
	nQc0GKteYtLPrbIR17ZNDFxP/MqdhZI7rYk02DMpq3m0iBWmwqyEwBtVsCRuTK8A0CpeQVc4rOd
	Nclqp2wJu0WcjA14CkDEL7IuwuB25YNrpeBx+R1SrNiQGPPfFR4zyjmaqY85icB2Z1PSGiZ7+br
	VTQ+zwiP6FrVENJEkcSrCcEOGFm3lsk1fLCjTlz4L4KKEbgD6d6rwsyJTrAWF/MAlP/XkQ==
X-Received: by 2002:a05:6000:25f2:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-48dbacdc419mr37642972f8f.36.1792068726346;
        Thu, 15 Oct 2026 05:52:06 -0700 (PDT)
X-Received: by 2002:a05:6000:25f2:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-48dbacdc419mr37642912f8f.36.1792068725766;
        Thu, 15 Oct 2026 05:52:05 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm18793273f8f.19.2026.10.15.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:52:04 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:52:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	linux-um@lists.infradead.org
Subject: Re: [PATCH net-next v2 2/7] um: vector: honor virtio net hdr
 conversion failures
Message-ID: <20261015085119-mutt-send-email-mst@kernel.org>
References: <cover.1792067836.git.mst@redhat.com>
 <6716834884238de0ab1ab313004044122aa2adbf.1792067836.git.mst@redhat.com>
 <8420ba1fe84fc7d105825026802d4ad10d44af71.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8420ba1fe84fc7d105825026802d4ad10d44af71.camel@sipsolutions.net>

On Thu, Oct 15, 2026 at 02:47:01PM +0200, Johannes Berg wrote:
> On Thu, 2026-10-15 at 08:41 -0400, Michael S. Tsirkin wrote:
> > virtio_net_hdr_to_skb() refuses packets whose checksum metadata
> > it cannot make sense of, but the vector raw transport ignored
> > its return value: rejected packets went on into the stack with
> > their metadata unvalidated.
> > 
> > Propagate the failure.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  arch/um/drivers/vector_transports.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/um/drivers/vector_transports.c b/arch/um/drivers/vector_transports.c
> > index e1fb2a76fdff..8b7548458663 100644
> > --- a/arch/um/drivers/vector_transports.c
> > +++ b/arch/um/drivers/vector_transports.c
> > @@ -210,7 +210,9 @@ static int raw_verify_header(
> >  		return 1;
> >  
> >  	skb_set_network_header(skb, ETH_HLEN);
> > -	virtio_net_hdr_to_skb(skb, vheader, virtio_legacy_is_little_endian());
> > +	if (virtio_net_hdr_to_skb(skb, vheader,
> > +			virtio_legacy_is_little_endian()) < 0)
> > +		return -1;
> >  	return 0;
> > 
> 
> Seems it'd be simpler to just
> 
> 	return virtio_net_hdr_to_skb(...);
> 
> As far as I can tell, the function only returns -EINVAL or 0 (never a
> positive value), and the caller only cares about negative (error) or
> positive (no checksum needed), so that'd be equivalent?
> 
> johannes

if raw_verify_header can safely return any errno - i did not want to
audit it.

-- 
MST

