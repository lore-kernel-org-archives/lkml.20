Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448F340417
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941597; cv=none; b=TtQiodmwE3+H+AcdL2VzaBM3ufu55oSVy+Lu1RwocJ3CqmwQDCRPIAEHor5tscReyVO9GLW9+aAlQAgSEdgNFlfuC2056oTZoDmoa34Kaiy46IP9qU7epWSq3lCtEwQbL4D2QZOGb6pMj7witwHI81CX9eSMoLG6hVCV7xOcMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941597; c=relaxed/simple;
	bh=oBB1ofT7Bs53EtnSpRWhFXOivni2BxFwa0cRVdF0XSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nidzkIJKWOdzIV9/0Q50XkGKUy1B2x87mJMGpfvits1Pc4NzwgTqOnuDtOySTEWz1MH4aq9DCV2Lrb+brqKg+DHYCSVL1v8AKozmAPxLBmZX+DIPmJqnK68Qr1eGn0lhVVlKbSRWfwckGzuqglt4DzaP+U1TP2Qs6RBqNeGKzxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=gBbdZdWX; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="gBbdZdWX"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b4f2d90c4so3454049eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790941594; x=1791546394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3RrKegDIYcP9bXP/97JoW1rLjg2e5Ae98djanO6X2o=;
        b=gBbdZdWXy+Y77rhf+26JLy9ulnLq1g+diNJjxevq9okoL4VkfKQbVxLhSr4glxIh6F
         W2bMnYAYOpm9ojMDuRuVEZc1XLBAJE1Hu+jE+Ig5fXh3ahRsonKrIOOyDhC5yEYKkx5W
         nVfKTL41Bj1h71ImjCrTLs3qHqGvS8xC1zgzRFc7gAbVFWMuad1mJrPVI29Scbv4+6cu
         Dy/t57jtpJOt7tv2G701t0FmhBZnDxvZExQDYkz269jqLvwb0AqV8MCw448OrPMHzfJg
         xMB2NocFcsRUvOF3zrkpqkWNCuGAlSl1v74es+S6aMahaOuBL1Y7FWVemjKqrkvBDMHT
         oRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941594; x=1791546394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3RrKegDIYcP9bXP/97JoW1rLjg2e5Ae98djanO6X2o=;
        b=FAn0FhuuhMADYptsiDIZI50SzizB5xukaFqb2U4quFhDPVUlKAwZ5/6uWz93kSbia+
         Mc02qKW+RQjkjS88MOjVz4rgLYyc14m9uUpFsQv5xdf8Wmc7zT2mvQmtQZl7bVNdk0VE
         WOnxQEO4aj8uD0Ca7Cxy5daeDtOYhGuFuW/6SP9MN75V+HjTTxkbEocK34kcYnEzqwzy
         OVwZ0hZPEu/Iw750PdlIswRY5GJ4moLe/0UwYZj0duchG1f4u6iyJx9Yegg1byYcozEm
         tih4XYPjVVfthQCRcqP4xg7IxUKQzMKU6gZw/3rWGZ4xlHoORhEtFxEnIgsjEl99ffeL
         xEEw==
X-Forwarded-Encrypted: i=1; AKwUvByH/mcTP9C67vDvrF/kvO9Le4ZwLGdEW4OyjpTPFGIsJIqjJcFKMOkc3wB2Aji15atYPYJCcYmxTL6/kpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOiXq64ixObiphSIbNvtOMUgjIago9K3OnpIYirBSbu3ymE/Gv
	GHgx4xUNwCXz8gUrSfd6frU34cQ6IusdEvZJoh/vF4V9cGkzMA2jl72zeszH1rFw3Gk=
X-Gm-Gg: AYBFou16z9NYgq2zhdNtn/1IhGTfEGEgvpoolr1vRZT/MtQtKNwCKdU/ItwxrHcv0ID
	2xqllRV6bsUym9H/CbLwW5MS58xJx9JwgFD3wrzbEMyD+0/UcfsR7u/Z7yWv0jGM0vDREa7YGxC
	LqbCm9wiP93FBIFyJg2qP0ss6vmqZHrmzHLiQeQFWw/NIJTv15NyJOmCcMgUON5FE+WoCBrERXP
	hOTtKCF+yvIAE07sAP+wTwhPnmD5zgE2BFWdAcqCNhevIb6YzbuKwU7Et/cey7Q7Tw/SIqeQjJx
	CLYeX2Xi0SzagVK2eV+DZkMVrz5W0a05QUejFQ3MtYMpRl/I0dMtv/2gHhafS4+R2XiQw29jIJB
	t8Ni2H4EUVGoK3ESK1ggIEe3JAYQ1MjPIbJdu+qeZUsMUNkMyKdojrCW7iOslWZLoZUmRQI7LsO
	9Tb+vetuia3d25f+7IaO97w+nR02wUKt3/Vyl9sPiqm4xe
X-Received: by 2002:a05:693c:8808:10b0:33c:259a:759 with SMTP id 5a478bee46e88-34f21996151mr2610780eec.36.1790941594306;
        Fri, 02 Oct 2026 04:46:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f303e3sm7587040eec.5.2026.10.02.04.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:46:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCbih-0000000GQhV-36wt;
	Fri, 02 Oct 2026 08:46:31 -0300
Date: Fri, 2 Oct 2026 08:46:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mario Limonciello <superm1@kernel.org>
Cc: Vasant Hegde <vasant.hegde@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:AMD IOMMU (AMD-VI)" <iommu@lists.linux.dev>
Subject: Re: [PATCH v4] iommu/amd: Make PerfOpt compulsory
Message-ID: <20261002114631.GA3481470@ziepe.ca>
References: <20261001182410.1525285-1-superm1@kernel.org>
 <d4634df4-ab32-46df-8b05-665998959e43@amd.com>
 <f790bd53-8610-4e8a-aa4c-1f346c0cbbe6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f790bd53-8610-4e8a-aa4c-1f346c0cbbe6@kernel.org>

On Thu, Oct 01, 2026 at 10:57:17PM -0500, Mario Limonciello wrote:
> > On 10/1/2026 11:54 PM, Mario Limonciello (AMD) wrote:
> > > PerfOpt is only a feature usable by integrated GPUs and only in identity
> > > mode.  Instead of leaving a policy knob in amdgpu, just turn it on when
> > > an integrated GPU is in identity.
> > > 
> > > PerfOpt locks the GPU into identity mode where the DTE is ignored, so mark
> > > it require_direct (blocks VFIO/iommufd claims) and disable PASID (no GCR3
> > > table in the fast path).
> > > 
> > > This drops quite a bit of compatibility glue.  There was a refcounting
> > > system, exported symbols, and device attach/detach logic.  By just setting
> > > it immediately it's a lot more straightforward.
> > > 
> > > Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> > > Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > > ---
> > > v4:
> > >   * Disable PASID for PerfOpt devices
> > >   * Don't allow attaching a blocked domain
> > 
> > This will block attaching device to guest via vfio-pci. Is that fine?
> 
> Right - The thing is from that experiment on v3, putting it in blocked
> domain does nothing while PerfOpt is enabled.
> 
> I figured the user should be aware; so I was between blocking attaching a
> blocked domain or showing a warning.

Ideally you'd fix it by making the perfopt bit only set when an
identity domain is attached.

Though I'm not especially happy to see a driver that can't support at
least blocking, that's pretty broken in our model...

Definately don't show a warning, this is security stuff if the driver
can't do an operation then it must fail.

Jason
