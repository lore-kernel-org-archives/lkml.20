Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8803009F2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143655; cv=none; b=lHup5R8wG07VIhPXSuS4zU/GZDGGgabq+Zkg85jElG2fxrTzUu//+5oQIMy3VoAin08nCiRDfCCdToJNBvVZ2eU4nK1L12KikwyKuNu4CKL+DzahUdeXT10BaI2vdWolg3Su5qf90x8uQOdFqqbGHSeZwNGBI1dOg1uFwBoiFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143655; c=relaxed/simple;
	bh=IKOHADwHNZP3jA6qSOzuBaSk53iOphiCQ+dLK5PVi2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUvy50sNTaKuRG8MxaHGsYN4Jb6uswWdDjv3yMzfZK6bahI4UN7AB39hp1EYIrCT2PJv+VAITUsrbjRWLs1SnQ/g3MDVduQ/SyMuWo5MeyHcclBj9rROCrJbdfTnEZZ6wizf4JaHavThE0gBu42quZPh7KWzI3NP+UZHxUDb2BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F2iFGcc8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FCN783V2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2iFGcc8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FCN783V2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792143653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UvLeihu7ioIdym0eRq5JcGIMM6YkZ/1Kjyy9X0VEuuI=;
	b=F2iFGcc8hY/UmVIYwWyJ6FT2/M6vyMd3cEldU/hoE/ftwSZCDOo/Iz3TNGlEZ8yAabI3KZ
	z67Scf/adnv6bfu3Hj39qIr62PCkCQhDwicPDdN2f6DYbpgGPTf/DnjcEihFAr1z8972mB
	fRCVHNs9TNz65feQMozo9+NgCkwoTqU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-fdgHnrx0MvSmvADRTQKFjw-1; Fri, 16 Oct 2026 09:40:46 +0000
X-MC-Unique: fdgHnrx0MvSmvADRTQKFjw-1
X-Mimecast-MFC-AGG-ID: fdgHnrx0MvSmvADRTQKFjw_1792143645
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b02e93a1eso5178102f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792143645; x=1792748445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UvLeihu7ioIdym0eRq5JcGIMM6YkZ/1Kjyy9X0VEuuI=;
        b=FCN783V2DUDnw/BTjBdrdek8D31UYdTyWUotV1GQ/q7ybRdcBFfnFRxBvdYdbbbRh5
         qSPLo6iTjgQ4Tq+ylXnqY/lda7o1t3GqHPKZI6bbE3QVUKRwVrtUhW5dtvnx6CvTRWvH
         JKW9kbakghkSswDbt+QvBWbOL4r3YIs4t+JtWcPp69nI4gbR657hK1pcdfy/4cxA/Rn1
         rpGUyrhLnB7M6sEW8D5njLABZgTyaD0Vlv0l7ab4lTTW1jfk0XOAnfdYlSI2fLVCk4Ib
         TrW6Zna6weAjTWN5xOYJUJuuGmGylFzkXSGOuVyxnLMfOXkYQvvL1b8S3Dr+npoyTWMA
         vYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143645; x=1792748445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvLeihu7ioIdym0eRq5JcGIMM6YkZ/1Kjyy9X0VEuuI=;
        b=na85t36Ey/OioeQ1QddHdlKVwSJ7tH+tga0WwOhm5fp08K9y2tWV7dxxi0CBdDEaYw
         lqph6YV6g9lfeLKs0izTVr0QbbHDBZoTClndCObNI3OFk8PeDXul4vOfHd2oMyybsZ4J
         +n03ubbvKx0JV6lT0VAqhCejmJWmMWMbrm+Y2qvXkUbX951No6HMDLqopX/+JZP8GEw4
         zjx9Gr3bVB3JVch6qYoYax033ia3xBRQTwG+Bq/anIX7ItRB6kc2p0xlHERY8SwHLjAn
         1uKWgNN1WgpEYxZFNXqQip8G0Uy24UC4PJ5z6Hc+4GoF+cAxxvf6NDRlK30SY7hQoD8e
         PUEQ==
X-Gm-Message-State: AFq9FYIgjtvs969LGbJMy4aT/+xnMuj3yx2wamlxNx3YGJ8ESG/9qIex
	egvPFMGAqKrozuutLDdVjqYROwDUCJ5wryVVTlEBF5xlZQyoHL3DWtfp9gZTEhkoOUYkAEkM0iA
	WDZnnnZ54TIR9ojDvpdWszDIcoXZAgAaRnP/dx1MzT34KUlcTsAgSQFjCZJuAb4ZJAw==
X-Gm-Gg: AYBFou3eLBKqvRshEGU/g477bXHesR6lDo23tBwVv8JWqMry6M/TNTwQ8b/ekwOLVf3
	HqkVUUfCccIKekg9XIPrsaT1GQ/JU85/18dUIn852iJtA15LHCadfpbgiyrbeFVV8Ji40nuQU1o
	8c+RC1WHxRo7IwqJ2mJHYZLUHEJZ4kgo4ZA0m9w4zj9xdOh9dF+GCrWJh76iEpfKkepOTbwqELX
	W1NXP0D72zR/nU4AGW9J8aOLXak6l6N68PJINltwz8hcMQfZo8CkZJXbV43TJjFXcJqCixqE9bD
	uik6TxAI5TeqMLZqsej7l+s3Z7GqT0vJzkKkyhRxqTqry74j+qwJ3FLNvEuxiFTaZaNE4A==
X-Received: by 2002:a05:6000:2212:b0:488:84ba:ae2e with SMTP id ffacd0b85a97d-48dba6f54ccmr42368172f8f.0.1792143644632;
        Fri, 16 Oct 2026 02:40:44 -0700 (PDT)
X-Received: by 2002:a05:6000:2212:b0:488:84ba:ae2e with SMTP id ffacd0b85a97d-48dba6f54ccmr42368022f8f.0.1792143642782;
        Fri, 16 Oct 2026 02:40:42 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm4255797f8f.6.2026.10.16.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:40:42 -0700 (PDT)
Date: Fri, 16 Oct 2026 05:40:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>,
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
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: Re: [PATCH net-next v2 2/7] um: vector: honor virtio net hdr
 conversion failures
Message-ID: <20261016053930-mutt-send-email-mst@kernel.org>
References: <cover.1792067836.git.mst@redhat.com>
 <6716834884238de0ab1ab313004044122aa2adbf.1792067836.git.mst@redhat.com>
 <willemdebruijn.kernel.10294d16149b7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.10294d16149b7@gmail.com>

On Thu, Oct 15, 2026 at 01:19:22PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
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
> 
> Should this return 1, like the above?
> 
> Not sure whether the verify_header return value is well defined beyond
> just boolean.

                                header_check = vp->verify_header(
                                        vp->header_rxbuffer, skb, vp);

                              if (header_check < 0) {
                                        dev_kfree_skb_irq(skb);
                                        vp->dev->stats.rx_dropped++;
                                        vp->estats.rx_encaps_errors++;
                                        return 0;
                                }
                                if (header_check > 0) {
                                        vp->estats.rx_csum_offload_good++;
                                        skb->ip_summed = CHECKSUM_UNNECESSARY;
                                }


apparently? maybe i misunderstand.

-- 
MST

