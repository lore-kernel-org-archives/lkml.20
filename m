Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26166339389;
	Tue,  1 Sep 2026 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262084; cv=none; b=SjFWfAHHbHJNTF2zNmyPjXiqqlrxbHWHGMqBj5Sp+7qLjjtKV1Ap/tdUbkGg5ds7nULMJOwxUr6K00vbRgw3d/6cNFjCOC+31aUAYYGNcBOtnqjVvR4yOGGRIGoMmKLcqrSqP2AXGBdYou83kIXssWb+U5XkbAIk+ZLACxMj/ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262084; c=relaxed/simple;
	bh=M0VIYhY4v71qK78dcX2sgWOX03MZcR+ZEXyFCsO8ab0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngTAYp/la7Ucim/TLOGBss6hV92824NOB5qYdFWmaX7GY5/1YKAJaVyA0KTIFQoOma/qFrKVsM3VouALxtX6V+IM51S04G7PL8Fz/Iv6VOmXz13GvYnJB+GlQOjJgbD8C8fQifD9TGcR7rkJ1bubbb7Np/EFdQf8MoH2jbdK4Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yonm8uO/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yonm8uO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788262082; x=1819798082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0VIYhY4v71qK78dcX2sgWOX03MZcR+ZEXyFCsO8ab0=;
  b=Yonm8uO/Q87VFGtHPfdQjtusNRa5fpl1VQTPoNKV4XvM7nBL+V/6bYCz
   8XzdEKWYCrQnY5j6n3Vh3IilRZBkBP+mDeSEKd+0i5jIb2t4WzibXDsSk
   frjYkbPDFZ5mLNhLQMLhdKCe3rqS6splR8J8WOthvoFe8xpb3Xt3j4e9n
   4L2RqM5sj7dvnyfg6cHNfX7XW8S8neKinhjFhKSh75604JdsK368q3/mk
   YHJnfOVu2XuDbzN0shbcCiz2rdvCBSHYeVlAfV2vnj0msWWnFaHkkGqGo
   LYtSo7HOFMJl8B/JTjwe822WJGGvwzAaV8FOSTNy2bYdoyL1BrbbfWADj
   Q==;
X-CSE-ConnectionGUID: EB5r2wWfS5m6TOzmDmLUaA==
X-CSE-MsgGUID: 4BHswR1MT7OQl7ge4ZvHlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92382753"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="92382753"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:28:01 -0700
X-CSE-ConnectionGUID: KrDafq3TT3iSW4ucJaV8ww==
X-CSE-MsgGUID: Grifb/l3Tja+LLwKTRlOtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="265830234"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:27:58 -0700
Date: Tue, 1 Sep 2026 14:27:55 +0300
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
Subject: Re: [PATCH v5 09/16] media: intel: ipu-bridge: allow sensor-specific
 link frequencies
Message-ID: <apa2u8qJm6IZ5N4X@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
 <20260831180101.3109854-10-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831180101.3109854-10-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 08:00:54PM +0200, Maurizio Casciano wrote:
> A bridge-specific firmware parser may have more accurate link-frequency
> information than the generic ACPI hardware-ID table. Let it store link
> frequencies in the per-sensor bridge data and prefer those values when
> constructing the endpoint software node.
> 
> Existing bridges continue to use the hardware-ID table when no
> sensor-specific frequencies are supplied.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
with the same caveat: assuming this approach is confirmed to be the right one.

-- 
With Best Regards,
Andy Shevchenko


