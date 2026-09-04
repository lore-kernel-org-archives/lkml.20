Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9309B3F412C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530870; cv=none; b=awbVMLBfuD8ol1OS2vtIeHsOPhpoNUe8DmC5Waj0SxtSyBdcWiYIIkncUZY1L0I1+X0+M0IjFwGfTy4OFUzm2UtHaFzEJG4ik1FR2UeAiIleCfX/mBz/34WMulL8rufXL/HjiN9FaQy8i7UTtXELB2urUYx6l1csAdryy1YiSYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530870; c=relaxed/simple;
	bh=UR+ZEsUUsBBDR6H3J4SrQikXuAGz4zSkD4hPrqvWIrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9+g1uR+dZ1UquRyARcymhs6X2QbGWh4TuCqv2QFuXECtdHtNcINbzL2r9nTb8j/mbHU22XlWLXb1fNOisMmIB0gombWovzUTfY0eZyfEx3TryeRTfdDA7x/UKvVIjYveVYkzj/NY9odsPYQvrGy6PV5HHb5Sny1xuSH0kj5M/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mda2Leqx; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mda2Leqx"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso7986431fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788530866; x=1789135666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UR+ZEsUUsBBDR6H3J4SrQikXuAGz4zSkD4hPrqvWIrE=;
        b=Mda2Leqx1xayI3nEyVKfmDtKJxrEnmSlRru2wdvZbWZpBZgmvXwciUBykcAH+YGyVu
         1mM/IStHY/BDENLX+OCeUjFnot643DqdzqLmcQ76UGw+UrQ88hJkFZBLHS3R8Cqjsyyj
         WmlHPOhVlaY/AC0nL59kVEw71Tf3zz2VG8pj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530866; x=1789135666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UR+ZEsUUsBBDR6H3J4SrQikXuAGz4zSkD4hPrqvWIrE=;
        b=jbDRLj+OkkYteB+v2W5QCNq4iQFaOrB0GwRoIkIr6qQi1RmWGmcLDdqZsP+5xjrusH
         bp6sCt5Oz2P4t7hXJPVSBTHbLCLSZbdOEVpsnWydx+fZrXSu7Oqh+tOceVubj1zzXGoO
         Exqa7SzJ/ExlkfejovCWoWyk43tXimDvawFIY5f9gK95qJdSOrpj9tP9sz8tb75MKL8i
         c75fC7QAJgDCXgfoxtrDhNHU5rCu/Pp5nxe9BfnSwCfBG98XZn1yy775h91/W1w3jljx
         6XZmfj3+5bofaQFP1if9C3aZNCcMAiDm/dZXzbruxRLykprT4sMxIX5/kSA8W01f/YpU
         Bxxg==
X-Forwarded-Encrypted: i=1; AKwUvBwXyvh4yYIg8wGsM+s/IRH2PN7FazDb1loKEM96nrr8kMEvaIpHwxRfiPk0WRLaK33QvSkq8IX3+PhEQBI=@vger.kernel.org
X-Gm-Message-State: AFuF++lx/mu6Po+Eaz2/T1n4C9nf8AL5ooLG39LRmFP6279MNRL9s24D
	VgVlwVHXaL6znseDeB8d2LlvCK0GXN8DnqBLgS+fR2vgVymG4jkau391BRfakRz56zz5Go9RN/l
	ywVw=
X-Gm-Gg: AYBFou0dCT7vDph0psIk8/9phi+zcmVzXyKUJWpJm2NYLnQmWMChlYeh4vtPUFq2EYc
	FShryTnZb08SE7P5/DpFB5VgawKGltRrPVYbds1m57CCfYKej35vUWrpa/ul36mAW6toSCbS32G
	MBvZTUt4MomgVvysuKQj6LNpxGQ2bqwqMmQtrI8uJKzQe3DqzsKW2eCHdupLdS5A+NQDn/eG/oN
	7PYzSIFrc1XY5vd67wsJhOf3uYULnteOvIYzwCcvNA3iN1uD4iazmdGz3fbF6ylzy+AXiT5Mxxi
	ZnT9tq0bOL5ZQxQDs0fYQnzC3gaqQJZMGJfTUeA0X4NWBhZ6nM7JrtqdAw/WrCLozMuMIQvzGkK
	FMhFO+t6kTX9ny9zvJymD8PPvYsIGPdYEmU9SH+HDpp2VAynq5b9uEIoF+NBoMDpaYW4VTKMuAS
	F3pNnhaICii0y5qBX6ZucgTjU7ro9JSp+AGhHN6wx8xhPoZKiZJZHFjchJXXp6ksCANI1equd8C
	PEt3uM1gLi15Go9jYuNYDuVFS4=
X-Received: by 2002:a2e:b889:0:b0:3a1:51e6:fe5c with SMTP id 38308e7fff4ca-3a371bd86a1mr6888931fa.13.1788530866434;
        Fri, 04 Sep 2026 07:07:46 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37058820esm6314291fa.20.2026.09.04.07.07.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:07:46 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e067e908so941717f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:07:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVYBvIkjPj8rnuvIkSZMwAIU8I7396GRwzV9rfx+RH6pfWk3GnDoCn4ldyOO4DKnYx1jjjBwKtDQymSmA=@vger.kernel.org
X-Received: by 2002:a05:6000:25e7:b0:485:8920:cada with SMTP id
 ffacd0b85a97d-4858920cb46mr5715992f8f.18.1788530863620; Fri, 04 Sep 2026
 07:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-3-f3999362a9ea@google.com> <87ecf98ivn.ffs@fw13>
In-Reply-To: <87ecf98ivn.ffs@fw13>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 07:07:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VMExH-K68aDfNsFBnQRSaYSNwbHo7hLhpzhpWN+r+Fsw@mail.gmail.com>
X-Gm-Features: AcwNN1XtHwZHgy5raT8AjWbFs0kW9c54GiCuQWnPlGop-re52BRNMJq1xExF-CI
Message-ID: <CAD=FV=VMExH-K68aDfNsFBnQRSaYSNwbHo7hLhpzhpWN+r+Fsw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] genirq: Export NMI APIs
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mayank Rungta <mrungta@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 4, 2026 at 2:29=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> On Wed, Sep 02 2026 at 18:54, Mayank Rungta wrote:
> > Currently, request_nmi(), free_nmi(), enable_nmi(), disable_nmi_nosync(=
),
> > and disable_nmi() are restricted to built-in kernel code because they a=
re
> > not exported.
> >
> > Export these symbols with EXPORT_SYMBOL_GPL so loadable kernel modules =
can
> > register and manage NMIs.
>
> I'm not really fond of that.

Is this to be taken a NAK on the whole idea, then?

The last patch in the series [1] wants to promote a HW watchdog bark
interrupt to NMI. This seems like a pretty useful thing to do and an
appropriate use of NMI, but the HW watchdog driver is a kernel module.
Do you have another suggestion for solving that?

[1] https://lore.kernel.org/all/20260902-qcom-wdt-nmi-series-v3-5-f3999362a=
9ea@google.com/


> Funny enough there is already a driver which claims it can be built as
> module which uses these interfaces. Oh well...
>
> > Assisted-by: Antigravity:gemini
>
> I'm impressed that AI is required to add four EXPORT_SYMBOL_GPL()
> instances.

Hmm, I guess it's hard to figure out the guidance here. I think Mayank
is only adding this tag to try match what's documented in
`coding-assistants.rst`. If you've got an AI helping you with a
series, it's pretty much touching all the patches. I guess you're
suggesting that, even if AI touched it, trivial patches should remove
the tag?
