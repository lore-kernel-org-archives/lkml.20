Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703621;
	b=qTAhHyNdgh/504FURMQuq2DS6k5YYi64tB+j4GzKmFrPbnCxZzXxwVUYhOcinheAkOyO
	 Uy86L4fTqjvnUof5tx9hg6+EPj+thl6oheSAAGeyYblD70o7dLHAWh/tWEYbHFWa4Wh/N
	 LR0YIU3T2cKoJMUUdxyyLtHRmiNf74XcBRV6QjVkIiJi7844g0U0/0vPjfZhd3un8fnWE
	 RP1bZW6pxsU5T56ZjooymqpL9CF4cKSWCapwhX510rR6i+NkvMOpF+H+/TBmV5sWMxvDg
	 38B1cNBoFpRsT3sFqP41z27MP2JtXF0UYngO2zDM2oU4pND0y/Gdvbwp4l6eb6UjeiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703621;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2BZzHGBrxrDynjlciM/IOkYpoWMh/eNmCaKGvdvZKlU=;
	b=Mqlwy8sgC2dHRzFvI/buG+tmHu/t8fB+ASXSkH4ZNl0+UYfZiiu7DzMyjH9pJN+E652z
	 Zdng+8o9HYfYGuytmUMjJwRmXpVuRHeQeQTvfAcH5g8UH+yiJ1mPWw/sR7nhz7x+2DRNG
	 G3AceuAK/j2EPY5bErnLqa+6+I4W4w38/kav/5NQGEYFRZ8S7npWt5ctZzAu6XF/Y/dsY
	 CsqX4Mv4EYgetA3WvHY5faa7hmz4gPdWvJ+TW8cm3Y8AI/wxCWNx4A5sRfSu5QEOq4yVp
	 mYJmxseqPatF/z1CdT2aqPCR8SLjoDHHuPED6oWeM7zoXQ5BR9UVx6GTC9a6vfKhQ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ET396gLS;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4CA606B118;
	Tue,  3 Nov 2026 11:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4CA606B118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ET396gLS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793703622; x=1825239622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LBngW06WVi78h0U/JDu5fLgTFSHgLjUZAJXfg2OnldQ=;
  b=ET396gLSD+uDR6z6jQSysacUE0pRmvlipT3npEZQHNz3aFgz9OCD01rr
   kOHRPnBZWSMafk4kEqBM6eW3pIApBRXh4sg4nZHY/yj9A6T2ee6EEL3yg
   ws0QR8BEWzLGqd5PhUQtvN6P4GY7FhdwkbxffQC16UVq8gD3SDa9Mb5G6
   GVH2QRBsvyA68vPXOis7xTni2YcTNh3oFJEqGGOvDXzLWwvfW+JvTeZQP
   rKR65pjVGrKEWR/cB9qlrlSJ4muWf/sTiMfhuf0FuKekfGsc8CSeOcQYn
   eYmPJ8MptWjyUBusv5s0ocKp+DiBwplRNzWlyDGTuz10dHp1QWMzgMeT1
   w==;
X-CSE-ConnectionGUID: 3YxqELFLQ+yNZK/p5XNxpA==
X-CSE-MsgGUID: oE2Pski/QbmLUvEHaAWOtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2301522"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2301522"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:00:20 -0800
X-CSE-ConnectionGUID: E0OVLXAoTmOcIIkmeYVOIg==
X-CSE-MsgGUID: 1yLoundNQbiBptQGYregdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6238771"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.174])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:00:17 -0800
Date: Tue, 3 Nov 2026 12:00:09 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 2/3] media: rockchip: rkcif: add support for GREY and
 Y10 formats
Message-ID: <aum-kOAg9dm9KZdv@mdjait-mobl>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
 <20261102-v4l-y8-y10-csi-vicap-v2-2-0a4149d96dae@cherry.de>
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
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-2-0a4149d96dae@cherry.de>

Hello Quentin,

Thank you for the patch!

On Mon, Nov 02, 2026 at 09:22:43PM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The OV9282 camera sensor driver can output in those two formats, but the
> VICAP didn't advertise support for them yet.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait
