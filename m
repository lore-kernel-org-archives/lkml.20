Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1094570F4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985653; cv=none; b=D05Uoi9FxY+M8mDF3jn+GsVVLDUn3kqdmzNDIxal2YETp3VlSL90/tLRG/uqJ+iI4d5PoGFZ2+Orbcjl+hO/TIBiiZzFb1MJSwkSNfLpvzZOpqSx+g/pb3rQyFuqy3h5f/IgZpeizdNYLIUaHJx2Ld+e3Ir+ksPfkMwDOawpD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985653; c=relaxed/simple;
	bh=QwhogU0EtLUZ6ngOGdOZVnFb3o8VkGZfi9CXG4Khs/c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RZCdMaClIqcYNXbZ5TE5xWEX3ng6BUsPJb9T4Uhe4KqG/kPednmNCI9Yh77b6Wn672hcQfIyykiSQl7Ul0y347QQCljUX5ZOP44y47tusXgiVEmjD2MWJrygjhFsTTi9Mf0umEFr/SPCXj0J0WX72Yg6p2ZkkUPUUSUV/8G8/J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/j00O8M; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/j00O8M"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843f205a5bso4236318f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985648; x=1789590448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NRvs41+5uPFlOeoWPYyoihSNfHIDwMg8K54gWzgpRo=;
        b=Q/j00O8MYPiim6h9ESKjmpBRcrr9UWgDUIlo/sb4mo8bv/zek0bBWQAf7VmVZh19iN
         sSpxx/MDJBb/y0Tuh28DRdTtTqgvJLkLPlqwFLIBouCT79sDMsdJb75Y1xbhNvbA3s5O
         XRXdhKJs/iUNWtw1h3aT8G+XoxCWiZphaYxDiK2KwIY5LQn22fwnZoSseDE15JFpIlEq
         dp8igHbohlHSUhiuHhkBFI4fCkE9vb5OymFaDATCW1XrkPE8x/6M7cxqb3+MfvXdVZ9d
         H2vgNTgAeFnsAaZLjorjixrKLqpfAg6HYpudb0jEtdcrGpXKWELVY2WwdoXoxxHiezy/
         hLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985648; x=1789590448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NRvs41+5uPFlOeoWPYyoihSNfHIDwMg8K54gWzgpRo=;
        b=CnvCKjJm5S6yqIjQ81WGBLzllTcMIcVYY2ptgYOC9QKVXjLRnzc2U95mhnGzF6s+iz
         VVY2BaYVojcWJpNKCjaxI0wXDNmb957C58G1+19ZuXTyWFMXK2jb7Z8wuAB2/EeTwqYF
         uZ+jWGPGVkcMOj+Mv1IhE0UbHX0WxGp+YxzNLd8UhfTM+hcJfgdBYRQNfGOYVH1vc71U
         3gu5RGVJhC2MZqxAOZD2rwZC0uv5XkTdzLAT1g/8BL0BKR/bTcVOnPDLob1ORMuz+iMj
         qsU9fMixbkwvsdsl5iGPbE8bVKmcH1z0MTdhsuSZOUW5gb+EU0dHN3u11mZOTOkIL9NJ
         DDJw==
X-Forwarded-Encrypted: i=1; AKwUvBxkkKVtUDP9jfgX7uak4Yu4OGVIREcT/XBhMITsqn8JJfuTI4+vTOqLo7ue90wpLIoMFjzp0HeI/GB0rZg=@vger.kernel.org
X-Gm-Message-State: AFuF++mwanRfzeCdYCtroDi/wFa4j/JzCh3jJlae6JaOTPjyBXjojOAG
	BQ+bzM9Kl68VZkVud3Jn3d1bxdphV4utJD/MLd2UbFZn4FJ5SxjqTVSx
X-Gm-Gg: AYBFou1w8sZ2fPj/z+MM24pO0G1bxcCJl4RJCUdlwuy3HXdhjJ/LnZAIXTmWehSIQyU
	mD7cCg9t7BEr4LFhjz1GpQGj69828A/Ss/woBwp50ms2of6c+6/YfJv3RI6AMtaxrlfabeUs83r
	hGY/2ij75eEMyDGy4pAjagaDNBDN53ez+JyDHevPpjcNn0jMNEdQltzNl0tkRZ1OzNudX9RjG2T
	lzzrO71xmLKg4GDUp5FXokppadOytHzgDrk4ULRlIMIwGO55FoFEXXIECKSCKOK0CbfV38hC7oO
	NgO3NvLxU/PaX/Kg5dViZoTsyVyAwmy2ztFAci6b30qCsKiJuUxPTHm/H3Gv49j8SG2fDajN9MN
	NbaNPXOmjj6WBRFjS8W1DQoeAOU/sE11TQsbAEAYk0mN8CsaILvGL3WQ+dEMQ/IUvtR6DapGLio
	hqPpNWXndH4PFV0V/pGpt/Emd6FdlQFAbtB/X0hHOAT3KSweFCc924qxQZ5PVfA9nS7QG0kCFV/
	CBhhtfW
X-Received: by 2002:a05:600c:4e45:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49cf81dc3ecmr412646735e9.1.1788985647953;
        Wed, 09 Sep 2026 13:27:27 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm172698495e9.4.2026.09.09.13.27.27
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 09 Sep 2026 13:27:27 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:27:24 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Quinn Schive <quinnschive@hotmail.com>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] HID: logitech-hidpp: G502 LIGHTSPEED loses hi-res scroll
 state after S3 resume
Message-ID: <20260909222724.30fc8f52.michal.pecio@gmail.com>
In-Reply-To: <CY8PR14MB59809F95431FC6FFB0D0A56DA0B02@CY8PR14MB5980.namprd14.prod.outlook.com>
References: <CY8PR14MB59809F95431FC6FFB0D0A56DA0B02@CY8PR14MB5980.namprd14.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 09:58:28 -0600, Quinn Schive wrote: 
> After some S3 resumes, mouse wheel scrolling becomes approximately 8 
> times slower.
> 
> Turning the G502 off and back on immediately restores normal
> scrolling.
> 
> I captured the failure before power-cycling the mouse.
> 
> During the resume that triggered the problem, both PROM21 xHCI 
> controllers reported:
> 
> xhci-pci-prom21 0000:11:00.0: xHC error in resume, USBSTS 0x401, Reinit
> usb usb10: root hub lost power or was reset
> usb usb11: root hub lost power or was reset

Hi,

You could try if this problem is fixed by the following patch:
https://lore.kernel.org/linux-usb/178832755831.50581.1058201741431375556@gmail.com/

That being said,

> My interpretation, with the caveat that I am not familiar with the
> HID++ driver internals, is:
> 
> 1. Before suspend, the G502 is configured for high-resolution
> scrolling and hid-logitech-hidpp stores wheel_multiplier=8.
> 
> 2. During S3 resume, the PROM21 xHCI controller fails normal resume
> and is reinitialized.
> 
> 3. The LIGHTSPEED receiver gets a USB reset while USB persistence
> keeps the logical receiver/HID device present.
> 
> 4. The G502 appears to lose its high-resolution wheel reporting 
> configuration. In the affected state, one physical detent generates
> only one raw increment.
> 
> 5. hid-logitech-hidpp retains wheel_multiplier=8 and apparently does
> not re-run the necessary high-resolution configuration on this
> recovery path.

this still looks like missing functionality in the driver.
Needs to handle reset_resume() perhaps?

Regards,
Michal
