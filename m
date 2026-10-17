Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F442F745D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792197287; cv=none; b=bAeRjYSguy1cP+4PSOpFBG2AbrJxORfRn1ZT/b1NZS8hIuwCg4MDf4txtUl13xAf+bNovX3mbqHxZwNwsVQc1DhRBJGwfy5/OU6ou08Ff7udaXowLyolxWACp24RrDTOBVTzW5bAkk8WNNCzOC4BwTX7MRxfA65YW6wJavmPX24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792197287; c=relaxed/simple;
	bh=Sdv7CtUWrHDpWs7HDwx2mV6IO/EUxee2clEbWUOToFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ox+PZNyJ9Rtwtj7M6C17EIDd07N0p5yLB7rlbUTbXeRMc2oaHrBJOtbX7s96lmZuHDmPsd1h4rS9q8lRaTQNW5J2jJ3aI0wp6Dm9n5jYayY9qNgyBrwBdJmlEybmHG7prMphETJJ2opnROFVhjb4y2wHGfy5ulXD4SaYNip13q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vqh+tUUm; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vqh+tUUm"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35943f55c06so638728eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792197285; x=1792802085; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsjFJvXudSwXdcgN7c4k2FLE+FzpOd2OfS6oolBJa/8=;
        b=Vqh+tUUm1X/c5ImFWpyEZ7/5xpZ/yVUTPtG/RW8YI35G6i23yUUgWTypnXNwJgtBYZ
         31EH4N/myhFL/uDcfnb+JNsb2S5Ei+2LtBzvdEsAJUxnqZn9ePvHXkbIa/ncwJ/q4xAU
         bkXeFSaUBSUemGKoVOibHNJ8mpOaP0cygsD0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792197285; x=1792802085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KsjFJvXudSwXdcgN7c4k2FLE+FzpOd2OfS6oolBJa/8=;
        b=QIV4hlmYsuTSex498XlVW2dJ54UxajW5PDCuBH8rVTXGZcSaqU8mXHRFaPtfoGhHbS
         IM9QzG3/sy3ffbIlCB0kzYd/dpstpn25ZJK1Jr9hq/74S/ivu7+Gw6leDjNOlsWaKCet
         pVufavK4jSIaywhV0aUb8JFnr8g76Jvi/Q33Vxbhk37NyamIwEVFuXO1rt/cLTWafyKj
         N/bM0KqrWJCWiYOA9NoSklvihKfmQnqZsAVkl1pHtigu/q3C9ce/S9qHLjL2XxZL4Ngk
         oNPEDK0VEfNtdBm7ZsEEACWzApiLb0kzihz8n3/QuLrue8vLieq9o47gKdRxuPTQt7c3
         vQwg==
X-Forwarded-Encrypted: i=1; AKwUvBxSrI3yafF8TUWTVC3DzRg8tphv1P15Dxc/wrF2+NlX+m+wpgG6k419VgjFbd9+nNXPDpoRv0umgzUoMr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+E1P9zPO+7FqcktmYLB7Fv/Otq+luJukEHSixcVnYFmGfT3Zz
	8ktSPwp58mkGpXlM6DIWQmSasu9xmYUlboo68PBVcR63yka0CzMS88tRB6FSPJyCxg==
X-Gm-Gg: AYBFou3lYFBsIT9mLlITF9F9snmmU9bsbnTqOsf38tsiipo5jp0482v2GOevykPs3r7
	SYHDaSMWRhFlYP4mCmpAVU7SvwhTr2FQgUuqIqwUgSm3G8zg/6qHAyPJ0KD/CyK7d0WLhaXtrCP
	xaTTzIfaRoXcSsDChY/oy+LRgp8wRJ8sq++M4PKqLT6PUJpX61HeOo1njOAizwbW4xGJ9rfKjso
	gax97+lXs7x8OoqcwL3PS5mgNp5nhQf5rea0k2qTusSlKC2FFxTyAsdQZBArZoM/90GaOBtyEzl
	Rjx8No1vRgT5V50Ew+E8PZXfM78PRnhe0+QIAQYQ5cTGYW19wr3Yu5QRy4d1yqTz2POGCweCBIG
	wKZ0YYjOnTB4GTcmSWSIGtRVLOPj/GHCCGV7fGvCkQ2BdcVk5Jb7KbmQ0pYZYGFhcQBOjxX+7ZY
	e/aontFSmKQdnqugCzK+Z3SsPNjn9FpCDObzpSBri5aEZU3JW3t8wbx1NRjIdf5XCs3ou5PsH4K
	oJjyab1t4CCi6gcxfeJFu21pJhESd0HSvEZ
X-Received: by 2002:a05:7300:dd0b:b0:361:a195:c46e with SMTP id 5a478bee46e88-361a195c51cmr1438547eec.1.1792197285163;
        Fri, 16 Oct 2026 17:34:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:d542:736d:a85:f140])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36082b8573dsm9819489eec.25.2026.10.16.17.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 17:34:43 -0700 (PDT)
Date: Fri, 16 Oct 2026 17:34:42 -0700
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
	Ulf Hansson <ulfh@kernel.org>
