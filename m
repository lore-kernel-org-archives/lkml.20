Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840359;
	b=zuORZcSYPV1IWWsy4JEsXhyXjJZ9P94PgYtM7n8JoxNxUyawcx8uDTbfEn1K+6QSN+N2
	 6tnG8yoaEJjtjBuRRbLFIGjrsWNdw/fCW2v7EoGsBWowcUUlkBD1/5uWPCrdMNJoMIkDl
	 P6I97AuxZkX23l6cZ5J5MLHxEWrc/E81955gfDMDCvdFkZeScxVDTZJ6HaM9TKAobi86D
	 X0Ko5ZD2Yr2XtDds44LQ3TIt/6AQ1MoWhEry/rRUlF6Zz+j9RvuQUtGF75dESZZVh9m5z
	 LkxZAtgp5IdAFYI4DRACm/CZKNq0c8kMHI+xmi33jHFMxK6ilWOdRUkJcQ66p37ZWVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
	b=WKrnPu8MQAQE/0g+KJZj8FSOK882hThypn5N23gJ/lew7p4S2B+aX54LMeqcgV993xty
	 OmSCzFGUIe+uRMKb2MXxRpAQcydgewhyWIqpKFlI0Gsg/h7P9f7illhh5lWpvvxtLRTWp
	 odQU5EFgKRFk9SUeIOL9y940uouxsZ7DcAUMfG7wU5MHGZjH6Lts3Mw+A0xZ/T+QFB/fG
	 pGd3Llxj8Cy/ZvKgkZCOYUpb6Mxy6tm+ZIaZGY+n3ufBv7o389MMM7sknTRKca2QYY9gL
	 dQ5HoU9wXaoa/tbKlQMADqGBBAxE0IdvHVcUqm8u8F204as3cMoWZqVc3lZySfRvDcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537C606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A537C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-94937a33cfbso384507685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794840358; x=1795445158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=dLdJyonbx/GT9GciisxRrbnKJNPmXRO37SMr0DcL0fOWPt4npP7q6oSEFPRBxyhYBG
         VwQv88je59xwJGF1tzvO02VHIK2UoI2gFnHM+RoqxVUasg9DyQA32ToeKqV0tOS8H2/F
         utZ+RQHXMciPdHoqR96pmDBV9oFbAflIPtcSFhX2+r9dDE0rLhaGZCPsZ1j517doL9zB
         RpfAbapy98a71EK1akS809jjM1beUX7TmDUaCrtYNcz/JJbJ2sGjj2UfCKl0NoQ68uWW
         NnufbW7FWZvXAJBZh4GXQ7J60xB7eIn/T76+zn9Pq4vvTPBJTSoxoiKRgL0R3QgrjVbx
         3mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840358; x=1795445158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=bD/++cfpqMf+x3/9h+buNvMDV9UzukTdeTPhnA0WRLjMxmILZSCmW9TTsG8HwixmIB
         B27cD/oe41r/7O9o8h13AXE+nEbMZY+dFs3i2enDb+71qw7XvM5+HUo2tTBlRhNK0hE+
         styOXdF+5pQpeRItgiYpa+XsU7g4NPk5Dkdi47h7zkOpmjm/i9TEWLj5K/nh1rU5rIL3
         +DBJcm/21l7dakPZ7NVuWT3iq/KLlzgSsB6dW2WR7jrYC1tS0Q2Dcv0+IUmuc7/sXYqP
         WM4y4tCHrXLJmKKhRe3J6wd2ouEbEk1hQNUjoNTi6Eqj8VSvP7N9DjeQJ5svHf1FFIrZ
         MIXg==
X-Forwarded-Encrypted: i=1; AL+hErEXyYtP8Q2ttMn3XbrNRj8X+HfmWR8ONNd57BI+OkkZ8PguldmN7jYvRdeplpyoA3ptOKQ1dNtac9FEgqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nxWobk3c8ZNYByZpQpofsaa7sz6RCAznTRYsKsfDdEJJQGegQ
	YRNxfmLEUmPJ6ZP0YJfQ7uy+O6tMKn8ngC4k3Pf/LVaFaDrbofOzUbY2vvKsmI0mPos=
X-Gm-Gg: AYBFou0aTd8Y5gsKjXfnRJW+Jf7v2a5bYgsT6Y/tj+0ItpUG1otfryD7gHV9ym+juDh
	W3pL2vi2lINAoG4ORWiATYR7x1EyEKwu3V0D/8RSiXBB2ik9g49uwG/MWEwik4CLuGlExqPs5w3
	z/WKM3dariROp+CXE5XuB4g6OQ88zP8JU/Enga3vTjEhjH8l5cX6vFVWNpujEJQA32hOpku31eH
	858GiswoVrwBauSDuO6UxSD8cOj43CHyHdXVabFj8mpGmVM4sRcVc+Vl7AMwuRuL/9xZNMAQTuA
	hYFjLtiqRQXs9mzxfAklN+Zyvve+VPRlcWZzs1p0nH7Eby5YqvBvqLHQ89JC2rjreYFlUJsuLNI
	3q7vdFz1n2LVOf5Pt/M0cnkCStWcUaLy5IocspCHNJOjowku1xWLuTf/p/SKIxNinm+UvO1NAvi
	xgf/BUgBWq3UTY4c8KnziQiH9/tOaER3slSy6EzxfiCOFN4dXIjivqS4d/wsSfu6vbob01lFqcY
	3tC906YYkvIBUhaalEollLP143DZm2kbonvjMFlnyd6yzl4iJz0p7zC8Ta47CYf6rF2JR0aRabP
	BLhTsw==
X-Received: by 2002:a05:620a:a41a:20b0:949:5872:be1b with SMTP id af79cd13be357-9495872d3c0mr1015844485a.39.1794840357475;
        Mon, 16 Nov 2026 06:45:57 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm858473985a.18.2026.11.16.06.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:45:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSxxz-00000009V73-1sJy;
	Mon, 16 Nov 2026 10:45:55 -0400
Date: Mon, 16 Nov 2026 10:45:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
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
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261116144555.GM2532299@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <20261116144103.GU11319@unreal>
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
In-Reply-To: <20261116144103.GU11319@unreal>

On Mon, Nov 16, 2026 at 04:41:03PM +0200, Leon Romanovsky wrote:
> > I think it should only be for the duration of a bound driver?
> 
> For now, I decided to disallow state changes because the IOMMU may outlive the
> bound device. Unbinding does not fully reset the device, so we must quiesce it
> to ensure complete security.

When we refine the lifecycle for the iommu this issue should go away
too

Jason
