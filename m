Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887436;
	b=gNykV5TnKwI5cGlV3FrR0swwlu0rK0a1DnY8lki+1N68QbpsvI3b7Uicw+jYAUcjIE3A
	 R/Wieccwq2JkIpNS51cXejzF0CrzJQi31ddHw3Go5okn3fRA4sHRWG/5FUUUb7rC2IbyN
	 DiuRC9w/k6BOJ1g/kooF40PJY4+AnrVTDmY2WoCQdJqGMq+/1zdBR1xXyFdE1EDhkcCgh
	 WDNmkr9vMuIdwc3krgX8xeTI/nTw3kdI6SCn1EvpA2ll+YX1VH31Kh5XMywQlPB664OxB
	 qhQY5mQ0vv1zb8ackaFJgpPJJ+hbXO1jdC2Fm10N+avF8XGJTSF2MY6kSYpUllquv8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aHvVt/C+p86HW0thhKORyrpJuSX9G1Rk+ExvThy6OxA=;
	b=fxHC2MBifsrevNilrBaz5yrRJUQhxuC6ARmPgeu2dS03OHpphlW1DhLkYjDe96rR2KxD
	 2pNnsUoLfmM1RmfmFAqIEGXJtVvQxWRSiBDeoYNifAXGweG0dDqPNv1LI06J3xJKcDYbw
	 fVMh/f4JjB1QT/FQg18CA2z3Uv461LZCSVT/1D52dSx7f41VRto/oTBeF1gfUnzSt3Bcm
	 KfMHo6XQzikf9z0ULcktvvX8WkiVaiTPVBZsMOc4uiM2lBR7tMJpukPjI5ckSo7Wz6Ef0
	 PwrYYHmt6jK8I79GUzG8jixcMbd0ayA8WbCBYd8JwJbbOW9ZU2yyHcXB9qoI/QRpjsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kz1XgIBb;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE99606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE99606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kz1XgIBb
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso682807e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793887434; x=1794492234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHvVt/C+p86HW0thhKORyrpJuSX9G1Rk+ExvThy6OxA=;
        b=kz1XgIBbrvBVV82jfLwzl2boDjAIVUbeNVQas9Wo1Dk5Xdi6H+C3KcpCevzEdclNJ0
         lzsSeS+uRFo6w/gIJIYGLA5nYX/ZA7GDEfg8ye+MEqBYoDAQ+XWmrXIScd3vjjxi3P0s
         TM9V8bmM9C1gt69mu+eIyGDX/aC+cI4xa87K7AUD6ZNwyr7bJjPSJ34eRy3oL+DhO4T4
         z9GIW8q+b2I5fYq6rzeAUUwY6D1cOnVfqLouPYFCQGVgJUGlc0n72Hhgr3e5/i+LRsW4
         Jqs+IOHbUmP6UlpI+ifiIR6Yqw/evL4R0NFbQH8ocPPe+5gcxWg4oty37gZrialLDEod
         LNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887434; x=1794492234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHvVt/C+p86HW0thhKORyrpJuSX9G1Rk+ExvThy6OxA=;
        b=qgsX+jN96BZcncDNNDeTrqIo3AwL3cbBgz29r/cHjWaUsk+6aswaRfGpP2f5chB/AS
         ujsnMSn2SgEDeLtfmRO/45WV/3BAOTflxEMRS8SZkrPdOtQ5mSJhWnbx51yaSqVy6cLK
         1jZhFz9z2W/fvl2VcAJSnS6o4xlKAB0d+FipYpkUgvxyFCWqwYjuUU70knYNBRxWaOHU
         +ZgEkYha9zmCvaYVPy3Xt8HyqavZ0N5YKmJ9c4nCPXFR4FTO/Z9bPac113F1AEPY2Cvz
         X8iPIswjVfR0JcVl0yzhzuxjKB7k4NkpKlCRdTeTkEfv8nGcHJJiAMDqQvwevuk9+xwU
         QCSw==
X-Forwarded-Encrypted: i=1; AKwUvBx+2prNwj/ky9X0aRFRwn368NkwynNsZnglK1NPS3pjlPjFYDaAhsbiy1uINPaqubWYHWFMkosnaZxixWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eHjvB/Rjy5h/cONHITRGKqW4pAKYMcDxPgVZYsLLBtCCDx3DL
	Lat8JYHikdSfEaNPAKu4rTfGdBqOuKA8PcIXENmRDAMX9vSi/V03FLO7cIwe+cQRv3E=
