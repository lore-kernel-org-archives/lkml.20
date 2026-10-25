Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792948994;
	b=Pvaz5MhzAIfEWY4OguztngznfZUEaYie2hD16steZ9gFYRa7PDqyfISU+mdDavvzfMDm
	 OMJ/hQIqlfFpScZsncNxBCjKowANrxT3ZhM/qTIjwTPakqYGvKVcT8RTN4BkfWQIfr1rb
	 pQezQhuqIVo+Grt8z79nbArG+wUhVWsseBM8La+dLL5nBix+KoVl3aaoMNaWo3UeTdFAe
	 V0lVk+gG/NkVJI5NeucJeWtW/tlwvBaLlashdt4FoVhayOKAN36miJ8XhA1MdGjROsd2M
	 6iggZKQ6vI4YBrPt2EeK8BQgIZwrJShNYrWToDiAiW2+cUPBnmk2H94JxjJpNCfMfeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792948994;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=uwwuvl4E7y86duc7nGUiwAAKgoOLNRImE0wRbyu5zR4=;
	b=Qs/7oGFq+FKScIiULYmWim+x6p2Y0QXMrtlIOLPH5uHlreK4YnHnHUznCOTRERywp+R2
	 wToKZcvB26C2c85LS7hHqpmLdvuCcsRAzzTMKjlWzXJDqZh/qGjLk0ceQ271Vho0bCEdq
	 2kEA+jBZmokeUkRFhgPL4pZmxiw6ap3bxPuLFFpap7cN62HP2uFTGD/FwZJ1Isx9XOMYa
	 WsITTqlclwIoARvbeLYoUS4HqZ6By7n42SuQJ/EEhjb3qm2RhTDR6fjxKrJnsawh3d8B8
	 W0l95xgvRFwmL0xxaJvBe8Bx3O5Blv0l1itBJi9DLhxzYdcg7uuy1a/hyClS+mgZ2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NoUcjeFc;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394ED606A31B;
	Sun, 25 Oct 2026 17:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 394ED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NoUcjeFc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792948990; x=1793208190;
	bh=uwwuvl4E7y86duc7nGUiwAAKgoOLNRImE0wRbyu5zR4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NoUcjeFccm/lhpEFXdimQ5+aawNrpECwnHHYRD6mbKjrQEuXBw5gnys5yWjjsCCTL
	 ap226cByr3qPPRPwR8t2X7LPvwaQ177JpkhA0oqs2bFQSdJXPoRodJhyvVNtfTimT9
	 0mmYoTqLDGerwkhjSwM6At/7QbEQ0rK3KT/xh3SzCUZ0jxheZKsxQjd3EZY2uSXgZf
	 hBdcXF8jq9PtTGeeTTkLySPNua7uzbLKRwxwMDbWuViZ6pDwUlu2FhfYabHmS4k+qQ
	 N6STpbQwp9IUY+FFF1D1OtdIlT2Dj3A6+qUhd8ukeKmfI7sZ+su8yFrKFQooJC4k26
	 GiVD5q0S2Y4Yg==
Date: Sun, 25 Oct 2026 17:23:03 +0000
To: Fernando Rimoli <fernandorimoli11@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, "D . Manresa" <dmanresa@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: ipu-bridge: Add the Surface Pro 11 infrared illuminator
Message-ID: <20261025172251.19293-1-lsa.uz@pm.me>
In-Reply-To: <20261025154743.39801-1-fernandorimoli11@gmail.com>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-5-lsa.uz@pm.me> <20261025154743.39801-1-fernandorimoli11@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 0a8ebfa1d6884147165f3aab5f7c82981bbe9062
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fernando,

On 25/10/2026 15:47, Fernando Rimoli wrote:
> The property entry keeps pointers to both its name and its values, and
> here both point into the module image: the "st,leds" literal and the
> static const surface_pro_11_ir_gpios[].

You are right, thank you. The only other name there that does not come
from the per-sensor prop_names copy is "lens-focus", which D. Manresa's
v4 moves as well. So v2 will do what your a20c843c9bc4 and his v4 do:
"st,leds" goes into struct ipu_property_names, and the GPIO numbers are
copied into struct ipu_sensor.

> Manresa's v4 1/2 changes this same line to use names->lens_focus, so
> whichever of the two lands second will need a rebase.

Noted; v2 will say so below the ---.

> The Surface Pro 9 needs an entry too. Its VD55G0 drives the illuminator
> from GPIO 1, as on your machine.

v2 will add it, matching the sys_vendor and product_name you give
exactly, as for the Surface Pro 11. I will Cc you; a run of v2 as posted
on the Surface Pro 9 would be welcome.

Sergey

