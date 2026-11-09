Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794208632;
	b=yC0gQyMRyr8+GvZJdAM8WOHwbS4q58sL0T3qIn/BbRu70umtbijDhkAJW6jvv2BeaGDN
	 IdTJSphK7twhTJZbRYZBvrTj+YlV6CVSr6xWC6a+ZsSuP8kE9drGJ3hcMvIaZ2s2GyDuq
	 RWVlFGVsSZRcqeOWa7Y/4kpizNj3Wvoe47pF4GRHxxX7VOQ+HMBbrtdOq/UsPH0BvXOXf
	 Au5Va3Wncg4KdvBp03FzxKOKFF/eVCJx1QAuXsQBwAwp8yaXWOHQP7fApyq3Mprdb4Tlw
	 HjtG66D4/fBiW1RWyc6KxxP23wwH1vpYm+cqLDNU6HqMuXvloV4DJDMI9YSFX53hd5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
	b=P7opsncaTBPNIagRa9GBoGRsOhlDsxEl55C/dc8OsFwDUqk750hiZ0CUapXAUeKb2PjB
	 aa2+OV3YGEp91y7pSPidw9YSq6KeOubekcqaHK+XKBb1PeOaRgxneLCNaJunxmY2R+JJW
	 7Ck0+QH6ePbwKg3SbwHB5LDyS/1Px6PVSd7DMXwQgszebUda1olmMZD9L/4TvxSrrUdXF
	 GqURr4ulqnx+ROOnGPTQ7DPZ++ewzXx7hC/34SOk3DFJqDmP99x5YhS809ZHq3ep1FVNZ
	 r/xnd89ejUhe/vUMrHHOX0CDsrSuIHTBu2KPRzzFeaSURw1gy3+IOBPiDRhH2ch0wNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ak04tw2M;
	arc=fail smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86667606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86667606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ak04tw2M
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b3402105b9so2970547b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208631; cv=none;
        d=google.com; s=arc-20260327;
        b=Wem2/cPJbecSRghJ5xWmlSllkUsTmh6IvCaC4Hu49FVtEIH9P3zbCFbNijL2NIP6wt
         dDScSod4qszd6yzZwe4OUPLdtr+gj54YY8TkMglbLzrxdi4puk9D3sjb0iDaYmZaZsZS
         D55fciAD6sAX3LRPv35Z+0wFAY6CdX+9DTiz1+0v9aa3iys4ldv/sw4ru+RvzwWo869y
         wtx4/scgcVFaEWCfOMXgsNuSb0fiazOJyThhFEnSYaaSHErkW/hkG9ceuU9hQHD+n55U
         qfRcNW1JEtXz2Gj2pF3StOACTxnLZFMgvCDLPLcXAdxqVU1HJOzbLURiqBrXkaYfqKcH
         Oe2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
        fh=NIDR8crbDNWgx9KR0dv63w8q9QP+TdZJaliAs1ulhN0=;
        b=darQzHuAcSqmm4HfjN0smqAqbFgUV89X9ltzqbmu42JCW8B2Nba2cf/YAtPPymD6AO
         WRH1yuGCP/Tzknk9TRYj2Xiw5cQFKn8AB03rOzIsiLAUQPdNlaEDy7PgUX/IXbM0kUrV
         w4BQPXBIEYmCZsZV4nqtzMADDVyekdJXWl1mrWyppInHxDt5W/zKx/x+bViXV125hLWV
         7SmxpG9QYvU+ITnJQjdkUqzeLEcylNuj1xtv7WnbBjxL9xjDO0qdR0ma4xO/2sV2eB2r
         95rZ0L0SWe/vrEZqDILU1a4mFE7ox10532gfwkazdN2c0dCBkMZVloRMTqo2h/dJb5Gq
         PPHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208631; x=1794813431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
        b=ak04tw2Mn++2xHlOwLTyQhYjWitumxxJdeSqLBSApNcn4ohDtl9yCVGfcBJIlXg5rV
         kcLmqfpcRcTUw+2KK1gK+9uE1BtIWgFgZXoqIrN6BT4K7YoFKNWC2dowPoGLMgZtXJK0
         lo8xpwGvvNoii1Jw8TIEvUe/eD0zBgE5pamTrf4WxPLA7HucCrTcYuoIWzsMVeCgXAhF
         IDZFuK8QDBX4I5Lj5DMmrbLiDSIcam1qDNWsZCAzMShGO8eytXbSxwcQNSVONbiyMJs0
         Mib6evM/SIxgnFJw+Ge+d+9I0vuZEo+1wHnmxPOSf84w6sPP4sJmonUYiZF/ISf38+lZ
         krpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208631; x=1794813431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
        b=AyiqU4nL7B9fTDdjHXYqhLxrAcWZs73Gd64i2esWMPzM0AelFWQKawsFO3/vdVxner
         iM6X4d/Q2uk1UTqzi+PC/udp3RaztUYTEWD4hQ9ykV9tdhy+yuloYqvOIavWj44hTvuq
         TyPbjjyPVuPY0c/0tQnXfxfrHAFgNPe76rFs30lMmlL9GxWQbXDBypXblhPMO7eXWAvi
         2cSQq4W9QmZJ+KKj5oVSctU7jYAUYV4bwr5l4di7zfkfayTvGu2qQehFv91Zl6DWslfq
         IO7j0teh8tVjIZXUG8RHzpheVHD599ifDdk/AN3xwuACevP2cGTNDqER/Ls/19M/Rjw7
         3GiA==
