Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494C51FCC8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803754; cv=pass; b=SCtAsp2y36pzAvjfaDBsukaP72QK2SZlXKL/gvnVSauyIgAdtxu+vhy/0dROmXKDaWIgqQLEiMzAmf+SCROQy26W4I6v4k9SMlIV2l2Q1ZRdVBcuyx26x8mPvyspqopjB5nl1MUsWXWopn6Ww4nagbVPfb3Yz72/kFNIjj9lBNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803754; c=relaxed/simple;
	bh=VTn5xM0BByZGDzeaW7HKnMpQYAJ2GObAR+ycPlMJjRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgNBTfVbIzbPjvQ/NbieXjHEbJW1RklKsIMR4iYVxc65jwmKjl4BYq5ZkkpSBhlCdRsRrkXArbU4CMDkWF0QnF6RHQBvjqNFJGNtGMWButLEIUqSyxA68liYV2yEVOpHf9xd1rdTMKhhoTCBj/+4E8D7MB9eSOAweVGlNpL1MB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC1ZcTx7; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC1ZcTx7"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c262bc686d9so366627266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788803751; cv=none;
        d=google.com; s=arc-20260327;
        b=a8f+80fG/iWSZiev7sdmPTpdzKHFjPFN8A7/ugbqopjxCvzc4DHkaGRDj8m/U+EHbj
         VKxiwVPsBgOIJ5PO63CBxmYMPJB2sOrad/zwUSL7D7+LGeUnMaiAUxEyBHlNX12Idwgl
         9cAICRXSSQBb8J0pxIn1ZL3i1IC7XWc8ebcV+zPlzWWhGfFxJCvzDOZluAYaftrXcZxw
         RBFVI1WFyT4b2ZET7rpMsVmrpVg7+iXRhbEbYRMf0YGyCO8Py7hVvLXiAw7HSqi6r5AE
         t+evxTWhDM//9rG6dV+sVr7AByHmtf79bdtaTqFUfAEwkMDUGgKn4jgEafSJUzpty3ro
         KF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncQ9wxRqAVfRdvJQryVlL0w77BiybYqrTlZQ4e8MWAU=;
        fh=SQOHU+la9itmW3e8CYcKNWrfgXrIKA4esDX2iHQv7P4=;
        b=lOKWny1N4EZ4fDbbuEG4oLxteVEqlXVxe9bwwCRtvc+h2CWSJHkiS1EqmOOrmBrii9
         qklLi2YNCaaKrikwH8Zece0tGphZBPVYn6uZY5akxJz+5w41yGLT92mGbz6XKh0VnA1g
         s+LNKiePImyMAfSCa9i+oKSjtM3c5SUo284e9i8U1fVak2X+WIQ2Kr+SsOfVOVlSA5xC
         X2V/YvGAHpKV14ltlZMcJHFDWBqsfYu3dwZ+z8nqGrPxBzau/hxGXylsNP+S00SLkKcY
         9SRpPPmjjqOM7+nEl6WNJ0kPLUX5CDDNnzTd2DXLHQi5P3Xf08QyLF75SwIBjFEY6gI+
         hK/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788803751; x=1789408551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncQ9wxRqAVfRdvJQryVlL0w77BiybYqrTlZQ4e8MWAU=;
        b=mC1ZcTx7ZNrghiB4QCLccW2esf1Z0vIYX64L6sL4eiPFJ8dtoYmtO6/R1us9T0tpHa
         1xwxW8bBZwgZ+73+A0lNfwQ/+scn3PyLiO/vEHyDkNjtMF4ldxNFmOxcVIdfy/scxMOI
         263sfmIy+9vl3F3c1VQCJMNr45jQgRXT6MXRV/eNcbRf6pYTKa3BINowhS3HKFzh+dgC
         g27fvMfsP8eA3SQxzD6KWd0sm+Shpy8ymppN+jc++rHnTzuqxcUPQJFtTLAZlCmvA1dn
         /V+gt0jBnu68Xs2QsJRj/ihWV1eZ3Zl7qUKoWNUarPSgAJY2jH7bBoY/92QTksoxYMNg
         L6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788803751; x=1789408551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncQ9wxRqAVfRdvJQryVlL0w77BiybYqrTlZQ4e8MWAU=;
        b=pKuZYSus7tj0R3FUh34WQpihjOuDFltuOivxfsbbCucbsQENMn6VLgu78bHG37Yisa
         TPW21hDmUfG2pLYp1/v0tGx2LO0rupvyClnTIXjhGtO9kMFmCHYnmPgJkTQ8jjyTxZlK
         xZIWF6utw9VvcJ8DJagfXpSKkxQNK7RDQQgvnUE9c8lvaSZoi9NyNv5AEpm1WSyTkHlF
         EaiHHlTibfXoX2gt6XHGiZAWWCB7PXvYDEQtnXTzZapL/LOVS1piiQQsiGOrjReBo1NW
         sLQkT9MMKG2Wfw2TtY+DDUAE/rz68teOz80g2AAdaN0/l0ouxPxxAM20cZ2Qs4BIXw7Q
         9qwg==
