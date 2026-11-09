Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794265833;
	b=hbJILihLDloHVxxknsGv6ogDOLVXlPamOlrdR0dhJRxLc8YmrTTgJ818wtMQdtaCwmVF
	 URBVIOI0KiencmfS3hctjafXv8BK38Yul4mLO+AtsIprm7FF9ARi/hWDBQ4Mk+lww5KO1
	 DR4/0uOBluW0t3dJj3bxL7J8ss6JlRUC2zm/iIJxWjm+CvsgyqsmFiJt5e8+uLRQ4HHOV
	 KzSzEe9s/5RHbArD/RjKk4amNztDhoUs7JCsDYr4iJP0VqsY114Cabfx3+u2AyKbNmRc1
	 iRihFliNowSW6l/h5Y07eAnJpl3QCRE/AM4jWOZCxoCi9gpaMRn8HmQL5jAzG86QvMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CeN01vbNZQ47eEh9Avoe0zLX5olmSueBg1N4z40LWa8=;
	b=nOpxAD/v+71EyYZCOtrrr9kdIxLDrkaXp7s8Hbb1GMmk5HKbmMOc7+tvyuJ2osuwYYJA
	 w+CZ882w+IcHm8TQmk5a3Y40yv+4rrTXPfwS7jWiJ56K3EJJpOj4FocOzahCQWSb7BboW
	 oiXkuYAY1i4eE5D8Wt5QwvImDxWBhMWyjS+sKqir/poZqutvKX+WfPvl+8wP7IUthd7km
	 cI/C4iGxVewPimYAKLovqd2d8sKorCl+DX2luDW+cLTzHrFbgN6+eG9soxHhuDWTAK2w6
	 gg1SoXNettbZCqm7IWjWhSFV7ou/lyl5Yq15fwataYdnZKqRVSqMP/vR5mwv6bC3Epw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyvQ6R4u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC57606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyvQ6R4u
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36fb88ea38cso1738821eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:10:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794265832; cv=none;
        d=google.com; s=arc-20260327;
        b=dVR8c55c+JTQBbDQdurf7rLNClvcVG03PYpWS9qiA8Qj6euIzYuN1eStREQAr8qiLi
         qXk2DoSP4c9gtJO4I4tDSwjB+A1vcB6f+pm6HliJVPuEEtAqYW2G5k6U24myc0N/bw5y
         WrHhoRMzH1xUM+Fi7LgG33dJoYkcE+dqD1A9QPc2a2CU5KfoZ1FyqR+w6EM0ypO1eROk
         JZUtZklfqAfo1RUm9+OrJutOSlct4YnJS45YCv+TR2A4GZlVOj2aDRz83BEuGu7SM/H6
         +SSgbiAjjTt1uZMhNp3y+B0SBOVWggGA0kDpizpBMUYlWSDBeRZLggYQZsqHKveTLkzd
         gP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CeN01vbNZQ47eEh9Avoe0zLX5olmSueBg1N4z40LWa8=;
        fh=ibGZiIT3X9YyVnGEKK3ZpB8y3g86vPDy5Jx2bytFZ78=;
        b=SahCvRQRmiry6TgAkLuFk/lUBnc61+Qrb7c5y0ZR9Uotwf5fXpNraib35jDlMQF6Kr
         EG6004gZ+1ITCm8NLPAs8DklK2hvOvbewQ0SocT4jytfKMxzJ/C0i2ygiILHjxWMGptU
         ELGadP48+BcGyp/0JwEzCmKCieWJKCy+uh+rkWLM3z7sXxRhu5rRUFBHxAp0yR76y3m/
         crOFLAjwk+/f1aPs9hkcIpzjBIipPeHJ6RHmy5TzyNBb2EjMX3raJFmB5LVbj1c82Wto
         v3WmucP47NlZXB8KaYPDyOH9vdgtgjyU6Y26YRFIEa7PEv3p/PLa3t87YSfF+8c+P2F9
         xFIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794265832; x=1794870632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeN01vbNZQ47eEh9Avoe0zLX5olmSueBg1N4z40LWa8=;
        b=EyvQ6R4uuyXmviqq7ZVFqZIFzQlkiXqW9tfrgKAUWTUMgV7dMQBh1mEEhVmD4UEPb5
         Goo3/UnI9VUq5+7khqIGuT1ZRYmY6BlIQIp8HLMByVsQWd2cjM9jNCx67yvWhHBixbz7
         DNmzzau0JrGagxIBLKv7MHt92YwMo4fDKtmFeIHo3uJfMpv2FOWMg0pp4TxD40unWdsN
         KxZ6drl1lU+A/h20VoRB4e1EHzmFJ24GJ8LxHoR+2Vi9vpCzTjJH4tPZ4xgkAhZ8IxiB
         3jIbuH9mLBZRUVGxc10Yh40mt/eyFd9ZmXOZorIJfhdL6+ye+vUgiwCcWbouK0AYYo11
         NhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794265832; x=1794870632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeN01vbNZQ47eEh9Avoe0zLX5olmSueBg1N4z40LWa8=;
        b=JFimEbPUcsY1NvYmxQVqftrNjaSUAut0Jy93lok0aH/Ixoh+oCeM1WuOlJRG3hZQyv
         dz+aJHl2VON8qnlqeLp1DfpoxG5ojJUheFjN3vwcx5iz7AEG/2wXAJerl+gOlPo7TiRR
         pqZxyWDiqVicJApm0zeXkARZK27bZT7EmiNZxaC+ekVGKEywlzqohvMRZ6R91A+k9jx2
         LA7XIsfhfiEwpvp1pvut5u0/X+iFdwYJssULQQxp9Q/OS0Y+FMkLXz9m9xTmOeV0VPoe
         mVKXCIPRsUTLiVsG81MhVZyj8PSnsIP361Vbwiiurfx8zX4DqCeZGpqQT7daAuaxJJac
         mLNw==
