Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D20937F337;
	Fri, 16 Oct 2026 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142869; cv=none; b=B5UFH2cg3gpxjFTAQYZ7sV0vtRFiS5uKJ6yVhmKEL1pK8mJ6XqRTWT8Sbwky9qKSmkOl5K5bLnn+X8dh6OcOWF5y+/pBwrwa87NGeZVs6RGVXow23Q9Rkygag5JC9ddN2lVx0M42N6kUiZELQEASHJTKrr0SpSc1caQEDoX8e5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142869; c=relaxed/simple;
	bh=rz69uRgiNAeoZ5OdOTX4VEkIT4UqBR0eCnCPDwkcXa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN3WEb112cmFDPJQMPbehI2loUn2EU/rWK/1gTRO6j6R0X5epMgdoCaA2frV45jhGDEc68E+b7/4zDL15i6nobC+YTCiAyxEzrPqxA8QUPXOILrRZCBbCJZAbN7xFdJvnZX0j8FMYU52EbOYjdCh6Pz2KGflQub0Bl1CDcM3KRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JhDRptFs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JhDRptFs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D27914BF;
	Fri, 16 Oct 2026 02:27:42 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3A353F673;
	Fri, 16 Oct 2026 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792142865; bh=rz69uRgiNAeoZ5OdOTX4VEkIT4UqBR0eCnCPDwkcXa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhDRptFsJgCt0n0l/pYLbpT/xgXvLsk1RooJ/SVvS+JIOCwsWdYo7yISXq8iaU4KV
	 Q4kwO8MCm1w2Cl8vor8+UEEKKW5BY6SULxguqF5IOeMj+t8GpiXVOQZsfHnsBTWwvQ
	 RLM/jvCbGe3N5MBxzniwuyou/TkJChJEFSRZ+Klo=
Date: Fri, 16 Oct 2026 10:27:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: coresight: Limit static replicator
 to atclk
Message-ID: <20261016092742.GD26205@e132581.arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
 <1128f456-ed6e-47ee-8dda-157af99cc404@amd.com>
 <20261012162851.GB26205@e132581.arm.com>
 <e64a1339-f66b-4f29-b95f-01578223f1a4@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e64a1339-f66b-4f29-b95f-01578223f1a4@amd.com>

On Tue, Oct 13, 2026 at 07:53:20AM +0200, Michal Simek wrote:
> 
> 
> On 10/12/26 18:28, Leo Yan wrote:
> > On Mon, Oct 12, 2026 at 02:35:37PM +0200, Michal Simek wrote:
> > > 
> > > 
> > > On 10/2/26 17:07, Leo Yan wrote:
> > > > Static replicators have no programmable registers and need no APB
> > > > programming clock.
> > > > 
> > > > The Zynq clock controller registers dbg_trc and dbg_apb and calls
> > > > clk_prepare_enable() for each gate the bootloader left on.
> > > 
> > > That's one bootloader behavior. If there is another bootloader that clocks
> > > can be simply disabled. I don't think there is any reason to depends on
> > > bootloader behavior. If there are clocks which has to be ON I can't see any
> > > reason not to drive them.
> > 
> > My reference to zynq_clk_setup() was to explain that this patch leaves
> > the existing management of dbg_trc and dbg_apb unchanged.
> > 
> > The CoreSight drivers do not request clocks named "dbg_trc" or "dbg_apb".
> 
> And this is the point. DT binding is not describing what Linux driver handles.
> Binding describes HW itself.

I agreed that "Binding describes HW itself".

The question is which hardware clock connections the DT properties
describe. Arm DDI 0314H, Table B-1 [1], lists ATCLK for the replicator,
and ATCLK and PCLKDBG for the trace funnel. The static modules have no
APB programming interface.

> And for proper functionality these 2 clocks need to be handled.

Please point to the Zynq TRM section or clock diagram showing how
dbg_trc and dbg_apb supply the replicator and funnel.

> That Linux driver is not doing it that's different issue.

My understanding is the CoreSight drivers have already followed spec to
support clocks.

[1] https://support.arm.com/documentation/ddi0314/h/CoreSight-Components-and-Clock-Domains/CoreSight-components-and-clock-domains
