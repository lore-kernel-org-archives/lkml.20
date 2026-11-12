Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513184;
	b=GEqIJZvw7ZdtNDQqG/hIiKS3VDoCm9BGr7RAULM1Zvtq9v2+vR9AO8Y4/ZVMD5s23E2b
	 U6s6s8+G8GuvOXgPPHLmTxkqr+CrdPbMDTjc/ECqwdzKQsaKAVw799Ibr9MTmyKlVYBzs
	 GAmqfhpss1dzHWDIywlMGg/ZEExE0K+WPF8VxZJW/QDLKs0dnbeRcWahRpoh6l+hpolCS
	 aGm7O3apk6lSC9eXSVwIhOxT81+gVBiWRjiEUa3eTuvpWYCSTuEG9S43EEdJkqsH56XfL
	 +85YyHOvGbQP2E2N6xpVhfiX+eIQOoPEZXHcpDhttO52T0K5Fd5ulwTXjCs2jbkQzxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513184;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KrAKCc1OnJY4LbejaA118mCBpDZA++ULUTspBpWDwjI=;
	b=u8v9uyKeVsWbfsCwQrGhcZiXQ7m4iVKLy6SzRt3iZa4WLFtvJ3hbRb4XDiuReyE766vM
	 mq6+rTpPF4rMcxHQbjY+Ss9012qC9rgSfV6QQgAvN905KjPSZSlBbFmT0a62C9+HM6n0Y
	 F7sTGE6ToCfUc4PxhejSULIwkdXUmvls+ACMBxwDkcN/6lrkHsENdgTHPHCKalp1xGODv
	 E+dOebZvZ56/Fm2u1ntEK/Vq+DffHsVSgCGz8qcoGNyWJNqgHIRD98HIQuVo4y+MqBjP2
	 BjrNUNfoZyfeaV2acHazW5zSpuODaB348ZyxRgI5AcOEjy5xeWwq0pcYj/DHa+8C8rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KIa6jf8x;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881F4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 881F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KIa6jf8x
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1608B143D;
	Thu, 12 Nov 2026 11:53:01 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E67833F632;
	Thu, 12 Nov 2026 11:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513184; bh=UVssr2h0mtTlZR3uknoInjfb4xYkRuFDnS+ok0EQ/Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIa6jf8xPIhnYjIt1/ah9uwMyqR51klIIHUVgOF56JSTCncADpFq7xBqP2MixQIcJ
	 lar+vP5zIri1gYTsurYMR/2zyxKxAviqSzUjHuInf/T5u3xfuEFZ4PJbUNfJxKzJlC
	 BXRRfQxb5Z7xmfdWLFC8XyLxLlUthyJ2GWqdnZEw=
Date: Thu, 12 Nov 2026 19:52:56 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Beata Michalska <beata.michalska@arm.com>
Cc: Will Deacon <will@kernel.org>, Vladimir.Murzin@arm.com,
	suzuki.poulose@arm.com, xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: errata: Update AMU workarounds
Message-ID: <avYZGOO_gku8RUKj@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <179451296804.3304937.3878967781756339834.b4-ty@b4>
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
In-Reply-To: <179451296804.3304937.3878967781756339834.b4-ty@b4>

On Thu, Nov 12, 2026 at 07:49:28PM +0000, Catalin Marinas wrote:
> On Wed, 11 Nov 2026 13:39:26 +0100, Beata Michalska wrote:
> > This short series updates errata for AMU core & const counters.
> > The last patch in the series tries to optimize a bit the paired
> > readings of both counters, so that the workaround checks do not
> > skew the results. It is also intentionally the last one, as it
> > will not apply on older stable kernels.
> > 
> > 
> > [...]
> 
> Applied to arm64 (for-next/fixes), thanks! I left the 3rd patch to Will
> for the upcoming merging window.
> 
> [1/3] arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
>       https://git.kernel.org/arm64/c/139a9b7d5a07
> [2/3] arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
>       https://git.kernel.org/arm64/c/be7771458582

Ignore this one, I applied v2 but b4 still remembered.

-- 
Catalin
