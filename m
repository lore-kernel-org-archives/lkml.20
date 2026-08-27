Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F8355F49
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830286; cv=pass; b=EE7m6bJXQjNpJCMxy7p7EFaNDr7LFx+3RZe11qvV//Wu4AaHRqTWqbEYG4CCh42rLj4k/5ZdAE38HK8uUEKUqVZ7oGgQ4bMDn5k+p7vWG++il+anYwS63GfN4cUBJ9fnYcilhvQR9yaCujahAVtj1qkqt5Qu+kPURJjpgRyXpJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830286; c=relaxed/simple;
	bh=aCx6u+/WErOdMZSErXy4R6xCg4KVxsR02vlymlXOrV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZ7Ztut7nykql4GpW2jn5N4HIVgsycsZWoR3vHmtliI9kQVJ10v2r1BnXFtyrEY6DeDKEsrZVgaUNSo/+eT17y6/hTa+wBxysvzbWxolTpiWy5SLQl7AjtmKDFrOZFIo/6rDnaM+OF1A+2ampmAnqGfbWNsIm7xGsvvjpCinkFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7S3HWjH; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7S3HWjH"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso3349905a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787830283; cv=none;
        d=google.com; s=arc-20260327;
        b=IyVjX98qS6H5GPGaOma8+L/Nl55j5zbw52FpFlHDJGUD1oGVdX1538QqQWI/CRuNDW
         SpDX3v9FLuoz4kaj+851iy6048MCfY1QIoC2Fqklg/xjqKwvOnl2TV6JTOJBPujpIAGi
         mkxJUHqyWAv/vxqFG6eXaWIQyFpAgYrSBfOk994SzG7AamhoaoreeuCglAsSbX+ahE+3
         squ5nrTFRCHngBsRqEcDKWvZ6Ji8f+LErWz5fdgD+CdEEHvfUYIBO0Y2NxnV8MJml/2A
         DKIs2nvj5ZEiH02iMuyjQmKpdDBeigvlKerIuSc6pzNqtj8rtm9L1UWKARUkpXmrxo71
         xWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yz47dSUy4kXSBaOTlf7K5VK4z0sPH8KYvLyhtCLiLsc=;
        fh=YsIBNGk2CVxHXbO8mtL0drg1s9+7ryJsaqAuFPuzC/g=;
        b=NgGmyO8dvFRp+MeoNwijXQVi51cJ4ugECBdoHy7N/qAmsRWP2nWTRUhQkhcbaHBq+s
         K3YyGg0qWbK6YYT2xy6Y5w9FzWF/55U6+nzetbjShHTg1BbWeEzH7uVcvAIA3uEK9O9+
         wygcN6OL+IVKbgilS45KIGAIVbCZIpxkBUFi1+P/fPayPETH0obN9gi+6BdYYiwnAZF/
         TmSM5/78jIYEtI1c/j0w3E/FbltDpXbt3kzkolFsDB8LZZ3qP7ryjCkBJIWS/6MW5eaB
         f5k3ySUSBnOY588AOSrNf7y/ZVLffwYCYj7EnvSgN7CuZrraeb2cemkb+1sIKgQCwTHb
         8sNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787830283; x=1788435083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yz47dSUy4kXSBaOTlf7K5VK4z0sPH8KYvLyhtCLiLsc=;
        b=d7S3HWjHCHAR5b6C3TE/b9OSoiQV8ICuQZI+Ln7OyzqSylZ3RpzFuyxNTHfAGvkdG+
         qyaj3E4lvOKbQJKN6XSHbL+RQpuayDqNasTT2zzHRVViHWHKZbxhd0uIetqrqk8Eaj3d
         96xv2TE43KOgH1R3MfkIbrZLvb+TL0p5Hnv5aQBUvJfsAvns11A4HJ5mN6y51uM01SAm
         FZJ2E9Ww2hNbPguSFdPFID2g/lwHsgT4ggaXo9C4DO/G1JB50kjy/fZGHxcuwu5Dj7i/
         Oo23Wl+il3E1ZoCwItqxRbMCwDGmV37Tchy2HEJAd1q59PCt8k6ibc2Syz8ev9roO2vD
         uSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830283; x=1788435083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yz47dSUy4kXSBaOTlf7K5VK4z0sPH8KYvLyhtCLiLsc=;
        b=ob11yRCtHBZ3QWlE91Ga1j18tT8x4NSj10/W0fSAu+CglIftIY7Np1Lp3oGdZK3x8m
         3Fxc8L/xBTNX5nIEc7eTS53SzO762wVKO+kzoqJ/hYlvTFNLH4KJjUKCziHItJEEDQbj
         bDHVOvTx5lv1zarpDaf2+UaB8bT95wZgo89dJMIsYM7+MnGsTwU3YFBu8DaHVvHLaeQ3
         jqk4OQSLzTdX9yEJ4zZJBJthFDw6ZqL7bldfUqqZv95asdHneXHx/ThZISqveUWQQAAT
         iCWP07SOEeGUCfUG4ymHjyo1ZRPpQ8OY5rfhUAAxd88/HzNGQmCe6E7U17IWvcgp32NG
         aFfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVoo0rDRZjpVL21yJtV9WtgeAtoRM3SpT5//lfS6sTyPKQF2LwWBAq1gndK7iYdnlm9BdcgdPOOmpAATI=@vger.kernel.org
