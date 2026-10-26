Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793047777;
	b=vw4HhAxvuvcyvQvJmyfVGupzzexEgLLdAbNY6Jcl3N92d7dncOq3HVvC712z62Mgzbe/
	 1dGvDbJQw0tYVCtrIJtBGPqJ250BVotSeUMqZ2J1Lo/2ENBNb1NUISyaWsNH1ICiKC+4p
	 EnYy3e2Vz3AHqUwTKr9lp+CGTpCrPZn0+Xr7q4Cb4CLh8EcZbvZLZ8M1PIDq6QYT/RP7w
	 Kv+p5Su8R5eD3J4h0rGUHsrcWAVRXrH+Ux8vBr3fr7cH4IYZVmzFOmeQY2ZJjPnYhMpoh
	 sx9FM/cAyUcrtrRe88Xo2i0bUp8j/R/WitwqrpXqVse+El4slSC9j/o8xktzXzexiIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
	b=KGwg+icD9Q5DC434YpUjjIy74jIZ57Xg/cSly0gsYse1Lt27TgcHc/wsEoEFRF2PRQ74
	 HjWzBWd5RtGBhkPcvfWW4r8Lt/3MKbKlKwh8YCJLUue2BpXOI2vkh0a0bHAs/TieW2Soc
	 3HJxa/eLil+dQkLyEAEhfY5nk1cecXFnF5ADsvcuKz152dXtF3tpdPVeQhTCtP64J8BpD
	 JcYKwzqrg69h31X0bF4hU1a1F64LJyw631ycuhrEeGZ5cMzpIuoGgO/gtYa9SpR0xUdls
	 jlXLWAAfSaqpXFWEhbWBNeI2J/mCo26pd4mUqvNZuJ17SjHOeWCw/X6Gs9D0T5txEUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rn4csZr7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B66D606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B66D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rn4csZr7
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eac4855401so1770657e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793047776; cv=none;
        d=google.com; s=arc-20260327;
        b=lhsfQWHF+95Qf1kMo6p6AVrTcVGRYAx9FsAgIMhP3m3yf+74/5pGRm0iObVgQrCBA2
         3TgY7U+5sEPp84MgCHthIRG/ip2WfWe9jMUZeKUBeNW83f9uj71fiQhM9qYxecNvfzFK
         u1vD4v8bwX9VcXMgBSAjMvMkWyhg2vmZvpPkB58YJBMPKSRddImW0tqYJcAKdXlCy6TF
         8Iw4uNnfsE40peMVBNraq0J3JU6avc2dhJHsPLIEV1r9ySOp79DLtlNwwa9DVT7UPP/0
         SxEV2do50RQTIIq0WqE1RU0vJKvy2MJW1882FcJWolY6tmA5XAk/5Z+BW2nDATsljlkt
         B35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
        fh=nw1wk9VEQN06JZC3dPil3mzZJLKRtD7Rr3WgmRZGPJA=;
        b=k3iQzomFgHutQsRhaD0+PGKhb1N34fA2fr3Z0dFZEBXjEDWAW+5olMu1gh5LvlHooR
         AiDjKqhpNEw4HYU8ksZ+bdeWXItJVhbGZSIhwCVsMg/8Lz8PNDTeIrm+ma1UVHiJa0On
         Ne3o0PeIB7V2Iu4MvfVvSXvQAebHGDN0xG9+sEXUFb4UdcJajlvyfkuemesRj55AliOW
         b/9s4u/lXhHBgeL2rF4enn4RMrXcqpVweE0Ian/eOiuE16NnJa0XjYztXZMixVW4b6FQ
         wVvEHcNdrdC80LUOeN0SfpmasOwGeT1+3ktXBEJHMKoH4rvXcqZm3hTSixf9c2Mpds/d
         ISbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047776; x=1793652576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
        b=rn4csZr7XGN1hsQoBURtQe++RwWbSqtDp0Z+4fdFCzyepBWydj5w0dLalFbUFI2Yh/
         XldtUXXQhGRudMeIPI8ScDq7jN3suhDKczv3FwPi3sW6Fz+cxItRFBmeATahXzELhHcc
         cRChTP6MY2hwgzxz7jVCLJ2q9Szydc5kiJrTNOgDNILGWUIvJoVSIjdZw/oRDumRFif2
         GXYCukDAWeqPrSrrJHGkRoT5bnfthlIvTLPqI5ibxj5HbTcXma/CGUCNMziIu06onWEn
         HXQi8f+uXm0awDPjEDkCz9PMj36P29tz5WE+7pqXFhnPD4/IPn0aveIaxFyCo4D+jrJN
         B7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047776; x=1793652576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEKPapKQIiWh5bUIcb5N/LuB8yx8USeXRcJ+z78vdxU=;
        b=wwHCGnTvVqo7l18uusEObKWnaxxhTyYoKDbzwGmydNE8+D5+htEHdg143oOfhsSKG0
         HhPB+Sg4gdtYN8QXYdyiPqP2UPW3yex/6Zg0NzB0VPEeS8EkR8QNQpQF/ZcXC9ClCANC
         7Eso2AZt5ApN0ffJyDcWtUOvWawEvcL6BOsekrTl3kn0qL0pdUkW2wjEgoZe1/B3DI/Y
         fIdZ/VZ5lO/UP128IhQaJ1R5TVTEjL2mjUJC+ZztK2p0AuWsmPNDZ6Qp13ZRtRKCB35I
         JGnle+Q6zIjUHmMESkpYanAmcjH3FYGooTayIi/hgAOAiMu+JoQFA6h1QULeqGvkGBAK
         2TDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ0wWSdnYPrtizg+OGuoBiAoQysb7+++swCQwzRXWDyCyJLpcdilsb5Db1sVFgTmXOEeBh/tnq6t/rrDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG6AgD/Y2szJMQoAnCjuZgc+J+Ge9FSEQ936fkToZM4X8JM3NK
	XSxPtFQkeUsXtGpPMxWYsiQBs/clybWE641k2Q0Xk8kVpTr2D6s/kY0qrdB39QqUKkH3H1YfR25
	URfJcL3z21Brbd2W6cw+qMTLAmkcowB0=
