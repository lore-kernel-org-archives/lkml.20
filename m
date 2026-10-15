Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEEC5540A7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086171; cv=none; b=MtmhlGoepZyUL9d3VBUH2Fa7vX6KspYGoNi6K80hxMD4BL5e3mn7N39OVNL6RTJjWKEFTdV5uAhNgNtizLi+S4Ff+H5MPU2tz5TH9I3EqaF9q0RtaWEGAw9udkbHmYZnlvZHUgoBxVjVnHCAl+or9TrP5oeWjpCyeu7QYG4YPwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086171; c=relaxed/simple;
	bh=NbD8A+LTa8evpXL6/fu3DIrID9xBqKnToFLhfhv7WUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeRnEtSeeZO7AoHwffrOmIHYqmky/IObBmZRsjAMk3YtJ57Q/0iQST90PG+yaB3RL0KBTV6mcr4ntEGLYBOQ9UBBENEBwszu8ogW3JuNM3vPzAyEvD7BMiSs8+j0Ig2Ha5/EJlV/eOVfWTF7W1ua8a9EFsfIwqxjbMKd2i+uUkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kMfUd8JL; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kMfUd8JL"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533972e0cccso62825501cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792086162; x=1792690962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfHGUiq8UZY3e8RsVecaVzk97ckbUa7d3/EsB9oFqL4=;
        b=kMfUd8JLS+aSLkvjG0Y4ZbDYnQQWqiZTZdUQUCpEc60+885nmpDQykgXoe/gJmmYUx
         dh6pMSkEbWX4E6y0MXzUyFEv/jsFrekR/Y1pyRthMuyyxRkdwrDTloFomaE+NnsPBS5V
         HgPlUs+kbPH1VRFMGMLGxjVoGeCr/cjHZDWXm75mE+84SgW/N9gW09FkZGCYGOJdLM7m
         wVsOSEKYxiLa06SO44XlJ+Ooni1B1CIutfJN5x2Qe1gOk2VivWJ4ZVl2UFXlfH6czj9q
         uP/Q2/gPQ+S6EkLP4z1+9XRGPZcUtCNyEL7teG+fq/cLTOLTOGW7+qr0rz//agxQ1s8x
         R0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792086162; x=1792690962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfHGUiq8UZY3e8RsVecaVzk97ckbUa7d3/EsB9oFqL4=;
        b=TSi6jPrWsVwzuJm/NqYns7t9BbQ65vIMMvtiIppCD1VcqhGoas0JrD5X5av8X94Eo+
         0i0gcjj2NG3TOg++gNcGQZUnv3XS4n8kSusdXBDx0iSb67pVoU+MjMaaRFjUltHVttqM
         dw1Zy0YtJsitNTBNsT1yFmQcyZKl2XCPomPm578yqA835aVSEhPuBfD+aVVYt9e43IbE
         XVETrhTjCfzUz+QxvqtnjtJmJhtUpVrw4FNpcde6sE2Op2H6cgYKSCrrFH17jtYeosom
         NVRHIYO9ACLtam6Kt3aJQH08Q9GN7J+VZdzxc2qyqxP6cjbCM/wrr1PVQ9z/39aDHYsh
         FCYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgHdSH1aQ0tOjF1ZX0NmrUDXNG9SL299sIL9n2bjD6SUyUxeuwQtwPEtWVqW0dvH0bShF0SyllmMCsrD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR+p6vrZ2y08KfMHydaUByL3skXAiC4jyNjD6R0xpQKv6y6YSf
	256KnHexfDrClIX8iaNCq/BVJSpZ4NtDBY3GuCJxUvNhVXEcKEIfQAlUUK0E+Bn0ITk=
X-Gm-Gg: AYBFou3rpq4rmymAioUzRLMLoptLl0xi9M9Aqiuj6u9wq8h74Mny0W/qMxr0D5y6lGE
	B0ivM9nxvC8klAn49aGZN+7BLdpH88PSpgO+B6H8e0u0DnAsowdrlicOWpWXsnFCejT4CTPEt/Y
	56bf1qNRCO8FItQpAcijmV9plkGtbDZNQ2vT7TOhh4sP5XRTUQ9AEnt+P+r8VSuefLQuHnPyUA9
	0EFNgL47ODViIfftnFC05fvYJc13QSqBNJ6rDO70QF1CgkLNmHoDOA/ddeTb2erhDtkIcg4LUsX
	MIpgGFCu3IGB8yKLpmp6BCZD5jMZ7v/IFIoIM8zZufWkdwoE9NUJ9AAGlWAxJSY6fPKSSerh/TZ
	jqGBUlWzHcs/EUYZgJuLleepr8iiO+IBxjqw/qEfNS+IPgcG1AcH//0pQMyU0cT94ePnEL1w5Cp
	sYQfdAA1LcpxAKE9Rp08JWxot4Un8CtFZd7kbA5mNlrJnfUMaK9WdyKfZ0p0Z/sL+PaCA1KhWym
	1Eyof5UVqnuIDV0aLHkFrRJkKPQK+b8EVvlBGz3z7IppVMC+rP6mv99