X-Forwarded-Encrypted: i=1; AKwUvBz1uq+DKwvu9RJrP0ABBFmL4phy7jjJrtZLfibrYQrdPSuSoKAJoV1xvA1WDMY/mdv/sre0y87s9R2RLLk=@vger.kernel.org
X-Gm-Message-State: AFuF++nZZ8DmO8Qo8XgT7sVMrIkp7WVbtxy5W7e7oJAHCd+U24rZtOko
	F8WTW6K/ZVqiFc7PMvLIld9NeZ42Lsy2MpVhKVU7Lxsjtkx1iXyN5DGjR4KIdLwLtCdTjgaLcW0
	3nP8kayjZ+xJIRuxv5uhWxAsCFiqWl7M=
X-Gm-Gg: AYBFou0fOO1tgP0Mfd/6FXxpimaV3qXXw9L6TP868y+WKgEx/fP44Ym5JR+iR9YgJ/K
	gcbAsEzOj02YWWIGXT8xBPIjf/w74/wvoua+V61NB+4SQHQux9wYob5bKO397y/1eADz2odmiAz
	jA3xrqCzKA3uZ4yuQVVpqxVTjG4FFefoFGz6TjAcF0SC8Vnkad5CMvN4s0Nuy9JVTQ41Xw3bU2T
	KDcneAHBrwhxRu+JA4NBmPoK6/lVn1zI0Kdmz66EdEmAfNE2FhB2Ka8JnOHaPPD1YQOcq64an4W
	fqXgbkPkyyHvMKE5TqKUyM7j/ALLUL3MJ7cMUaVLmZCYf6xl5Y43BhwMPlOJNPmxJGGVwrHTK+S
	7AhA52solc7Fc4GLg/lZpzsh55LcFkYNiHjyGibudyFhuHL9FLtGGCxk9uZ7XM5EAnF5pV4y9KS
	t6esUpC5TZ0eXMdFvl+wHH7lipUQ4K5Q==
X-Received: by 2002:a17:906:7956:b0:c1f:c061:569a with SMTP id
 a640c23a62f3a-c260c7ad26cmr891917366b.7.1788803750800; Mon, 07 Sep 2026
 10:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907165033.8460-1-lalitshankarch@gmail.com>
In-Reply-To: <20260907165033.8460-1-lalitshankarch@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Sep 2026 20:55:14 +0300
X-Gm-Features: AcwNN1X4dW08JTgOmtGLWwxfBMjDqVtnJdTI6vze5rZDBBq6vA-ax46gyB9xRcc
Message-ID: <CAHp75VdsCtQ5aSLB58fXcJTpQDRkgXOFyhTjtvOMCfSyAp3TvQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Use C99 initializers for ACPI IDs
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>, 
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 7:50=E2=80=AFPM Lalit Shankar Chowdhury
<lalitshankarch@gmail.com> wrote:
>
> Use designated initializers for the ACPI ID tables.

>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--

These drivers should be gone in the future (and the regular ones from
v4l2 should be in use),  but so far if somebody is happy to take this
patch,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
