Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E249C4BC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360695; cv=pass; b=DPGW2W82Y+xy63CFglACohDakyPXLstQ7EU9fSznZt9CoCSMxX6VFpbHLmOC6D6zqB6JwfnikbuFrdnHZlAz2C6H085Ln0nRzkdkvZz4W5Q3YM4vAZKGLwACatmRtcw55/NVI7hp1vdnigIuyj1i4SbVmH1Qjd4jE+Wcm6XzHe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360695; c=relaxed/simple;
	bh=VuPCu0NVXXA8ZEi+lRFtiBIDXTK3MN9d4YX7eIhKxYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcQRrSH7gZ9dUkntUta+JNR+Ps1P9iasYeqMJkhiRF6oKqgKrEgOMAgfOxGt/GIr5893qgCruMzRRrAq8DfFJwZ2FZK/+7ct6tFlC9DqYrz+d9vaIVw7lIgLbnOx44AMdBPTj/2q7QMrvzXfez2NhYEeY2+WLOLIhzPKTyeH1IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYcfj/x/; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYcfj/x/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so736768f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790360691; cv=none;
        d=google.com; s=arc-20260327;
        b=nJEsk0zwaVPaBG3HqYdXwR9FP+obgktGJZ67ZorZpjNUP8fFBbD3utYnz1zSWxAzgn
         QSTKdNGmNnfeaZgwFHUmguFNKcvV0MEogCtfA0fXSbUoIzpHVH4JaNv3ovdSFkn8Vf+a
         5dRjzIMQJeZe4fmkiM+BRaTEbL1iMKiWWd8HUtg8MSds3dEKEZKw0ogWhNncmb0PkNR6
         wmh6r7kiHXwDAItwrrnYX39hwQBdLRYwyC8XDzzlBMmSpFPUrKbS4DxETVM+BgcL0OgC
         PSeugsdNOd5mN1MFT9/EamZSeYv6CutkNR57V9HorI4cQgX6GUYFL3tmtGUk2aLuDQFU
         d3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VuPCu0NVXXA8ZEi+lRFtiBIDXTK3MN9d4YX7eIhKxYs=;
        fh=0KsO5qc8RLvPn7bM4gER6z8W/4iiS2MGB6ndrKamrNg=;
        b=SHTJunNzAiLYa/wthly4UDwRDgwDN+TbwzPFYxL+T7LbnJXBbhHXEoHByxiiiRWvP9
         Gws5IdfLT9mjzdA5VQSWkUqvd1tvs60U2NmQcjLDB7v/He4AN138v0tbAPNoccdWAu7O
         uiD+GEypvuSe5wJlvBiFoDNcF5Uy0+2NfNfaOjAzHXdLM/9InNFVnQ2WQPRlwmGqQREU
         d1+QqLm9UAxSGxuoLBSbLtklIH5ces7KdGcklB6Jv13NXiMYc41L755DbvKEzxBb87nO
         NYQ8I/AiKn7XvpBIwkU6R1jZ/Vc9W40J3xOeE24ZMKNDPljJuPhHyqnJ8gu4kSwy42tb
         dp+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360691; x=1790965491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VuPCu0NVXXA8ZEi+lRFtiBIDXTK3MN9d4YX7eIhKxYs=;
        b=BYcfj/x/NapnAY/+LR28yha0Sf87wS3pFS9r13vmJvPjlUkjkXyzUnpTMT36w9tN2M
         Rmb9aW59fXrBMdce3MClCt6GQMAzGmWz4HiVAqL6gv+aEXEpys3NYQkPLAS27lzg7Ung
         ecqv2pCQMV+vosgKuiZexW6w9fbjKJAU7f2Zfx30/OOnxdxywddrzyQiZv/3cb2pN7Qy
         vED0PbDLmsInI0rSNIBVQQiUkxWJl+w+vqOn12zxNRuw2dZB9i5nYynbLJ+/IdQlqfjo
         17zL6wvPCyXpcW+8DJDkSnBdT9wWtMVW/2c183YKDv4DdNRbpw0tx/UKLqJwmx1l0nx3
         7+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360691; x=1790965491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VuPCu0NVXXA8ZEi+lRFtiBIDXTK3MN9d4YX7eIhKxYs=;
        b=Z3EjUOdCjQdimaCe6EZUdy7Uv+T+sBP3zUASd/VGXbcaVrBvOfL7/PvnuNGl5nzv7o
         ljmEAYVRPDNMlHEZZd9/sYBnPWrP71/DNKlnHtXqZTn/OyN/L9VK8Rl4gjPykPXkKtsz
         mfL6DYKyBtXxP9AWky/wlNw16/xy14GlmLrHm9XyLu1ynXQfyn8NYiUICHRE2j9Es/+I
         QiVgTTQOuvVAe+Vu6lAdD/1H34TkJB3wKDzfozcwC7hQbCk+8eoPbJV7StP+jrCicxB5
         IphJ+F7D+TCATo/O9oCl/apgC3bhav5ZccwrD9C7o8xX/yyjoFRlQXoTLPcCDt1b3/Ap
         Zhdw==
