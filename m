Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508288;
	b=iw1xLC6DQfzoWiOAoHA3PdvyjMDlNhkpE4mQ6d2BkV8Lwaiik2F0UGvfQ/nbGbYvb5Ol
	 HIgHv/TeYKMXjXFBohXnBBTDUVdqzaoEcoCFhEH98jfQC28hnCOEmc3d/oc0P6DyyIx6Z
	 q+yrrenhzcQ8jWv87w38cXrIomC9NbRuzQkWX4TNT1EzbYFRfwQLgEaK1KFdMT7XuqjQq
	 XxKpUgI3Pvpy/BUivBn09Yu3fjqlt5WWvUU9jklOCWeLVpW3z+doBmHgbMN1CCqWdImNZ
	 Zj/+nqAeqzalkn0YEBv3VuTzH/XnFvzA/ZoD8/6P26s8+Xr9Qb/eWROomexlacO3EBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SjbG/FoRPniPEwnQTEjCNTAwJMSN6gDCjOc1NSBW89Q=;
	b=woP/uY6gn8puiBDYc7TXQsBef7ppO7x1E6vs882vdoR+3aZWxvIvI0GU+2sxj2s4YEov
	 z5RMOledzKF0VvEsJeoOrVTrGSUfsE6RJNX28gYXrU3vYeMh6wLIy/N/H2Uq0I+Pvgpqu
	 ER7rBmN1AayzaizY1ARnuhwKWfWw6bKY9GO9MZILLyEWT+xShU8lAWsCc0mBm0fmjS7gR
	 D0OcEZbvYY/ZShh0wTDaRWtjXV5JKq+Sbu82/iiSLC/aQTQy19YoTNf1DOU1wiFqiezep
	 O2l6j5MfsbhH/R5pE+kAhIejXP3bfO1TuU6wKukzSEg4aV3gTa3CehJxRqmUktCeK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="hu/e2Mw3";
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D12606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D12606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hu/e2Mw3
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e4c00d71aso311282685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792508287; x=1793113087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SjbG/FoRPniPEwnQTEjCNTAwJMSN6gDCjOc1NSBW89Q=;
        b=hu/e2Mw3PdNsPqMupDBUrVrAEItg32BCTvjrSvC7mig1eT0cF5ErfxcJsl+XEEKteE
         6d9yTgmSRP6OSe2dfe0mAgt4EW0I8gM7ClFrGpS0l12kyuKD/e1VBv5TH5Mfm/xXPs0z
         AOGSfzLfBaYfV8YCh77alMltLDQI1+IUkdUZI77HIl+oakm3tAtmZYvd7ua2z5cKAoBy
         x1k3cor2DEtBI0g1Z8xAK4w+waXhV+JjKFniUDNHW62KaRLkxCUD3Bl9j6pUbCDATliB
         rQJ6gTVz3eo7+CUF07e/UsRZ3ADUg5XOnZsb8ylzlw9GhvoN1+mHU6gGFDhZJV8V7vHW
         1Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508287; x=1793113087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjbG/FoRPniPEwnQTEjCNTAwJMSN6gDCjOc1NSBW89Q=;
        b=jjB4Zzi/H2W+8ACozkiLfYhuBS4um6KkSYG0H5r+6lcZwPmoYjv88mCpoU4z0JU5S3
         qDBCctCCuvZxKgTtviWT62+Umy3Muo054oCRJE4mv5e7zRsWMh6DrnRxySDIqdqzOJ39
         p2f+uXyiBuLf9otGKN/2y+KMVpb6roxmB/SI/i5mMJzT2bUwz+XHNEnSLdx7VKGLnTla
         1UReIsAoQHZohfyLmd/DpmWHdzFDecekj2yA2zsvf7/CwqUh2PPWpU1XzT3F6rCP07wg
         kTLXVpqUTTEk2584Oy7+GvvBy22GSzrVc4MD5fP09W7ud/oKG9v8dkJUIJKhUUNp120e
         s8KQ==
X-Gm-Message-State: AFq9FYKa6mMRblXGRf/5uOklHHLL5RGbpx02gWe3rq7F9+QDM245DJdM
	l2u7jQoAcycNNj7O1uFyYwip6MH1jXqWgcLgqIkxhANVhk+UhTMOeXAOqEWbqtx9Obw=
X-Gm-Gg: AYBFou1dip+NaVUQ0q41sLe/AlF6Cdhz4xq7efzoRypsAvNQWyP4weWgGhMTaHqHuxm
	Ay4C2oFLJYBz5+y2aMddy5yesg/U6jEXUT3JQPz2ej0iB65CuoWX+RGpo3uc2TrkYTdmOzomNF+
	CFJ5rt3xgN3Xv3UNYE08WfG0QP/2GkDnJSnCycCvjWTK8VhNmpW/kfd5oSbw84xCmg/RHwFksme
	N+uVObWLYfxszXuPJYV3MiOg3etUTLS5k6zyDuIEaE7GQ8LvhwiyYYiIfBbul1atEWjIbp302BX
	8HMwFUEze698m5My16PujmJ5165brV/aq21vdyAOnRybTmeAzRNewvBsjBZs/rvjBVOGoEx+W+s
	Ab9jAihH8hj3CSnzfOlMsaYzsauFirT9n4hcdpIwh/EC7oM4PHeo9SU1Qhea7Oh14t46MzqMXjk
	UzQ8u1nNVeyYjn8157qWR5CWsPbD+NllmmizNcpk3qMagjSymQd8iE8KB6xS/1Pn8IFV+90UiX1
	WQaMr1H/xTxjhYQzub/N9/kNzi7/4Ya3bu4oF2z/frjRoiOeYwmqTJB
X-Received: by 2002:a05:620a:4442:b0:939:a0f3:6aef with SMTP id af79cd13be357-93f29ced7cemr1836575085a.23.1792508287130;
        Tue, 20 Oct 2026 07:58:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56dfdb2esm1820385a.28.2026.10.20.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:58:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJBHy-0000000CiZ3-0ODE;
	Tue, 20 Oct 2026 11:58:06 -0300
Date: Tue, 20 Oct 2026 11:58:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <20261020145806.GQ14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
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
In-Reply-To: <atd-I059nHAwcZFE@e129823.arm.com>

On Tue, Oct 20, 2026 at 03:43:47PM +0100, Yeoreum Yun wrote:
> On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> > On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > > we don't need layered stacks of busses here. Just change smccc bus to
> > > > be able to break up the multi-function SMC into several devices.
> > > 
> > > I think my explaination was poor. Apologise...
> > > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > > for firme specific and definietly, this would separate the
> > > multi-function SMC to defien each firme device (attestation and IDE).
> > 
> > I don't see that kind of complexity is necessary.. I think it is
> > better to just have the root smcc bus spawn them 
> > 
> > > But, the *base* is common. and I couldn't find any proper location to
> > > deploy *common* code unless making arm_firme.
> > 
> > What common code excatly?
> > 
> > There shouldn't be? Getting an attestation is entirely orthogonal to
> > set link ide, for example?
> > 
> > If you can identify what you think would ever be common that might
> > help clarifgy what to do..
> 
> I mean the BASE service of firme and typical example is shared buffer
> allocation. I agree IDE and attestaion service are orthogonal. but
> in case of base-service is not. it could be used for both service.

It doesn't look like it needs a "shared buffer", just allocate it
right before invoking the SMC that needs the memory. Use a simple
library function to help allocate it. No need for a struct device
layer.

Jason