X-Forwarded-Encrypted: i=1; AL+hErHTLID9SEU3fTZ0thYJszPXh2rMxyJQHp8yD6xp0axZ+T3O2ShmLTs5RBEUb84h8lQc8DskouVUUGP9P9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SjvGRTyXnQPVaC23OZtGsXmFIAUWPEpbmEDX8luwxhV63wli3
	MsF8f4iSCAjPkXW6+jtFKl9z1nZne1eMi9lurev41zrDR80MfhioIimE2RxXjE9WbTiQwCbuAmW
	cAYdIw/gBJC2ti0cBRQYDOgrvljBCLPI=
X-Gm-Gg: AYBFou39qgkOamZupnFi3hCELPHwks7W7QeQmn60s8zRn1gZIznuXseklYObiTo8N1d
	iDE54bXWkUjNgt+KHe3SKd/23zhrAJnUF6DBhoqhzowOzW+SPyn0qF+ICG9aqZANMVhCJM/74v9
	TIhwRNXK+aPDh3tAmqDoFHeIdu6Rbcs6C+g53Z2oa2KsJDwPRBO0F5Umq/ncHaqIuRdGWdieJfc
	J8Z54aVcGCelBksdty53kITkd1zTxZZDO3pCBfxD7bG7XD012h5xqQkt5qo4BGJxjRzjmaqL53N
	VTrTjF01HG5LiKM0vG+Y3gSc0zNEjKikETO1QzWJdCjQOC8ymfVt2wAMQqHtGhn+QPajnHxxpUp
	qVYX6HvoKb0WpjLzajyVbwpiBkYdjCllqO0Fo
X-Received: by 2002:a05:7022:3a0b:b0:14a:a6dc:9cbf with SMTP id
 a92af1059eb24-1b3b603b42cmr1305082c88.4.1794265831769; Mon, 09 Nov 2026
 15:10:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925205226.883724-1-ciro.pedrini@gmail.com> <asR-FLwLfpyT8uOz@archlinux>
In-Reply-To: <asR-FLwLfpyT8uOz@archlinux>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Mon, 9 Nov 2026 20:10:19 -0300
X-Gm-Features: AclHuK8TyNRcPp0b9z7lECemH9V0gwfILnthmI4geEHwNdHTffkXe_9drxx8YF0
Message-ID: <CAPKD0HdhnN6apu1jJpXEG1mAV1=GCA-rjBdt=xQsVX4KknW8mQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN board 8A17 thermal profile support
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Krishna, sorry for my late response.

