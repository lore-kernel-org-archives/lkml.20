Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E7D2BE034;
	Tue,  6 Oct 2026 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276661; cv=none; b=Nt9Q/7V17g4mM3+UOB3SYXqGhO24yVOR4NDeTc2OoMfbgq+e3QrlNX/NH0McXvQhQlhJ5e0OP/uBUbEaJTdSvbKKgJuvHJBS1Lzb5/2fn5Efpy4sQd2RJjHJ0xY4r4/3hu6xNiI4lQiK/lCsxhENL07dHqAcPRSrhSFZzIghlis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276661; c=relaxed/simple;
	bh=VscwG1f5K2jduvr077VdL+KOqfPHDzEsfmEOibu0sLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjIAccopeeZMqUiUqg/2LnvkGrqrQIQlhYH/QhlIN/8QxuRZgEO9M2oQ/2io+FwC9UksZ9TX1CceHoT/510MW61Ad998r/wiYhCZH7kcRla7rSBb2W+pAL1KyrUY3rdFabhSlw3e9vkjTt7CIS+fXhQoOYUkx22W5a5gl1OVEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8LU7oYu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8LU7oYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7421F00893;
	Tue,  6 Oct 2026 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791276660;
	bh=XAm9KYDGmoWGIoypJdL3/5p96DaHo0z/EOUgYKjNC0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E8LU7oYuUo4ErsWhLhHh0iFCumgQrpLE/7pAc/t2GknntDjMH5a8FgvB0uHfb22zk
	 HsH/Dd4FE3lnpNnKPSSrgSoLULyy3eM+2MwMLD5vS71cEFa64jmFQFtlAy5Usmh1aV
	 TBSWUdjzLVC0tTptszn2DYfpCLsUmA8EyRAzwjvjoHI7+5EuFsd5s420VMNvNUlBjV
	 jEMCJCX8rqaIB7N92oMi6cMbuUbtm/0u5SjZ8nP0v6Ex2R93nCUYgORCdoXymp2ME/
	 RuuYV4JWc0SYxt2Vk8BxWESnSpBSNnoYokarkGDMjVVjmQ9kJ+uCPuFHE1+Wk6MBdU
	 BR9DRdk37d1kQ==
Date: Tue, 6 Oct 2026 09:50:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: arm: corstone1000-a320: Fix GIC
 redistributor region size
Message-ID: <20261006-important-malkoha-of-faith-073aa8@sudeepholla>
References: <20261005210506.2118052-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005210506.2118052-2-robh@kernel.org>

On Mon, Oct 05, 2026 at 04:05:06PM -0500, Rob Herring (Arm) wrote:
> The Arm Corstone1000-A320 has a GICv4 which means the redistributor
> region should be 4x256KB rather than 512KB. This issue didn't become
> apparent as SMP was disabled as a work-around in early versions of the
> FVP.
> 
> Fixes: 87599f1843d3 ("arm64: dts: arm/corstone1000: Add corstone-1000-a320")
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Hi, this still hasn't been applied.
> 

Sorry for the delay, I missed v1 when I was away. I have sent PR for v7.4
already, will send this as fix at -rc1.

-- 
Regards,
Sudeep
