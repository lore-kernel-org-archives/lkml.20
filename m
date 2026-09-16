Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F004BFE70
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602068; cv=pass; b=YslPd3Jl8cuGZAOEV4wzwjUd7ZHCsXHoFBrJyBaNfFjh61ppJGN2MXrbyDtIXVjqvzmzTF7b12h9HzIsqcs7fJIz0fajrWoqo5E6l8ULcHQh1dAPm3gFHAE1zjSw/hlht3OPZJwRiUjWNuw58b72FRFGj5SME38SC5PDb9b4hI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602068; c=relaxed/simple;
	bh=lb/6KfgPkAz+SGqEMJXWqTER4Sq1FTeFhEUqu1TJfFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WL6O6ifVRZBUmNbp0Q6xipoVehEd710ETVpgY72J11zXDVE9aWkEf8sQx6WL2pUXNncvn89klGleI5Sc2pnsZ7mwHUmzdqiYbBksBXX+WSutp4esID2DTUZsVGypMypWX1DSM7UvumtHpo+V6QE21tddUJIgydej75CKKYClCDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lHTGjbXw; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lHTGjbXw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so190827f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602065; cv=none;
        d=google.com; s=arc-20260327;
        b=Dm7xepzR2AMz0e33W7RXPM6qLut/xwC8I2Q2cEEecd8SPFSfmeETY1P9QhTeLP1CZm
         k4mofMY8XY6z6gDMBQe0k4uDnAKosdm0wDI2rb17dQhf5cHl2Pe296Fuwo2TyPUUo/x1
         UAiVWaXT7d5kik0KELP1d61SUrvsmLXkqoAYaTWOwB9Pfb9xofc2dDvdyfZpfSKLCoCe
         N3S7rAMddr8sH/UHegnn0TwP1c4Vol709XOi6ySSPNVcTQxeVL8mQffOGBpBEF+QF8ov
         C867qWh1kjApTnQTzcYPrxyD4uLFNAi+0LVzMpKY8LE3C4kyqDAm2N/E77Bdpnnj/4VM
         RXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gH7nz+bt0aml9YC56TYqcpLaibFKsNDsHL3XOgPNbns=;
        fh=dt5z/LszVJGXmORqxZX5RZiPlQWBj9hH4R0IV8/6phk=;
        b=LnJEVEkuZDsIMB97vXuECenWINpDYYNYTA0Ij7kVb0pDJixe+il/nwrkzTl9bdiXXz
         vkXYgHwaSvmJQFUKxTY/9Bbf8+zKoeqm7ja4FKCdrSa67mG5M1szXFpXUwcetAUY0d1k
         kMSP0u2QmdTe0NM9ZSLy4lFq28LAmNsRNYbuQAY8v4EEGgnEl0W43maK4vvWXVgY7hjK
         ysR+/7Ah2WadZRfZ9qvUIbl2yt/zgHh6RKRUj3Y7+lkkY4UaMniPPRSiGmXbe7x7pPLu
         fI4Zj8XV74sRGwsgHlPDk1bS6UX1FJQ1ndbS4q7cZk3P4pHiBnvqx7i63W+7X31RsqEO
         aTXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789602065; x=1790206865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gH7nz+bt0aml9YC56TYqcpLaibFKsNDsHL3XOgPNbns=;
        b=lHTGjbXwSBM01QSwzUtACTCJggb+lGXvU4iJO21Ar9yyg1AoTPQUrQ+A6As+wQWTWR
         FDbkcpCfRXYpLTkYEdxuARto6qAIF2AwiinRuHeRlIgKSC5tcbAcaeRIEYBxlClhFM92
         533ZBHbLTUNkE37Q2qnWNNfco8ps8DO+GCEvtH8KqilvPI+/pEH04v4sCEIkBrWxeMDO
         SsXrl0gwJtKGluHUaV/lTZBFFfa+rQzsFkVgHgNtggK/IJGHDQ60KTUyWpARmhNP6dyz
         IqO0B2cbRg+KY11a0z5fRd3tY16ao+v7do+WrJGfMA99G/gGjbSdeQWpSLi/3dqdZ+W7
         WneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602065; x=1790206865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gH7nz+bt0aml9YC56TYqcpLaibFKsNDsHL3XOgPNbns=;
        b=PRqv53u+17dN05Y7guiSZvCb+D98Opc5DUCkp2mJ2sGxV9o/gFRqM/ZLCdFf0e1G3m
         pq5PqJACt8aAo1g2jmFgE7wOGxGCUEE9FyktGD+5XUyR7NRTMbLOsX5n+Er1UtoWZ6t4
         EYVDNBr3rUyMuR/nw2lnD0u0u92Dvs1nUQ75ktpoVK0iPnXboNeiPT1wI+3xf1On4GuQ
         2jDMtjCWLDk/WjCMW1lPf7agZ/UZy0HMc4sR7dUHryum9+XrswfWEKr14071toR7rRi+
         ZPJC3y1rsCdojU17+HfRBr7HaHxTv2HXkL2RKBWdXcHwbj8J6bMe30dxAMQAcon0CA5V
         MOHQ==