X-Received: by 2002:a05:622a:144a:b0:533:3bf7:49e5 with SMTP id d75a77b69052e-5359facf0e9mr295381921cf.23.1792086162563;
        Thu, 15 Oct 2026 10:42:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba45dffsm1165226d6.12.2026.10.15.10.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:42:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHPTV-0000000H6tQ-0dMP;
	Thu, 15 Oct 2026 14:42:41 -0300
Date: Thu, 15 Oct 2026 14:42:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kevin Mitchell <kevmitch@arista.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, Nicolin Chen <nicolinc@nvidia.com>,
	stable@vger.kernel.org, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	"open list:AMD IOMMU (AMD-VI)" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/amd: remove obsolete domain pointer warning on
 release
Message-ID: <20261015174241.GW14213@ziepe.ca>
References: <20261013222402.673852-2-kevmitch@arista.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013222402.673852-2-kevmitch@arista.com>

On Tue, Oct 13, 2026 at 03:23:56PM -0700, Kevin Mitchell wrote:
> A warning is triggered in amd_iommu_release_device() on removal of a
> device with an IOMMU_RESV_DIRECT region. The warning is based on the
> false assumption that correct attachment to the release_domain will
> always result in a NULL dev_data->domain pointer. For devices with
> IOMMU_RESV_DIRECT (and consequently dev->iommu->require_direct), the
> release domain is the permanent identity_domain which sets
> itself to dev_data->domain on attach.
> 
> This behaviour was added in commit e94160488e65 ("iommu: Generic support
> for RMRs during device release"). Commit c21b34762e2f ("iommu/amd: Set
> release_domain to blocked_domain") caused it to take effect for AMD
> IOMMU.
> 
> Remove the warning as it is no longer strictly an error to have a non-NULL
> domain pointer. As this leaves amd_iommu_release_device() empty, remove it.
> 
> The warning was observed for a device with direct mapped region:
> 
> /sys/bus/pci/devices/0000:04:00.0/iommu_group/reserved_regions:
> 
>   0x00000000fee00000 0x00000000feefffff msi
>   0x000000fd00000000 0x000000ffffffffff reserved
>   0x0000fffd00000000 0x0000ffffffffffff direct
> 
> Upon hotunplug:
> 
> [   28.715475] pcieport 0000:00:03.1: pciehp: Slot(0-3): Link Down
> [   28.715482] pcieport 0000:00:03.1: pciehp: Slot(0-3): Card not present
> [   28.715601] ------------[ cut here ]------------
> [   28.715603] WARNING: drivers/iommu/amd/iommu.c:2521 at amd_iommu_release_device+0x5d/0x70, CPU#4: irq/29-pciehp/99
> [   28.715657] RIP: 0010:amd_iommu_release_device+0x5d/0x70
> [   28.715687] Call Trace:
> [   28.715689]  <TASK>
> [   28.715694]  iommu_deinit_device+0x84/0x110
> [   28.715699]  __iommu_group_remove_device+0xa8/0xd0
> [   28.715703]  iommu_bus_notifier+0x48/0x70
> [   28.715707]  notifier_call_chain+0x48/0xe0
> [   28.715712]  blocking_notifier_call_chain+0x45/0x60
> [   28.715716]  bus_notify+0x3b/0x60
> [   28.715720]  device_del+0x259/0x3b0
> [   28.715730]  pci_remove_bus_device+0x85/0x100
> [   28.715735]  pciehp_unconfigure_device+0x9d/0x180
> [   28.715743]  __pciehp_disable_slot+0x47/0xe0
> [   28.715747]  pciehp_handle_presence_or_link_change+0x80/0x5e0
> [   28.715753]  pciehp_ist+0x162/0x290
> 
> Fixes: c21b34762e2f ("iommu/amd: Set release_domain to blocked_domain")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kevin Mitchell <kevmitch@arista.com>
> ---
> Changes in v2:
> - Remove the warning alltogether as well as the now-empty
>   amd_iommu_release_device()
> - Link to v1: https://lore.kernel.org/r/20261008202530.14501-2-kevmitch@arista.com
> 
>  drivers/iommu/amd/iommu.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
