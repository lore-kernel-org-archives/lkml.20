Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504914;
	b=4lyAWN9c37Uczt4D34Nd9yrKdgH+5lV7VyGDz1zGMRgJ3vSznH0mf59QC/sirTGZP0bz
	 HQgDU7s/sl7lqA36ecDY35EfPq8tAnVThUMFIgTrvLA4ip1PI89hpUCZTz3FhtEg43AFa
	 it5appbGSyZCB36jLtdVu2z6vYtswvMSyhOjXT4vxJE57hLq+l0FXwujbtnHYZA4MbdrI
	 rww4PTOi+g7SiP9nO7jx7P33G+GiUNyGS+TXeVZuJ6FB8MHz6Brct68ZPdhtbusJc6+R7
	 wIuYTJ1KeOV6y0kAERv2JSD2Wqe/gqkh6NHcBrMUGwZSXrZMvVPlATalfe7ez+UCLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4WqTnmYwNtZuc8yE6m3Wj6x4W67f77rHRf4agpevk0c=;
	b=scD5EHqHvc9uU93tNRWSfc7+8W3h/VVhgZi7SZWbk7hlBqyqSr5dEHkOOCGzozhOpgnz
	 swjUaTh2MyqyFlldwjGbpIdqWSXW0xZdj44KX0lq3cFH6AmeoEWYZVM15OQr65LJTEfCF
	 PhlysLLYaoj1oc5PfO8w/bT1LzT5wtoinUo+ZdlchCJieXRUgdqkeT1/Mb/1AD0b5dtHT
	 h4/huOphyaDrvybvBIlw+IrUVYS7jBSKQQTmm31JdzVydyNx8h8lMxg11HBo999SkdaTC
	 O2XhT+eYqH4dHA4+mM6dlYKFU+xs94OhBuFHaYmZrbelMoisnjnMhSHaAmpp2kUSS9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=de5rgw+k;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8805F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=de5rgw+k
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso38667815e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504912; x=1793109712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WqTnmYwNtZuc8yE6m3Wj6x4W67f77rHRf4agpevk0c=;
        b=de5rgw+k1ip+RCToB/0zFGwdEzw6BeOZ2hldM8GnpgRW5HItuajq1CB2OZ12a91oI6
         UbLuHxn5jG14aXCRRM2hRvhkbFsnaoZeb57mzykK3ZGVKe3/1iwEJOSKW7vIihvIRF1d
         YgVrEbUv9Yi7Cm/Hkol9PQmqddnBUf9JHCU2gTuKaLvuebg+LYdywGrBaMs6MjzfJ+GV
         mUfZdnZZ07tRCgpvR5t2zQ0IcTcNepxuwJBYf6YGe6Me6Mqs129kb81o+AwlwePxrqRx
         8HBQHf9hjJ49kJtPAZPJ3gDhEMzLFqRVHeORumP5l0zcoxyah1mMb/yN+6f07egIszKm
         Lp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504912; x=1793109712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WqTnmYwNtZuc8yE6m3Wj6x4W67f77rHRf4agpevk0c=;
        b=XwT+H+dlOHQ4gRTzL9j4PCiuY4hvcLyOl8J3uKtKZePyq7TFNtTaSxRIiceQtVMcBF
         F2rEiDc4HvPUE9/jrlTM+wP5SJoF3vhLk/rKwf3u+CJhHasDH+RQ9C0On2Mw784xfTjR
         xgbJ/x+Ro2mI4kNtg4rdZIhVN0aKdaMaSnv9mAcpVz+V2m9obxK9Y/4jWBlga1Lfbr9P
         VsvWwAVvRlJMiZPP0X3lFK3Zf6BJMGGFTwlAuzHVmK/5lzPpDsRRiS8GghRXYE9g/o6q
         EJJiUFI3FcGAX7PuKUWWUMfZPqVXpsotDwj2rNblYMVZJR5gifrad5IU8FxFyS8N5ufp
         6vsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ6FMyLjgjQ4pKmTkHswRzFjRbzoSMRFJmWRuNr2/mgi94W16Yqk5xvvCXN8NSBwEOkxpIpvpvb52leDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJopQopv+bEs2MRDyOrt3CClHkbWnlm0ilde5kwA31ttQ54ov2D
	sZ0+2PGJHgxSDql2c7fKJNd2t5VffVtKZXL0ApVxrGPyn3AF1cRD4zpZ