X-Gm-Message-State: AFuF++m6Y8VqUGJqTKjamQ/7TYf/O5oXBBhabUCg+AIN6FBBTQ7WcGSL
	7XwtOqZ/fVA4M1TzAv9BfEBFTpjhv+FraJHkZjZYjjhPA10Qj+o+NmK30Ii9D2aTYlVyq/6BvWT
	5l7/kTnBSfPONj3D1kyH1rox+cVq56jo=
X-Gm-Gg: AR+sD10s9tvcL4cOLpQ62mvLpwVANxcXEo4alvWBIyUFlI0fxFhobd2aIpy/5XPuMiE
	e56ij09nHU+J/jVgSTKVgAMzRfRMuun5ZNZMPTez5KL33pnmStoSB4aa0ZAFTx3PL81ZarulKrb
	2TeMcp9BJ3C8EKMDGQ8+XBgAyXpvuuu8l0RjZncEZJfcb8RcAGLI0MBSfaMwmu0GtNy3mBqpQZ6
	VBqWUYPdMhh3JDtl3LfRI4psWrHWjog5kxQ1fQjvbPGHGbyF9TKm+PjkAF14QpuW0iLydAgDzc3
	7syOOi+ggREd7czNSHUX8zhL4Egj18jINwKN8hoTy7qNdBkbWZFo9q0UYXICXrgJMrJ9iJbOk8s
	qKQ==
X-Received: by 2002:a17:907:e915:b0:c20:f6d9:d8c7 with SMTP id
 a640c23a62f3a-c250c3805f6mr1422702966b.24.1787830282709; Thu, 27 Aug 2026
 04:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821102538.22642-1-baohua@kernel.org> <20260821102538.22642-2-baohua@kernel.org>
 <CAMgjq7AZtqdu-yJ3TSa9Zq=Cwuqv-NY+ptz3Qpive-iFXR6e0w@mail.gmail.com> <CAGsJ_4x1ckY2uFoOYq=Vw=d167u+-yVpt-TSWxju41ivth2iLw@mail.gmail.com>
In-Reply-To: <CAGsJ_4x1ckY2uFoOYq=Vw=d167u+-yVpt-TSWxju41ivth2iLw@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 27 Aug 2026 19:30:46 +0800
X-Gm-Features: AcwNN1VPZegaGb-tyLAke5m9CfF5cIkWG45igFHDRcXdf1Z1eBzoBkFZQNcbqKs
Message-ID: <CAMgjq7BJGCdXYdK6PPuM0Ut=R0otvpWXPUeK6n4Nbh6YXiNK-Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, chenridong@xiaomi.com, 
	david@kernel.org, hannes@cmpxchg.org, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 7:21=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Thu, Aug 27, 2026 at 11:21=E2=80=AFAM Kairui Song <ryncsn@gmail.com> w=
rote:
> >
> > On Fri, Aug 21, 2026 at 7:09=E2=80=AFPM Barry Song (Xiaomi) <baohua@ker=
nel.org> wrote:
> > >
> > > Currently, folio_inc_gen() updates lrugen->nr_pages for every folio
> > > as it advances generations. Instead, accumulate the size changes
> > > and update lrugen->nr_pages in a batch after scanning the entire
> > > oldest generation, or when the scan stops because remaining reaches
> > > zero.
> > >
> > > Since we only move folios from the oldest generation to the second
> > > oldest generation, the active/inactive state cannot change. We can
> > > therefore skip __lru_update_size().
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > ---
> > >  mm/vmscan.c | 46 +++++++++++++++++++++++++++++++++++-----------
> > >  1 file changed, 35 insertions(+), 11 deletions(-)
> >
> > Hello Barry
> >
> > Thanks for the patch!
> >
> > >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index c1404a59523d..0d74fc00abd3 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -3296,20 +3296,21 @@ static int folio_update_gen(struct folio *fol=
io, int gen, const vma_flags_t *vma
> > >  }
> > >
> > >  /* protect pages accessed multiple times through file descriptors */
> > > -static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
> > > +static int __folio_inc_gen(struct folio *folio, int old_gen, bool *i=
ncreased)
> >
> > I feel the naming is a bit confusing, the __ prefix doesn't tell how
> > it differs from folio_inc_gen very well, maybe just name one
> > folio_inc_gen (the old gen could be any gen), another one is
> > folio_inc_min_gen (the old gen can only be min_seq), and with sanity
> > check in folio_inc_min_gen that expects get_nr_gens =3D=3D 4, and
> > lru_gen_is_active(min_seq) =3D=3D lru_gen_is_active(min_seq + 1)? This
> > could be a build-time sanity check instead of a runtime debug check.
>
> Thanks very much for your suggestion, Kairui.
>
> I tried splitting this into two functions, folio_inc_min_gen() and
> folio_inc_gen(). I tried a couple of approaches, but I think I=E2=80=99ll=
 give up
> on this direction.
> folio_inc_min_gen() and folio_inc_gen() share some common code while
> also having some differences. It=E2=80=99s hard to avoid ugly code duplic=
ation
> because folio_inc_gen() cannot call folio_inc_min_gen(). However,
> folio_inc_gen() can call __folio_inc_gen().
>
> The __ prefix currently indicates that we don=E2=80=99t update the LRU si=
zes in
> this case. The sizes can either be updated in a batch later or updated on=
ce
> by folio_inc_gen().
> Maybe we could add a comment to make this easier to read, or use a better
> name for __folio_inc_gen()?

OK, thanks for the explanation. Let's just keep the name then.