X-Gm-Gg: AYBFou3jOao/zKLHXCbd5BflSWYKjI2mH0kPVjqjNB/Q9RxxJYaMdgqUf7/QqRUkUva
	m33LzmOOGhEWicjnl3ZZ5m1JfQ3FGHvQ0H2TwZG9lYvEl/uLTM/Q69mDLnCnO2MkItdDs5WWSz2
	1YVb4r0y6XNDpqQvPE/FWRCpQlFBlNocanXyF3LyY7qeQXe3atAJy3imFn8Y1LBKzvW7hRR7fz1
	vgEp2k+zbqorkZ0hhCwpksUxZMDOJTVECpxFhL3yRRfMCfQYwdmkn/ezr2EIZ9B6fpEf7wgBp9B
	q2x4kYbf2vPnxrRz0TI7VOccapNY/IXU5bY921awi3nsEuSF/4SkXzu/AWel/fQg1rvwGUb5m/g
	Jxq4ITlwH4xQfzsTeCFpM57f/z0zkbBg5t3gvTkVTrJsF4rZezDC8mlOTdeeFsvpzFxL98Z2AWn
	EmGM2X+JWa9Fv8ypro3XGoqAFK0Iiwlor4ZXvfI75EhxDp4SuAMDH9+kPKclR+10+4I2IegXl9W
	dNpoXcXQKukKoTxGOMSuB77SnagliO62v3tr1O+EcPwe7DnbyDj10g6ZH5jylcGlFYxFQtNFE0d
	srFdpO6H6K6D3BLITlonn6GmR/uCXH0aP/j1m0TE4pxQ5J5lh965H4hC9W6c0kxjLs4ZBhe9w+8
	CjHQAVpzYNw==
X-Received: by 2002:a05:6122:8f88:b0:5ea:cfd9:8fbd with SMTP id 71dfb90a1353d-5ec689b0f30mr9760208e0c.17.1793887433885;
        Thu, 05 Nov 2026 06:03:53 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8de4908sm4235128e0c.15.2026.11.05.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:03:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOy4G-00000002ecj-0pCb;
	Thu, 05 Nov 2026 10:03:52 -0400
Date: Thu, 5 Nov 2026 10:03:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261105140352.GF3889730@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <2026110526-aerobics-correct-4c06@gregkh>
 <20261105131856.GA8298@unreal>
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
In-Reply-To: <20261105131856.GA8298@unreal>

On Thu, Nov 05, 2026 at 03:18:56PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 08:12:51AM -0500, Greg Kroah-Hartman wrote:
> > On Thu, Nov 05, 2026 at 01:42:30PM +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Convert the PCI specific untrusted to use the common device trust
> > > level. Adversarial means the same thing untrusted does.
> > 
> > What about for USB?  Will that "move" to use this common trust level?
> > If not, I don't think it's very "common" :)
> 
> It supposed to work for all buses out-of-the box, at least this is the
> intention.

You mean DISABLED/FULL should work with this patch series on USB
right? Meaning the core code will not bind a USB driver when DISABLED?

I was wondering if some of the broader things we are doing on PCIe
also apply to USB, like device authentication. I don't know alot about
USB, but I got AI to help me find some relavent spec information.

 https://usb.org/authentication

This looks like the parallel to PCIe SPDM device authentication. I
would expect it to work broadly the same way as PCIe if anyone wanted
to implement it:

1) USB discovery discovers authentication support and creates an
   attestation subsystem device for it
2) The struct device starts up with trust = DISABLED
3) Userspace runs the crypto flow through attestation subsystem. This
   is extremely similar looking to PCIe SPDM:
    1. GET_DIGESTS -> device returns a hash for each certificate chain
       slot it has.
    2. GET_CERTIFICATE -> device returns its certificate chain, read
       in pieces.
    3. CHALLENGE (nonce) -> device returns CHALLENGE_AUTH: the chain
       hash, a salt, a hash of its descriptors, and a signature over the
       challenge and the response.
4) Userspace inspects the above and approves the device
5) trust = FULL, driver is probed.

But I supposed Greg is asking about /sys/bus/usb/devices/DEVICE/authorized ..

Jason
