Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807001;
	b=xUpLwX/rZ4nvHDNrV9xRN5UZtQfuxDZjy1Qx0lR4wtSp9osAPCvc0C/0DrKsj2uf9xTS
	 ZOypVS0y+OyuH7+07YqzxQSeWRqUL1VLN7eTOeojcT3eHrPayFA5k/ztu7nWXs/biIo3A
	 2RWPDaNcuM/wIWx8zgRS8g2m4KQZi96EoPLq70TuHkh/GOZTUuV8x+X3J0LqMrglK0T/w
	 IZGlh8LjjGnrSGHtZejR7aBwZZa7Bm0MhBIzF1DKqO5ta2uouGomazJJq1cQAH+70cOmt
	 00k/LSY9wg14Oil8yde4H85clZ7B2jkLQVCqE5ltbXYhotnJphGCL3i7LTuvodn9eBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807001;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Mk2Zu0f1DcqbosEKPJowBE4Ne6xneVgP8DSPeZYYzbk=;
	b=QnF7XTbEM51lzc2HEqk2JE9AZ2Pcp+JXXDrHjEg4aIcfcgDdhC9r1DMgpC4BMeCn/ELX
	 WZ8fnEPc1Ygt+3MaznTG6MrKQoVlK+rmCtO0zUlmUKLQ/H5AXHlWPfEeCHua+w1/cXplI
	 9VXI0WFNKvyJqsNWk0duKTTpepCOhz1u1K2VbhaveT7j3v6UUVZpJTSplxU47RDH9ZhvK
	 aK3HV5Cv9flTPd00fPPCxGaNMKFFV/e1ZZssIiT19aEXQ55t2sdazafTAtV3AxftW+zex
	 NdyBIOFkYQnUKZS2O+31LZTlNWf7cV1QxIStXn8i34bN/h+RvQdaq7Y1wGEWUTjSveQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLH9oLtc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A06606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLH9oLtc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A98F1F000C4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794807001;
	bh=Mk2Zu0f1DcqbosEKPJowBE4Ne6xneVgP8DSPeZYYzbk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fLH9oLtcPkXkGwa4fE4J/2iVMbLj5QRz2iTWZoByKBupgk/WdzzvfCHJUeK5ePGnx
	 imR/4xDdNfG4llLAK36/cOfkUko4hhCBzIoExFwwVh3wqK9fpBFIxXeoa5qyr+ZWXS
	 KCZH2iDdOPZzSWbela2oNJE3JUsXIFc0nKeqDqnLcGoxpCrPiG8B4OW0BcdvikrNa/
	 qE9JjCeC/SZoqt95oJEoQJISy2TUs/xyxamfsq9pEEn/Hn8Un8ezcgNwIGYV4E+ZbZ
	 hkAozbQwW3mfGLx0Xqdn6d+Zg1wYotwy9ugeU7mowr2YeTWmgEOvXRCfz+U6LFA3VQ
	 w68NAwnS6s+ZA==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f20b304c0so374789085a.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:30:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFykTyPcmsmwXitzx8K8BEOieiZyFWUnxWitP4am2pTM3GqWRRLNlvxwTftfpZkA6o5r1PWSyBhoJWog/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NmLEaifvTCblJ6MMC/SOamwMkyUbkszX6wDvy7rB2sGdEdeE6
	2uSY+N+LrPebtUnNwjNy9Puh9ZWG4XFq1jdN5Pg4/zD1j0aFArgYWGiIV+bwrH2T4CjGIK/fxhF
	CULz/S8jL26YWBA/tDdVP27yX9fZ2x3I=
X-Received: by 2002:a05:620a:1b8b:b0:949:6476:91da with SMTP id
 af79cd13be357-949647698c9mr955938785a.31.1794807000541; Sun, 15 Nov 2026
 21:30:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMgjq7C_cH75JrYs8=P5LbxnDjDD6bqeqsCidOPa=r8Z+42sCQ@mail.gmail.com>
 <20261116042556.42111-1-baohua@kernel.org> <20261115205046.8473acf5a93d69d460598559@linux-foundation.org>
In-Reply-To: <20261115205046.8473acf5a93d69d460598559@linux-foundation.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 16 Nov 2026 13:29:48 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ycvQ7c1WUmk7y5gW0tE48kThsLECmKo0UtA5Hp3tLr1g@mail.gmail.com>
X-Gm-Features: AclHuK_8BnV9_Nby9IDOzlOHAp8QLuDw8I-j62xEDKsAvvH5HBBNGmkFtfwxX5A
Message-ID: <CAGsJ_4ycvQ7c1WUmk7y5gW0tE48kThsLECmKo0UtA5Hp3tLr1g@mail.gmail.com>
Subject: Re: [PATCH v9 10/16] mm/mglru: Run aging when pages are rare outside
 the youngest gen
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ryncsn@gmail.com, axelrasmussen@google.com, baolin.wang@linux.alibaba.com, 
	baoquan.he@linux.dev, hannes@cmpxchg.org, hui.zhu@linux.dev, 
	kunwu.chan@gmail.com, liam@infradead.org, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, liuxiang.277@bytedance.com, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, shakeel.butt@linux.dev, 
	sidchintamaneni@gmail.com, surenb@google.com, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	zhuhui@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:50=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Mon, 16 Nov 2026 12:25:56 +0800 "Barry Song (Xiaomi)" <baohua@kernel.o=
rg> wrote:
>
> > On Sun, Nov 15, 2026 at 11:55=E2=80=AFPM Kairui Song <ryncsn@gmail.com>=
 wrote:
> > [...]
> > >
> > > A little nit: with the rounding above, I think we don't need youngest
> > > / old as an array, just an accumulative value seems enough now? But
> > > feel free to ignore this so we can avoid more update noise in this
> > > series.
> >
> > Makes sense to me!
> >
> > I guess Andrew could help squash the cleanup below into the patch?
>
> yep.
>
> > As suggested by Kairui[1], we don't need youngest and old as
> > array. just an accumulative value should be enough.
> >
> > No functional change.
>
> It got a bit messy because the later "mm/mglru: restrict eviction
> accounting to eligible zones" alters this code also, but I think I
> figured it out.  And I might have accidentally fixed an 80-col thing
> while in there ;)

Thanks very much!

>
> Here's the end-of-series result - please check.  It compiles!
>

Yes, that's correct!

I checked the code line by line and also asked three AI models
to double-check it. They all confirmed that it was identical to
my local code, apart from formatting differences.

I then ran another test with the code to rule out any possible
hallucinations on my part or from the three AI models, and
everything still worked fine.

So, Acked-by from me.

Thanks,
Barry
