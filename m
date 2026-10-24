Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858819;
	b=y0lcuRQENCbKd+bZ4NQ50eb9JEgA4DsnY6PbovqLAsFhAjRvCqEUEx1fTUSS3paLmw5w
	 ZPPmnn8b+WUMorUC6pU/QQAzNCeEHCCZt2qwUdU+mE8FHHA6BwQ+XOKSQjR56VXBLMCbt
	 vJBUkVYaAFppkVSwJagutUxiWbuh6StwtfJTuK53/WWe4g7cuyV7XoG7SOicNPKzlQv5A
	 EjmgySDbugBogfIdVS2gf/pO0x45D/ehS8jF/MCf0E3fDuTEemWfESDbZZ2PoJWZsCXh8
	 bA7MELq9/Rq/jxIXNIabZd6x61+UUyIobUhrPiNSqEGIU9MypkzOIXn54H69epiGjrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858819;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JnidHUsBQArt33vLjV0kqnv/bWxmzPm4EkJn55+rvF0=;
	b=kLC/KtgSYTGBpl/m8Cx48+TTC0jRrFUakJy6x1eoqT7BaSo5bP2P/fgWr7d31Hue8H3n
	 HruQ5pnrbaFrz7PBd3BT4AirrYRVfOfrO/7bt8h20T2hXzZnQ8zmFsLqt0WCfu/JfVX8M
	 N4Kjf4T8Novhm0LYIKjJFict5Bauf45C3JkFZdATTliIZmhmQOedBr2cgXKLDtI4vJ31e
	 V+8bICLUmbiKKZ3EaZFgpjxzA0kkWs9EV6CFflOe2f+sbj1zygBas3Kh+BxR7NnTvomuA
	 stOpeG7pfb21odPhmhPqbJN7g5722EV4TsX4dbpC0iYf+eyZdyNi/nXounSQUPzK+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LYjbY+Ni;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mY4M9eO5;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858FE606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858FE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LYjbY+Ni;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mY4M9eO5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792858817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JnidHUsBQArt33vLjV0kqnv/bWxmzPm4EkJn55+rvF0=;
	b=LYjbY+NiuAzlv1S0TktrcP/XaFUeM7qeCFX6aOm0YNJMr00LCp7a8SxFM9dLxDs4XOc4lI
	4DuvNn0Gp+0vKZkIadnmEtlUNXRXPkdNbb4spTumNa1dsCL8QcOeN+FfyEiTX5jSGVepSy
	npmCeYTjczzO0S2TagjkCbN4SvT5IbA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-zRASIs6-PfqhfVIgGXgmdg-1; Sat, 24 Oct 2026 12:20:15 -0400
X-MC-Unique: zRASIs6-PfqhfVIgGXgmdg-1
X-Mimecast-MFC-AGG-ID: zRASIs6-PfqhfVIgGXgmdg_1792858815
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so1632679f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792858815; x=1793463615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JnidHUsBQArt33vLjV0kqnv/bWxmzPm4EkJn55+rvF0=;
        b=mY4M9eO5GoXoeQyWRaP5V1FLbHOvq2Lj35+r1IR/P3fYmebBhOb2SfSthoxC/2nOPX
         Rw+N+nG2WHUFTjcyCokasuaWOxs5aLgfsiG9mYhPtd7HMDdK4M5Vuut9EewmuyodhkK3
         1/7Wigtr01thpHmX/WhiSMT6s7YdVeCyNfctJYNd8zdJTV1JI3etdZ3UiWWhgPAEUwnX
         HEAYiyNEegm5xFt9csnNtRkcWghfqMA2j2c0KLKBOOAKRMByRPKlvSr4wRQQu9SAvO+K
         M4nWZoepyXQzT/ksLVh17matGeN0b9boYZa97Y/rBztVWE1XJOGWtPBiZsi+Qk0cqlkP
         AJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858815; x=1793463615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JnidHUsBQArt33vLjV0kqnv/bWxmzPm4EkJn55+rvF0=;
        b=lOZKTDYtxsY7xlaXPBkmgbx/wfEUaqvDdxjSjsGmKaVgT06KWnE4VXDuLQNFAFYhI6
         pLA+9xYaResblOkA0uj4f5ANnkOwopuKbtHQhoDghFQP85z79IyU3JbYUdoTf0p1splG
         JqPKAKhMhkJT9OyAONWveggmmpeizhfRFLkpBs7oV0yQAPxX7BdtxTRjUeE6uQMrvkOu
         9KgC73ZWcKu3tTCV46CNuhtPLHOKSE2xJfkxs2HfkUOReHae1PhKsEXdIWYYAiSjmmi9
         vtV0lgtAOppwr18AQijhPDIt395jAn6LitZf9LgNfg9fiyBNDIuegXxct8uXweLMqH+2
         CMDA==
