Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9983822BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584419; cv=pass; b=IZpb//0N5Sb73D3qptx2FFm/AsT/b/G9X4W2AC1UxIqFSAKbwy2udP+/QqXuDP3TzYG1TWY1+idFZbDZVMiw8eQxLKWa2bBD3yFm8UD/kc1CX1kuleUp3bawF9wsx1agxo45okmB1loNfRWe+PR95u9Qe/ZE1C4xYBNwwEhHW9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584419; c=relaxed/simple;
	bh=PgwmGuw1zNCeYJ4qMywnr2UJb9ioZir99Vs8zzDOKz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmk3muwstJ4sQVPU0zEpq01IdmMKNHirBdB8JBbAQXk+XNwowDC+uqu6/+keAYRnSFT4Sjza+bS6vcMr/RRIpaJbXNOCc3gKiSdWhD7c1P80XLqsvZIMfIw0aRWlSGfd3fMzP+2T5585uIbsfkU1q2TXUxf3IjcDn+CZ7ZJ0ZOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwzPeGL3; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwzPeGL3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so334614a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791584416; cv=none;
        d=google.com; s=arc-20260327;
        b=hw5jnqZw0mQfkVMxiGzsxnDKcJ4swgmFet2Yo4m2K8BO+9vC6IstKd0KR1nDyMTdmo
         X9LyTEi5+T3JZ+BI951K/n0fR5gMfMz6Z+EYiax9+HSQWY7S2T4ppVhPwTn3/RtRves2
         yow38CmarBE1ioH3i8LONEQUQG78Cu/sKKEWJSbws4li0IAkMlPKYy3r58e63ioxY89Z
         n5tCT51SMxAMpODxbv+9wk1OXUzdDokP+qtSCEdIbqyjRCvNkHjWirwf0Nkedq+6uYoq
         FZwKgt/9l1aH/PKIumZaMR+ldFzLTyBu0ABf5++2uonwoWzmu/I56MAP8hSgCx24aLnt
         rYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+GW4IS6o1LJAcPN9SYF127puFlWBP/gNfh8ql8XeLT0=;
        fh=7OYbNP5/mZ7JX9CoapYQZr+Zh8sZmBgKKcbet1YeNc8=;
        b=sCePhYhIBKM4Wf+zLPufAqJbXR1wgJ3BarvX+vznLxjWMDY8oRdm40A0nSHYrPupK6
         mf7DZ6FoL9vuUyaHASj5x6gsCLNGo0HCkSKElAODFiEFja0y27aCYR3raTtTN0M4kYSU
         VDg+pRiCCaqu/H15eK4KMbDa4fb/aPJfj58egD3kLXvO3MasVbuKSi5gziE5FHSuJFAD
         d8P3yD8nMY1mJE2n5+tmeqU2WMsoChHyAutgeI9+4q3Nbmluyjnj0WMlHYA2EihiSAuv
         vwEi/wPNaL2TYu005F6BStHbmoTJP1R3itte8eUycjMc24cvPs0+O17vuloLUH/WFGJX
         Pi5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791584416; x=1792189216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GW4IS6o1LJAcPN9SYF127puFlWBP/gNfh8ql8XeLT0=;
        b=iwzPeGL3dz6wPlwAXU2ZCiPac9s6uXZZGfuPFZAD7zQ5PKrXb3uPmX8kFgNwz3zFL2
         w+qSYyT0bi0Jy6lcnJSM9TCMa0Y7EQKygEx+K5PF9TIHcy+mTQ3Vdb5D+2d1KMWWUmje
         tsSjk/+InLgALaF6LVeAi0rOTjuSii58R7CPslgkH0n2aVTAY9YdtJJ0DWoECsF/X+aL
         yGgb0yx/X/orLHNexXregO3BzvHfobIeMRRk8/W32e4pEZolz6RQ8/KiZF5Wm3j8Qx7t
         1Rjqu+/ApPgMyyQTjZfkVcnWzk/JmQEZUOX30pikj14ihc9p4Imjc6FmmQU7zsTBLdoJ
         T8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584416; x=1792189216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GW4IS6o1LJAcPN9SYF127puFlWBP/gNfh8ql8XeLT0=;
        b=vK9LBVFxmxYwWE3fNLeUa+ahW6gypQHeOA9we3PQ8LBV+4Syg0nOhbuKK/r5HCs2O9
         Yw7nETuzxbmwyruw4pkNLPxsnaPvSnh712Q3AfHFodgxyDI+f4mkK7kUZi03zbblKq3m
         OcThNJBcksZHvY5qMGtO9Ds7AcuWSAnrcYzmps3astRT9DoZwN0zJCE5nL+H67hW01jL
         /SyD0OI8y5+eeZnB0lXXh/CqZ5hSEZmYIRcFHkB7A3YhX/KfIBuRk+okS0ezwz9oQ11H
         bg7QZ0GP7ff3MW4xemAMTNSVIbKXvH67BhdurF5nkkoAA9+LWq/w1wY6K1Bm2X9A7OOd
         kKnw==
X-Forwarded-Encrypted: i=1; AKwUvByKaI7sbRWIdgnb+8lqlIk70bCTgEYTYluqaLpvEf8kjYzbazDZ/Cc9gubj2DF+euBgCT5n3HPFeovnvN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW013GR/nYb+kE+Hq/L2x/gePzrosgqCcluupdCyhyr9788YK+
	MxOEz8aAHxIlH0x0JKAXnn7mal6k5cfbOLQfJrJEE09dC0kNCudOKu8clE7n8F61jnOWfT+9w1B
	TGbsxZwRuUpBLapy8RZJ+BnVYIwzJ+ds=
