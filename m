Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898126;
	b=r9sYYB510RRpligkXdJAtFIf16iP7/y7aAlzHowjQelvlmkB0YOnxWUaCA3xHK1+oWuh
	 C8qWmcOnpXnVKUaNEFMHrEmvLTDo+wJ/HER4k/HgjbLfVGQUo3/HyMnyOEgmu2IosQkix
	 ZwZUK80d76kw4LaoTfq13PxU8oDN8arBOMde96ZAj6yzjirTKI939yppVX+sr0X9l6yQv
	 Wdafo5KfUa6RxrwdF4MDQ9o/Wcw23eSBF+1YcLDaxtNKXxDVBApkq2yokdQ/vSMRb4a1+
	 NAzPaWTExQhkugEbMuVPwaljoYn98JcZq60zCXjung4OxlaDxY/KHSySVgTLh4xn0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
	b=nyOAxj44KciW5YjPZLczSh0vo6iZNLe6joDQC2UoW2vZcVrN0HA/dIUrm22lU8jDR1nm
	 ZCGwAoG+jB0HjE76ayCfl7ZjE0BsgJWNbwGA8OeA3vkQE+wwFg+Dm63yDk8c3y7ADO+7v
	 eVvzcqvB5OuAjUV5YTYqIi1+E8zDvyz9YF00IIU4uDFKo0SyVbXItQxsnmY29SyKS1Ay2
	 SXdu0ywd7HMqMovjkho76bce8KRinEdiDB29kl9aN7ELGpqx+OukdVblBcYFk9cK9V7n+
	 EBO8NYmhsKZCKmY7es722XwwGQN9t00DjOZbhQWr6pzkBUhdP1hDSMQze6Xzl5IP/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="UT/D8aSt";
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C19606D819
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C19606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UT/D8aSt
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso1351516137.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793898125; x=1794502925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
        b=UT/D8aStYb7dPEp/Z1PTR1znD76pBm0Z1nPlORuFlgDbzwSX/aHEaMIKgxREgduhMs
         7b184i+9WuyWU3kP4ECdvxL5tqJCBp+sE58xftFr07RVMuYSe2D0AHX1L8wkHJuC4lcP
         6d7IEtulMVc64pTkfBc/dFTnsuyCXdHVpF//V/K2Xgp9mPmSNI4/p7tLi2H5V42yljeY
         GtO1ChQ2JjqDeaKC4B9biWxL+z3aUuPX/f+FWBrD4U/FW4Q80YjAWhMK/Up13oskn2O3
         3V6ObKXKjzYpPS1tL8mHYVexmV3sD/kfJUj7ToJWfvaytzTBimAL6fO0bssiuf+AQf9l
         4B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898125; x=1794502925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
        b=pP4D/xH7Ny+Fkm4C7W2C57k2fgP0gnd020EqtK8rDuJxSymvO5Au8VFsKhaD8tIgod
         7KSurUiZvP/2GIlW9Ri0m8HGUcxKD7jyBlhcwekk3WX47QyRSNf/nec/GtL5QvBhR8SK
         XnmAz+KkuyFjhtPVbBKrmVLk9HTOB67BVsRx0N+G3W2UwWe2miNnE6NhxA+bmn0ILsfM
         KF6cllg7DFUqJbjBoEEhQEg+m57kSE+iryxpmaIjf36KjvKBNmRfQoWncNa9CUwNnIZH
         ZODb/ObRYXkAwJ2XwchXWPxUoba+ARZmxBjhuJEPZPR+6RnqUu17aMs0thV6rLxX8o3W
         GtSQ==
X-Forwarded-Encrypted: i=1; AKwUvByt8gVd2GlCuDQU2dK5nKW+ABYom+lBggeJK5nMh3r8XUp8XiHohcE35q2xuYRAmJ+YTKFgVA987RhImqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dXWaYBb8zYVNDNnNY9yMAqrFRNBnyR3XnhAcseRQNmz7N2j0h
	xLdi+he/zS10ltbLdmKVKW/qnNylAgM9CUdwFkDRoSe9AKAHjLL1YIynO+E5HVZx+tw=
