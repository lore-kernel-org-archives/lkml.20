Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F24F68A5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626105; cv=pass; b=Agm4YMDBRiFLBAk7CO+14YrbLS3SUMTy8qluX9itr78wbZny53owcoMh5GPQzY8rk73WdAPIRW4JyTLXZixTYwkhEZlWwO+xzOnc96rqQee2u4CGhcGSm4XPHsOmqgjeVt2J5zis9z8bcrPTgf6h1qW7AoWSx4OrnpPAq+rHmRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626105; c=relaxed/simple;
	bh=m350LjJY1jMyPBq9Hw+vpamww10TMqgLodWqNEeWjYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMvwhEDk2CxBSqC7AdpshuuHGQM+ZZCuCEkZN1z7IlHL+wcZYgwVCHsohDiwqGsHbfW9ysdu02/L6uWooVIF463lJhyLqwuIn/r0ebMSHk7LAm0rMtSWSnNvE6uNXxwHUzVhrDTWhSDql4LBMiGg2kWQ1Wov1bOZ4HGM56uSTZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAJYSs75; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAJYSs75"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2bf3cc16baso317451666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790626100; cv=none;
        d=google.com; s=arc-20260327;
        b=nqOKUnYRWqWeWYM3xisu6sUZd70Y9QaAP3bd1wg1Ir1hD7j0TdPtpvQ1p/SG44es9d
         HMsueshm4DHzJ05ESyc7ZznrNBqUunyxaB9VJbLrJMl7m0adiGNg1lj0UZ54H0qmB9b3
         jsYp+sXqrTaKJyKrvnvf9OtUzeJnoEZNVwKv8mqWMjF47x3Pefq0SWhY9NZV8p7hcAuA
         iy/MwuBq+tfZUCrvoWlRVUFRfaEpN8ohJdB7n9w+xgWcbmMe6ITDECf+X1CYI0eqXi8d
         krU6jhpg3tIMil/+yHKHqNlUKfXgBad2sLa8inCAQvgMqh/JvGeJrNSuLlLsldIuVkZH
         ooaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m350LjJY1jMyPBq9Hw+vpamww10TMqgLodWqNEeWjYM=;
        fh=4eJSIv2ZOFqFe0wa+yt1hpccRS2Cv/ZyRcetIk+iQlA=;
        b=lAsDPkhq8G7RRy07NNLH2IGlIC266Nodekjc+hWgzlq2UcIE9p0xvi6j33yh7R3qWc
         75+A0qOmjwp5CTTndidlyZxpDYl0wMuw0I4IlGFSv0PnOh8Wc8OBnY2lmW8kj4M/Ex1T
         njTb/oMBInZNg79XdpZTRsROjQIGaopWe3LagnKz1MkbMGvETKm/8W9qWdFkXScm3Fgu
         63ubdGzVlQTiMwkAcUfj5qsgWLqNtV/crNrH9WE4ignLZR7pWCwIO1vMH8Dq1GHv3oiI
         cT730zH0iNBqIYtkU+8X1qo3Jp19LUReCJ1H41MP9kh0HGbE+qaDPH196X+IKGYoOq8l
         aQCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790626100; x=1791230900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m350LjJY1jMyPBq9Hw+vpamww10TMqgLodWqNEeWjYM=;
        b=fAJYSs75iromDJD4CPUyHGgpigqiwDvYfHnt6nLap9gIvaKZhvZEGM6iPtAxsoWiU/
         w82KAJ9yfKDL2/DXhE5aNUlTn3a08g4cO18XSIMiWjn02ZuCTpFeBzcsfwU/RnEWrFkz
         7KRJCvSnDICCAW3+wv50G/ny9sgBRfYOOn5OcDBeLrAQYVZnHLTYrtP4VNQjT5ShJId1
         6uDll6qEG6cSFUVYO7jt2E0czwGy1I9yYUyCNtFdfdhnaaZGTU+9Xm4ySeDW05zEuyFN
         YEuXzl03sieSzVIkR6ePAs6rXuzgloy1AfGoDD1nsPp1KaJHIj4sDX7r0sQKPdcugnwL
         vEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626100; x=1791230900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m350LjJY1jMyPBq9Hw+vpamww10TMqgLodWqNEeWjYM=;
        b=myIq7BJQE4dbMu8Uw4uW3Fb7CDIbIQtsmJcPjUfxdahAr8dv9ub3Tkfbe9fP0Hfn8z
         7eoQcPlQh6Mttg0GVktFj1qXw/Ovb5RI03jgTikCboIZn4sYPUiUuFP+iOXmjHSYOcrP
         bjdFLM4QK+KBbh7qH/xg97b05uRDUxqLUhPaA1DHYJn6onkv/2KRUvE/74L0XTzqjVLx
         9LA+k4j9drmwqIK8aq+uvMBwb9RcA0OyQYb0NUsxmNMEpbo5eWygRl1g8HPfj/Q3ySTs
         Yz3jwaJalHRGkA2IItXHmClnUIolCStdXtqNE9pkMeimG0aLhrrV/18JJfpd7sTAYNiU
         oBHw==
