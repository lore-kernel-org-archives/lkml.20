Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907084AA3F2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595325; cv=pass; b=Pzi+4kIrpWjS4+TpKLMo2Zd5H1e4t0pDshYAC8Ppq5789LIURR5VOZjvKxPCXo/bO5XNjrAmGY+6j1bB6ZQztlHE2jaFiYpKRaMShWRFDDeos8EoJmVmO8rrYQfzp+v+h91JIYKN7mHIxX0n/lQ4u+iZ4CwJFoKNOLCU8U6a6uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595325; c=relaxed/simple;
	bh=DhRO3jiEisFREUCpoPPDrLxkhHUHJj9Nmc4vEnpDsDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fpx7nx2g2JlG6iDu4/4EROdXr8Nh20wPueP4ddeh6+AI/XohbV/neCfIvrBJ4EBJ1b5/V1qWS54hzu7SnKMUe71GMaMDCDPOldobAsmotZoK72GAFQCfS7Nw6OIaWE/SmkJH6Xfrjfg0+wfIiYV+Gkt4hp74+wIHvW0s4q1xuME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VI7xR6X2; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VI7xR6X2"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so406884766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790595322; cv=none;
        d=google.com; s=arc-20260327;
        b=XCcz/suKsnZSo5ZsqiAdN5ldbt8owfXy1YIdkl1+jVFlwEEuJspKtQ8KRHjDvtOugu
         b2m/fQeOhQJ7/lwWBBIs2YEdqsT/JhOBdvLXHkUOJdNoCll9+MPnfubK/QV58kYwT+Tx
         M7YasE7pI2+hLFyZCRjumQK/64iWmmfcOtRmSlEykEDpcnYF97/2JrT2C6soYUYUYt9x
         n608HCUDOCjIJhdghH5Zwl0332EurEhE6V7DpdQass1X3u6pxkPpXpQxZFI1BsuNlULf
         lYcEwErdjaA1sYQBSi2bW1yNFZW53KVdAns7u8XdH1dvXO4OcJy78lLtUG+Defexhtzv
         leMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xKQihEndGsBnwilqhNl/3eRhz/IoC8GE9Y3qmXrQaP8=;
        fh=kxD7ASBNpzG1mKSgAkv5cQEvPuEmoxz+aT6mETaK95U=;
        b=F2RrvrdI/FE8t+ViD0m/dj7z2cNQ3qdj0X1unsYPnqKi+yFijL2p0IbvPoAXM9afL/
         ET2MA7ICqHl52NgaexI/G3UGpV1pRDS0aday4igvqt5wbThb4x51BbgTXLuD8MNh0AFl
         PwLIWPzIfRE3haZPtze6hfiDpe3M416JPYPFLlewxAh5Aii1EXK/2HfgDXT70Nco4Rbi
         yTsXCn05+jvTLdlzTvKgzrITb1q5Rjz2kDZYv2cn0uAH3cBHvZlBMuNk/1+uOc5ibPgX
         xYbwtJX+Jm8iLTmKUmatvb42apbtxgNu5Zv0e6qDTXrqstF9IW9ckX7RGOMkYiCbwXOV
         Nm3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790595322; x=1791200122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKQihEndGsBnwilqhNl/3eRhz/IoC8GE9Y3qmXrQaP8=;
        b=VI7xR6X2DwCvODgEVD3vRWLRCgBk9mAjeUa63XQNKK063KrtS8BeEcFiGjETCT5mdX
         gZEXEE+i5mZYDUeudEb85euZSZtJzXlOsMgiZ8UQYKNoqL0CBHAFeUPSR4BhJqX0Cwb5
         YsoRSg/OIofy4mmx9l+XWK4IGLsB39Ope3AcbKiDy0KipZ5z2OtM6ikdQV12O6jAuch/
         GJcwCGkUiC3P2z+uUwdxZxpbCejYO5gwZlyx1Bvd5IsYwvk06r7Z2P242cNIBRQMfICn
         dfe0X9JSYxGoDY8Fdf/rr/2VK/OSq5hpND9go3UNVXjd115mSVxnDlMwUAWVCENtRXW5
         ecSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595322; x=1791200122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKQihEndGsBnwilqhNl/3eRhz/IoC8GE9Y3qmXrQaP8=;
        b=H9AJBWD3FX85oddjmcjX+JJM95n1ZNJPoKpruNbGKeqm7yqQcqYWTuFhK14DcMlPNS
         oNjE13btQu1XWd3GHgd/biShky1LmdJiXNXytKrdDWclNxrwqrhYeDZKrYQHAySKLzwA
         hgVijC9QYMneWGem+oouLdoWDUwNRUsbaQb22jzjUJV6D8YYqpguo/A74BmbYbkIPGCk
         svc7L+XqjqW9eGYkMDr71nlwJgp1I0fNrF5xBfZ2khsib3gB4QwSw13yOudeGIPLYUYV
         qBGTzAVP/LjwbbU5BsNpHkg7p+tEKimgpjWkNtTAv0Lp3RW7T+U0EVVe5/oSfpLgIBzO
         H3+w==
