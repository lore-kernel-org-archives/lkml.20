Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25FD45628F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760215; cv=pass; b=LTU6LK39Oe1+7u0+8TYO5zUxT2AKOVAp40N4kgrwjkt6nvX6se92014/NZXVpsdP5D6W1gM4BPuE++beRY8t+EeQARUgah/iNKxbgkgXkyF9amX+0nJrboRoePYmcIqg0kRa6dNPHLFicGb2H5U8PN22OtUDIq0OQoTMnkBIxlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760215; c=relaxed/simple;
	bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCF23WfjpHszLXQd8CHuRlxHKKwcvI0kIZzUHmI17iy81u0/2HfNbhuXwDkLAgPTIxKxaUo/cVdTrp5GM35qh8o56lbQGM1BCup/yM8oODDdVqWlzCKmqRu5yBeIehnBm5qyINqL+SgzNIU4yI1m1/NEh7uOBKP9fJ33G7Cant0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBO6Xvx7; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBO6Xvx7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a20367cf82so7859871fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787760199; cv=none;
        d=google.com; s=arc-20260327;
        b=BhzdES8bSKVzaC6bBz65gBA/fsrjewD67y4j346dphrnlQqM1DEqyQuR4ht568LJ/r
         MLfLR3yQXfeFlLma/NQNJQwUEcy/5GIzcHkxCJBy5vkyRYPMbxrgiwsA+V68w/Tt1H7h
         bmvGJAWz7etK0fj8pScSPLN5BUCuRpPg+ZFffy3nFVyTTe92+8NvcVWQfVCLFHALeMpa
         J3vrCxI571Yy8lvaRcP3xOGMPFqzNdIsZ3xtw7WcUv0yBR3whDxShRe2fBWkZ9ZytgG0
         i2BSvnM7WOwDYLE7dHH8ByPbBifpVn0xSOkJElPTOV3c204k0fOljOgaWihpMK/Q/aXO
         rYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
        fh=A80QFE1nuudmq8C/8FK6HlLCLiawH3j2ZPmj3aCbNzI=;
        b=qrKV+YMtdtgp+LIxF/8F7JN4MSi/5F46jPeuYf3wtHATQHMG5S3FOhu7iHenw8Sy3r
         8gIs/t2sOQNMF5NQpyMlS2ADLRNmJ2hJLoMX3FnPPl2gNtjJq+42qcpmzK1iSdoUDPBu
         mr1lMkpoqoZS7WLb9G6L0klRlpStPW/mcrogROB36TXfriNAkR8XHPNm3J0X35abg7a2
         VGd+QMvKs1yftOEeLAIHpObuB0cW5Zg4EgojQpJglObwQkW8yl9x+U7BtaUPpO58ueTV
         uDfkeyMUs9CZaJPiYQpkklwZnsztzb39Njpz1MtQyzzI9zwmZs7CtLfC6xBsCAhQvnXe
         fl9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760199; x=1788364999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
        b=jBO6Xvx7RsJ6daoO9ux7RccUIWoR274y4P/QKLXA7yiKYnKY6a5vMzT7T7Z4GlCdUB
         Y+2x+OxPA2nkkG37yq6L9IBtIPhMjnZ0AJk2eAQ+27gquitNYDmEX5wE2/YdFFC9jIkZ
         uP2Wf/xQNax2ey+J08fZQMBWw0xxIRUTn+GO5K2yTjsLl7jQVJYeY3DyFZWlEugxVWvs
         2RJBLr2IgHL9kJNLxgZDWBWl6HCfFKqztNwxN/hzQhXNaphXExhSaNt0m27e3h9bimPs
         YyA8UaaGF02pbD0Kn30QD7wfbeaN2xHoQe5LBJ7RvEPv2kNjUtR+55lVB6BAcgJtg9ZA
         oJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760199; x=1788364999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
        b=rinPl5LECHplWAOtlmA/KkHIPDg1TxwNP6w1Aiq9lpqzEx2PWyF4QqjYzN73F75iHO
         iOhc4TKiw57nLTxS4sHYUpGGQB70fNJ/xNL6uwn0GVqsFzY6k0v69mmZWoAiSQsu+2aa
         XD4KOp9z+h1NXhG1t/Y/7xxHvhAeiK5SDmlBUb6EbR0ExRtAjVc4NZtM9zSJXIlDypP2
         /PBu7Flai6Jfwx9u1+qAGw0uQY8sAsWtUnSDF53UtyMMx0+QplWmxNOaSNrMexuW558k
         FA1ognxbkF+WIMrWp30rCq9kBLGKwUBkBiFPA6s+SZLOIlWi5bZOdA5wBd8PGxwcA096
         Cwow==