Unfortunately, I can't right now. I fixed a power usage issue on it
(the performance mode wasn't really using the expected and reported
wattage, perhaps you encountered the same thing?) and it died a few
weeks later.

Guess it was used to running on low energy and decided "enough is enough".

It's at a repair shop now, so if it comes back to life in a few weeks
and you still need the dump, I'll gladly send it over.

El mar, 6 oct 2026 a la(s) 1:52=E2=80=AFa.m., Krishna Chomal
(krishna.chomal108@gmail.com) escribi=C3=B3:
>
> On Fri, Sep 25, 2026 at 05:52:26PM -0300, Ciro Pedrini wrote:
> >The HP OMEN 17-ck1xxx (board 8A17) isn't in omen_thermal_profile_boards,
> >so hp-wmi uses the generic thermal profile query. The firmware only
> >stores that value and never acts on it, so the EC stays in its default
> >mode and the CPU is held at 45 W whatever profile is selected.
> >
> >The board uses the OMEN interface (mode byte at EC 0x95, thermal policy
> >v1) and also needs the timed profile quirk: without it, the EC drops
> >back to the default mode about two minutes after each profile change.
> >
> >Add 8A17 to omen_thermal_profile_boards and
> >omen_timed_thermal_profile_boards.
> >
> >With this, all three profiles work and sustained package power under
> >load goes from 45 W to 56-79 W.
>
> Hi Ciro Pedrini,
>
> I was working a patch[1] involving omen_timed_thermal_profile_boards[]
> and needed some diagostic info. Would you mind attaching the acpidump
> for your board 8A17?
>
> Thanks!
>
> [1]: https://lore.kernel.org/platform-driver-x86/asPy5Q5wNYaMzTqJ@archlin=
ux/#m922ff6cf9a68285d2b0f64e578fd6d2d6fa573f4
>
> >Cc: stable@vger.kernel.org
> >Assisted-by: Claude:claude-opus-5-5
> >Signed-off-by: Ciro Pedrini <ciro.pedrini@gmail.com>
> >---
> >
> >Notes:
> >    Tested on 7.2.7, whose OMEN profile code matches for-next. Without t=
he
> >    timed quirk, EC 0x63 counts down from about 120 after each profile
> >    write, and at zero the EC resets 0x95 to 0x30.
> >
> >    8A13, 8A14, 8A16 and 8A18 appear in the same DSDT. 8A18 is in the OM=
EN
> >    list but not the timed one, so it may have the same two-minute
> >    fallback. I can't test it.
> >
> >    I used an AI assistant (Claude) for the ACPI analysis and to draft t=
his
> >    message. I tested the change on my machine and reviewed everything.
> >
> > drivers/platform/x86/hp/hp-wmi.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> >index 7ab81ce5f..76f489d5d 100644
> >--- a/drivers/platform/x86/hp/hp-wmi.c
> >+++ b/drivers/platform/x86/hp/hp-wmi.c
> >@@ -207,7 +207,7 @@ static const char * const omen_thermal_profile_board=
s[] =3D {
> >       "886B", "886C", "88C8", "88CB", "88D1", "88D2", "88F4", "88F5", "=
88F6",
> >       "88F7", "88FD", "88FE", "88FF",
> >       "8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "=
89EB",
> >-      "8A15", "8A18", "8A42", "8A43",
> >+      "8A15", "8A17", "8A18", "8A42", "8A43",
> >       "8BAD",
> >       "8E41",
> > };
> >@@ -226,7 +226,7 @@ static const char * const omen_thermal_profile_force=
_v0_boards[] =3D {
> >  * "balanced" when reaching zero.
> >  */
> > static const char * const omen_timed_thermal_profile_boards[] =3D {
> >-      "8A15", "8A42",
> >+      "8A15", "8A17", "8A42",
> >       "8BAD",
> > };
> >
> >
> >base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
> >--
> >2.55.0
> >
