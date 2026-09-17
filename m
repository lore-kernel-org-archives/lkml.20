Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D180370D49
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609783; cv=pass; b=FVTbN79QjIbhuvfUw4qpBv0SXFgYTDqucCgM/5jPCyce4G53tuL3UnQ0FuFyQsjTUIf0hViEYK0bGVJF2gf9CrinxZErBmyRQYe1tW7hWazZEOaGA4A/VVSpnGnR+AoYxe1h/sdQxad9pr1R0+MKyasp/guqu6SEzen644xrZa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609783; c=relaxed/simple;
	bh=4vvuCAg8LOYwCkFNxLubS5odZ0quKkv2reSoFIokHEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNT26SqiGVEai34drWu/ldWhfQ4OofC7aU36Zh17hs6RIvnawPpUd5xROWLs9lOGn8caNNTpIz/5/CZnkVZSMIheiEnGyrQ/kS+hrgUAZOsapCMwRPotKQckAmAyQVtYLdIvu3cVmmq/IOIIdJiFctFCtwNQioBUJmXP+yZaV+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia5cs1FC; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia5cs1FC"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cc46c7so19500185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789609781; cv=none;
        d=google.com; s=arc-20260327;
        b=i7yv6399Xi7w7cz7F+5GbjKBfjd4xiGGralRL2IrcupDdQVXLlZ9yjmFKWkUCPWlrZ
         1onq+t/SBQe3+DWCi9pLpDX0pVNng9NvngtJHUi0VwnBefAu5BthD3uzks4XqcNT2EcV
         H/OFfCIQeO6mUPuq+IkJZ1PwocxbMkR3g7KNxlcLPFympWhx1G2oHLjUxW/RLDnfhTcO
         ZW+ihs7TLYHBgu58FQI/lZbzrE+7FElMwyXfIBCTOP1YxVgDpql8TquK1sTDvGkTQ31N
         0CPMlutDH6kcU1Y/IqbPFSzdmhN4HX0hmOEwcie14OUtuxIgI01SsmfyBMr9MoEO0sXc
         pDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ijmEvQZ7YCTIw8TR2oOyYMWmdXBKTEydSXSQjwrQ2VM=;
        fh=B/kS5+B5MJ+IlJRJKYUIbuTkCcUMp10c9BwJKaTN5oQ=;
        b=MDOlh81U52u4s5o4lfdzImxuh3yeyXpqBja7idz4rYtWY73rPQfZqbI7X7VcKH3Q3v
         J/lieKztJp+gVY+kMd1Rq7NYtRBgPYQzX8HlXWm9vHTDG9NhOBrjTZOBj2izpaimzpDd
         SukReWPhT+ppdWCupkfvuGt+j90rLYIYNROMGLJw38p0HDO73Qzx4d7c7IVhCv+qizQM
         /OCisv6Tc/46S1m85jV6Bpifc9sd0eBNwpvzXs2SE1sfu3l93xzmmCvNzRW+0Raz9cHX
         AKAEs0L+hXyxW0K4gPDC3ToVbJeqRlVCcN3IOKHAZjVabvbE4gEHONDg3GbS301PqNVu
         gshA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789609781; x=1790214581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijmEvQZ7YCTIw8TR2oOyYMWmdXBKTEydSXSQjwrQ2VM=;
        b=ia5cs1FCjeMPM5bwFeoDaGEblifSYhLt/DQ4TrEob+Mwx2yBejR/CX/ufmzMrFORKM
         AUdN1EuTp/TUCQiskjfP5Ipx0diLDtPUQKXknYPfLBm9RdJwVhMO8feEQAh5BPvnMSSc
         0XbuFvxRceTjAvxuu9TA5R3DD59ubE949JId861gLOO+Nmp4S+f4md0+A7wmVE+81Yzj
         1uMlmnqgz502nCSlidEg14/ZJkO4MAW7QAv7mDTRKQ09XG2BAKYjVh6RU272CENb67/o
         qXtZ6fXvedbC5kyMaIxnIoRGde28fFbX7mkDFUWHreVPym3zXZK3Nmp8Kyln8Vh5iltl
         A4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609781; x=1790214581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ijmEvQZ7YCTIw8TR2oOyYMWmdXBKTEydSXSQjwrQ2VM=;
        b=eAyi+q6L9bBj22CgdjlaXLFcPTzRTbLG8232u9BdcMV/HCLYvHDs/dcaRin+CcKMTC
         zKrdSfvaUXtvJyqA2sMrjYPxPXHhl/Rjnh5iQfFjqnBYwLghtSJOeUoNPuPZonB0IXzB
         +0dBuSoAzHMrR5kG1w2ilFYjFjEXWGxPBeDct8MfZu5qSyNvUwqUYUgpCfwGLFa7EAan
         y0MrQW14Ft/lFMIM/pkKCbbSa0WAjNY2SgRIN2Fp4BMSb6zeqFiKrCjnb8Fe9zZNU9vR
         18JVptPk8wpwr5e4oXspHgAoc3WvKjF0Br2rSKe3ghjik4vjJSZrBdwyLSx/YaTGIiG0
         kI6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgD3C1bqj6avTUKCZcHwijYB7qobcVDfEKGWo1PZ/Jl2ifMmXxIu8SBW27EcAZel45SF/raNJdyccZS+M=@vger.kernel.org
X-Gm-Message-State: AFuF++nigwcBySysATkl4HLAGIR+g47Cz6QhjWIRyV0FZJJvhh22Ii3X
	XnIgYfC7kF/FNXyuhhIOvdzNk/qeEe9JxtltQE1HRBlsN/qohC944/8gOqlWLoYDRhWe8zmFUaV
	o9q0i3wsPlUZ4ZQwizscMeQMwjYjYt3U=
