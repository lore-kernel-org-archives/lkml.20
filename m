Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BD143D4E9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601180; cv=pass; b=Hfo/hRhYLXqfuKCgWpCSEIMUMQ/vxCug8reeWG0xeG4ZC/0EQ5mNRhwvFF9p1KeO+BZJ6RDHOArQarQVQ4Btv0rnbJy8hokuP8LJ/lR+SDvELEhz0S5Ghn8DJDM2cvBGi3FISljunMH+G2kjmu7t1ahb52dd6L1BtlwypQV0pSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601180; c=relaxed/simple;
	bh=TY+ThFmrQAsZNlvu7YOZWhJoc8nJAE/C5wpQs0phEYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9q7A+2+fY1CcuuevcPxJN7d7wrOFy224Z7uTKQnouoaIqxiHaGLAYs/0OrfP8KO6arbO95khMk/Y+iv3us8jfuvTl+sqQTzmnvJHusgU8A13U1QuYyjSG7MmhaYVR5ssE1XStANpeOIGR9dFX+3yzf9M1uf8r/dj6GA9h4Z4dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFoKVZb5; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFoKVZb5"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af3a4f193so310324666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601176; cv=none;
        d=google.com; s=arc-20260327;
        b=ADfxpcFnNNyaO6h2wOzkLovfjLP7dbMNqHkIhSaCH7R+LISkmERuW67HZAzbTMnsAn
         fbxwHalq50VAwpqW5M4TvAlXczLQOYUiyk99juNgRyPBZ1od9ultH5IkuqPUiSRMj5SW
         Nwgyp/3ZRPJKajvbcNb6Zgg8JjJRzGpLiZtWqI3oc8ZLnQEfs3njaWVOzAJt9QF6QY0X
         5W3dnjd/sH6BGSrIWAijF5HuFfESZW87OmtKjy/6iYPs6lxqUxOrCliuZY0wLqShKsvy
         xlfXwKYUwhsxYqQUJ8Q2o1MTqd3g4xw251xG9OwcPhxo7sXmD1g7mCQ1dKumAWWec7+u
         xrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rDASPrdfaubIXsRWgoMkCtVEaCp5Ede6IMXhIica92c=;
        fh=OjMilyAmevBN6yoid4fBASNgDgPUvLphuqwk4Mik/+w=;
        b=odhZja1pFTR9jKa7ApdOApgAtSCTiLtwAj4edwkt/Q+HXq+dXvdBN8i6WoNflkTx7G
         cIaRfYIVEOF5V4iY+3ZRyLnKBQmWsR+W6u0MMZ3g8P8rlakeffXlgHKAxW47W8lbKrQd
         KLlYoOO0o+lmvgMd8zj9wWOwHxiOL3W6z/SKYPC6mG5wlWD6vLb93yc2H/CVo6dbckdd
         Do7HBG76jwzJx0Hxg/rXYiXpXzJXDpk6XRy7Oq/BTpl57fiIitTlH72nG9eTIF5/e7sq
         8BjyIrhEx3uykfZE9w4sQuQD6iiZKobLP0XY1TmZG2/+Op/zy5MBId3RUqEdP91+tyi+
         YnEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601176; x=1791205976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rDASPrdfaubIXsRWgoMkCtVEaCp5Ede6IMXhIica92c=;
        b=bFoKVZb5SiEakBwou8iSQuv1E8tDT42VM7+9rP81L1PPziZA4AuB1JBN3qt7aNoyQF
         tgBqOtaMJ8b1kk7OZDMvIfKD4PmdTk1Lr7mgDwrWagUTd7Ztjq4SRqYSpFu6xDhvlEtD
         RN7ORZ0If7DdEKX3+JtyeoIiINCJavCiU8iAezEXsSHJ41eopMeyKrRXcvHoz75HBlUJ
         RqDE74+p0BozDbiGitggooqD1NVku7znnNUN2pHmNrbX3xz6e1N4xz1JORMa6MNtAp4P
         f4gS247HQMjLISiACIyJGkU8SUqcgi0jDwMia8dknjuaB4IyAAt2CSrjKtCC+QDKN0VP
         hIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601176; x=1791205976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDASPrdfaubIXsRWgoMkCtVEaCp5Ede6IMXhIica92c=;
        b=WllcYDsvya6EK0SQ5p6LuJcSCnDDGkAMOCZsab5RLre4LZlDSsmGFftz8RyvyoQQFU
         9Zu/jGvGAgI+XBxnfk46nn0b07Tb8spiUFV1NgZhUbRh4KnSCoQP+XlAhAJu3+JQRtAa
         f7ejUQmToc0O9bZOKqxzRlkAOHkDbm0c4DS6jGga17Nt0Icb+hr+8Zu3lRqcCeQtlvcp
         6/lpsWjt68erB4Ym9iJY1YR2uobif4SaYRAHsMxyoZi2y5QaPR/APtYRy0sL9woUZEXe
         59eA4OLMRTU2yRwQ9GSsPETyGevRVX1y68WnUs5qyZ4MH4YtRwTQqlGYZKKTlUu40U2g
         3xag==
