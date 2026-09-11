Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4CE3D5640
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129993; cv=pass; b=rVOHs57tgtXQVYZJwaxAZaRfzeXZ79vX9HretDiXkEPMEoBRE8HAgHS4fNTRgnFMplYfzm0ExIL0tPJw8PIGEWrYClKsOuoZDjHIZZL4axn8ZuDvpeJ6pInGKdq9gwECLSWSRS4Y4Hoet97Frn4xbxKpIaIDSE6snB+lYdkz2W0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129993; c=relaxed/simple;
	bh=03tI8r4SjmrucNW3FxoNW8oLP/SeEOOAqBM5N79UCug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbUjurmBAPq9RuF6m/2+vQCDm6z7jwOiGT/Xy5RGZzX659VmX+HPYpME97jt/SN0E6AqlA+O41xKsFtrBw27CF36N8VfG4dg48jdDht4X/YXCRo+pt3/VIVJNsaI0eohNC4aYQ2rHx6M+SYD56R7HPnr/6k6In3HM4+eL6/oq4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOTfdwmq; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOTfdwmq"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-467f09c00c2so259166fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789129990; cv=none;
        d=google.com; s=arc-20260327;
        b=UwWoNhf6uUQfwaRF1A1lp6wKeKH/vrrP4K0a3nBBrDlk3r6tvaVw8wbsGS2gQmru7e
         2uQsSWsS4K1YRHapoS9xM9QqWAUApvG3W8d/hPe/MfKrf53qQndERET5xdl0g5Kgw1z/
         QhBDH2vXhBJAN6I/CE00JHPxboM43fJejbaaG/0K/cNCp2CRR12rEbHMAOdTJaxz+ZBz
         KmdqPFQ61K9ddcd1a6DMv0CtU4v6ju6zNaDdyoGtZNz6er98H1UBfOgkZFl1im8kopAP
         y4uZUf9jey85sqLmAaJv1vAkAU5uv7lGxPRfuAXX7E4rm9PVB+hwejfqrND0PMxlxh1h
         uQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSeczAilR4RJwTk/ZWwyqudf5JxWuEGG8/sw7pvO2zA=;
        fh=4shIC0Cor4KDqDPjOMxxWXtgvSjwnQY3Gwa2eu3bLr0=;
        b=EG9dsDXwtbqApKDUsyrpp1WkTwmMpm16xBZDRrp/N/YsCEf6+tb/gK9jJp5QNlmki2
         NNwgPBesk/WjiMXHtQx59XUsE9fPmbdhIIszpySWzsYQ8IcZKaZd4N0Kp/HAr5NCI41Y
         XURl5seSaUJd095GMO0BhFu70+WMNRdYjH0sJ24G0cChkokTs1QmdAWeNTfki2t4IEqP
         4JmzP/gQtrk8fhnzpzek077HfbAWEQe4IsXXW8uOhdAskTcCbgYAlpS+ffL1+jSADaBO
         v+7S7a9xWhWTGSeevPIqbt3PiaZ+orWKyKNdOXSes1RZZtnF6lRsygV1jtAI4j5h55aQ
         993w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789129990; x=1789734790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSeczAilR4RJwTk/ZWwyqudf5JxWuEGG8/sw7pvO2zA=;
        b=BOTfdwmqJF6f6zbJcWrGKiD0VJxo2Ea+him7H1v/HOhEewN7VSSMxlfH1LMLr3vTgY
         hhvVSgiJrhzb5v4hdaWgn7BxQ7lVYRCgfr/81oVtl67senvOkVpmt034qQ7amPvmKvF+
         q1BUkpx7n/0iGdQKQ8VtyBkmer/uI6zpLLABSknI2e0JnMjQQ7rHO2ghffUJ46D30cjA
         /576vb2Pm7y/tj2Yq8/03UgEnYsidxSvVN3PBmte9fnnEsq+btC2EhJLw3gou784cT60
         LDPiwenUXgZ6tRgdhxllp8qn++rULUDkUR/tdBw2Uq1Q646KKIBkZbi84r2BdK0xIJfj
         HaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129990; x=1789734790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSeczAilR4RJwTk/ZWwyqudf5JxWuEGG8/sw7pvO2zA=;
        b=iJS1fpDzkuowdiJskQyUabLPXRrm0ZZgUqhQyfQ0KQ1ajBVNNyn8LVwUbW6H4iEt6c
         R9bRznxnUwVVgn8mP/afuogPkEYP1RjAUz8HAHKOHt20zEr2E0ezcd1Hl2YVkQ1MJVnJ
         pCBdhROF1KWUO9sgbfNR7qS2cN7oxNiycpRco4tfBoH7M7eI54VjuO+gQb31bzxhfzYQ
         mJXfJYKNlh5YDDdOWKRYlhaXBzHtCgeS5Lb/85+P6jsQvdqPOxEk3uXBL02cDpSp3Rd3
         1C8KVZLRV/RNX2m2S0XL7P3Y4VXAM12pVA8tj3SOJcWHAQM29wA5Mr6WHN8Ks0CkkGo7
         7LhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOHi282v4QwtJ957JWnYP24A005KZQf4ISIe1UJ3/w7YgZaBVWYblkUkKRoxNAvapl6t1bb0ehdkg6/oY=@vger.kernel.org
