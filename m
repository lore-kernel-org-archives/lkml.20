Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788073;
	b=RIrinCbkWdbM3s2iC2rSBbex/tnp/d9DUvU/p8fgvWh9QLiEUyOdFlTyRB4UMxB5zv0E
	 WdxMimnxnr7K6fT6r2nke1wYhDkajzKpt7QclPCh6GtfRZCYXV7pWcCYY+bYihU7I+KE7
	 yooNDgaE5AsXV+OtS8+uKgzJaEu7tAIsUXmu6itauGZxIZNCc0xDVD3hK8nx5zRRVqiuD
	 11bgA1YFkihOc2R4yD4hyS1Qk0iJ9AZMOngLCbB5Ak5hsPrZ1HJcRwI+aEHqI++zGPAvM
	 8y8UZwATyDYcv4qE7iPksnAdYFGxCp+YdRX1i3rgmbTIw7W+gXaH6PkFUir6zizP+dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oxlAWrEkafenvw/FjrtjbduyFLL/BjALYNiaNpikrTY=;
	b=PwAIjjSwoOZAuUEkwA7W1MVw0xVixFIx2m0RQqYVSVefVcRAxxsxeZjwFA2yb0NFrqcx
	 2bmzqUUXgf6VLC9LDpgbiWkF1HPcLpCoLEPkehcIRWC3Vonb1KbnLDidVfRQhT8GXdu3c
	 xyxJAWkUwXMgCIQR0dbwIPn/HOzfp5JwXXFPk00xxpoR6tpHM0eshdPKk8Ul1qLIjXQMx
	 r+PAsbHq+VPhOskjTZfX4G8Er6oC6M4yFTQ+19pyO85gxPPpTOrv6Q51MgvV40AKrydrw
	 e6sHlIfFAoxN8trCBP2P7UV23jNE4XCISG8OJ7i5NviygMlXSa5q1aTBPfWzuk8zA5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ETY8VoT/";
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD51606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD51606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ETY8VoT/
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so9723a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793788072; x=1794392872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxlAWrEkafenvw/FjrtjbduyFLL/BjALYNiaNpikrTY=;
        b=ETY8VoT/f+gDU32SGXFwti5vr5fy0yPG6zRSjejzpQMJOVav1+tZqMyte9EyF+4IgH
         MRjXyR3rRsdcXoeKpcoHArC9/SxZlMktYBlTbH+p5n1AVBtDVR7dHfaIjeIDkHwAiBIu
         ecAm00KOZxHMW4azoXD3Rk83uDFOqv2kDZdYCIPC4ScTXNMup6y+qGzCbcsq+sE3NSdC
         l4bO+Ci9F2o4AJsy2FJkWpS/3buA0DTrbXiJolnxhXCLPEtLIHpVG3Okxp1grtyffcs1
         CYgX4q74LfeC9PpDxlC43DVAJD3zZNyhwtgmvqgB+CDSbNqSP6LAuvTg0dnVsoSaa1NP
         hlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788072; x=1794392872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxlAWrEkafenvw/FjrtjbduyFLL/BjALYNiaNpikrTY=;
        b=mjiHRwf60Sn1UL7/OTDpoWzqY//AySxe8/gt3yiZyjmeyYYqWnXLMMznDEiswxh7VG
         aniXbrPJfovU6Dp6kdqikNPVJuddgn0c+mxHcMnxkM6GYAI9KiAzcvnptFaZ1LEfcxXp
         /FRXZVpdcqB6XS6zJWPbHR/yjSLIz9RqwCZB8JWt5x9q4SYNMHOP33f7w9pF8r3a/UYf
         BEt5G/jrNEU5TG0E6h9nuQYXcMeCpuq/xkLDzrlMBp0o0ZWZNWoKVZYUzS9s+oKGDxBW
         f36+f5FFytC+7m4UpNRv1Go3117q8TZ/9LaU+I/sdZmBnplHeBUK0hRV3OmkZ1bXDfVD
         28nA==
X-Forwarded-Encrypted: i=1; AKwUvBzL505UG2+MgI+3wtmGg7IDvQ1fz5AR59ED859NF2HmQGVrzkclFHQKdSRn3py8+tRMvSLTySQ/V05Qmyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9PJyXsLX/DGMQXPUvpQ3Zx6+HlpnJMc9qsAFODQ/HyzH43vGi
	+ePr9s4xlpq4454POZYuBLjbEu/mLSpBD8pvPyUwJqjoFxphQ1su9FLnyecXwH3pzQ==
