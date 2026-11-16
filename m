Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855860;
	b=nNhuagMuuBKR0OR8agac76gvbAwNJlasVWbcg6PUY6fHkfURaxNYIw27dL2obkKkceYq
	 fUOf7HCVTddQL44K7gSAj4mr8Kp8Lh6z5qh9pbEQXzUbpuap2HTWDpBSGk1aXA8iA+E3G
	 1ZcX1zlaf22jE2aO2BPg6wYysvKl8JPfGO8Bi4cC0qrXW8zdesDJYFNNfrWqbyG+CE9vf
	 MnAAVwcS+CKSEPwn0fVZ0gZTfJ1dpc9bp5ak/MFUxh0mn7tgXBPBY8cytWR1qfMsZySS5
	 TQP1gKz3QokjxvLJ8eI+vRnd5aIfiaM9dmPrKnvFU72NanRj1Q8qOdsMY1uSZPDwQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WvOfbKHC1YhEa2QpW290x7cG/RSkj9nU3s9Pf1uScWc=;
	b=GdGnPVGf+EqoMI/dQBoaaDAbgiCa+PmTa6cmXYHuBMkLJ+1CJ6OTm7hxnlHtZOVWxl/O
	 UwB4KzGesUPmOHXjT3SrbuAQ+3myuNfK5vAD+rtWPql6r2tWvJfRs2U/NlflZHIiRVMoA
	 yPl062iE9hniZONSY2v8CmLKcxSsB3JxwSqbtJ4uSZHZV74t/jnD0qucYBUbU7DVxeLND
	 RyslpkPVkGtYVBTnQzZi9JiBofYwvilPP0QIi0OhPCOopfizS5D6iMPV0YYtvzuhTwfpi
	 HoYKH+yLZaJZLbJ2W36EIQiqX4j6Iq88MrAMW4Pz7owU0BMoetV99V/akCDpiYZCbFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cV6xCUYW;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1B606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC1B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cV6xCUYW
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53669f7b518so50537531cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794855859; x=1795460659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvOfbKHC1YhEa2QpW290x7cG/RSkj9nU3s9Pf1uScWc=;
        b=cV6xCUYW6Nj32ATgj9pR3hPHUcXMAswfWFmbofUn9Kj8O2h0vBxKz+gKkblkAcoZs4
         3Sksf2uZJcrqFHnWfbGA31BNzwsf2S1dv95GJqgZVMfFGYLSB6zg6g2Fr+yuwov/in3t
         kzMGwphN2MWZmbFV+wYJtbSpA7Il47XDSpoenMocuugAiDnZMkgQe82N6D/LNCvFdxrw
         g4Vs+tRlvNQP2aXotTXnhkPG5j8fWm0uVGtEmoX6U112LRHDjo2Qmq5iAcSLMow6gR3a
         CP6w8W/FgL6u2p7O81zc788TpdcCz8lIWVKQDNRHCpvZKfTuZAAb/gE598LmoW33C074
         z1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855859; x=1795460659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvOfbKHC1YhEa2QpW290x7cG/RSkj9nU3s9Pf1uScWc=;
        b=yEVNaxSxz2uyalkse9egyc1dseg8ORcdpCFCD/Tk4k/X7kKXKe1yxAJ1yqBP98gs67
         uqHI9mNtfyUJ98DJAQ11t41VKKnp/kN6PZL7MqHxhA8KcfApwy/xIKOKbXfAgoEJzoq3
         q5UeWeoJ8sZr1VGTVat3JZfve1Y/hCP/MU0dBzRpz7hhTqxKMHye0BNkFRgGqEbmmtCt
         XuWxpTkYaRT5EzHKKCWMEG23WP/93LcQ4CgtKIwy4mnRlxd5GNFhT9GlM8RWw4pKFX8K
         eM+ZfgLFFkUeSJxCs3VA7Vu64BOI7Jm3m6Ge9+9NjgmWetE7vUN8xzHUvkKIgLYwgLho
         ZJUQ==
X-Forwarded-Encrypted: i=1; AL+hErFlhB/04ZLvNQpBV7PJJ8tVn2zgb4XG2wnVUKk41jeKkDKVPSgKtJ/RgCv3jgnzIx93LHLl+eyMT7RYmZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xiDV+eWkzC/tXvWUEvIPdkjQe6fOSBCslHfAQfqvpwkqiltT7
	+HuPOTBjERjixnQ6qSiqsHAD7LnGocvOkx3LnxTiZ3WiKwVaXGfGP8QL+cpFkfSwpQs=
