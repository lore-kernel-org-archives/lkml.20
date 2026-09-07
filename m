Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3651475A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801900; cv=pass; b=Yr4YG8q2+bkHtq0yr6AEGntJPrdttplV0fhtliDqp3rD5+lDvRX0IXoOOW9G9NWqLuF7Y+E7kwO2iAvZ8k/HQpewT0oZEA0GD3jGG8nMlQHKvdRRzuA2DXF7H6Rpgy/B6mSa66h0b6PbLbpDI0PJC2Ne1zbwh+RnUsSkYUGi62o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801900; c=relaxed/simple;
	bh=oSNTQCPnILUw/68+gMk9HV9c3gowZFlOqukTFVtyVLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBAH5V+FJGsRfv6+ZLrKB5iCN/mnEigirS3OBgdUXypujoXueydrB7o/KCjoES+8rIggnh46NjHHwSU8teM+DhQ+ehxt22XLNVGjDevpkQGw+0+MM5cPt7FD0rJ3OvFRNf7oKyYmEAiXFWmuuISpuEwf7z2JcWuUBdOsVPL4WgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=A1QG/Nev; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="A1QG/Nev"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c253425b253so543198566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788801897; cv=none;
        d=google.com; s=arc-20260327;
        b=UcJUf/rftVfNCUUEMu0jQehtDu3y1iKp8HiGJi5yqd5lqX/6Hy906k/dCuVKq6pLnU
         DcmyMJ8JxBOZBNkLXHLs7a/mcdMXCJ0VTTgV6pYD1cpR58xday146b3mNHKWZghzX8Cz
         6xoDrACDxO4NIrQW8bPSLlboIMZON8kCN7qchvCQiEH7tYAv2oJMyPLM0CAZPDmgoznC
         vPlyF73cdOjpQewVVSeu9ZGnsHWFIV7AF6g9RZQLrUuDVHrs/Y96vkgNA6FDzU4yWLEX
         mi14pR0/OdvBCpBIrESHy5Q8aTu6qFVGJwFNwOvN1IlmoPRoYGhw/AU/iwO2p8f1OtHh
         RFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3tIvk9tN/HCp65ng31snFe+b+/Er/ZIovEHg1XgPvOI=;
        fh=dQ3LWcDyPe+OQILZ/wWdaiTp9z8BFjriEptZS01VgAk=;
        b=YBFW23fvP1jIkmNrXgsp5sXnk5r+9h0HUxiMiSDC6wBMsnn0/pYYPW6vaKYr26zBJv
         PFdgVLx12B3uWAy3kFmSWZFh8gPPAHnYpkU0xv3vY9Wof42H0MVGGaK8fLIZp5tIwt2j
         jT7SZ52PPGronirQ6uQ/+77eFb3OUGUJ/MN2sbenWScnBH46YHUyq1wkWeGLDuIhxMT/
         0k5afYf8RC9qzD4MialJvIdyzXWGq2fqztxb3ZfBF4N1LA8PjdatNH3RgrHQLdAL3ey6
         3vzGYtorxJCrTITj/HV0ZPeG7yv6ZO06zuKlI/2gXHcT9lwZPHxcTDcUrVNT3dl2uaiN
         F6Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788801897; x=1789406697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3tIvk9tN/HCp65ng31snFe+b+/Er/ZIovEHg1XgPvOI=;
        b=A1QG/NevHCnH6e8hv793ehDowSCePrIRi3pjhZy2atwXMBTcADEZ3uSHItpYb+9orn
         xKuhuM62b6QlFRVNBYG6cMzxgF3Ye71Jqg7LuuRBVrBSeo4KCUnHTVUnPeAFY7On2EZ3
         NtsdRatMjjtTAfDBxrS2J8qQaCFIXFNflIYfKYmx1MmJpy3u8EuRHE9lamcO7NlqDxFp
         7J2lXJ4H8hJVSmyUYc0BH6hNp7dsq1HypmhqWB++UHF3dfDngR+qUm/XOivo54dXzUPq
         64Rmp6fAt0ATMidt6eGn04xef5x/CTwlooJVW4vFfqVwBoJiqxgXHFHjNOX/C71yXNbF
         ZKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801897; x=1789406697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tIvk9tN/HCp65ng31snFe+b+/Er/ZIovEHg1XgPvOI=;
        b=hG5SOiO2sS2SmcqyhSPlpLnZA0pVYnubGzr8IWEB+RBhYVEF+vv31jx4KDuZNbbNzc
         myVsmJoDzGXVotCtQmky8l1QTmb18gHOPvtNdaiSB11P/MCFU9cCz7MP/AJl6+/Z1BP5
         VSbh2Zp67B25yxV6ddzDiDDiy6f478/PsbZ07wejlUpkGeFofb1X90QgJ9WTzzfdXM4e
         V+sYK0/pqCSYcrN3006rCsgfa/lhJMNtIvtxt6Tox/LLOP4YQFKAcCzCzRaOvZskhazy
         S8rWqIhKQIsKMSxS45r34WH0mXWgQfJJBa/lGRJmmxffjqQOTl6tgaG4BCmTfKRGX6Wb
         nmNA==
