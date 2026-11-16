Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828676;
	b=Cdta1PrWJf5/p2uIzHDz8a2bvLISFtQRxT8/Rr3IHCe2V+/g8i3KKvGl+WuZ+5lhTEne
	 czf4aE30HHJFS+tfs8h3g6rEzAqmFjIrF+xACEITX5ba/UonnZhB/zHgjkAzEiMDXLo5I
	 XThZlfgYHPXSnf5BdxW65g9A2sOFQP2KKHGs8xb5d0iJm1K+fpfZvlqRJfov1I4hfXKbD
	 /jdBfag3/dav+5szvKN1BKmxS6YIoiUM1vprDSjT5w3p+OmkHmjRam94hEzybyo76olpt
	 1KAH3gw91pZXUGSnr9J8FJ7OVmIa10fuDDyH7iPtnSPKf4gVmsW++ZKjoizHsSAU8QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wtSeKpS27rBmoNgRnmtk6Fl68DcVUzwroJjv5Gt9KJo=;
	b=jQ72je8mHWCHsHpn1JI4TPtAm6iMidycushuIdOhZqXBBsfotxj1wwf1hC6fC9pvqtTz
	 xDvj0DhWmdbRuReOVsat8oXnAZTD7oXw1v9FZkojjTgr0AkG/gDlxszp22L8jEHxihkoJ
	 NE9/WBjHvjnCkKfljJQ1Nn8QB388MceDKWfEAhTGC/hTh9K6uqz8uH/oMUgDvhdFBtdRF
	 6VPbb/w5gNpRzYbrPxL7jmNFee4Z1Mom2Up6Or6hOCxDYc9iwazfrwpAzXZRZWi1XMTvP
	 +fU430RsYLx8LkQ1+zxrXN/pxyOPDalQps5jPVmYHNfb8D+n8xEp/dMK9t2V0DwU2tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxWZ3V2d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F5C606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F5C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxWZ3V2d
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso27711381fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794828674; cv=none;
        d=google.com; s=arc-20260327;
        b=SwRsIfukJTTlJgNS1AgjBJNbnX0LZLCpVi7cyrgoIMzOzQsVMQ4/aJTF6IRmcFfzqT
         btYkyF7N9GzJDnRqtQtIXFf2EMCHq3G727hzRVsaKoND25wLzMuftmKImHPfA13ZobfC
         AZKTkscAa5njdS643myodjcO36j0mZsGt5d5tg3/G1IZHoXsyYtgtcFDQIsw2ukh6oAj
         8UHlc0AE2VanXEPY7N71MK5X5X1IiHUE4BxyrRq61sy++AUil6uPGC98W3DxBwMtvprL
         sXZUNOWUvJWVHbK8mGsLbxDBIvkKHa/z38z5N85G99QcaTBJ/Ukx1tFI770dJnUTfPow
         ZDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wtSeKpS27rBmoNgRnmtk6Fl68DcVUzwroJjv5Gt9KJo=;
        fh=sfv6gYizIPlywg/W8UN0JxjgCkD0wIlTd7MeqSfRERY=;
        b=NotKVZ8y14zPWxfn9/LdADuLebFpFXI1j4w/YVXIZ8emiBKV3DxEZAmzB6zw3u247N
         dTCl9WyLrVVBkH+Lr46dpWxCB5ZhuScTJ3EMcgJCBSkWVQ5F/MApVf5bijnDYZb6kcr5
         iHcVM/4PlEpo157tU7FP8L4JPhs9AdJk+/Z79pwC3Jn9vh7G1SQumg0wJHHOYXYK9IF6
         2JQtXV5YkHDVYkfJEZWKQrhuEjKahmIdW6rWZPX1i8qIrPNpD4Vb1IpOHu1wXrm+r25L
         wWVJZ7PbOE2ToOCzl/hFP3BqVCEV8F9INcSjzj7Cwns65NJ0arlCdSqIXDwF6Ezz5QTB
         pjBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828674; x=1795433474; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtSeKpS27rBmoNgRnmtk6Fl68DcVUzwroJjv5Gt9KJo=;
        b=kxWZ3V2dVLj+c2/8iSKefCrbXhzuXYCgt5E4YLq/IbkWEXpqNbQOR1/wAnWoWUhqXA
         QXEo807K+w4JcmYKtkfJqxmstIa4egAT1Sl4+XhRI1Rbsv3DKmQPvfrB7gbuDfW1uRmH
         n9Luy6QTnwLwntMmFdIBQKVSBC120MN2xvKRYW1Ib/gid02S7pSadDR5mk6mfYZJ1CE5
         qfpaFgr8QW/aEVwn62yYQHLYw5S/Qo6GSb68PdpnJ3gvg8H/wu5CB1dwjGHHMKtcx3Cx
         +PupmxkMqvBMbrWh0X2nETj4/m7GFVhZVT1iy055+ZP6FrtX93azsktz0agKKku4ajOW
         ZxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828674; x=1795433474;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wtSeKpS27rBmoNgRnmtk6Fl68DcVUzwroJjv5Gt9KJo=;
        b=wTaIIhCgOrPxPeY3zteaA788F8drBBtDwFFDzTKBO7UkHKH4bnGoSJppU3cw7RMitt
         M9XCnUf3/Yyeh2IgeyDWqlFrlL7oe1nzVOdTXt9UFDsxgQjvX7ejXjiY2W6TYomSrfLP
         Vo9DTYXhRzgkeFvCvoOi9OK295ZgpH9F38Uk9h1/nWkk7q8QRvRaNT0zr+5Nk93gZewx
         0QoeuM/wUhZoyvRqXtYB/J/Tmf1A0lsRIIxeyQycBikGtyuxGB8EzYr3UhjpvyihDwMf
         tfIcXqz7/rB6XD4grT7EiWDdkv3JPlBx7YzUmDtBM33SDwHqDEim6FsUES85ILZtGWlb
         FVaQ==
