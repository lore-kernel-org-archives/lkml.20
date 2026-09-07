Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C583B8921;
	Mon,  7 Sep 2026 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777887; cv=none; b=hjfarYgXxIA5S3iAA4HU8bw8B75rq39G8VZS5kHDSOF7tl2o09E9o9akwsCZh0taPj5viHoxXMju5zWHdqm6IR18vLsKuNWIhC+xMbUiuAjXOIe6pms+5+zoX8T146JSmbPWIh3aWOkufRVWz1JsKpP9STS7nqhoP51RZNz/jOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777887; c=relaxed/simple;
	bh=2hwh2AcBgKyWd0n5XC16XKeNe6QdOcojhz3vll/P+iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYPBwobxhMYbeAaTNZQ/od/FITfm5tae+4fJb8wZ9S17T+vh/J1eV7DPKvewymWwfKSQVJScRO58zAuDZg5PMOIFfM2GJTRDeNnrBTvWuIbsOLIu971E6xbWdB97c6eVapHQc+pLFl+g7Lytcu9mvCa8Q/voh0ANMRD+2UhXrc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JQfwqAP8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JQfwqAP8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00AA21476;
	Mon,  7 Sep 2026 03:44:41 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06AD63F7B4;
	Mon,  7 Sep 2026 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788777884; bh=2hwh2AcBgKyWd0n5XC16XKeNe6QdOcojhz3vll/P+iI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQfwqAP8b+aHItcwXjywNmynrYpqGvxro0RgNz57f9+y/bIZ2Ko+vYNdYo3Ndng7T
	 2j045Ab8wyG23buFPl6o1j15B3heUSVyXPKJEKJ7MjPnh/ylqobglIId2D/zwxSsTb
	 Mw0GJnuIWISSUrV9By5+UfFGN5KgyE8TUoDDF4JY=
Message-ID: <a82061f1-bb23-403f-b772-d5adf7acb871@arm.com>
Date: Mon, 7 Sep 2026 11:44:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Borislav Petkov <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>
Cc: x86@kernel.org, james.morse@arm.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
 <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Boris, Reinette,

On 04/09/2026 18:36, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 08:37:51PM -0700, Borislav Petkov wrote:
>> Lemme have a look.
> 
> Sashiko has comments:
> 
> https://sashiko.dev/#/patchset/20260709093111.367851-1-ben.horgan%40arm.com
> 
> Please address them: if valid, fix them, if not, explain why they don't need
> to be fixed.
> 
> Thx.
> 

Regarding the first Sashiko comment.

The documentation change in patch 3 includes the sentence:

"
The allocated bandwidth percentage is rounded up to the next control step available on the
hardware.
"

Sashiko rightly objects to the "rounded up". For MPAM systems this can be up or down and we test in
test_mpam_resctrl.c:test_percent_to_max_rounding() that it isn't too biased to rounding one way or
the other.

How about replacing "rounded up" with "rounded up or down" so that the sentence becomes:

"
The allocated bandwidth percentage is rounded up or down to the next control step available on the
hardware.
"

What do you think? Should I respin the series with this alteration?


Thanks,

Ben