X-Forwarded-Encrypted: i=1; AKwUvByGdl+PtLui0nX+lbBtmCRwDPnjmQo3RZ0N5Tpeh2X8J04yd5Y/ZLqTF5DL9qBASbW5rl5nAYO2UmG8jmE=@vger.kernel.org
X-Gm-Message-State: AFuF++lmXpOlQOLgcyJ0Az7lAbYpGqtYFFWefURwTUMXvN1TIbcqqz+H
	pUciYc5P1YSQegDyoTLaFWPZnmGLpto7uO++YdxJchoPlj0b5mY/zoVRWqBEvTwgaGr83eQAETs
	JxGbwme2AgWG8zLr9EWR/pcPX8Mzr3X1WUwfxW7zc
X-Gm-Gg: AYBFou2LGnWaTrf/ctjr1Z3uSLzGl+DVeYeLxohtTSrk7cj+XYeV/+hM7FsXzgQOjAz
	KMR/ibzhb+ifHvQ64sul/vNrawCgYMDRljuAvNIpLYC6Ca54OClsmt9j+3vJsFAf24a73CZqRIt
	HPOasYtEE+rcMN4RAaw/+nk7ihi4zlyPw9LUOD3/QB13abR2qYeDqj0+Ha89csLmwhVlqwSZE37
	fBgICiGa+CS5eGCVu/locywMwagOSLdLE8l2R6CKX3AQFD4lGxgBMl7ECv84RrCK2ew/XqJCg2e
	/NQz0wOt+iVIIu7T2A1W81Cx0FfTkkd+4mmWTdg6fPipLYlm3i2X3wGk5wNt5ccXNyEwhto6ukp
	VwS9x5Z+wjENI280RMdFoX1wzIDYF/vyz5okjK6Vs9nTWhC9AzMpeJAZKUR3Wtc9b2Bvs
X-Received: by 2002:adf:e19d:0:b0:487:ff2:12f4 with SMTP id
 ffacd0b85a97d-4870ff21384mr4842187f8f.40.1789602064723; Wed, 16 Sep 2026
 16:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <CAKwvOdmnfkra0N34v5w8qh+8bb4X5AxLTtOULu46S8q9KCvzMQ@mail.gmail.com> <20260916225700.GA4107307@ax162>
In-Reply-To: <20260916225700.GA4107307@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Sep 2026 16:40:52 -0700
X-Gm-Features: AcwNN1Xf8BJxVeyQi1pPTbOgFv4VYZ927MQjzdjJDkXyRlB6RTq8PQa_yc11fiU
Message-ID: <CAKwvOdnPbmDcw+gNzHHZJ5jTKV8dfJW6W1QTARw=XAQWo_OEgw@mail.gmail.com>
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:57=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> > Any idea why we only see this for riscv?  Would think loop idiom
> > recognition would make this transform for any target.
>
> I have not confirmed this but based on looking at the aarch64
> disassembly when deciding how to tackle this, I suspect some backends
> can expand certain calls to memset() to a set of instructions, as I saw
> a set of stp calls with xzr as the source and offsets into params as the
> dest.

https://godbolt.org/z/dbPrexfvo

Yeah, just seems like there's a heuristic/threshold for the trip
count. (GCC will also generate the libcall for trip counts >=3D 16).
--=20
Thanks,
~Nick Desaulniers
