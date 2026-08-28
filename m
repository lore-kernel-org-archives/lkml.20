Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE42371076
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941376; cv=pass; b=M/XMZnlvepbei1mV5SUK1XQpskR47Z53BrGmFmG5cLv0LB3rYoh0Vtnv/+FR1mJ4GRsK87Axwgnd5CF7ivLy+vKSH96qtRpqd9tZuWSI5h07j4wheU7e8CYjZcxWl+Rv8gCyEyb9lv11AxcX11oQkkE9QepbETfC8NJq/nD0Jp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941376; c=relaxed/simple;
	bh=j60wtDEgu//7CzF8nDZvikt5eDgBjEg9IddlLKg/ltY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ilwELkOfNWvx1ZUOYrnjcKGYixw0smoHM5BGsGLdj5kQ3ySs5dNWqi/YEP1DeIoXxWz3J9Hgx+Rwz5Bc912Jk4Xp7v7SJpIlg0K+3OIBp0wVoNCxCGYblxxsOGi5gYQ1Z3xFuo1KaUHwDsHFORR8b9U5GD9d+qDCaSzXyWKa8ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blm9HMUw; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blm9HMUw"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b5e907853eso825542e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787941373; cv=none;
        d=google.com; s=arc-20260327;
        b=nQwhqopGSFoUOxbvIVif4an8icJmMqhxwjBYx6N7PkbAcjqtQ30TcRSjPzxRkuC9Ci
         d1eLT9xXTPMZGUR6+H2PP0ZiYaFuZzEVpMMfcNj2iMB3HV30BaAlxyx5+O2LOTHdDDnd
         in49ndQwiAfaoJ346ZgdlB44YzgIbKYFzYUjsTbenBOQwokW71oAanPfY4CNQuEE8oh9
         NM1lNTv+p4s/X03Uj2w4yFiRWHm19Bd9gu1EJmndgBlIrjX6SkxeBGZ9fnqD0f87cC7S
         w62bpbXk3f0xp8Sdw8i/ga91Ap4a0dkOKE5riw7vmN7LqhbcXwDIfjP3/7tTwipwsDfw
         2O6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLLWpA7UkByQ7zwy3ykP7hLm5Nq+lnUYf3Hct5wt0Lc=;
        fh=VAK/NdTgRE+MmJIzVDgMTfpS/03/LLf1694B8SiFtTo=;
        b=HETsnJBKadORi1uPGaHq4G6kc/pUFaSMNjqs70A3KcrbMGUVY/kJ4a2oSN3OhRdp6O
         dea8JuclLuWESOi9be59j44OwKKQo6qDJNPfpA8Q9o3ZmXbtQSxIQoqKuaig7jK7TsgH
         BkHFyrIN8VWdJjbyH14vUhTtSWhWCPt6pvjX+hbVvgZyfZKWmiKaQTo+V1MeijarUzBv
         Rf2hbYadUiYFxvzEXY3sPeqEZx1O5mCou7O5/AmWhLDmgTpmS05tAdm2Y17wQhF/r/CM
         Hs5QvJXRl+CJvUbvI7qPpu0tGOuR/9NnqClJ6I80IVjZoKwEjkzMIc1f5Cng3Ev9Pv+T
         I4wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787941373; x=1788546173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLLWpA7UkByQ7zwy3ykP7hLm5Nq+lnUYf3Hct5wt0Lc=;
        b=blm9HMUwxiRufNARWx8NN/r4Ox9uOm3BJnOxTLJ/e3rP6ECtWE0lVQi2dpxZ8gfq0C
         bwilY4afAKSdONSuWW7vqM1KKYERC/Of1YahzQ7aisWAwN56Ts2ceEQaq1/fp3S2fCqV
         04wv6BZWAqc9Mu5LrImUZYjCKmVIwph9XNrFM/VV+3Qaaq/qO0Vy7s6djsbadH3YzbQy
         c1juFhvIcNvjLmmUoTQzsxIE8xOheBdetCuYXJQkW75I052CubtK2L+Yd0/oRowXpzHk
         GU8/5B0cTMh4sXy6aYWdKA3DQkMzNdh8WrnOq5Auh3XlgKB+WUutliCQOc+I2KqKuMZC
         NpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787941373; x=1788546173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLLWpA7UkByQ7zwy3ykP7hLm5Nq+lnUYf3Hct5wt0Lc=;
        b=EvNjlcphuVQLzYMYk/tTbLVc219atm6p606oKveQ30OphjGQw+Z/YKqnd7bQ/dTwox
         DFc7H5mAGkqTALBavIunhZye+pqb/+KtmGnlTWqivYqKYej5STyKFCoO0udKeiPaGfHc
         j3LHlZzFfOj4unMUFFGl35TUzmhMS1ZMgd6Eabh1baJUIGApQTMXYP6ONMfa4Tj1CmEL
         vHtds6+XRIPMGchH76Z1XKhLZ0BAxKm+y1Hg9JJvQ9ZZiRLMjfh2ct5E4E609wi9dC0n
         4CsaHIPJ5TjNoOrjuAmuM35pieccY6RH8JdTYqZpaYzkPAWu3WhYwCp4yK6H+0eM5nG5
         camA==
