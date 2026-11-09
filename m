Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267853;
	b=Ivkm8k9eZhHmn28V9aH74inF3X8elrHgykBbUn/efmm2vbbqJ2Eb4ZurmrToiykHXqcc
	 A4P+XCy5zTHiYxPOc5Wmax2BAD2rkT55BWVO3WZyO1/yTdsGqw9WL8vZTwNgu11LBsgv2
	 hXYqNlIHQQbkvnw+6Jz2xp12v1j/ZbVDV6mcsqBUFc1fFXsZIWPk/WiPJM3GcbIKQQ/cj
	 Y/rcjZlv6SON4DTLEqfyHdPJW5S1xs0QExJ8ODkY6ibD1CySZOWfwnJN+JyvzSMt2sLgB
	 lV1UK+CoHd7COEBGITyPEGf87OHZOEsfiqG1FTqsNcxF44N9WaFCy3ZDXwlYwKaWSwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267853;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=VTYsujH/2i+pZaUFBaQShsz6g7HDH9a0QHiDGCHGrpk=;
	b=SDjmAOc+Sv6WTh/mp1TVj6V0zscmiVBZG/4UtGFina9s+xA3HHVZSJiw8p0Nb89HYV9s
	 Uj1/XnpFezczVfz5pbuiXE6VIYDvFOgawpJz9y/fcQZD1nzJ8H+1oQIBGEb3xVE5Q1AX4
	 zfFfjeTNulT5op9bsfYAdXSean/1ENF4KX7rMyy5yU0BN5IvgpvphEZTtFJwKvKVoVvch
	 HPg+2xoswy9+14gBWZxiAfrsaoDeyGeTp/4eQueQD6F4yVJSBi+SaGhRac7TR0zu9GEMu
	 l6pd59jOiffdR2Hem2zp79IhMXkfW90oVB2ZBgOnwpox6PiLKGdW70io/vIVqDqYvog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L26DDjVO;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E44606A332;
	Mon,  9 Nov 2026 23:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E44606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L26DDjVO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794267848; x=1825803848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=74IdmHguen7oHs9DAol0kSdVMDVpC/KiYZ9ossuOfXQ=;
  b=L26DDjVOZjHyU9fqKKwjPVljMatlr1wNrWdyaxrYRQmHS5BcxDYpZKs3
   P4FLwq+r5NlWU053/wmzBoGnkrj5lZ5DVOyv6Rq5GV4VXrLC6pyjUKOeT
   eCADk/m3vXQWV2imu/T+rO7PcdO4/H1iW1sX+fpf/nJaZEeB/rm8kNhvy
   wOYdGT+1cU93lo8mDyHxhxWt4oLxe7/q0CZKhKeShXtwDXANQTdztKfY+
   edxxce3MzoGo7/oPMTQt8LCy7sH47WWedVOOOFn+w8RYUtqp7mat70DnB
   sRnbzGd6JjciaL6sF3Yi0pLNjx7BlqFCwDwNmZy67Cd+pgNtSW3ZMECMX
   g==;
X-CSE-ConnectionGUID: IFC9jpU6SgKYzqMRcHxhoQ==
X-CSE-MsgGUID: xx85g/uNSnKbGeQYb9Pdbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3017234"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3017234"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:44:06 -0800
X-CSE-ConnectionGUID: 11Gf6DjgTwOBBqqcFPUK3g==
X-CSE-MsgGUID: 3ezS08zrS8aeUrL5ZSK7LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7866722"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:44:05 -0800
Date: Tue, 10 Nov 2026 01:44:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <avJawTDWSpuZ2j_b@ashevche-desk.local>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avJaVvGszUvANR-5@ashevche-desk.local>
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
In-Reply-To: <avJaVvGszUvANR-5@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 10, 2026 at 01:42:22AM +0200, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
> > Refactoring of driver subsystems or some core driver parts often come
> > with change of the actual drivers.  If that happens within one patch,
> > people giving "Reviewed-by" tag only to piece of the patch, like one
> > driver, and ignoring the rest including the main concept of the patch,
> > are not really reviewing "the patch".
> > 
> > As explained in the Submitting Patches document, the "Reviewer's
> > statement of oversight" is for patch as in "entire patch" meaning:
> > 
> >   (a) I have carried out a technical review of this patch to
> >       evaluate its appropriateness and readiness for inclusion into
> >       the mainline kernel.
> > 
> > The sentence is explicit and complete, meaning it does not allow
> > implicit variations like: "this patch or part of this patch".
> > 
> > Reviewing pieces of the patch while ignoring the main part of it, is
> > much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
> > not be applicable.
> 
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> And yes, I have read the whole email, including comments.

(even with the commit message that I partially disagree with, the documentation
 update at least allows a way out for the cases we are disputing)

-- 
With Best Regards,
Andy Shevchenko


