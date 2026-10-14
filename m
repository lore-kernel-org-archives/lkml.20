Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45827486BBF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014255; cv=none; b=lUqJRDlGAU1spagbPBdCo2edaZ/PDVrOmc9sZmvi3KGv07EXgAS5jgYqSWxwiOVSLRQYSWOyOLy4ZGcsKWJZEfuo1LJOMGu/IQzME38ass2Vg/+jsG8H6EFSac7FfHDnJew8t99Sz/1ZuoMcCAPK7pvhHFesEn0kfpb+XI0V4Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014255; c=relaxed/simple;
	bh=2mFZFH/t7Udzmx14+PyJpu/xSr91XvmPAm6UXWNwqGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1Ej6ktfSWu4LEec4943P0TVo4XMXsjDjcFXrPJdpG2wZ9CgFH7HG87XaUsI6j/F5jfbs9c76k2U+lisGfEL7QJircReYAs9U3M0s//ZjNwVW9oKvuQnH0OQvJjoyZ1IWjDuer0YPhHFbwKHpEAFvJRRtf99cdvS1NLCE1MxvEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lbYsagp0; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lbYsagp0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=jdZa5mT6e0C2U/Kjg0oF233p2kgkpg3mIMsYIfiUcPo=; b=lbYsagp04O4Oc3iLW68zu5zMCJ
	qEMAhGP//WbRVIs1DgvSn+N9NA0nbW1yNxg4f0s5um7pW3Q6GTV6/j9NM8u0KeKp2JQdC/X6F1hWw
	9dmQQDhqoQANl78PqeqXAszZjxLSYyiEXFvBM6e5uXadbzKiqRPanSTnX1Xs7IPrJ368jOgA1QvwV
	hTakF8AbEpnhlAa3dOvhrem3a7SaFyZB7l/A824xWW1H/jU+R3CClP8Hjy7Vm2ikKI5G6hkq9zv3s
	C2qol7LFHyM5dY7meUAQkQUZS/0M7vsXKoBZo4Fyf98Dv4cw7JF4LZRJzjHUy49V2NwPpHi85pzas
	aDRfh7ng==;
Received: from [177.172.122.211] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xH6lb-000F5s-IK; Wed, 14 Oct 2026 23:44:07 +0200
Message-ID: <430b10e9-7c8a-44ad-904b-e579250b314a@igalia.com>
Date: Wed, 14 Oct 2026 18:44:11 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/1] arch: arm64: Implement unaligned atomic
 emulation
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, kernel-dev@igalia.com,
 Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
 Ryan Houdek <sonicadvance1@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Billy Laws <blaws05@gmail.com>
References: <20260930020138.2377090-1-andrealmeid@igalia.com>
 <20260930020138.2377090-2-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260930020138.2377090-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 29/09/2026 23:01, André Almeida escreveu:
> Implement support for emulating unaligned atomic operations on arm64.
> User applications that wish to enable support for this should use the
> pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`.
> 
As discussed at LPC 2026[1], the split lock emulation is probably the 
first thing that we want to figure from the atomics issues, given that 
is the trickiest one to emulate correctly given the need serialize two 
atomic instructions. As suggested by Mark, first we are going to work on 
an userspace solution that delivers correctness and from there we can 
better understand what the kernel could provide to help with performance 
improvements.

Thanks!
	André

[1] https://lpc.events/event/20/contributions/2594/
