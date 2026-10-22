Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697641;
	b=psi4BBdcUu0D49cu8Jr4rS1GbHUe/dZf9G2S9qnJvmQS/RVE/kGOvaQU44carBsWRunc
	 pYTpkbX6ScZ/Q7FVkkUgopF7TeXPNViuNbBPwOKijn/HctKtXbqYm6zhJUTPdUt4DfW7I
	 PXX1TJmAqydYFID+W9CwFi3YGN6S8gQbcJK6HZk7wiCb1hiXb5W9hj51RQjY+i9XIr+Z2
	 nTgH+Fcn6j8KwtnEacED6+kccM03gD/+o194o1YVVceqX9dtv0H9SNwRiryx87tim0m3x
	 PNWW1KNxoIZagb4XhYniRPAkYa8StyqEAYF33aPp2nf8JKwcdFLYvsmlC4P73ZlMMeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1WFg6Cm2FvST/tWX04Ds4MFu/JJiRPf7HeaSO2EoRtU=;
	b=4w3A24mQ4cw12/4tenQa/TiOf3MfHFkoMD3AQZcyjdw1mmYeGs7oG+51PkauLveV9WAm
	 TVxM228APyBiU7bDftjJQSh8NOoXrGCb9ZdD+VcFY8Ve5MXL7iugWsPJMAUyGbv8Or1xe
	 r1YMLL+w0MHyKEhBK9EwRS9ZcQjIEtVr77T79YivQ0g9KYm895B8u4ZA6iuxMmTH+2JG2
	 +e573Z7IhqWh9xZn2RG8Ges1gRC8c7pigTaoZH0J9qPjSq0S2c63QSXJnHDNj0HxJWTqU
	 BwzJGjV8ujzp1eGf0g0Wsu59pCbm1u3Fx4pCACGH64pgC8BWbiWAKIxduUYpgQpUL+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=QFEORPwo;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD75606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD75606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=QFEORPwo
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-534e6545939so635501cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792697640; x=1793302440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1WFg6Cm2FvST/tWX04Ds4MFu/JJiRPf7HeaSO2EoRtU=;
        b=QFEORPwoUEIZuJ6NMDraZpk/wRs4MPUQ6+p+re/ljnQxioxyGas4xfpR0cT5ehG81a
         UQFccCXpSFwMD1Bd21MdjG4x3bc3qNLfvbJjpYtUNp/PD48xYJ3Ur5tL//4MRckupdD1
         tCgAmbOtfk0zHxdZ2BNwjy7HoKdmvcKdu43eoST/zJ0Ro2QHszrudTbcDUNQCBxlU8VQ
         9rcNc3BL7PbRQjlXvp3L4JL+FBDowJGHfPUuJm5zfR3+ZwU3Wrh/UZ+ogfxNuZqK9sGN
         IPAT0Dc9Qy5pM1n8P3okX6HGQmPNVznIkfOfBbsTbXsT5a0VhuO365oKBEZoNsDFjHI8
         3iNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697640; x=1793302440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WFg6Cm2FvST/tWX04Ds4MFu/JJiRPf7HeaSO2EoRtU=;
        b=KONkK5mMtHoGVFkTOniRlFXqqhxItv2D+IERUstO788NaCOenmMRdleTdVwTTRrO+i
         v7ND73s7V/yYDR1yT9UCcoZK5KiH586NZWc9o/CLkpQ0vWPxw2ANUW6HCE2FQsLwzdi+
         xbNXwHXx8hBN7e5Day36pg2nXV6jG1ptYydf1sP6o1hOf4r6ZalHJWLWvBHCo3ftTXkX
         o5OPWEF+ACr0G4kSH+a7A4FIFsg2dyP+URC3Vd1BwXUrX1gaPEvGus0UkqhIKFVZ6lDs
         Skq5QcXqXaO9BeaY3JuMvVXyGSp2uwXJ0l/NzT/wx3l5mpX6I7HwRJzN9PJM5mVhA6An
         7oUg==
X-Forwarded-Encrypted: i=1; AKwUvBzY6Sj2/3iSzy96hJo8GcdngAGpDeLi7XIyITQzO4egb1mK3CNtrzvt33wRTBhHI3gxM/qAt1GRTDv5S/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbmWThTw0XMxKtOVMVVDHUiaS/mQUuC4/NLAf99P2XH+tR0JeO
	rmw7yjx5DM02MB09kOUgiW/XWBzT6pO7gA4iUdaiZ8K5bOXfillhSwmsReQ8e6OIw9FemU3EZZS
	SOVXo
