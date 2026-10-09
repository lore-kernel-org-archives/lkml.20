Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841863CB57B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566709; cv=pass; b=ftO0jJJkaGfv3AkK55dyO1Uj5vh7fXRCkhKta6k/EHdoMfsGLCMJu6Hf0/jEQH1aw1iLwicSpleKZbN5qQNGhqQnSTM9owoh55cmi5AOB3gic8+9d7WUqR8FvTdEnG2Z70gqwxHUWosDBL+gp9QVb+IIHpbCdbVFNi347Gw5oYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566709; c=relaxed/simple;
	bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4sHcGRZKu5Kjyo3kjr3PMIjhm7p4Ofc0lWkQ0gQyHo957Hx0RdCL/octzV4m12AUKx6CAwhuRg8G3DeGGj4sWkqCNNT+0fZ3ivxkIMs/fD9cxjHshgjbK78/Uz25v5eJBH+62+RP/uY82BxBeu2YCIW8Jh8rHmBY7FdfC+MHd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qboILVFy; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qboILVFy"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ab432273c5so45619837b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566707; cv=none;
        d=google.com; s=arc-20260327;
        b=Yvml9CZ+saCtp5OAGs4+Q4b7jGBox0/KnmrUbIDY/7gs8Ewyuk87DsQvJ3jpjKjmMc
         VG/+5e8QZKr9Eqm1DwDA+Suy+1mII8NuTDV3JJ/zD9rcFCdqm71VEE32WgzukwwVh5xr
         /JkgbQ57WsWlvbTKbxiC7aWNkahS2IXHAchCLrqUsZtV2P8OmZpmfzi+E/kCw3aht6hb
         /dMPiJiEQadO9F5M426IlFYyQRssT5EuvKZzWcKKE0A4puVprjhoaBANmvjgz2kgWfTW
         AVH07XbSIhnb+j6dQBYkAfOX7HdbXr+eP8mUoFJiJG5zV+z3yqYpng9zuea7PD+Up4ql
         3eUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
        fh=cLq+iTSX9gE68rVsZdAltHfAKeMrEO+U1grjnOgG3x4=;
        b=rhRqXL0Ht+rjMnqzZ1jZwT8LVYDSlHe0VRVtSdP3NnQIoEo7426AdH28N0qZ7H3R9j
         QqEw7GK1hPyef/E8gb9vcZ0fKKf/krA6gyCR5crbYuLbiFv8u4e43J5/1dTa+V5CPddH
         VVA0DzUmFS6/LXy5AyHfA0ibi4YEf7lNlHfDHVXWsapSic/05EGmnhMru+W5YkylK+DQ
         uczfshTd2tJ/f+4iiQKZ/sEdEJNekqHiig28tkkV2M4x23WGsw0qvDroXCJr2XPm95Id
         RIAgOr9MOUit4Ut5V7GAyzcCxsQeEpELF4Ud6tzlhrKGtzjEwlvi7pXR1qrzNCpts8jq
         pYFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566707; x=1792171507; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
        b=qboILVFyKCQst/qpAaoopfjngMCMtV4wSjx8YF59Xi9wZ0es8k4uh0L0KAA72NFpJD
         tCI0d7CQ9ieZl+8VMmDnkxYb3FimfDPGBP87KvckSgG0K/W30blSzvEeCIULBti+988u
         tg3mHEFKztdS55Mdv63MdptfZHQO3aO/9i+Izk7YnFnyZeOoVABBkdyV3puUMjkRGCGC
         MJXH0G1bLLCPPOZGgGEY315QNlU74Zi3g1EPBkmzG9uEEqpHCKjbOro+knCTP63VliIJ
         jcvUWCPiLMe9teZin5iL9Vm2bIDNIcKzKOp/PTZGboxCrbg31xY7t/esFd8pNZdW2gkg
         XjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566707; x=1792171507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
        b=gtKwRgPv4PBrHlYS5SKy3JJPy71/taclGJOUVSFRjnnk52BJQk9H80juCa6/1+Gft0
         iJUkCtK8LRL2CSMLnBcZUU5ZnGg4qn6mgIGg5LnPH5dQdaZQr4qIt9bY6t2/u1gP2WFQ
         5UOiUho0poQs4cLiHDuNORPnez+aBqQuYU/IAsz881vA6fdM9RnfLfWkPpqnPY5b6N0i
         rnFjX5lBF/YC7NO6Cvsk62wtLN28AIMrRpzLguGVwrR13kopPcsM67iFetJ0wYED5QxC
         YgUhimszYy+2Ga4wYEEGAip174UWCIpn4EhUl+c7BbrQK9SkE757kXgT6kmqUcxzYsxF
         Wg/g==
