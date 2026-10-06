Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E43E6DEC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284848; cv=pass; b=auvMhLCqGvQlH2ar2MFxle2hArxrTYR3PCGrNTNri2Sxm2ZHxvUI1Z8j7hccyv0nzzj0XBM6QDvby5G9aQWLQPxwbPqIm503Kcqo7zSXoBWj9nRpNGUQYfyX3H9kNPMdO3HsV0P/5kZNUTUm6/b8PqKzgjoANkjhwK309FBcsP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284848; c=relaxed/simple;
	bh=qSS/SQDaAJD+8TrXRRUdYlnKCJd8RHVXLPrkfyVyE1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUg4Yt/SFAm7AG99HeyX1CcYr4aISAyRC8csiV+N8LCdbCsLCCXXKiCmodSqIuQXD/RRiFBrTK0i46Ay87wz7lcdmk2sgUklbdqIcBnquldtdGPDEBfhTObOMEBA4h2WotYFLjvprWimeiYOEhzs0Rb0xVPfOYVpmTTI7r5cbA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/EMXAj5; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/EMXAj5"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91957ec418cso12190726d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284844; cv=none;
        d=google.com; s=arc-20260327;
        b=k1IihujCtI7Io/sDzSyjQF/Dbg11yLNGRJCbALetIO8gWc7lExHrxBo8xi5ymJ9yUk
         CA6vFb6pJjuFi84xU7TBS0fRYlEaRHpRPiV801Oq8RmGX/FYoALu5MKL38mrlxB+uQYJ
         ZmAEzFCXPePFJyZZcO5yjsCaXCVfV4dU/zdjHe9UMfBALhTDrTNV4wvUzHcejbjm9P0w
         5IgwjboN3Fk1cpqB0lQXOwu6CRAki2VuWzqAMMnqkVEl7e4avDTuRa9sOwZrSD3ZIbUX
         ZYy3jpMkyBM8/EEzC1wtlX2zQuz8fvkKzV0H+BGM9UCsWTWyfDk1UmCx6q57e1pnlcG7
         5QZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=;
        fh=IvPOWi9yucqZ78IWJ8H2eVPvKlr7uNDVoOXZTXbGZ2Q=;
        b=pXgXy4kLvJI+LD2tWWBJMT4aoz/R+zVYvkWP5ClyWKToA2q2Mzom135eb2UiLflHew
         UYRvSufV3MiqLtphMfEX3rH6a9H7Ym5TnEsEiOMUGTeH2ZNZyMt52r/J6GS+8gw/W6HV
         VHkvyDIPmyQEBezxwo0o9AGf9vmzb/k8jTAChXmlQ68q4fOtkrEf2b0/8SVhDlzxdF0T
         zFI50Ps9LKEy344Nq5YaEgKQ9vYDnZ3E4GVN1DRanMuk2c7Cau3DJhljBS6Zb+CPPMTq
         YrQ3gR0HL1EpkmVqQ3yGx1iqIQvv5Mhx3UlsNskpApbG/Umsy/4Q5ZTUc6nbla7Qm2pf
         V7LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284844; x=1791889644; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=;
        b=q/EMXAj58oXFBNWWRtOLXcyeBBO90ETnY2BHR6HODfxlA9IHy74LVCO8VTqPXZQ/pE
         nyG1fUStUMb0w875dj+GxKu/HPIEx8sOJw8Xvo4ODTraXkKRaCR9GX1JfYEOJLGIOqYD
         BHmdQZd5vAMsjiFpJv9h08ms6pFetTnIUyIb60/N3z+pSjqZElpf13ExW2ALNFAZLtC3
         CwXVmbGGRrB23xa9u+3Wlq5b4vSbOtr88EDBnO+GvoWczmm9Se9YdjS94QUrpUDZMuRP
         VF3cg3KnqQSQeacZOqMNtIkcs25GWyXIon8F/aAJHFvrbP9Epod/IN/uL804GdV1swEp
         WQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284844; x=1791889644;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=;
        b=OfS6g1aypZgx+KnvN0NUPqf3IZiBr+VSQ5yfmZKw4CeNvyaPAooyJmnOWfmORCreDS
         bphZpM8lFtYIot7xSLpsQk0qo2BLgypaBND+P19Epy2Nk60xE7pKVV5qmHMTCpZhbFqf
         TlVPtOY/OAuV+Rae3ZVGz0nfP/N4OQJeb4dGXmZSVUVrXF8FUxLDjFLALONZ+XrfQ3NU
         9I7UohPoN0qsyoRDozaHxFKln+OnnVwl2bTkWmQGeu2xF51k0SlwmDfTL3fBTxj9qXZd
         89ZPSVPXfDe6f1JanRyyr3J3+gUT9/TNKk1OOY6v1IgFLpP1rXYRK+OnE6n92bBXDyeC
         3nyw==
