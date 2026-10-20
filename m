Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514751;
	b=lRChx9CRMQNCc4XheMebmEY8Z/2RV2KnqSucRe1hJ4B58WyYFoJuyGWHGfd7+Nod5IK9
	 Bq0wQa+XnRrskKCug3CVdBIkm3XSW4cOmxc9fYEjWRtE+S9P/0dJe5rd4/kGH6ic4JMjQ
	 QiBs6/eUVd3NYqjPYWbilzYoRNZ3PSZ85jAEkXxGTnEOZIifP4f7lM6AIFe4BCX0tOX6Q
	 n7E9ZOyqGBXoIXZcQcuTlbGgzy1EEc1W856QNLQ7knrnpyIlWxacxJQw3aIjb5lhTJqx3
	 PJ5Wpex0/aprq4D+dFpmlDBEVd34//eiX7R7n6GanqPHJKVw5lihjsNEYz5BpvU2ZLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514751;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EDfSQoEXqpiP3epSsZykyucuXMZN9pr0EuGg4SWLZbg=;
	b=QEskmSVxzQ22Qf/HmKo3RQA8ilsVwkDPThgq46xIIDVBUesB1vfK8uNUvSWMxLuWlVB6
	 1DnT6dfE4SwP36OmznLizxd2yGMFs1Wul6o+A21aWf9bGXahP6pWKiehNrUQelUvVNzjz
	 t5HhUOd5WjDrr03a2VhuoqfOqB3bIsnV4SEf5h96XsJeSrMT3TyWEz+6EJFhQSqzFkqTb
	 pkNHtywu56xsqGCgobrgAza8KvwByuK0yZrAFFFTm12FnKvtIj7B6A8i4L9tvk0y5D0ML
	 tfyRUzscL/hpDq9JRMEd12i9hjU93eiyvWPvOzv9VGL8fHH7yqdHyoJV+GxptRwX9+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSYJq5Hw;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE2F606D551
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE2F606D551
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSYJq5Hw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792514750; x=1824050750;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=F5zjmLX9S4kWimoe8F7UVj7/kEmV4RFYCGyK5lxjjUE=;
  b=fSYJq5HwHx6zKSzE2FvliCHGGCTNlAVF1gByph5QWY9phjJEAAr5oSxW
   IxNPuQAUVw8d8NPZvPQD2ml/eFVi5d7GggRnPiKxO/PsDwMe3KzZxmahX
   ogG/zyGPG+XvYnxWjy+mN5xSUioIZjisObW1KHWgWH2J3tmBcvAA0Mw/K
   Mo2Nb8g43Vpgmkgm9QqreL8QMIAVIAyMi6fCwrbf9HzNsjmW1FB6TVIfA
   dKCOCEKYoAJITsbfBETpv9BrneLjzr0gUBEfABmHbsI9rT5bTFvymyezB
   +dYnUdp8qILlhQMRCDWyAzMMNslLYuy4g4w9t3u10yqFqa/i8AQNFo4I8
   g==;
X-CSE-ConnectionGUID: /RiVIGv7QnKmCa1SWGGxqQ==
X-CSE-MsgGUID: J7Vr9/oDT6ui6iVrj6baEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1238077"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1238077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 09:45:50 -0700
X-CSE-ConnectionGUID: 7daPNeXgS2276IYT2Dkpkg==
X-CSE-MsgGUID: 3ameFwkaSPeozvEUXge6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2801260"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.111.78]) ([10.125.111.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 09:45:49 -0700
Message-ID: <d8a05f9e-42ac-4c19-8713-558e1f002bd0@intel.com>
Date: Tue, 20 Oct 2026 09:45:48 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/nmi: Enable panic() when NMI handler runs too long
To: paulmck@kernel.org, Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <53ff8d29-b7ce-4b3f-bdcf-9ac1f31f0a9f@paulmck-laptop>
 <8b14bd35-8f7e-4e41-9aae-e085f9a536f6@paulmck-laptop>
 <20261020045247.GEatbzn7VKvUfDTbR4@fat_crate.local>
 <5182974b-500a-4076-b9a1-5c67dded8380@paulmck-laptop>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <5182974b-500a-4076-b9a1-5c67dded8380@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/20/26 09:15, Paul E. McKenney wrote:
>>> +	toolong_nmi_panic= [X86]
>>> +			Cause a panic upon return from an NMI handler
>>> +			that took longer than the specified number
>>> +			of milliseconds.  The default value of zero
>>> +			suppresses these panics.
>> Cause a panic after an NMI?!
> When the NMI handler runs for more than ten seconds, life is hard anyway.
> And no, these were not bugs in the several affected NMI handlers themselves.
> 
>> Oh boy, is this trying to solve a Meta fleet problem and you're thinking, why
>> not upstream it too?
>>
>> Because I fail to use the usefulness of this...
> I might be wrong, but I doubt that Meta's fleet is the only place where
> such bugs appear.  😉

Yeah, I once upon a time had a bunch of problems with NMIs taking
forever to run. In my case, it was some actually wonky firmware, but
differentiating the broken firmware from NMI handlers just being slow is
what motivated the existing "took too long to run" message next to which
you added the nmi_panic().

That said, I'd much prefer something more generic than something
NMI-specific.

Would the systems that set toolong_nmi_panic=1 also set panic_on_warn=1?
Are there any other "extra" panics that these systems also find useful?

I'm kinda curious if, for instance:

	hung_task_panic=1
or
	softlockup_panic=1

would also panic() these systems.
