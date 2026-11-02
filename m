Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625243;
	b=nHRpROgxdeDDD5+OFUmc0es8tB+LTBl2k5Nhkq9zwRfOD3J/6c95Y6x7k+ZPgUNWo8os
	 514d9UvYBqJ1OolFoJ7HkdGYOBwh2yCR3N2UgqzJh0tArZay+8qSFUF93WXYcSHi13N33
	 RkEO/3pX6hq8UxLNMQaPLk9I3/y298or60VMAGSkphpgTGjSMB6ECzUmk8jk1iKVw88I+
	 MuFqKQ1ZBsCTtpXeqjBK3e7sdQ9bS5Lfu5mr7VBzUb2/EYyBD3bEV8Llg2AKhec1nlDTm
	 xEeNEEuNQ7tF3k3lCH5oTfEv4ZprenawAFgikLnxECO2pXN/scb/sAjk+Yk7q0eavUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:rom:From;
	bh=xQ6t+GMfhU5C0Rvm61dIpYM5RO8AvEBQYn2+KfQV/CM=;
	b=gypoCYEf7GhOp3nHkvGNYGJs5KhWLJ9lqrMvESIWPaHiD2PVomBl4YFVnAaq4Rm3k8+V
	 HvS7Pr1qL8hE5lw8brpoZkADvXcfs84IuomCidqG8vJr0+lRn3YC21pZGdu/LfnsJAKQT
	 FFeDWFHtNl2RIGfEKq8f2IPQzwSJPdrsTCvyNPryr/ry9T07YmwvgdjWlrLskDJc+6N9+
	 xMMtKKAyVejzVkm2rPi5DpZp70w/TZmsse31C1Bj5YVPZFVFEo/Sc+BR4rLqNvD5aXUpc
	 pKqPMRhGfs/ir4gHhuYPMbWOV53HjpQq0Wm10s5ew53BLljPBEYHjn9Uh4jB7xLmf4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HaF6rP7J;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3FD606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3FD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HaF6rP7J
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5365b48238dso28808411cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793625241; x=1794230041; darn=vger.kernel.org;
        h=from:rom:in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQ6t+GMfhU5C0Rvm61dIpYM5RO8AvEBQYn2+KfQV/CM=;
        b=HaF6rP7JSTCksdVJUoLXlB6BXVoEsMyOz9Vpke/xK1SlrpKEvTDxQSCWE0uiynFcPF
         zEaBpginZpoobUbQDlW0WtJXl/I7UXtU4MWk/6qdlFJ2QONaOGyAVHehsNqObzQwYeAk
         FZV1XkypotdQ4tYEvHfhyxxVL0iNEakzWpOw1LVMZcwUXHsDdHVi9Yrw3Ginu0iY7lxA
         TQ1jh/U1Jy9fr5ig6Z6ez7mZrXvioPbuN3uiZwVST4EmcE6KmYgIjVx8GkyCCgardheW
         zU3L6YLoiErCWTdIDqmQW/wEH9AijRO2806DJtP8xjY6ViA65/+ztPDXcEZjWV2sx3Ym
         Jtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625241; x=1794230041;
        h=from:rom:in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQ6t+GMfhU5C0Rvm61dIpYM5RO8AvEBQYn2+KfQV/CM=;
        b=zcw3XuJgOSAMyFhJRAOkgNFK6g/uRPUXcIbPxyGqr7FkyRoDJhvVQnIAu9RNnR2wIx
         hHNPlL34YtQa0vGLv1UwaDmSRoTKthww9YVoAlRTvZPO4eHs+cZ/ElLuIzmEmF2ToHCV
         n3Ow3bkO6kh2rMAT48+VmTq6Dc9ziXVT5W6gmbbUOye27T1iC5zvI2xa87KLB1JPMHkR
         QaHsXGPIypuZbCm0DgSijyfjlQPjRfDrorRmjnJhwfMcHdypo658JTK4BGiQKXqhGl+P
         2jlnGRPThspQuLZtR5jEoWZVzmqP/8SBegqaUEYHHIHz2oGjS9oD6oi344mzdvECa9ur
         hz6g==
X-Forwarded-Encrypted: i=1; AKwUvBybsUQoOXWx7IFUYWS72gkYrA6UbTMNv3VeBz6Of7KeX+H+qdcIhNCUPjTMiIp9QdOxHBOWun3xHIkic+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYICOJ+Kfs1DXxzb6podr3FZsOxhCD5MntOXIQ5g/v6mwNjRaKFZ
	OpWPVaZkq5QHd53NFkGmm7GD4RJkTitT/QfSeJUoBwJemM5iXQ7Q70KcBHkXJ6XY15U=
