Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B79481A89
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576257; cv=none; b=essfa9RKM6xHVpuNZ46lOzfcms2ZK+DPnyERlliS8ruu5eUgWsLq+bFEsypOwAOhVfRPCc9wA34yA5isNrs4Jodkm3+Fy0pEEYNPtcRERzpsuJ7ElLSI9He2lenXyU7mrAk6v/FahqBzwb8R3cXYziyZwvVSA2j2zP6XAJ0zW6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576257; c=relaxed/simple;
	bh=hAluV0ZsKWum/hosRJaag7DxK3pHK5KP5bP9qisBpl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cm85liKGHCjXDMO1VsoywTRvzktWQXTu1Lv/569dwifazGnwlR5BhrGCH5IkEomsBaJD0pifVNQw9I6mpOqoBt3bbNJVQyv3QUlsoBOAXv3vikqwQ+4zqGEFeGsHX3nil2XEyPH8Fr3NfCd7j7o4/vNh8tdLaCy6MGxn0S5Tn/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=E50PmzQ/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="E50PmzQ/"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917d595138fso1444316d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791576254; x=1792181054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F4LeZey2LdZLtm6I9smRb+XZ/TgW85BBKXmmgDgTNho=;
        b=E50PmzQ/PjmpOByeW9O3EepiGBLd4OLXgqSvmp/jH2+tsnlH/TNqbU8FlT/yDlHHaD
         D47/H/eD4+602EpG4vjcD7yyq3D+8sMJ6pK7SXK/ym8WCqnyfKUPamywI72ik2PrAYoy
         Nr3fasZ5ZzonBh/Cmajh6lMhY3yAAVejQBneS3cXASh5V25aRgcaFej8I+lM9MuR8ZUX
         9Lh1YrcKvCKkfxQaN6GtBHDdQvmMSJE1ko66nfqdqS4DMonDPbT/1Os9oPXUVIJUapvd
         ssx7mkTc6pog88s/H6wW3dD27wey4x0Y/11eMuSjU4CnnvSZ6a1Ht4xXV6obsPTLXAFC
         7rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576254; x=1792181054;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4LeZey2LdZLtm6I9smRb+XZ/TgW85BBKXmmgDgTNho=;
        b=W6ytVK5GJgoD3Gukyi8nV6yXpqLGHym9ojz7s5IOLLM/nu8cNyi93MNH7ngGyl764e
         O84PWoHvuqC5/+linKmuks/cuWiti3cWn09i3K1hLUwszIRQF6dSNooZhdkLan1IOQEs
         NUrLrQeXM1CrrQJdJeBGfBK4O4mTHaWGMqSuUpMKe8NnZDb2z6x0oiEEBf+lKZ0pOd/f
         FwOdZp0mF7Wl0GaiIl0n3Z4WuYee1hByp4lx9Ji0MXNAfAFwj/x5UBGmp5QIpL5mTjZL
         wc1UqvRgI5i/CHddnYy0+Mq41Z5BbKrMgxC0wrKa6T5LMun0GMpgJTZRhDOaz8ETlFHE
         /w+w==
X-Forwarded-Encrypted: i=1; AKwUvBzviKnU4fEkydMxaKfNfvUFD7VRcCnU8HOGfO/7nChEdi5+JQmZcKnTj+UtBpuyO0PZAjiEKsxyaiNz4Bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLleetJohbpR6ivHbKs7r3oCLZY1BfxUDy4trecK7vzE/gS0egN
	z2XQAOSQ403gOe9vGvy10Mst9IFBN5RKWTMB3p2vs6Lj4xrwi2Psz2DBmw7ahbJ5a+EugXvhIlK
	EuS39+aM=
X-Gm-Gg: AYBFou1sFwLGmCpBTSwOgNPF0xw6rPXrweNds8RwCo3CLaRzXkFXB5eQeu2OR/uK+4C
	I/xOjE0jT6ezAYuYqpbv2w5MCYhDEAIKAsWuJ0G0aoRwl0W0l5TRQCPexE0N1OdlJMHEOer73hv
	eEwj+pQrRDSqIbo+hrCkRP5t4V+77nLbDAs1Af/M52INyhm3kvDJPT69OxQ6emKoyz0+CN1kJmE
	gyWsyoaht3f/82e5YBGNm2NbaxlCnlmpB3Pnfz6ZjS61j/5ndymtnxf7R7/Olh+VDBAYFlkofVM
	OQGvEKYhXPVe6vTneBFeX17Vyiaw9YSMs9HjUE8RwDufsdog6pDJRn2UylP0Mfxd2ZHsk+KxahR
	CJerDKkUn+fGIchUdX2SgnaojKPP2zSVgskquOmesKUT9biwL2YWlqlodRwycGBxZgF9zHZsWea
	yLVRBbSXaYe7YRWKcSUObDQWtPDGutmOu4z1tJ0F17/HZN3snGe4HTSbibRTYWDUYjWMiGyuFuc
	LF6LrDBsvJV9vGNLHuWDy2xIafuDxPNpPxIX1za/xA0p88I4YmNYibo
X-Received: by 2002:ad4:5aae:0:b0:917:aeed:9240 with SMTP id 6a1803df08f44-91b5555f788mr51483116d6.31.1791576253590;
        Fri, 09 Oct 2026 13:04:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550ddf7csm26430326d6.42.2026.10.09.13.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:04:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xFGp8-00000000uLx-2ouW;
	Fri, 09 Oct 2026 17:04:10 -0300
Date: Fri, 9 Oct 2026 17:04:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kevin Mitchell <kevmitch@arista.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, Nicolin Chen <nicolinc@nvidia.com>,
	stable@vger.kernel.org, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	"open list:AMD IOMMU (AMD-VI)" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu/amd: allow identity domain during device release
Message-ID: <20261009200410.GC14213@ziepe.ca>
References: <20261008202530.14501-2-kevmitch@arista.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008202530.14501-2-kevmitch@arista.com>

On Thu, Oct 08, 2026 at 01:25:27PM -0700, Kevin Mitchell wrote:
> @@ -2548,11 +2548,17 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
>  	return iommu_dev;
>  }
>  
> +static struct protection_domain identity_domain;
> +
>  static void amd_iommu_release_device(struct device *dev)
>  {
>  	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
>  
> -	WARN_ON(dev_data->domain);
> +	/*
> +	 * Devices with direct mapped regions are attached to the
> +	 * identity_domain as their release_domain.
> +	 */
> +	WARN_ON(dev_data->domain && dev_data->domain != &identity_domain);

At this point I think you can probably just delete this WARN_ON
instead of trying to fiddle it like this.

Ultimately the dev_data->domain should not be set by the identity
domain, Vasant said he was going to work on that clean up..

Jason
