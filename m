Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514878;
	b=wkcLmCjdY+Jw0qyF8rMDM5T2mOxo8VuGyZ19p5lo3gdawyl/eA8Cq3jPs5CagLwFfnBg
	 Rgj1v65nFXOXdpqxVMJe7GH9vlZhC+A2JQu9bNR4VpjaAsGEX/cCXC+0GsSomRyo8JcT5
	 K/wzAF95PEElRDjdOcO04S87B3xzLpQ0yhg0/rKL5v8vXcgJwHbQG2GyGwPJdD9Xm4SiJ
	 HjdOvnX0vGWNby4ji0eqLFoyOUiR7HcPsy5lt4nYmIo8Dkw8d1O8592kYmZK66XiEp9sH
	 sLAQ1SBM/8hnTDUtKfhQWkYLBiFiqLGyRZdrlehH9JiD8Pf8/bv9DICBJwOEHaJCB5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ksV1nYGWqa4ysMkLSXAqAv6N9dnVAqAoSrOhhUQFIQo=;
	b=nddSG5H0OO2Q2ExiBmyafgmZqeFFhGr/EYzATw4GRf1M1y8OvXdO+oLKGyBNEh2UAgc3
	 VEMIid3m0ck2rvvbpo7rHKQhLuMKsOMVTOwR2pTVedpl3xiZq9AltHT1WAtPwgVo6b2ej
	 70kE/KagfjVtSlN9x5YryLOmUT4aVyibxfJeXmNejAQXT9rXrSdIUxim17dbJBPYFt2hb
	 bxf7IBVz5br4K1zZLtHq+E3x+O11KGRi4R1tJDqUFds1O0GLMFcyTTtQDUxTxgDzroUCw
	 A156hQSB+08UQFVB/W8t/EVfEIxvzk7EsN/Ak+DxZxArdC5LyZD3q2bLzySNcJbvicQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=A0izvL8y;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D997A606D57C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D997A606D57C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=A0izvL8y
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53397554beaso38038381cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792514877; x=1793119677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ksV1nYGWqa4ysMkLSXAqAv6N9dnVAqAoSrOhhUQFIQo=;
        b=A0izvL8y0Q9h0MiYFltvtQzmtBN/iGSAXi2/Y6so2xMJzojtTDqYc9g3iSRZsCyjlm
         Zwl40E5lofBJWF3ale34iEw9x3Xq7OzCSJ4sZxZPRaCikOkt0o5/yo9boVmaSvTm1tOv
         Nnf6vGisC95mbNALSphRILzb8RuHBwM91R7v8GaRx+IdReg5ng7H6WLyZ7z7P+/BKxqv
         u86zezkEuoHiB5y7tSk6bFMLxPt59m29BiDHPAkJrBKZyo1BqUJOCq/Kj6Xsly/btbcq
         EM8WoJrW0YxOaa3+OSh56q6rUjF/Rn1cs0mzlKphS9JMTYdpVgs2plZCuHs69eu9Uidd
         VYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514877; x=1793119677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksV1nYGWqa4ysMkLSXAqAv6N9dnVAqAoSrOhhUQFIQo=;
        b=H705y4ojOqDAh8HJdJdkZNmCGUtRho8Bu50nWYdUSRgHa+rRMyvwPVePinDuv5uMMt
         yeE0gQ1II7gDSf0xo8XJigF0jabuNtz9HhDd4hN+okW0TNeyP1qkYD5WuNwrfLnNQnbP
         hRMqy8/NATaX1Zb8mh6PEkNX43QyileeCdxb4maF/zqO4wUyawHyXog7KuOjX9ubtFhu
         HIWOYgRhqBZ0n+vqsdVn3fklXhgsR/GBtwSgrjq7gpO6geR+tXN0WpBmS6e0IQ5sVrX3
         xOBm+Ipa+d5a9wa4yd8rhXVVC/1QP0tzMV35t/zqstyw5XxNaw0bawVq6HXW4qeOV87r
         Rh1Q==
X-Gm-Message-State: AFq9FYJaKBuehZ5Va79prDWiVjsOlmjoC/d8pnnPhtrjvRrBwq/ApzTU
	zQYPzoiW+oZ21oeIyJVPEYPBnUKR+Z8K0egH1RRqlpM4iYs8c6XrVS39JBvC0K5LPko=
