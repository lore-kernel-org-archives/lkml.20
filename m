Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859754;
	b=rlxOOaAkhzywpw5miX6S9i9maJjiF6T19ToLJE8LW4iE9oSZMNdNurCSxNp5IeNkJ7Q7
	 5wcEnWVlpRcw7TPolnOFWBYdZpwC94kIoM7LjL6wE67R/FxCF+BAORvbAqfF356Jf7DrE
	 pvGn3AdrCWzI0lB6Ofin/zA0T+K0QzcyR3YIIMvKSTPf0S2XPAvJw7HniOtV5FacR+tIC
	 hmLrK4R3wTTvhlA8/LEkSQoeuhaTZhlPosY727QFpcK7aSBOdHkPoyzS1B9nLxOKObCmz
	 Sc7MSEsSr955j6jrP7dUVH+Ez8maULa8DK6oEKakahqkEn3aOBwRFI5B/h1pN2b82ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
	b=xC3jh+nXcd/+5GLb78f25zLkD6Jmcz7qoQfcW3L+wewtyz4Z1Gn5/pxkT2tpORERpszA
	 VD/LpEOL/5cTgIOGfSdIjFyvHqmM+boOaeIMAlqci6468w7ieUmi0kO4qFNJCLfK38yht
	 s7AobIaVQekbZiAZGZM19P3CToxfT4jTfqd8gp5/thi+mioaFr98X0BAmm3hw/6tgW0jW
	 UY2iARqstW5oySS7HV9Weo4PUICZRxIwsMsfyZwoKXjEM0CIGUQ1rM9U1qAlMG8HFNR7t
	 QGTtnT49qe5lodP6uoEggmtAgZlLL1MDpMO7I1ViAWLA9ADv0Grqus98SI3gCYXFLpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F52F606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F52F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5366ae57896so46203671cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794859753; x=1795464553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=nbZUyxTk1xDDi9/JiN9In9kNH24m3xvR3W8MPaMB063K/nb6P74sDih4ebpP83k2np
         SjqTAYuPLCHW+FRVrjLKSTbDX5aM/IVbZZxu+ASYJ/ssH0gDFbMJvSJmLcdHAAsDSEL+
         FG47SOuU8PRulqvpOebFRdp+iKyncNtYeoKxWrzhMSjcb9i+1jD4cThvDUO+7PnMd3zc
         ImV7NXhI8pI4k1LW/eM2oLltJhXP6hUveoFekGEVH6+oWgooyZkYdcVCIAs0jW9hoXxW
         5IGbSHDAmwoeFMTug5VO+bv+VKknP1f2hoIrUsvWYeNqALAO8eTePO8ZOjSwRNnR3p0b
         L2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859753; x=1795464553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=eqMzQhLbrFa5kQjIwtOgodDzPKcLyy9X/qRn3aviIPb/pfNj4MBo5Kh1QflQ7lSVAA
         pOMovYrGGeUsoChIe6/D8l210WbwPwputoU5TI0FxdUwKUH2loUpUvE/ZzDws114cs67
         U2uL6l8CoVlT2yBWC4P/YljtqtrAiDwSZs4HkDM13tmCrAMge9hMk0Y3sm7myBibIaJO
         6R5ySRNBz8AN1pQJFLTLdINE/JOjJfvVy2N2D1zyPeGk9fi3vCuQTlWj2SCRMiQBsLi1
         F/pKfFXeZuclMy8Nybd6qbb0v/7+1V+tDo6bLlLhsY5IiXfnja/wUw6qUUl4xJJLqfqj
         Z6+A==
X-Forwarded-Encrypted: i=1; AL+hErEFsjSDqNp/8jQUYVHulyZGnozN5Cs0mbnw2qRgDu2PyVA9mbyOCKDYGoeg7W2cG/I5O6j2LOntQ2vec5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8empJ7a74/y2Lf9enWKGXkQe7mpWR2vuWA6v1jm9HZbDJyhevj
	yLYSDsGVKc5O4LhaBmg525Xrxk2zYFgIfeqCDtuDxHbFfqgo7ybjs0/+99p7aJWz65M=
X-Gm-Gg: AYBFou3oenJLu3MpUsnas4aefnWMRWwVjHKJk/H1A5BGdTTM8KO0zr5u+YDI4e/J/C/
	KDs9u3YB/mrxWV5o/NvPOohg1p5LOzg5zrVTyc2gH52GK72LDAU77RNWVwvSXHGg9K5rl2oU3hz
	ajV7BhLS5uNvoQbHKSASdsyCoO9gUDWlcdvH1xYvozsJYEbZtzrdpX1Fv7CgkEnftBqJWYedNtr
	3wJX/P0c4C2J89qaBrxMjslxpOyrA0u20VhchC0wMGwCe9sZq5Ir3hZ8k4JwrbDFlr/QUQmQr+C
	ocdakM0MEvmbfAw+iFuCGsYVz/2yybjwnktw/00NrUre0Qsa1foMWk2XY6vy7zoy+8q61BFhNw0
	p/j6yoQULbsHd0mmbBLc3jvJOWWNEgMSM+AZPfmg25Cqe4BYWgLLcUFqkJxt4TEkBL675CDkCjj
	bKYRK2ub7wjkSdRIPScM/T6sHMHYG7AgitGj8h29j/NfOK4RjV+EGs30/oUeBOumU0QD+gVWW35
	Vh+FtJ+uTjFd6K1Bt6NthhmYPWN+zNCF8G9OjToUPl7Oyh4gCAh975XTUHnTuzNkB/ycFZNfhN2
	T0l28A==
X-Received: by 2002:a05:622a:5144:b0:536:98da:f790 with SMTP id d75a77b69052e-55ac43909femr187873791cf.6.1794859753196;
        Mon, 16 Nov 2026 12:09:13 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d445d1sm92856046d6.8.2026.11.16.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:09:12 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT30p-0000000ANtb-30lh;
	Mon, 16 Nov 2026 16:09:11 -0400
Date: Mon, 16 Nov 2026 16:09:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/19] PCI: Replace untrusted state with device trust
Message-ID: <20261116200911.GA2473219@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>
 <20261116190417.GD2299285@ziepe.ca>
 <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>
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
In-Reply-To: <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>

On Mon, Nov 16, 2026 at 11:24:17AM -0800, Kameron Carr wrote:
> >> My scenario is pci-hyperv in a confidential VM with a paravisor. The
> >> paravisor is inside the guest's trust boundary and owns TDISP. It locks,
> >> attests and accepts the device, then answers a VMBus query describing
> >> which BAR ranges are private and whether the device's DMA may target
> >> private memory. Before a driver can bind pci-hyperv has to:
> > 
> > Sounds like a user in such an environment just wouldn't use the trust
> > level mechanism at all.
> > 
> > What use do you see for enabling trust level but having all the
> > devices unattestable and accepted already?
> 
> Previous iterations of device trust used the trust level to make
> decisions around DMA bounce buffering, etc. Is that no longer the
> case?

It is not, this is now just about userspace attestation really.

> I am looking for good hook candidates. I was hoping that trust levels
> would end up directing DMA behavior, etc. but maybe I am
> misunderstanding the design direction for these trust levels.

I don't know, I broadly expect some flag in the struct device to
indicate that it can access private memory, but how and when hyper-v
could get involved to set that flag I don't know.

Jason
