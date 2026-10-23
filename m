Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792792675;
	b=1oTzNbYk44qqBucD7WpcxTowLOFy46B9fJ2JkrPHB4bN47NjXPr8h3edlIVYmg4Oe5C5
	 mOO8Wz2nDr42SZvW8vyXbGOPx5NWj4yw9biXmtHwCUvlaj0neqemkJf2IapgMary40pgF
	 BYF2iq7v/KsVo32BvP0sc25tTxV6eQ6WQ0Vpz/NY5XUGWVR4kuAN55DRV0I4sZUl+BBC+
	 T7kxcmTiQYK0W1kgxiXhK7ZTjukeBv5vrM6puAXvTTBW+A6aC96SfVk4SFfBonYaoIY2M
	 nQ46vCwvOafwIwptZRLSKVeAt9yl0qm4MoYv9e/7S+ZUjbfwzVp2ta8DFRON6n3GqVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
	b=3Q45bbRi0S3SQppEtx6o+ux++3VfWjAyWyokzD0P04cBcSIF0ESdz2mJRLY4pPpCk8Y5
	 5SAtxGmMBTFYMDlDv12mY5p0+MJE0YJg207WxcW+hk2RP0gkSujRIh/4zsnIBe7+dqZkD
	 M1+i5pDCZSPLmK8vZXjWjZajkt8tG9jENKAkCXVpaojGKUwJmvwgxND/lNEibPmkry/+d
	 GF5p0ZXp/ropUpKj+0bCcVkjj52HRJiJtWAjrPaTfVTz4/iqBDVxHsWocsq4wXnSiOikX
	 M9Ir4TD56/Cc9pdhdjwzVCkD1HtABfVi3KNkYBlsN/MWksHCXVZSn99Kbnw+vazvsVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFtMKkx9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D18B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFtMKkx9
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc3eb09dd2so43437137.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792792674; cv=none;
        d=google.com; s=arc-20260327;
        b=S7Eqmg+0XCF+kyY4JNmcVyFAH0SvwOXXmCUUE+X7ZRZOwOpsvMewsXetqtHENFbZ+T
         eFkbTdgr3hLvCb3rEJqIVb2uzcwvrLrZ/F61A27bfR0v1DzOyMtFtT4JbMxTUpCYYDy1
         ro2xSLCo3A7hDzAcJrFxuynKBYYBCS5yD81geR4D43qd9upSRgZOAQJB+Q8ug5RF89fZ
         6cHlKv/l33GKBDcLhDJFIPisQ6tLZjeSFRNqikyq5D1rAao9shAZ+w1k/IzaqtFEqUZP
         bQ7Nz8ajzxEcMdRkhZt1IZ96Xdv/d4TKgqRO0gCuIgX9E6X3L0fKN0AnJ/EIfl6WGpS0
         RuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        fh=h4L+qu5yYrNBvfgaL5Z/y1bEUo/rEcTX/z3DRkdI5dk=;
        b=N2f483LuW8xHpiZp447FSu9fm7lCozypojcn3QlMalZ+yiou7/fPmEhR2L1c1EXjfI
         Z2Ro3kl1LOYraMBYqX1eJfbInM7x9JYiUC3J89hegtg/L3Y/H0sk02ked0KTlJT56BpQ
         eBnMz44vQaUTyxwt/dxp6AemkaXPGWebxxb/OWcYrKnm9EYW5+52dxIlxQXROTzr/h9E
         B92d3MZhbdS2PEMlb99EuWzTJysgRMn2iBdbnyEQFbSSBTjKHJdZiGuR8BQYa48BNU1P
         9SmIy+/qbgGqinaLOhUHm6mvd0EuF/uM9fbpgKIjQPuRCIX/kJ6z8ImuUaKHIYGYGM1v
         uLsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792792674; x=1793397474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        b=XFtMKkx9QqX9D1aSU01YG7tNZeRvK2FeEy6LvpBPXXzRUvJDuCW+EMYco6ZQzuD5eG
         TWRkofZfilD3hWzcKKTeNQNH8A/gbixoiZso6lZRKCq6ZKUIuILg4c8Q9JyYq8vAE+cn
         9LMj48JxnjptTOys/QGunywKXgDo7Da9bCrdQ4ivIOzSkKXmBnIQoCSjDhnnhExzDv6R
         tVxXZyeko5KE0SNLaHu5au5/3wwL6L5QZ39usbKWhGhif0dWDL2b3OlWq/1DfuTuF8ec
         KiA0kmU+8DAvPRuUeVeYoD0oLOpibCP079Hahb5V/QOlV809wX/n/pYSJAiJ8grlVZuA
         vvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792674; x=1793397474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2tjAoav1AcKC/5Jjeoiq37UKpYVotTU7YdVuht/Pmc=;
        b=sSZn9QtACfmaTmlx41JCuhfG1CmWrjt++NH4/ysX7qNrxv5QfPxHi0oZFocTKwt+ap
         bC1J1pFJXnqs8MnsCCZ2orm2LZJD4uOGYtlw24SaEUOPKG+yZhf3XZIt9IAf3NaSVvt0
         QY/fmREDWOe9e3MwxCIdp6rUd6VVOaYxd072u7HHo29uat4OsSjoWraV1Mq7xspuTFyL
         oQwJvric754KrahPUROX9uEcPr81S0FK2yVDYHKc5M/y5TdbUo+vHrJQwe+Y0xwf1Bpf
         O16jZL4cITUhMlt7KiRPsLPbMpsgsNgRQjQeWkJxHE8SxnJ0XsGVApWpw0OdWIF+SVYs
         R6cg==