X-Forwarded-Encrypted: i=1; AL+hErFQu1PJaKr/YKBIJCS8npitqpY/LjpckuJ1VF60IdFZRi7uIaMLxO5e9XbEV3uu9kTiGYD30BVzdvOJUPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xDIAwK4z7oQ/eGB/+EO9X5A6XOGoN057qBgTpTRlLJUrKazuT
	/Z+GIw0Icrp3qpZW37kvVGDVNdVfWvxFBpFLv5j1fb4HsQbZijYvD4AtYljAYv7ASum98GMx1To
	r08r1VjxVVdQH9JafwZc3tR40Y1mubLLvgQ==
X-Gm-Gg: AYBFou3Z8gdV98xI9Jbi7I2iEJaoF4pbv4Vl4zR3nt7bgS5ThwOjAGx4J8y4lBUFsqW
	ZA96L4t6jEfBwe5gGgcY39b1DoxMhDif4qj9Rf9KUmt6Hr9TyAbiFIr63cnSbHTpGrzlFnEaB2r
	Xhyh+ORWQF6p+OL5d/JCEq/Ps8C+82izp9dunApnWoI+rMJm3gHGL3gppb2hgv+NoR+1hZQVHRx
	KN64JGjrCf5xQwyV8rVDMbu17s8oEQ39TwsyryhoNGlgeyj/LEQKNuhdhTTvejqcX0KGvAVu1x3
	OLgLK1qLhk9t3wy7eoUYsGbW8FxWO+NhU7T92GRFESKRv6syg4pJ/VBAsIwd2p7Jq/C7vVojWCb
	fyAXLkUlyoSD3CBLNjP1zsHHKMTatDPvfdeJF9O/sVkwqUnvzew1K4wiZ9xmzJo9l6ItRjMk1Es
	wYzSVoSkObTNcE32uq7GH1q3UoGE3Ko9wpdWgCp8lTylM87farh1DPib65dQCvBkp+ufDkvUvFA
	TfCH5/Jc1GpV2hbiiDKZAvC1suWB05EZ8WIG/M7dDQu4TNhJoTiEViUNH9VbQ==
X-Received: by 2002:a05:690c:e1c2:10b0:8b3:5b88:a200 with SMTP id
 00721157ae682-8b36cc11208mr12210177b3.109.1794208631674; Sun, 08 Nov 2026
 23:17:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108122840.85622-1-lamemorupisi12@gmail.com> <20261109061223.17144-1-lamemorupisi12@gmail.com>
In-Reply-To: <20261109061223.17144-1-lamemorupisi12@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:16:35 +0200
X-Gm-Features: AclHuK-khSe0RY2oOjw5lfhiP__nKv0BAQPXQtNw1CLUbmOomaA01kYuN2YE9Zs
Message-ID: <CAHp75VdiqcjyDaF89s1MSs_Wrs0QomWdsm1fTcLmhEJWspoH9Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Clarify MIPI frame layout comment
To: Lame Morupisi <lamemorupisi12@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:12=E2=80=AFAM Lame Morupisi <lamemorupisi12@gmail.=
com> wrote:
>
> Clarify the description of the MIPI frame memory layout by
> explaining the meaning of optional fields and payload words.
>
> Leave the frame layout diagram unchanged to preserve its
> existing representation.

...

> -       /*  a frame represented in memory:  ()- optional; data - payload =
words.
> +       /* Frame representation in memory: () denotes optional fields;
> +        * data denotes payload words.

This uses the wrong multi-line comment style.

...

And as Dan said, you missed changelog to explain. (But in any case
neither v1 nor v2 is good to go.)

--=20
With Best Regards,
Andy Shevchenko
