Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995439;
	b=xNERnN0/WPAXBKaSm8dMyNEJVJ9YoPL1GQqii35WYK8A0qGgsVYcyNEQ3Gl4eKLXc0XG
	 y4WuzK5RS3Nd4+xwxRSTu3YqMVGr3SsACvUR0zKKBPPsRIWQO/fwevseMMwefYfsuj2gm
	 2IGJ8f5uVR2Udw0FoBe4q4c7H6+qPJvowg+3jV3qPsQ3556c434zr2nyKTsfMRpDWSLFF
	 LtOOF/HKhnCIeAe6AoijHr7Y6h8+K2Jt3Z8ZYGepaAQ6ZihiOxNiLf5y4uMbSaTddoJN7
	 EzE1ArRUTgCuXjgVRHUR6dUgvhIUCMUgoRujGP3L/RMSY3+7o9GGfd/w7jwX3dg+O6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SOuZsP/y9xq/TzGg7mOta+j2cGpkuhLYFhFIr9N0YU8=;
	b=WIN8YBttS26Qsr1px+y1W48z1en7ewaGc1Y9n3GH8U3294FlWjdVTbBVlYBVAo6zCt9R
	 e7cmmvW611knDVX6ef3W4YEHntKo7/V/5HfMu59hS3+42Z08eHYs8c4xDcc8ggyyna7UN
	 HCXmB/4d1fDGaR2pJTTm0MrffvTaGD2i5DOaHnNAQOwDg2aK45dKAKjiZwIuGhCNtBjiS
	 eUmIrQcuPS688Whp/o1mxEQN2v7fQeJ9qH0E3cXK14txH+Vn3qyWnMxoHpop7rTo59eYQ
	 MuZR9kh2738THk6P/5lfwCiXVD3hRQliP2IIoqrOo4GAQW8KtIR6cyV7vJVnqwO/XRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dmCRAjfq;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407B606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D407B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dmCRAjfq
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so157409766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793995436; x=1794600236; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOuZsP/y9xq/TzGg7mOta+j2cGpkuhLYFhFIr9N0YU8=;
        b=dmCRAjfqJQwsKcX+aHrTgrTRqIJdg+k9SFLsWpGQ+P+41R5j9aS5CEwIXDn+eakTve
         5U+GNQQRXGgCs3E+9Hlk9GIcrKajtHeD726ELCBX8HEEcnLHew0SSiw87gUhLpKrsVcL
         fojGVnEsy+Al734Rbk78gOVWTyojys22Q2oJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995436; x=1794600236;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SOuZsP/y9xq/TzGg7mOta+j2cGpkuhLYFhFIr9N0YU8=;
        b=H2bcTj3JwGRzMWWFKUFaK6b+5L3BT3VS8uvYNAfWerNoTnqrF/qZR95lPY0H77ZwT6
         gAaElrFt5XDnJfHT1cGZGyxoPHnoxjMdKvj+Jln2bidS+Ns6zRM8N0XoyRp5K82PB5mb
         X2JhSv4UOtDVDCtwJ2ITFgcTtqdjuXjKbPl6UTL4UHOx7sqH/2yaXfLePW+Pbk0024PR
         1Zcip1+71pVjP/1gqYhxcfPq5CRnOG5PlhM3pN5Wuooo0EdpPv0pqNT5B6U315cLdJaE
         TuMboHCPVOvDb1UCTJpXIeuYen3eD710RxmdNEqmGo5z2z+/lo86oadrGnX5x7htQh6r
         1R4w==
X-Forwarded-Encrypted: i=1; AL+hErGDo1M0eAeiU30GhMhDPjGvJe0hEZuNCVX1RANyz9u4RhsuoHRvVev6C8zvObbibym2QCrzJNsyd/vHru4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zz2vU19GiTODFUYepg8oMG0hSdyAWa+llAWZiYYr2FurTFF3n
	xG3G4qkhNss+T5WnrVX0SQ3KIzAYYvDTEMDXKQoPjyuD29P0PT/eJc5Xo3377d1O4AmGvCj0hXX
	M0DUkQi0dEw==
