Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106478;
	b=O+A6jSysES1Ve9YyeDt5JOBfrRKWPL2u6I0GS8M+BWPnwQZFWVx+ZgCENVONx99Ep5hE
	 VnZcOQIwN/dtON9cVtHl2CzJ7rg+C+YgXdHhGxqkrlYrnXT3D9pghJB1iZENCC02YTb7F
	 tu8xX7SbY2/ndumaq9p6ysAuzISs7sknBj0VPYTiryl1A8ljwYD12Fw4wx1+U12Pf+RP7
	 9rVK5sAcw4C2lCvMkRN3zLTYciGjO48fO028HNgxnA3bmoi7GkXRWt3PR6EwRfiAcwaP3
	 sgL5P2NtNnvkw8z1KWN/GEcQCqE77DQXJ+0lz/svt6+m5TwQYjYWpZxoThPqwkvdeGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106478;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ATvxORBZny1s5fn8dz62jBylTwd8vo+fNFXQREv2wUs=;
	b=kPMS7Badgbo97lixHLPREpDkSneZk2i6E5po63jy9L5RlO+L0kdZjqZ/Y1zi42clIkAw
	 8qBOxhYeobM8Wzpksdewe038LB8SMUNb6MKBrxkRMmNj/Y4fE8JNRMLCMYftM6cp/hKPK
	 F8RFpPpFsjymebvBIvGjfGUV/ODvEJphKgZuIvTCEEwzwSlFnGxW5mpW4d8J0+vyY4PSo
	 gcnbKMBtOuSGJnDRgQ+z1D48gO2RyakLxPJSBCj7VrJ9Lg7xM4IOxa8BAMM4EwN1FbGM/
	 KuCw1dFAnWR96fCh03VDC/1mYV53a8FAANfAMtmzoDod+lwqRG9V5tk6pPQc2TvelmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M0w5XfPW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Ax/SxHfU";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EE3606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42EE3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M0w5XfPW;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ax/SxHfU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793106476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ATvxORBZny1s5fn8dz62jBylTwd8vo+fNFXQREv2wUs=;
	b=M0w5XfPW+ZmTMhEPb6FCKQ1Q34kjll69ocHvw0cJuJzcvPS/IzctI2GCB05/6zytzd/doz
	6taBV6gtqS4IyEJBDQGZsPTX5m/fLi/gbtkOErtG0U3Nx2BvN9puywL/con4MRCY4wTEbc
	hkcO96m4sItxxnEcvChh6K9HkgQnUEA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-p1vZeQXwOVivyzgu_L-tdw-1; Tue, 27 Oct 2026 09:07:54 -0400
X-MC-Unique: p1vZeQXwOVivyzgu_L-tdw-1
X-Mimecast-MFC-AGG-ID: p1vZeQXwOVivyzgu_L-tdw_1793106474
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a4654add56so27308305e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793106473; x=1793711273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATvxORBZny1s5fn8dz62jBylTwd8vo+fNFXQREv2wUs=;
        b=Ax/SxHfU+rxKBDrThiC/wb22anNnHwug7J1tyRAynUtzxitEOc4gOdZKYXicyGMvMY
         XG43sCHkU8i+NoJdA1ic2sl8oi5WaZtrV3HNJ4Cw3YuucV1iGH+lLMpMxvuFL/7TYmFH
         kigh0yDvVgcGmh1/cMgBJnJ/NQD34MbUKkRXTNSKW/YY0DzYXQoE9tft6PBqqHw7ouEW
         G98lNSGtxwxSjsxuivB3GguoAiBamoEfLJetO9xNNlAnaDT0YLuzDIUXmVpT3KtUpik+
         pSZeZ7MI+0ZGtf4qbeih/o8T8TqtjTcYPiEhARUHs7sbnofkIhGGpKSMNGG9sILiJWIe
         RAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106473; x=1793711273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATvxORBZny1s5fn8dz62jBylTwd8vo+fNFXQREv2wUs=;
        b=v9pYHJb5Z6/bPcp3TBBCgV9TAD4eAhgKAD2MIq8Ae5wOdE+AKykxc8neMTcTCDGUon
         vvGDepUwnG/K94Gsdop1LaBLP0IBUMayuO4TGz8fKI9juQtXEhoxZCEmB1PU9Oz73IET
         S2i2B/sUAYR4qHafHxGxbc2OAq3ftXd/WUeP5PTX6KsY3rjFKIiUzt2t/DMd3DjCGSef
         E7gn52uP6N5Is1dsoqj7Nsgj0vHYQ228Vl16VnFQ012eV7RTs8lB+ab0Ga8Ayjtg+d4y
         j4xGrJY+YEYl8GJabGa8KPaKEymG3Jun8DqSC0u+wp7R/f0ym7ZZmaKu9r0yBazCd9Ki
         NB8A==
X-Forwarded-Encrypted: i=1; AKwUvBw58+IBxSIfI4zOHlUKP7N4lgbARGC3rTVW4OytMDQZt0pK3k6hwg7qNxwDjyHIXOwlPM9m+PpD4Z92MtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3Geq0JI1G+FJu2W7j74SzHOVGsMY7l+xe3Psm9lP0O8k8tAsx
	BqjLrWy1k/6xCwkzdZhLeHDd0dysX34gKgv5AZPC5WBaadgPTiLlMHLjqflLw6gzkWecZI42Rb1
	aEcn1a5Qkd2gGWsgz/RsPBo+aXRqul8qxcW89gBtIvmzFnf68cgfInyBeUHaO4atyf3q09lp4zA
	==
