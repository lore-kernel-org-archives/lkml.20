Received: from mail-ej2-f21.google.com (mail-ej2-f21.google.com [74.125.228.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B0946D569
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.149
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583154; cv=pass; b=PJ5E6wMY+tcPu5v/B/N1PQOZ8Rqq9Ki6F0ETf/ngzixNQRMZf9226cOPAensRrEeWn8mg9gDBcjONnTw4D5DHg7HySK9+9qLpotsnRLS1W91xHmrA0J4kFNIh/6sGkW5OEoT+ZWF0hEFPEn3eoODxYyn0GTRdcZwMnrKpfzeIcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583154; c=relaxed/simple;
	bh=z5il5iLEAXne22CvI2hr1JfqhTjdsIamCjtdwPqG6TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CM/p2puk/gKyI0TFY3M79kzbCuK3niVHnTDL22aW/rw5xuL03ROmi5e8iHXFpHkkhwS7fi9Fpo9odcXOUtXJFc6ZFBMNet+wfVZioRsuE8nI7jCKOZBun4v3IG96DH4zr8dqAu0aC2SQCOLtpF4D0I1JKRokUZUa7aBLOq4eWG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFJUGb2e; arc=pass smtp.client-ip=74.125.228.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFJUGb2e"
Received: by mail-ej2-f21.google.com with SMTP id a640c23a62f3a-c2a1f611461so171674966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790583151; cv=none;
        d=google.com; s=arc-20260327;
        b=HLY5SQ+yXC1+U7HRnc1KnMOiYimjZlFrnfxVjBukfLKPbg9sUvutENDomJvQUq5Z4f
         DyczfYrGzUkA85mAWD/7ZDGN1kHkKaGM2sqf1dv96tm20eZYOSPxCF2/QIGFdD+26k8B
         dLrqpTcZDivpvYMi1Tv2J4GjpyEXU4sw3/bkXMaulA3en5/6DRQxIyi/88TbCT5bpblT
         o8ltCmJA3STaWOKwF2LsB7RwTcP2a2K2kKDvppRqXf+sydPEGWZZIkg0bNngJpv08TGN
         PNXu6LxnooRXLrfTALW9ewJ7f0iHOjPwzZhayS9AA7paMOtrPiF3KJgxytAGP2qQiDK1
         iVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z5il5iLEAXne22CvI2hr1JfqhTjdsIamCjtdwPqG6TQ=;
        fh=q4nXlHVatqbLDwYKCBHUkCAoDSgYODeDUEws6JMAlIk=;
        b=W0anUg4fF+mQ2mJ2tXcuq47UBrVo1ZMUUCPv4NrmRYoHXPg91GAp1H9X9PH+uLgCra
         GE67NPNMPaeKLsRuAu7pgFO59huJXhmgv6NLajh3XaEfvTQ0B1NzxWEKvmD+7aJChTFo
         pMWfMV64o/oXZYmboxSoFBZS2UmFit3yMnpE43vOySyRxFyhGHm4Mqd80AbFVzfVMgvl
         7o/PlolR233YwMP0r8Opnq2mxa5ygk8vqvqshhEVIe5TX8emOUwGCBLMLqFCOjWuB+hI
         fPSfx4hGJ0lurNEAeNRFALlN6h9v2EdrjAKadHNPahQVpLM52aWBY/5dGuSxPS0hkcKN
         nReQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790583151; x=1791187951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z5il5iLEAXne22CvI2hr1JfqhTjdsIamCjtdwPqG6TQ=;
        b=TFJUGb2eTFWXjZWpTjlcr54KoNdzb0ctqe8Oh7fuka/MB2hrrqRyrcHnFdZu7E086w
         Y2uQ6Lr2WnM9ksqKpVdDP1xYi8nnncRsOU2Qi8BDaZWGHk4SLRKD25AbfSPV8nqiEEtt
         LMUDJMem56F2Hw+lPTs91C+hCMAeTw1mUDRqvjW/PXX30EW5It3hH4DYtPyK8lC20Fro
         w7sY7tQBbjlrLuBeMRRlMrlQxPNzCcZXDIKIElm6d/nn+BYBBRufI5DmjLOEkdLTeQb/
         m6TU2DB1lW4NSA/IYkkAz99NZE2jV1ebpSMKZySuJk4h1vvGLQtYd11y6Gp7+f9XFJLX
         zzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583151; x=1791187951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5il5iLEAXne22CvI2hr1JfqhTjdsIamCjtdwPqG6TQ=;
        b=2Ibu+Fu6nDZxbbt3YRoBaV9gvXShW6b6LqEXqUC76bMpN7SdcHMqK1hiZbShpA5agO
         eU63ri5CqEkKIlVMjauF6PO8Zib1uguH0+h2bYLPll0IVeF7LDovoD1pAdBOOWlV+VCq
         zrgBKKUGVEBRMWDjwv1d5D30nGZSZRioBgqvx1hiiMuVt7ocNkJplUPf0yz8TpijdLOc
         5NyYzamflc7dkKUUObMpj5V9iNSEyTelZjot3C7hBO34St8zHcse4+O9+RiNmQoFKWR7
         UlbTS2IuOzBpXqct/jbJdtPuHS77GK2fc7zlNParGlo75NsEQt95MR3npcRfAgb9472v
         OufA==
X-Forwarded-Encrypted: i=1; AKwUvBwBG2wFo408JnAHsSoF7BUi0TP4iNYtH+tIcbMpdoWqCVRI+CxrCO5elKSxF4ewaj650Bwz92BmV956OuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ+rvH7RhcLjsBRR3UrxS6qxayUgpEKNvucAlDax90+7+fZn7k
	3OdCx8ORERpI98XqjJI+MkPINqfYZpV72MOseIGXov1/YAYduvDWG81cEcHBnllicZdBr+c7cZK
	m/LPgZMGkG143aI0Pdfn3KarMNjx9GP4=
X-Gm-Gg: AYBFou2kZqlhsSOsCgdInNgtp9O8U+GCkZa6tWjZx3RjFewtd9zAWVNwI1lhTss0A4H
	DSbo8iMBweW5sG/X+4cr8k0KuwNzClvYRcV0y8Z8FRW7PY7jpLyYsnQ9UpNi+bPfjUa3BAN77Mo
	Bpmfn11IX0D7qr7BN0tCpQnkGUb0M0yoxLOZ23TiI1NqnRSL3sNohjnEIJxtn1tkJSyhqw6Zee4
	7tV8N/ex85II/9waGgv3UoHc3VLW4y+/ivkerr+5I8KElmV4/hbX/ZJ5BpRuSGT4f4LW9G9clBm
	t0cGF+SsESZZQqiNjKoGeDtA39w0pQEUlyBkdCH1t+wPnlOrbgudirHI4TunxJVLeMnGJUHl94n
	y2twEuhLlSsCxPb5dcCY4/E9f85n25xfsfCx9FulULDTxjDlBKHeVpnHs+ZtR4CiockyzETHKhD
	ACmG8StXtrB6ILjWOv34GzTyD57/4oEzBDKgAQbr/C66ayW+4zCPM=
X-Received: by 2002:a17:907:9445:b0:c15:a7b9:2ae1 with SMTP id
 a640c23a62f3a-c2ac2240116mr1123056066b.6.1790583150489; Mon, 28 Sep 2026
 01:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926205708.384308-1-meatuni001@gmail.com>
In-Reply-To: <20260926205708.384308-1-meatuni001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 11:11:53 +0300
X-Gm-Features: AclHuK9D8qRVgBG-QEUy3UMVCseEKQ9HNcOf9R8MNobcvmS6Q91d5O4vq8jd4pU
Message-ID: <CAHp75Vdj8qVY-hCoCxxd1Pg2JaaDjc+QgAK-G=w+Cb=FTYYJEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: add ESCAPE_BACKSLASH flag to string_escape_mem()
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 11:57=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> ESCAPE_SPECIAL escapes '\\', '\a', '\e' and '"' as one group. A caller
> that wants '\\' escaped but needs '"' left untouched, because it has
> its own handling for quotes or because quoting is not meaningful in
> its output, currently has no way to pull just the backslash case out
> of that set.
>
> Add ESCAPE_BACKSLASH, which escapes only '\\'. It can be combined with
> ESCAPE_SPACE, or used on its own, without pulling in ESCAPE_SPECIAL's
> quote and control-character handling.

But why? I believe it can be done in the current implementation using
the last argument @only (id est use the list of the characters you
want to escape).

> This only adds a new opt-in flag; no existing caller changes
> behavior.

No test cases --> automatically NAK.

...

Also you missed printk() update and respective documentation.

--=20
With Best Regards,
Andy Shevchenko
