Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212715;
	b=zDZ9t1Irtm1ZwRjPPxlABSqQoiF1mofRlXzmv2lzEusRju/1Db5JISY/+BkXEXD0FQLn
	 75wKPg7qaubAGq8Kz2bdkMLkO7CtllR9hs9TKrAhbMx47HCsEW+qdmEdtVOckdfwLS8xL
	 KypvkjiE0GRN5GZ/5shYaarJdak8KdDi8vLbBXRhHeTq2FDmtZfbkwBf3cEwaTWmWWCFA
	 65FtHV/NDOqfT2z7po6m89YZsePcdR3yOVpx/u/9QueOWECUHPINrA8WdicmKOvE0QMIP
	 PXJy4yiQQ/BEU4WLHdC1mxJumBk1YQMJoZmeux7o/8pzJ2OQBCb8Ic+MwhRCTgEYB1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VpA17SHHGuwrQBIEjd+s24NC7TfJ/mBAwe7vJ4GIKtI=;
	b=IlN5Cm8ETfGaQqO5pSt1DR3nsAIx4l0A47LKOxHQG3Sc45+aNTPiEyDWs/FWoLgUl0EW
	 U6dgaP8VdqwTZ1ysukt1h3iQ07cHPQLCW2zdUIn6Wd7Uc3evPbYoGKh/atn0TX4r6b8UV
	 uwQISwrr6nkQubNxkhyss0bXP92IKsi1bDQtqivWuxo2J+sYHVXptZQIjxkRwhemexe3w
	 7X17/VQLIx3iucBmZWFOQNhec/ZXFhNHzYSEzjtzcDUUnWcWIpWAoEqYQyLgHw/kdiAYA
	 zdRwZ0yG4GLAyF39NbNEELu1CGf4wxyL8Hl9Fvr3UcST6cdHB/2nQWY/Ks/7z4UkjIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQeeVIPM;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCA6606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCA6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQeeVIPM
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso10774295e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212713; x=1793817513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VpA17SHHGuwrQBIEjd+s24NC7TfJ/mBAwe7vJ4GIKtI=;
        b=aQeeVIPMUiqwk6WocMaK2fvqFwOXq4+ME7x7LUdhEWRKNeI+L7qE3SAenqbAKKHIEu
         /dZzO+hCGRCttUuyJao2yyEMffqXY1XcIVpeVQuXvPFmqDkY/EY33VTXhu43HGxq74ZO
         +6o+Q/0xUxxMomTwd00jaif3ZMEwJPorfnEKewH/nJ0b6ROCYffVkQq5ewb6SwNj4ve/
         LINfOhDwFhSEUcRKmkKUyBqhxHlvw/7HKboI/1J3227wiS+ln5iiwurOKfFN9Tl/kmUo
         s1Tx15RkKcq9clTXL2z/wjGiazmRXGXXnDvJaRXjBuvJ+RyHV7TfQw4joB+c0v7Pzi8L
         iDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212713; x=1793817513;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpA17SHHGuwrQBIEjd+s24NC7TfJ/mBAwe7vJ4GIKtI=;
        b=EPMXUIDakqNFLZpumERRCTH6WZVM7wonaeq2qnJ5aJq/rw8Y2nQ54XRMBHHHM/a+iO
         dyDc9u+N75yAp5ow02z9QWTJs+a+1AIiZKS9WQhXSc3oTKQarULEuCHcX3V2IWQnDaSH
         2+ZwtskuRUol+JFNdQFa8DlI8QP5s8Xz1aVxMKzO4b9o/QEg3OK05Nji7PrHFdTkge9z
         /FSe16TAe1RK9kLs1QiAEQ0R5FonA3pbow2mSwyiBLqyvq05sW3u+LhsBZmHiRJWSOGQ
         DMpqGm3JMyTptTjupaY4HGqjLeZuOTJr1OhU7SrkG1hAcounJKs4MFI7P9A5jpGAtxe3
         mztw==
