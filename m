Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AEF3A59A3;
	Fri, 18 Sep 2026 18:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756418; cv=none; b=NdaD5wK2pRttdp6w1IPMfvlnZluG7pP6qCzz+mqycE5bycZvOF1hqPL98FTC6x/L5rVEAwM7vMJckLzl37x7wkkb9uNnR5OwMQS3D1Bjr4ugRi8AIcZr6seh9pI73ufuSzXCO+jP86xVvwqF5CeF9pbVtb+GgDhHN9Cg2dZ2m3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756418; c=relaxed/simple;
	bh=L7PsXAdEga2lJmEvEtq8DEze2VMF/heAs09jTZSnvCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMSW2cTH7yYyIoDk8nxLvfGdjQ3X4VQbQrqJCOYOj/dOhwOdUUW+//gGQlQk5JNAQUxrN5ayW1uA2zEo0JwfD0QArJIOYlB6B1fQwaZPfk/+zqPTycyuhfvYePnIYIO2/ZT/FkhkffJ57bkNVlk0IutNsFoH5kcfEF21vqdqqlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yPjoNs89; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yPjoNs89"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=DLnOD92O0mvyMHKGbRAZQQhIOnSZOnx1HdrRVCsT2r4=; b=yPjoNs89exrslITOnBnceWqFaw
	CB3i5/fvlqVlCsRVPfz3JfPdhXJnHbmUPNXkWBqYEN1W4DL1GD52hsZEPDP3+qc+e513Uta6rzm3N
	2rvNKOuhvdcLxKao17Gln4coU8+oCmUlBA/T9sF6UzyWgyg9pYaaOLm2xJcW65qNKmbueJGLDbDUJ
	N3YDzAQz6LzRXRE2f+PnTNS6RccGuJ9tccgIHV7LqcFjcgpzWh9XDryjIrc+4x+IdMIB/kHJJPiTW
	PRXQHadEGe1ay+lu0gthZUljm4BibBD4klLSAWqBLskON4Chb9I9vJl1uC0GtkNSujIBklvXmkKcm
	8VuN8Dfw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dOo-0000000FK57-36zQ;
	Fri, 18 Sep 2026 18:33:26 +0000
Message-ID: <c854ef1b-04c9-44ae-adc6-f8c34731bfff@infradead.org>
Date: Fri, 18 Sep 2026 11:33:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 8/8] Documentation: sound: add the Babyface Pro
 proprietary-mode design doc
To: =?UTF-8?Q?Isma=C3=AFl_Bahloul?= <i.bahloul01@gmail.com>,
 linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org, alsa-devel@alsa-project.org, perex@perex.cz,
 tiwai@suse.com, linux-kernel@vger.kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org
References: <20260918113944.76871-1-i.bahloul01@gmail.com>
 <20260918113944.76871-9-i.bahloul01@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260918113944.76871-9-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,
Just one nit below...

On 9/18/26 4:39 AM, Ismaïl Bahloul wrote:
> A big-picture companion to the patch series, for human reviewers:
> why the proprietary mode needs a standalone driver instead of a
> snd-usb-audio quirk, the vendor protocol's write-only/no-readback
> shape and what that forces onto the driver, the asynchronous stream
> model, why the mixer state has to be cached and replayed, and why
> the driver has to emulate TotalMix's own role for the front panel.
> 
> Requested by Takashi Iwai's v4 review: documentation for reviewers,
> not restating what the code comments already say inline.
> 
> Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
> ---
>  Documentation/sound/cards/babyface-pro.rst | 163 +++++++++++++++++++++
>  Documentation/sound/cards/index.rst        |   1 +
>  2 files changed, 164 insertions(+)
>  create mode 100644 Documentation/sound/cards/babyface-pro.rst
> 
> diff --git a/Documentation/sound/cards/babyface-pro.rst b/Documentation/sound/cards/babyface-pro.rst
> new file mode 100644
> index 000000000..d67f8c6fe
> --- /dev/null
> +++ b/Documentation/sound/cards/babyface-pro.rst
> @@ -0,0 +1,163 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================================================
> +RME Babyface Pro / Pro FS (snd-usb-babyface-pro)
> +=================================================
> +
> +This document describes the design of the ``snd-usb-babyface-pro``
> +driver for reviewers who need the big picture before reading the
> +patches - what problem the driver solves, why it is a standalone
> +driver instead of a snd-usb-audio quirk, and the four design
> +decisions (stream model, protocol shape, mixer-state persistence,
> +front-panel emulation) that shape most of the code.  The patch series
> +itself is split by feature (core+PCM, then masters+crosspoint,
> +preamp, routing flags, suspend/resume, front panel, DSP EQ, in that
> +order) so each patch can be read and built on its own; this document
> +does not repeat what each patch's own commit message already covers.
> +
> +Two USB personalities, one device
> +==================================
> +
> +The RME Babyface Pro and Babyface Pro FS present two different USB
> +configurations depending on a physical/firmware switch: a
> +class-compliant one, already handled by ``snd-usb-audio``, and a
> +proprietary one (USB ID ``2a39:3fc0``) that this driver covers.  The
> +two hardware models share the same USB ID, ``bcdDevice`` and
> +``iProduct`` string shape; nothing in the descriptors tells them
> +apart, and the driver runs unmodified on both.
> +
> +In proprietary mode, interface 5 carries the PCM stream on two
> +INTERRUPT endpoints (``0x01`` OUT, ``0x82`` IN) instead of the
> +isochronous endpoints the USB Audio Class specifies.  Isochronous
> +transfers are rejected there with ``-EINVAL``.  ``snd-usb-audio`` has
> +no interrupt-PCM transport, so this mode cannot be a quirk on top of
> +it; the driver is standalone, modelled on ``snd-usb-caiaq`` (another
> +interrupt-streaming RME/NI-style device).
> +
> +Why interrupt endpoints and not isochronous is a hardware/firmware
> +choice on RME's side, not something this driver can change - the
> +class-compliant mode already exists on the same device for users who
> +want a fully standard, quirk-free path with a subset of the
> +functionality (no mixer, no front panel).  This driver is for users
> +who want the full mixer, routing matrix, and hardware DSP EQ that
> +only the proprietary mode exposes.
> +
> +The vendor protocol: writes only, no readback
> +==============================================
> +
> +Every mixer and clock function is one of a handful of USB vendor
> +control requests (``bmRequestType 0x40``, i.e. host-to-device,
> +vendor, device-recipient), each identified by its request number and
> +a 16-bit value/index pair - there is no larger command structure.
> +The commonly used ones are:
> +
> +======  ========================================
> +0x10    settings word / stream start trigger
> +0x12    16-bit crosspoint and output-master writes
> +0x16    cold-init register clear
> +0x17    front-panel + preamp state (read and write)
> +0x1a    8-bit gain / output-master companion writes
> +0x1b    clock DDS quads (base rate and varispeed)
> +======  ========================================
> +
> +The full register map, decoded from Windows USB captures and
> +cross-checked against hardware, lives in the driver's own development
> +repository (not shipped in-tree) - the constants and the comments
> +next to each vendor write in the source are the authoritative
> +in-tree reference.
> +
> +The one property that shapes the rest of the driver: **almost nothing
> +here is readable back**.  The 0x17 request returns the front-panel

   here can be read back**.

> +and preamp state, but the crosspoint matrix, the output masters, the
> +routing flags and the clock all have to be tracked host-side - the
> +device will accept a write blindly and never confirm what it actually
> +holds.  Two consequences follow directly from this:
-- 
~Randy

