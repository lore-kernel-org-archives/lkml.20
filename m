Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887594;
	b=hJpPcT27t3DFV9hiXK2EH6wyy/oTwKfa2sP/vYwyXRspQCZ7PgtRR2zogajKV+RntPcR
	 ewc8axerkXrNXkU1bj6W7DwD63zxZMt9Qt5Vsc4Wb6UT4geWNQE3pkmrp7GjLtVVIMiuw
	 AsyXF6LcXFHkqQSZsfsn/oUqzLdeg5IWT6EIzL2+5/0dZIDSUFFS+KhqtIB2mE+5UEWY5
	 mRmPXPlCivrlfDHLuzUsh5jr1WBoRorJ10WgXQbqQi1NwUBUxuRLyrKgjFBMOJQozAKgG
	 4GI/E9GWCDYFadBTsvOXR4zsgEF/65WlJBNBSlSAsXg7agbP9gUTc4bOoZOl56kpwAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
	b=3wgip4nGkMyprTBYx3mkAXG6MP9r2SM40AUABSyY7bGp5FXs3LWW0Bpwgwe20nlTKSvi
	 9UVeNALG7IWKhbvT1uDo+4vlYPM/sXrXgwieZyXTbJ2DT+fUIL854A5d6b8pVQbQw+pP0
	 Hyn0EkdMA0Ox3XXLpKkmpzMxy8g/UQ4/swY0Pv4xAiwwysWzxzHoeqAoxAq7M30cZAYDW
	 9syINMC3Ssm9Gka3IvStqY56mxZiVLNVlWzueLfhMBH+b3z6K7LM7InbUpqRMDscfHJGW
	 bHPK6aT7jJK165lYferz3p1+j9KV/yxhPox9G51MGTyuaLZnaFCeAIVk2nuOrfUDKZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RnR9WnLw;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B961606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B961606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RnR9WnLw
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso679760e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793887593; x=1794492393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
        b=RnR9WnLw6ZCMoaFK9OfD+Z3SyEdhvj+uf0rMG8hHCJ508GqyJ6ANwZoUk4+aGiOUw2
         /BkiFTe3GFbXdlDhgGNTyo1p8KbFcLTeuViDrXT0G8rPqBzVVo12Ao+p4Nr1qmRZcl61
         4eaArBRyBLbC70PWW9D8DSwCjUpFcwxnrtfrVG8awSc3G2DLBl7ue9/tyD5BZlfo0PwR
         zdxT7MPa5WtJxCqrk+LMM1B4PGIKPha9YDx2d3ZgVPNqHnLfPw9K0SbdoIeozyBU6kJV
         fXJaMOJT5b2NTv+4F4NS5Cw1swAwWPhfu1r6zxddYwAc/lzTbX1ed12Z3pRWm4FFq8m7
         OBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887593; x=1794492393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
        b=rwSBWNxDhsRcCs3RGGms3F28bEhlbeNLrxEFl88pkcEmYEvLlv8NxrvVsuBIHaYXzi
         U5Iy0XzZiEwHrVd2Wwx206Y6jKDV5vLAGWIENIlWTNEsCmR1dMrx1YGeaH8ABglRqMip
         BgbMXFuvAEGaJ1LJFFucf4P1w5OsHDMgs9MOR5oNmeB/1s3fJYi8ESgLbiyRhIBFPsiS
         pgqrsUF+dE8NRepYC8eSleIzqEOqjY1vSrBNDZkWu7ouT3MQgDLF98BQaxyeJFkPHU57
         CLC5yLlwf6DiVnqEK5a6aXVv5Z7s/276T48C48EyD2totkNTRKdQjb4IP64EnSzKmOw3
         US6A==
X-Forwarded-Encrypted: i=1; AKwUvBxaQyuWHMggzuGK1rFX52UAUHXVH5gTFgURLJ1N7z9gjItqHifFOd0ImoZ2TJMZNR5Y7kzZwEXMavoBx+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kzwE2I5YgbPckzKfdL893kTEv0+ee67A0neH74yAZZbr6igv3
	OVg9yhUjSTo5DB7J51G3prODsoN8ltzSOEUTkM2HzAOoR71p9hi64rb8ijccpMM2kyA=
X-Gm-Gg: AYBFou1/gMgNghlsx9SZruH/9RNQWdjv1fBRaUNcn3ZVSmjzPJniXPO4F+4Zus32JvX
	2xozvHwpRmhoL00obqwrnlLNsp6p9F5TYH6FVe6G91dw4vzdCUqU11kKQVm7IlRgirkaGkZLLLm
	E9enpmbm+uMGf0u49DqkgB3gJwd/gujHKATTVbhXGlOl72pJPlEIza9mTLn58d2VY4dFBgmwjDp
	x4Ckc1zbtrSSb6lMsnv0DA1MWZOO95dPhT3OGRcjagsS27WNxNigKvQmPCb7zO3+fDG5BSnNumn
	vjEu1xKCrValmMig29J8uYW+YaSHDbbQraHevYHV8nvC+i1/43YDZssJnyh6IfFbSA4WitVvW1y
	0DImzO1cJ44562JUqsGFJnWggCrmRn/tsH5OKg03ydstiPRAZSmsMnmtH2cN7qwU88tse1YA9/c
	dp/4UVL4mdIxzGkcDot73TyxOetB22fkHf99qyrCBKApU0pZ4VPo9eFUpdBNWxCyqM2ME9jDlT1
	UvgNcAJ8Hy9ql+4MouQL5u8Aop47xhAFvn7CKdqx4pzKPsxy8tlTcEG30mvTQc4VaUaMwtohXCS
	fifwWMhvzMdHH7RdOHTyr6ln6I/JybkkiJN5YB8r76zpBGSVzK4+kT1gPJH8XVyKWNNYg1pi+yM
	d3Pu8vGBfxw==
X-Received: by 2002:a05:6122:4f9f:b0:5ea:389c:51fe with SMTP id 71dfb90a1353d-5ec68949c50mr9274698e0c.17.1793887592873;
        Thu, 05 Nov 2026 06:06:32 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm4161881e0c.8.2026.11.05.06.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOy6p-00000002ezu-00ao;
	Thu, 05 Nov 2026 10:06:31 -0400
Date: Thu, 5 Nov 2026 10:06:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
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
Subject: Re: [PATCH 10/17] driver core: Expose device trust authorization
 through sysfs
Message-ID: <20261105140630.GG3889730@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
 <2026110514-bunkhouse-handset-6a3a@gregkh>
 <20261105132729.GB8298@unreal>
 <2026110535-engulf-precut-cf10@gregkh>
 <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>
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
In-Reply-To: <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>

On Thu, Nov 05, 2026 at 01:59:20PM +0000, Robin Murphy wrote:
> Yup, and that's true even in the PCI TDISP case - there's a major amount of
> "communication" and "configuration" involved in that. The principle which
> should (hopefully) generalise is that a bus/host controller driver can
> always interrogate its child device to perform whatever attestation and
> general configuration is appropriate, but we won't hand off any _control_ of
> that device to a specific device driver (nor enable potentially-impactful
> bus-level features like DMA, interrupts, etc. if relevant) without the
> requisite agreement between the bus code and the user.

+1, I think that captures the idea very well.

Jason
