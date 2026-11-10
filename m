Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323934;
	b=AjOccgTQj3Pe7O5jnw2zEz/hxLtPOuKtNTRXWU1/1uKIJQOQOLmsRGPLM58a8Equ8G1x
	 6gB2dG2MYPVOo7U4sgqeBo2IsuV9Zf0DhI2lQk2/F6YtRRd+TlM6Ya+aqd7tHa+fHgUEw
	 +QN6CU+RpLOIlOJSkx5ibo52hcKXByRdmcHWL/ZgLIW+lVqy1TmPgxfJXfD9P8eGtCBOG
	 cssj6dgOLmLRaEHpbQyZV0oJ1jd8qr5FwRwVqO7cOT71mpsYi7Jgr6jdmYs1WY5BKj7/s
	 Bact6ku/dYO6VUyJysNl3cdLHeYdRjCabtM3A+/CJKWLDUkO5jd8Oq24xalO+ecDZWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O2sQ0ppPahwiNKXBETtZDPbw3npwpVnR3zhVdoKxb8A=;
	b=ZOI0p4JikDy7jU3XOW8pavKqhaDfpdX7+bLCGQAhf438GgcjEJxLOU5/rddY+by+AlpM
	 jDLFNZd3GnBt5f2a91ZQLxnMUANev8e0MMV3XcGzMjm0ZD2xVi8pfk+oup018N/w/GSm0
	 fZHzB2a6PhfA26OSk7x25YQ5hMhc64Bm+bKMzewQvNd2AUEqv4ozhrusLeB4hRQhd9jEu
	 /szDpBWQMm+MqMF7K77mvlGyJmHRuNu967vdmgoc6gHSqlPNqNxNiRGEIRfgiTbo2S9qT
	 e3pL9HxJzpPo3xEXH2J/nZ3HCT5/WqEd5BZVguj16HBnmpQ5teZzwgQMmwWf+2bE7Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HnKStyw5;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED4F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED4F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HnKStyw5
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f22a8515eso173341085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794323933; x=1794928733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O2sQ0ppPahwiNKXBETtZDPbw3npwpVnR3zhVdoKxb8A=;
        b=HnKStyw5EJ2eGCPo7Z0CrYa9Ndf916KmXsE2Nca0VPt7vNluUfo07bahaJiiw7pSRM
         lO4kD7KLyBgHyc9n5Zg2C3E06RwlBcSrCNN1t3nuyMTzid9DWL29d1XqN8vXj6lxkOTI
         RJZEtUUbL/aE2R7IuQi8EAMN9OTluDBKAtYAEdSyO8R0BSzdqE5QlBTtR7LHPHjKJowC
         ymo/0hmJbJg+RHZl9FeLHUxzWPgK5c8zsOmDmhpi6KlOlsrP/NbVNO2qFjtYD9Cx/S2H
         mCLUeNDPL3lX0pDm54Jh6npc8WF46JpBRwwMJsTVCvaAMhHQlJM59Iym5mRuOn9aI4DC
         vYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323933; x=1794928733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2sQ0ppPahwiNKXBETtZDPbw3npwpVnR3zhVdoKxb8A=;
        b=EAslZraAkX5Kb/Oq+hGR9ZdsyxvBMb8+a0JbaHHEC+JgCf7EkByB6lcw1Pr7xFwBy/
         x3YiPLkLIN2YLbWJ2rocrHmfaR5u3S881v6iB8cANMN0x1AQO84Ytp3fksYtt0DZsyZC
         P4kb/Y9NMkB6kd4EN+VexWIMUEI6JGaD9fmjC1FZrVYPgWcQZPh5410/sfRHzF/bSMZD
         SfYvsffwMGTZ1TSILeRzmJcWzbLI093zPO4y2jjeCSEDBDFCdyeu7zJw0V7RjXouu3ne
         Otgs7d316BBQdLKc9qgun5oUCeDYDIP6PUHmF68cswZmWFyRVNRFll4dVL507xAPTRqN
         b8DQ==
X-Forwarded-Encrypted: i=1; AL+hErHilSEevG8FBljHTAqjHFD6YFFYFibgypCFNIUsofxEK6llAbY4Z9INJSVMqMDX/PGhT262bRUJN9A8p1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z81FLYtyEcPEOlrwYluop7LYZkxHKC1L6egzvXsx5L+Ve62ilw8
	ZYVniUZVDjjDqR1bakV/saQbGd5nc4R5kybffE6guLs2QKG645s02gFO77vmES92tyM=