X-Gm-Gg: AYBFou03HlhhkqQn3KPAzVEX7YJ22YZo6eWyXAVLLy53EU4ZIDinne0yRxkKOUEmp0x
	sPkoXvJLrvqxKrvNI6c/79O4mt6PWBqsHu51oQb6RZeROivCAd3xu5R+6iH6yFIfYhqTyxYQpnr
	HBQgg9vDqsEmaG5PowQXiEMw1R5B08PFku4vgAvXZhq0taBXdBtqOJjZhsGALHT3KvtQl2v9T4U
	mPwL+kqoxxjCCo6eOTLWtiJrIa4Emu3iVWJA4CyPYgRU+7nQUC3la33YUWtooPp992JfGAq0M7v
	EZwmgcdQVucMky90znbR6ZtZ6VN+/0OzPPZ+uIgeUSwXit1/OYozPHKD02mU+4eJDAe8vewIZu/
	fGz7cnRa3FJQJ3f8ji/HnhZ7kyPSzVniMjw73BgB5PMCywcutl5VeN+lTzJkr2uiTdRDoxHg8n8
	0iX6WkCeZxz3TM/TrJprOoVyEUvpm/AmhVufE7pCxKUNtCBqZXfSHwp7KEHLW4FUMXP3u0dvjPj
	L1pVOvrR/nhCZFWN8z060EBemMB/p5DBVRKJmXRkF8Xx7lXYuJym4WNxoLuAyUulbdmSFQFYAZW
	NohRxzAoU77xCbyKnSMLN5d4NmeYEk3p5rEPUQ==
X-Received: by 2002:ac8:5cc1:0:b0:535:a5fa:ee0d with SMTP id d75a77b69052e-5369bb95d51mr93655331cf.77.1792697640024;
        Thu, 22 Oct 2026 12:34:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396e8d07sm449806d6.22.2026.10.22.12.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:33:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJyY3-0000000FmMC-02vs;
	Thu, 22 Oct 2026 16:33:59 -0300
Date: Thu, 22 Oct 2026 16:33:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: alex@shazbot.org, iommu@lists.linux.dev, joro@8bytes.org,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v3 2/2] iommufd: Add IOMMU_GET_PCI_MMIO_WINDOWS ioctl
Message-ID: <20261022193359.GF3381610@ziepe.ca>
References: <20260921115513.GK11599@ziepe.ca>
 <20261004162213.3787623-1-guanghuifeng@linux.alibaba.com>
 <20261004162213.3787623-3-guanghuifeng@linux.alibaba.com>
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
In-Reply-To: <20261004162213.3787623-3-guanghuifeng@linux.alibaba.com>

On Mon, Oct 05, 2026 at 12:22:13AM +0800, Guanghui Feng wrote:
> +/**
> + * struct iommu_pci_mmio_window - a PCI host bridge MMIO window
> + * @start: First PCI bus address of the window
> + * @last: Inclusive last PCI bus address of the window
> + *
> + * A memory window claimed by the PCI host bridge that a device sits
> + * behind.  Addresses are PCI bus addresses (i.e. what appears in the
> + * TLP), which differ from CPU physical addresses on platforms where the
> + * host bridge applies an address translation offset.  For a device
> + * using an identity (1:1) IOVA layout the IOVA equals the bus address,
> + * so these are the IOVAs that a PCIe switch could misinterpret as
> + * peer-to-peer DMA and route to the wrong device instead of memory.

iommufd has no way to use devices that are not 1:1, don't talk about
this stuff in the kdocs.

> +/**
> + * struct iommu_pci_mmio_windows - ioctl(IOMMU_GET_PCI_MMIO_WINDOWS)
> + * @size: sizeof(struct iommu_pci_mmio_windows)
> + * @flags: Must be 0
> + * @dev_id: The device bound to iommufd to query
> + * @num_windows: Input/output number of MMIO windows
> + * @windows: Pointer to the output array of struct iommu_pci_mmio_window
> + *
> + * Query the memory windows of the PCI host bridge that @dev_id sits
> + * behind.  This is advisory: the kernel does not reserve these ranges, it
> + * only reports them so userspace can choose to keep its IOVA allocations
> + * away from them and avoid accidental peer-to-peer DMA routing.  The
> + * reported windows are pessimistic (the whole host bridge window, not the
> + * precise BAR ranges that may actually conflict).  If a IOAS has devices
> + * behind multiple host bridges, query each device and take the union.

State clearly in the kdoc if the list is strictly non-overlapping, or
the list can have overlapping ranges. It makes a big difference to how
userspace has to process things.

> + * On input num_windows is the length of the windows array.  On output it
> + * is the total number of windows.  The ioctl will return -EMSGSIZE and set
> + * num_windows to the required value if num_windows is too small.  In this
> + * case the caller should allocate a larger output array and re-issue the
> + * ioctl.
> + *
> + * Return: 0 on success, -EOPNOTSUPP if @dev_id is not a PCI device,
> + * -ENOENT if @dev_id is invalid, -EMSGSIZE if the output array is too
> + * small.
> + */
> +struct iommu_pci_mmio_windows {
> +	__u32 size;
> +	__u32 flags;
> +	__u32 dev_id;
> +	__u32 num_windows;
> +	__aligned_u64 windows;

IIRC out_windows is the convention in iommufd

Jason
