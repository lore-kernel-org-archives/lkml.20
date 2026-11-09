Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220244;
	b=fWnviSD3SHBnmAowCvitEbas5K0A8m0xFpJlavKrgKYo5vxKIubSwJB4o8q+5GsbeVhk
	 hjR4cmXSXZa2KgZH/GYjHlv0UAAUEgmV0Sb/ow4vezp+OZPoWAIDNc7kQDkcnyYDiNY2V
	 oDU0CahRMLtugM8JfzGhQF91nZNCuhTJdC2rvKuLR2NnndiDpc6o3lYNO4ll8XhvtxY95
	 46aZYIy3CZLSEuv3KRMQLn5VDLWngSb88jRv/VdA/f/6vBXGMtpWLNlX+aE5xwEjohRAt
	 MoKe1e+CR17rn0KY+NIVkQNl4YZUnvIco551NiTr9no1GQ/MyUU9goKSjfZECqVSPlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220244;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kVP/b/FFJn5Siw/0uyO5I37pGbaxzxd4gPTE5X5rhOk=;
	b=vYrIT4BAK7rDSmBBUx156IkB+z2CKq3In0ag6ecZ5NSsLGpOvuEb7JJXu9INNvWO9lXX
	 prhRWAPIAmE/G+qd3M8OQlMLruDFkO/vZe/K63oPUT3nChbJeFMYcJULXnSN0CLuoyCA1
	 +4rXxssBzuiiw78hVWMEZLug4UH4YewaNCce1milqv6MP3M9QjE2F9Uwuzogp0GAjeUmy
	 CqiW0N8ViKlN823Ij0MMmc8O8raJUw0H0yL20oP3dW1zJ8M6C5A1LvAn/1dih6qBfRDbY
	 Gul0FWJ2YBhu0rXmaVOjemxdASF6vK4RVhcQtyhrjP6GvBtY5DmKe6C0QaUHRQgA3Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OtVX5fZV;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1C2606A330;
	Mon,  9 Nov 2026 10:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1C2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OtVX5fZV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794220244; x=1825756244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kVP/b/FFJn5Siw/0uyO5I37pGbaxzxd4gPTE5X5rhOk=;
  b=OtVX5fZV6XX2dUKZEQC5uCb8OXbPWNbS/D2PY9nRiZ3JKD44soDVOl/7
   Ip/R8vdwe+zJfdV4699/rnqa1wn7QTHnvTFkEFepkIvRRWB5XnpN3SNNE
   +tT/fB9dZie0xb7Ho6sywTxcZ7bhR6n/YucJOiCFYPB9og+j9/mBAsWSJ
   2nzy7E4J6BRNvw/sXCNpm5EA1IoE1WUiKh6uydbC4XufYgOOUMcLTLVl9
   c4MyI0vtCHBSC89BjUhyJvBV3/DRWBYwWsD60MnylUkbZRb5KcWtWe94g
   s+S0wgU8GQ86Bw+QGRCNLkuOr3B3csCbyli8L0mhT/i3wnXHwt0Rc1OTi
   g==;
X-CSE-ConnectionGUID: l50D0z+USGKir3LVH2iodg==
X-CSE-MsgGUID: Uf0OEAqNSTqUYNKyx5B6Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2820574"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2820574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 02:30:43 -0800
X-CSE-ConnectionGUID: uVloG6BFR5iSYRoEUSzD2A==
X-CSE-MsgGUID: CYrWwDKERZ2OEuemrISbCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7883326"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2026 02:30:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C7D9C99; Mon, 09 Nov 2026 11:30:39 +0100 (CET)
Date: Mon, 9 Nov 2026 11:30:39 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Duff OMelia <duff@omelia.org>
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imre.deak@intel.com
Subject: Re: [RFC PATCH] thunderbolt: Tunnel only the first DP OUT of Apple
 Studio Displays
Message-ID: <20261109103039.GK176724@black.igk.intel.com>
References: <20261106154445.517940-1-duff@omelia.org>
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
In-Reply-To: <20261106154445.517940-1-duff@omelia.org>

Hi,

On Fri, Nov 06, 2026 at 10:44:45AM -0500, Duff OMelia wrote:
> An Apple Studio Display presents its 5K panel as a 2x1 tile over two DP
> OUT adapters. The first tile's connector offers the full 5120x2880 mode,
> which the xe driver on my host drives over a single stream. The second
> tile's connector offers only 2560x2880, and nothing uses it there.

Thanks for the report! We have had problems debugging this because we have
had no access to this particular monitor.

I think we should investigate if we can do better here in terms of
graphics.

Can you provide full dmesg with thunderbolt.dyndbg=+p and drm.debug=0x10e
in the kernel command line when you have everything connected and the issue
reproduces?
