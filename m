Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE84C54A7CC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923797; cv=none; b=d1Twa8Mbf7+NTlkLRMMmsx4CyxfHtd8Xikc/hZG/rsiO2FXjRcwysarBN2LVN4cmC7KQ2lw+QKyztlUIn4JTBZ4yREltETbcrfDWGIXpqmcbnbiKwfT8kOWC+Z5HbLUHrxvItqEkiv3P7rvpMANBZYzZiXwkkHg8PwfAwRc0XIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923797; c=relaxed/simple;
	bh=qr393F5r/2jQO0c4JjlHJv+eISvyBv0hBTxf+c47mwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECj8Q2xjrjQlQn7JZS7VAnVSIloWbJV6B/328FgAZc25dT71uvk7Jloj+yfGLsgdGi3fCNonsVlXr7JmkoQg1jzDsJt4vd83m+6o9Mgpm19iw9nsMLpd8ZNF2bMZGYfOIZABSvTAXMjM/DaFcDYvMJ0529HC93NtvfXQA53kgAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQLgyQJq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IYc42nIU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQLgyQJq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IYc42nIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791923794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gob6f96K1jvvU2I5Uy71RxEi5G9EXcKMzspTIBE+Z0A=;
	b=SQLgyQJqyS8yonQvvJTxs6Hvi0gkZJK30i+yjYXDx2GRMfOjPWHPOaD4hI7KaxpfShpz/w
	8GdzKADgtiJ0EhXR9vektpg7PMteYuTsVYmdpYKQUkkU10E3xoTx3uHIGZThUpCeVb/Db/
	sAjTppsY8UXaN4jWJvtP8Hy7PPC1qko=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-DZFMTK3HO9mh1k3fb6lzUg-1; Tue, 13 Oct 2026 20:36:33 +0000
X-MC-Unique: DZFMTK3HO9mh1k3fb6lzUg-1
X-Mimecast-MFC-AGG-ID: DZFMTK3HO9mh1k3fb6lzUg_1791923792
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c427421f6so2364148f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791923792; x=1792528592; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gob6f96K1jvvU2I5Uy71RxEi5G9EXcKMzspTIBE+Z0A=;
        b=IYc42nIU9W8DBfRIhBirfHP4T1F+A/nSvdPYBqaYLPc6utOVXw+yy2qRJOBIW+TM++
         5dDh4K+fB2ogf5a/2oTV0XrfspMLgH/jTYh7Z00w6tUnzLC6KGpCm6uuKSwCe+dju3CB
         oefUXrvBaqxZlHKd2HMUBE9D+jxyaYxUZXTi4X+SPeQYv8PMWqR0fCn1RZ5p0tiPDkNh
         6Ue/1py4o+flu6S/p7LNcMkCWHxb/T5WdnzZB08mq+1td86zW285cQLA1UlMvQ7E69wr
         Czwbvi+Py11By7ZN4rElkndzK49ldsKQBbbFsSQ5Hkv33zIeULGmzwr1fELPTZajc1Hl
         2kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923792; x=1792528592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gob6f96K1jvvU2I5Uy71RxEi5G9EXcKMzspTIBE+Z0A=;
        b=ql58ISv9NSK+z0eXNyVQMumzzn1MiCu8zfhKn834EuljOuK6OY+2FisAYiITQbAxnh
         dd8gNYKDbZanqtCVTNkVxlXwQk+wp9yHPi0ARVZSk/1ue0MDETP58daMgbD4Om2oCx+R
         7OdePDZXcQtqE+dfgjdnwvs9qYbeJJnc1FEzbUB8VDDZ4xQMRfj3VvIkQE/FrNZdopoo
         3uX1BXThWgIYCK1Zt/4jJvpFA8ivfSvXdic0R+FncAbeZ8aglVcS96lCpReXpFrBT0UE
         URurZ+KN7pDqyQkC5WEA1SyuvXOTmHeFb7Wb2uW10V3lmYouCKt+6ZkFKzXkgASGkKqi
         D/UQ==
X-Gm-Message-State: AFq9FYIlILPDTetumA7gWuNGDFYraFBUj3rb8pQ/R+ROs9aGnQ16tX2r
	KuqHzjJVxSfpj/R2hZbdxy3/4anB5ecrZBdg9qzCJhmYcRgnaswJYVHuhPv6iv3rNaxy38BKooc
	nl48BtuwFNXyN6ZALcco9f11qZQzY85LUc5pUNNfCYKVO0QWZxZWBpVTAAfEBxwLtYQ==
