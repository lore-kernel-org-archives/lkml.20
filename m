Received: from mail-wr2-f25.google.com (mail-wr2-f25.google.com [74.125.225.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE835012B1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963138; cv=none; b=CgSWvX92rNid8K8pYjXHJ7aPstT4BUzYwsP83affZNlUXXlxMhDwbNd9asHwn1tOSL+BZzx44iQ5EozBcbzmRind+CbldY1YcQLj5Q+y59HZ+QmMOfccnp2pFGqPntQfAXq+E/NVavALe93DVNfHBHWiKdZIj39k7oxu+qkvmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963138; c=relaxed/simple;
	bh=tuUKQXYkGnUCxDjJE1nQ+gDpYskdzNay7lbXkALLVfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aO1/ctxa4msYytvc2H+P1GSu0KKjG8h4Facf5RSMXmsRRjNTXgL0yu+LWC8IIvRawm/GdVNcATtePOaFQfinKIy+B/ZDLbrCsO4Sko3AC6Isl3bz+SxtODKpz7UyCEZekq8HO7emPJwRoofdlSkrVDGraI+zGtk2Civ+cq9ggrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPe35Kgy; arc=none smtp.client-ip=74.125.225.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPe35Kgy"
Received: by mail-wr2-f25.google.com with SMTP id ffacd0b85a97d-48b03eb33b2so63450f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790963125; x=1791567925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1e269Lu4xtW2duTVHt20I/6VEWYe79hxf4w6LtBB3g=;
        b=QPe35KgyK+Gxw4mhW5bVABKyqTpTACMfdCdcK3+8MFTzVlTSZZH3fgy+SpIP/F2Wmr
         TcMpN5trX18Nc8ZVjnjyMqxbuH4CZPirvTLgRud3czi5e1sFv5W0c0qfUp1dSmEzMFQX
         ZbZBshmVFvcNreT+UbenThzeRuLsZG0QfvwINAgHCrY5fotVLTI54AdkqEFY8MgA3iu9
         RIlLT+W9R/LsSglYZDgqk/95yYgmADmRafwSwiZfnSLu2OKPwgpaxGHPSVp25DztLFFO
         IrIKY3d8uOHaXimDNVlrdRt5+qPw8ziIXP0q78BhPWtz33F6EdFGuM6y1JzuiNsI5SkT
         PnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963125; x=1791567925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1e269Lu4xtW2duTVHt20I/6VEWYe79hxf4w6LtBB3g=;
        b=jA+iucUa4ZKkoR6ic+lO/FBrmgc5IJr1t71faCY4AD9peG4d6moNpbOGhWYoGsXm9B
         g85n7KXMiI70cmKH43qiyKRLbVhNbdGmqBQuk/uXLeWRtN0QhyLxHO2Alp/CVxpZJpar
         YJzXdCS5iBujRczE8uXkuUAVZr5S8MkhS/TVpY2pOWsZ2GrHYEUT6RvmIusWbixR9rzI
         fQ4p2gtKmzAWKEfUM6FarjOQgwulJ+D/WqhQo86/gCcSXB/9Is4XAGukwmnmMchk6j8D
         MkNTaGvpfNbvNJJnxECkltrsLYUCOkPAKn6n3bSmY/kmcY1QW3EUmUo7OcrD65WNxsGj
         I7BA==
X-Forwarded-Encrypted: i=1; AKwUvBxuRmaK5sbIprBmTdnxQzqV/rkaPCo0HYmdS7ojw7gVJnxbazkRwk3YpNPdl+f9dMtQ4BcI8a9NmNCR6z8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIc1P7cfu2Ht964y3wajN2PTc/nbbgFDjNWxPzyrp9+Hc/kZDM
	/NvvBdpm+gt6sz7Kblwu9rtc6q3L5DLS2Bi0hDGVYDCaDv1kopCCf+xH
X-Gm-Gg: AYBFou22MrzVGn8hlISchz22zhbRNVDZVQ99rraSJg1iiU0J139udVn0QQMl7/zmkcj
	k7A6MMO/3Cn58F4CBeGVZCPdGHKFmKSZJmgaDtzVStyN6TJjEQR8zg5ysmnumPjCrvfDyM2Zkv9
	0bmFv+3pyAVXsCk7D6O9RiWbRQwrnekbwtmRMX2i0RzbOlMAUI2zH118dOCvD8BU4e0IlgZnKtp
	41pi/z6vdEeqQ6U9qExqgLt/QUJZz5EBUWeZKLTbLJLZ55XBpRdPu5pbK+fEzy+9uUi4tqRx+Wb
	V6LfpqZSWwkobJl5V8PEk0Xqf8l+IsGOE1hzyR43x2iimbm1XDkjyZurSfpAFLsrPoreRwHFSvC
	rjyVP6Thok7mm4+vg0xjU0S5H55/8g6yz7MYJy+IqPyZFTzDePICsNT+W0FgauCVuIQ5+NVRz/L
	zKiM0/vVEONOFhSZmCb/U798lk79KbACs6Kpi4TAAhhcN+T/5L6vT5dnyY7eUkRMr9P/HHJDUFW
	CaMBFXLBwwZtjyZ6NgxQgxMco4AQkLTZcTDCjkDZ6FOvDaqSWwt/vawoZvGJsx5+w+vpOlKe8IE
	nz6LNSZByHa69NrpEYvjZx9OGScPivXa4oA63Wag2hmmZLCvAj7X54x6iCjRYQhXscbYJMGs8WU
	O2kKCcw==
X-Received: by 2002:a05:6000:260e:b0:48b:226:839 with SMTP id ffacd0b85a97d-48b1273bfcdmr6851497f8f.14.1790963124443;
        Fri, 02 Oct 2026 10:45:24 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-af35-1901-81da-eee8-c2d0-ee3b.310.pool.telefonica.de. [2a02:3100:af35:1901:81da:eee8:c2d0:ee3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0661sm6839400f8f.14.2026.10.02.10.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:45:23 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:45:21 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 0/4] KVM: arm64: fix VGICv3 redistributor rollback
Message-ID: <ar_tdaYQO-t1K2F_@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>

On Mon, Aug 31, 2026 at 10:10:00AM +0100, Karl Mehltretter wrote:
> Changes since v3:
> - Dropped the REDIST/REDIST_REGION serialization and VGIC init/destroy
>   rework, keeping the fix close to v2. (Marc)
> - Limited rollback to assignments from the new region so an older-region
>   assignment cannot be missed during concurrent vCPU creation.
> - Added Fuad's Reviewed-by tags to patches 1, 3 and 4. These are otherwise
>   unchanged from v3 (formerly patches 1, 4 and 5).
> 
> Previous version:
> v3: https://lore.kernel.org/r/20260822095346.53882-1-kmehltretter@gmail.com
> 
> Karl Mehltretter (4):
>   KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
>   KVM: arm64: vgic-v3: Roll back assignments from the new region
>   KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
>   KVM: arm64: selftests: Test VGICv3 redistributor region retry
> 
>  arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  54 ++++++--
>  tools/testing/selftests/kvm/arm64/vgic_init.c | 116 ++++++++++++++++--
>  2 files changed, 151 insertions(+), 19 deletions(-)

A friendly ping on v4. Patches 1, 3, and 4 have Fuad's Reviewed-by;
patch 2 was revised following Marc's feedback.

Thanks,
Karl
