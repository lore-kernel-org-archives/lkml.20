Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876399;
	b=2AzgzfCIEz8GlMiqocNPCOXEQaHtjICiKs4Ny3cSEmBuvkt51069BZC8lLKNNaXMh0eK
	 wRZw7JysMwbt3l2ZLAvZEgMYcqh6+4lwZh8gsdwh3vAKrveuvmAH5mzS1YGyaUbeHx7Gb
	 FbygHns1MysovvLLpfCety7cPwTGdfCPN5fKI3P2VKN9JJz3CAGeDBtQAATi8egxykUND
	 lSQmq2WBfzrLaDAiJE7yh9gJ6skb+n1Gs1E8o0vVnv4JkqzLMZkriNDnOZ74EuyQrwcO4
	 TiisNu1ZJf26HRtOpJajIGouSHcBRJFMLiP/5/SEuZ3YfAXx/UhDwByRJ1mb2xr2NCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
	b=HrohxnjHgsiEArksabzBaF5PkHWqyMi42GscXPIhOb97oTHXBt73Nk81ZwbRxBeOBP1u
	 +Dgp2RnyzPPg1Ff5ZaAX0roeCZhZTCvOVQInmI92X4CGgo9mbJpJ/ZhL35hFOux7nV6Gg
	 0u9Q3hZ5klTwcGRIhnXJUc6SUic88m2MrST3cK1SGhK4nk/cT5x1nDdsiPL0RN5u5j3j1
	 LL1+/1hRwuQnW2pdgL1eFtc2Kl7EAKAx0SBwDbh+e13tBQ1yawOd/qXpHQA9UfEcfbnTt
	 0YDnh1o2PzMfWiaAZUcwr9+F+hY3iYeBklasCPCylZraeT147QsWiBDpcL70MmD8oNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQr0kFNb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC18606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC18606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQr0kFNb
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c445c95d553so247751466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793876398; cv=none;
        d=google.com; s=arc-20260327;
        b=NSQgxwQt7g3jNxMhy3/h+rH1zPfAHhTAiUR3kuITaU4m4fCwlYnecuTh2nfz++kv21
         3QquN6Pk96EauLXrqIrEOqVUBZ87CwOHCB4xFxkgEm2qY2Cc2+jWqRpv85rNz7jUgeVW
         XHx3bMKKANfSA4WFNjXBvRmWny5h1e8JdbxuATAwjbicmg9cE7WGa2f1N0SF9vrqzoIi
         zsSjPUiZ8CmZhnhjTr8AdR6Spp0WB0gqnnp6R5Kf4D0bXRJjQQ1i8GSFFK4pP395yL7f
         Vu0zZk8W1RTXP7/RC3Mkjr5LiHWMkEwqktnfmOdiEt43TTdMVmxMNvHWGs1b7FchpyG2
         GczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
        fh=dCS5zO1OTzyRRqGLtPphBBLuJBfgOcyZb2ti7kVkCdE=;
        b=XbvPN7cDiH9efotZmsoU/HK2ANpVOZlyJk38QXHB2DkSfI/V3Xb5UYkvLrWNVWAuTM
         TCi8tZdJj+TDwgWA9K+lc50a7TrF4UGJASQ1rrThNr/9MyyTy1j7cg1D6S0awlCVy6ad
         pkBHrVa9qS0x5xmn/O4X9m13fWNo7yDzRQ/9TN+c/pi7HCviPjCRwrDQldQ8TSDLwl+E
         sgkz93WoD7To2ZH0SX6NytST2tB5SrUd0QXMhF+VnvzkqfK2Pyex0X80SuTDnSQ0YJBF
         0f/VD11o4x8FKe0pyzJXQo+XaKsSLcp04WfaNAh11gypc93YLIUd/51/+UaQR25aY9/w
         HM+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876398; x=1794481198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
        b=uQr0kFNbU7xYaLOjvT3vxuSmVKE8PdIQlZfkWLManzx8N26orhPmHjSAwxX/RGFuXx
         PLddFBAfJJtxwn/5Jx7nf+SEnmJvmX5oDdYxcR7Pw9u7d5VsUIKpKA3hdUyj0u85HiPf
         /8aBxloPuYO/4udYDkv7QNRPzML8LadtVqffp0cdBWZmMvIpXshDmWi4ZGa0tKzwni/Q
         RCxquIRd4O4SnzD5VxMO2Yp5BO9x4c2GeY83iU8uB2ImfrL9nO5897fueIPLsqewGwrx
         /plSTVyIw8rv6gd5/7a20W8AnQHIBUHo1DUjtAUdCqR7U9T5S0IJ/5mCfO967Y30eNPr
         C/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876398; x=1794481198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
        b=jvO7BLb1RcCpmDWOgBXxjup65RHEqBVUJgkc3Y4xfS5z/jkIJWKlyvbD7ICrvOKUi0
         tKRVJZvO7fJrWMjaGEWUX0j3a11jbeIAwMtjJBZGTC8gq+AMxdBCulv3SRZL4vt+2p6T
         hnGwYC3qbA222H91vGlN7dG5/PaW/5+Yt5UFrYkZmIczNGe/ZXywYvK0XpcjeYihteju
         MtAEax+EusBnAkp1pteldSaQ/n48hPZ1iKIKVTBn+AT3WZg5/qrTiqJvKvAIAySZWitl
         5DXYE9BGcxngwmMYpuqdeYUtmdApHHeQ1ECa4eAk1pxpHTA1KKXUFEBgNbadhbBSN87b
         twqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPr4kKEJfxIvUUrlrZZmq2/9ApTyFHQi/2jLEiDGg6Qm0aWskKhUz/0pmANzWzuLELK2kmwfVkhFtA09A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UNrO3PLQZvWir7ZKWsNiCMeiSETWFWrdynWzGkWeMGJoJpB1r
	YyeTnbJhXTZEDkRw3A645x+AU6QYcDXB8BKER2fERdqrYYc9Bw3lgq+gynUv1Y4uUQoP++Ucr85
	3SndnMTD5RO03c7MeueO8877aBZEyPi0=
