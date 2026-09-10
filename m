Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA922D7DE9;
	Thu, 10 Sep 2026 04:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015840; cv=none; b=Jyc8doRRc4U6N4+2poJoNLCOOUME3z/Wp6RJ/taIIXjMpVinhGLGDnCzj00TDRnaSJYpT7sM6qPAOqbQlpOp/jyoW3jtOKwms45FGVMvkY0R9oQgFeNqQI2QlNTix+6RdhavYOulpidr7hNMD2638sR0VtmUHTG2nemZM5jGzTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015840; c=relaxed/simple;
	bh=27sjqAX3mzIarYqMVpWaoeAe05sB9malX0xlN8XrmvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLEyusByUf8q7sqtlOf+SLpuiN8wUfn3yvSzBMnOSIKocc7xUC0DqihYtfde3jvrnNUf1gkxz5zvB+GrxYqAa53lyjz1igXaDRz+3CKM8HE+vnJrea2X2MxRIy5OtzX8z36IOg9ScB4VQert7Z3m+B1GQGdke64rhYW00kDameE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJx4LAk+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJx4LAk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789015839; x=1820551839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=27sjqAX3mzIarYqMVpWaoeAe05sB9malX0xlN8XrmvM=;
  b=mJx4LAk+y+YN+2aSbVTt37cXNVg7ZMnIS3I+KPJOf3T9R2wOJya41L0R
   I7LlxEZfC6jaYQ7IRQvzScnKAyX4vHZAgmVFc2Da6jF1Ijoz1gYfxiPVT
   l1p1Pyg0iQ3BsvkeA/Ebtmw70gwlEVcKdnbiMQO0xAv/cjVjFzJ1AFDxX
   JmjL5uzctE85PRka5OWMInJ355OGshTZnbb9YtUjq3NJYz9YslFHZNGfp
   jCXp3gf1wTmjxLTEm6HHfu6hXGID1a05k2HMq7HYeJWU7vPFcLHW8DO+G
   hUQKVBtmcrAdk+BJv8SSAxXplSA6rHwPSI3jo+AIIxOoprZ9tPCtn8YiY
   A==;
X-CSE-ConnectionGUID: Hq1ATJH7RHWsDNFXmc5/0w==
X-CSE-MsgGUID: PHRRL8YOSbiY5nHwPEsKAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100621089"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="100621089"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 21:50:39 -0700
X-CSE-ConnectionGUID: t3yLjyHCRoasgCwgzmWvog==
X-CSE-MsgGUID: u1n+qZFcRfqsUdFaiUs8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="268257232"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2026 21:50:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 999D699; Thu, 10 Sep 2026 06:50:33 +0200 (CEST)
Date: Thu, 10 Sep 2026 06:50:33 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
Message-ID: <20260910045033.GN106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
 <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
 <20260909060615.GJ106095@black.igk.intel.com>
 <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>

Hi,

On Wed, Sep 09, 2026 at 05:20:35PM +0200, Sven Peter wrote:
> Hi,
> 
> On 09.09.26 08:06, Mika Westerberg wrote:
> 
> [...]
> 
> > 
> > If it is possible, I suggest to use the same way we do in ACPI side here:
> > 
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
> > 
> > It was specifically designed so that it should support DT as well (that's
> > why it uses the device properties _DSD).
> 
> Oh, nice, I didn't know those existed. Konrad already has a PR open to add
> these to dt-schema [1] and a PR that already makes use of these for dwc3
> [2].

Great.

> I can just write generic code similar to the ACPI one then to add the device
> links and split it off from this series, though I think that dt-schema PR
> must be merged before we're allowed to use that representation.
> I'll adjust the dt-bindings here for v3 to just drop the representation as
> OF ports/endpoints as well.
> For the PCIe/DP tunnel notifications I should be able to use the same
> representation, possibly with an additional usb4-adapter-index property or
> similar to differentiate between the two DP IN adapters, once I get to that
> then.

For PCIe yes, for DP you should not need those at all.