X-Forwarded-Encrypted: i=1; AKwUvByV1MfTJOtNDJIHw8NqDWRPDXgrrwkn/ySkV0apt9Zovc5fdNKgCo733URylgGeCUhMYYeIiyJ8WpoJFp0=@vger.kernel.org
X-Gm-Message-State: AFuF++nVBayMgxWCDcoEoRxD62J4ZfZrzwfgxwKGe0sz5O9CT+6nbDyM
	JDAqww023nekK9S3tsSJFJI3c+RbZSWBy4z+nvJeVjKg1AK8SAedzlQqdua8ZXEHvnO8llo0SEv
	Dn+GVNHDiGLlvhKWVb4irElK3ULQimUE=
X-Gm-Gg: AYBFou25DO72nEhRpqu9hgWj5dZ12ei+CkFoLW2IEK5LGz0AW1YDUzEQ3ITuxmcipAl
	4XV49bu5moYHyyFgyhkChNnffXCdIHTh0q0ZXzYiBu6iMxhEJsR9/oe7gx9HF5mZm5kSH7aDGnq
	9W+W1w5vD68T2POe5kTCUnJPEIgyZ3KAEUlG9jNc5R8h7xP1rhmIq581Tks9XAtMj5zpHEjiI1h
	+KgTQ0vOIuL7Qyq+rVWVKeQU5oRQUU8lAiXHNksj2p1ChdMYzqUNx+W/kZXStp2LBbYuwzTG1ti
	ehvJ27k3SSk///0eqG0LbNlLDuJMbj4YHSSPXUJOftR+fBUX5sAdMm/cOJHjq0aIlnb3ayxOQK/
	w6SQ7lpzf
X-Received: by 2002:a05:6214:310a:b0:919:5a24:d77c with SMTP id
 6a1803df08f44-9198b7bec34mr20040386d6.31.1791284844396; Tue, 06 Oct 2026
 04:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com> <asTVqsqOLb29LY08@parshuram>
In-Reply-To: <asTVqsqOLb29LY08@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 13:07:10 +0200
X-Gm-Features: AclHuK__1dmQcUVRwrNQOlxQllKfZWHAwvmEnEZJ6X7sEUc-dLa0jeCfKreo69E
Message-ID: <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 06-10-26, 12:47, Christian Marangi (Ansuel) wrote:
> > Il giorno mar 6 ott 2026 alle ore 12:45 Vinod Koul <vkoul@kernel.org>
> > ha scritto:
> > >
> > > On 06-10-26, 12:29, Christian Marangi wrote:
> > > > This is a major rework of the old v2 series.
> > > >
> > > > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > > > configuration for the Serdes port. Such port can be either configured
> > > > for USB usage or for PCIe lines or HSGMII and these are configured
> > > > in the SCU space.
> > > >
> > > > The previous implementation of a dedicated SSR driver was too
> > > > complex and fragile for the simple task of configuring a register
> > > > hence it was dropped and the handling is entirely in the PHY driver.
> > > >
> > > > Everything was reducted to the dt-bindings to describe the Serdes line.
> > > >
> > > > Also the property for the PHY are renamed to a more suitable name and
> > > > everything is now mandatory to simplify the implementation.
> > > > (the PHY are always present and active on the SoC)
> > >
> > > I get build failure:
> > >
> > > drivers/phy/airoha/phy-an7581-usb.c:7:10: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
> > >     7 | #include <dt-bindings/soc/airoha,scu-ssr.h>
> > >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> >
> > This header is present in linux-next
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/soc/airoha,scu-ssr.h
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/soc/airoha,scu-ssr.h?id=11952173d8a180ac05641775f80bd6946327478f
> >
> > Introduced by a clk series.
>
> Okay so we have a cross tree dependency. I would like my tree to be
> buildable and not depend on next.
>
> I can
> a) get a signed tag for this from clk tree with the required patch,
> merge and then apply this series
> b) postpone to rc1
>
> Either works for me
>

Maybe "a" is better for other phy driver? The pcie move patch is blocking
other airoha drivers currently.

What is the procedure? In theory just the dt patch is needed, nothing else.

Thanks a lot for helping in this.
