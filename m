Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792538447;
	b=m8rWMEXRBwzcdpZadevQYg7TVAlby3l5IN+DfWnrr9GwvY/4ujs1lWyQVSMLP0IBUMXD
	 GKg34ThXLtBkSj9otuPgvC+A19A4TMGhp8/Ngd52+h2lAyt2XYSEsZYtHhLPbUBXgdOh4
	 ApkcioYJHLGlVIjG2LJa/KgoBch8PCLA2ptWQEJo1EzcIj81VOt77fmuvSDvp18TTFw/Z
	 p+NxH71BRxTl4hcxpctSXPcaBjN4lDoCdGbRXbW9inxjqxMBLy2HgLSuG50wqMBTUQI5v
	 NlrD0chg3199V4ltWsJ09Jd6AZap0UEs2TDnLhRubPGUlQgqPgv9yh16X08JDyksHQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538447;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=P5fko3A9W0gmx80fHOluIXSlmSb91oJTUY13Ek4gCSw=;
	b=bnl9SfFJ1jfa0JSWZ45GDEiDIwtTL0/241HFKSe1e6HhROwGXHxYQIpNPAOuK1YRiaqF
	 3WkbumdEzsxpOZ1pikE+pgdwr9O8hAAxZSjr5CtQXGm4d4BvWldeU6mHoX1DPG3QKxRPg
	 5h6ECDAGY57IEktnP7wu/gChcDj7wV9b2udZrtJs4CxXqUD2szBlpvkXX+I9UbBMeVjGs
	 Ng6W0m3srSUCOOmysAeTL8UwA7FSNTIJjdpTasbumoGXfK/ydH/2ZXI+CdjbANbuOh+kI
	 K469DXxtSeK49mWI2bHhbOrptaBJsVx5aOLyQSDS2rLZp8TEpSeYeuWx6zu3h42c5XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VydcMoJz;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Ue/UIrpr";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C5606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E97C5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VydcMoJz;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ue/UIrpr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792538446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5fko3A9W0gmx80fHOluIXSlmSb91oJTUY13Ek4gCSw=;
	b=VydcMoJzMNfSya2vUJ9j5qaYApS4mXXsuDBVDp1CJDQ9r869wd8HmyTIoLBYsqB0liZKUl
	DMh3kA0G0sbBQ4pHUeHP95vCvRlA49XiNZGVpVCByos/8BpUeY2l/yyMqmnZQ5GdKYV7Kx
	1jQ3hTweRDL0WoK3L8g/4/Qrrc2f26w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-naTGym48MuyteWwm7_FlxA-1; Tue, 20 Oct 2026 23:20:38 +0000
X-MC-Unique: naTGym48MuyteWwm7_FlxA-1
X-Mimecast-MFC-AGG-ID: naTGym48MuyteWwm7_FlxA_1792538437
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48dfaaea30cso84137f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792538437; x=1793143237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5fko3A9W0gmx80fHOluIXSlmSb91oJTUY13Ek4gCSw=;
        b=Ue/UIrprYHR+2XIIAYcBHSmjkR7zGegvXtlSz7Jt8tWZvBDV8M1fah4wIjTmd8Cp1n
         q9aNpJ3rq3lPhXkzt1sjaOZIfuwvzjDd4IpgGyWH2T8vooQDgdvS7d0awY5X9txSa7Qs
         f+hzeanNcZOYNbByt/VTBoJ3RNsHq1n3ReI25+2Cd2uqRKHuwxi0b1gdrBEM0leA6LQO
         kGw5k9dxv5yyxzu1A8v9bJZMBag6GexyX9ytTg0NkNcZZPDX9Z7tFIq/UPP1RPXnvadX
         QwjCDwhVN8FrTSPuuN0X45t57WwPrrj1NCSM1VXnXeo9VC0LXaS8J6yOGA3p8qiOefz+
         u9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538437; x=1793143237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5fko3A9W0gmx80fHOluIXSlmSb91oJTUY13Ek4gCSw=;
        b=0DIXP8v04TQwnkglngiOS9soF9cyi2q9sta8sqzcs0nEc4vkVwJg3IGZOHTdigY721
         S+uyHs4p99xYicNronSMlfIYr1Y3srMzgocJqREVhRpolzAmND4aKDb/37n10wH1D6Am
         WSHtXteQ7Ga0SfMKUaiaUxExw34QBxfcoINQdiem9OIJPagaeByt0LqgCwZI07LJd2Rw
         FDhn7C0Rvdl/8L4GeC4T90KXfOg2/fgcpIR/sUPcj6pLa5zK2+3q82zBSoavIRXpMovZ
         DqYgnpLx2pw6QeOsibHRnzF02rcE440MD5gY1g8Rjd7w6cQIvohdL+DCY+wC2W7t1Aac
         b1Zw==
X-Gm-Message-State: AFq9FYL1p/7E+QcUGjoFj+x6Y1R7GVI/lRsPBydFFjGI+EkawKSVZcmM
	3h66mu2vLU5VLt54Ko+MQ+SHyraHLD9e9J+Eg5DtQ3C9qa3MQPyGjdpzZsB/nPpGH5JPG7mE+bY
	umqGqNIIJ6B9s3X1nURCUUscoxmSeQcnNcmwigTSk6MOVXCbB2CL7owivRc5VitC0tw==
X-Gm-Gg: AYBFou23/TJnsCJvgTH7PKRi5pD/G1UqDTatoRPXeFOYBORKnwHJDwSEnXnE3TvUCwQ
	gEuVKevBK6nx++IDmcV9Z1tKFvhQ4tMLcs4z2dgWSaUSHmU/3KPu41HrvGsv7hncgW++86FQF1E
	xu9rE1UJWovFbgsdgK2Nze1S2VToycEsJQ0GTaRWTEsh05rMUC53Kv2oIq/qOm/+DW3HUch4o0D
	FQI07sRbkU5s28YUPswhCvyQBFWknl0O39DUj2zzig/ADgoqnPOc6DXtTblLK6riejMFzSYW8++
	wGJcl8ej2J1tuB4G94IPQQL0XlUsk//8yQxapIyBnuXxC/Z109cDz2bwXWPaEwNN+iUcsQ==
X-Received: by 2002:a05:6000:2313:b0:48e:d27:bee4 with SMTP id ffacd0b85a97d-48e2642ce22mr436272f8f.2.1792538437146;
        Tue, 20 Oct 2026 16:20:37 -0700 (PDT)
X-Received: by 2002:a05:6000:2313:b0:48e:d27:bee4 with SMTP id ffacd0b85a97d-48e2642ce22mr436239f8f.2.1792538436673;
        Tue, 20 Oct 2026 16:20:36 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0a2sm1544348f8f.10.2026.10.20.16.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:20:35 -0700 (PDT)
Date: Tue, 20 Oct 2026 19:20:31 -0400
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
Message-ID: <20261020191918-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020165610-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.34b42ddc625c5@gmail.com>
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
In-Reply-To: <willemdebruijn.kernel.34b42ddc625c5@gmail.com>

On Tue, Oct 20, 2026 at 07:13:42PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > > > +/*
> > > > + * Protects changes to virtio_net_hdr_csum_check_disabled_key and each
> > > > + * net->core.sysctl_virtio_net_hdr_csum_check. Readers don't use a lock.
> > > 
> > > it appears that they take the mutex_lock below
> > 
> > Some of them? But
> > virtio_net_hdr_csum_check_disabled doesn't, that's the point, right?
> > 
> Yes, but the statement is then too absolute:
> _some_ (or most) readers don't use a lock.

don't use->don't need?

