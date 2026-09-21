Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69F63C1D64;
	Mon, 21 Sep 2026 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004966; cv=none; b=Wl41vSeFNP2aIA3hQstug/TQdkjqpDxHdL7qjuGt0oms41EqlHyYLByLot6LlA0SiNqlhCfEjpruVFkpyH40wtJEmsN8SdEkF5fNE4RpOZCyoFZuhp8uy+GlvtfFzgbo4C06B3K/M5E0eQZU81s1n1xPwgXih7ZkX/et4JeWMS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004966; c=relaxed/simple;
	bh=quw6HYbf/uMwHat60Q7x0OdUwspNXWirjl3qXlv5Q3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cn7HR8CJbXBI2RriyuRNUI14S1QVFWmIs6sWxhBll4nDbeKJ4sv0pvnzdQU3/5FII7Jjnu5H6wrCJwlL39iT1FVaPSJgYqEVr6uJOgGiU6vfxpDc4crRhBHgan+cnnTI6kVo8kBFhUvWTM2KdxyBAn0DP13SiABc+XNcSlekI3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMnoPuYp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMnoPuYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1AF1F000FF;
	Mon, 21 Sep 2026 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004965;
	bh=pWLwX8DWyk6tmDOQHHgr36r/+cwmqwe2iEQzYwuHPtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EMnoPuYp13fVCB8vNKTXhfp8D8qzmQaNvuw6mSpQJGKfejInySU5UrPMvwcChxX5D
	 hDkL6HZHAByR0MIgSvO5tXeOjEdxedG4qDfIRgR8eM0LXZLmtN00MGMOsJMVHDQ3Os
	 69RHu6JRspxP+9H6uS7/lizG943Q8Y5zUZmTCHV0CYIGPvH7OU5DHDM2A26fil5ZDQ
	 msfYA42yd5QZPiKTsmgiqHF4hlyqHKu+SyIiblciVBf3GSGI2EUo98+7eid5M5E1ht
	 3uQbzgb44afu2cYRW0Q8zju4Fy5swIkqvJ1TsiIDSZ0G4/7D5xHeBbjL0V2IRzbQ0q
	 xDXfD6GPYTN0Q==
Date: Mon, 21 Sep 2026 16:36:00 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/8] firmware: smccc: lfa: Add timeout and trigger
 watchdog
Message-ID: <20260921-elastic-impartial-pig-ea6b58@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141112.2115555-4-andre.przywara@arm.com>

On Fri, Sep 18, 2026 at 04:11:06PM +0200, Andre Przywara wrote:
> From: Vedashree Vidwans <vvidwans@nvidia.com>
> 
> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
> timeout mechanism. This update ensures that any potential hangs are
> detected promptly and that the LFA process is allocated sufficient
> execution time before the watchdog timer expires. These changes improve
> overall system reliability by reducing the risk of undetected process
> stalls and unexpected watchdog resets.
> 

I assume this change is separate from 2/8 for authorship purposes.
Otherwise it should ideally be part of the original driver. It is prone
to firmware bugs without these changes.

-- 
Regards,
Sudeep
