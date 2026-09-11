Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0681F3515D9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136908; cv=pass; b=Hb2VAcXunfXiCG/KE9fL1o2uYHyd5weORGyY4sL3X/ZgKaRzG6imy+hKEeXVsz/yGRQZiZ3/dB4qJ+N9srbjmwZfscPsEy1iLojVc3EsaaFhJUOwFdvj/FGFS70k27kCepLKbUykAodzE3VYRNmIvt1l+kwZb+xfnK5J4obGVoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136908; c=relaxed/simple;
	bh=OkVCJuwmBQSImGq06egfb3qFzategRQekOyDcs9IwJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tpo2l4kut/Dx1pO4CJfCn0MBK4HnLfP2ffKqRWj1M8/iTPvnm/qgm7EhDz7DtKaf0XL54kjfk7ibXvLPaUu+FrMehdSRQQXvOkTgudjm+wicgtzozfdzNmYqiqbEtJDMttCy0Dcy3Gecw/ruUOlZplgOgNw2wIumFwHEedlBe9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vr3A4TUu; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vr3A4TUu"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so2621cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789136905; cv=none;
        d=google.com; s=arc-20260327;
        b=hH18b/AcOmQMR13v8RQNRNzip9MVXkWuhU1HqUuywzfKWHUehU0/1R+UYUr00W3PGo
         JPaF0rmDF3M1wacS8wR5VWLtpkhYUPrpQ/gGf2cJi8tAD+idotCKmL5lXHDlCgiOczAa
         LD+3FMgydCFnIEUMoMtQFCLzW/Wl/W9hQk0/AT5gQSkS1yq63BPAfxiO0I7E6LaNmjk2
         J64s2wGjjdostb/0+WpdpTJDO0fxyJHqV7595cYINMBHCJGWjooy5GedQbUY+DbIbAvH
         NCZYKi/J0/QWAJzLJHEhHSKFgP6IF+eBid9zS326rmeK1geHawZV2EKFd33zHp1iMXUY
         4L6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OkVCJuwmBQSImGq06egfb3qFzategRQekOyDcs9IwJg=;
        fh=PfTgH/q8V29lqFBb6ACmzBvtGLPjAch7PRDw+P0lQpg=;
        b=dCHUdgmNwHtxz6p2NngE1Gc2OpHCgpjHVwGMtgZR7BK2kvPp9LtQogMwz/VZSovSLf
         2TEOhPCyoXd37XSZF/Y//DXQ80OSr8reGFAfnyBxeAH8anKS2+KXAGebJDhXhlvLDeML
         4flooZV0nCLltaWON08LpFwiSTyk9lHgYRU9d/WqDk9FofLXMwXpwPoQmi0xALgTsLbS
         j45f2kgwDqiceanaeOKCUaamW86+uAIymQRm1UyP/ojuiFY3AfrDDr+J++c/yWHdMD1B
         InPuOYIu2GL5BnEYLZYA0WBAgyS2vvMdaDp+d4r8+GHg1dkLtR9dStvCiyc1To8yPJNw
         miAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789136905; x=1789741705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OkVCJuwmBQSImGq06egfb3qFzategRQekOyDcs9IwJg=;
        b=vr3A4TUuJW14v/BgHVZDlExVXYmMmxWUj2TtswxQDiMIhsbFSE3WBj82CQvJiQnSBD
         exac/BK2DKiJ/Y90ysovwTjO6RU6HPU3SYqt+Chec3jTYOoeHnIPhtIelnvtf5Oenb17
         COD7G847fFDX0qlXSd/s/XMYQ3Xul9B9Y2MBmB6u/0QDWueMdAX82tNcaSAxNojH17Yr
         DzjDDcqPhwDy9Np7/YiGMl548bwzgasjizZzIDcLvZpKZUS3KB03JmTp4pPr/gRUATzl
         SnNiq71MS2jFCPwLRpkRzEE0258IVTPXvvbiPDRBAu7Ul4IXUj7MBpzoaIrxwEsMX8Dv
         7cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136905; x=1789741705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkVCJuwmBQSImGq06egfb3qFzategRQekOyDcs9IwJg=;
        b=IK/ufyKI+J1V0yh5CrEPYf2vvc8hIQ1zKrP1+QAL3RNPUfA7gTjmoD8d4xFByhoKMC
         eHeCSVyF+14OzvmcWpB8bdc9r3wlvZ7QXmbz80yzmNGov2TJ5ICpyGJbSjoGoLaUTNGT
         h6HnMYIKmmQFAr4dU0nh7zNuSV9WMwmkm++RpUfB84zmxiL24Q2IBOJX0Gftx1e58Skq
         6ae9WiP0IlbbKwxeKUKdE3PQJE+k0yYhd3A8ThAxPUYzpNQefSafthfiJWFNTpkTKC28
         qbnPuzrP0qqB59JZhNFV4tfB6S+WC+hljbGr4RGDeOk6Gpgx8TGl44j+rubpRf0U1+Mw
         Q31g==