X-Forwarded-Encrypted: i=1; AKwUvBwd5qh04OEsXvuGX99ITPRxEhr2yRv1TdjO/qX5ovr6ABmfN/33JFcmp88CBOIKKeH+Gt3eP7ywxLDPQoY=@vger.kernel.org
X-Gm-Message-State: AFuF++l+GJI2Jk2KdMdMixTMR3HA10n0+Gxxu9t22w+FkarlLUMbFwPO
	cKmEQqmXL1Qg2tvoousqYuk6YiV1C4aVIFasZaTFKfbRXeDSb1mz6rZB8ZznoSx3aHLEJD7irG7
	I4ZoarCLBfu2kx+mAZ/9xrMHXWbOZwUk=
X-Gm-Gg: AYBFou1ugOqdKb90pp77h6JT/6USqjZcuxKAh6D7QdKBAWs+Pdta7F/wamSbPEUXTwd
	NQ6wFfgXYzxd+G1fdi8OIT1Ux8aCe4TxefYdXmu5Sbk/paCSLPtkb5pb5I2wj/sA0sXH3BTfBDa
	KUVuDToTwfUzdePH8f0otW16tq7Ph5jKg/35lLDvVQIsc1dZZurxoTR7xjc44PzyymsfGRSjmZp
	c25AU7qhIjLvFk6XHhB8wUUi6M/i7D04rhTYK6qTBhE6En2OgLkgLGPoPGGW+8VerA2z0bCj3n2
	Gd86qpxF6IqTgLBlNYS0hHv0UriAnIZlhivfb7+g8/3btIZuXkRYWiFpE/WD/d1H921hcXWMF3r
	4g1GIBI0MASU=
X-Received: by 2002:a05:6000:40da:b0:486:f907:ebec with SMTP id
 ffacd0b85a97d-488716f419cmr13910053f8f.31.1790360691287; Fri, 25 Sep 2026
 11:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
 <7571f005bca65aa4ad5e7ec89e62801ad058b689.camel@surriel.com> <CACePvbV-tazW=LmsbUtAhHzR2d6JwFT5R1jYZ9_NTp1hxXH=bw@mail.gmail.com>
In-Reply-To: <CACePvbV-tazW=LmsbUtAhHzR2d6JwFT5R1jYZ9_NTp1hxXH=bw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 25 Sep 2026 11:24:39 -0700
X-Gm-Features: AclHuK-nk61jbPKSQK9eOD-whCQNgC46gTK8mZrS59_h9wP0CK07WrJWS_RDZQc
Message-ID: <CAKEwX=NbD12FfApEb9g+3Gt_-Rmof0tovYZsxPPyk5TCbFq=Lw@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Chris Li <chrisl@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, akpm@linux-foundation.org, kasong@tencent.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org, 
	muchun.song@linux.dev, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
	baohua@kernel.org, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, qi.zheng@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 6:17=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Thu, Sep 24, 2026 at 8:13=E2=80=AFAM Rik van Riel <riel@surriel.com> w=
rote:
>
> Yes, but it will pay the price for going through the unnecessary
> redirection layer always. It incurs performance and meta data
> overhead. That was one of my previous objections to the earlier vswap
> version. Sorry I enjoy micro optimization too much, that is both my
> strength and weakness.
>
> >
> > When everything in vswap, we don't need to test for it.
> >
> I've been there and done that, the result was pretty bad in those
> earlier series.
>
> > Handling the details of what's behind the vswap would
> > be handled one layer down.
> >
> > Chris, do you think that would be cleaner?
>
> If it can wrap below the swap_ops, it is just priviate inernal dedail
> of implementing its own indirections. That would be much cleaner. That
> is what I am trying to pitch to Nhat in prevoius email but does not
> have following actions.

Registering vswap's operation as into swap_ops isn't too hard. I
frankly don't see much wins to it for vswap itself, but it's not hard
to do if you like it.

What I'm disagreeing is treating it as "just another swap device". The
implementation shares a lot of swap device's machinery, so I have
don't mind adopting it, but you can't treat it like a normal swap
device, and expose it to userspace like one. You get issues with
allocations internally, and externally you give userspace a vector to
misconfigure with device priority.

That's why I've been insisting on what's the use case that motivates
these aspects of the interface that you're interested in. A pretty
design is not a real usecase, especially one that creates problems
with userspace misconfigurations.