X-Gm-Message-State: AFuF++n5nQBt6Ikh9tlOXi9atV6aWwpXXDTvuzRmO3chWaLh96dMWfiQ
	cK0c63dj8dM0FCUxcuPZHHTp6Ktn74GmVmQ2TL6cqPS+uhtkJ/LQ8HV/SA+icw99MdUm/6Ylll7
	r8+VESMuXDCGk7YFYKwiBdIsI+3q8fuw=
X-Gm-Gg: AYBFou1LUB1JGAuOLsHBSdrvbu7sl7bePMxH7ybU318O7lbVfsiCkYycN6r2YvPlyGA
	Cah4YGD477CBw9JykA7ZYPhYTGARhc4IiKnNr7g7y1WZK/unD69D6xrGtx0kRGtmNy24ViAxKpx
	wm0fCAiQAVXfybPtHLnEZlLj7yMyLmh31mVuY6iNHqyf26MpIfDDHU6T3k7G3VPpnAAprJQiORq
	DLM7VpfejcBGOYhckcayOFJ0OvvTqXDO9AbqBYMI44/wUmMWldQ7l34YOgOHHaSu5G7VoO07jiU
	Kelg625lYIQF/y5kl/+nD31oEWP1g6gXRRP2WEQGlYAhdWHEKNrDHbG5HUCSrxpQDcsbWCu9ROz
	2JAdyVXNzfVy6Ho0eXkodPwfj6DsgzA==
X-Received: by 2002:a05:6820:c446:20b0:69d:a4f0:4191 with SMTP id
 006d021491bc7-6c0b9a57494mr1869587eaf.12.1789129990178; Fri, 11 Sep 2026
 05:33:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909190541.466476-1-mmyangfl@gmail.com> <20260909190541.466476-2-mmyangfl@gmail.com>
 <40e425e2-7d0b-4e20-9880-41e46ff340c6@lunn.ch> <CAAXyoMPG6s_z3g8fZ5CAF8BJa0OY7uzzO5PccaR6amfmYrYYHg@mail.gmail.com>
 <39ddc2cb-46c9-4754-99c1-0011a4cfdb7f@lunn.ch>
In-Reply-To: <39ddc2cb-46c9-4754-99c1-0011a4cfdb7f@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 11 Sep 2026 20:32:34 +0800
X-Gm-Features: AcwNN1XrdIHW7rGAYpHzilNP49ei_5I8KTagB7CK3QwEYAPqeS2TUQtky4XcYJI
Message-ID: <CAAXyoMMoX2rhjKKeWtxuid9tMSs956eubA1YXdpZ7AeP8Z=9ug@mail.gmail.com>
Subject: Re: [PATCH net-next 1/7] net: dsa: motorcomm: Split xMII and SERDES
 port masks
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 7:46=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Sep 11, 2026 at 05:37:45AM +0800, David Yang wrote:
> > On Fri, Sep 11, 2026 at 4:59=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > >  #define YT921X_PORT_MASK_INTn(port)  BIT(port)
> > > >  #define YT921X_PORT_MASK_INT0_n(n)   GENMASK((n) - 1, 0)
> > > >  #define YT921X_PORT_MASK_EXT0                BIT(8)
> > >
> > > I'm i right in says YT921X_PORT_MASK_EXT0 refers to port 8, because o=
f
> > > BIT(8)? And YT921X_PORT_MASK_EXT1 BIT(9) means port 9?
> > >
> > >         Andrew
> >
> > Yes.
>
> Can we give these better names then, YT921X_PORT_MASK_EXT8, or
> YT921X_PORT_8_MASK_EXT.
>
>         Andrew

These indexes are used in the vendor reference.

Or maybe just BIT(8)? Since they are not used anywhere else and kind
of leftovers.