X-Gm-Gg: AYBFou1fuh21uLti8USLwPR1nLITNm3aVGiTezwxKekPwgxmEkpv2sUt20nT27nbkVC
	Nw0fYQc1sSI+9+xEDmtmDu+T+SO/7btKS+0oMBFkH3aitTgtR9FEASLOeqEB2W+a63YCwjjB6sO
	iq4Alx8wJne+j0xlXodByvCmTHQ5kxxdRlLvidThltzbAb9JWBZOtw8Hy0MeyD+zDJCtIT6rEBA
	RNjeo8747EhuH35ViecGL5guFAJAvDPqtJBPqbni3KJnu0L8f5oGysxtlMofzdk1bF4JPu12e8Z
	nEtJIdgcgPzjoqonZfTrOS6kKfzgyqVsfQSCpjdGqDr84nKQMtVCyipL1GcH8qCXq0s=
X-Received: by 2002:a05:600c:6388:b0:4a1:e9c2:6c84 with SMTP id 5b1f17b1804b1-4a35acaed66mr171606615e9.18.1793106473533;
        Tue, 27 Oct 2026 06:07:53 -0700 (PDT)
X-Received: by 2002:a05:600c:6388:b0:4a1:e9c2:6c84 with SMTP id 5b1f17b1804b1-4a35acaed66mr171605725e9.18.1793106472915;
        Tue, 27 Oct 2026 06:07:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm691723785e9.1.2026.10.27.06.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:07:51 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:07:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Francesco Valla <francesco@valla.it>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Jason Wang <jasowangio@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 0/2] Add devicetree bindings for spi-virtio
Message-ID: <20261027090324-mutt-send-email-mst@kernel.org>
References: <20261027-spi-virtio-bindings-v2-0-67927b24b9d4@valla.it>
 <20261027065001-mutt-send-email-mst@kernel.org>
 <auCb8_ROuyXdTkQ4@bywater>
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
In-Reply-To: <auCb8_ROuyXdTkQ4@bywater>

On Tue, Oct 27, 2026 at 01:46:35PM +0100, Francesco Valla wrote:
> Hello Michael,
> 
> On Tue, Oct 27, 2026 at 06:50:51AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 27, 2026 at 08:26:32AM +0100, Francesco Valla wrote:
> > > When a virtio transport exposes a non-discoverable bus, the devicetree
> > > can be used to declare its child devices (if any) and/or other
> > > properties. To allow for that, the virtio framework searches for a node
> > > with a suitable compatible in virtio_device_of_init() when registering
> > > a device [1]; such compatible takes the form "virtio,deviceXX", where
> > > XX is the hexadecimal representation of the virtio device ID as defined
> > > by the virtio specification.
> > > 
> > > This patchset thus does not introduce a new functionality, but allows
> > > proper validation of nodes tied to spi-virtio devices, aligning SPI to
> > > what is already being done for e.g. I2C and GPIO virtio devices.
> > > It was sent initially as part of a different patchset [2], but since it
> > > complements a functionality that is de-facto already there and is useful
> > > beyond that specific use case it was sent separately (also following the
> > > maintainer's feedback there to separate it from remoteproc-specific
> > > changes).
> > > 
> > > This was tested both with virtio-mmio using qemu-system-aarch64 and with
> > > remoteproc-virtio with a Zephyr backend (with relevant remoteproc-virtio
> > > parts still not not upstreamed - see [2]).
> > > 
> > > I added myself as reviewer for the spi-virtio driver to be CC'd on any
> > > patch involving the new bindings.
> > > 
> > > Thank you!
> > > 
> > > Regards,
> > > Francesco
> > > 
> > > [1] https://elixir.bootlin.com/linux/v7.2.8/source/drivers/virtio/virtio.c#L488
> > > [2] https://lore.kernel.org/linux-remoteproc/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it/
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > 
> > I hope this can be merged through the devicetree maintainers,
> > I have no idea.
> > MAINTAINERS changes needs an ack from existing maintainers, of
> > course.
> > 
> 
> This might prove... difficult. My e-mails to the maintainer (Haixu Cui
> @quicinc.com) continue to be bounced back by the Qualcomm postmaster
> with a RecipientNotFound error. Maybe someone from Qualcomm can give me
> a lead on how to contact them?

Indeed, so it did for me.  Oh that's no good at all.

Mark, what's your take? The maintainer is MIA but we have a volunteer
maintainer here.

As far as I'm concerned

Acked-by: Michael S. Tsirkin <mst@redhat.com>




> > > Changes in v2:
> > > - Expanded the commit message to better explain the functionality and
> > >   the chosen compatible.
> > > - Redundant pieces dropped from bindings.
> > > - Link to v1: https://patch.msgid.link/20260929-spi-virtio-bindings-v1-0-6a0eef3213b3@valla.it
> > > 
> > > To: Haixu Cui <quic_haixcui@quicinc.com>
> > > To: Francesco Valla <francesco@valla.it>
> > > To: Mark Brown <broonie@kernel.org>
> > > To: Rob Herring <robh@kernel.org>
> > > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > To: Conor Dooley <conor+dt@kernel.org>
> > > Cc: virtualization@lists.linux.dev
> > > Cc: linux-spi@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > 
> > > ---
> > > Francesco Valla (2):
> > >       dt-bindings: spi: add spi-virtio
> > >       MAINTAINERS: add Francesco as spi-virtio reviewer
> > > 
> > >  .../devicetree/bindings/spi/spi-virtio.yaml        | 46 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  2 +
> > >  2 files changed, 48 insertions(+)
> > > ---
> > > base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> > > change-id: 20260927-spi-virtio-bindings-f4e350b2709a
> > > 
> > > Best regards,
> > > --  
> > > Francesco Valla <francesco@valla.it>
> > 
> 
> Regards,
> Francesco

