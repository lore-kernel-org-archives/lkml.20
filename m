Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792991784;
	b=wiBUarEfwTUu8ekfRxaa889ukkUb6vdl/zsbryV+2CAINck30FRtvM/EqaE3PC7jgSP7
	 6s5A3JBr1hPPtswiD8fp1DTKT9FFcEhNFyX3XPq08N6j7dKLzX/Y/WRcXDisrW4xSYiTp
	 IR19Ynp7xjTUCjSiOXRRPp/MJMwctSHlwY3mdeguawRSjorG8pUe5iQ4jS2o7JHcP0IfP
	 vCFHMA5Y/bbTLX0nJfnUi2T6OTfY6wVJ1xZyMfP0E1UTraL+6tg9PGGqladTo653s2YIT
	 U181a7cxdeBBhJaoqIMnrUyigiEgWFoa7JLhP0F1VweN0Dx7rnJLlmnlc18EVNlbLHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ahOsVudUc7c7Un9O3y9zKqIgbSxfkYu+yvHVouvLUFk=;
	b=dVMre2F0MBUdeql6YwbHDuJWUkw5WyjkdSYnVr8Pojrb/yw6zx4widgTpU1APgwL3Bfh
	 loxy0iYKgDPLp3UdG+Bnk/uSvS3jVIPdKD4Q/YYjvoVTe7dVf4SNI3x411aA2S0nbee+7
	 XlUCEkvnkCIneDaHUlwqQR4k7soOaL6CpBHnqEJ6v2z+oM8RU8en2HDUHseVwq67KkLMb
	 XZQRkQk1RL6LV0DmZ4y5vpQsQmzpPJYNG5+KV5Qz14lXGW2tv9bzXS1dDF1Oz/LrtL7PK
	 U61cMWAWiPgeNOiLax8Lzxp+UpJtSBbsOuCFiSgCaM0r0Wal8zN/pnJzZYNBV31i63w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PQ2SpM7u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F4606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81F4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PQ2SpM7u
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c434376dbebso472944466b.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792991782; cv=none;
        d=google.com; s=arc-20260327;
        b=K5pfHlyHZwl9Zf89jA7lIRAahJHvYMVmWzk9U8IiSBVMAv5EadwYDB9EHJquVu0i5l
         i2CZULNktjAO6+ejXdMknMRMDV7t4s/dhRuNXSY/x0faI22L9dx0ck3pMdFr4jg9EpAM
         hRACKETyveIvM2IO8Dur4FUVlexy3T9DxdWvSXdRofft9ggVpiNwdHO+9xZJb7RSztJZ
         KPEeezMkkWm5UheFSbKwd8MQltWVzbJT2Uww5l94dCBIW1XdCYV67DB0DqNM2g4Ohelg
         53kpkeLw0YmgQ3muU5LgfYjRhKr4vpxdrZOY6YUzVMcdOZqzUPJJx0fGwxccqg7K0HaS
         BO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahOsVudUc7c7Un9O3y9zKqIgbSxfkYu+yvHVouvLUFk=;
        fh=+9qQ7xbqqq0Pgdn7wlUFMcbsqEabJoX3HSBJ8wePqX4=;
        b=rS+6psNbB31V9up6dAeXCynUI4H7Bb5W3G+pquI9yl4AO/52d0I2H8TzMqSfCMDSgY
         cfpntMq5L/oXyOPMKDuti8UFKLj+MrUio+4O/xca3t4aKyfubM7aV3J3bSs4YsFVdRVI
         wdhBXJDr49JLPBzxUlkbU74jH4HEaR1dCO4wYAad7hBndKYWUAEmmBOrDvRd2MtlETmv
         aezLakvGnQO13ssZCBW4Yyy0ubsG16QE5ML486g9VjrLC1z3XmyYU4x2R7An6C5hNFAO
         wnR949Ac8wtoKhtYz8HaQwYDtQm/Vr1Pe7RoGV9I52S87sr/I7aIGqiEQ1wa+BJ7WVvm
         zRvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792991782; x=1793596582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahOsVudUc7c7Un9O3y9zKqIgbSxfkYu+yvHVouvLUFk=;
        b=PQ2SpM7uqS9WHlEZYY7Xf+ANwxpo6Pdajhn2HOJ1DdtJm/nPGeq4afxXIMr1/D0MP1
         ZqEBE0YbnLXvvUOl5gxOUHjMwRYdV2O++fEWWPEwHF8pP20adYQjiRoJXhB8FjLAJbr4
         vIaCRcfHDK7mwKQdbDPFb+sVbhQzcjXA8oa65NvU3BNMqIAUP518xme/iTq6wXy7j6eQ
         xS+BVtRr9zQmDq/N+LW+aaRMQ5826kw+BNnfZmCmZsefZTh+Ld7rFEKIL0ghsEpd7fU4
         nQH+HKmVJthRcrKvvp+55A01lX8R+i8OYuFfufFg/8xCne27EwX2KXB0eUOYkQdXtmzj
         HKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991782; x=1793596582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahOsVudUc7c7Un9O3y9zKqIgbSxfkYu+yvHVouvLUFk=;
        b=166yvF+azKgRxbg3GQb/uxKMQSm/tW/xAdZPGDxyVef+XTDFbozdSy51502im8Go+A
         SMXZNgsfuwsNFcgicUX4A0BIWSvGowfMd5UuQP/ZuJ1sWiw5HGm7XAkruuMKuUgFsmOj
         OjJIGb8CQf3VaSQ/+ay67cFKqI68oTbi/KSKCBZHyz8zU2JB0MdXT9ojUl5eaeBxxS7X
         hEhciLAGHUPm9Vo/F+mogqG+weeX7q3QEzwJxvUiz78gN+98H3K1EK8Gd63jQDbEcjmV
         uFifESKcr40uMGhdSCIhPiTWHGpW6oDdp60kpuKPJeqX6ANtyNiRwvNovxoraOXt3Fns
         Kbpg==
