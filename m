Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED83546FC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160740; cv=none; b=lc7cnXAMxAWBNZRnGwiVV212/YL0Ob0lP32Ks4BBlbv/ZQL6rSg+Pdf8rpeuT7Gk8dZmaXFs01uwtm0868oUzw94KfN0kVgGkHw/8CvKdVgqoZV3Rtfpok0ZWnsprm1oexIxnDhn3n2X3FlM/a3chJO52MXH3W6PjpH0hpPvWVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160740; c=relaxed/simple;
	bh=2vGcDzsdpNp3kRCn75jM79nFrKB+2GlocvrWcAHxSGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY5ch69tpbl5OC607LcaizM8h/VSWatmbzm6I8DbSxWPumN7vXH3K7xybZ/aCMvefP10G5ZrEBpZ9h55Ofyf2THnwKLGDJEGnUxSV9jr9tNfw6Jeo6YFMXcsSRMy3V78KmHZGmuAxN67Z8Exa+kZWGFoXFoFDUcroZXPze+CrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kvURZYWD; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kvURZYWD"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9178d514951so535966d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792160738; x=1792765538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9B4QGdToSnYzAqwiubGkyqZ40Y9TYft35PK0Z/WSHI=;
        b=kvURZYWDvgTYLkFx7XuMDIdQbk+MKxRxGjg2UBYsrcwP/o5fI+hjXSaJ8IGTYm2Bcu
         EZFlzZonKMQ0U8yGEtvMDMLfL3cCeYMtK60HZK5NqZRwObNwq9YdxxkFJw1w81L/uY1O
         fZk3tknIxo72h9YH10hJ+qsZ5LRFhMMp4bUMQczPjDIoPnNQaHNxOpQmBYi2WrLHZgCq
         83SOdMy7RJOK6UwN5Tp5EaBguAu8alDujax0CE8XdkS4ncI6oJXySHbxeshgGWHUABCQ
         4YHCXZuZFEMDwDSeUAqyAiq1xQqVpfqpzAUVQYBENwNTHYPlGXGGbMlFxKnwxK8tAapC
         XJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160738; x=1792765538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9B4QGdToSnYzAqwiubGkyqZ40Y9TYft35PK0Z/WSHI=;
        b=Nreuq2Xgbku/UHKZrXbp5x0jgd81BXk/IE6Am+hb1mRHFr2mbT/ce682Iysrwa7PgA
         sy3bXnArhsf+cJelqilzhrF7XggYUl7fnp6m+kqhT7fBxzwFqMIV0/qwY2xOY3/uJTLt
         xqQf2cKueVEtqhv6o/yaSV+GF0eY9a7J+O7bjeYDxYswteBBES0+s/vZLMwa3F8kmVhZ
         vWRG6AbO6tqCX/3goMn5mA512ge/pGmQJgJlE9EbhHgSwKA+qudZZH1VLyW6RJC2UMme
         IZ+qtvadW564dKeLe2gKQo4GaRM4r7MuT+oWHxxoitKb5XqWRDkHocRENeidm+PVTkNh
         Fs2g==
X-Forwarded-Encrypted: i=1; AKwUvBziaxFIx8XEELr+wUPst/ILUlaVPrnuM1uc5Tk/mtikF0BxptA/QQZQvjkT+1yTOHCW9irLiRfYpR1NdlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4kiaRIaKF0HyOG3L62vXFMPyavYPA4/pzSDx7RiEVg9eNIRg+
	va1Zj3+ot1jWt0RbPMWLpPp1/UTvu/4sAzWDeMY7t1DYKfifdSo+v+TKnZopUUh3LSQ=
X-Gm-Gg: AYBFou1upXbY/Y2rTWDiZlPXlP5opFafTwk9UznAnwuCTiIJ9K3VAqSBorSqvL13Ged
	5n01azD2rQwaGMtQRXN3Eq3NYDWIW5qpMA5fHu0iOB2fu8lzxX8cxKLcQUOiHIjydvngo+PRYe2
	dSOrha08yuv67JEFUD4LFWo+oKkh0d+P+VJWWZ+A6LFz72c7UwCGdGNAuJ348TGcf1gHZbOza7Y
	05VooyoTvRej/Wmx52iA6ULKp/h/gIpLM3ch+vQ5OfYsw3kBmvCwtgcdNQ3KazGHHxFPMn742zX
	fKcxII+laKAED//UrR4WnwoIA/cCkh26vrVDThGW70cz4J6mlMUGGcwRX68zlo9Pxd2sL/QPf3o
	/v0sfojWkarCaLHT6DDZkKbY0QivgcJwU699eHe5vfjDzL0xIIH6Mn0YBWoHI7wmU9LcR7bmIaE
	84w7szO5WxeXgZyO9adwC2W12qjNfHfcFUlfY1iDU85ihNIVX6/cm2ZuzPg0/tGIoqhpWH9ZtsS
	7JXUriiAoJ0hP6Cbdp8j4QZhM+kIWysjoLwxNrcykhV1je2A69qJGIx
X-Received: by 2002:a05:620a:3947:b0:93e:78b7:fa4e with SMTP id af79cd13be357-93ebd24b2fcmr3934753985a.37.1792160737536;
        Fri, 16 Oct 2026 07:25:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba3e3a0sm23953506d6.9.2026.10.16.07.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:25:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHisJ-00000001pql-49O3;
	Fri, 16 Oct 2026 11:25:35 -0300
Date: Fri, 16 Oct 2026 11:25:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
	aou@eecs.berkeley.edu, atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com, gsh517025@gmail.com,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
	robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
	will@kernel.org, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH 0/12] iommu/riscv: Add nested translation (vIOMMU)
 support
Message-ID: <20261016142535.GD14213@ziepe.ca>
References: <20261016000004.GB14213@ziepe.ca>
 <20261016091610.13912-1-gong.shuai@sanechips.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016091610.13912-1-gong.shuai@sanechips.com.cn>

On Fri, Oct 16, 2026 at 05:16:10PM +0800, Gong Shuai wrote:
> Hi Jason,
> 
> Thanks for the review again.
> 
> > > Add nested translation support to the RISC-V IOMMU driver, so a KVM guest
> > > with its own vIOMMU can own the first stage of a device context while the
> > > host keeps the second stage, and add the interrupt support. This is an RFC
> > > and comments on the design are welcome.
> >
> > The iommufd parts looked reasonable to me
> >
> > I feel some mild skepticism about all the MSI parts, it would be good
> > to get more of the interrupt stuff actually landed before posting this
> > again.
> 
> Agreed on the MSI parts. They are a working proof to exercise the
> nested flow end to end, not a finished design. The reason they are
> in this series at all is that the NVMe device we use for testing
> depends on MSI interrupts. Without this support, DMA succeeds but
> the MSIs fault, so the driver ends up polling for completions after
> timeouts.
> 
> We will keep following the irqbypass groundwork as it evolves, and
> continue this work once it has landed.

It seems to me the riscv interrupt architecture is a terrible fit for
Linux, so I would prefer you keep that out of a viommu series and try
to address interrupt support in VFIO through the other series.

viommu shouldn't change anything about how interrupts work..

Without the msi stuff I think you could get this merged without a big
trouble.

Jason
