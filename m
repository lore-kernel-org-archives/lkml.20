Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6E63A3E95
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575023; cv=none; b=MX2SesMf1txVk1dqTbC5GrRyxbUjf+RvI5ztzNSAXgLrmNT3pHEeaKXLV8lDr9pvG1LYpudB/aahQjVugW8yn5YWQABzyJyQ7PPz6y8VgenKzfgOfzSpoRbmTVMtHIKj02lal1kcOS1N2SL+9hYigZgqaZMXXF3Pw9R8dipJkiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575023; c=relaxed/simple;
	bh=pcP+4eU1/beEFYbRmgIPFAGcmsIIEUp/fpCxORq8Ok0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NslgzpYUgU5lINi35Uwcb2W8Ad0Cn74v1fxouE/JiCp8aqYFH9Ev1FlI4y89FE7JVWUSmJcAqCcoIc30BHuQQ0dVm7EFjw4ZZL/0GNxf7xMz3z/+x5dlc7ZNkIKa4kCgEV9WOXvRnHv2tf4kDZX6zTG1Olg24neI8noQXpiTkLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=G+j43XsX; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="G+j43XsX"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910a0cefaso90304785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789575020; x=1790179820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcP+4eU1/beEFYbRmgIPFAGcmsIIEUp/fpCxORq8Ok0=;
        b=G+j43XsXSyeDqlqbbynVYBJXFecy3PUM0dOOaj148M+VgDw2oI8haZ1MoCuKSsPgAh
         7xAPKUr1UCMpb6if+cwYHq6kmcX/L3uE+honXuXTEQBcmVEmg27s000o4F9/jO3DbYGj
         Q1ZJ31SosweOwIvw+hBLCicXePeNo1IN0KuWsc5luPkvXVXzhdBi1G+kxIzfI+WtgvpR
         +COzR0HzwVPAXCQKYYV/eABHMELbBwtGKEjsjg/ONAaTHMM84ObXvdV1HtQT8gRRU/VU
         dgG8URFzOLmbO6XRLYC3tirPFiqJSTVGxmQ6V5UHjq9GFu43WCgq4aLVvQQ+f7b+5z9K
         v6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575020; x=1790179820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcP+4eU1/beEFYbRmgIPFAGcmsIIEUp/fpCxORq8Ok0=;
        b=jV0jnknOI7dB9x8U6ZxzOBYcNccsxYAu8/GZkqHceUubtE9SJYCtU3/tXOJb5QvgR7
         j7px91aB3iQWOOlLen6uKYFyrMFjeRHrqfb0FhNKNUb/It0qA5eVPEuFHVEb9ewpm885
         6mfNsYKiEqgnS63uAPG/m3kC/kfVPvChLhaCrtPipQZKkhfKYyB7TAVcYjEFfe3n9kgB
         xAguOVVaImBXNRccluA8U/PDmnvV/R+L2LbeXZrn77IrNf5JktzKO2WaeDNGRZrmZf89
         g0FbXYUG4csZ9Mx+x6oWFBUJDhXC+nXOe7KOg3FqmiH4mWJc7eCdr+9tWIDcRD+2mUJh
         IJWw==
X-Forwarded-Encrypted: i=1; AKwUvBzLEVqFG+lARcTfQFXUC8KYYrQe9zz1MgfO1SQ4tZeWn/DGDsNZWnr3Z9LDGlaTccHvtw0IwycGqDqwEWs=@vger.kernel.org
X-Gm-Message-State: AFuF++mSZvvzG0q04OEynIvLpy1i2DInSH5DXEMw7ZpAFfXmX/LVcrxQ
	+nvnhMin+/jB8nl5lcoAq8xxdfD5mHUJxbDtZ1DlLnHwD40pYa30sX3vzajWr7ibwek=
X-Gm-Gg: AYBFou37sSXA8i4pUAWVT+JyGn45HsnXBT1NI26odWSHOKbWN6pO7r7pGB/q9kljNzy
	ifjvTO8C/FBj7k3u4RhaRef90rjFjxGjwVzwwrxyI1YRk/45gX1M9/OSr+G16zb/ytnOyr1t/ip
	WgATXigcfxdpvHjsP04Zgb6fAmashLgegi3dUZyvMqJgP2PS+ziDinU8gdYEnMLbWhPE4yafrjX
	myatwcAkIVMgKyMm08X9VKCptGEqMydm5OKtBdgDtBjvVfPjCVHQjbqt32mMUeTmTa9iunnMyQf
	QjSbiOyZQpaC2PnrHhjKDPaBuRMgiWtV7N9QdJeVUUwxhDi228qFRmlqiETS1SWvToNe+IUdPHq
	ioo67tDaA/cZ0G8mSYWvcAS0UYM/IJ0l8zcNVFPVl7vVZo+tYTAuHDsU+vU04bwJ0OnNHwAdFXp
	krq/C5/D9djBfOU3VsEJB5YQXM7puUMUrwLqcStnkhlnPtweyhPzXlULWQpPXTOYKq60hNGe+Ta
	lJifaYrwtuhyz8WJXaHkiJkMHxWYDqgpe+FfnZELUXcHNTqpG3745BtgA==
X-Received: by 2002:a05:620a:640b:b0:93a:344e:3d3d with SMTP id af79cd13be357-93bb7952c30mr495951685a.42.1789575019764;
        Wed, 16 Sep 2026 09:10:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81d19df1sm251902985a.45.2026.09.16.09.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:10:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x6sDC-00000009bqL-1M2P;
	Wed, 16 Sep 2026 13:10:18 -0300
Date: Wed, 16 Sep 2026 13:10:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/4] iommu/arm-smmu-v3: Support shared Stream IDs
Message-ID: <20260916161018.GE3196566@ziepe.ca>
References: <20260916-smmu-shared-sid-v1-0-517384504aee@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-smmu-shared-sid-v1-0-517384504aee@nxp.com>

On Wed, Sep 16, 2026 at 11:12:33PM +0800, Peng Fan (OSS) wrote:
> Some SoCs have a limited number of IOMMU Stream IDs (SIDs) and
> hardware that inherently shares them. For example, the NXP i.MX95
> eDMA controller has 64 channels where each TX/RX pair is assigned
> a single SID by the hardware - the two channel devices are distinct
> from Linux's perspective but present the same SID to the SMMU.

Is that a reflection of poor DT modelling though?

Why must a TX/RX *PAIR* have two platform_devices nodes?

Fix it there and you don't need any of this? Or is there more?

Jason