X-Gm-Gg: AYBFou0ltuluvHw9j4eOw04yVBxS1LThO1+V5kshB+WScYNRMwM7ddP+ioI/zMMUwve
	qbHD4si8a5ay7Et+ROYJFp+I8ax3sQFc71V/Ajd0B4C7s1EKk1r2/ftP1IhC95fImtskO3yFJG8
	h9l7ifnSXkBIy8ki23YQfjWMXVsJaRJfVOImgpY3eG6UWKo9od/7jU6zxw2kTs0L4LSgedbQsCz
	lnZsKMsy5wOnZ1Ev7MxY/ufMQ4wNbILjKB+3bbKaxMR/NjsVQ78sxyzYqbfONPmrqORUKjgLGaf
	ZpfmxK+bVnDuOYRNNoU1DFf/hfAsLMk+FK4Ha0PSNpVwvD2NFECkFqJCQf9uzNCErJEwAV0r+00
	iSdO1J94UDbVnj0PEmR5APHI6RVqEHCuFH2nb9DTvq8JwScOxtqlAkK06PYPVSdZ6vDn2cnXL/P
	MRDEYnV1pnenXsDaaEWwRD/vdPFDmjhdcPaHQ7u0kvFKbiKXWP+nJabnOOF/VH1BKm8+UYzcaqX
	xwqiqWskIWyGHA8LGF4uXtUKyCMkK4g2DgTs9z8d+O3H6ECqw1/227+05s=
X-Received: by 2002:a05:600c:4f95:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1d75e3c9amr244362825e9.9.1792504911471;
        Tue, 20 Oct 2026 07:01:51 -0700 (PDT)
Received: from C422HJQPQG-Fractile ([150.251.170.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm67581075e9.6.2026.10.20.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:01:50 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:01:46 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?iso-8859-1?Q?Wilczy=B4nski?= <kwilczynski@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/7] rust: io: split IoCapable into IoReadable and
 IoWritable
Message-ID: <atd0SnEL1ZLXHxVU@C422HJQPQG-Fractile>
References: <20261015-io-access-modes-v1-0-93611b84b5e3@collabora.com>
 <20261015-io-access-modes-v1-1-93611b84b5e3@collabora.com>
 <DM9NGD5R8AP9.C4K59HIUYFDQ@garyguo.net>
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
In-Reply-To: <DM9NGD5R8AP9.C4K59HIUYFDQ@garyguo.net>

On Tue, Oct 20, 2026 at 01:04:03PM +0100, Gary Guo wrote:
> On Thu Oct 15, 2026 at 1:39 PM BST, Daniel Almeida wrote:
> > `IoCapable<T>` provides both `io_read` and `io_write`, so a backend that
> > supports accesses of type `T` supports them in both directions, and every
> > (non-copy) `Io` method that reads or writes a value requires both. There
> > is no way to express a backend, or a view, that can only be read or only
> > be written.
> >
> > Thus, replace `IoCapable<T>` with an `IoReadable<T>` trait holding
> > `io_read` and an `IoWritable<T>` trait holding `io_write`, and implement
> > both for all existing backends. The non-copy `Io` methods that read a
> > value now require `IoReadable` and those that write one require
> > `IoWritable`. `update` and `try_update` read and then write, so they
> > require both.
> >
> > The copy methods use `IoCopyable` and are not changed here.
> >
> > No functional change intended. This prepares for read-only and write-only
> > views, added in a following patch.
> 
> I think by Rust convention these should be named `IoRead`/`IoWrite`, but we've
> aleady named this `IoCapable` and I further made the mistake of adding
> `IoCopyable`...
> 
> So I guess I'm not in a good position to ask for name change, but we should
> consider it. Apart from the name:

IMO the -able part is quite important. As a reader, seeing `IoRead`/`IoWrite`
doesn't tell me enough about what they actually mean on their own.

> Reviewed-by: Gary Guo <gary@garyguo.net>
> 
> Best,
> Gary
> 
> >
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > ---
> >  rust/kernel/dma.rs    |  12 ++++--
> >  rust/kernel/io.rs     | 101 +++++++++++++++++++++++++++++---------------------
> >  rust/kernel/pci/io.rs |  10 +++--
> >  3 files changed, 75 insertions(+), 48 deletions(-)
> 
