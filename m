Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26A2F7EE9;
	Tue,  1 Sep 2026 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261495; cv=none; b=lTQYqg8+PW1HjloQNkEi291dfp0JoL42oTFvXaGQnPte3piGeqjGieuN2xcqB7DtiNY7tMb0a4Ke+qbjYQ5I/jf1RaBH0V9qZsgpNm0QpixcWnWjulo0FiYD04bBQtn/ZdKVlSZO8f2F3zlo9P/SbfQ87EIpSDQOHGWlFYZ0gsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261495; c=relaxed/simple;
	bh=kQ+S3q2y0rv8vcmXL0LskoRomSkOgwgAk7CHeriXyzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLEwyxstTbTXz5mLtWE5smnjqRqg61L+AFTbozyRo/E2DK8PHGcBW/Isi88NKs6U+56EbKOt/k6IQmTAMQ3jZ4oDNFEtdFDXEbnPzKw59q/ZyIHqnXZAVuX1o8TNQgu5Ge6RBMt0rAC0g95Of5CNg4gAEI+W3fOPnvUYbknRsVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nbqju341; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nbqju341"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788261494; x=1819797494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kQ+S3q2y0rv8vcmXL0LskoRomSkOgwgAk7CHeriXyzo=;
  b=Nbqju341s+M+OWbfzp43PGXYrdm/uhmNBWhso+OmdBbqKggs3n4fqzQh
   laI/AecFbJLGbXRrhLF/aW2Qmw3QnGSJE6tceu7Ujl6qOdIzwSM303O/+
   VDPmu+H8QD9+ora34doEHLmAckRi33Mga7/AmSFsjQWBgPxxUOIhUIap8
   qskE4QyUTvLtfQjtwd6as15rLW1LTVHnz09T2mzif4olTh92/0cUzndRj
   4v1tITE1o8GDj/GWKBLJ31X7iCNGfz/rXjAQ1EUq/NHDymisb1kA8FH7q
   /u6d0v2+cyLkq9cjKWxirR2Zax8bz29a7+pkZ7QAVFaAaGn7zN55e6qc4
   Q==;
X-CSE-ConnectionGUID: rXJx27oGS6GtWRKJb+uzMw==
X-CSE-MsgGUID: SJ++mFSGQm2OBoifqpuZzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99021055"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="99021055"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:18:14 -0700
X-CSE-ConnectionGUID: 0/n7FbEISBuuNm1yBKrKNg==
X-CSE-MsgGUID: Rngtgn/+S0aIRHXFVTQR+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="273248626"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:18:10 -0700
Date: Tue, 1 Sep 2026 14:18:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/16] media: ov2740: Add OVTI2740 ACPI ID
Message-ID: <apa0cOz4aXZrtHmC@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
 <20260831180101.3109854-5-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831180101.3109854-5-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 08:00:49PM +0200, Maurizio Casciano wrote:
> Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
> Add it to the existing ACPI match table.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


