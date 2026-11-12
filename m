Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490369;
	b=XBGwjaYEe0IlyEuupXVtE/Y9KrIf1+N52ANt2OeqUmBvhlvmhnMOV5Sm/H95Iis9z6tV
	 ASpTKj6z8m6Sw/EObM1c/MYKtAaqixYna7yQ3VjuLmI7312fQ+jfMJPFC5L/IQaZ/nnU/
	 sImhOEP9Qigz5dpA/laONmAPRDONG8fZv2x8AdFPccM/R43TD8t/lFomO5D6o//bGIqoq
	 xK1w64r/kD7ZzDOCjcbe7rGkzwt6/6nZ+4RH4EQqotPOnU2G/WRjTire8kSGf0tt0Wnyr
	 gw/cyu+lggL+1AlvF25Kf0U4ouhjKOvoLMlIqo10wGgS3oZV+ux0k+DiuPNjPS0fp9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=y4NWcGpyLAF/FiolKWe6/Gbz2ERucyrW993TXlYX5t8=;
	b=K5t9rzfcO2txB9V0We0OT2JIkMkQwXq5nvWEyV/XToiCaPsu5xPNerfzWwgW/waU7XvW
	 9z/qPuc84Jc8UudEXPc4ldYVw/SpZ+ssBBULsOBpX9o5a4gN8bmt2B8Nu5C9PfyRD11ii
	 G4d9pcCncfI+giUI2qeU77rwCI8A/Oq8IZgQvL60u5ANaJstjJZW4c17IcC2kK/zzSwcW
	 5sxvBhQTn4S1Wp+iUCobDfVH4RODhkr8d0tH/XyXDggE+HykkpndvLTBS2/9byCEIJEzY
	 EmiZnVCNpPVHgVM/FuxdXis+64x3UpFOOd2LI9dsmrSxUyaFbdorStVocsbs9FOT4SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LWwUi1yx;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LWwUi1yx
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso43825e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794490367; x=1795095167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y4NWcGpyLAF/FiolKWe6/Gbz2ERucyrW993TXlYX5t8=;
        b=LWwUi1yxTfrg0I63qlax1OCuRVV6TeG09VOHFa/e8E+s9gjZJGkpW9WSTXTBmVVhpi
         yyMZhVm+6o+DQtOBXsfPxDqdF1hpzBspGlZ8mT+rncwdZz8YOQR/AvL17IfvhL0M5iuo
         J21UuIlij+08aV9iSZQ+FPkzXijmjz/bmVTsBnq/L7ysG9qMGWRi+IaDq7IaHSxMDYgw
         gzefDwbbFaq3V/En++FWgKW9rY7OYW0ZWhstbik9SOROHzAOTt/Z7IsyS/X5opblaPey
         i8UjzBn90p59+MVHBb6rWvuvmHa3kMzFy2Xul47j+6VOzpxfHslYxO76ltRCvce6dNhm
         FYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490367; x=1795095167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4NWcGpyLAF/FiolKWe6/Gbz2ERucyrW993TXlYX5t8=;
        b=htK/GsvIrwucuqSH0wlKm/AG1pOjuUSgYJ3oZT2YWiP8lcUjncTrA0q4qEyLNDHVSd
         nkVBOJueFxF7u5jTnRp3WRq5bbsLsAplykkljk+c455CU6LcZJcVI88I3xLAi3nZpejb
         sA92BViAmn7ToP8ZwIDJF8tIaW7szI+KievhkDY+11nQvayjEUt0WyiKdVKPWT1yoYYy
         buHUrAa6zzZ9VLaOrZeBPrOvCIH/NfHIMG11C5HZ70bLxSa709gej99S6l8NI/UfUZaX
         WOVX3g1LKkDtCM7NaFm6u58q1fWdZLRzMbFGwD/pbdV8RpO9MZSMQdEq7+DMyWPyM/Qw
         Xu2A==
X-Forwarded-Encrypted: i=1; AL+hErGeAKFEdj9muGiLupWzY/O+oY0kK1M5lkbKlSzfq1GdmymRYCiNLXSYM81f8Y/B3a9ccXtsEkP+3pu6D4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n+v73fP4bC9BJD40xFXUxBadnDVjgiTMmq7mwjXECgwoiA7GR
	HE8lNccm9d6Zz8PgbKX7a4OsGbg9bFvchh/lc2tV2gmx36GfP4YIbmNcsubGKYI0ZQ==