X-Forwarded-Encrypted: i=1; AHgh+Roh4n241XLEeUoN3MLerlc1PMO2UVw3eG3zefkXji5myZ0iSDXMgeYQbESqivHIaeb/rDm3ApHZXXL1klI=@vger.kernel.org
X-Gm-Message-State: AFuF++mdWmDV5k1qwngsOTn5pzNM/VOmQqeJ3lHokZkd26L+wctzQW1N
	mtiBImyr52/ZMYriCQdmOH0PEoa889zPE234+QcfUsU2mCjGv6xpGfcmzgZG9V2+pKFM3UsQsHX
	wN2EVBCIbVWtEToUMvuJdoIPAjTfmFnqOnPRfcjDNhA==
X-Gm-Gg: AR+sD10cnKxzEwZVWI6XULq7QIuV2PEnUZMH8YIWFE4YeGPpN8oc9iHuIWvhA/mBjiY
	C9OT5ra02jLsp8C7cLbfxCYDSqh0pm3BReWomnJJc5tC1TMn/12//xMVqgDqAKgif69fCN/0+yQ
	vZrp/KoPzck3Miq4JspfH0P6cb8iYosElH5Rub4BS808ATeXKAhxGppq8vA/BO5wqNLbt1VgZzI
	JiiMCoQ1qPaxUxopFaVha6SFM/RpAM9dyijDuofJBSLlthRj6BrBlTiBRV47C1YomlvAjFNW2Wf
	zY+6qcdnaDpP1X1wRFcDLuo6oideUYBis0zvL3eMcYGMK9gXDgFwQ24oJ8IV6QzD58e4EoLe6Z9
	c4WTohS3n5bjpy2NAVBwhne1kwYWoj0lmiiY=
X-Received: by 2002:a05:6512:1248:b0:5b5:ef13:5bda with SMTP id
 2adb3069b0e04-5b5ef135cd3mr136646e87.9.1787941372640; Fri, 28 Aug 2026
 11:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-10-chao@kernel.org>
 <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com>
 <b4711014-844e-45c0-b85a-4e3a98d7137c@kernel.org> <12dc55dd-f85d-4f21-8eac-f1042bcf0565@kernel.org>
In-Reply-To: <12dc55dd-f85d-4f21-8eac-f1042bcf0565@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 28 Aug 2026 11:22:40 -0700
X-Gm-Features: AcwNN1UEfcN4VxIkT4-9GbXI8caiY-ku97cijW_B7gjP7FaCFtCNTayTSYPOTUc
Message-ID: <CACOAw_zaxYUzPUSktX1KWeZ1Ha1gH1dC4hX81d9CehWDGTqtDg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 09/12] f2fs: cache: use compress cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:25=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 8/28/26 20:00, Chao Yu wrote:
> > On 8/27/26 04:04, Daeho Jeong wrote:
> >> On Tue, Aug 25, 2026 at 6:03=E2=80=AFAM Chao Yu via Linux-f2fs-devel
> >>> +               f2fs_lock_cache(entry);
> >>>
> >>> -                       if (ino !=3D folio_get_f2fs_data(folio)) {
> >>> -                               folio_unlock(folio);
> >>> -                               continue;
> >>> -                       }
> >>> -
> >>> -                       generic_error_remove_folio(mapping, folio);
> >>> -                       folio_unlock(folio);
> >>> +               if (!f2fs_is_compress_cache(entry)) {
> >>
> >> How is this possible?
> >> or if (!entry->cache)?
> >
> > I suffer a panic from f2fs_bug_on(sbi, !f2fs_is_compress_cache(entry)) =
here,
> > it may suffer race condition w/ shrinker.
>
> I changed like this, because:
> 1. we will never update entry->ino after initialization, so it's safe to
> check w/o lock.
> 2. f2fs_truncate_cache() has checked entry->cache by itself, so it doesn'=
t
> need to check w/ f2fs_is_compress_cache() outside __f2fs_truncate_cache()=
.
>
>         for (i =3D 0; i < nr; i++) {
>                 struct f2fs_cached_block *entry =3D entries[i];
>
>                 index =3D entry->index + 1;
>
>                 if (entry->ino !=3D ino)
>                         continue;
>
>                 f2fs_truncate_cache(entry, false);
>         }
>
> Let me know if you have any concern about this.

Hi Chao,

This looks much cleaner and straightforward.

I have no further concerns on this part.

Thanks,

>
> Thanks,
>
