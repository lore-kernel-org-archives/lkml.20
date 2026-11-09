Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235912;
	b=BIP3GfaudJoUUCXJvDiAdTdh7+jL6XIZLfv7CFmBCNhIM3po1CfH0Pq0HczwV8E+LlMe
	 Cvb5yKey/Grp+fLHciB5ucc7TVuIRQVNLKD2FHUfuLCLv1PeYK1tr797SQdL5wQb4Ojum
	 6h/+UZ11o5n8G3OwEM374nDR3YmKts7027E1dbKKtbw7UenVdw2Wny7rTpXWdf3GsGQLT
	 odvqyEcJLyftN+PXONqS3dvkmWr1NKN+liP/qA5zwu4/EVa0TUWNSn0LFDzwMiy69y/Od
	 Ml/9Vw+/dQS7QR9CxHEgb+oeJJti/rNZBF8+wToOW62K8Cu6hbMNvj+DBsuE/8CXKOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=J/ON+kd3JZ2PEUk7mTIiSkX+r3bemsj8teqmqV8x0KE=;
	b=IW07sktxM8eiyLFWa63OWd+5NROu3LD3htAD4KqtAJDwM5BO965YJn91/dkUUjC5xird
	 hd4c0mPegIaFGleo6g0iM9q9MDf6Hb6oXAWQigwd5u1wWwaOD59jQdi777GrMUdLd8O0E
	 /8t/p6MIlOdXU+6R9JOg5msdElNQ2sea1fjG2jVZdWL7bwQBscJ6AqTp8SOv3kVKE1p+i
	 dt59QxiwTQ5rAevvE8RITR8afAocQOJE7Gpr9mGNwu662jGN4s1NQ3XS9Paxbo9rpmzlH
	 IA7iIzV7fL6cDH/4Zxf+Z4yt5sAgs7TH4LAPN4a4I6QsobcqtANZMWED1pxC+8gxY1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkleYFAc;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FB7606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17FB7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkleYFAc
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so1298470a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794235910; x=1794840710; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/ON+kd3JZ2PEUk7mTIiSkX+r3bemsj8teqmqV8x0KE=;
        b=PkleYFAc+0BvCXsJXVq3M/zBPc+eyFBW6hC4WYb2ML24PLhITX2DmlX3mLQNASXS1N
         nc5jJqreb/r14U3fqpOlQvSvR1Nb/tmPlVv7VniorSqIYqocbkm6ZOIU838NH2hN2oZ4
         SFgYWXIBafbDJB9SqchXjKumyuKVdXMex6/5jmglbujr/AlM7HnnXm96IdSthgrZkDXn
         GGaQ3sgNTyk9FHxWLk2lX2BQm5sQ7F4wQMv9FqGaKlP8K2jWsptRBQ4YkAqwSzBlFg+4
         PcChdGXGfFcegdYid+AA+XUylPI7d2UcVlQokEUL6HsSjvO3geAVocKtk8nAnG7xU0kU
         354A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235910; x=1794840710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J/ON+kd3JZ2PEUk7mTIiSkX+r3bemsj8teqmqV8x0KE=;
        b=XZXKJvORD7oIvTh7i15l9MIj2dclGWMUHJujkyEqwNZfbeGVlQTrTdC1pFo33GO0Hs
         /ZiLxxSkkGxLt+n2goVy6QVRQCsZkSr+siipLDjzBYaMtEDd8Iqn9LqxPoRTZjpCDNRp
         jiEl/Obsf6jqe2FJYIXtyqomKMs/PM2nq+AyC9SUc99A/lWb/cdF7va/s2gEjWWNLRe1
         doqiLiJXecuu/rPu753HrlYMkbRA9lFWR9Ic/zkPJtqCWD4PaIEmiKQEsyzHpCHLPyao
         hefEpnZ8g8KupbvLBLNq54wzo19YXJ8TKUtJnyDHhQYYIjnG9EZiz8VqRFHuSYsP9+pK
         MLTw==
X-Forwarded-Encrypted: i=1; AL+hErFhK0pLCFuf+UP/NKgJNsjjIweyQHMAy8+mvQvYE3hewufwssdtRQ5FaXKfcK07kP9FyFZVkUNtUNaoEd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IcaEqMD78h2rGcSomAeLSmL/52tZXANJ1INZ0B5z+p0Kv/hfm
	92ErdnTzRfqawPjJnvq1wUC4MRj2oXK3alMS8aWcoYEDnI2RLXw0ZTDE
