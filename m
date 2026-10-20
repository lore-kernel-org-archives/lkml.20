Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792538490;
	b=I/F8EgzxjRel5KrF8HvJ9uaOw553Tf99NaPKLgKSdQ3Y6w+WbnfYbKPKjrENmg0tGlz3
	 OXEGAZo7/aNNHLNENXrXYPF/n1mlNW9GAodrdiN9EF5y9jME9M49CiEJ/afvjnkZRxzkI
	 ZLRimrTueT7I+x9AEG8PCPdcs9ey9N1a/RAvEYQV9OEd7BJ5AuhUDLZ1wgVTc7q3IYg4+
	 nLBCAF9xcn92gxisiAmaRerlLW1oizZVMM3AJ73d9JgLZQdRJXk1VyJCmNEJItmuNlfb6
	 1r3F9wcpuu+GTRzuY5x5bPLs+2yzSUJVcv2z5ItCqSGn9zWoQEJs8R7oQcADVcmBCSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538490;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YJVYnLvaEVwucHW+x0AHb90jt4BURilSyy87F4cjKH4=;
	b=Zhb2j1WmTbSon3bJRM7QTAYLM1I6MnSvvHbh7dI7mgcBBreqgmK+v5kTonwIKCPiRoj+
	 JsFnaVTf/5U2M8vQ35ckfVhWSMFz6aRlJNtpFt3EyO/x0LzZmJR8oLApR7bNAB/mge8sJ
	 J7WhK8Xu/+xpF4o/pV1HaNo1kTr4Aja9XKLkgRJ1GSL1Umi/vgTGENHKnQuMfYgeyXzJs
	 LzDIDHk7KBB3cDkrGZqPmaWAjknBiMA7MoMKnt1KTAwTPCdCJMfPKSFfabicuUH9FGGEi
	 bF/31nRDi/5HDw4RbrE8L7RAZG2sBLgnta6KQVfifRzNLCPPh2/4pyOfflsQW8rXMlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SPy+1WhH;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pPN38QY+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDC8606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CDC8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SPy+1WhH;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pPN38QY+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792538488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YJVYnLvaEVwucHW+x0AHb90jt4BURilSyy87F4cjKH4=;
	b=SPy+1WhHri4mdCo0DVD/0prMQsg0YKg1bIKQuhQEVDVfotiW1BoW8unIC0L6g6dk5nMOWR
	33+q/JXF3cwR9sqczFqRlP29LpbzW8kcxmUxMpu7VfDkUyaAG7cCn2Tm2LCUf8IVXWCJgh
	0UQPCEaLQsaP8aVKYlDAAC1Jmdn6DcM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-H9aDGvQIPz6Eu1YpBJ9tHw-1; Tue, 20 Oct 2026 19:21:27 -0400
X-MC-Unique: H9aDGvQIPz6Eu1YpBJ9tHw-1
X-Mimecast-MFC-AGG-ID: H9aDGvQIPz6Eu1YpBJ9tHw_1792538486
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1e489f97fso968475e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792538486; x=1793143286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJVYnLvaEVwucHW+x0AHb90jt4BURilSyy87F4cjKH4=;
        b=pPN38QY+Q/90GQrL3H/REBLoscFnRJ+2erzMdVFFYQ7fxPVp9i8heH/2YFBk09gPxP
         IrkZz09Yb4encLshue4vKPZYJX/ivb6RIOCn1cndpaYFDaBE1AotZoyb6h4oYiihQB9H
         7ROi6cV/N2uKKUzko2LIjqaqDcXKzo39vgkxWR7YOSM38pTJfqDxmEDvgKNMgIe7rmP2
         TvxNTKvhbGmNkd9lqOo5XnnJKkwXZ+CH6fd4BjRDmXMow9Xk2rcmbBnHmUSkdj1KEl2q
         x0OPglAyN8U+agkavMABQjhIPz0g/ANdyxzPbqzRMAMsCo6Y/C1e2Y9srFkCHn7x4USC
         p52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538486; x=1793143286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJVYnLvaEVwucHW+x0AHb90jt4BURilSyy87F4cjKH4=;
        b=CNtrzsRp1mkAKRXCRB5bwyNeFQeA8ujKM1f7kKjYTDcFWmypIZuaFUX66sYCLI84+C
         bh7CuE5mfjOMRdOhTWGWpSH2lI+rAxFZMqnI6WFIPOolBJ07LxcscZs6HUHeYnXF8znC
         Ls6YRDYdpuiSGASEh2HUx+qFwoGsjNAPj4sUBSALg0Syduw1JHUup8ZLXlMMq6y3U5oX
         ucsoqJlhXxlt2jNXm1AxSPbFJEOAPy/sHkEM86vY+gcjy9FU3AeBbjU+CdKgSM1yXmfy
         yuVU2pXTt4cZ6aTng/XIVdN5+N0mfV3VtNz0l84eanc0ValG8oD+QJ2VJCGAARwRtxXE
         A+Qg==
X-Gm-Message-State: AFq9FYJqkK3AHMkk/ourrrhbt51h7j9h2OPq0LBSA8eWop4aT5vQbxBB
	wakX5ZpgAiSSDvS31u7GlX21ulwSzbSeEpt9Tv3P42YAnc1qzV6NcHvhbir+PN4i0E+6NrhYfxO
	YhjwbS9u771e7O2WGsjIRqqFnspYpww8RwhNpOu1plCFQkm0AAYyOz44UMXdOJXJ+dA==