X-Forwarded-Encrypted: i=1; AKwUvBwbkBAJ4t5HSZOAZZ0o0F7PQh6GrNxkZLVC4tSMn4tAOfe6rO1zkIGTEaX+Qu5Z79hnBceQE0zcoOc3cxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7BKu3146vMBm+OXSUDjWDXTu8+ZG1V9Y8If1oBBnKZC/awJCN
	u/rukH0gTbVRR4ux/08oajdqThwcIvbjHzagzDcsCTPthkyGsZIKCnChTK8yy2hEw864hc0BBkM
	FyGIwL75tzSp1oXjdKKbsj0GqRkO7bho=
X-Gm-Gg: AYBFou1VCxpwnW5nE8scQO2+k48YTmvT4cbr6aFrfzyJS9njQCooJ0hpPApb7Iiw5eh
	DvAnkNFMuxKHlSk9ITZJnH7OuNIPsSBlagqvalHVanGg3ZjDIlMbNYwY2w/L23r89/pXLtphkBn
	FEOpBWAtrNnTujmAgyRGKo6X81jr3OtkrOYYEymY4hDFolh32GU90kx/wl7EAU131uPJFPfyInO
	XPmc6pjHjfZCE7uDY8le1IddpuxTOT6Q1eGYq2KJr7QgKLys4ckXVWZ8pSDS0ysLC1Ng3qFXJo5
	lXIZsaOP8d9TfeTMshC8ycHYn9xwYRNrD/5JcWIO+M3td+Ocs5AV3xu7ldDdJg2zsFSwAub3DDb
	uF0mbTp6jGWpvx8d2L7qZ3E5WmDo8KYgqFnMKNAK4BrGY1dImuHZ4wGXdf+MSWwhrscr2BBK/Xb
	fN6l8ns1+TuWWzh0pQPjH8+qAGlQ/MXN7mDbA2VoxFfRlH
X-Received: by 2002:a17:907:f48b:b0:c42:bc58:f21 with SMTP id
 a640c23a62f3a-c46be5bfa80mr612811866b.15.1792991782008; Sun, 25 Oct 2026
 22:16:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024172641.19424-1-meatuni001@gmail.com> <at5d__q_RzGad7zt@ashevche-desk.local>
In-Reply-To: <at5d__q_RzGad7zt@ashevche-desk.local>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Mon, 26 Oct 2026 10:16:10 +0500
X-Gm-Features: AclHuK_gXUAQAd7y9XjGt8VKlv2KxyzU6RO9-KdAgpiiPwDIUw-cWtN014mbLq4
Message-ID: <CADqcGBmOxJ1ns87pNmaSNVfCc-LNsTsf6YgnnZ5i+x4+dH+AMA@mail.gmail.com>
Subject: Re: [PATCH v7] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jorge.lopez2@hp.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux@weissschuh.net, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

No particular reason. I removed them while trimming the diff, but
you're right that both comments are still useful. I'll restore them in
the next revision.

Thanks,
Muhammad

On Mon, Oct 26, 2026 at 12:52=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 10:26:41PM +0500, Muhammad Bilal wrote:
> > The input is copied with kstrdup(), which stops at the first NUL, but
> > the full write size is passed to hp_enforce_single_line_input(). With
> > an embedded NUL the helper reads, and can write one byte, past the
> > copy. Use strnchrnul() so the scan stops at the first NUL, and return
> > -EINVAL for a NUL or newline before the last byte.
> >
> > Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
> > followed by 4093 bytes of "B" to current_password 100 times returns
> > -EINVAL every time, without reading into the heap.
>
> ...
>
> >  - Drop the trailing comments
>
> Why? At least The first one has the same meaning as before, what's wrong =
with
> the second one?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