X-Forwarded-Encrypted: i=1; AL+hErHNugElU+zEcbBe/eenBIkbO47O0izPNNmx0b5tF9iT2OyBIocd3YhBLIeQ3ZoHYv9aby1tzc7PVKhihkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p0PR2F7qykwtJCo4O0R9qO6z55KZ8St2wNckxAnb7HkokYi72
	2hLLq3Ysaq/4yF/Niz55Hn1wjrd3wNB27h7gn5jEwclGAvxuhtC/Yo9sSCzt91Ca3KZGIPfHzqg
	BHLjZfkkFa7ccSz7gU9SchPpTQYyXBx0=
X-Gm-Gg: AYBFou17nZ967wrZimZj76f/n/rK5WP1+qisS0nnXjP/auXYz8aP3CswtSkRnu76XNT
	fiFWI/MPRH3ukuQlXEpdDjn7Hjqbt1U5Tl/XgInJGmU9dE/43mMU4gMm9K2cnyw5kPr0fHwWUCA
	yndjLkPYmytRiex37rdRC3QumUAvnGedFRrWy5+gteOVefozgkt4tro5B5j3jJzsPzTkA+4kBeM
	2DAQIHYF1stoHHZq77VoD+kxtcdwLVxE9whlOCPJ1bFjDhisoEgaIHR6UxbtD+VsgwVCOuLV4Su
	A8P/BSrRwkrsczYLZzwpF463IF3TZsnA7IkY8kqg1uxziAFUd6pPTcWX09pcSmQxY+kwYcNnZ+s
	P56Cprb1+sssL18Ji1ro4CDY10adOIoz8WKpfCw==
X-Received: by 2002:a05:651c:a344:b0:3ac:ff0a:9d86 with SMTP id
 38308e7fff4ca-3ae2b4bad81mr32453821fa.15.1794828674271; Mon, 16 Nov 2026
 03:31:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
 <20261115210952.2140036-2-graypanda.inzag@gmail.com> <CAOQ4uxhZS1w24GXWphu-PNPbGxVJUDwOfqHdRZcb05+_HVv=aA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhZS1w24GXWphu-PNPbGxVJUDwOfqHdRZcb05+_HVv=aA@mail.gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Mon, 16 Nov 2026 20:31:00 +0900
X-Gm-Features: Aa3M54qrozvfFSvQ0gfAb_mSn86pOQYMr6gnIKh6TI_Xntwk7Flfv7qM72l-pE8
Message-ID: <CAO7ntTRdY+5G1wiETFu0SVa3vFX+0RyMO6R5XpoosF0zhuoQYw@mail.gmail.com>
Subject: Re: [PATCH 1/3] fuse: reject embedded NULs in readdir entry names
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 7:25 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 10:10 PM Junyoung Jang
> <graypanda.inzag@gmail.com> wrote:
> >
> > parse_dirfile() and parse_dirplusfile() reject '/' in dirent->name, but
> > do not check for embedded NUL bytes.
> >
> > Unlike plain getdents() buffers covered by verify_dirent_name() in
> > fs/readdir.c, FUSE READDIRPLUS passes dirent->namelen directly to
> > QSTR_INIT() in fuse_direntplus_link() and instantiates or aliases live
> > dentries via d_splice_alias(). A dirent name containing an embedded NUL
> > produces a dentry whose d_name.len extends past the NUL terminator,
> > which allows callers such as inotify to copy uninitialized kernel slab
> > memory past the NUL byte to userspace.
> >
> > Reject dirent names containing NUL alongside '/' in the FUSE readdir
> > parsers.
>
> My concern is that there are innocent buggy servers that pass NUL
> maybe even because of length including the terminating NUL.
>
> It would be more considerate to make this check in fuse_direntplus_link()
> rather than to fail the readdir.
>
> See precedent in:
> 78d04af4995a1 NFS: nfs_prime_dcache must validate the filename
>
> Also, verify_dirent_name() never checks for embedded NUL, so all the
> other filesystems can get away with this without failing readdir.
>
> Thanks,
> Amir.

Hi Amir,

That makes sense, breaking getdents() for FUSE servers that include a
trailing NUL in namelen is definitely a real risk.

In v2, I will drop the parser checks and instead have
fuse_direntplus_link() return 0 early when memchr(name.name, '\0',
name.len) is non-NULL, skipping dcache instantiation without failing
readdir (matching the nfs_prime_dcache() precedent).

Thanks,
Junyoung
