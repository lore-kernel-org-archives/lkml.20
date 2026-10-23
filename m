Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763845;
	b=mKzDdRiXq/c8uXv33T19dorLMW6QWFIXbvhhuK2cElalB0I6WtkyWHq0wL1xZgDoblKk
	 OIhR0AZmGd+8H7hHq1/LYFuC5rB01fkzJdUaDS3YfYJ+h4EyJSuhf3f5gknyDSILhXOkL
	 4onys8UleLJStWlySF7ahb2ZZimyHuO0e5IXLF7FWvxqcZwg0dKOcpBmmVfb41fL9kSZc
	 WPdZkBhSDDcjy1tInOvfyaz+hglaqhYoMALoFPfY8wasDt8d68xb6EdHqyTNahpF59Psn
	 J8DjHgmI6RMoU6DfVaLYaZtMIOnmEKRYd7WDd/BM7mjX9965H87rmVNeyQg45j//yaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763845;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=RgeaRejPzcus2J0aVKvDf8ygY8BmdI4ZYaZqvVEuuHE=;
	b=yeQ4xP/08hLSU/RnLj84e3cyo6TWO1fWaG9plbXmZFa92my0fZMx/6jVpZRtEeIHFX6U
	 di/R5TdPV3BeVplJZbo2d9did3tN41um30/ORTMvEi0i/foVHKmUhA8q35S2HIrJRuENs
	 s0EFk378cge+fQ0jbHAHC7xVM/T2umA68LA3o6zUYpOKlqcTpvV+LE/KIKu7FWixFj1EH
	 4NUYkQgFe0c17ulh9LpnW4NFjFcd7hXy+Qv1imPQfjf4tu+e4qM0bl+PaOELl3jzm5aXG
	 SIAkZJ5v8FbxqSgTQVFExG4/4zgkhNCcvr8gkYd8Acp4x1DnwoZ/sbR2JXhGHY9+Pqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OC+BPw6T;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5D0606A31B;
	Fri, 23 Oct 2026 13:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA5D0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OC+BPw6T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792763845; x=1824299845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OF/kZBXSPt9pCh7CjgFn7D/7BdQXxVF8v0DAMErXXsE=;
  b=OC+BPw6Twj9czH5Vl2FVDS0Ets+KqjOW1EKBllLN25TZwnGzCqH7Zmbh
   /BQCIX4i1SyesrQwxnMXeNtcZYj9rFSrQ17p7wo5uo60VaQ4yeBMNTP4S
   4RqP+vWG5yLJszFfAwXzZYzpmoEQKGcuPhMCaFQO97fWu6cDhjc6zPIsG
   Dlg2AMTOyT7QsT4H/TgOzKFL81cxK9rqV8/zH9GIxDMZUAoWbPLTfZ1d7
   v+C/jwEAmtR0zhQO/oGzeA9ZE7oToftzvv1z6brMaXzw4ai4uht8m3caz
   b+mSNQWuLVUeogF/m0un5BpdKHJHPoB49Rv8lV8a+eFseiIBfxhQRtcOK
   w==;
X-CSE-ConnectionGUID: US3WfG2/Sw22DxW5AbBPgA==
X-CSE-MsgGUID: 9R9lUkCWSxie2BN4ZTd6jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1404169"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1404169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 06:57:24 -0700
X-CSE-ConnectionGUID: B3MHGVAQS4u8ozHPy1jNsg==
X-CSE-MsgGUID: fUOMgXIIR4eOq5tG+wDtlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4035949"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 06:57:22 -0700
Date: Fri, 23 Oct 2026 16:57:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: atomisp: sh_css_mipi: include
 assert_support.h directly
Message-ID: <attnv_ezWMGQlRp-@ashevche-desk.local>
References: <20261014111213.1967452-1-vladurares@gmail.com>
 <20261014111213.1967452-2-vladurares@gmail.com>
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
In-Reply-To: <20261014111213.1967452-2-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 14, 2026 at 11:12:10AM +0000, Rareș-Mihai Vladu wrote:
> sh_css_mipi.c uses assert() but only gets its definition indirectly
> through the circbuf headers. Include assert_support.h directly so the
> file does not depend on that include chain.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


