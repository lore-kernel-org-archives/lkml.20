Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763739;
	b=e0kokMQVEWRCG1N2gSbjpHKx++N+HbwXt5SxghYdDRiV8mh2X5egbQdUn5EqAiRSatgJ
	 k5XsGBShHVFvA52ezvPSEAMpL+cfgf4zQkh3QF7ZwSR1e+el8jyJ2YxF9rl3SvVKBR49H
	 VJrVsrk6pJZHm5Fe8BRNcDYGEoyiU6c/vj008VBO1Zv7v2/PodHQdFxpaaNps6HH/mypF
	 8n0OcreuX8pSuvJkWSM9bXpd2YWR8Sdpg5jnwb/nhZkm0PIRvPZBSTP6b+2Q2ROesDLhn
	 eZVkeZXweAqO3JkV0FGu3btepGkA7OXClZnnWAJsXycPT67cvROVMcKUoY/njbpYN2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763739;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Ufbwdy3tcu5w/NiYngE4mrieI3bOTwOle0zORVQS+fA=;
	b=qvTU8hgz6336n4MDCzYXQNB/sXwfmzYgM5YjVNDgcPYB0xv4aEBdKrP6YzQGze5qwT8y
	 xDGDmvwcrF0nwvvCDMtQjCFunfGSe3Ng+xo88vOsky3tqft9LpMJiBllHWChkpmfheCbo
	 iw9660rI7vedsDuD13qkOqJMxy7CtpCjVdO62s9cpqtCvFNShm6hRoa8jQdPJLPKdVadh
	 K+NgjPsOeRdTMflp19uoC+EhtocOOHL+yJ8GwjNX8Xok7VmvVvADisoOhaplb0Mjnui/h
	 ci+mOsrX0XIKjtk+pPu3Ixn3OP1EWIU6vLbUALUZKM/tzlShZBpsov1Sb2MQmMyRrUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrx7+HVz;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF6E606A31D;
	Fri, 23 Oct 2026 13:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF6E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrx7+HVz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792763739; x=1824299739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qv8AF4lwgT1ErZ8+l3VO25ckzipNEu6QDynTlTcjddQ=;
  b=nrx7+HVzg0TML5zp3PZady78EXR0bcRhNTEpGl9Cymnw6NkvcQtk8Uzu
   9sjc2U5gEJVN96KtfTTkKvel8SgZMJy6Tlo7NpgqgP3ojzMMuYCpt9ytT
   I3+mbVB+0UvI6g+mzgLBAvTUZXIPQgFNiXa4ydF9LVPuaXBlRdPzO1cOb
   NFkEMJ49hAXgTjsC7PhHaGjUfZrHE6h6SsFKybDN82B1w2jCMBSu776jb
   jUbJwhfX6xpUapG6Eh0bvX/9XCA2+dJrMCvXjnIDcvlvNOx9xFXocqfX5
   Y7qeTSR7tgpwek3eumqvLuS4SRVLUirTLYr5j4JN3BtZxL7x1pMYKAFEF
   A==;
X-CSE-ConnectionGUID: LhLHBhGVRxSlhs0lHK8mCw==
X-CSE-MsgGUID: UUOKgcw5SaGeLSPjaXuCaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1629515"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1629515"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 06:55:38 -0700
X-CSE-ConnectionGUID: J4hxzMhLTFqhafqYiP/9EA==
X-CSE-MsgGUID: Jyv2X9VUTCq27V97pDfkvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3594844"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 06:55:36 -0700
Date: Fri, 23 Oct 2026 16:55:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lorena Tanase <tanaselorena3@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix double blank line
Message-ID: <attnVU9A2GvgYuy9@ashevche-desk.local>
References: <20261023123158.6176-1-tanaselorena3@gmail.com>
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
In-Reply-To: <20261023123158.6176-1-tanaselorena3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 23, 2026 at 03:31:58PM +0300, Lorena Tanase wrote:
> Removed blank line to ensure linux kernel coding style. Found using
> checkpatch.pl script.

Cool, but is this the only problem in the driver?

> Cc: Daniel Baluta <daniel.baluta@nxp.com>

Please, put the Cc list after the '---' line, so it won't pollute commit
message.

> Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
> ---

-- 
With Best Regards,
Andy Shevchenko


