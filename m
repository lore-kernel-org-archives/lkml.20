Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896023;
	b=iK3YxHAlHGre6RWRkBnk3D3BSy1/UbJjJVNucr0ohBwpVTKjTm+qdoLXTCZ3huLkCQDQ
	 t9NaMzPqozK0pgjD3zRrkpo4y4WeqjuhnGMpBK375EIBZgyTNVmXHp7crR5g571pu/wJK
	 ZbTii+QNznm2ylQ0502ClcfS08EMBkxO/cP6jA4AO+tkkBeRV3ApIXsAml9yBmN0jUuDj
	 gVRFA9a+r8mbuVaFqTb2VYyphsJgaGXadOievMqlI2ieDnrrQH8UWTi7UfkVI4f8hy/uL
	 PvI7UgAgqIdrrNh7omjR810Raofvfk9et4k0HbJIkru1ey43vXgux39ksBluwVZ6mAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
	b=NvSPiRNCSp7LKfjBIZyU331EZZJ1ajzVIooOY8FC+YDLpRBJIknkDkYcEyZr3hsYil6X
	 JxOMxjgtGYQebmu5Yripv7evGXLMdRFP0ta2d12iiZ16IwkwDvK+zawbv+m/JFEvtvMMw
	 D1TenhZLEoK+DiNOBYaZ3TZ2gk1KE94mJvuP6k8EK62TmNdNTI2zIvsiHS3XvnP+4e16s
	 cJLn3GCEJ9GAPBCOL5AuRYNd55crK2k+En6KRcuwM6iWmcR9Z8OOfdh1k7nB2Zp9mlD/f
	 S4iH6YtBR+cKk2xk/cmnRxuIHwk6P55bUlm90nTEpzn+Bez3X+ObeDdKPL2NNwaJhwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TH080M2b;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EA6606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95EA6606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TH080M2b
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so639211137.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793896021; x=1794500821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
        b=TH080M2b2W5GU83fC4bkAl8rc89cXnFJ2JUZ1DQM2E1G7nxV0uZ+iMHWJDX5M/hBR0
         v8Q4S1dZz9e+Wy709/pkQPJoJ382ui88GBuCa7YwB1Pwv+V08ySzbQGdCs4et9sFRxVX
         1a78LWa2r/qDmkC73yn92WJjnMydzWl2HaDmNekF7y5RHwsZB7YPGLTTr3xjjmuI4LbR
         sgpTrG1DSTm++FzIJZEq0knZSmQ9xxE9IezNyVfi/1ZtU95O+iPlQHI5LWAc3/YmXStT
         Vgy3IZE07Q/+XWoEa8k60w3BygO7yb8zhuyYBqBwOLPUaUevbalW8R2MAA5wjUpSFz6r
         zz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896021; x=1794500821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
        b=YtP4rDT9P+Fy5+JB5qV2xqjCg42hw1Lfmhx2z0DTWiqeUA443BK0GiHtePS0RkrwPe
         iQdiuUbQXNnpc6q9b7C+moY5CIqW5w11Fw2KptFrkt42zHpBO9jYeoHa2hL7hMbmRnGM
         cyRLZ4jjUb+BBUuQmN2LfJIXtNp4N/yJ0FCQI54a2QXcQztV6BQ0iiQ0E9yJutJK8vsO
         uEE8+rheCgtGq2M/BVWlz7bPwaIeHadPV6++4qHk5inNUHkmpoSfjqF59qpPTAammkXs
         OE87LWusV6XgxoqTEf96rlNb7LANUFRBYOVodzY9GxsMExedBGqUJSrxZHOYYuT2BpHP
         davA==
X-Forwarded-Encrypted: i=1; AKwUvByBXhDeLt6C8sk2tTj9yTqRjIFc2TljLzY6tqYZM3HTYIh8Mk5/anx38/DUtszBRY5U7cVpu7gLPzMO5do=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BB5tcSk0j2O+DzRhe8irlUvqZUniq5GbWr2zPRU4U7i+7eHys
	jZVegvOqAcOy3gtuaM/5MOw4wcaz1nyZZCwQ3aGzY+UingoZEr6loBHuFy9JJFxOJKY=
X-Gm-Gg: AYBFou3k2vanvZJ9HlYfTfvBmaooLcekDYNQJnQLVh8z3WJsMJLaoAwp1CIvo8Gp8LQ
	pyGANjv/wmEcKoQcipB4+AuvJaG5AZAiOzv72c+7xmXrINItlDQcCyQ6vU92xb5ob+ak3x1xWZN
	v7c/fSPezil4UCbCqQOXxvddtud2MCXQJdBV6Qy1goFRpBE9f9YQzevWruYe4ok1vAnEl2e2fjr
	lcT4dz4ITWn6YGwbeOybSRFfoPqz/krCBTA3O+G9LUsbfJyZmeXzFTr4Jq/jAcqduMWZuARW5k9
	H6Ij+s9MQY/PUFjJHn4SoY3AcdqNXEcvOkKAzb4D3cSQ9qzd/hGxSogl2BxD9STw91x8vjf4M3s
	2+JrI8/4XNt628zGokA53MKD2LROJMhCwGKThVl2LrLj45J+ZyUkHkGnJ9Ru+CGnJ8RmbgvC0FJ
	yVDMWvd4owDMxuo6oWznc3iKnuRT57CXHO5EHleuJbUH/vRf8SmBJJc5tC4WzbVCpY4NfMu3f2X
	chrYDZZjA2r3eHAJOapLPCW0+pCqs1P+RPsFqpfqQyWNkkPu0YmDET8Qr91iCF9RiR3X7Pptg5h
	wkvgw1GpbpGqr60oVcRG4uqk04kUYe287nwPn3l82XHCExAWVYZ8l38lx5qiAJOB7b3gzuQ5LsX
	nUexyIL4so2a2nK1B0UKH3k5qVkpAt6c=
X-Received: by 2002:a05:6102:3f9f:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7d2a15715c3mr29296137.15.1793896021174;
        Thu, 05 Nov 2026 08:27:01 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm4667110137.11.2026.11.05.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:27:00 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP0Il-000000032XP-37xT;
	Thu, 05 Nov 2026 12:26:59 -0400
Date: Thu, 5 Nov 2026 12:26:59 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>,
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
Message-ID: <20261105162659.GB663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <2026110526-aerobics-correct-4c06@gregkh>
 <20261105131856.GA8298@unreal>
 <20261105140352.GF3889730@ziepe.ca>
 <2026110558-tartar-juicy-036a@gregkh>
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
In-Reply-To: <2026110558-tartar-juicy-036a@gregkh>

On Thu, Nov 05, 2026 at 10:43:00AM -0500, Greg Kroah-Hartman wrote:

> > But I supposed Greg is asking about /sys/bus/usb/devices/DEVICE/authorized ..
> 
> Yes, that is exactly what I am asking about.

It looks like that does the same basic idea of delaying driver binding
that this series does. Hopefully Leon can harmonize it to use the
shared trust level flag instead of a usb specific flag and retain all
the uABI around it.

But, even with this v1 the user can choose to use the generic trust
level and ignore the USB specific authorized and get the same
functional outcome.

> And I know there are other types of devices that will want to use this
> type of thing (i.e. SPDM seems to be spreading to other new bus types),
> so it's good to have and get right.

Yes, we are investing alot of time right now in trying to get SPDM
uAPI right when we bring the general framework into the
kernel. Everyone needing SPDM should be able to re-use it.

Jason