X-Gm-Gg: AYBFou2S5e6USvRf7uKKQwb55BfUOlQbrV2Wu5b62jQiMa0xDTQozXKuhNpx6Qk/yDj
	onMk6imqD89D53gTlBmQjj3bIwKxEio0xei4FGTsFS71RzPZW/aRaUvYrw6VicBDs3vza6LmO/+
	cZ78AtQFz6/ibGJqP3vu5COJ6oWGlmf3AHMQXJwpJkt7f9nChsP9JE4Pb41eo4snZ5BmQ5Xmdp6
	BtxbaUUDfnfJ2SFCCwiZhVBn0AX9tEOPpHFzBXUysgcbp/fpOix+TIfwndJPrqAFaQGtYuf6nZK
	4yPhB5rtV5vE/Q8et0uR+tlOj+kia5+oghhxbyxdFS2iniOi3qg1b8N1JPNwxwUQz03mmmmtqnn
	LHN1LFeOG8hDbjaVsPObBjTiLOVdSwB83SvvqYSNlXV3h86v0kptqLV1mEws2IAPv7b6ijGBk9D
	aGzofrIBfbaPSBgdaABr2nffmodndsk9+qSGg8ZiS3mHYdy0MF/S8P8Vn7LxewCJMZ4NesRGccB
	tSPU6muPvfFANA7TOgLpndgkrcXM62GEVMmHRCElBoBOR/1um/goNusKcfOpUu9eCjZ0isbeYqI
	DCOycAgCipkJY13mAW5sC4jRf8Yqbcdn271yAAyn4Al/hmp5ympx8jugZNurthrgKMwTzgqw8A5
	u0jb3mHsUAs9sGRVU+Yvuinqd8Q5tQ7g=
X-Received: by 2002:a05:6102:2c1b:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7d2a16c7f35mr120203137.33.1793898124846;
        Thu, 05 Nov 2026 09:02:04 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm4619225137.3.2026.11.05.09.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:02:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP0qh-0000000388I-28Zd;
	Thu, 05 Nov 2026 13:02:03 -0400
Date: Thu, 5 Nov 2026 13:02:03 -0400
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
Subject: Re: [PATCH 10/17] driver core: Expose device trust authorization
 through sysfs
Message-ID: <20261105170203.GC663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
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
In-Reply-To: <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>

On Thu, Nov 05, 2026 at 01:42:23PM +0200, Leon Romanovsky wrote:
> +		(RW) The requested trust policy for the device. The initial
> +		value may be selected by the bus before the device is
> +		registered; otherwise it is "default". The policy is resolved
> +		to an active trust level before the device is probed.
> +
> +		The values are "default", "disabled", "adversary", and
> +		"full". "default" lets the bus select the active trust level.
> +		"disabled" prevents a functional driver from binding.

For making this more general:

"disabled" prevents a driver from binding and informs the kernel to
provide containment of the device. For example a PCIe device should be
unable to DMA to memory.

> +		"adversary" requests operation with the restrictions that the
> +		bus and DMA layers can enforce for a potentially malicious
> +		device; it does not isolate DMA by itself. "full" requests
> +		normal operation.


"adversary" informs the kernel that the userspace wants to opt into
any security defenses the kernel may have to restrict and further
validate interactions with the device. This may have a performance or
functional cost compared to "full". As an example the DMA API and
IOMMU layers will avoid exposing unrelated nearby memory to the device
during DMA.

> +		Successful resolution to an allowed level commits policy
> +		and operating level before driver or DMA setup. Both remain

"before driver startup"

> +		fixed for the device object's lifetime, including through
> +		failed or deferred probes, unbind, reset, and driver reload.
> +		Later binds must resolve to the same level, including when
> +		the policy is "default". A resolver error or disabled result
> +		before commitment leaves the policy's writability unchanged.

Not sure what "resolver error" is.

Jason
