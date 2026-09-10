Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B82248593C;
	Thu, 10 Sep 2026 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043029; cv=none; b=FbVxCxtjgdwGISB/+OXHJQbQCuSsFBVofGqCycYsEUL1aNXKaRIeEHHYk4OFBO5NaEbidJ0yMDKBxBL1VVSTjozvgRwQAUbjUF6XF6kbrgbcWvZoNTMl/ctBB/ZiitZmFUFLycww6gDfdUuikeuVMd5LAcMOlym+rr3D9JoJkfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043029; c=relaxed/simple;
	bh=aKNIgiiXJVkvUc/+xAj4Wu2P7aPpl/cZu7ivAUmAS+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tq6hAzhReYIkOtiL0nTdDnkjjngkQeQryvtrnhk10HhRjvlSiyVEiA6/wz95NTr3p345r93SSL7uROEXA6fWjsoAXby667ZNXh7/B/jrsA2vwmT7H5VQZQ0iHQVxsbjLKEf2P8MFRhxtme5cUPD+xio76gLFCkMXbiyXZ3fF0RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktuQmeDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktuQmeDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E413E1F000FF;
	Thu, 10 Sep 2026 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043027;
	bh=m1VhSVCtMgiBJf29Yc8esGBmlET73PXMwLnKd186wJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ktuQmeDThejQ3JxmUDBQrDaFgL6jaZfxdugefXOh8UQciZGravx0r+/2Ra517iLbp
	 VUCQ9jP7nzKTLYg574KrbCFJBy5wkf52oUeDIlKUiWxkVd0lvdCVGB1cOr7194KL7j
	 9qKJG0ijmM16ldzGs2lSoIaqmkBc8k5btkgoclv9uaXlthtglNCRo335sANvj7rvIP
	 VdsXADVnS/PXZLBV5ntpyixYZVOOalQShcWgoE3KzbQh4R9jHDjp21bOVdITOzcVkg
	 vIYC0Pbvf8fIzlY/7+Vkc/AkjstGTVuZPxq9X742HDCodJ97QWJDfetyLp7COC5O4s
	 UqBJgal6/ewfg==
Date: Thu, 10 Sep 2026 12:23:44 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: gsh517025@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for
 OrangePi
Message-ID: <20260910122344-GKB20735@kernel.org>
References: <4e8e6f90-9731-4416-8b1a-be1cef12bb72@gmail.com>
 <20260907063010.1882362-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907063010.1882362-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 14:30 Mon 07 Sep     , Chukun Pan wrote:
> Hi,
> 
> > -         mac-address {
> > +         mac_address: mac-address {
> 
> This requires removing the aliases for Ethernet.
> 
> > But I am not sure whether this wiring should be part of this patch.
> > Without such wiring, the kernel falls back to random MAC addresses
> > on this board.
> 
> Currently, U-Boot patches the MAC address using the Ethernet alias
> from the Device Tree. The vendor U-Boot reads the MAC address from
> the eeprom. I think the mainline U-Boot will add this feature, so
> we don't need to add this one?
> 
I think it would take long time for us to get there - to have a mainline
U-Boot which support parsing MAC address from eeprom. So, I have no
objection to the idea of adding mac info into the dts.. 

Just let me know if you guys want to do in another separate patch, so I could
take this patch first, or want to squash together and send an incremental
 version? P.S checked k1-bananapi-cm6 board which already done as suggested..

-- 
Yixun Lan (dlan)
