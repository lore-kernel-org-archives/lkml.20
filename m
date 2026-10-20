Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507433;
	b=LVhPhmJUh0bqdQR9sktaGiD5IXHkAy3F2wobSMcFPLkFJE1XwZ1+fkmu3ro2WuCQzw7z
	 q9GFriS90xQWOvYLyx//D1Eq9tHRnTMzG+tbnQqEiO2jExpAR2YhMtF+UNNc+0cH8QZ11
	 QTkfkFEdloY/ZIoIX4LoZsP4ASbLlu00be/Gun4DksnXNw7UbSA31hI+Nm0MpkToVEgvd
	 h8dnjJydu6f3QbG+3lyV/UI0ui7LQYgc2Uycp7XfVO0PlyOI5Hz9z6UyFZLFXliBrxIuq
	 6jbbnLvCwnAP7ja/qTC/0xvqVk36FxYr+jef7VJLXHgFaxgIEsgUoY7uCZLu5+k1b9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507433;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tszaJSkqKNg/gD6sLTsFGX7FDn5XDitEJB0LfKIiqEg=;
	b=RU+PPrqfi76BQHdTXX1Z0nlxW3wPz9VGrrfMnC1EARaJ6vUCfn3eKybiDCF6zDPI2/dH
	 nThGZxP0i44ZoquzHKXyFpQ9OPSe3G+lC7W5RfCtl+Ki7V29QIh3m6sxmuz6aqDBhjkwh
	 Am0nr8G6SkcYIYg1SMX325/A+nCMv7PyfLZislz+uRbry0qw68aImHXRKyPzroIbaC3dv
	 RbvxmPQxYgg6IzgkrvmzrcxjVIc49s1VauUnU8IfXPzmlqpZpEB0ZAckjFGERlvPLcWDi
	 BZXSHxUzY9cPLyGA5Xcm15vWYTCSWVjWfW51VrbnKKNO8/Q2vIsD03M7324cS03ob+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Flm2RA8p;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB48606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB48606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Flm2RA8p
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DA5C2103;
	Tue, 20 Oct 2026 07:43:48 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA1943F7D8;
	Tue, 20 Oct 2026 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792507431; bh=ai4CxfHeJGRIqDqehiHXoYeWahRJlQGznfMvaCHUgDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Flm2RA8pFqaKopRDXQeefae7/VimisOEoCJEbluSS7T0/WgQQcubrPzP/h3Yw9KEL
	 5q1JvjnnsBBEg6nJtiSbWugJId8gxKKYKAvHk7SYJ0oTT077wcke/d3oArCP654MkW
	 Y6jPeUkZtobPsJudSRBSP9WRwTZy7YhpEw/5LZFY=
Date: Tue, 20 Oct 2026 15:43:47 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <atd-I059nHAwcZFE@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
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
In-Reply-To: <20261020143620.GP14213@ziepe.ca>

On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > we don't need layered stacks of busses here. Just change smccc bus to
> > > be able to break up the multi-function SMC into several devices.
> > 
> > I think my explaination was poor. Apologise...
> > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > for firme specific and definietly, this would separate the
> > multi-function SMC to defien each firme device (attestation and IDE).
> 
> I don't see that kind of complexity is necessary.. I think it is
> better to just have the root smcc bus spawn them 
> 
> > But, the *base* is common. and I couldn't find any proper location to
> > deploy *common* code unless making arm_firme.
> 
> What common code excatly?
> 
> There shouldn't be? Getting an attestation is entirely orthogonal to
> set link ide, for example?
> 
> If you can identify what you think would ever be common that might
> help clarifgy what to do..

I mean the BASE service of firme and typical example is shared buffer
allocation. I agree IDE and attestaion service are orthogonal. but
in case of base-service is not. it could be used for both service.

Therefore, the firme_device wouldn't export all functions. In case of
attestaion, it's enough to export base-service and attestation-service
only. for the IDE, base-service and ide-service via union.

Also We don't need to export base-service firme device as part of smccc
device. It's enough to export two devices -- attestation and IDE via
base_ops. But, to share the base-service opeerations to both devices,
I think it would be better to have current arm_fimre layer.

-- 
Sincerely,
Yeoreum Yun
