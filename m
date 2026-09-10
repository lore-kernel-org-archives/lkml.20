Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C781394496;
	Thu, 10 Sep 2026 04:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015991; cv=none; b=rq8JluM29/QEtWiuaDG1319pCIDH7Nl/Z6VrwHgvbq+DglYyjbOljs+D3UTCchSQYKMa438ohChIwQeadsUxo27QOkTZspnpoQWGlkAC6fF8daLkHcE431/iGLi+YevrC4YYaWtM1Djn1IOCw5leMSGcdcJPcfuTICqquyGtgDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015991; c=relaxed/simple;
	bh=USeOFNpDGXQjN6aRmhfuPnevSjX11EyywpmYrkmenIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izhiKk1Vcw7rEL32/JseTZznaGPJH4Fhe3XJWxp2QszUxRzTBqAvaCtMBGzMfL/AK+Vi0sDaZPA1infpBkrxLrX4I4yFIVLZzDidAFafsnXJZ8XXjP60YSW3W2IAkoYCmWaGYQdnYmQxPAQmFqxwumbM6Y2ixN6UzK9AWuX+K8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3U7ng0J; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3U7ng0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789015990; x=1820551990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USeOFNpDGXQjN6aRmhfuPnevSjX11EyywpmYrkmenIc=;
  b=g3U7ng0JQJnPkF3LievEgAGm3NTZ4ooUROjX1aFrZCo3fw+Xu/P1C2OY
   Q7j86hbN9WV08tcnJL5EG1CCP+6xfKKZneF09d3OppRTKXr4NKpFMIFjY
   4cSEwae8oe6iDXdUJ7D1OdT0EK4xO+dsK3cVCXvIo8R/eDT0d4TfTKzVb
   0sRiiJO7lz/BZV2WD395lklnNlmLDtUqHFJPQ0hwXJp/I+YXyIi4Ahui9
   tz7ccIphBF4JDiNebwY7EyOdTes1No9ef6a6fsIGrsdIaVdVqS4q8Hdvh
   vz5bAo7u001HqGEL1dgPHFtG912stBbqmXGLcTRc1QTycDB6nQ/CakzbI
   A==;
X-CSE-ConnectionGUID: oUzHM78PSDy3HcYdYPnmgA==
X-CSE-MsgGUID: qA5UHAl+QGOg08XcyTHZLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88400084"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="88400084"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 21:53:04 -0700
X-CSE-ConnectionGUID: nmriR2Y6SfKCCmZYZngiPw==
X-CSE-MsgGUID: Jq5tGFnjRBePw97xGD45VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="295017967"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 09 Sep 2026 21:53:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4578B99; Thu, 10 Sep 2026 06:52:59 +0200 (CEST)
Date: Thu, 10 Sep 2026 06:52:59 +0200
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
Message-ID: <20260910045259.GO106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
 <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
 <20260909060615.GJ106095@black.igk.intel.com>
 <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>
 <5a8bc263-0263-4ccb-b5dd-f5e899dc25c4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5a8bc263-0263-4ccb-b5dd-f5e899dc25c4@kernel.org>

Hi

On Wed, Sep 09, 2026 at 05:25:32PM +0200, Sven Peter wrote:
> On 09.09.26 17:20, Sven Peter wrote:
> > Hi,
> > 
> > On 09.09.26 08:06, Mika Westerberg wrote:
> > 
> > [...]
> > 
> > > 
> > > If it is possible, I suggest to use the same way we do in ACPI side here:
> > > 
> > > https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-
> > > for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-
> > > through-usb4-to-usb4-host-routers
> > > 
> > > It was specifically designed so that it should support DT as well (that's
> > > why it uses the device properties _DSD).
> > 
> > Oh, nice, I didn't know those existed. Konrad already has a PR open to
> > add these to dt-schema [1] and a PR that already makes use of these for
> > dwc3 [2].
> > I can just write generic code similar to the ACPI one then to add the
> > device links and split it off from this series, though I think that dt-
> > schema PR must be merged before we're allowed to use that
> > representation.
> > I'll adjust the dt-bindings here for v3 to just drop the representation
> > as OF ports/endpoints as well.
> > For the PCIe/DP tunnel notifications I should be able to use the same
> > representation, possibly with an additional usb4-adapter-index property
> > or similar to differentiate between the two DP IN adapters, once I get
> > to that then.
> 
> Though now that I read it again: do you know what PortInstance# in
> 
> Package () { "usb4-port-number", PortInstance#}, // PortInstance# is unused
> and can be 0
>       }
> 
> refers to? Is that meant to e.g. by 0 for the first DP IN adapter and 1 for
> the second? Or is that meant to be used when the NHI handles multiple Type-C
> ports? The description isn't clear to me...
> 

That's the USB4 port through the native PCIe/USB3 Gen X is tunneled through
but like I said in the previous email you don't need this for DP, only for
PCIe and USB3 (Gen X/T).
