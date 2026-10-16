Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028F3E7BA7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143462; cv=none; b=dRRrCy6mk6kXJgkgZovcUtO8i82lzkS04NCYpkyMBLBcgSJtfBaZmHytiQRlF8WxewGnqTwqlWmzyDdWpZk5vjYBf79NLELyz0NZDQ2VzF2KXqSeHBsWasGfkU3mCx7XByJ6mcb4XyFdCRM6Cw5zJKov8aqI99pntLgFgaahz6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143462; c=relaxed/simple;
	bh=EULeSIJ8HNnMPsQZ4YnhJWYAbD8Oae+53dQmmt9inXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNQt22KuQIwJk7lXDCAsYGAjaq52IOfqpuxNWlta+kaHOsa+FlvaBQfr+FeEA3qXz1rGeg5lFkToiwFAGejglE37OwJqlWmkJpNChgzSUA60dEE8Hgyp5UupPDhPL4RSkOmkJnVy4ia/voDZ76GgjHOgOk3G3REInO3w8rOFffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XqxYI4DH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XF1gTa2R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XqxYI4DH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XF1gTa2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792143460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jEPuNhSxsbUvh+PW3O30AyJYlH++sXV5pTbl3odzk7E=;
	b=XqxYI4DH8gD1zWiiceV4GYWN5vqXxNZW3MUaeoAksja61e1oxNvvYh6l/elkWy0ibMlQ6T
	KEIJkh4h9f7sYd3hbQCHiFvhc8MRN/YzBipqt6dtldGydlkQYTyK//JQKOhILjaHnfh5Nn
	m/ZTCjAI6Ir49oiY6GTDQyojRxrKbNs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-QbclsYnrPI6OE63aMOXjEg-1; Fri, 16 Oct 2026 09:37:38 +0000
X-MC-Unique: QbclsYnrPI6OE63aMOXjEg-1
X-Mimecast-MFC-AGG-ID: QbclsYnrPI6OE63aMOXjEg_1792143457
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48af4046a3bso4804652f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792143457; x=1792748257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jEPuNhSxsbUvh+PW3O30AyJYlH++sXV5pTbl3odzk7E=;
        b=XF1gTa2RYtdJpEtCz1OgikGIv9mHWIji0efsJp1BHn0QovQjLn2TAst/VPl2v3JjgS
         yOnvZPQU9GA3m2K+4NFCZoOQgGF4JSrsFLQGMvxYjb3VK+HEU9f5LmFlUY0HHsEJqpnV
         CvekaMGy7I6W1iOvMzk3sG1YUM2bvd0OX7aChd9FseJMPRQIJXiM1jf5Ci2UzZa4uMn5
         p4zsTNo4Yg8+yz71gbX4PuZiPQ3pGKxtki4CMJFn1CS0NtXMLmc+zQ6YvUAqX0wP8cV5
         QsUQfyWxtRMI6N6YjRUEBcqN3XbU1Z8MvWvt/jMPqXZiS08ALM8Wp2CYNthkZOTfXL2x
         65KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143457; x=1792748257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEPuNhSxsbUvh+PW3O30AyJYlH++sXV5pTbl3odzk7E=;
        b=W3s8YGsvxehqbuwTqgXyf4CsFejfgJR7b1DXkiqAOvXrizjsLRLF2ZbJM70IP8Znlr
         wjBbzKdwRIGoXrwYaDUF7v4W3+PNOfLcByQEPgUBGztQxywvhQ25aZSIiF+lOC9cxdUm
         nghzzgwg2QOh+mktNT5C60i4iGBRjeTj6hCv0hNlloiRskEnV2H03ftfhstGBkuTs7uj
         MvW+e4HtcM5v2Xu90BiDEO7yRrZH5DSlOxeynt8caRdc84VfXV12Oi0iOlCeGMDK65Cd
         CPffmvx7AAWt6E3XncHE0IDxVhjs8OH6FmwRWBrm9CvJbqVuzuDV+JzalYVw3xmA6MHx
         kb1w==
X-Gm-Message-State: AFq9FYKlMSfRgrlyuayFAjXsVFyrV+RbP2/hZElAdjrHgcA4yoZe3yjV
	hoaNUKgaqGG+12a9InYqjGsPj/0wluXO1HgG1rAGMAC93K3gMqNzlfqILk/fCv5QYzVTvvLOgox
	8Ls3te55np4QTKr8wEAl9LBxdmxWff9fZuOb1CvvXumZ+zIiXdGVSJhDZc41EsFOGUA==