X-Forwarded-Encrypted: i=1; AKwUvBwPbb97Yr1iNmZLkDDvPKCx3GkPq58dmfhHTKq4BIlvSddK6yOk/xw2fB8uEkr0uJDbANjxa7ReSomvA1g=@vger.kernel.org
X-Gm-Message-State: AFuF++lSWSl+2yZedeyj6ls+7LYvuJhPOytQ5/mXYL8dS+ib9jp/7h8C
	ii4r3a62JpHDVWd6uk2/A/NHOVJY3DXCEC2SZ8AyqPfyWmphoEL/K2uZqxndnGiXHw4h0+e1r4M
	y3wx16UtiProHMJf8MbL27K75mVkXUREaYPlJ5M8q
X-Gm-Gg: AYBFou2/TpAKqPG4AFIxauxomjIa3Z/DxcgHHt10ME+ulAPBSZR9VJGt+lq5HLuSHLz
	1jZE9etVxAuuldGazfLiOrDgOxRzrwyOZ+DRjQnkH4QBkXeETNQOd2KDREOHyt51nNTCm+MP+Pg
	ay1ZGFYlrr36khM+ri6E7DizBohIYn46XtUBjwSiZPHaMSj6+53Ytx07/I1uglri5m18ukiX/Sp
	xXTrLfQdDKhbk+s9CYjHVf3w6AN41Tsa2TrekRg0It3tQgyOublYJW7hJYbogrJUCIxJu2BjFiR
	qgpvEtYF2ByYcarEpmjrzyX7Qe5vxT0TttR5comg62mQaOFo4ModK2w=
X-Received: by 2002:a05:622a:999:b0:530:5120:19da with SMTP id
 d75a77b69052e-530c93581c6mr18486911cf.2.1789136903951; Fri, 11 Sep 2026
 07:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com> <20260910234737.1340642-2-surenb@google.com>
 <008dcaa3-2068-46e5-9e58-afb590d90584@kernel.org>
In-Reply-To: <008dcaa3-2068-46e5-9e58-afb590d90584@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 07:28:13 -0700
X-Gm-Features: AcwNN1XuMz6tXlbjt5zzQkbqGbZOBrpxgwA9ACDwXzvAZXoq6Qjcyr7XzcP7kj4
Message-ID: <CAJuCfpF5CBrCxZWm+Luopf2gq_hHxsbw0QptNhfRT=+KjyWbJQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] proc/task_mmu: remove unnecessary helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Usama Arif <usama.arif@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 3:52=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/11/26 01:47, Suren Baghdasaryan wrote:
> > When per-vma locks were behind a config option, a number of helper
> > functions were needed to simplify the locking code. Now that these
> > locks are universally available, we can do a little cleanup.
> > Remove lock_vma_range(), unlock_vma_range(), query_vma_setup(),
> > query_vma_teardown() helpers.
> >
> > No functional change intended.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Liam R. Howlett (Oracle) <liam@infradead.org>
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Acked-by: Usama Arif <usama.arif@linux.dev>
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> > ---
>
> I think you CCed me only on this mail correctly (the other ones went to m=
y old
> RH address, I thought that one would bounce)

Oh, man! I used an old list of recipients :/
Should I resend to avoid bounces? So far I haven't seen any bounces
even from the previous version which also used the RH address.

>
> --
> Cheers,
>
> David
