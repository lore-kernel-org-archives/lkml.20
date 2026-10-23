Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763343;
	b=ya/49NFzUQuMfPGx51QKomg1+L5tKXuinyjNHY6LXA45d9FHr92k/fNgq3hjKnBOtVx6
	 loi+jZZDcvEd/l+Fuoib33q9oVXOG47Pq3kzrOyc20VQs6L0qrwxSIezEsm9z8eCEE1Ms
	 vntO/phwPKzbjmndkAVjythiS4aoK97aaKpPaTNWJ0ZSTGHbUYtZETcRwX50Sq07yAWxP
	 EAQO8ETVJjWLNeRLS9haJk/8+p/fOLtTlzpF4DeHSUL/+F3PJWyuNsqnSIu47y+OMLeqw
	 S8eN6v9lMO7CSvBxJEz1Ij2Zl5fJ67M9pKL5uZyC5PNixDV1zsLhjJO13+DQZrqKdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WZKXP8VTOXU0OFEfLxvR9auLXjQRH/E3aKS3dlf0WJ8=;
	b=bKXZoU4u5HvG3QUP5Jiwoe8qSxtbzSxuwVkFzGPLp2HmBk7cOWj6gYt4OUTp56FcL2OP
	 BUXzPjLpTEe1L7CR9ShtJYA8P9MCQ8GhuwevSee1vW8Vhd6U+w9ZLGGrE3B+soIp+H/re
	 oM+RxwfqfXh8foY2WhFJfo/nttYIuouXx7MTbIL4RRBq8lNEKmmvt3DIDChqzEtoF7f0b
	 IveZ0Q0MJxpo/phConqjbGQn+xM3XYf41l9g/iAYDE5r3Ok3ed915q/h8Q/e/2SuFzSOT
	 hTZQITc6q/aLzJSWlK1dR708/AWTYtWcjvpCLHznKg++u/FwQA4Z96G0XtkpBxKuOtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AgKfJnFE;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F3606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A99F3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AgKfJnFE
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e503815adso96066985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792763341; x=1793368141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZKXP8VTOXU0OFEfLxvR9auLXjQRH/E3aKS3dlf0WJ8=;
        b=AgKfJnFEgff2CXf1xsOluQ/Ldg4QgaI5idudCLjDs660qRtIP8Oxz7X+DJJggxXJ39
         5eum0duGcMdBh6/UGO0oO91qUgb1/xTzmIxAeYzvUvuv1WBzw1WVcl6oF5TdxD7HGQxP
         HChWv9mXJNl5FW1SoIpPrww4tJUS799FAb3X2cGkd9vSkTq5+565L+0uBbsYK6oAQ1cZ
         Ij330XlP3rPXcAStRSAr7VegrqfrevCwlhSPFi5+vKaAFZPe0OeJDM8Z/iV+OawjQSNd
         lgEU3CM5R2Ays793zsly9pzN63OCIowikEv+iR8cqOE24YCQXSuIxhP17DH4OHpiPxfd
         4aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763341; x=1793368141;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKXP8VTOXU0OFEfLxvR9auLXjQRH/E3aKS3dlf0WJ8=;
        b=QOGVAqPF5MGipEyd0ezeMKykxQ+sQuQtR583Gf2hwjXeWMNV9a1zIg5fzaWSl/+Zf8
         C0DgzP8VNB8fzwY3WLsKnCDrts4t6p0U7RkHd5bS1PEMtyDWbM3k3XxqZxEh3SP8qxeI
         qgUNpKztNu4Xn3RGPsEulZYepcgZThUCi1PYkxZ6RtKCozC16yoQxHnmbm+jg2M/eWJK
         Nz4bSslVtDGsIj3+86KnRkOKfcYklzTnDL+VjegCihvvXUO5umUZoa9/aHeLX1xnJeS+
         KRTsnu3nqLYzwRwNQXaXlegC0UPYEMYqk9svK32s2tg2EqZpCCjYwXeO0YGTmCB2mzpE
         L83w==
X-Forwarded-Encrypted: i=1; AKwUvByFbiFzReDr+Vn5k7KzC8pIdqN72mI1+IMJLyn9Yi6jhtTANCA0LKdNbaaqQSzeqofDir1vq8qJ08hvrHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRhDHLUOHT1KvmGqE7im4v68iptg8Qtk1BxpMiqEed46ZsTY0u
	YVr2QMVkqP8f3rvKO3LndcrqqMYDyoPHNTLeY1KxP9W9rtMimaXH3xIcuMgerMUcxqI=
X-Gm-Gg: AYBFou3OzsBqtLFSAxwmL6FM4YNazmClKMQHwvBZpx7TF/17QhqTXaFlcuoYL2F5ZRv
	oMiWvCA2sneerCxuD1FRzZdBuQGHEUsvh+NuB1n3rK5/aa9rwtfnH52PEaKLPADmxkvtgoJwW/A
	n7GJMC6dkGIlkwYhG0fkow3Zarfzcwsdj35AT8T/gFtd9IVy/iqLdaKR1Ga1WK33PQRwqBd0Ekx
	zuefEZvcdDspDU02MxWGQeyB4XQdHyLWU8BLLf1Bgj7PsPqHmIRR93j+/88N21qCJ3ZT404Aol5
	a568XEhhQaVhMO34w5HHQ6ouOFIDFy1S/YykqGtMhCjyHJBsEWi1PbWcI4SijWf73nuZLDjUmTb
	k6j10qB+2HSv/jVzf9SlTcoyY3NLYjFCPN25NKasHRJpDMLKgnFrn7JoNdVlyAjZUAg6EJPdCZM
	vtjhkGmRGLj2nSYeBRyxj/GdGkH7HG4tVHXlnPnwwWmalctmD0CoZ8x7KbstlHaPSP/oCzcp4Zp
	eJeWxRbUeiQFMBVznFU6icgJKJK6Qr+AHDizHvAcBZ6VZ0L3ZO0c6UIiRIllna8xejchtp8rXlK
	qoHtxyDmkdOnavifOq87uD8=
X-Received: by 2002:a05:620a:439e:b0:93f:1cd7:734b with SMTP id af79cd13be357-93f6f796974mr406212285a.34.1792763341610;
        Fri, 23 Oct 2026 06:49:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b1c97esm21136585a.30.2026.10.23.06.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:49:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKFdk-0000000GhLJ-2S35;
	Fri, 23 Oct 2026 10:49:00 -0300
Date: Fri, 23 Oct 2026 10:49:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Matlack <dmatlack@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
Message-ID: <20261023134900.GB3977851@ziepe.ca>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
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
In-Reply-To: <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>

On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
> > @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
> >   		struct arm_smmu_cd target_cd;
> >   		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
> > -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
> > -					&target_cd);
> > +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
> > +					  &target_cd);
> 
> No, we cannot blindly do this for arbitrary ->attach_dev calls - the
> majority of S1->S1 transitions are going to be moving back and forth between
> the default domain and user domains, where there is zero expectation, let
> alone guarantee, that the translations would be equivalent and thus not
> liable to lead to TLB conflict aborts or amalgamation hell.

Heh, yeah this probably only works properly with BBML2 or something so
the temporary ASID doesn't explode.

Jason