X-Forwarded-Encrypted: i=1; AKwUvBxJLkVnKJscmpfpS6+LKy8J773qdA+A1of9c4YAxYC687D1MLi3b9SILvijMzPkBTfbiAiWmX6BXhRehIY=@vger.kernel.org
X-Gm-Message-State: AFuF++mu2WC7PjZorPMbf5p/eJ+DnKUG29ZUVIcQc77sf5wDjPkzG/Oo
	CZVqLstGIwFRzeLdlXWGxdysgP9G9p+xuqylAUzov4bv4QOwBDgHweS+FUrtziPxwbGubUpW1Wt
	MzeFHiMuOH9R02feNkFnVSOAmfmon8co=
X-Gm-Gg: AYBFou3hz9GbEroi2Ggbc3lvboDZBGpE8cW0VtfhXmeu5KGCm/auNrZ+Mk+7xao+hHm
	XHaJV7nHI8S168qef27CyGCjsUL78PiUYnBNkDBCipSLPneIjhUddDPbNhHA5lWnTYdSf3NqnND
	Ynzih1eoq4f599tHP3rWyDLPvCvWS1VRHoOyHeb7eQH8xsrd0dTt6KET61+T0y/Zm7ofOm4pQzx
	Yx471aDGYwlt6oIQqKup2gpqEToi8tE3pdHu1be+2UC+7Q5384iPAkGOUPsQdCyEOoU8EXogDCr
	0JgTzhavcS+wQ8w6o4nawUTbFWkNdbcS9Cbzt6IoN31WvNWLtauD6vY40p9DZVqUhH9n8m5l/dI
	jmt5PeSq3hTLxI12guwbKr0xn9L2sIAR6DUsKEiA=
X-Received: by 2002:a17:906:7947:b0:c26:1649:47ad with SMTP id
 a640c23a62f3a-c2ac53c3f15mr1023459966b.35.1790626100273; Mon, 28 Sep 2026
 13:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926205708.384308-1-meatuni001@gmail.com> <CAHp75Vdj8qVY-hCoCxxd1Pg2JaaDjc+QgAK-G=w+Cb=FTYYJEQ@mail.gmail.com>
 <a2687bd9-8cf7-1d08-41fc-9d6e69b5ca17@linux.intel.com> <CAHp75VffMOx6q1JKHFz6-_rByiC=1xTqn8Aw47i1KvWPBLCPkw@mail.gmail.com>
In-Reply-To: <CAHp75VffMOx6q1JKHFz6-_rByiC=1xTqn8Aw47i1KvWPBLCPkw@mail.gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 29 Sep 2026 01:08:08 +0500
X-Gm-Features: AclHuK8Oh9UkHwUDmlyUtQldOGulqAb8nqp7O-XzzhJedDF5xraB1nxETnbeFgk
Message-ID: <CADqcGB=zbkRHHxPmMwi3y24NPH=fwBSELwUWE1b-CTLofuusMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: add ESCAPE_BACKSLASH flag to string_escape_mem()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for review.

I've send v2.[1]

Link : https://lore.kernel.org/all/20260928200318.63383-1-meatuni001@gmail.=
com/
[1]

On Mon, Sep 28, 2026 at 6:39=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 28, 2026 at 3:59=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> > On Mon, 28 Sep 2026, Andy Shevchenko wrote:
> > > On Sat, Sep 26, 2026 at 11:57=E2=80=AFPM Muhammad Bilal <meatuni001@g=
mail.com> wrote:
>
> ...
>
> > > > Add ESCAPE_BACKSLASH, which escapes only '\\'. It can be combined w=
ith
> > > > ESCAPE_SPACE, or used on its own, without pulling in ESCAPE_SPECIAL=
's
> > > > quote and control-character handling.
> > >
> > > But why? I believe it can be done in the current implementation using
> > > the last argument @only (id est use the list of the characters you
> > > want to escape).
> >
> > Ah, that's my fault for suggesting this and not noticing there was way =
to
> > negatively filter them.
>
> No problem, not a big issue :-)
>
> I think here is the list of those 4 characters that we want to escape
> should be passed along with ESCAPE_SPACE | ESCAPE_SPECIAL. This will
> get exact code behaviour as of today. In current patch 2/2 AFAICS the
> additional SPACE-class characters might have also been escaped which
> was not in the original implementation (not sure if it's desired
> change or not).
>
> --
> With Best Regards,
> Andy Shevchenko