X-Gm-Gg: AYBFou1iSdE8Bpb+d07SRshaLtOoJeLDG0MiAkbwQjJCTPhawChm7cQNYv3xDArJlFK
	3JGgQN7Bgv3Ue8E2M9E3BtszPPHSvGq6kXDLh7CF/6aFAR4K6vi8+eaXT38wSDcdTWQ9/G174A7
	ZkaAmmfblW3nv4X0gq2Y2DysGOYtJ52jDFH2Tl3GB2R/cvrCxhAv3ZUEHm1wxR35gEEHLflOmm9
	kai4+yh95DrH0cbvu3hEOwopSOpLijsWTkw/+i65H5KBshhtS1aaCCIupgvNKwu+pqnBtPq9rJd
	TFPw7pUTOC/iq/oM10buXOq8v5DMmyrH1rb6ot/dChXpVyZkzv7O86ZaDt1P1KXCaYh/12YDTc1
	Sj2dc28vMGylbd6nGf+qEDolNjpxHuyt8ZBJd8oyvkPYGoaon5E6gi+2K2vzmw8fJ9qvZ5nQ0n9
	pf1xUjrS5O1HXhjzJiCPIZWizQENBN38bv1JnXRYZXZo4a3wSPTQmVFdNEuBkC2ZHVzUrFHynTo
	fgEyXJ+joA3zS7lV7A9jhJu8CZgR5eFjUIe3tJC+bCurI0hBzs=
X-Received: by 2002:a67:e114:0:b0:7be:37d8:1567 with SMTP id
 ada2fe7eead31-7ce5ccdca48mr2010224137.10.1793047776347; Mon, 26 Oct 2026
 13:49:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <at4bw-G8czG-G7Wl@ashevche-desk.local> <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local> <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local> <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
 <2026102631-stove-preview-b534@gregkh> <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
 <2026102657-tubby-tragedy-5f1b@gregkh>
