Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573995;
	b=ypkUsdMZtk3a2rlU1mYUnS4Hm3umKjEdHCjaVErVOGgoxuxua/bUn6yhnYPaZQM1xz+s
	 HaeXmBg4FHaHIlIoOAXQQMDoQCqQmqozxvaksOpiUUpQeu+miOrC6GM2+c4tLpFrvajMb
	 vShYa+WIdppd1pk7nWi14F82MlMrKaL0K/kJAF0DSYmSvbkAD1i5VW+Z4LHvxEZwVC+D/
	 MCaqQlk9GlP3e48CBzX2BR0wD9tedwyEWS+OfNzEL+RBkXQR2xGD4FtJGpdYdrB5fzgw8
	 5W0dLeMjXF4lLbCSN0/os3QEM8Q/ttuyRlqwT5zN9978j9dYE/ekgjO9KSj6waj/PKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573995;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=TdukyCPcl9fUvggoegFEcLQWHoHKZ12f0CCAVKT3rYg=;
	b=QFOY3MxUWAEfZfs+oiR91IXcsRae17KHOsL9Ydq3C9lI/WujKmCMv9sT4UG9nYm5J8Da
	 TDdBqfD3xN1rgXsBl7RN0Ba72zXD1I5LmbS1n5YJCmm5W68q9Ma1hFJd+cY0p4AXQCt2G
	 4rvJvIjiesgtPSlBbD5hSw4XPftGYXvMpSmI7lPCV/sJtVeIPwM2rtWGbT2AkcUCs4xy+
	 yBjrYKgFUzTIcFcBJZAjPlpu28cvIaVUBsTs4HQZKKpW9X9XklhavryvbzJ3Y+YhSrvIM
	 S842jyoexjJ6e2rejS1Yr2qNWQvP2Jjqqp5rLtWrygc2TMA37QV8G4TkHPpTuR6FspQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959CB606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959CB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac9db5905so155775e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573993; x=1793178793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TdukyCPcl9fUvggoegFEcLQWHoHKZ12f0CCAVKT3rYg=;
        b=M2muS4kPLmDT+zurIcWURx1Z0ALPBRQ7ZcnxPVidD6dGoUQUuSwLA7zdNQj2w758aY
         D7eh905HZtHZt4qbx1yq1tRfUgSKqie1mrwckPePccDJ0DmxIF1fniBonTji1LK4Kqyr
         enfqM+l23TFidqNIRqB4fpMmSIAzMq+6+Swaqm1OwUszBymGof0m2gKSy1kEo3nEm5KL
         dim7kf/TUU8RRdwPn/h4puSWMlzQiemTShmAUkKKqVdJJPefOw84rXn8ZO7OJuJj3ftO
         4G6EiDcqHiEEcsJNhavQmXVoVqDySTD9h5FaxpMdlIjvZVzsd8Ix90lQLkuLddFi+7xq
         dqyw==
X-Forwarded-Encrypted: i=1; AKwUvBzsmTnHPel/r6/uR8oyIDnqL0HN7+6KQbw/q2nUGJpUoV82vNiwwoa3q4dh2uIA9WaF0DG0bZ4xH8OT62k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBOruOmkIBE2SJ5mge32f1EHy2HPknrErceq6pjMtXRrOnZEy0
	srGKQcYeq/4Ebdcj3cUdV9KORKel2eeYLPVH0weAQ5dYph5ExweDElaiPTZajDS3AJM=
X-Gm-Gg: AYBFou2rERN581v0O006/l42ytFm3x1JsDtQG/f+KAH13EdEFfE27cYItZgKNdaK4fA
	rVBpvxhpMyTjfGGwev6js+Up6SzV5nQbYWF8lmX6e46dMbjQImToF3pE635oFhwi7RGI4/FBl1n
	FHK47cGzsNfnctvXv2udCCtZw+czXQYRPsaCX4g92+B1v4NbNVum7gR7mBhANUaY8n/r24pLFq0
	11/zUHaBnF7D0dkI1JvM/Yv4qbzIV0qnMe07Cckh7l/YL38UkOm0bPzknCfMNelVCu4ohVurkTt
	CkJgxv+WiasEE4aHewtKd/w3B9NGwW1LcuuVo/8I/ejqlQYJlGt0NbF1A7EUG2JyuvRwK0QA1lh
	slJxOxtVulXts/h2UgQyo7VfsjcISaf+4xP9RHlpuaUpApd2V4Uedm/cox3Ecj1Qw82iki5zhKR
	XJqL0c4omOyGHKjj7IWzZvA6IPtz9hSf/SuaTZRKWQEs9Xu9W6z1kh1vtHH5aGL32/U6wFyP1vD
	fVHpD0rhrGPaeKolGVkBuvA3eUyODPmmjQtP1NPYY+iwrG5gLDqPq3egqafYa5ofmAWOyR6H0rp
	R7mOINaGD1vU1GbILH+YM2nAHZaAKPJ5k6sSYTJfdUI=
X-Received: by 2002:a05:6122:4d86:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5eaebe75a61mr546051e0c.21.1792573993503;
        Wed, 21 Oct 2026 02:13:13 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae980f64esm2456873e0c.13.2026.10.21.02.13.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:13:13 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so268566e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:13:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+i/T226SAPhKQ2kyopNgFsU8QwgfoC+C40dZkFO3ls1oixpnn9GxiJAkH+MehByt+UnrkUfb46CIFLG0=@vger.kernel.org
X-Received: by 2002:a05:6102:c4b:b0:7cc:306:d3ab with SMTP id
 ada2fe7eead31-7cc92473061mr657933137.5.1792573993049; Wed, 21 Oct 2026
 02:13:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <0605a3c99b55124d1be71c9939f636e2@perches.com> <ate3lqnWlk9zLZC5@mit.edu>
In-Reply-To: <ate3lqnWlk9zLZC5@mit.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Oct 2026 11:13:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmmRWFJpE=A18w+Jg+9T46Aeomc9NeCCtZR-MzaJW+Dg@mail.gmail.com>
X-Gm-Features: AclHuK-q1FSczAVmbAF3hXa82KzgGcPPTlNy2rnoWV3tKHuYqGppXvTDvgYY5ZM
Message-ID: <CAMuHMdVmmRWFJpE=A18w+Jg+9T46Aeomc9NeCCtZR-MzaJW+Dg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: Theodore Tso <tytso@mit.edu>
Cc: Joe Perches <joe@perches.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 20:52, Theodore Tso <tytso@mit.edu> wrote:
> On Tue, Oct 20, 2026 at 08:53:04AM -0500, Joe Perches wrote:
> > > This issue came up during the 2026 Maintainer Summit and the consensus
> > > was that "always include linux-kernel for every patch" was never the
> > > intent.
> >
> > That's not actually true.
> >
> > Lkml was the default mailing list and other lists were specific to their
> > interests.
>
> Historical practice for decades before the change was made that plenty
> of patches only went to the subsystem list (e.g., linux-ext4,
> linux-scsi) and it was *never* intentional that LKML was supposed to
> be cc'ed for all patches.  That didn't match historical behavior, and
> as far as I know no one was asking for that change.  If someone
> managed to slip that into submitting-patches, that was either a
> mistake by the submitters or the people reviewing the change.

Historically, not all subsystem mailing lists were as well-archived
as lkml.  Nowadays, as long as a patch ends up on lore, it's fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