X-Gm-Gg: AYBFou2cGEO/DWQuQmVRi9Z1DbsGrwsEDdI52BWtbj4dCwqfF2WVCx4OWI7AWeaNDiE
	KM0qPKt4uvXXm/r0hub78nmjD46kBsHjwEBrD+bQa+veLVRQSB4xO2BcaTUBnMfEgRapKnfSkco
	4qdgD79xvLuPu81D4HnrpT9Kt1UgB/dpxPCENP5kyW4EtoWD6G4httO1aMJFTviaX2nfJqab4wP
	wdlV0i1q74nI9kSNdX91u55P1sEDfsvVYxNvVUm3XZVytWMsswvG3yTZz2XkBslrXiR2EQNoEGE
	+X6HFtu7DJ3DdrlbW1GXPshBYnGVXXR6ny4eptwvoPO1UzRavaosRODudzjWyiU8iGdKKPqCnaE
	Isp0e1WHkAwLDCH+E879kx9b5lDj9pvxt4ZTEAZq7/kzJhy1A/z/bwxWi+pVcZOabupAnor06F4
	Xc57eKI26D+DBmhijT/34w/4gl022Z5sMB71ZimQOSu+VCUuBj1//algoSCg5K/z7vXnBzgdLgC
	WaP5yPjxBnj5cXyN0rY9ie7R5V6mNzyGr+9gEzSi1RYsIKlTgBvyfgGxrV33imb4//sBjYi0Ku9
	DqqmPNrMn2SssNqgNhrwXgnQTYAHV4Nsm0MPoVLupq7DLpIzFcZME4DVpJzKizQOlb5FTJP8uOA
	WMTl50AgSGoI+bVuZ+s7ExmhUhF5X+Gg=
X-Received: by 2002:a05:622a:a07:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-542b658df3cmr161864101cf.20.1793625240711;
        Mon, 02 Nov 2026 05:14:00 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5431246c7basm85036611cf.18.2026.11.02.05.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:13:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xNrrI-00000009is5-3yQf;
	Mon, 02 Nov 2026 09:13:56 -0400
Date: Mon, 2 Nov 2026 09:13:56 -0400
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: fangyu.yu@linux.alibaba.com, alex@ghiti.fr, andrew.jones@linux.dev,
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
	baolu.lu@linux.intel.com, guoren@kernel.org, iommu@lists.linux.dev,
	joerg.roedel@amd.com, joro@8bytes.org, jroedel@suse.de,
	kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com, palmer@dabbelt.com, pjw@kernel.org,
	robin.murphy@arm.com, skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn, tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com, will@kernel.org, zong.li@sifive.com
Subject: Re: [PATCH v6 09/10] iommu/riscv: Add dirty tracking support for
 second-stage domains
Message-ID: <20261102131356.GA274202@nvidia.com>
References: <20261031083014.15040-10-fangyu.yu@linux.alibaba.com>
 <20261102091823.54287-1-gong.shuai@sanechips.com.cn>
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
In-Reply-To: <20261102091823.54287-1-gong.shuai@sanechips.com.cn>
rom: Jason Gunthorpe <jgg@nvidia.com>
From: Jason Gunthorpe <jgg@ziepe.ca>

On Mon, Nov 02, 2026 at 05:18:23PM +0800, Gong Shuai wrote:
> >@@ -1439,6 +1454,9 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
> > 	if (domain->gscid < 0)
> > 		return -ENOMEM;
> > 
> >+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
> >+		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
> 
> This sets dirty_ops based on whether the allocating device's IOMMU
> supports AMO_HWAD. As I understand it, the domain/HWPT is not tied
> to that IOMMU instance. A later attach may target a device behind
> another instance without AMO_HWAD, and the attach can still succeed
> with GADE disabled, potentially causing guest page faults.
> 
> Shouldn't we therefore revalidate AMO_HWAD cap for domains with
> dirty_ops and reject this combination?
> 
> FYI, both AMD and Intel have attach-time dirty-tracking checks. See
> drivers/iommu/intel/iommu.c:3195 and drivers/iommu/amd/iommu.c:3221.

Right, need to check on every domain attach that the domain is
compatible with the iommu instance.

Jason
