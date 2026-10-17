Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFC937F010
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206849; cv=pass; b=QLWNALG/KWrwgKEBcpEDjrWknmlpVsuHNAG7UbgC831lXfMuILuhQpY65U7Sd9hNxhjHEWKcRdBCVEEqqaoyDPvQGh7LF3R2xwXhp803dAhLFYTcJrs6YY2Pm4D92MMmLt+3kzkc0m49qfoJfcG6Cdsx/AgSm77fbX9DPayIiyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206849; c=relaxed/simple;
	bh=fGTiLkJMc6CB79F4NW6H2yOC3eVPLI02YFyhhCI4mH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTO4rd9LfdYoGW3e652xjSy29MAgZpBrxecu+DINDi6g56nTyBeyr6XpDMzKomXcOJWbmXNMIAaFRMm/sr2FHI2qmmz1bUUBGztfBTY+xXmBl5iZ1SrwuizLfwYHYGXGIU233NkY7Rwm9oaKGXX0XgDSPFTL2zapfKP9CWmoQIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXl+CIHO; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXl+CIHO"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3aae7df0971so3014551fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792206846; cv=none;
        d=google.com; s=arc-20260327;
        b=A8ikjVGJsYoAhaWbMWAtDMzk7KgW2U5kjuxGFBH/5P3VVLeRb4/8rW4dFbiq+3L5VZ
         wN8BruZyTHVbIIpbZvG+lqMnRSpNxz9ojh9BO6H4r69QbiH2Ay98LQDV9EJxA9LqZeIq
         B9CXowyvDVzNmlo/2m4aT2G0XUw0FVaxOsNYtUM+qmcr9H04Mbw9hEZ+2wqfE7nGZnWw
         1O+n54amurHeMdwrdbFtal9qBljEskXnv52DwqCu450iXdBw4iJJrbwZS34Qn62+gJ6M
         0OKPi7I/4A5Bl0LjRcG8K/+8ctnH2wSziILGG458w6ptCrj/eMGz2jYA1BrDkG4wO4ni
         bAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fGTiLkJMc6CB79F4NW6H2yOC3eVPLI02YFyhhCI4mH0=;
        fh=xM2RNueoAzdkl7IJDhsgePOcKACgEMfEiobrzn9e1sQ=;
        b=rLzFlVXx3J1LArM/Gbq/luUHHCoDd4yRoEjZswvQkhnaWHVqaMwPc0WmcKCmkGb2k8
         b4AcDmeEnmmFzT94PpbAriiGHOnCAlUajfxPUGP0xTnXzgRQqYHewDXMg30xCm3Bzpo4
         CPpkRNhSR5UpOhEowJw8+4iNBmGnkHMz9tZgSiz2iWKqQM9ylr142bov0hO9c9NjRkwD
         paqofzo0sy0ydfVsul8uJp3qLLdzRICF/oKamaDH1DiC4pV7RDXhLLnnu/LY6W9to+Hh
         L5yEMiQLHNzbbRnuyrjLoeoFv2mtsr0bljfKVcmf4Yeduvkv1j7CU47QQYGksirnoSKZ
         7vpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206846; x=1792811646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGTiLkJMc6CB79F4NW6H2yOC3eVPLI02YFyhhCI4mH0=;
        b=OXl+CIHOj1hMI8kw/SyT4BIcnY5v7RpiFl7zt2KqtelZ/9teCMQ4KatucLpjKQwQWN
         ET7VnlbPTUv68KVHKQ95C/uInMxRlRUm3dp2CTqTtLAPXXHwTClhDMJZyersMq4TfUuC
         Nu+tWJnTn6OO5hsSv7GlAt+1Ju58LdE26EEpUVxC+OiQ1FICu01W9kGFNJLeUfF0zuny
         Fu8b5edS1p+tL0qUU/qHLpmy1OP0Bw7fPZyoziFjMPxSavC3Pd1SvfC9V7RDQ7yfOhS0
         SiG57QuU10zg9fEiSu7oYBKhcQmzCBQEJcAyUzc4Rsr4BV8YvrwyRIz/ENhn894iDInP
         Nx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206846; x=1792811646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGTiLkJMc6CB79F4NW6H2yOC3eVPLI02YFyhhCI4mH0=;
        b=jKsdcodaMyTqMtO91MLFtX62r1X4NMYZomgFvJDK3edGRa7tfin7cgE9+k3UqWBadk
         6MkwnJqUzKHcSSsEb36Ug76s51FTrpjFoVqVQQHYqFBaqFINelZhFD+byhke1k+RKo3Q
         VJV64irBYATA/T3fYuD7iAOa8nArSwJ0QuLIbGWSP7IppEB+9DgGK2RUo0LQHxOXjQkZ
         FB28lVQgJlTh66ET7umegU0v6b6VSigd6ZhkozTJGx8DSwX8uMhbjFFZFzNrexPpcLC1
         YT8zrd/1JIYndQLUO+4/F8fvvKInt/JRW4KxhAv6/QI3zMgr5xL2Qg2dCTTxLLacD5xp
         l/9g==
