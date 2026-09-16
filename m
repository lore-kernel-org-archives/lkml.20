Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E6146AA7C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546911; cv=none; b=rwgNSBzPvMeLpAQrL2upwaknfWI+sVscNZwPptxaJizcRpkDGoV9ZWtDRG5D0VpPyh6M2h8Kj3pgrijyxiB4T73jGlXhmnRP2WN+oJfCkaaT4Qi9+reTrUsv8xPvpblx5r1OsiaHMBMaenAamRNtA2XZxT2eYwdZWDZrUKIvCSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546911; c=relaxed/simple;
	bh=1HUGQWUo7DHa+QDueDddUtzEPEP4VkzaWUaP9uZ2X0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TES2ul6DIDnkPqYlnEZ9/e6GJEFi5flAxliDCTwgM3HX7XjHydc4oIYT8EWV6MR7MBcldAwQcmd6BSxRglEpO9kBAr4GlfNuBVAggEnVw/Rilzhu9/+EL3TpqZKgfrYIoaBwwY+TrhhiA9xkL76/7fuQyRFrLpzXWTW6Bbh9fXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nog/maE0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nog/maE0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so3597055e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789546894; x=1790151694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bw432elLmhA4oy2qWRZIhT4M5eB1za1G9hSrgeusNHM=;
        b=Nog/maE0UF8Pv5w4f87Y92+hTJ9B0UFhPpIBZ/M378xf3MGgTi31u0SippM9dZKV6u
         Vmi7i8GqkzddAK33fd0PDalmtqmd9EGjGqG28czpyzbpJtzdaRGGZATjcPO7pibvyKT5
         UL9dvd8LUOqicH6MkTMlu7R4DFhr2vleT5wQEh7Hulp9OjEwP/O4fHyeiNhRGyni0Cdf
         qTwesT4cnDJiGv+snoUEgSbnKlVmnzGQoEIBjrM2b2QXW6XP/O11jCC2MglsJOEHgZHZ
         lQWpOIoG4FFP0DE9Ks3+FYVPlDTFPB2BBgJkMAFTnJVLSElAw7AmWSWU/8NVMOlZG8rf
         YHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546894; x=1790151694;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bw432elLmhA4oy2qWRZIhT4M5eB1za1G9hSrgeusNHM=;
        b=HnutMpI9t5AAbeyUXkUw6Cmc1r5LE06c/JNJj96JTNZH1vONWpuyAAlOtYUwMmWivU
         BYtNOzidMX+xDAwAj3Dc1ZvlOFwGXIep4+BVUuLY26mzARUO7QrO5vLLrg6415egAgCJ
         iq4Ti2JZlc3MWlamxegIszkcW9chcaAAf4c85rqI4bD+/OAAktbPcjaOJk26o/PXDLrN
         BxoVc/hPG+iv/6+ZstVLh/z+OK4dt1f8dtE9APdcWuIIlpkhHxIUgPGPQcbETdCzpkZH
         ZphGvmwZnRrmqvKquAyUlZBhrt4ddGsCodOHCRQTcCi8sTmRnmd7UGyNDDvtja9BmBjx
         F/8w==
X-Forwarded-Encrypted: i=1; AKwUvBwbkJUjm3vIpZGf2Y7hsOzE9fQvI2EgqTPXqzqseTXXpGtlCDzVjlDuN9SKb+8mURG2BgwFeJ/WtLr0mFc=@vger.kernel.org
X-Gm-Message-State: AFuF++nFGreXrAtVCvJVRxooeQ3EFK+O/d0dNlNiGZG3f0iZ6qsbTXgC
	jQlV0ztQPyRYApTA4xO1td/SqxBLQRZ61hcvyGU1/03rwiA1Jp+jo4si
X-Gm-Gg: AYBFou2JriXK3c3QIiqgyw9xLBFDqe9PBk+Ct112BR/pooGxI0P+ViF9p0sB+UbwHjW
	JOnbrPr9pya0yzefkCFhizM3sWqawErmISyz73DOldn82s0Eu/6uEfQixwZtSP5C2p2Ef9/IBy8
	JxLrOOo60jnm/Uc73/n6EJTW8LMawMF1CIP2kEYtV6RpUvndMWG6YGLRafp5LnQ0u9egJjBtOGC
	Bfd95r8wdv9SPkdyghQVMhBdQg6WO2SpZHuoDKhWCV7U3Dky1HbgqzsU//9Pz9VTZk1A4Foh+hP
	BwQ1C30i2R+SG4Qg5EArbfn12sMcgS4USRfMSdJ4chsStFNKjxDG4LPfzE1vGWkqvbRNJeT8+Uk
	SeNO7O9jKXZbCz+p9lvR6WAz38Sb2+xDnBO4KdkKMp83eo3OCWQheFoe/aT9OzRotfogl0JS/dZ
	RatvW6SUdtEnBHELUnO7SN6wH3EC2ENdSJAmMEs29nj1+krWHsQU3PT7CdLpCnB+ci/ReXRiSW8
	qE0O5P1T+qCesX4c7vhYLdhPzVsu2CQUN253pAuHDzQdBRR+odt190KbfF7BzFDmtS34PYnPArU
	0IkeW5ARTgdlz9WGg7CuJPBQLXmPS/rhEdPJmLoj3O8sCI81FiHDThC/Myq5C8OSwH5NwZFSr6r
	GcUcb2uT9foeOBKVhOdx9LKBL1Pl89pfY8zkqUBp9KF7IXTme7HHtKEP27dI9Rdpg5Nh3aPyr3S
	wWKEnY
X-Received: by 2002:a05:600c:470a:b0:49e:6bce:b0f9 with SMTP id 5b1f17b1804b1-49eb732cc87mr17337945e9.16.1789546893641;
        Wed, 16 Sep 2026 01:21:33 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da071asm73394925e9.8.2026.09.16.01.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:21:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:21:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] usb: core: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <20260916102132.00005129@gmail.com>
In-Reply-To: <aqpOlKtxeROh-G_s@hovoldconsulting.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
	<20260915090223.1346-2-joshua.crofts1@gmail.com>
	<aqpOlKtxeROh-G_s@hovoldconsulting.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 10:08:52 +0200
Johan Hovold <johan@kernel.org> wrote:

> On Tue, Sep 15, 2026 at 09:02:18AM +0000, Joshua Crofts wrote:
> > The fail label in usb_new_device() disables pm_runtime on failure, but
> > doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.  
> 
> No it does not, as the device itself is about to be freed. Sure we could
> disable autosuspend again here, but it does not really matter.
> 

Okay, commit message aside, you still need to call dont_use_autosuspend()
on teardown as the driver doesn't use the devm_* counterparts. Currently
(according to my cocci SmPL [1]) there are 195 instances of this in the kernel.

...

> But this one should not have a Fixes tag and does not need to be
> backported.

Yeah, you already mentioned this in IIO once [2]. I found several instances
of patches like these being backported however, so perhaps times have changed.

[1] https://lore.kernel.org/cocci/20260915064327.1377-1-joshua.crofts1@gmail.com/
[2] https://lore.kernel.org/linux-iio/aoQEyeHUiTwWenBL@hovoldconsulting.com/



-- 
Kind regards,
Joshua Crofts