X-Gm-Gg: AYBFou11r6dsQPcwtdPyDPSiQAWCVelciewk6o78fE24TMyj+V0/Ug2u8QUtzMhbanv
	CMcpHBhGtkBw4G4sKILEXocCLUMz4JtdWZWQaI20Xa3DKTONehvfQT5DN+YOovAEgx6An2PZzoe
	1Cr16b59jxKjeOkfq5GFlV3J7btQ67r8u+ZhFJuFhlcN4G6Fg+E5dCbf07TAfOHiRDfTH8zQizu
	/pNXi18zhuvyF8afzgYVPk0jRpPem00WzS0KfdBl+cQjhKJ5S+AjkzceI0VFQoLmfCtyT1UFEhW
	0+ziTcdCknzbU/2+pe9SdBZe5A8e44YZ2Ec766w3JPvhWOjKqPTU6Sta3mFht0jTomOXpg==
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr3979895e9.30.1792538486083;
        Tue, 20 Oct 2026 16:21:26 -0700 (PDT)
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr3979245e9.30.1792538485547;
        Tue, 20 Oct 2026 16:21:25 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm12797555e9.4.2026.10.20.16.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:21:24 -0700 (PDT)
Date: Tue, 20 Oct 2026 19:21:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Chris Arges <carges@cloudflare.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v3 6/8] net: add a sysctl to opt out of virtio net
 hdr checksum validation
Message-ID: <20261020192040-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020155917-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.2c9decc16892@gmail.com>
 <20261020162048-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.2eabbddbe6528@gmail.com>
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
In-Reply-To: <willemdebruijn.kernel.2eabbddbe6528@gmail.com>

On Tue, Oct 20, 2026 at 07:12:57PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Tue, Oct 20, 2026 at 04:19:41PM -0400, Willem de Bruijn wrote:
> > > Michael S. Tsirkin wrote:
> > > > On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > > > > Michael S. Tsirkin wrote:
> > > > > > The ingress validation as implemented by the previous
> > > > > > patch is stricter than what it replaced: GSO
> > > > > > packets whose checksum metadata matches no transport header are
> > > > > > dropped, and non-GSO ones get their checksum completed in place.
> > > > > > Such packets used to pass with the metadata unvalidated,
> > > > > > and with no overhead.
> > > > > > 
> > > > > > I judge that this should not affect any deployments, but there is still
> > > > > > some risk that it does.  In case a deployment depends on them anyway,
> > > > > > provide a per-netns switch to get the old behavior back:
> > > > > > 
> > > > > > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > > > > > 
> > > > > > The default is validating.
> > > > > > 
> > > > > > Assisted-by: LLM
> > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > ---
> > > > > >  Documentation/admin-guide/sysctl/net.rst | 19 ++++++++
> > > > > >  include/linux/virtio_net.h               | 23 +++++++++
> > > > > >  include/net/netns/core.h                 |  1 +
> > > > > >  net/core/dev.c                           |  6 +++
> > > > > >  net/core/net_namespace.c                 |  1 +
> > > > > >  net/core/sysctl_net_core.c               | 60 ++++++++++++++++++++++++
> > > > > >  6 files changed, 110 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > > > > index e586e17fc7a5..b1a1c4714b22 100644
> > > > > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > > > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > > > > @@ -246,6 +246,25 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > > > > >  Default: 1 (on)
> > > > > >  
> > > > > >  
> > > > > > +virtio_net_hdr_csum_check
> > > > > > +-------------------------
> > > > > 
> > > > > virtio_net_hdr_validate? In case we do have to add more validation
> > > > > later.
> > > > 
> > > > If you insist. My worry would be what if that validation is again
> > > > user-visible somehow and we need to distinguish users who want
> > > > to disable that future thing and users who want to disable
> > > > just this current thing.
> > > > 
> > > > Hard to predict the future. But I will go with your intuition.
> > > 
> > > Thanks, but definitely feel free to ignore my suggestions.
> > > 
> > > My intuition would be to define as
> > > 
> > > 0: off
> > > 1: everything one
> > > 2+: sadly needed fudge values because we keep having to tighten,
> > >     but some crazy workloads need to opt-out to avoid breakage.
> > 
> > yes you said i just do not get how it will work for userspace,
> > maybe u can explain?
> > 
> > and what specifically is needed right now, while we
> > just have 1.
> 
> Right now the sysctl is boolean.
> 
> If we define it as a narrow, very precisely defined sysctl, then its
> exact behavior is set in stone.
> 
> If we then add additional validation later, that can similarly have
> unintended breakage of weird users, we need to add another sysctl.
> 
> And if that validation is not entirely independent, i.e., builds on
> this, you get a weird set of interdependent sysctls.
> 
> While in general systems will run with all validation enabled, unless
> they do something weird that gets hit by validation.
> 
> A single broadly defined sysctl ("validate input at the source") can
> be refined over time, including to expand to validation of other
> virtio_net_hdr fields or protocol combinations.
> 
> Even if defining it more broadly we can still leave it a boolean:
> all validation on or off.
> 
> Or, optionally, we can also define additional validation levels,
> e.g, 0:off, 1:everything-on, 2:validate-csum-only.
> 
> 
> 

So I will just rename it to validate, we will see down the road
how it plays out?

-- 
MST