X-Forwarded-Encrypted: i=1; AKwUvByS/+uDyR/9sO7sb7PpYLVQMkL0ashW50VlkcBWN8U+Yxrlf53qXsmuVwzWaRO+x3gGnlONto0aFp7loSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuKBCsO6C4xs/0lgenNW2WL5hr7ss6QyWgHC4J9892JSIKyE5V
	hnamHTCQzAF5Sg/ccb0jsWp7DrVKM/PZTd++Xdm5ETrY3vKO5whLACv5oeeGl4WXngL4l8JYwHf
	Q2snlrk5HKNXioB4vf7dQYwC7hMtSTN8=
X-Gm-Gg: AYBFou2FkXQfSmClbva0fcNYY/lvdPCVmkkPIsFlcDKNtS9WbqSd1ZejCujPAI6S0Bw
	rUMeuR+9bw3KyEI6zSxGFCc35m04ZtFP0xvrDM+AKLnzlKnAfnZ3Ktz1f7tz31iQPoRPKbBSoEI
	cNv9izsVqeIZF9mF0XqKou/eQ0UDODE7G0+RvXz/Y/9bAqDxYbL0jH5D7br8Lnl28zulqFa+StX
	E2zi073bwsaoYb6RLZbQDPygAOAcKxatHdf4ZW2unNXn7M9wmbvyz6UClMmQJ3hqhdIG4A8XbZx
	XszGbZyqcZtjO1sI8573d4wvdRKODLkp++GcyV/LBOyzMmNlpCzrwK+qTPhd+ZM1F0rZvkxwXG+
	qhZ/GKL2Amm2nP6BFHU1Me9hqPmhd70biuC/cUnRX/bJAQvJkjFaXfvztLZxf0mRpuWHrV3dD7J
	VVCplFhIsKfQtjB6SuGJ+2tGtxA4sQfKAMZiVJpUvB
X-Received: by 2002:a17:906:dc8a:b0:c25:2e93:289e with SMTP id
 a640c23a62f3a-c2ac233f3e8mr999649066b.16.1790595321284; Mon, 28 Sep 2026
 04:35:21 -0700 (PDT)
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
In-Reply-To: <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 14:34:44 +0300
X-Gm-Features: AclHuK8L4MxeaZZDRTg8AatUimH9WZuruRjftd0tMiE0swMuhwk9WFLPmKj4EeM
Message-ID: <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
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

On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> <mika.westerberg@linux.intel.com> said:
> > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrot=
e:

...

> >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >> > >
> >> > > These are interesting drivers, not sure where to put them
> >> >
> >> > IMHO they should be there too. We are maintaining them both.
> >>
> >> Do you send PRs to Bart or you just rely on him to take the patches?
> >
> > I don't expect these two drives to get too much attention, and they cou=
ld
> > be contained nicely inside intel folder and that would help Bart to
> > identify that these are Intel drivers. So your bandwidth would not suff=
er
> > even if these two are added there. Your call.
>
> I'd like to avoid a situation where we have Andy's Intel drivers under
> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd pref=
er
> to move all of intel GPIO drivers into drivers/gpio/intel/ and have Andy
> gather changes to them if he agrees.

Okay, we have two parts missing:
- Nova Lake driver (I would need Adam or Mika to step in as at least a
designated reviewer for that)
- USB IO (I think we need to agree which tree it will go through, my
bet that media tree is the best), for that we need Hans' consent

The rest is done in the mini-series I sent earlier (last week).

--=20
With Best Regards,
Andy Shevchenko
