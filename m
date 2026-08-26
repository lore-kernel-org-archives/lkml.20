Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D933B27FB
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776645; cv=none; b=P81zugHTE9CZxaefpnDKpaRsNKj7NpnOarkYgAm4LqW6g1XctZwVGIgiBA6IEgq83B2CpSdv2Z/gJCtSJOMWLk0k3akCg0LqZtjj//VFMdTpb7MOiZS/mmJvzAPZpleG4r5JN2+IzQIsOE4Eww7S9YfkXFIUQ93kT1OG9/ccQFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776645; c=relaxed/simple;
	bh=YBYb28lJo+o6sWxWkJtKpwJvq7b6MSb+mLIbxMdLQwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3DIN36IUtWEjNBmCATZEuVd4pNaJpFbu9RJ6/m8MHeOa5Y7rNG/KUYYje89nFE0R6YjqLeulxyb0CxvtV+lQNUSEuHWaF4RApfZhCZYjXHcMgn3abtr6qLOm19E5hcFrQtSTBJ5awUzcI51xk3H5ae4F17nJAk7u7ILQp6XIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UmTA5jyg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UmTA5jyg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d3b440b97aso8525ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787776644; x=1788381444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YBYb28lJo+o6sWxWkJtKpwJvq7b6MSb+mLIbxMdLQwU=;
        b=UmTA5jygbGLVv57VODY1QuVX+2StkJ/6WCNDnZp6KmYiMa2eS2RXD8rr63itsLF/Rk
         Frv2ILod8FyqJR0kNbMw9lAmU9zefHZm+gi9MSKLKUDXfW9AM2ss+LUqS0YzSdJFbIuf
         jfSkJSmfeAvfky9JuBJuESoe9VeYya/TOUMn5EN+k6tab9Nnbo9n+4Lc4BMn5v8yavzF
         HrX5jbrsXj9kC8RDiDM2BKLgfwETb1PWkIJ53c+hFMqCJpOO0RhfEWn6DsXMYxxr1lYD
         y99fEPa/LKDfqCItGTiM0cnvAQ83ZwEADDBRtGM7qZXN4fPNz//ie5Uw37C3wP7uor3D
         pyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787776644; x=1788381444;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBYb28lJo+o6sWxWkJtKpwJvq7b6MSb+mLIbxMdLQwU=;
        b=IXvOnvzOyqLuF8kJPP7LtWjRa+lcI6z3+6vBBP0ywSZdBE1BKWZpwUUX6+D9Q2ZRtL
         mDDq50qZ4hu9qpnw9vWzxH75kaW8oyrMohYyqsI3H4+u7QR1ohAcKdL/r4x9BLUVhotR
         SE0fYYtbvD/QQm3hncvXzOglqR2niiHVIDiqRywh/Dm8ify6Ud8U0VdWIoCow6XKRZ5E
         6wpubITVK74/lJyJPy3tJpzJSCom1idD08oheoRIMpx1PjKbu1brxFvQo1ui4RbgsKZ/
         qNsBNS/tEPsgPJUeImseF8TRJ6agTbKUsagLYp6kBM1RlR/a0kUD5f6pIP9TmF0hVv5Z
         0ueQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpUJcmnk27ZivNQPRK1uxJrIkcljGzRqv8nSKO/SkFjBm6FOKyRdpJnLJ9vzbGecWYtLFAj9Na6lSOYpU=@vger.kernel.org
X-Gm-Message-State: AFuF++lDrVgk1MwLpjguuyPlvwtPYbszqWmgClNE3OTujhyZ28HTj5za
	4ld6L8rmdjDkN1yrE+nyRy1I52ZoHYQCZr1ziK46Z4t8USO9QBmdRRaOZwwwFaQjBQ==
X-Gm-Gg: AR+sD11Di31a9Yvvi2DfyOX/yd1Fo2Y2NvHMZTcmzgiYlADxWbwLkulH51qXoKEVbJt
	kLrIs0zjSW5Ocr5NlSZU7yB3GdPB/8NfQ4GJX17rGSnIYzNf14NFrg/aY2G6lKL/klq7RmyqCb1
	+/Ulr8rEZX4dRA0/M56AKB0D4cQyewteKKO7AYYpKtypHxMP+ySS4WnaaHw4DmT138HJYOmxTG+
	XN7VMsGk/p8sEFptuIzMi6hcAYAZUb6jmurlh3bPZJScn8svXGnHWyqF+VD72tc8LS9l7fqcl3e
	Idsk5wvm2yqNM2EfvBJjCZVvXfc1NlfKrj8EOSouYbMCe6a1lcNdD3gsmiFdhJ8NiKJNKrNBDVp
	ThlBj/8nIewbZ8zKHDdLhPVnfxm21QhdRwV5lU7tounoSHuV6EBAleXucU6V6VPh6QkjMO+k4K1
	FRN2Wawm248WhGiZO5UmVg/0R9vsZoC2X8+wEo962ATZt5L5c2bDEXTLRM3djeCw9umbAV7xzCD
	24o8Zujb5qQ8TYwOeiURrsnPkPrK8GCFSM8V/QME8AiQNORU9/+e19d88nAtUqB8A33rQ==
X-Received: by 2002:a17:902:f545:b0:2d1:1d3d:97c3 with SMTP id d9443c01a7336-2d733662a3fmr39975ad.13.1787776643126;
        Wed, 26 Aug 2026 13:37:23 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cf3e982sm1302094b3a.54.2026.08.26.13.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 13:37:22 -0700 (PDT)
Date: Wed, 26 Aug 2026 20:37:18 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, 
	David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v4 08/18] iommu/vt-d: Clear unpreserved context entries
 during shutdown
Message-ID: <ao9ONwUblaEqIpot@google.com>
References: <20260808022723.3893618-1-skhawaja@google.com>
 <20260808022723.3893618-9-skhawaja@google.com>
 <446684d8-44d0-47c5-9301-172c55efd950@linux.intel.com>
 <ao7ccBlV9_RXT6Fe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ao7ccBlV9_RXT6Fe@google.com>

On Wed, Aug 26, 2026 at 12:30:40PM +0000, Pranjal Shrivastava wrote:
>On Wed, Aug 26, 2026 at 04:05:51PM +0800, Baolu Lu wrote:
>> On 8/8/26 10:27, Samiullah Khawaja wrote:
>> > During normal shutdown the iommu translation is disabled. Since the root
>> > table is preserved during live update, it needs to be cleaned up and the
>> > context entries of the unpreserved devices and root entries for the
>> > unpreserved context tables need to be cleared.
>>
>> The key assumption here seems to be that, during a live-update kexec,
>> most devices do not go through the normal iommu release path. Otherwise,
>> their context entries should already be torn down in the
>> iommu_release_device path.
>>
>> Could you please confirm this assumption and add some short note in the
>> comments or commit message?
>>
>
>Yes, that's correct
>
>During the normal shutdown paths (i.e power-off, normal reboot, & kexec),
>the kernel only calls device_shutdown(). This path bypasses driver
>unbinding, as a result, devres_release_all() and iommu_release_device()
>are never called. Those devres teardown paths are only triggered when a
>driver is explicitly unloaded / device is unplugged.
>
>Since live-update piggybacks on the kexec/shutdown path the unpreserved
>devices never have their context entries naturally torn down by the core
>driver's devres model, necessitating this explicit cleanup.
>
>I think we can add a line in the commit msg for this because comments
>might create confusion if similar comments don't exist in other drivers
>performing Live Update. What do you think, Sami?

Agreed. I am going to add it both places.
>
>Thanks,
>Praan