X-Gm-Gg: AYBFou0nBSbR5nm8VksNcOO+Srploh64ySz+CWaCcuxliBTC7M51tTHxP4kAtxBPQsG
	4tVgWM4SsEpZQ2ud+1JyJ5CxwyxU31RNIApBiZyotRWEMoU32yvFhvn3oB3vE0OkQtOfT8Zbjw9
	1xn4w0CQtmqQEydagwu1RotcqqQGeIXLrZXNuTBjG/aoMwSwVk0QeL43FlfbP6BLL5McR+Cbzra
	eci8EQVf6VCc5cW0/o/eXqqdiQpGleX1JZ50j6MvxVYxoHMbL3heFuGE00lbrKdBi+7vzYJpZEm
	eboysbfm+ukVkIHxGMGc3KU9+Xv/o9oBWhMAwJ8EQldo+a1it7I/O7UKWm/g2yIs9oaPZHueANt
	Rx6KseDEOT8S+qToxsBi/WKWhu9p4YaPiYmfu0P8+Rjba746V5pO8CZFuoB1NrqIpv75TYqnhEI
	3V04qUSsz9LBsFaF5RZXVAko9qmY7T47cH6EZEUAOznU2E7iDpR/NnJbF5amHsEB4ZOQL0/5zqO
	nn1A/rNgp4qeJw+YmzmhTdQZy8GxYdRtpCjWGBudA4YtiUqfXyE912klySMMkFZvnCCzqlqrpmy
	dfLhOx6K3Oy00hOvXXE2UYP84lUcKG9m1Co+U0ggYO+Ms+xUfs3ZoZ88MYPHgIFLNt3+duZpUad
	1kqu0oPsV55s=
X-Received: by 2002:a05:620a:461f:b0:946:6:1298 with SMTP id af79cd13be357-9479f323170mr465893185a.52.1794323932611;
        Tue, 10 Nov 2026 07:18:52 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm22998676d6.23.2026.11.10.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:18:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQncX-000000063UD-2Q7t;
	Tue, 10 Nov 2026 11:18:49 -0400
Date: Tue, 10 Nov 2026 11:18:49 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: xuheng@cs.columbia.edu, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Invalidate a new level-1 stream table
 descriptor
Message-ID: <20261110151849.GZ663069@ziepe.ca>
References: <20261109-smmu-l1std-cfgi-v1-1-65e5203a6516@cs.columbia.edu>
 <avMxDbv6JE0dg93E@google.com>
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
In-Reply-To: <avMxDbv6JE0dg93E@google.com>

On Tue, Nov 10, 2026 at 02:58:21PM +0000, Mostafa Saleh wrote:
> On Mon, Nov 09, 2026 at 09:36:54PM +0000, Xuheng Li via B4 Relay wrote:
> > From: Xuheng Li <xuheng@cs.columbia.edu>
> > 
> > arm_smmu_init_l2_strtab() allocates a level-2 stream table when the first
> > master in its range is added, and makes the level-1 descriptor valid. It
> > issues no invalidation, and the attach that follows sends only the leaf
> > form of CMD_CFGI_STE.
> > 
> > IHI 0070 5.1.1 requires the non-leaf form of CMD_CFGI_STE when an L1STD
> > changes, including when an inactive descriptor with Span == 0 becomes
> > active. An SMMU that cached the inactive descriptor can keep terminating
> > the master's transactions as if its StreamID were invalid.
> > 
> 
> Looking at the spec it says:
> 	An STE or L1STD that is successfully fetched might be cached by the
> 	SMMU in any state, therefore any modification, commissioning or
> 	decommissioning of an STE must be followed by a CMD_CFGI_STE command.

I think the patch is pointing at this:

* Changing an inactive L1STD with Span == 0 to a non-zero active Span
  (introducing a new section of level-2 Stream table) requires an
  invalidation of the L1STD only. As no STEs were reachable for
  StreamIDs within the span, none require invalidation.

Which is really explicit what to do..

> Which checks out. However, I am curious why this was not seen for
> over 10 years with the current behaviour as I doubt any existing
> implementation will do negative caching. Is that something that was
> observed or found by inspection?

Honestly I don't think there is much value in negatively caching table
structure. Negatively caching the resulting leaf is good enough.

> > @@ -2053,6 +2054,14 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
> >  				   ARRAY_SIZE((*l2table)->stes));
> >  	arm_smmu_write_strtab_l1_desc(&cfg->l2.l1tab[arm_smmu_strtab_l1_idx(sid)],
> >  				      l2ptr_dma);
> > +
> > +	/*
> > +	 * The SMMU may have cached the old, invalid L1 descriptor. Making it
> > +	 * valid needs the non-leaf form of CMD_CFGI_STE (IHI 0070 5.1.1).
> > +	 */

All the versions are 0070, you should specify rev H.a if citing the spec

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