X-Gm-Gg: AYBFou1PPKcDYtOEBPj1kYJkgxf4s4Eei/2Oh0LhRBhvkrAeJ3Z8BXuMgBTR0EG97bd
	XvFMBvmWHzeuZNjuum1M/mKaOMXoB0rSOhX582YLT2KlUeTIovw/cClsmFHBGBBIJnucvsPO147
	4s2ywfYTYRvJpFiSlkKaDwt1CBjZH9eoluTRB165Fc4P1qbtTE/2/FwNoSO9nShFp6EJyotmEE3
	kd4HLZyrJnZ67AOZcyKSRxc/p8P27B6SSFydT5dMmwSW1j/qv1cjNf29gEsMKCDI1sOKK+D1Xhn
	liUyPeaLn6kVDkDecX16R24ezNO+cmww2hXsauKg2YjA+4BkIhALItMnKz/iyPNnG4Jc4A==
X-Received: by 2002:a05:600c:4fd5:b0:4a0:5b:7bc0 with SMTP id 5b1f17b1804b1-4a18e49a7e3mr282057265e9.21.1791923792005;
        Tue, 13 Oct 2026 13:36:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4fd5:b0:4a0:5b:7bc0 with SMTP id 5b1f17b1804b1-4a18e49a7e3mr282055705e9.21.1791923789690;
        Tue, 13 Oct 2026 13:36:29 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm158812405e9.3.2026.10.13.13.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:36:28 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:36:25 -0400
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
	Max Krasnyansky <maxk@qualcomm.com>,
	Paulos Yibelo <habte.yibelo@gmail.com>,
	Chris Arges <carges@cloudflare.com>
Subject: Re: [PATCH net-next 0/4] more virtio-net csum hardening
Message-ID: <20261013163109-mutt-send-email-mst@kernel.org>
References: <cover.1791887415.git.mst@redhat.com>
 <CAF=yD-JhTbmYmHUkkruPcyvSWv0QhVeGWC=K=ZvvpMdkzA-jig@mail.gmail.com>
 <20261013143716-mutt-send-email-mst@kernel.org>
 <CAF=yD-LLNm1K5r37-y2thyvLJN58ruffUUHy-6BUh1CGVmep0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF=yD-LLNm1K5r37-y2thyvLJN58ruffUUHy-6BUh1CGVmep0Q@mail.gmail.com>

On Tue, Oct 13, 2026 at 02:29:53PM -0600, Willem de Bruijn wrote:
> On Tue, Oct 13, 2026 at 12:41 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Oct 13, 2026 at 08:41:19AM -0600, Willem de Bruijn wrote:
> > > On Tue, Oct 13, 2026 at 4:58 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > Allowing untrusted hardware to specify csum start/offset for
> > > > CHECKSUM_PARTIAL was not a good idea, because, if it edits the packet
> > > > outside the actual checksum, and depending on the setup, the networking
> > > > stack could be looking at the packet both before and after the edit, and
> > > > seeing different results.
> > > >
> > > > Previously, commit 6785011f8b16 ("ipv4: validate checksum_start before
> > > > completing checksum") validated all known instances where this
> > > > causes the most grief, but the real fix is to make sure
> > > > that either only actual checksum fields are ever edited,
> > > > or the checksum is completed before the net stack looks at it,
> > > > so it is always consistent.
> > >
> > > +1 on the general approach of performing the checksum offload at
> > > input, unless the input can easily be validated to be one of a few
> > > common protocols. That greatly reduces the risk vs my previous attempt
> > > at trying to drop.
> > >
> > > Since we do not know the full extent of grief, I think this too should
> > > go to net and stable.
> >
> > I think it needs a bit more testing to be frank, I do not see it
> > wait months out of the tree. So if this lands in next before the
> > merge window, we are good I think. If we miss that I will target net.
> >
> >
> > > That would mean initially a single patch that
> > > touches as few files as possible. The helper function in
> > > include/linux/ip.h and conversion of existing open coded parsers to
> > > use that can follow up later in net-next.
> >
> > I don't see the value to be frank.
> > What moving code between files accomplishes, I donnu.
> > Squashing things surely makes review harder?
> > Does your backporting system really struggle with trivial
> > dependencies like this?
> >
> > I can drop patch 2 and will if I am targeting net.
> 
> Good. This is not about "my" backporting, but upstream stable.
> Refactor patches do not belong there.
>
> Since patch 3 might have to be backported in the future if a serious
> abuse surfaces, even if you now land it in net-next, it is better to
> not depend on other patches.

Right. While this is targeting next, I will reorder it last in series so
it's obvious for people it can be dropped.

Thanks a lot for the review!

> > >
> > > > This basically does this: checksum at ingress, except in a narrow list
> > > > of specified known good cases.
> > > >
> > > > Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> > > >
> > > > Michael S. Tsirkin (4):
> > > >   net: add ip4_parse()
> > > >   net: use ip4_parse() in receive validation
> > > >   net: resolve uncommon partial checksums at ingress
> > > >   net: account for ingress-resolved virtio net hdr state
> >

