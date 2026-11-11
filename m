Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398996;
	b=fFWr/fZNaJhCcAiP1O/vtQZyNTNZoIopQPJ48aVS8VXKYmdvdaZ6PRzKd7O/8o8t/2zJ
	 Cocui6yq6LiJzVdiiX9sS2GPBu0ILR/yzjJOdDk+Qz5o+PINNv629hx+bvyOGg1v+J69C
	 0rfHpNy7Uvknxy6RhnICymrYlcofg7g0AAZnWR/D9ejSztYykkSMg2LldSAJmLZUfRFzO
	 +IB0QhoehKkYuyGl8ZEyJ6Agmr0jzlWCjvbqDkg/RtEJ+5o55ZhtLsj82FecZ18XRtGNY
	 LxUY/TGiaVoyj//OlVmY97Z+AGuPih6p4dlDFDqsGy1hyOYLFKtQeOazQcm2u85z9wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398996;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+EtG8CyQ59kAhcLxDyXRX3sibsUSs2m78jp4eyjdC+8=;
	b=FKQdj3IMGdHst7lNjiKNkIK1aAtJiVHzIzY+Z0D7F56jeMCcv7o/t8GxmxewJ9edhg88
	 AZ146MWgwNvuaMJXFw8KoGgqMxqij76Og4zYbm/iHneeluoh8FkaZMTdmJ71Mi+Tvbfgg
	 yNLKx4jv63DMZP4NjGvhbEPvxQPPLEJqE6xCwLQF+cXm8Xg//3uqU8eYB0gsESEtsF0nM
	 EJBy/4jrBFW8EJw39WflbL3thlsI1YqlicuLsSVOkwVO2dMeW0sHCsfQJQLtcxOwXxPzz
	 gfkbZpUrA6oPYFlylyFT5r6cZg/dUFWTAdeebnhkW1BrgpJCnouxzXJboW945TwAz9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=WkRCID3y;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE2760A2612
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE2760A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=WkRCID3y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+EtG
	8CyQ59kAhcLxDyXRX3sibsUSs2m78jp4eyjdC+8=; b=WkRCID3yVbwXRqKJohqV
	Reen4BzE0JuLOnYgLguV7+HYnRrzpAXfIcBbRX96w++mby2m5tXCx1HDPKfe5h8S
	hYeryuP54O9NrT6zZuJ6doM03pKU63M6lGkx16WzhowviJL3RcZuQuBiQOgBnsC/
	SRGHu1jk8X2SaH888i79a1juIRyiO7+PN/0IOB9GRp9ZJYbrU+906ocm/EwlmOY/
	jgN7rvBoLKMNGifpiOSCBUe/JUyXdQT6fU14rtUCk8Z4IFT2PEToJXjIJQUEQJOc
	mgXe68JCGLRUNnoYHip9McVi4UmUgYXLxCErHQToQ74EMUZzUoqaENnGtaEpx3ya
	jg==
Received: (qmail 603641 invoked from network); 11 Nov 2026 13:09:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2026 13:09:52 +0100
X-UD-Smtp-Session: l3s3148p1@fXCIEv9fKq0ujnun
Date: Wed, 11 Nov 2026 13:09:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: phucduc.bui@gmail.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm: shmobile: Fix white screen after resume when
 LCDC is stopped
Message-ID: <avRbEGoPh3bqR93f@ninjato>
References: <20260707093004.987846-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707093004.987846-1-phucduc.bui@gmail.com>

On Tue, Jul 07, 2026 at 04:30:04PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The LCDC on R8A7740 may show a completely white screen after resuming
> from suspend (s2idle or s2ram).
> 
> After resume, both Set A and Set B registers are reset to 0. As the
> Frame End interrupt is not generated while the controller is stopped
> (DO=0), the hardware register switching mechanism is not triggered.
> Consequently, Set A remains at 0x00000000 even though a valid Start
> Address is written to Set B, resulting in a white screen.
> 
> This is a timing-dependent race condition. In some configurations,
> debug options slow down the resume path enough for a Frame End
> interrupt to occur, which can mask the issue.
> 
> Fix this by priming both register sets with the Start Address while the
> controller is stopped, ensuring a valid base address is available
> immediately after resume.
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Note:
> It was originally posted in March and has already received both 
> Reviewed-by and Tested-by tags. I'm resending it to bring it back 
> to attention in case it was overlooked.
> 
> Changes in v4:
>  - No functional changes.
>  - Resend.

Still not upstream? Who is the person to pick this up? This is a
valuable fix we surely want to have.