X-Gm-Gg: AYBFou1lYLKAlJ21t0ngYr6CxTdGxDIzUUoX+c98SbcWLKt7OtdLThCnQjtVbimoacL
	D47vv9GzM2OAE27hy4A72mKQJ9P8Cm5393cya2GkCIbpDhKmzt70WojyIE3XAM0l9Xd8iUXsgIQ
	mkYgsT/ErJZgGDsXXGh8xkxamdHnjOzStvEe4cnpB39lYVNqkuwUdeFbJ64niVFAfqoi21NyD0n
	5gVmwPblraadj76I1M7J0O1MIj4BzUHSL4vW315bIBLz+u535OcyBxWm3bTuZiTxdvyj5m+2DMa
	gfzSpNNuhw4zVi5Kx8tY9UMdASs+cDaq0mNIVmZFfot9AL43tPztDb6ALOmHxZeb7o3DCA==
X-Received: by 2002:a5d:64e3:0:b0:48d:fd48:86c0 with SMTP id ffacd0b85a97d-48dfd48878dmr4550986f8f.47.1792143457347;
        Fri, 16 Oct 2026 02:37:37 -0700 (PDT)
X-Received: by 2002:a5d:64e3:0:b0:48d:fd48:86c0 with SMTP id ffacd0b85a97d-48dfd48878dmr4550928f8f.47.1792143456859;
        Fri, 16 Oct 2026 02:37:36 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5008e7sm3899434f8f.43.2026.10.16.02.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:37:36 -0700 (PDT)
Date: Fri, 16 Oct 2026 05:37:32 -0400
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
Message-ID: <20261016053633-mutt-send-email-mst@kernel.org>
References: <cover.1792067836.git.mst@redhat.com>
 <6716834884238de0ab1ab313004044122aa2adbf.1792067836.git.mst@redhat.com>
 <8420ba1fe84fc7d105825026802d4ad10d44af71.camel@sipsolutions.net>
 <20261015085119-mutt-send-email-mst@kernel.org>
 <64ee40b97fc447bbf3abb80250ad0d9f3cf3c6fa.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64ee40b97fc447bbf3abb80250ad0d9f3cf3c6fa.camel@sipsolutions.net>

On Thu, Oct 15, 2026 at 02:55:23PM +0200, Johannes Berg wrote:
> On Thu, 2026-10-15 at 08:52 -0400, Michael S. Tsirkin wrote:
> > On Thu, Oct 15, 2026 at 02:47:01PM +0200, Johannes Berg wrote:
> > > On Thu, 2026-10-15 at 08:41 -0400, Michael S. Tsirkin wrote:
> > > > virtio_net_hdr_to_skb() refuses packets whose checksum metadata
> > > > it cannot make sense of, but the vector raw transport ignored
> > > > its return value: rejected packets went on into the stack with
> > > > their metadata unvalidated.
> > > > 
> > > > Propagate the failure.
> > > > 
> > > > Assisted-by: LLM
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  arch/um/drivers/vector_transports.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/um/drivers/vector_transports.c b/arch/um/drivers/vector_transports.c
> > > > index e1fb2a76fdff..8b7548458663 100644
> > > > --- a/arch/um/drivers/vector_transports.c
> > > > +++ b/arch/um/drivers/vector_transports.c
> > > > @@ -210,7 +210,9 @@ static int raw_verify_header(
> > > >  		return 1;
> > > >  
> > > >  	skb_set_network_header(skb, ETH_HLEN);
> > > > -	virtio_net_hdr_to_skb(skb, vheader, virtio_legacy_is_little_endian());
> > > > +	if (virtio_net_hdr_to_skb(skb, vheader,
> > > > +			virtio_legacy_is_little_endian()) < 0)
> > > > +		return -1;
> > > >  	return 0;
> > > > 
> > > 
> > > Seems it'd be simpler to just
> > > 
> > > 	return virtio_net_hdr_to_skb(...);
> > > 
> > > As far as I can tell, the function only returns -EINVAL or 0 (never a
> > > positive value), and the caller only cares about negative (error) or
> > > positive (no checksum needed), so that'd be equivalent?
> > > 
> > > johannes
> > 
> > if raw_verify_header can safely return any errno - i did not want to
> > audit it.
> 
> You already used an LLM and still didn't want to? ;-)

I don't really trust it to do code audits especially in code I
do not test.

> I checked briefly (by hand) and it seems fine, it's assigned to the
> function pointer, which only has two callers on the _kern.c side.
> 
> johannes

Thanks, will make the change.

-- 
MST