X-Gm-Gg: AYBFou3TequZ8A9ltKndmAWALaA8dk5CBPJbNJBxKdCe+XoRUpxD8qZdoKp5qtxKwwX
	aMplHc/N+1oUWoFWdhjokYxedLzwZax1vRsB5BeV1xN31/5TTC7Zan+XhN4JJUEVl4KFnpJnEAO
	miFmIjJ61/uqJQfhmxDujFncmUYD/W9Rcc8voIa4vFAlPC9KJ+DDqDacQWj8UbFQqk37jsHGTSO
	/7AYcap6QuIShMyAASgh/J1LHvm+VC160JKpZh0rgzr3omH+XXIHERzm96Py+URKF2f3jlgTKFn
	sci2k+x1gZmH7I0//IcnioZVNG0lYJTvnZYgcbAmJ4lxcYk1InEtvVvA07ZHNZARFfd4UpwO1A3
	tOdnBqCPuslNfqO9g+gDIsfbMYGPnp8cpRMVutc21e/y3sCl81G9v756PYeYeqoldqZa5l7FOd1
	bpQemxkJZV1f77Fw45CvKX08GYfbFejWJbkoyXgWKyuEN+azltXNje1t9s8XuuyXt017OZQPOcH
	zodFcNgpXt3EOaW87sC0XVyy12AY6YnrLPKZjVZn0WinL1wuHmIvTiYGgD+VYLPwEJj7Qo03z/n
	FkbOCw==
X-Received: by 2002:a05:622a:124b:b0:536:9140:e2be with SMTP id d75a77b69052e-55ac948cc41mr174359441cf.74.1794855858824;
        Mon, 16 Nov 2026 11:04:18 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b13917sm87667361cf.29.2026.11.16.11.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:04:17 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT201-0000000AFsj-03Yl;
	Mon, 16 Nov 2026 15:04:17 -0400
Date: Mon, 16 Nov 2026 15:04:17 -0400
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
Message-ID: <20261116190417.GD2299285@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>
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
In-Reply-To: <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>

On Mon, Nov 16, 2026 at 10:46:25AM -0800, Kameron Carr wrote:
> > @@ -1738,24 +1738,24 @@ static void set_pcie_cxl(struct pci_dev *dev)
> >  
> >  }
> >  
> > -static void set_pcie_untrusted(struct pci_dev *dev)
> > +static void pci_set_default_trust_policy(struct pci_dev *dev)
> >  {
> > -	struct pci_dev *parent = pci_upstream_bridge(dev);
> > +	struct pci_dev *parent = pci_physfn(dev);
> > +
> > +	if (parent == dev)
> > +		parent = pci_upstream_bridge(dev);
> >  
> >  	if (!parent)
> >  		return;
> 
> Hi Leon,
> 
> The default policy here works for physical hierarchies, but there's no
> opportunity for a paravirtual host bridge to participate in the trust
> resolution when the host bridge driver itself knows the appropriate
> trust level for a device.

HW doesn't really "know" the trust level, it can suggest a default but
the kernel command line and userspace should always be able to
override it.

> My scenario is pci-hyperv in a confidential VM with a paravisor. The
> paravisor is inside the guest's trust boundary and owns TDISP. It locks,
> attests and accepts the device, then answers a VMBus query describing
> which BAR ranges are private and whether the device's DMA may target
> private memory. Before a driver can bind pci-hyperv has to:

Sounds like a user in such an environment just wouldn't use the trust
level mechanism at all.

What use do you see for enabling trust level but having all the
devices unattestable and accepted already?

Your bigger issue is the below:

>   - query the paravisor,
>   - refuse to operate the device if the query failed or if the response
>     is invalid,
>   - decide whether the device may operate.
> 
> The modular host bridge driver in this scenario needs a hook to be able
> to participate in trust resolution.
> 
> I'm also looking for the right place to setup MMIO and configure DMA
> in my scenario. Let me know if you have guidance.

Well, you are very far outside what Linux expects for a CC flow, and
these special requests conflict with the arch code flows we need to
have.

So, I don't know. Maybe somewhere in the arch code hyperv can hook and
say the device is special? You'll have to see when we get more of the
CC stuff layed out.

Though, FWIW, I don't like it at all as a model. Denying the tenant
the ability to directly attest the HW is far away from what I'd
consider as necessary for CC.

Jason