X-Forwarded-Encrypted: i=1; AKwUvByvEG7Ohom6KOZQQmYXP/vXFFqWAnMgCAcl+KZPuEgM+UNBm1ZgrMFzGYm4SkFV/mZEhE5KwgNYv7pmtjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmTx0gb2DnNWEIs3BzVPBj01B/QIv5tnDJDaE+W7ODx9YMiKE5
	APLsxRz7Vyepug8YkLfwoQnumHrQibGCl4UOWprmsQKc8awwrGhlZPAlWDD1uMA0NsABQXGdUtg
	b7oXo59nB9SXQUNIWPGsCKVZg3co79b8=
X-Gm-Gg: AYBFou1Wu7Txc1BOmvEMq8EDQRpGrH1flyf26vScpgmB5x6yORq/rmwfqR0RuQRh5Sw
	qRqYJtaWdICOFrvlPsFpZyYm2Y6ZRwroRygg485Mvby/NGjjPsulP3CYYp6vw1reyU8ZgarSfps
	M6W5S5M789QxbBxaHNVehTzNfFeRLhOBxCO5pTGIGaSdx40t92KLmMSkGDFrqrB7eyArubZ6P79
	pfXZJOPt9QFah/nWSmRFLlWHp2o+FrzUSHBLLAMiZXZqYFMUC6MXLfTsynTN7DKK1TU1rIPOp9S
	/zbST8JQ8lgCdwFwzG+39qFmq0nRMkaGHn9VP3uCKvB4JpEi5k87GhsgR7WK4GiV2LIQhf3vuWa
	Sz2t9smQLvZ2OPlxyde1eCAbM8B3IVMBYeHUO7DA/UvT16darpYRpRX6xSBAw6/CU3zZ68Hiv6P
	I2vj3iyobjB1XkQ0uzv8WC8XTdZ/ZGkRiXwngcGFDxWxCNLgswjGvB9KTCiRtKExeDy1x0yeUMT
	qWcHlEonGAQkt2/9So2coCu5dWhDXWl5ZPNqG84zHH6xOIgOQU=
X-Received: by 2002:a05:6102:915:b0:7cc:9d82:61e2 with SMTP id
 ada2fe7eead31-7ce5ccddc23mr173507137.13.1792792674222; Fri, 23 Oct 2026
 14:57:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v2-3-c9e07cc44bf8@gmail.com> <atvEczwQ8Xh9vcAI@SMW015318>
In-Reply-To: <atvEczwQ8Xh9vcAI@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:57:43 -0600
X-Gm-Features: AclHuK-L8Ck-SoXzjLhjbFwPtYn7ao_X3XL7jMPxi73vlDBLmOhNQMuoUPfGIac
Message-ID: <CADvTj4oF7ENRHQRk5VHVN2nuqxV-+4ss5BrwDvijmcS_HZ_fRQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dmaengine: sun6i: serialize channel reassignment
 with interrupt handling
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, 
	Jens Kuske <jenskuske@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, 
	Hongling Zeng <zenghongling@kylinos.cn>, Chengfeng Ye <cyeaa@connect.ust.hk>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:33=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 12:42:37PM -0600, James Hilliard wrote:
> > The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> > termination reads the physical channel before taking either lock. The I=
RQ
> > handler also takes an owner snapshot without protecting it. Termination
> > can therefore miss a new assignment or detach an owner while an interru=
pt
> > is about to complete its descriptor. An IRQ status snapshot can survive
> > reassignment and be applied to the next transfer.
> >
> > Use sdev->lock for physical-channel ownership, pending channels and the
> > shared interrupt registers, nesting vc.lock inside it for descriptor
> > lists and cookie updates. Allocate and start each pending channel in on=
e
> > critical section. Read and acknowledge IRQ status under the same outer
> > lock, and protect cyclic notifications as well as ordinary completions.
> >
> > Clear the active descriptor pointer before publishing finite completion
> > to virt-dma, whose tasklet may free it independently of the allocator.
> > An assigned channel without an active descriptor is ready for the
> > allocator to start its next transfer or release it. This replaces the
> > completed-descriptor pointer and keeps residue queries and termination
> > from consulting a descriptor already handed to virt-dma.
> >
> > Mask and clear a stopped channel's IRQs before releasing its ownership,
> > and clear pending status before starting a new descriptor. Schedule the
> > allocator after termination so other pending channels can use the relea=
sed
> > physical channel without depending on another device interrupt.
> >
> > This also keeps process-context acquisitions IRQ-safe. Client callbacks
> > remain outside these locks in the virtual-channel completion tasklet.
> >
> > Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A3=
1 DMA controller")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kern=
el.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> Is it possible split to more small change? And you almost add sdev->lock,
> any place only use vc.lock without sdev->lock?

Yes. virt-dma takes vc.lock alone in vchan_tx_prep(), vchan_tx_submit()
and vchan_complete() to protect its descriptor lists and cookies.

sdev->lock protects physical-channel ownership and shared registers.
The sun6i paths need both locks when updating that state together with
the virt-dma lists and cookies.

>
> Frank