X-Gm-Message-State: AFq9FYIJDgMc1p1FlRO2K11QcyOHH3IOky2DMAh8tP5KxY+JROv095rM
	uGGHRWlyX2YtDj9YlmAdTWrTwY2Jlgf31fafiyhlJlsPV/FlqGO3LCl4e2dQY5d456vAd6Qcxrx
	mgiRAaS6XdPR+7erMZ2Al6skOP3j8kWKuAGdHIjMUnO1Wjb/+VnSeU6UvN04fyRpVOQ==
X-Gm-Gg: AYBFou3gy8XaY45ZqWWjBEJZcZ7dTc7ggTBq+GMfR+7hbc6ej2v7yLo6wvMkasi62zu
	7WCM7OiPyMIv+x8vTeTranRUn9zkenManRbypCixufaxxIlN5AHcZ3HEkb9BRdDfjEZOvP7aH27
	BccRQ6hnMVhcaxBNyG4Z/kgew3U/dogDdJTTA6VLlhlFJRguX15bdxjAKQqp6Dqe9nm1uJOKukp
	YgyevrV6PaZ/Z42wG6WHl400r+ZG1Mrv2ISq0nC0ABbc6NDnZJ7kqBDD7PsE9SxAyQwkYnWow0w
	9C4gyRe8kryCtJjhZHwk+kBhPzxZcFAKBmYsMKD31uluOSiw/ugnWhUXQ2o+cxVbEaiViEI=
X-Received: by 2002:a05:6000:4b1e:b0:48d:df08:307c with SMTP id ffacd0b85a97d-48e3eb94526mr3420689f8f.44.1792858814516;
        Sat, 24 Oct 2026 09:20:14 -0700 (PDT)
X-Received: by 2002:a05:6000:4b1e:b0:48d:df08:307c with SMTP id ffacd0b85a97d-48e3eb94526mr3420647f8f.44.1792858813925;
        Sat, 24 Oct 2026 09:20:13 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm4812439f8f.59.2026.10.24.09.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:20:12 -0700 (PDT)
Date: Sat, 24 Oct 2026 12:20:09 -0400
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
	Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH net v6 0/5] more virtio-net csum hardening
Message-ID: <20261024121852-mutt-send-email-mst@kernel.org>
References: <cover.1792768096.git.mst@redhat.com>
 <20261024113809-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.288f04be304a@gmail.com>
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
In-Reply-To: <willemdebruijn.kernel.288f04be304a@gmail.com>

On Sat, Oct 24, 2026 at 12:08:55PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Fri, Oct 23, 2026 at 11:09:17AM -0400, Michael S. Tsirkin wrote:
> > > 
> > > Okay this seems to be converging.... But sashiko did find some issues I
> > > thought are best fixed. Specifically I thought of a better way to handle
> > > short gso in a tunnel - just clear tunnel gso! As a side effect we now
> > > fix up the checksum for these dodgy packets like we did before, instead
> > > of a drop. Good. And more false positives that prompted me to write a
> > > bit more comments. So here goes.
> > > 
> > > Apologies for reposting so frequently, I know netdev bot will be unhappy
> > > with that.  But Paulos's report made a lot of publicity, there is a lot
> > > of people looking into this, so I feel there's value in defending
> > > against all this class of issues sooner rather than later.
> > > 
> > > The issues were mostly found by code inspection, but all reproduced by
> > > me in a VM.
> > 
> > Ugh. I found another wrinkle( Firewalls that shape the payload.
> > They are currently seem to simply be hoping most traffic is CHECKSUM_PARTIAL and
> > only looking at that, and that will break.
> > 
> > I am not sure what to do yet. Extending the sysctl knob to control what
> > happens if validation fails: pass/drop/complete - is the best I could
> > come up with. Or ignore the issue. Or just forget the complete at input hack
> > and drop if we can't figure it out.
> 
> Sounds like such users will just have to disable the sysctl for now: pass.
> 
> And update their firewall, then reenable the sysctl?
> 
> Does adding a third drop option help in any way? The sysctl is the safety
> valve to go back to old behavior.

Yes, maybe that's enough. I was just hopeful there's no known broken
valid setup, now not only we found it, is is actually unfixable (
Still trying to decide what to do.

-- 
MST

