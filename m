Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227497;
	b=ksYi70fn+REqPvspoxj8kCmnDV5iZDlh75fQLeVfKuv53MDOld34wEAyWhanY6ZNfthx
	 9RXrGprnXXkIe1KDU10Cl5916IJ76CNVGgVnLwj90MnqKX9BtW+gKY/lDfYrpBgwpuZcJ
	 tiMGkI7JWWUv5MNoKUTuDr7l2anphrnH3b3TDSOlazOkyUWTWvHoDSTQ1vK+z7NFMbTsv
	 h9K2+xugfxPzulXy9cnmz06MVVIwykrWbxU8pa5TcQNZu2fPPZjJU13VwycOqYBJ9J1Zl
	 QJ/SFh4Ae3V68GTPQKTkqiComD26f8jICtFCqWv8flMdYuIA/gQjITnxGZNGulJycEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227497;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=JGdQjssGCQLpg6AsSzBPTbjJOXtkrQX8V8KWmYZSf54=;
	b=udWk+dJYWI8hgqM/x1NKS1xYAOlIpmxul79wK26b9RsC7sNfbcRPL0RhkMup3lFmrg8+
	 MehtEdaP7DBQs4YfQJNE1ZBY13kgbs5qmQbE4SvB4B/Lz+cIA9ZNOvgUA/ZDTUO7hCTuP
	 E06iJNIyHtAgzaAUvomtc8ifBXPrd3JHv53jLCvQxxqbGf+pXRG+pienP8mWhMfhV6GGU
	 XPo41gJ7zs9hmQmE9s/EM2o5EDu8R+epmgBShZO+pj3N6NmmBtiSIJQrXUnPT3fdZXXPD
	 j9a25QlZ1teQF8vSqyJ/t22ICcnQ6VEx7s6XjF8QPvQMvt2h9wd0QFBsdvmTpU/wKbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Kg7HlYh2;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA6606D827;
	Mon,  9 Nov 2026 12:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDCA6606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Kg7HlYh2
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCEB2981;
	Mon,  9 Nov 2026 13:29:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794227351;
	bh=xBs+FZDtGIlwtTPVFyPtdGeWugakZJOmOZJZsX+RPno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kg7HlYh2pqQbp5oCClYnPyGL3xXB2qZNTQb5pYPJQ+ZFq7Rf6yxztN+/ePGogZwq0
	 hcWvUgwo/E1F5/q8U81GjDi82QNTOvJOQk2rxYvk3wo6GOkFyDQaSR2oNvMKjI6caV
	 chFRMJ+0fYBjrV+HVoTHDIkePhasaoPuGLk39EO0=
Date: Mon, 9 Nov 2026 14:31:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "D. Manresa" <dmanresa@gmail.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: ipu-bridge: don't reference the module
 image from software nodes
Message-ID: <20261109123132.GA921524@killaraus.ideasonboard.com>
References: <20261010155626.2766298-1-dmanresa@gmail.com>
 <20261010155626.2766298-2-dmanresa@gmail.com>
 <avGxxCtAsVYKFxSq@kekkonen.localdomain>
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
Content-Disposition: inline
In-Reply-To: <avGxxCtAsVYKFxSq@kekkonen.localdomain>

On Mon, Nov 09, 2026 at 01:43:00PM +0200, Sakari Ailus wrote:
> Hi D.,
> 
> On Sat, Oct 10, 2026 at 05:56:25PM +0200, D. Manresa wrote:
> > The software nodes the bridge registers are deliberately never
> > unregistered, so that a later rebind can reuse them. Nothing reachable
> > from them may therefore point into the module image, but two properties
> > still do: the "link-frequencies" values point at cfg->link_freqs in
> > ipu_supported_sensors[], and the "lens-focus" property name is a string
> > literal.
> > 
> > Both dangle once the module is unloaded. Re-probing sensor drivers then
> > read poisoned link frequencies from the surviving nodes and fail:
> > 
> >   ov5693: supported link freq 419200000 not found
> > 
> > Copy both into struct ipu_sensor, where the other property names and
> > values already live.
> > 
> > Assisted-by: LLM
> > Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> > Fixes: 68b9bcc8a534 ("media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs")
> > Signed-off-by: D. Manresa <dmanresa@gmail.com>
> 
> Could we have a real name here, please?

If you think this patch is important, just drop authorship completely.

-- 
Regards,

Laurent Pinchart