X-Forwarded-Encrypted: i=1; AKwUvBz+dmOcVUPq/ubrkmDCYGJDwgPuRDybQZIJVz2GP4YpMLsq9vgJLMXw6hBho8+M/eeHT89ETcUAV6W2vAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR6yQsh4NTgzTN6SbqklPeU8BMSfWCfr2hspw2Y0QjwLN2bvoo
	AbDiB+MFwnwboavjkbu2GCM5CwYjPZfpmDM3d+hTm8CIWI78VD89onVeA8AVULIaPacqNlYSK/W
	1K62iSBHAo01hGOA6ORySQ5yS1qkhEUc=
X-Gm-Gg: AYBFou08WXvVEoV5EuBoMg4fRX0n50z0m+NXsuTCKO7QmxhM/N7UehhwVttEk0m0mvJ
	YTo1zy8epgl6bmqImhoD9DM/pLI6MvGeq0PPAKTv1df8M9woZjlWZ/xdVk5uzEw9dWS2kn4ul3M
	6wsfNRts/wKOdgtbYdehT7OvmwE8jRLMw1Vp93cvob17dDVndbHgGEurbf2jX0kuPr0M5xVJv0g
	ZiRvNz5+UTAHls3fXIPOAbIN4vaLJGz0ss2VSr9EfH43nv6Wx2S/llfnEXiRl9pPze4MtN86JtW
	qkYV6F89S2JFHQ1bhIMXYAjPWqX+oSml8FZH+EJjdYXUudEWAbGMQcLqox4It40SEgpPruJQKq6
	oR7rNv5G8EFvvJ5Wn3nb7GTr6TSmPq4rEVw==
X-Received: by 2002:a05:690c:10d:b0:8b0:88b7:cfe3 with SMTP id
 00721157ae682-8b088b7d19bmr3339407b3.40.1791566703722; Fri, 09 Oct 2026
 10:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
 <asTVqsqOLb29LY08@parshuram> <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
 <asTYlWdkrlci37FB@parshuram> <CA+_ehUyGgaodxKH_RddpaUXS44w=eFpediyQqEYhvJZ8LBKRRw@mail.gmail.com>
In-Reply-To: <CA+_ehUyGgaodxKH_RddpaUXS44w=eFpediyQqEYhvJZ8LBKRRw@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 19:24:49 +0200
X-Gm-Features: AclHuK8pxC9pxYotACGYDKYBARoHU0lbaBRjHN1fFMlOwVi1z9GLBZkUdQVGwFg
Message-ID: <CA+_ehUwgkXVoRHhsk_2mfO-6Hpd0fytcVN-7ykgRqoWsrV-b7Q@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 6 ott 2026 alle ore 13:25 Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> ha scritto:
>
> Il giorno mar 6 ott 2026 alle ore 13:16 Vinod Koul <vkoul@kernel.org>
> ha scritto:
> >
> > On 06-10-26, 13:07, Christian Marangi (Ansuel) wrote:
> > > Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>
> >
> > > > Okay so we have a cross tree dependency. I would like my tree to be
> > > > buildable and not depend on next.
> > > >
> > > > I can
> > > > a) get a signed tag for this from clk tree with the required patch,
> > > > merge and then apply this series
> > > > b) postpone to rc1
> > > >
> > > > Either works for me
> > > >
> > >
> > > Maybe "a" is better for other phy driver? The pcie move patch is blocking
> > > other airoha drivers currently.
> > >
> > > What is the procedure? In theory just the dt patch is needed, nothing else.
> >
> > Please send me Pull Request with a signed tag from clk tree. This is
> > typical workflow. Is it soc clock on common clk tree? Stephan or someone
> > can generate this and I can pull into phy/next and then apply this
> > series
> >
>
> Just asked Brian since he merged the 2 patch series for the clk.
> I added you to the relevant mail.

Hi Vinod, I wonder if a subset of this can be merged in the meantime?

Just the code move (second patch of this series)
It would unlock sending 2 other phy driver that depends on patch 2.
