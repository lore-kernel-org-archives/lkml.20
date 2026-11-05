Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874200;
	b=Uhz14D2CWqBt8h+DZlOLahCqiQ6IsYCo1ov3c5433wj+9CfKDPez2J/2TCqtllVdWUKE
	 3beyu7KZ1QIBX29OBd9lKnS6BJHvBce1xrzLXE6TEzyvhilytLN9WXDWXRCmDmkDGtGL5
	 PQKiDfvioc/nIfR30uX1aP34416WNnNUUqArzAyu9jo19eH6NFRljWLwxoZAIUJFAV1Ka
	 v1drAB0Y4uVhYonAjqzc35/2DXCfwZyDD/XHJsy/DnXyCxrQn6J4qdPlnBzMexvAVUdMC
	 cwJBFEJKOln0VkEDMcZRtesWqvgynhcL/+hFfOK66PzWYos8g+80+e4jbNmZLkiOmLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874200;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=gXX2mnTLfth5ZTDzamsxEs+SWoSG3jV7YBbC52hKC48=;
	b=hyDGlm6tWwkm2xHICZuuHtdmoy+gOXBcciYcKY6WRdzEonEM4zMVMnxN/GypmuXVqcKO
	 Q5nbqEh6Jd9Fo3tzl/9nPsjiycXqI9knRdfU/mZudCk45GHy1aMfWCFOA436UvOl6e/4L
	 AOQnVLFOhmZ5Kf36oED/p1MleP1ha9/XSWPFAZT/ZIil/MVV/iCU7jRpjvn6ICGj+nv7j
	 UcVwZqsWzACgzR04fp8MgSM2L0FT5MWIx+1e+cZKbr9OFM0rW7h2tXYGaMsmyKOAjYOGt
	 FXIsJN9sLPSW4tfcdZUfn+gAXvv3KWqt8w3FnmQKI6EphuJshA7IrQGBMOiGtCjxisw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=FUhC5hHF;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0C1606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C0C1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=FUhC5hHF
Date: Thu, 5 Nov 2026 11:23:10 +0100
X-Lima-ML-UUID: ab4092fd-651d-462a-9247-000d564dfeec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793874195;
	bh=gXX2mnTLfth5ZTDzamsxEs+SWoSG3jV7YBbC52hKC48=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FUhC5hHFzIKA7BDUGja/oo4cvdkaO6GJ2HhDh0NBtAHHxmzw00wPqeyb+/7GSJsLf
	 kRN41MUEPiR0jv/4d56TJh05vb9tuzntjnXn+3JVGcty4G9dOJHv2AtHjlm9GADJd2
	 DBSqmkI0xfZMSrWY91Yw3js5tuLtTbuRAIrLo0O19fq+LUjev17PczSGTv3yUfBa2Z
	 uuRwjm1ZOtphkkCYTeeo/zzYvVE0qzOdmVQrZAWBaFV/7YPWoO00ZO/3k1GKmU1v82
	 hVyuvBpJ7Ae++Z9VIvPeHE6IOk0c7RBoERjbx+6ChRYa/g3EaAM6EgXyySSrYGl/8C
	 I1xDjaxnWzDMw==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Alexander Fischer <alexander.fischer@kait2en.org>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Lukas Wunner
 <lukas@wunner.de>, Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 =?UTF-8?B?QW5kcsOp?= Eikmeyer <andre.eikmeyer@kait2en.org>, Yossef Osman
 <yossef.osman@proton.me>, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v4] drm/i915/psr: enable PSR on Apple T2 eDP panels
Message-ID: <20261105112310.44f7e1cd@kait2en-mbp15-1>
In-Reply-To: <20261016140707.1900947-1-alexander.fischer@kait2en.org>
References: <20260916072558.147343-1-alexander.fischer@kait2en.org>
	<20261016140707.1900947-1-alexander.fischer@kait2en.org>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Oct 2026 16:07:07 +0200
Alexander Fischer <alexander.fischer@kait2en.org> wrote:

> v3 did not receive any review yet, so this rebases it onto current
> drm-tip. No functional changes.

Lukas, I am sure it slipped through the cracks. Would you mind reviewing
v4? This little patch works a treat and makes our Macs reach pkg-c10.
Without it we are stuck with pc7.