X-Forwarded-Encrypted: i=1; AKwUvBzFofffTn3H/jozKn/dmeEglS/mN3Du8uzdtxEupgR7asbMhuJdUn4Xm0XDlzD7frSCrAkrPHYOnLEHWws=@vger.kernel.org
X-Gm-Message-State: AFuF++lugYIxN8SHBSrv0pv0CsSIiFSTreM61DNHNdNOcGmunxpRHaiv
	pSDzYrrVfeKi15ADC1QmAozRQxazcLgZkOB4BXzdLW/N7EO7db4GXqYGN1XvdxWnwWfECVWvTjt
	c1c2Fl9hx3+fKHVwMctf+C7h5e5MwFri/RchH1wkVtA==
X-Gm-Gg: AYBFou1gE5V5+8HkUcrna8TW5WhMzHHH/ZmgHW61TM23dwp9Cc1QW743YbEKFBSeUya
	M6rBEV6XT8HLFm4JS/k/mou3B5qUP4tY5kDsf1Im0JGsH9LN8fSasonJevZ79Gk+gQ9lcmQqhhp
	m8SXPrO7HpE8eV+bE8hKvsg1ptru8657W/f5NVzwcxvBsLSiwlVrvCgNwQp9605YYq/EZTbWmew
	aZCx6mRj0x7PW27Cp/t//Eo1QBYHzLER7zR1NEaxrvlXwcLWIb8SWKv9onPk4Pe6Idufy03ze4A
	gD3fsoY1n+IURVof79s7CyHytsnJd6v54v+nf3ew6aulBHClgzCNuSEgOHUz9hXr/hNhd5Q1PXX
	niA==
X-Received: by 2002:a17:907:1c17:b0:c26:19de:9ae4 with SMTP id
 a640c23a62f3a-c2619dea7ddmr757639966b.35.1788801896232; Mon, 07 Sep 2026
 10:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-bq257xx-init-v1-0-1a08b29e1a68@flipper.net>
In-Reply-To: <20260907-bq257xx-init-v1-0-1a08b29e1a68@flipper.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 7 Sep 2026 21:24:45 +0400
X-Gm-Features: AcwNN1VZBW-1Mt7kTfGFh2RSUKZM_MHn3RKjTl1xYyYe5M3UAavFebV38etJD5c
Message-ID: <CAKTNdwH47P9K935fGgnq0qaaNTbCuBNo+-ibVf-=vRcA01GJMw@mail.gmail.com>
Subject: Re: [PATCH 0/5] power: supply: Fix probe time race against driver
 teardown and battery parsing
To: Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 7:01=E2=80=AFPM Alexey Charkov <alchark@flipper.net>=
 wrote:
>
> If a bus holding the battery-equipped power supply goes down right after
> it registered, it leads to massive fireworks as the driver starts to tear
> down its resources while callers from other contexts are already eager to
> process events using this driver's callbacks (and their private data).
>
> In current power supply core it's further aggravated by the fact that the
> battery parsing code expects a psy struct from the caller, which is only
> available once the device has been registered, so the device gets
> registered with its hardware constraints (e.g. charging current) not yet
> fully filled in.
>
> Fix the former by preventing the unregistration of the psy device before
> its callbacks complete, and the latter by providing a battery parsing
> helper which doesn't require a psy struct from the caller (as it doesn't
> strictly need one).
>
> While here, fix up these and other adjacent issues in bq257xx where all o=
f
> it was discovered.
>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Alexey Charkov (5):
>       power: supply: core: prevent unregistering a power supply while a c=
allback runs
>       power: supply: core: Allow getting battery info before psy is regis=
tered
>       power: supply: bq257xx: Don't ignore errors from bq257xx_get_state(=
)
>       power: supply: bq257xx: Use psy directly instead of driver data
>       power: supply: bq257xx: Parse battery info before registering power=
 supply

Sashiko gave valuable feedback on this series [1], which I'll address
in v2 - except for the part where it thought up a non-USB supply for
bq257xx, which the driver explicitly doesn't support.

[1] https://sashiko.dev/#/patchset/20260907-bq257xx-init-v1-0-1a08b29e1a68%=
40flipper.net

Best regards,
Alexey
