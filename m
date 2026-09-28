Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC164F4D0C;
	Mon, 28 Sep 2026 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624968; cv=none; b=oHuEv3FODKaaCDiCgUojdHuQaNDu8TAduxN4ivDxDQmAvxtALgmQUwVsNBJx1TSWlP1JgRYlKgtIUclvsh63ixcB4y0+bY+iBpmdgYd8fqeEhqarlFtfXWrbp6n/25ufuohk9pHbLgO4hjVFOkOlk7dVZ63gxCBFX7eUbXTfz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624968; c=relaxed/simple;
	bh=7o77pTnjeOSoxoDD5ssxk5NZ1eXZMFCj1o3WvZtRivA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rS7ADzookEoCChE8Bq+Y9zXM2QI2y5UjeMvdug1MDOhUTqc8UhNgmuTM4ERAkuLcpziiILGhlYNsbvgOk0p84oQf7VwvIss9dYO46OEk7Rvsa1s9siGdbLjm/eo5b/WgXXqCQN8/RSx40H/vc2wzOcEiHozW5osN6kF//h2ulEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqnckNh0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqnckNh0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6579A1F000FF;
	Mon, 28 Sep 2026 19:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790624966;
	bh=l7/YI7FRrETb/asOI5PeYj4PbFYIEGS/JQzmYoPYRog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mqnckNh0hwVI289fKVflvhqdBpe2kttgW/bxIl2L1t2BcDLyN1GDuCrEMB6xAKF1P
	 1qv9BiGL3s8+nZoOx3VujZ1BauU6Hg4+p4McJeeM64W+ABfgjuxSBqE58Q5/bxNG9Z
	 Yev3SS/VGWarV0X2J/glPLF4orllSgQJWXzq0Wy9natgtUpYnVoybwGuluPIzUZ7W/
	 f8IUecnnCFr03QkpbOvlEytL+0BAjtZFUl39ffvMpjQX8/YP9MSWrjIZr+RLZNV0RW
	 mntE6GWv2Y/zAzdabVJXnv5tu37c5FyFQhncBjZ7q3QFm7771q/GooqeYsv6qleucp
	 tl9Kssm5LZrng==
Date: Mon, 28 Sep 2026 14:49:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, mfd@lists.linux.dev,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>, Oleg Keri <okerixx@gmail.com>,
	devicetree@vger.kernel.org,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: mfd: pm8008: Make interrupts optional
Message-ID: <179062496368.460012.2064781260995453767.robh@kernel.org>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-5-de33d78fad9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-pm8010_i2c_support-v1-5-de33d78fad9d@oss.qualcomm.com>


On Fri, 18 Sep 2026 22:12:49 +0530, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some designs integrate the PMIC with the interrupt pin left
> unconnected, deliberately. That of course compromises some
> functionality, but the core function of programming the voltage
> regulators remains there.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

