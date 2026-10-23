Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=139.138.61.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792734506;
	b=Xup1k3gQnF3IGP10/vPV0/16VbpBQHjEEP6kRuzsnhVnqwo8d3ijTssg+5/Je1ywl8Xw
	 FuWN8NdpFyJ2wrHCuR+SlWghKn5Ze5O8KZaqNp9N7TpExSmWQzeDYci4w9wuB/sylyeJ3
	 5QnCaHRAKIIYSbBolx9WLh+L7bWwZbsO6ORxzdipmLrzjQhWRr493Dhv03zIDKtZ8zseM
	 pO08u8cqd06H2oZhaLn22prdtA012EyNz5oXrQfowVnSb1GHYUSf8Kx+X+9F0WLN8/Vs+
	 4bk4eZDsGk+kVu/D6othBju47V18LZXSlUL5KeCoHdS/lFQ0l9Xx3VUop6ifaB1iSsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792734506;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wh7D8Tptc3ILYDf3UejxSTTFaEfE2VaROKuAZO+rrJ0=;
	b=32EHVG5sYSglPT7SW+Pqh7c4ItkgIwYPL7eIlclFsy64m/ywASZlNDdBrPqSnOFhWIcx
	 oUpFaU7fDrD8zOkx0/9qiZAFfPrCAdufqr0LtJsQ5Xi4SBoxY/gYaMNh0GtgOvn+cRGIi
	 X+g24t7xRaCy6uiBMG3L8tCcIavqWnCf2ClcorM7p2L1JxSdkMOmCqDPuKdzzIxfW4Qcj
	 NNVsirATjSlcPkFnVHc0posuqAJcW/VZydoM5jwSk3SiK1+w0QKrPNOemNHZV5eRyr5UC
	 IvQFblU5yK3ZvMR/xV5Ws754BbX6yYybQNEhMe5gy7wUeXkwSJKnqCsQRicUxv8r08w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fujitsu.com;
	spf=pass smtp.mailfrom=fujitsu.com;
	dkim=pass header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b="BoqclbJ/";
	arc=none smtp.remote-ip=139.138.61.252
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA09606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA09606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=BoqclbJ/
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792734505; x=1824270505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jvaFqs1c0Q8y7cq4icfLd9Exgzwezb7YSxz6AKTovJw=;
  b=BoqclbJ/xfvcZ1aJkLopCwxAtWb/zN5FrKJXgmgGK6dmZQWgF6o0GeQ7
   W6uNIB4cTPtY1XMuydQyhhWwaFx1b7d8/UsbcaG0TRuBvF0U99QX4iRXD
   0vzNO1KmnlrTTT/oV4YiLEPkI8HtZbDOSJc/Z0y2xl6/s+6e+gugEyGEY
   rLyjojkHhHfcNYuTaXDxz/pgpDGeTBha2+0OQ0KpU4eo6f98nQztHOdYd
   jcPWqFoPR3dRRlUK/uHga4MbmhwPHBZb3Fw6mYveb91lNzJm5qL52aGr+
   97uxSXUOlvsJpbGxk7c8RCv2dUsnx4I15z1S3/jJInm8KEm8kUtoy2DWn
   Q==;
X-CSE-ConnectionGUID: eb0jNvBiRlqiLnL/OurrAg==
X-CSE-MsgGUID: mmawl15+QNGgvCDG1gnDIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="238087237"
X-IronPort-AV: E=Sophos;i="6.27,173,1786978800"; 
   d="scan'208";a="238087237"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 14:48:18 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 62DEEC01821
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:48:18 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 13AE0180025A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:48:18 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.51.144])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id B947B1800109;
	Fri, 23 Oct 2026 05:48:13 +0000 (UTC)
Date: Fri, 23 Oct 2026 14:48:12 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Suzuki Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Sami Mujawar <sami.mujawar@arm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH RFC 1/3] firmware: arm_firme: introduce arm_firme driver
Message-ID: <atr0fvi-FP7VCwki@FCCLS0092175.localdomain>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019-firme_interface-v1-1-27895c9cebaa@arm.com>
 <atnVCFWZLKR8GthP@FCCLS0092175.localdomain>
 <atoM447tWm2EsoSP@e129823.arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atoM447tWm2EsoSP@e129823.arm.com>

On 10/22 14:17, Yeoreum Yun wrote:
> On Thu, Oct 22, 2026 at 06:48:49PM +0900, Kohei Enju wrote:
> > On 10/19 15:14, Yeoreum Yun wrote:
> > > The Realm Management Extension (FEAT_RME) is part of Arm Confidential
> > > Compute Architecture (CCA) and enables support for dynamic, attestable
> > > trusted execution environments ("Realms") on Arm systems.
> > > 
> > > Realm management flows depend on EL3 firmware for operations such as
> > > Realm construction, resource allocation and isolation, and attestation
> > > of initial Realm state.
> > > 
> > > The FIRME defines standard interfaces provided by EL3 firmware to
> > > satisfy these dependencies. These interfaces include:
> > > 
> > >   - Granule Protection Table management
> > >   - IDE key management for PCIe and CXL Root Ports
> > >   - Memory Encryption Context management
> > >   - Attestation token management
> > >   - Integrated device management
> > > 
> > > Each group of interfaces forms a FIRME service. A base FIRME service
> > > is also defined to provide common concepts, service discovery, and
> > > feature discovery across services.
> > > 
> > > FIRME interfaces are implemented at the EL3 boundary between the
> > > Non-secure, Realm, and Secure states. They may also be used on systems
> > > without FEAT_RME, for example to provide firmware-based attestation or
> > > security services.
> > > 
> > > arm_firme driver provides the common FIRME framework and service discovery
> > > support for client drivers using below FIRME services:
> > > 
> > >   - Base service.
> > >   - Attestation token management.
> > > 
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > 
> > Does this series assume that the kernel is running in EL2 implicitly?
> > 
> > The FIRME spec says:
> >   An implementation of one or more FIRME services at a valid Exception level boundary between EL3 and the
> >   highest Exception level in a different Security state is called a FIRME instance.
> > 
> > and I think only NS-EL2 can call FIRME interfaces as a NS FIRME
> > instance, right?
> 
> Yeap. but it doens't forbid calling the FIRME from EL1 too.

I see. Then it's okay.

> As a just example, when the host running with pkvm, it could use
> where kernel running as EL1.

Thanks for the clarification, Yeoreum.

Thanks,
Kohei

> 
> [...]
> 
> -- 
> Sincerely,
> Yeoreum Yun