X-Forwarded-Encrypted: i=1; AKwUvBzXXtd78yCgUCM4u/uO+YQYGYJib84LNmoA/OrB1WNArOUEXy4iAia5Coy/2ZZCjB/3u/TyC5iJBXFFaWg=@vger.kernel.org
X-Gm-Message-State: AFuF++ljSdZmkaF+JfvqsWufFF0arxcuQahqW3J7KffhpvqytYu2Pm5+
	siSa6au/rZVvC5OmpGeTE9tTEz8E+W4hJ7yHog+NhhkSMEnVIVW358ABGleqU6wM3YApD8PgIX+
	8KzpBNHh13cpTEK8Q+ygFwXiGMBl3Pdw=
X-Gm-Gg: AYBFou2eQmcqpHkZ2e+Ig/ufh7dumfTxjCYLc+HrmrMpJGyH0NhcEW7AyqH9ShxlK1C
	K7j4dSurwiCwve17NrTXvsZOSVCrei9OytM6VUi3MMy7ji/1Hlxwpf9TNn8XN4Iu88VOKuhLaXi
	8IN0xVekjshD9huy62AZ0ZWlD42avhk/HCqPWGGdyCtydBiFDsH41ElBQCdgGjFapx52L0dqA8L
	BfX+CTajDJ9oksDSqItAy/VfZJ2JlyxMwqnObZ5gsINQWlqWrHm++MUii7uTAmYJWkdKgTw6GmD
	nSkRxpIYR2XWB2xZzndTT0eRg75gnwPuqvRJYMiWpewagNUVJj7CnU8daKlnKA8VbuDPhaVH5UE
	LLpSMiYz89RRIjOh66OFakt8OhbOn+jiyWXwjGb9emIdd+q3jcGZz34Q5cr/lDN0B+xIUIyn6uY
	FXCVaG2lJ8GMeebDg1E9c+Ci+QbgkeR1dkAIjcPx3S
X-Received: by 2002:a17:907:1909:b0:c25:2c70:50ed with SMTP id
 a640c23a62f3a-c2ac241d7ebmr1055032066b.5.1790601176429; Mon, 28 Sep 2026
 06:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com> <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com>
In-Reply-To: <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 16:12:18 +0300
X-Gm-Features: AclHuK9kaWFJSBjdPxIHqf-E6ip7w6ANRaAz8QcchZ0uEi2iA2EKPRa6rY_CF9Q
Message-ID: <CAHp75VdGwVf2pCXzmQoY5zvgSf0KsRH8hU9Qt45iZmEG0KMzCA@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:25=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Mon, 28 Sep 2026 13:34:44 +0200, Andy Shevchenko
> <andy.shevchenko@gmail.com> said:
> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> >> <mika.westerberg@linux.intel.com> said:
> >> > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> >> >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> >> >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> >> >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski w=
rote:

...

> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >> >> > >
> >> >> > > These are interesting drivers, not sure where to put them
> >> >> >
> >> >> > IMHO they should be there too. We are maintaining them both.
> >> >>
> >> >> Do you send PRs to Bart or you just rely on him to take the patches=
?
> >> >
> >> > I don't expect these two drives to get too much attention, and they =
could
> >> > be contained nicely inside intel folder and that would help Bart to
> >> > identify that these are Intel drivers. So your bandwidth would not s=
uffer
> >> > even if these two are added there. Your call.
> >>
> >> I'd like to avoid a situation where we have Andy's Intel drivers under
> >> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd p=
refer
> >> to move all of intel GPIO drivers into drivers/gpio/intel/ and have An=
dy
> >> gather changes to them if he agrees.
> >
> > Okay, we have two parts missing:
> > - Nova Lake driver (I would need Adam or Mika to step in as at least a
> > designated reviewer for that)
>
> Acked.
>
> > - USB IO (I think we need to agree which tree it will go through, my
> > bet that media tree is the best), for that we need Hans' consent
>
> So far the initial commit was picked up by Greg and the other two were
> signed-off by me with Acks from intel people.
>
> I'd do the same thing as for nova lake: Israel, Hans and Sakari as review=
ers
> and you queue the changes?

I'm fine with this route as well. Since Hans replied, this all depends
on Sakari's answer.

--=20
With Best Regards,
Andy Shevchenko