X-Gm-Gg: AYBFou1ZieGIQMju7XVvuJ0OhJUk+afoErjSAjva5KwpxzYSO17ZDcEdoLdXoCpmz1z
	tWMgnNs68L3KMpBz5LkAvEo892YCsdtoIHz5sXnM0ud7n/Cdxg9M1VzRpeddlzr0DeSiJ/ZaMXo
	XIM9wduWdrH/tBF3ZXVjJ7nypDSkSfMYFLzzjWTwNTo5phwBMj5AtAc0+ywMz6dTil4ck+KVJVW
	RQLjqWRom55woOcx8Rj6Xz/OVu/kMDOBG+n8SV0+0cGsr3BTyOXI6/r4+klRA81NXKQgr79uCQU
	l0FIJhnh1kWKRSgwWEJFotaLCHPsTWK7EXuVX9lSXfVM9oXZPoOh7neX80gf1HeH/+G3wogF7qG
	XSiBIn9j+36fgUZISMNqT1WSFJzP36cnxB7r1rb5D/oj3tG0aoBBqpCS57Ib9dsRLVBzw9TtZwD
	l5gkRNpVCVeamRx95wT14CGdBQ+nZ8SuKPOldl+2NZiyZSWBnTPrCNg95TkFnsKweCVOc2FjWoo
	kL5Ie0io0BFhdIH4VGhBoCvJb60CY3sQ4q0B0OJe7vjY50pfDp0HTHq14pCDGsmc/Sqx1ZS2JuX
	bIN0dGgeLIFenhUU35QiDpqTaCwe6czsz5kVrNFLqGuuj+Sxl7sCOOFPFJ6CWA0wySMRQXriH8+
	KbMtRLRf1HHU=
X-Received: by 2002:a05:6402:528f:b0:6b5:660b:70dd with SMTP id 4fb4d7f45d1cf-6b722484c1fmr3165155a12.21.1794235910318;
        Mon, 09 Nov 2026 06:51:50 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721eedfd7sm1603106a12.31.2026.11.09.06.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:51:49 -0800 (PST)
Date: Mon, 9 Nov 2026 15:51:49 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: =?iso-8859-1?B?Suly6W15?= Jean <jeremy.jean@oss.cyber.gouv.fr>
Cc: Christian Brauner <brauner@kernel.org>, miklos@szeredi.hu,
	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ovl: disable nfs_export for same-sb lower layers
 with different idmaps
Message-ID: <avHeBTeJlQfrSIPa@amir-ThinkPad-T480>
References: <20260920203239.2876221-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <20260920203239.2876221-3-Jeremy.Jean@oss.cyber.gouv.fr>
 <CAOQ4uxhyc5x3LDzbJtRhQJ+JNQ-hES2k45jcxeGsfEWPB24TKA@mail.gmail.com>
 <20260925-server-hager-riskieren-06116eded213@brauner>
 <CAOQ4uxhdP4XeHfbKfOg+3XRF8oLhPMmbU9xHp7pV2w=snQk-+w@mail.gmail.com>
 <5e8dff576ead72fa502b7cd38889e780@oss.cyber.gouv.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e8dff576ead72fa502b7cd38889e780@oss.cyber.gouv.fr>

On Sun, Nov 08, 2026 at 08:12:49PM +0100, Jérémy Jean wrote:
> On 2026-09-25 16:17, Amir Goldstein wrote:
> > On Fri, Sep 25, 2026 at 3:51 PM Christian Brauner <brauner@kernel.org>
> > wrote:
> > > 
> > > On Mon, Sep 21, 2026 at 10:10:28AM +0200, Amir Goldstein wrote:
> > > > On Sun, Sep 20, 2026 at 10:33 PM Jérémy Jean
> > > > <Jeremy.Jean@oss.cyber.gouv.fr> wrote:
> > > > >
> > > > > Overlay file handles identify a backing filesystem, but not the lower
> > > > > mount used to decode it. If lower layers share a superblock and use
> > > > > different idmaps, a file handle can decode through the wrong layer and
> > > > > initialize the overlay inode with the wrong owner.
> > > > >
> > > > > Track the first lower idmap seen for each ovl_sb and disable nfs_export
> > > > > when another lower layer on the same backing superblock uses a different
> > > > > idmap. Keep index enabled: copy up starts from the overlay dentry selected
> > > > > by lookup and does not need to decode a lower file handle through another
> > > > > layer.
> > > > >
> > > > > Fixes: bc70682a497c ("ovl: support idmapped layers")
> > > > > Assisted-by: Codex:gpt-5
> > > > > Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> > > > > ---
...
> > > > > +/*
> > > > > + * Lower file handles identify a lower fs, but not the mount whose idmap was
> > > > > + * used to decode them.  Remember the first lower idmap seen for each fs so
> > > > > + * decodable export handles can be disabled if another one appears.
> > > 
> > > I find this behavior counterintuitive. Shouldn't we just fail the
> > > mount then?
> > 
> > I would love to fail the mount if you confirm that setting up an ovl
> > with several
> > lower layers some on the same fs with different idmap, is a non-feature.
> > 
> > I don't know can't /home/amir and /home/brauner be on the same fs with
> > different idmapping?
> > 
> > Could it ever make sense to compose an overlay from two such
> > directories?
> > If not then I would gladly remove this setup from the test matrix.
> > 
> > Thanks,
> > Amir.
> 
> Hello,
> 
> I'm digging this up: should I investigate to prepare a new version that
> simply fails the mount?

Yes, please.

Thanks,
Amir.