X-Gm-Gg: AYBFou0kxZWGyqguQbIaJBY5g97hW5xagjfF1n7C2UcAqWPq2AldXLBhNoCGTosojJk
	gQD0a3ti1BMqh7E1uY3Di7e0zShARHfRac/n0HnWsU23zBK09qvemRmyahSoX0jjZzl6U06WELK
	QVzSiTJHj3QuKjKf812RuBHCGFvmw0ve1GIcw4X++8Sd1AOXrmsCjawXVSv8CQBzW6+FxdEls8F
	4ZvRNF0zd9+MYDOD39MH+sjfftiHU1Y3kB+fwhBxx9DjQpDT9dYAxun70qfS+a2bBxYXGYfdwVH
	fB3jUfLFpTr12N5g8vv7nUD8erzGxt+lOT7rvhf6K2kO2TPmsyBjOa5DrqgAEQX8ldtztGQjh+V
	KchOysEuXo50q5Ela8FyI/LZYfcpFpbSeqPyNIM8PU6Ca3DqNHM37KwdfQrJyHljOwIT11EJy//
	NjpvTjEqVCmvfzZJi2CkVPseBq9NbGM6g+tcis8PvFFyE0GOB4c3T2WqOOv98L/fRWatmIdv1K5
	/0TcCEQfVWgs3JmRXGVT7SMgb9KuHaNfK5uDOWIuv269CB4gsJYyFSQ
X-Received: by 2002:ac8:6106:0:b0:535:a5f9:7522 with SMTP id d75a77b69052e-53646105effmr173286901cf.65.1792514876834;
        Tue, 20 Oct 2026 09:47:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698b71878sm44011cf.16.2026.10.20.09.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:47:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJD0F-0000000Cndt-1WvQ;
	Tue, 20 Oct 2026 13:47:55 -0300
Date: Tue, 20 Oct 2026 13:47:55 -0300
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
Message-ID: <20261020164755.GR14213@ziepe.ca>
References: <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
 <ateGVeZmDcOSxaOD@e129823.arm.com>
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
In-Reply-To: <ateGVeZmDcOSxaOD@e129823.arm.com>

On Tue, Oct 20, 2026 at 04:18:45PM +0100, Yeoreum Yun wrote:
> On Tue, Oct 20, 2026 at 11:58:06AM -0300, Jason Gunthorpe wrote:
> > On Tue, Oct 20, 2026 at 03:43:47PM +0100, Yeoreum Yun wrote:
> > > On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> > > > On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > > > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > > > > we don't need layered stacks of busses here. Just change smccc bus to
> > > > > > be able to break up the multi-function SMC into several devices.
> > > > > 
> > > > > I think my explaination was poor. Apologise...
> > > > > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > > > > for firme specific and definietly, this would separate the
> > > > > multi-function SMC to defien each firme device (attestation and IDE).
> > > > 
> > > > I don't see that kind of complexity is necessary.. I think it is
> > > > better to just have the root smcc bus spawn them 
> > > > 
> > > > > But, the *base* is common. and I couldn't find any proper location to
> > > > > deploy *common* code unless making arm_firme.
> > > > 
> > > > What common code excatly?
> > > > 
> > > > There shouldn't be? Getting an attestation is entirely orthogonal to
> > > > set link ide, for example?
> > > > 
> > > > If you can identify what you think would ever be common that might
> > > > help clarifgy what to do..
> > > 
> > > I mean the BASE service of firme and typical example is shared buffer
> > > allocation. I agree IDE and attestaion service are orthogonal. but
> > > in case of base-service is not. it could be used for both service.
> > 
> > It doesn't look like it needs a "shared buffer", just allocate it
> > right before invoking the SMC that needs the memory. Use a simple
> > library function to help allocate it. No need for a struct device
> > layer.
> 
> Retrieving a PAT requires a buffer shared between the worlds. Before
> allocating that buffer, the driver needs to query its requirements
> through the BASE service's feature-query calls.

So? Make the query, allocate the buffer, get the token, free
it. Simple, one driver, no convoluted flows. Use a little library
style call or inline to reduce duplication if eventually necessary.

> Considering possible extensions to the BASE service, my preference
> would be to expose these operations through firme_device rather than
> standalone library functions. The intention is to keep access to the
> BASE service within FIRME-specific drivers and provide a consistent
> interface for those drivers.

Try not to overdesign things. If we don't know we need it now based on
how the current spec works don't imagine something else.

ARM spec design is informed by Linux implemetnation. Having a sane
simple implemtnation in Linux will motivate future specs changes to
align better.

> If we implments this with library, are you thinking that file should
> be located at driver/firmware/arm_firme or other place? though we make it
> with library, I still think it should be located at
> driver/firmware/arm_firme or some place in arch/arm64, but as
> perspective abstraction to mange firme helpers in one place,
> I think this design seems good.

Will has indicated a preference for driver/firwmare

Jason