X-Gm-Gg: AYBFou1E/hef22P19bswZBy2fwlodZhvTrlENfvQzjiuEljyPpstS7VwMkbVJNphaS7
	QxEhdTRuEMtdJr7j357Xqu9cjEXFXV5AMwoxgmJF0DmQRugaDtq6iQKl2Ra6QP9lmEyCeVRUxSH
	7J2pd5t/jUA3GB/9HcKQvU4QIrecD4ugii3mLpAy4pnDwJeyxgbGTrHB5DU7zk7+zUiy/p14pg3
	fuZIwC7nhi6GSYw3TnVudv7nDFUZH1yNFHmqGD05qyQbtRygDnhtRT1k41Q3O3SC18Bwf2XL0Mm
	Mp/dpKJbWSX3qYuVxrR0OIb63BUOFUIz+l4rn8dp9reBPTNQhtWmkuQAHsbN/HishFfVpYEaF4G
	bVmdbz+YjJpuEBDHTj767RHYfNiGVfgiam/RIo44lBI+HJrt8SJZ6VweaFEdUTRI1ERJjGcfn/a
	iC5qIRzuI4wl3uWy3H0tLpZOqJdAOIHUSbnGFNQMZGv+WWkKUeUAK3oV8hFpHe4X+8U7oX6szcG
	a9AjbcKD86GPuVPhkYXexMKh+2yvW7pcGogpjGj/XerxOQTcK0bEqbzfQW5N42r/WTwE3vTqiHS
	EGISBxeqNP+vk/RJyIrnBQZLkd5MBoi5sRdKXsaCB3K4E7AgP11YmN/mnNhUi3kT5QpFM6vwX/+
	XNA==
X-Received: by 2002:a17:907:9807:b0:c49:91a9:c7e4 with SMTP id a640c23a62f3a-c4d34ce94b2mr302935766b.27.1793995436247;
        Fri, 06 Nov 2026 12:03:56 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c776csm103019966b.70.2026.11.06.12.03.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 12:03:55 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c34bff61551so167772666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:03:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx6HousOO+IagZxMwsD93XDtpkhzWMOQ91zrnUWuPKOuGMF3rLacyHicmPO/G7cbOnGyDk2iC6F73RvScU=@vger.kernel.org
X-Received: by 2002:a17:907:c0a:b0:c2e:5efe:f1cb with SMTP id
 a640c23a62f3a-c4d34c5a0b4mr312829466b.8.1793995435035; Fri, 06 Nov 2026
 12:03:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
 <20261104-allein-bepacken-hitzig-5e517d3c129f@brauner> <20261105-genehm-dachrinnen-infusion-9cdf4868d32e@brauner>
In-Reply-To: <20261105-genehm-dachrinnen-infusion-9cdf4868d32e@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Nov 2026 12:03:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiBsoUD=_V3vQr+sgArezxdk0aVk+_8yTX+gK+JVyNH+w@mail.gmail.com>
X-Gm-Features: AclHuK8ZOQnPnzaiKmUJOJtxse2KcPSfRUhBBgxVSOLQ5inoQjgyGjpXmIAMBaI
Message-ID: <CAHk-=wiBsoUD=_V3vQr+sgArezxdk0aVk+_8yTX+gK+JVyNH+w@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, 
	Christoph Hellwig <hch@lst.de>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 15:35, Christian Brauner <brauner@kernel.org> wrote:
>
> > I resent once after I cleaned things up post RFC and I don't plan on
> > resending (one failed attempt due to my network dropping).
>
> A git tree with all of the patches can be found at:
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=work.procfs.cleanup

Thanks. Looking at it again, I now reacted to the PCI
proc_bus_pci_read() patch again, and decided that what I *really* hate
about it is that it uses those "unsigned int" variables in the first
place.

And even worse, proc_bus_pci_write() uses the signed "int" variables.

That's just wrong. It's all garbage. It shouldn't use "int" at all. I
think it's just that all this code is two decades+ old, and 64-bit
issues weren't a thing, and even "loff_t" was a newfangled interface
at the time.

"pos" should just be loff_t, and "size" and "cnt" should be "size_t".
Those are the correct types for those things. Not "unsigned int" and
certainly not "int".

And yeah, cfg_size in "struct pci_dev" really is "int", and that's an
independent issue and likely a bug in the PCI layer.

     int pci_cfg_space_size(struct pci_dev *dev);

doesn't seem able to actually return signed values (I think it returns
either 256 or 4096), but "int" is still not a great type for it - and
the comparisons with proper variables like 'size_t' will then turn the
comparison unsigned anyway.

This is all ancient code that works, but isn't pretty. But I'd rather
fix the types than do things like

        if (*ppos >= size)
                return 0;
        pos = *ppos;

which first does the comparison in the right type before it then
truncates it to the wrong one...

           Linus
