Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13FA3EFD26
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900231; cv=none; b=SnfVz7JrvqhP1QllHlm1AtIEK1o8Oof6Tr7UeBKO1YtDq1Uii50fgEICUFTWFiDrRKT05e7vYdyR9UW3ArVWklptGCx29ES1eIn8DTwWx9d2aL/+dEjLFigfJ6y7vwZDBe/USXl/l03g/iJxdZ4SeAbfX93sKFcLoiun9Ir99T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900231; c=relaxed/simple;
	bh=UHry0BPkquJw/CuJwnGhyuxl/slkjmr1qnD/xn81qew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5FWVtQVIPnWcESUZ7dwePHHNj0WI8HvFE8CQZIspdYtHg9jJ4ik4aFhY3d0D7mwkgUlV2Ed0pP2deNspvBL7inLcujA1z4n/ifrb/Jfw/xXxUgGXw7ailVSGY+Gec5W2PPfjcX00TzrdIdtNkvWoG+isyGW9widX9m/voijACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CBEzo/4j; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CBEzo/4j"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98929bb8eb0so790093241.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791900229; x=1792505029; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=;
        b=CBEzo/4jeiz4WlID7U/njZM7AWjCMFsKhRPE2lZcPfdbjT5/IhMC7CPhAthUzS/zjC
         7JdpJuzrx/MaN0DflF6oAbENcPd/EKLzlkXO3xhW/4F5syHofVyYESUmZBXMOG8P4d/o
         U0+8nId/s3j8PBkkGKMw9+6JThitqmt/tGl1U5Nh1xq4Hd0djOAhqJt0lU/i0VlyiGGx
         3lIrp+VrVqteNUBHh72uss+6qHhfv911OjNj/lBhTo0M3tCp5OKbWWQv6+N+m74fPDOO
         CCafrXkio5dlBgBy0OeRosZpOR483gn1R9Bmc9hfkBJ3Hjq6TdOR8etcp4eTP7mIJR7u
         MRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900229; x=1792505029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=;
        b=xTVCu0Nv+yERpT7d7Hs64xx1nMZ28xhEnsgN8unL+B5Pi9d5eCg7tfe0zJ4BOsP45P
         xDDTpM2SYegHtyRm8u5zCm+8O3pH2uCPL19zPYvTLf3lMewaiJnoOrZf2o0DMNYw4iBW
         KJLJKXOg5bToSZRreGShCwR66Gnj8pbc8uvaUvgCEIA/8G8too+1mWTNR2OP9fGi4uUr
         ORn49NB0dhvxLT//H7iCJxLLS/jqAzu69ClvB6NEIP90KS4Lv9ni8G07lgGDEQfNTiwA
         xJOMby/e8kbhncbBPZQthPrJbOzfHrSViJaVB3BWZkll6zYwUCwyCuDKq7iFAqOwZmwT
         EcDw==
X-Forwarded-Encrypted: i=1; AKwUvBwvtbWZArVJykyYTG0rHLb/jU2rDD1ZQWqvvjcJJex117Rq7czoMloA485T8neuR0fTm4Emiht2uQJzE7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTZvlIVn4RVTgLT3YemAlY612q8+kFV1tpHF2ECLyTeZT4fsul
	XI/eDdoAzFm7dzHuZhvCjAIQsuDSrpjbnJmncdFcZi6/KKMa5Ssdt4j2FLUAjZkii7w=
X-Gm-Gg: AYBFou0pQDcQU2+OdlnQ7KWkDTna5IenkP0KhWCzmoKkgt79PMefvTImHXRYXVyCI2Z
	ZroQPyRZD9gq4iAl1782DOsikP0RQ24SqFcMlkA3s7PkQCZSzwVDtt7DcjJQG2llQqUE2AZGdFQ
	bgWL0jchgIqV+NT80H3ld27nxjmZ2wLQxlrHyKjl5ME/wS8DUbX6rsfmDMrCNS5o8d1FDgI+TiL
	nglsldAv70W2KSFYaspfl7CtvJgsse3/VBAtA8Ks/dRkLgywgk75pc3bStqKDi9wKtzJIyTz86l
	HGujpFOZv0xqefHbKdEnM+BitNgXblUPvKAsthFZcR50cKZjBNNojULELtIwJVY/v6VwKQSUIru
	xJfZebLUFG/AC1cQzyUKGox/B1wO0HSIPTG6VEi7nUvvjsYqbdaiK44iAHjdNQLvVFr6F4D++gi
	5NyYPB0R1sW0GCCfgJQEEZO8EUpcXaq23p2aCCjO7Jh0MrLFpBei9eQiu2rDGx3XS+zekltbkma
	LqK2Bx7gynMJz8dr9IWIVshVPYIli6W1RxB3226+dSeZNkXRS6tXydCKw==
X-Received: by 2002:a05:6102:a48:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7cb373fae29mr3183710137.32.1791900228555;
        Tue, 13 Oct 2026 07:03:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bdfb89sm25903626d6.40.2026.10.13.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:03:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGd6X-00000009i6J-387e;
	Tue, 13 Oct 2026 11:03:45 -0300
Date: Tue, 13 Oct 2026 11:03:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, bhelgaas@google.com,
	jjohnson@kernel.org, johannes@sipsolutions.net,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	mani@kernel.org, skolothumtho@nvidia.com, yishaih@nvidia.com
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261013140345.GK14213@ziepe.ca>
References: <20261011132558.GD14213@ziepe.ca>
 <20261013134317.174234-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013134317.174234-1-jtornosm@redhat.com>

On Tue, Oct 13, 2026 at 03:43:13PM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi Jason,
> 
> I understand the concern about compatibility implications, but to
> clarify, my intention is not to create an ABI or a "MSI caching
> concept". 

It very much is an ABI, you defined a new ABI in the config space a
layout between guest and host that we have to maintain forever.

Just for a hacky solution, it is not so nice.

> I can explore converting ath11k/ath12k to
> platform_device_msi_init_and_alloc_irqs(). However, if I understood
> correctly, the VM problem remains identical after that change — the
> firmware still needs physical host addresses, and device MSI domains
> in the VM would still provide virtual ones.

Yes, but it removes the solution of copying data from the existing
MSI-X table from consideration, which is the primary hacky thing here.

> I'm happy to do this refactoring if it opens a path to get these
> devices working in VMs. What VM mechanism would you accept for
> exposing physical MSI values through device MSI domains?

Once you have a MSI domain you just need a driver wired into it that
can request and get the physical addresses from the hypervisor. Then
when that domain is in use the guest will always see true physical.

That part is easy enough, it already exists and you don't need any
driver changes.

The bit that isn't clear is how you get the domain in the first
place. I suppose something like a virtio-msi is a good starting point,
but I don't know enough about ACPI/etc to imagine how to wire it into
the flow.

IIRC hyperv does this, so maybe there is something to follow there..

> Jeff is escalating to Qualcomm engineering again (thank you for
> that), but users with deployed hardware need something working in a
> reasonable timeframe.

Yes, but it has already been years, and Qualcomm doesn't seem to care
about these uses cases, so I'm not sure I see the urgency to do a bad
ABI hack..

Jason