X-Forwarded-Encrypted: i=1; AKwUvBzGb1iaprUv320mkuxKba5F9SmIRwgPSQw4x+HZ73WER5KfQT/CQbFywQIK/8zIOso85B5KUjRODuyMhQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT40xmAlyAM6esKbN7wLcipBiQBMDI8uF4ufiQpYXfOB8klMoX
	2WimuN7Iz1fg98ugVS0mSQowz6Ra4XiD7LdS/O19NLJ1BEkU+LaELkGuULldOwwdAatcM6hA7Gg
	I19Z7kmcE9J92FQkGe3yeuLJQSBIyrcOBzQ==
X-Gm-Gg: AYBFou1Wh0W9DgBA0tkfYfecuFMaxdlBV4SK9VPfogElw9YcXMiGevGGBxLNjyPY8A7
	WqTDwAFjV479gkSJ2dGFzZt9MF4BjzDL/LIBtirMNLTHBRWCgRSBv8NRb16JyVD5/7M4aeU017y
	+nn8FMgfEhimudZi9yyLykof4F8iTA/FCFraFT2j9uIQFPeFAxrJhBDwCy+XcucvpcbOUsfl65h
	SA5qlmbPGNrfc/tY9FO0Z2TO1CXWGZjr/2spAKKuHJlyfueq0EYHgBFtSJYKMMsndzPljpE60Ey
	ats7oMIHBuo/cPZrAA1ScH5QJ14YrQxf4Ij1cKPCrSHQ79DlAYJO+EAOpa9f0IG27M8zFcTTJot
	SZJjTArhK+YqaKlsFwW3xfmgCG82kzd4svJjmwg==
X-Received: by 2002:a2e:a9a9:0:b0:3a9:8450:813e with SMTP id
 38308e7fff4ca-3ab2928bdc8mr3488321fa.20.1792206845572; Fri, 16 Oct 2026
 20:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015102353.999695-1-linmag7@gmail.com> <20261015102353.999695-6-linmag7@gmail.com>
In-Reply-To: <20261015102353.999695-6-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 23:13:52 -0400
X-Gm-Features: AclHuK_nrS1feP-_qqEt73pTZT39OWgFXhvUicsqBS5iTw5OJ7sNZPJxdgNy9TE
Message-ID: <CAEdQ38GpjWZKGvDHJD5Z=g3aPm7SC1h=ZzP4o+6Df5wCgj0_Zw@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] alpha: decode Clipper environmental events
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:24=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Restrict ES40 live environmental decoding to Clipper. Validate frame boun=
ds
> and string-table masks, and separate fault bits from status context.
> Report valid notifications even when no recognized fault bits are set,
> so door-closed and supply-return notifications remain visible. A single
> status snapshot does not establish a recovery transition.
>
> Keep SMIR bit 0 and inverted halt/reset bits as raw context. During the
> ES40 PSU cable test, bit 0 remained set after the individual PSU failure
> indication cleared. Its polarity/latching is unverified, so do not call
> it a current PSU failure. Use mask 0x14 for the remaining SMIR faults.
> Decode only QW1 through QW7 as live environmental status, as documented
> in the ES40 Service Guide, Tables D-20 and D-21.
>
> Use plain door-status messages. Preserve unknown or truncated frames
> in bounded raw dumps. Firmware console-log scanning is independent of
> the live environmental handler.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---

Reviewed-by: Matt Turner <mattst88@gmail.com>