In-Reply-To: <2026102657-tubby-tragedy-5f1b@gregkh>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 14:49:24 -0600
X-Gm-Features: AclHuK9UNYlzFhcHxdKzFFVeehL7ZLxndmHwf2zdIRC7OGdlKpLpZQpwjo4GLVA
Message-ID: <CADvTj4oFBznFO9ZxL_8wZtcPaweSSt-a_brVkmQKzqJsBX2P5w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:40=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 26, 2026 at 02:24:58PM -0600, James Hilliard wrote:
> > On Mon, Oct 26, 2026 at 2:17=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Oct 26, 2026 at 01:59:06PM -0600, James Hilliard wrote:
> > > > On Mon, Oct 26, 2026 at 1:53=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > > > > > On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrot=
e:
> > > > > > > > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard =
wrote:
> > > > >
> > > > > ...
> > > > >
> > > > > > > > > Some people might want to test the stuff. And sending too=
 often you actually
> > > > > > > > > will get the opposite results, people will be tired to ev=
en start reviewing
> > > > > > > > > and/or testing your code as it's changed way too quickly.
> > > > > > > >
> > > > > > > > My thought process was that people wouldn't want to be test=
ing code that
> > > > > > > > had known bugs flagged in Sashiko reviews.
> > > > > > >
> > > > > > > Sashiko reviews are not visible in my or any other mailbox. T=
o see them I have
> > > > > > > to go to some URL and so on, meaning to waste time to see why=
 on the earth the
> > > > > > > new version has been sent.
> > > > > >
> > > > > > Maybe the Sashiko reviews are getting caught in spam filtering =
or something?
> > > > > > They are showing up for me and on the mailing list[0] so I'm a =
bit confused why
> > > > > > you aren't seeing them. You shouldn't have to go to the web int=
erface[1] to look
> > > > > > up the reviews.
> > > > > >
> > > > > > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.or=
g/
> > > > > >
> > > > > > [1] https://sashiko.dev/
> > > > > >
> > > > > > > It's better before addressing Sashiko comments,
> > > > > > > reply to all people involved and to Sashiko's original email,=
 so it will be
> > > > > > > visible in the previous version why you issued (actually abou=
t to issue) the
> > > > > > > next version.
> > > > > >
> > > > > > Hmm, maybe it makes sense to enable recipients in the reply_to =
config[2]?
> > > > >
> > > > > It's up to the list owners / subsystem maintainers.
> > > > >
> > > > > > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/project=
s/linux/mailing_lists.toml#L290
> > > > > >
> > > > > > > And before even issuing it, wait for a while, people might
> > > > > > > disagree with Sashiko judgement or your replies on how to add=
ress that.
> > > > > >
> > > > > > I was assuming everyone was seeing the Sashiko reviews getting =
posted to
> > > > > > the mailing list already. The are ending up in lore so unless s=
omeone isn't
> > > > > > subscribed to the list I'm not sure why they wouldn't be seeing=
 those reviews
> > > > > > already.
> > > > >
> > > > > I assume you already answered your Q. mailing list in this sense =
doesn't mean
> > > > > recipients. I think it simply goes to the mailing list without fo=
rwarding.
> > > >
> > > > Do we want those reviews going to recipients as well as the mailing=
 list?
> > >
> > > For serial patches, we decided to only have it go to the submitter an=
d
> > > the list.
> >
> > When it goes to the list is it supposed to go to list subscribers as
> > well or only to lore?
>
> All list subscribers as well, I've watched your interactions just fine
> :)

Andy, are you subscribed to the linux-serial list?

I'm wondering if some mail is getting dropped, in this particular thread I =
never
actually received the review from Maciej W. Rozycki <macro@orcam.me.uk> at
all and had to manually import the email from lore. I think that's the
only review
email that I saw go missing myself.

That one getting dropped seems especially strange since it had a
direct reply to me.

>
> thanks,
>
> greg k-h