X-Gm-Gg: AYBFou3c9mxR3OU+eBjAildY+whCyWSee12uxUK09j8TD9eYYQ6wzhENdx0p7p4n3gl
	BDLerUPGdI5I5qzl8Tzvx5AXegf4AI7NCkmJ14YQru06fLOL0EESTQxf68umxledgX1OiZpfWOU
	XqyA/wtfKoSqrbWDSOQLN/+r15HobXYC1b4CD891z9busFuVD4zlLbwaW9xlGOC9f7kRpFZ2JQE
	LiJpN/flZy8A5nVaMemrwBPwZWqQojT+G5FwA7fb4B5MpLv0t93hc1cbBEPaxB1QQjnxmnRwPoY
	hXBn57p3E0iNc71MOablL6+0UXB2fn5DcUlbnTUJ/BPg0IY2RQTOWby5BluMBcJN5RoLJo8S5y5
	mNk0iGpAFimTQKkEUjOyXM/f4K2Vb626JnNbesyAp2xquBpnhbMUrMlnIejXbbPAbpGMROjIPPu
	MJI+UnUgoIcyXqGoqgyJjok+VXbv/G6pM+lso6q1UOcGzf/I1rS8nk0MrXyT2Ajm80ryrzvOr2V
	DUh92vcMAdfo3wqc0HMumsjAOau9+x0Of6jEyUKSPuTg3jkGeQPfEgre+jhFf9Q8jquqBYjI0Ei
	K2WWLaoiGjP9A9MsWRFURrVMDO7oF7IAiVhpe4J8hai36+BEPT/JneA+CvEtkDHhZ9reQyydUYF
	WGA+Q5vyb2slX/PcQ
X-Received: by 2002:a05:600c:a115:b0:4b6:c939:3bfe with SMTP id 5b1f17b1804b1-4bb4ff4ad18mr794835e9.8.1794490362201;
        Thu, 12 Nov 2026 05:32:42 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm17339835f8f.11.2026.11.12.05.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:32:40 -0800 (PST)
Date: Thu, 12 Nov 2026 13:32:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <avW_9A48mtnK383x@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <auzvygiGRTWgJXzF@nvidia.com>
 <avGk0ilyJh3obmKx@google.com>
 <avJidXM9yQOX4VBJ@nvidia.com>
 <avL016l_xASN5paR@google.com>
 <avNhekBYqiiZ9IM2@nvidia.com>
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
In-Reply-To: <avNhekBYqiiZ9IM2@nvidia.com>

On Tue, Nov 10, 2026 at 10:24:58AM -0800, Nicolin Chen wrote:
> On Tue, Nov 10, 2026 at 10:41:27AM +0000, Mostafa Saleh wrote:
> > On Mon, Nov 09, 2026 at 04:16:53PM -0800, Nicolin Chen wrote:
> > > On Mon, Nov 09, 2026 at 10:47:46AM +0000, Mostafa Saleh wrote:
> > > > On Thu, Nov 05, 2026 at 01:06:18PM -0800, Nicolin Chen wrote:
> > > > > On Thu, Oct 15, 2026 at 08:08:42PM +0000, Mostafa Saleh wrote:
> > > > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > > > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > > > > > +/*
> > > > > > + * Two devices are involved: the aux device bound to this driver, and the
> > > > > > + * physical platform device bound to the pKVM init driver, which only uses it
> > > > > > + * for discovery. This driver keeps using the platform device, as it carries
> > > > > > + * the fwnode the IOMMU core and consumers link to, the DMA configuration and
> > > > > > + * the IRQs.
> > > > > 
> > > > > It would be nicer to have a diagram or so to show the co-relationship
> > > > > among different devices and drivers.
> > > > > 
> > > > > I assume the regular arm-smmu-v3 driver is a part of the picture too,
> > > > > when the pkvm driver binding fails?
> > > > > 
> > > > 
> > > > I can add some ASCII diagram.
> > > > If pKVM driver fails, no aux devices are created and the main driver
> > > > probes the platform SMMUv3 devices as usual.
> > > 
> > > I didn't check closely, but would it be safe to do so?
> > > 
> > > Is pkvm aware of the missing SMMU device and handling it properly?
> > > 
> > > When pkvm is enabled and the SMMU device is supposed to be a pkvm
> > > device, should it not fall back to the main driver?
> > 
> > If pKVM fails to init for any reason (unsupported layout or non-coherent
> > HW) the SMMU will be bound to the main driver so the system remains
> > functional.
> > 
> > However, pKVM will not be safe in that case regarding DMA isolation
> > as the status quo.
> > In Android, in that case, pKVM clears the FW (called pvmfw) that loads
> > the protected VM and authenticate it so any protected VM knows the
> > system is not trusted. This part is not upstream yet. [1]
> 
> You might want to double check a dual-SMMU case, where one gets
> accepted by pkvm driver and the other fails and so bound to the
> main driver.
> 
> It seems the pkvm driver would still pkvm_iommu_register_driver
> and carry on with an untrusted SMMU. Would it also clear the FW
> and mark the system as not trusted?
> 

That shouldn't be possible, if one SMMU fail the whole thing will
and the driver should clean up after as the probe is done through:
	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);

In that case, that system will be considered untrusted.

Thanks,
Mostafa

> Nicolin