X-Gm-Gg: AYBFou2F0ANQXswtlWEJ6y8PlyU2hC0jYeKHcVoBpi7khCZ93semHMT3lAS7QBEerty
	FTbKZQvTWIHo7CWtF6Yos6LaUUCKDrKd5k9DpdxlRqVSN1ydEpM0/x4NuBujC8Ari8TPW1/0CLu
	HfAzOZiC6zvPhKjH/7TMYSnqkBfGER+Gk7yz/5cQpHXJRB1ikLosN6C2tlyjMVa5KjLv36CUg9e
	tyn9UJH6Y88gZk0SLnk8nxiNUwAVJdacakThVi5dMYrZqOerxicA1egFpQtta978ff6cKScfJ6O
	da2fi+JWQ8GkkB0UhLIfj1TeUwcGSntIPjcuB/OQor3SSWqneXb0b00L7bpPSx4TeJj1XJSxj98
	x6telY9eBK/UU+XeZeBaAsY1UXxdlTtOihSppR4SS
X-Received: by 2002:a05:620a:6292:b0:939:78ab:3c5f with SMTP id
 af79cd13be357-93bb76e2fe8mr878910085a.9.1789609781431; Wed, 16 Sep 2026
 18:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905081116.106613-1-zhiw@nvidia.com> <20260905081116.106613-13-zhiw@nvidia.com>
 <DLCRZLO06SIO.LS7TWQXIPZSQ@kernel.org> <20260914121217.70fa0d93@shazbot.org>
 <DLFD2ZDSK9YQ.3A4R66G8UJMD8@kernel.org> <20260915120148.7548a8ca@shazbot.org>
 <DLG7C7MLGSTC.2GSTD84WI595N@kernel.org> <20260916141718.GU3968357@nvidia.com>
 <DLGUPX9KPFKF.12CU304YAST79@kernel.org> <20260916162817.GW3968357@nvidia.com>
In-Reply-To: <20260916162817.GW3968357@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 17 Sep 2026 11:49:29 +1000
X-Gm-Features: AcwNN1VXCeIhnNkZrtRydjWaxN4Qnt0jH2kObUrck50VuTkYeDZzVilcahg7zlk
Message-ID: <CAPM=9twda0Q9nj9E5AUCi4=en5tDA7ReBv8MV2Ftg-STwNbDLQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] vfio/nvidia-vgpu: add the NVIDIA vGPU VFIO variant driver
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>, 
	acourbot@nvidia.com, yishaih@nvidia.com, skolothumtho@nvidia.com, 
	kevin.tian@intel.com, simona@ffwll.ch, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, jhubbard@nvidia.com, 
	ecourtney@nvidia.com, cjia@nvidia.com, smitra@nvidia.com, kjaju@nvidia.com, 
	alkumar@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, nova-gpu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, zhiwang@kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 02:28, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Wed, Sep 16, 2026 at 05:38:21PM +0200, Danilo Krummrich wrote:
> > Usually, class device implementations can't make assumptions of the underlying
> > bus, because they have to work for any bus. I.e. there's no other way than
> > providing helpers and letting drivers do the glue code between the bus and the
> > class device.
>
> You should think of VFIO as a series of helper libraries. One of those
> libraries is "here are all the PCI PM ops you need".
>
> Drivers rarely need to customize these ops, they just need to wire it
> up to the support library to avoid a bunch of code duplication.

It's currently a library being used as a midlayer. demidlayering it so
drivers control drvdata removes that.

I sent the diffstat that covers all the current vfio pci drivers and
that didn't seem excessive.

>
> Stated another way - the very point of vfio-pci is to remove
> duplicated code from the drivers.
>
> So if we wanted to push hard on removing drvdata, and don't want to
> touch the struct device I would probably say to #define up a way for
> the driver to build its unique trampolines. It wastes a bunch of .text
> but at least it doesn't duplicate code.

+static pci_ers_result_t hisi_acc_vfio_pci_aer_err_detected(
+       struct pci_dev *pdev, pci_channel_state_t state)
+{
+       struct hisi_acc_vf_core_device *hisi_acc_vdev = hisi_acc_drvdata(pdev);
+
+       return vfio_pci_core_aer_err_detected(&hisi_acc_vdev->core_device,
state);
+}
+
+static int hisi_acc_vfio_pci_runtime_suspend(struct device *dev)
+{
+       struct hisi_acc_vf_core_device *hisi_acc_vdev = dev_get_drvdata(dev);
+
+       return vfio_pci_core_runtime_suspend(&hisi_acc_vdev->core_device);
+}
+
+static int hisi_acc_vfio_pci_runtime_resume(struct device *dev)
+{
+       struct hisi_acc_vf_core_device *hisi_acc_vdev = dev_get_drvdata(dev);
+
+       return vfio_pci_core_runtime_resume(&hisi_acc_vdev->core_device);
+}
+
+static const struct dev_pm_ops hisi_acc_vfio_pci_pm_ops = {
+       SET_RUNTIME_PM_OPS(hisi_acc_vfio_pci_runtime_suspend,
+                          hisi_acc_vfio_pci_runtime_resume, NULL)
+};

is how much code it adds to current drivers, this doesn't seem
excessive for 10 drivers,
like you could obfuscate it a bit with some macros, but I really don't
see a lot of value in hiding
what is effectively just standard driver boilerplate.

Dave.
