Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492400;
	b=a7fCX3RttiZ4JD1nGuNTgbaja8/NY4EfGsk33FpDdcJlOq7mZ4r9S8tz2JOQe7Rnkw9w
	 sGnqpaLswNU9zStjZlfh5mqWgOmULjttBoW4EjO/sVrSXIgF3vrzOf8V/vSMNLMLVXUR5
	 b5q3BeaHqN9PSedERXUBF0wBqlJSIksOKVtiVifqWmEZfIbXmvsXHY+xLETu/trpBwypc
	 m9fDwbj0NX8b93WjuJQvuremxGSPupyNe4rXltGGOJpoUjpUX5qzU1nddVzkA5s002w0w
	 GoaWSfT4ez4e3RH/geG80eNgZF7vY9FPfel5Nt8tOOUbhHpAiX5qrRnPVsObc0OoN1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
	b=svITp/Hs3JE2XYQrVoZBbzyDUvC1ErL4AYz3WqZgoBt5BB0jgrMfs+l/H1mqH2qFrIKO
	 fbndgtZzLWOooFXdXN9oEC7XqZXBnUoK/ii4D5OyriiIXUuf3RLh1XqbzzHFfP/RSw3n8
	 ZVa1WomBoqYS1HcI+JOHNYqJdPzIaO9A76IzBBuMFFOHt6VQernJe+8BXRs+JJZLLFNt5
	 4ZbsWBYjahrGq2H/azQcYTcQkZPQ5Nf/bqmjRlt6Trw608BONlXPC61u0ifwyFkTyshRL
	 p1sjUxbNLEpV/sbhNdC7afmJFBGXOXyceSyde8gPAJwX0n7urDjHTyt8BuOWJDJnCxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fC9GZjUE;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA80E606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA80E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fC9GZjUE
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15354aa70e8so198904c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492399; x=1793097199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
        b=fC9GZjUEOmYIv+aaLMdcv5eL/hIbg/oG6svqLSHKOzRIqNw8UJ0uX4u7TLxJ+8G7wE
         TC0sjxIAzJCZopM2fJd6xJVJiTeuEIAeHwXPP0cmlCFxdF0TrJFb9OBeDjt5DZDMErsM
         7MJHCgOS3f3tYB4U1ICzDh3CZ2HUQuQZca8udKAeDZJ1iSr5GVTttuMpa8vCe9G96N+L
         6BZ1opy8OSh6TCb2JNce7ObgWN4j+doWPWHo2ubP2E2E1Gx2hwbhRJ/dxR48tPOEdzs7
         2dXggms9K7qzZilw4RtRBDS9OUJz6ghXbbnDwvErJ/pLXlgRSV/p35Hu96x8FWSTKy8Y
         NJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492399; x=1793097199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
        b=hyL+J/VbZRUe9D8n7WvJpe1VYGwXPacaIH1uPcXObs5FdtETCZiewLVsKIAJ4CQM6Z
         PAjwbNEu6gVG7P+W3AXr9l686cdbkEcFQ/VA9wN2COMwBbO3gDtE9lZ9C2NyJzQ7SyG6
         aMsohsoP7Xdg0TGZFlQKFmORnG1A/cnjKCa9LGK9pblgkXy3iRcPetkCCfIJklhS/poR
         NCqUGDiHDX++rOadlkLpiynTsUSJnVtYc+nzJ/RuTXfll5LMWnGupuScBIxIT9CNhrQF
         +/z1eiu4RTLxnwbHxkzuWERl9L3+uNEgAsZJpLMgwgADK4EDblCHzad5seiRkcf2PVz5
         IN/A==
X-Forwarded-Encrypted: i=1; AKwUvBxfb047G46ZwHBdqB6qIDl4+R3n2+yyFhlNxgTdumz+3md4mT/GRa1VYvgbM80A1ghh5DlTgN+8sFr/XVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjZzWlFPZ634Ga+0E+E7Vieji0RQ8A93V0RwrOZ4RrX+evsMiS
	UkcfAZJvzNRzJa22SjccWE1gI1ZTZEPBe/CKxKBNGTwLDmVGJdCE5jNm
X-Gm-Gg: AYBFou1dGh5g/S2qmi0F/tHzXU1Vbo9DU7l4DMEXxzij9FAAEqIWa9haz7A4wq+3fJE
	DqLnw/k8uWUYxDpPBGH9YfW4KWS7oY520v8mbQ8f4qQ6GOBuUHkh5WaRiS1m7fZYWGOe0H4pJ8o
	61cQmebFbwVDVkp9TuwbCf6O5xl4j5XFEOSI2Dme9zBkuhsdu+nYCrUR1fyfFkbB0/VSVajvJGs
	uSoZNcfKLLKkKD6NBxM8/pR+/s4hpn6271MfXbB0JIBuNaMVD0osh3Kb+P/B3kIRIfnMWC14bJ0
	9WhHO+PpOJm21NI6iEBN5q/BOGY5c7DiwxybRc5iLpwFXzinCkqRZHsIAny2Ts/QRrFZK9lV0WI
	ZjCHrTbUWs5YqVB+dEQox9up+8Y+5Zo4hYQWQ9fG6nZhZ6jUnGbIx+Y6YNCKYudmFpGzGlD1aRT
	ePe+5y023t6CftN5SPRX/+uWK/j4TfZx9OMNySmixcAp/YLQNIJitOFANBm0RdjrrZlSDtWngq0
	zi5
X-Received: by 2002:a05:7022:1001:b0:14c:be8e:69fe with SMTP id a92af1059eb24-1850c8da80emr20220476c88.5.1792492398134;
        Tue, 20 Oct 2026 03:33:18 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm35068908c88.21.2026.10.20.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:33:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:33:10 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <lozimedmt3h7v6odvp4svvmatvk7726a4ztn3j7ft44oto7p5p@dmrudrmzyz3s>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <atZxhWaUWthEHkti@SMW015318>
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
In-Reply-To: <atZxhWaUWthEHkti@SMW015318>

On Mon, Oct 19, 2026 at 02:37:41PM -0500, Frank Li wrote:
> On Mon, Oct 19, 2026 at 07:17:16AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add a device tree overlay for the VGA output available on the Apalis
> > Evaluation Board, which is driven from a parallel RGB interface passing
> > through a non-programmable video DAC to a VGA connector, without VESA
> > DDC I2C signals.
> >
> > The non-programmable video DAC consists of a simple resistor ladder that
> > converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
> > an active-low data-enable signal.
> >
> > The overlay is also combined with the various Apalis Evaluation Board
> > device trees to provide ready-to-use DTBs.
> >
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
> 
> what's difference with
> 
> https://lore.kernel.org/imx/20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com/T/#u
> 
> Is it possible share one dtso also?
> 
> Frank

Hi Frank,

The Apalis iMX6 one needs to set up the connection between the IPU the
LCD interface (endpoints ipu2_di0_disp0 and vga_display_in), and the
Colibri iMX6 one uses a DVI connector instead of a VGA one. Most of all,
the bridge on the Colibri iMX6 doesn't have any control signals, while
this one on the Apalis iMX6 has an active-low data-enable signal
specified on the input endpoint. Because of all of these, the overlay
needs to be different between these modules.

Best regards,
Leonardo