X-Forwarded-Encrypted: i=1; AKwUvBwO8udXXtNO3g4y5FM0vDh+v7g4C3lkPXyGAglqivq1zL9m0lfLYJKOP1IaRvIPtTANvMA/LufUMZXggHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMSOnk0nycZJ1kU1MgvlFOX0K6ge+t4uQ32rS4ZP1TaBx1LFx/
	kLeRXpcFEXl+1y+YrttCCAd4PEKeZGTa923beMFPds1Nf2t+4YA9A525
X-Gm-Gg: AYBFou004bvyrcoCYEWCGtk/pEDDttRR6NYWPvGYqlgJY7iiZMQxPzaG88xS5pUBgnH
	2ReGHxWkPzOPsLuxkVjRIfTiUcP94+FvMDUotGRO0wE6fdOIl6UUKU6GRjeAIrlPSnORqzUreVk
	MJZVMco4DO1kdzrVJCxS24mNpoHTm2XZBxRtg+fHPs/cUbrNAI7CD/+rLEJJlUcja0vCI7PEl51
	e9dg99rpKI78Xg4wdigLX7SjDWY0JTF3BkHlumGmuN4yRPBh+/uS22yYprTImfeW9Ehmew9YzJ2
	JkZD+1nnX/4vRDi4VMZXtaFQyFLfUaWlwapp1SZf0aXWy7QhwngE7faIpZRCEI5K2zQ5hqRJIDx
	NZdCE1OdJgORvjA4kYGE3gBmhBcQpmZzfshPsWj3jXTeemvyn3s+acJh/PoE2+OxXTepsufOfs8
	LLWNXPPq4n1suv6pAKH+0hd+ZHQIUbtxpv7Hjn2AGCaUK0sFIgmugXidZf9Ji6gDDRx4+692BUd
	4EvyZwPWpf2sj31BVNolyrWcnlLNP6NOB6AGlc6pVEMPmemKiQBYGwRCkUzd9Bc4+9iq2azRbsT
	RSUZXH1MH6AET20hzAOt2ZILBgL8orAwuf+Td3CHNJuq7SisaLuD9dxpena1EOgeeQ==
X-Received: by 2002:a05:600c:3541:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4a9675dc907mr75026265e9.30.1793212712626;
        Wed, 28 Oct 2026 11:38:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm10842695e9.5.2026.10.28.11.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:38:32 -0700 (PDT)
Date: Wed, 28 Oct 2026 18:38:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Reid Downing <skibletz@gmail.com>, Carlos Maiolino <cem@kernel.org>,
 linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, "Darrick J . Wong"
 <djwong@kernel.org>, Eric Sandeen <sandeen@redhat.com>, Christoph Hellwig
 <hch@lst.de>, stable@vger.kernel.org
Subject: Re: [PATCH v2] xfs: fix wrong compat fields in
 xfs_ioctl32_bstat_copyin()
Message-ID: <20261028183831.055627aa@pumpkin>
In-Reply-To: <auISUBmIMQr7fesW@infradead.org>
References: <20261027161748.2760321-1-skibletz@gmail.com>
	<20261027164911.578ef6e7@pumpkin>
	<auISUBmIMQr7fesW@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 08:18:40 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Tue, Oct 27, 2026 at 04:49:11PM +0000, David Laight wrote:
> > On Tue, 27 Oct 2026 12:17:48 -0400
> > Reid Downing <skibletz@gmail.com> wrote:
> >   
> > > bs_blocks and bs_xflags were both read from bstat32->bs_size.
> > > Read each one from its own field instead.  
> > 
> > It would be much better to do a single copy_from_user() of the entire
> > compat structure and copy the fields to the standard one.  
> 
> Care to explain why it would be "much better" to do two copies instead of
> one?  The only benefits from copy_from/to_user over the current
> get_put/user is avoidind the conctant user access disabling/enabling,

That is a massive hit.
The current code also has all the conditionals from access_ok().

> but the scoped uaccess thing would do the same.

True, but unnecessarily 'technical' for this bit of code.
You also save all the exception table entries - so the code size
would be rather smaller.

David