X-Gm-Gg: AYBFou079CG/gT3KWQWyoqN3CYpFLr6wAnnqE4O5vLFW9Dl+8fYHSw/WEGFz+y5HZfC
	sg1D4SraLtqzz5n/ian5uRpmP4GR3g0hbxhXbrCiGQfQQPwwLPps/axUDMsf0HJLABl/fRLzdmm
	1hc0BVOd5rXDZSppsmHjKHF109UROXLRCsVF3YPu1860zL61pSCrgNQR6YjGPN66MMyPUITxDru
	jQrMIwpGoi/iIcXd0Fr6CoKbZTPFUYwfMGwEVGtVidxPONJAtmWdnpd2vxLLB1vgRYKE31Ab/r9
	te2Mjgp7XTUbmqMit01w041ta2uvoP2AnaNG+hy0z6muXa6skoW5yBxbRIqGVzDuxO98NpT+6vT
	HULHnjkQnUK20zbOZVH8ZHSwjiYJO+7Md/Rue1JVGsXmfcv7Q2tn3a4UHMNLZCuTID+E94tsDFG
	qNr4JCvNb2WuVOKh5Ce2FWlD8yEog7qF12NUK2rAxajd8mfu8jUsDtG8kbzFhhrsG3CxY1nD+SI
	wiswrBGYg71Hby20CZY/EiLNBdLBcvZ/1H+Sa5tZWMhkMfDUpMvYTM2rCxvkn2CqPwBYFE0Y1zy
	pO7RTcP0BIanTZ8AbSXJRv9Qkjscbrum3DDk0Ki5YmFTBvbkj7SrrgtXSSTmLhwAe+PpyyCTUpj
	bzSi379xWKKqzmbKO
X-Received: by 2002:a05:6402:20d9:b0:6b5:5cd3:5dc with SMTP id 4fb4d7f45d1cf-6b55cd3077fmr36964a12.1.1793788071437;
        Wed, 04 Nov 2026 02:27:51 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41d670sm54601366b.23.2026.11.04.02.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:27:50 -0800 (PST)
Date: Wed, 4 Nov 2026 10:27:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Wei Liu <wei.liu@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mukesh Rathor <mukeshrathor@microsoft.com>,
	John Starks <John.Starks@microsoft.com>,
	Souradeep Chakrabarti <schakrabarti@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH RFC 1/9] iommu: Introduce external attach domain type
Message-ID: <ausIn5Txiy1uRjkY@google.com>
References: <20260925190742.1575380-1-jacob.pan@linux.microsoft.com>
 <20260925190742.1575380-2-jacob.pan@linux.microsoft.com>
 <atiakDqtuED2cTM5@google.com>
 <20261026161003.00003b71@linux.microsoft.com>
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
In-Reply-To: <20261026161003.00003b71@linux.microsoft.com>

On Mon, Oct 26, 2026 at 04:10:03PM -0700, Jacob Pan wrote:
> Hi Mostafa,
> 
> On Wed, 21 Oct 2026 10:57:20 +0000
> Mostafa Saleh <smostafa@google.com> wrote:
> 
> > On Fri, Sep 25, 2026 at 12:07:34PM -0700, Jacob Pan wrote:
> > > Add IOMMU_DOMAIN_EXTERNAL for externally managed domains that move
> > > or attach devices to another VM address space provisioned by an
> > > external owner, such as a type 1 hypervisor.
> > > 
> > > This is not a paging domain and is not sysfs-selectable as a default
> > > domain type. It requires external owner context, such as a vIOMMU.
> > >   
> > 
> > Can't we use a IOMMU_DOMAIN_BLOCKED domain for that, AFAIU, the host
> > never inserts any mapping?
> Right, the host does not own or install any mappings.
> 
> The external domain type is nevertheless useful for two reasons:
> 
> 1. It allows the pvIOMMU driver's domain ops to do the MSHV & Xen attach
> and detach hypercalls 
> 2. It allows an externally managed device to leverage the normal IOMMUFD
> device-to-HWPT attachment interface: VFIO_DEVICE_ATTACH_IOMMUFD_PT
> No new ioctls.
> 
> It also makes the lifetime and ownership clear for IOMMUFD and
> hypervisor, the device can be returned back to host iommufd owned
> domains once detached.
> 
> In pKVM case, my understanding is that you have a emulated root SMMU
> which does not do hypercalls obviously. Then the external attach
> is done via an "out of tree uAPI through KVM/VFIO bridge IOCTLs that
> proxies those hypercalls."
> 
> Therefore, if we were to park the device in blocking domain while doing
> external attach (as you suggested), this requires a new PV only uAPI
> that must support pkvm, MSHV, and Xen. So it does not fit in the flow
> supported by PV IOMMU root driver.

I am not sure I understand this, how can the domain type change the
uAPI? can you please point to what breaks in the code if a blocking
domain was used?

Thanks,
Mostafa

> 
> I don't have a better solution for both pv and emulated root IOMMU
> drivers. Perhaps others do?
> 


