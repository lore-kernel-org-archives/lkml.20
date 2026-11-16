Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837309;
	b=N5g/69DmmkdkipEwnsMPIK8DiFXe0JO9oc96N625OrJaZvcmlhoS/QIMUvDDBacOmOf0
	 idf9SHSMDD8m8zR/0qCDlcgQ9p15r0KZQ6lqULzEDfRnMzNzYPRfv/kaS3KaO91MGUt11
	 y02S6HAAEzLPPQ42YTOS/EABkjcfab808e9ndS22xcrSre9b0+DUKYo1WKJXbMaqojKhg
	 lHj/69F2IsTSSIGsvPPraviSWBoXAm8Sgw5jnBYo1X49MIDDUFI2Dfh/l/YExOGhEzoAz
	 kB5tf/KA8f6+k7r4b0w7jU76fMwPI6UA/E1q/MnpIlAYmz0Uqzr2jIXFqkXRbbqsbtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837309;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=xusZJJAccTZMn4envUnC0WIcp2gJW9RP/2imxafpNPc=;
	b=qsyq4SCADKGIYNri593VG6KwbI4wRFRDD+808XD0nyVOQDdFj2TmqI2e+u6Tm+VY5XPv
	 CXSrJkKZbR6R1GmZKTXecWf4Ll0Ktua2jZ1Kc9UJC3D0cAi0n6rnbAMBjAqVN1ahtcpQ5
	 +rWYuG/Mu5wc2sFuJZxV+ar8z4T6Q8cSllqV8pwceBQ7tCUHWweWxmRBD+61WXHhfhLbH
	 OR4bA7eovz7BnlAgHrG+N2j+PbvDdyOnLeF0LhpycNMeexFCJxoihfstAZ6MAEO7SWz+4
	 wym4x84zv0AZdQDSgZOXrfhYH8XT6W+KTJFKn+Qj/BxglZeB8sEeTS6g8WFbS6pIx8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fbgj8mpf;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430BF606D56E;
	Mon, 16 Nov 2026 13:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 430BF606D56E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fbgj8mpf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794837309; x=1826373309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8G8wuXRsTKztClrWMHSQAnKDH7KLnfmMYirjEAcDDDI=;
  b=fbgj8mpf9sfLGX9K+g1TFQESqvOWE9EA4bKYBND/r3vP9zg7X/IJRAeV
   gJ0dxCvoy8y1bvQT2SllYowvS2ZUDif2fbyNpBsMyteoekts41TxVg9BI
   dcfGwuN8NMX2q1kLEYku0a0BsBoI3AVa/yguktQCKujIixejQf+rhWtCN
   8G93f4UfxI/z33ONlnwtaulvsbAHBIyGiocsLs3gRtd+cEuhCpovu5ATy
   yrlVMAGxcL68YAvLiOO2r0/tSTMgU/Qe/qZFWh7AlZ+mxCRhWTxzPy+JW
   faBCTsbwsyPeFsOfigElECLFdveeqN1Q1SPixwnGsOFJ0Cu6mmP+DwZgj
   A==;
X-CSE-ConnectionGUID: xXzmQq8kQoWrNZ2rOW47Cg==
X-CSE-MsgGUID: KXj9eee4QTi8Bb2KR9yy1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3463216"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3463216"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 05:55:09 -0800
X-CSE-ConnectionGUID: XX1uFffSTMmJ1kNNIyUdIg==
X-CSE-MsgGUID: QBFE9p7FTc2vZLfIcFCCLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9479396"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 16 Nov 2026 05:55:07 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2EAC199; Mon, 16 Nov 2026 14:55:06 +0100 (CET)
Date: Mon, 16 Nov 2026 14:55:06 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: =?utf-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Enable runtime PM for the Ice Lake router
 with the software CM
Message-ID: <20261116135506.GX259790@black.igk.intel.com>
References: <20261111130851.62101-1-dev@deq.rocks>
 <20261111132112.GI259790@black.igk.intel.com>
 <20261111142845.25b6ac67@kait2en-mbp15-1>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111142845.25b6ac67@kait2en-mbp15-1>

Hi,

On Wed, Nov 11, 2026 at 02:28:45PM +0100, André Eikmeyer wrote:
> On Wed, 11 Nov 2026 14:21:12 +0100
> Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> 
> > Cool, does it also wake up if you plug something to the TB ports?
> 
> Hi Mika,
> 
> yup. working perfectly here. There is also a bunch of other patches
> for hotplug and such. I even get pkg-c10 on all T2 macbooks.
> But that is for another day.

I was about to apply this but noticed the Sashiko report. Only thing that
matters there is the device links thing, so that we don't go to runtime
suspend with PCIe tunneled. I wonder if you can check that and possibly
update it to use the DL_FLAG_RPM_ACTIVE and pm_runtime_get() to make sure
they are in sync?
