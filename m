Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C73242D9;
	Fri, 28 Aug 2026 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923923; cv=none; b=sh5VgQWRi6TYEn0TQYFDk0WdHBSBRuC/17ZlKqe5dtOImxqutSpiCJo9NiODwrO1Tg2f7Fb2SqkSDj3x2ysMqOS7dIIhw0bqIMctFqN0gz5Ya8yjOA/KHD9t91uEMWQePArbL0xedciojxQNBsiAxt9Ly44rNN35E9+N38gYZQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923923; c=relaxed/simple;
	bh=vP5V+pCuyFgveglxjmlFRA86XFPdwRTLBpPd1GdcEhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVVYk/z1fcp12aw2n53Muf/8uuA4kELGUauAHaN6jkr0SyLEu2uePkHNkpFk8Cpu01vAXoZ4YzTg+TQo5b1pPUMKNuJwJqsIbzZ8tKa7nQcgiKp/YhCRZT4Wdcn0zekLTIlwmuct/1PHAytEBmbQl9hY1TepDnYXH78Z42SnFNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZrdan3r; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZrdan3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787923920; x=1819459920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vP5V+pCuyFgveglxjmlFRA86XFPdwRTLBpPd1GdcEhQ=;
  b=mZrdan3rYIMqbUJF6eeaQ5MLinOsmna8/+nvKuL3JU8y2YZRddfFKV3t
   BMuvkm0kn0iV6tJEulUGI15aArkf+InyZ+eqr/TCfrWTKsC7TeUZhaDs6
   QfCVhbIzsFLyIbyCa8u+GTMmvEzZ2l6bzp0NLsWWqv+V+4q0cCe7QN7l8
   TQm//TWOG8E73Ub6NGEoZqNsR4y0CEiAKg7fGJZXHH4zHg5Rz0ElTbSYA
   KIXpSIJmH6m+XKpKN6GfiL5zGlX0lVWt/xOS3QEcL5jMfubFfJn/w+fBb
   wjjW7Ag+gXPLL83rDOz683o2HKprgMRWmg16m7rNk1E07dapD93bGe5YD
   g==;
X-CSE-ConnectionGUID: LYqAakGSQeGhdLGBUI9r3g==
X-CSE-MsgGUID: jfTOgEbuSG2s38Dmbc0Taw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="75976717"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="75976717"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 06:31:58 -0700
X-CSE-ConnectionGUID: SxQnCkggQ8G+eE8124Y2RA==
X-CSE-MsgGUID: +1ynk+76QHi0F6gE7/DNoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="272382258"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.167])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 06:31:55 -0700
Date: Fri, 28 Aug 2026 16:31:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] media: ov8858: Add INT3477 ACPI ID
Message-ID: <apGNyISEGM3vx3d2@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-6-mauriziocasciano7@gmail.com>
 <apFvSlkU9V1f1mrZ@kekkonen.localdomain>
 <CAHp75VfOba8pSw-4NhTOyzJxjEB97qfE+w+RjXEtdMrNEZMOOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfOba8pSw-4NhTOyzJxjEB97qfE+w+RjXEtdMrNEZMOOw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 04:24:38PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 28, 2026 at 2:21 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Thu, Aug 27, 2026 at 08:17:50PM +0200, Maurizio Casciano wrote:

...

> > > +             .acpi_match_table = ov8858_acpi_match,
> >
> > Please use ACPI_PTR() for this one. (Also see
> > <URL:https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.ailus@linux.intel.com/T/#t>;
> > this won't produce a compiler warning then.)
> 
> Why?! What's the point in having this?

For the record, while the first patches are okay there, I definitely NAKed
the last one. It's quite controversial.

-- 
With Best Regards,
Andy Shevchenko