Subject: Re: [PATCH v4 2/2] PM: runtime: Add Example Driver Patterns section
Message-ID: <atLCom0YznHV8U6D@google.com>
References: <20261001155118.1750028-1-briannorris@chromium.org>
 <20261001085009.v4.2.I75ceea7b1afd016e08922e47b82e6eb36de144fe@changeid>
 <CAJZ5v0hMHutu69acgSR7KsmcLs0McZK+-3OFoiqFrU5GnJzTNQ@mail.gmail.com>
 <as_i5MEz3WfnDQmf@google.com>
 <CAJZ5v0i+77gt-KmMYdxxzS4uGzxFArrYGpoDnjrfknpPOkAuHg@mail.gmail.com>
 <atE9urIHXAJZXu6k@google.com>
 <CAJZ5v0g56J9e9qdiR8W+BfmEbbedvpD8hop4+n9=rkFEsDG_Jw@mail.gmail.com>
 <CAJZ5v0gNQqffxcdzWff=z3hi0BXzJBOV6WKgf6RXuOydzQJQMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gNQqffxcdzWff=z3hi0BXzJBOV6WKgf6RXuOydzQJQMw@mail.gmail.com>

Hi Rafael,

On Fri, Oct 16, 2026 at 08:05:12PM +0200, Rafael J. Wysocki (Intel) wrote:
> On Fri, Oct 16, 2026 at 7:42 PM Rafael J. Wysocki (Intel)
> <rafael@kernel.org> wrote:
> > On Thu, Oct 15, 2026 at 10:55 PM Brian Norris <briannorris@chromium.org> wrote:
> > > On Thu, Oct 15, 2026 at 10:11:04PM +0200, Rafael J. Wysocki (Intel) wrote:
> > > > On Wed, Oct 14, 2026 at 10:15 PM Brian Norris <briannorris@chromium.org> wrote:
> > > > > On Wed, Oct 14, 2026 at 09:07:54PM +0200, Rafael J. Wysocki (Intel) wrote:
> > > > > > On Thu, Oct 1, 2026 at 5:51 PM Brian Norris <briannorris@chromium.org> wrote:
> > > > > > >
> 
> [cut]

[ Thanks for the earlier clarification about PM domain. It helps me
  understand where you're coming from. ]

> > > I kinda think the point of most of this power domain architecture is
> > > that a typical driver just doesn't have to worry about it at all (in
> > > probe(), and if you use runtime PM properly), so I'd prefer not
> > > mentioning it in the Basic example. But sure.
> >
> > Well, your basic example needs to be put in a certain context because
> > it may not be generally applicable everywhere.
> >
> > I think that you should make it clear what the driver's expectations
> > regarding the physical state of the device at the probe time are and
> > the general rule is that it is better to leave the device in the same
> > state in which it is expected to be found next time.

Ack, will do to the best of my ability.

> To be somewhat more precise, if the driver expects to find the device
> completely off and the runtime PM callbacks are set up to make it
> operational, runtime PM can be used to power it up in probe:
> 
> /* Assume the runtime PM status to be "suspended". */
> pm_runtime_enable(dev);
> pm_runtime_get_sync(dev);
> 
> but then in remove or on probe errors the "power off" state needs to
> be restored manually:
> 
> pm_runtime_disable(dev);
> /* Allow the parent and suppliers (if any) to suspend. */
> pm_runtime_set_suspended(dev);
> device_specific_power_off(dev);

That's ... precisely the second example, "Probe with Hardware Powered
Off". It's couched more in my non-ACPI background, but it's the same.
And it mostly avoids pseudocode, so it should be a bit more clear than
the "Basic Probe" we've been talking about.

But there, I still propose that the main distinction is about what work
needs done in the driver in question. The PM domain is still mostly
irrelevant to the driver writer, except perhaps in the language I use
about "on", "off", "operational", etc. And yes, sometimes that means the
work needed to "become operational" is minimal/empty; but that seems
like an obvious reduction from "do what's needed to power on" (nothing)
and "undo what you did on the way up" (nothing).

> However, if the driver expects to find the device operational (for
> example, because it assumes the ACPI PM domain to be there), it may
> just update the runtime PM status before enabling runtime PM:
> 
> /* Assume the runtime PM status to be "suspended". */
> pm_runtime_set_active(dev);
> pm_runtime_enable(dev);
> 
> but then in remove or on probe errors it may just leave the device in
> its current physical state (whatever it is) and assume somebody else
> to take care of turning it off subsequently:
> 
> pm_runtime_disable(dev);
> /* Allow the parent and suppliers (if any) to suspend. */
> pm_runtime_set_suspended(dev);
> 
> These are two distinct cases that are rather hard to cover in one
> simple example.

To me, this case is barely different than my existing "Basic Probe"
case, except that the "/* Power on and initialize hardware registers... */"
(or "foo_initialize()") is empty, and so the setup and teardown becomes
smaller.

So I still think my first 2 example cases are perfectly sufficient to
cover what you're talking about. I can just improve a bit of the
language and clarity w.r.t. the things you've mentioned. For example, I
can clarify that the driver might need to power on resources or itself,
or the PM domain might have done that for you -- regardless, one needs
to tear down what they set up (which is nothing but the
pm_runtime_set_[status](), in some cases).

Brian