X-Gm-Gg: AYBFou2qdeag+8VdrQI58Spp1HMtUiMYT8xV0DiF3iOeV76M4MhzyVUNYWmjSpw9+WD
	AdOCHPu5HptXZMQLZL3D6U1c5i003sk+WJ5vorf6QQxkGs6Vhojg2licHq3QFqSEwvfeLpkC/bs
	lpviXVZMCtsssuvasHtbB/9L/U1M1xhev8MOdmVpFLIYhmxWjfW0EcUx/vPqjpJoKJ86p16EBRd
	/dTgkoInygfg94OUURGI5cjnMHb6NPoZVz64lG2kCDk6i6Grw1HKo1yEywryKxLUVAVPZ3wFyd4
	GhlTJayxsXa4PXTBDJxzHb+EPDHle5h1oJGU0ElxnZnQsg8Dp/PXZdZrPFX2BbekrO4kUKweJlX
	TSmSDlryNbaKsCG9sIu3hA/sm+zYESNoJ7rrJ5B17o+ibKnuPkdTX6SbzrBF4rOtdDtcg7tpeEf
	UblqFxC3kVbd8nCvJYCA40B30u4NJSqetGY7ITZOrHIT7ka7bhXidwlNxI1ZhJF5HV0Q==
X-Received: by 2002:a05:6402:4005:b0:6aa:f02c:dd96 with SMTP id
 4fb4d7f45d1cf-6b17c25d31fmr2914886a12.11.1791584416248; Fri, 09 Oct 2026
 15:20:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004233523.516891-1-rosenp@gmail.com> <ashiQ98Qmie63mB2@studio.local>
 <CAKxU2N8WtY+=dhSTfyu=8ujEwnkcfV9PEkXxuTLHthwksDhTxw@mail.gmail.com> <2051AAAB-4FC9-4093-825A-ADFEE5438EB7@fygo.io>
In-Reply-To: <2051AAAB-4FC9-4093-825A-ADFEE5438EB7@fygo.io>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 9 Oct 2026 15:20:04 -0700
X-Gm-Features: AclHuK91qLOuh_bhI7HYZ-oxSWH1gL9kepMuJvhWwdn_2yB_YhubWH2ATVmFMIY
Message-ID: <CAKxU2N_nub+OcvZ_ROBMMHpkH=up+OJzmahW-9J5xN29nFRCHQ@mail.gmail.com>
Subject: Re: [PATCH] bcache: fix kernel-doc warning on CLOSURE_CALLBACK
To: Coly Li <colyli@fygo.io>
Cc: linux-bcache@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:54=E2=80=AFPM Coly Li <colyli@fygo.io> wrote:
>
> > 2026=E5=B9=B410=E6=9C=889=E6=97=A5 12:09=EF=BC=8CRosen Penev <rosenp@gm=
ail.com> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Oct 8, 2026 at 8:41=E2=80=AFPM Coly Li <colyli@fygo.io> wrote:
> >>
> >> Hi Rosen,
> >>
> >> On Sun, Oct 04, 2026 at 04:35:23PM +0800, Rosen Penev wrote:
> >>> bch_data_insert() is defined through the CLOSURE_CALLBACK() macro, wh=
ich
> >>> kernel-doc cannot see through, so the kernel-doc comment above it
> >>> produces:
> >>>
> >>>  request.c:308 function parameter 'bch_data_insert' not described in =
'CLOSURE_CALLBACK'
> >>>  request.c:308 expecting prototype for bch_data_insert(). Prototype w=
as for CLOSURE_CALLBACK() instead
> >>>
> >>> Turn it into a regular block comment, and drop the @cl line along
> >>> with the kernel-doc markup.
> >>>
> >>> Assisted-by: LLM
> >>
> >> The patch is fine to me. Can you provide the detailed LLM name here?
> > It was Opencode's Big Pickle IIRC. Current documentation says to just s=
ay LLM.
>
> Documentation file coding-assistants.rst suggests,
>
>  43 Attribution
>  44 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  45
>  46 When AI tools contribute to kernel development, proper attribution
>  47 helps track the evolving role of AI in the development process.
>  48 Contributions should include an Assisted-by tag in the following form=
at::
>  49
>  50   Assisted-by: LLM [TOOL1] [TOOL2]
>  51
>  52 * ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
>  53   (e.g., coccinelle, sparse, smatch, clang-tidy)
>  54
>  55 Basic development tools (git, gcc, make, editors) should not be liste=
d.
>  56
>  57 Example::
>  58
>  59   Assisted-by: LLM coccinelle sparse
>
> Yes,  only listing LLM is the bottom line, and list the detailed model na=
me is better.
>
> If you don=E2=80=99t want to post v2 patch, you can give me a line of Ass=
isted-by: , I can replace it in the patch.
Assisted-by: Opencode:Big-Pickle
>
> Thanks.
>
> Coly Li
>
>
> >>
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>
> >> Thanks.
> >>
> >> Coly Li
> >>
> >>> ---
> >>> drivers/md/bcache/request.c | 3 +--
> >>> 1 file changed, 1 insertion(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.=
c
> >>> index 3fa3b13a410f..e7f097346d64 100644
> >>> --- a/drivers/md/bcache/request.c
> >>> +++ b/drivers/md/bcache/request.c
> >>> @@ -285,9 +285,8 @@ static CLOSURE_CALLBACK(bch_data_insert_start)
> >>>      }
> >>> }
> >>>
> >>> -/**
> >>> +/*
> >>>  * bch_data_insert - stick some data in the cache
> >>> - * @cl: closure pointer.
> >>>  *
> >>>  * This is the starting point for any data to end up in a cache devic=
e; it could
> >>>  * be from a normal write, or a writeback write, or a write to a flas=
h only
> >>> --
> >>> 2.56.0