X-Gm-Gg: AYBFou2FXYifKxL/7BKyVWcHkFoKxTP8jMIHjzgmqgdel9zRs/ZQD3sHts8rUTJOHTh
	FjqlsqlFvnmk+oL9PbVk2YuBQS/CFEvxZujeKJcZkqy0lpm4Z1ydLCtZiMP/TuCrNWgu5SK0T2+
	nUFtx8vsrmA1MoBfg7v/j4jD9IRkYddtAkQ7Qwf0GERhAhRcyfbzWrZwXUvQkpIALghKWM9WtmX
	re0JlQKnbY/A6DOBxPYmk3csYSXJEspaEUiRfamK+jq1ziYpxOIlpbsUenRxH+kTg4UUNKpROGK
	ABJrBA/aG8578BVKJREEoGi4pAaKjrMbMv3buq2S/eWFXr4ChRlSVk4nWuo18b5tLXSX25+nion
	8VP4ightB2ubO+CcLSThyKOKTOQWV5+ZgZPPD6istJVIe/ei7oIqTn90lwIu9WB7FNvlMHxGh8k
	OuGEdGfShFA66fKvzTImK7raVGXi0MINS6nqN1/3BwKl5+gAsE9HMKEdkjB/N2ioMm+0+X/+Irz
	dgOTqqmos4xzZ7pnDraKcgXEnpbUDuBj2rFFEJ8QtbYifMKQMSCKtSEMSipBnLOfTuF7vDSuSJz
	pZ0hG+8=
X-Received: by 2002:a17:907:3f95:b0:c46:8b87:c1f4 with SMTP id
 a640c23a62f3a-c4ca7a86e98mr1520903266b.20.1793876397539; Thu, 05 Nov 2026
 02:59:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-iio-light-gp2ap002-v4-0-fa1cbaad2ce5@rudorff.com>
 <20261104-iio-light-gp2ap002-v4-2-fa1cbaad2ce5@rudorff.com>
 <autr3DH6UZLY_ys4@ashevche-desk.local> <ed75d869-c51a-457e-9cb3-6250029d4ec7@rudorff.com>
In-Reply-To: <ed75d869-c51a-457e-9cb3-6250029d4ec7@rudorff.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 12:59:21 +0200
X-Gm-Features: AclHuK8zK_VKtp7fvak-P7kamZod1UIl3e5bgYtsqibH1ihAtEl2wIiK2lVgYCA
Message-ID: <CAHp75Vd_Rr6pFsTwpkwBcA9Sn74Npj37zSau4APMad3UE0U5QA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] iio: light: gp2ap002: add led power supply
To: "chr[]" <chris@rudorff.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 12:56=E2=80=AFPM chr[] <chris@rudorff.com> wrote:
> Am 04.11.26 um 18:31 schrieb Andy Shevchenko:

...

> > Missing '---' cutter line which makes this patch invalid and it may not=
 be
> > applied (your SoB should be a tag and it should be last in the chain; y=
ou may
> > conduct an experiment, take the message ID of this email, run on a clea=
n Linux
> > kernel Git repository something like `b4 am -s $MSG_ID; git am ...` fol=
lowed by
> > `git log`, you will see the issue).
>
> Sorry. I ran checkpatch.pl and b4 check and they missed my mess ...

It's not handled by tools, it's for now just common sense.

...

> >>      int num_chan;
> >>      const char *compat;
> >>      u8 val;
> >> -    int ret;
> >> +    int ret, vdd_volt;
> >
> > Don't mix semantically different variables on the same line.
> > Try to keep reversed xmas tree order.
>
> So like this:
>         ...
>         const char *compat;
>         int vdd_volt;
>         u8 val;
>         int ret;

Yes.

...

> >>      if (ret) {
> >> -            dev_err(dev, "failed to sett VDD voltage\n");
> >> +            dev_err(dev, "failed to set VDD voltage\n");
> >>              return ret;
> >
> > Unrelated change.
>
> Yes, but I'd still like to fix it. Ok, if I mention it in the changelog?
> Or shall I drop this?

If you are eager to do it, do it in a separate patch.

--=20
With Best Regards,
Andy Shevchenko
