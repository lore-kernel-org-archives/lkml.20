Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669066;
	b=mkizW9y2/2gbKstKtrJdfP7LtwMXKx8EetvQhz6vm2yHHJHuWoQfwplbkOCU2GGFwGmC
	 y6U8ICKh9DfDDBl5EH2eVJgZp1nalYWj9KRr1W4FmH9rEAyTcMi5l/H4vyIuxfykuCrih
	 hdkqDperaOa6grx0CFxq+EvW4Ham0QCRpswaFSuu88E3cSAejbtLsEGfhdhrMEjjEwg6I
	 1/8B3J8pDOOSilAOCht5e/pV3tUYW12Z0IC9bi9mtMI+m1FLRbNnY6zNVdGHQlq++S/JO
	 bi/5m/rdlpLZ8C/dSYTmQ6hZkpQXW6Hxx1dzgz2xXdnOyP4U3HDsU6X9sXILYFJHJXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669066;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=d5ROMJUedZLih+jrgQUEk8SGN3/4HALtvSFhHULVPjM=;
	b=2W7kmULNwzZVhH2zCANzKxs3SHWI62ccVEFTpgLEnq3FiyihDMPtsSZlHN54AgwoslD3
	 PZoMYJoYTCvE5BKFVgE3XmZMv6pMvepIM2R25Uo91TBs4ohGMlRxJ+qA3/wg2MXfUCUNc
	 /S0rO2250ACectlj28qQkfz/HgHC9n9LW5EC24affVg3VO/yiabCDuMS2ymbmdcqi5YO8
	 MJXB4m5M4WwUI2v+V+IrR5ET+2aeVPNceyH/cO+UbSNZL+xpUaRTc9XjRqFXXQq1BUiAK
	 afNtIsqlsZLa6jhQT60jwFtc9kHszBi2BN9N99dJfjeINeQthSsuKjmUUnrRgNyyoOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mxgaQ+2f;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DB1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mxgaQ+2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792669065; x=1824205065;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ALmiItUf2x/zH3Mfj6B6lpX1RjeV3OJyskyjLJWabeQ=;
  b=mxgaQ+2flyv2gTnYBjq3kFIFeSLc80+kW7awkShODe8/i1hgpY+q1s5I
   7W+5Z4f7awQRfb0Kzb0AKvXCGR2XK0bNMLCFoNQ2alXZLsBBuiaKF+EED
   Jf3KldkR1tedYne76hIwK5QorEAKR3bpGv4nkbGfaYflsCPYQWRFWGzZo
   FlU5fTZ4YtI9JZoIGBGAvFqauhe4MtMaOzFW5GXtiDCVQBsp98wpnqA6g
   tihyJ1uTkU3dyKphaHvYfiKHrtXVtgDjrQ8S1Sr/qrg9UbTUCdK2bPCmh
   kJGnWISxFdiIgWxA9fX8XSQRRcuu41PvO6HriM/1giOdLklL81abh3SBq
   g==;
X-CSE-ConnectionGUID: 2G7tnDAeRHOgVAV15wpN/A==
X-CSE-MsgGUID: 0LXUcr4QTbuLjLNsCoYpEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1518781"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1518781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 04:37:44 -0700
X-CSE-ConnectionGUID: N0r6Et1LTiC0PAFkluJ/Tg==
X-CSE-MsgGUID: wCR/cxFaTtimhYw2cqbi8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3701729"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 04:37:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>, Chenyu Chen
 <chen-yu.chen@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Harry
 Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 kasan-dev@googlegroups.com
Subject: Re: [PATCH] drm/edid: reduce update_display_info() stack usage
In-Reply-To: <3486e0b1-d188-47a9-9de6-7ee5c2cfd097@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261013205223.2396822-1-arnd@kernel.org>
 <6c18da11310ced4a7c85ac7862c3f5c67b39891a@intel.com>
 <3486e0b1-d188-47a9-9de6-7ee5c2cfd097@app.fastmail.com>
Date: Thu, 22 Oct 2026 14:37:36 +0300
Message-ID: <90fe0000d611f080164a1fd7f228cd533a2e927d@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 19 Oct 2026, "Arnd Bergmann" <arnd@arndb.de> wrote:
> On Mon, Oct 19, 2026, at 15:28, Jani Nikula wrote:
>> On Tue, 13 Oct 2026, Arnd Bergmann <arnd@kernel.org> wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The drm_parse_cea_ext() calls into nine individual parser functions
>>> based on the data format. If all of those get inlined and KASAN_STACK
>>> is enabled, this can explode the combined stack usage beyond a
>>> reasonable amount:
>>>
>>> drivers/gpu/drm/drm_edid.c: In function 'update_display_info':
>>> drivers/gpu/drm/drm_edid.c:7040:1: error: the frame size of 1888 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
>>>  7040 | }
>>>       | ^
>>>
>>> Mark all of the individual parser functions as noinline_for_stack
>>> to avoid this and keep their stack frames separate. This reduces
>>> the stack usage for update_display_info/drm_parse_cea_ext to
>>> a more manageable 744 bytes, while each parser only adds at most
>>> 200 bytes on top.
>>
>> Is there really no way to tell the compiler to not do silly things in a
>> more generic way?
>
> The problem is really the sanitizers here, which turn off the
> optimizations that gcc relies on for its normal behavior and
> which cause additional register pressure for the inserted function
> calls.

Cc: a bunch of KASAN folks.

I think it's really silly and ugly to have to sprinkle
noinline_for_stack all over the place in pretty normal code [1]. The
stack usage for each individual function is fairly small.


BR,
Jani.


[1] https://lore.kernel.org/r/20261013205223.2396822-1-arnd@kernel.org


-- 
Jani Nikula, Intel