X-Forwarded-Encrypted: i=1; AHgh+RqwPpoKnYiCSYiwdnorTX0rSrWE1qWZiK2dkmLSOwgYNrwFClE8WVxdzb/QHkDfcexc/yxKOqguuhakTsc=@vger.kernel.org
X-Gm-Message-State: AFuF++khSVWpA/Bafz8A7TltIa3QjoU1+yaVVg1TBrHjHxUB5XS9iyee
	JAZxqh8lhhVIW4Ocg0HyLxQHycMBdx6M6CDeHZDKp9LdFUAEyiYnMJVdawPsMPg/oGd2J0Sv+Hv
	Rh8dGDWUZ2qgdX4XQZgBzSSmYx1A9E/A=
X-Gm-Gg: AR+sD12heHDXtLwGl2bXGRxRSyCLIIvgZycytTATFoNzOdnVH/bJX6dqN+WjAHP2tnf
	tNDJ83ZQU+q56j87diDrb6wY4IPX2W6iYejjZCcDMnmqqFTCsi8Hy0zK1Gz5CwSp7TA9qcZJ4fQ
	SIrgFl1CJJR5SFI1N4HC1x64MIkGcfSYa8qayYX2a4SjWMpsrE4Zt3YuoMNQsDAdockNZDKhHJJ
	lwcYkLkR8jGAvgcQyB/8411rK4WisPN0SzaDi40Gbm2z/jMNmjY4pYoAFye9ZwLCYymVVCLDuKO
	fZduFqZJoGS51pmZMnWIk9Kc3bjryMhA6CUw8fItE8O0NnySDM6jAuDYA1WDc5F4HMGikpYQrMh
	e
X-Received: by 2002:a05:651c:a10d:20b0:3a1:476:74b3 with SMTP id
 38308e7fff4ca-3a1fd6605afmr15291371fa.9.1787760198919; Wed, 26 Aug 2026
 09:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info> <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com> <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <ao1ovvdPAy6n_F7I@eggarch> <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>
 <ao7aLXk9q_v_jEyX@eggarch> <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>
In-Reply-To: <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Wed, 26 Aug 2026 18:03:06 +0200
X-Gm-Features: AcwNN1VMj1i9qHLHYCgFf_wI4NJMgmrhr4t1IuAyWuVvRr1oKaUch4AAYMJyJrg
Message-ID: <CAPyJwA8CNeUnh2kzYktF8OR2T2QnVNN9EUnrUci7_419bF4QDw@mail.gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, linux-usb@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Mathieu, would it be possible to test different values for
> USB_SS_PORT_U0_WAKE_TIME in hub.c? Especially 120ms is interesting.

I reverted to the stock version of hub.c, and changed the
USB_SS_PORT_U0_WAKE_TIME to 120.
-> No crash for 1 hour, but I will test this deeper this evening.

Where I am a bit puzzled is that Mario Limoncello from AMD just confirmed
that this was a platform issue, only affecting StormPeak, for which AMD alr=
eady
has a fix.... Or maybe there are more than one issue here?

On Wed, Aug 26, 2026 at 3:40=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 8/26/26 15:35, Lovekesh Solanki wrote:
> > On Tue, Aug 25, 2026 at 11:43:22PM +0200, Mathieu Fluhr wrote:
> >> The patch you sent makes the issue go away. I am now running the exact=
 same
> >> scenario for 2 hours, without any crash.
> > That's good, thanks for confirming.
> >
> >> However, I am not sure if this can qualify for a proper fix, since I
> >> do not have any
> >> external hub connected to my motherboard: All my USB devices are direc=
tly
> >> plugged into root hubs (and at the moment, there is only a keyboard an=
d a
> >> mouse).
> > Yeah that's the point it only skips the 200ms hold for root hubs. The
> > external hubs still get their fair hold since a parent exists for them.
> > So external hubs are completely unaffected by this patch.
> >
> > On 'proper fix', I think it is, even if we keep this bug seperate for a
> > moment, it makes sense to not give root hubs hold they don't need.
> >
> > I'd love to hear more thoughts on the patch.
> >
>
> Roothub needs some time to settle as well, but 200ms might be excessive.
>
> xHC can triggers wake (PME) when a connected USB3 device starts signallin=
g wake,
> but port registers changes are not always visible to driver before link t=
raining
> between roothub and device is successful.
>
> My educated guess is that 120ms should always be enough for the roothub.
> This is also the lecagy msleep() still apparently left in xhci resume
> to detect port changes in xhci runtime resume if there are USB3 devices.
> That msleep was supposed to be removed now that we got the hub changes.
>
> This 120ms can probably be further tuned for roothub in some cases,
> especially if resume is due to userspace action instead of xHC wake signa=
l (PME).
>
> Mathieu, would it be possible to test different values for
> USB_SS_PORT_U0_WAKE_TIME in hub.c? Especially 120ms is interesting.
>
> See when system no longer crashes
>
> Thanks
> Mathias
>
