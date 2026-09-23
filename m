Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB24F3931;
	Wed, 23 Sep 2026 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164731; cv=none; b=UVXIVu/PVvwHejLd6PXI6Mj3UMOp4ICybAStu85CWXXqD5A38oOkWljlHLRzksB4HGw0/wckQTUypxYaAU2t/RPtZAHAroHhPylhpzpGdqURJFHE/API3d0drpX8lfLR2rIDpzBTOf0RSOY+N7W/sw/OVesmyYQG5HhGealoX/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164731; c=relaxed/simple;
	bh=mpSCfBw2MyUXF4x4y6PrLZs/lCKK4Z/hnDGYQZ2I+s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe9Nv8WC2vgidgyW4GPTyA3C9Kvf3/6SfDo5p22+/j9LKcHDbPv1Lz5szjgk4tyS8Z5QFTXYxitgt7mFvH7jqFFKhNo0cNA6ErCRs6+Um5Fa5ho/wYhV4jSP4Wugu2AtFVpkE2/5D9AACE10uwTuxl/08ylYWaHvj2s69FugjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1V/kd7Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1V/kd7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29A91F000FF;
	Wed, 23 Sep 2026 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164726;
	bh=XPbwVw8AvPrMTUbDpUqknizZ4TkUS7ak1cVmIlROZSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J1V/kd7ZmWBsLX+HguWLeI0boJ+DPXn0S7zM3k8CbyLNfRWmgP8BvhhMdH41+WOE+
	 /p1bk1Afzo6V/gpThb3oHZ8NfGNxO/XFblCIz35VyUgQlCoSKPKl9n11stlO0jJw0W
	 83N3/dMNE/PzVc6guTzeztATChzI4ETsgn27m2rQfCzEiYuzcSLNxlcOzFsbKK6HLE
	 jYYCKWbYanC9EgYDqZmLucIXr5rCQ8I4VcnAWkJ/3+gnueE63zR49JDEzsTR3EaA2Q
	 xymQIk/py5T8SQ7ewzX0Pc+3f3WnRnIcBvV/tvBoi05cZiZbwCepUGHnlVmMh46zAK
	 4s+FzuoHfUxTQ==
Date: Wed, 23 Sep 2026 12:58:41 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
Message-ID: <20260923-resilient-speedy-malamute-01c800@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-3-andre.przywara@arm.com>
 <20260921-ubiquitous-brawny-hyena-ff6ee9@sudeepholla>
 <1b87219a-dd52-4270-9127-ec68333ab814@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b87219a-dd52-4270-9127-ec68333ab814@arm.com>

On Wed, Sep 23, 2026 at 01:46:56PM +0200, Andre Przywara wrote:
> On 9/21/26 17:32, Sudeep Holla wrote:
> > 
> > DEN0147, Section 2.1.2, says that the caller must determine that
> > the SMCCC version is at least 1.2 before calling LFA_VERSION.  The generic
> > SMCCC probing path only checks that a conduit exists before invoking this
> > function ID. That could break our SMCCC bus logic. Assuming the firmware
> > can cope up, it is always good to check the SMCCC version >=v1.2 in the
> > probe which is not done currently.
> 
> So as said above, I am checking this in lfa_smccc_probe() now. If I get you
> right, then that's the right place to do? Or are you suggesting we should
> move that check into the SMCCC bus code? I think the version call is
> compliant with the SMCCC v1.0 calling convention, so should be safe to call
> in any case?
> 

I hope so. I was just thinking out loud here. My earlier comment to check
for SMCCC v1.2 before using LFA_VERSION conflicts with what SMCCC logic
as is. But yes it should be compliant, I was just thinking how one statement
from the spec I used to request you to add a check in probe conflict here.

Worst case we can add version based addition in that SMCCC device addition
if required in the future, shouldn't be a big deal.

-- 
Regards,
Sudeep
