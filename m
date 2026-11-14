Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794687483;
	b=pUp8hZB1lr3+3kKgJ4kamMcTEj8/6aojRkF8WkUakLE8ryhXNj9HawqCsSUWa4VL/8eE
	 qmFaugEMYB/xNhChTUpKxzqEAIG9fp1+qjhc1JAu2KKdO0RVlW8BBGlBhFxLs7ZUAbDVA
	 MbMzNCSTrwJWnajThTi44XRT1tXX9PVKs6Whfvi9INrsGmnMPQDhTsFxHWRoTOBVYkdJo
	 84LpFqPWq3ZzWvioT//g3mjKbDCT1uhNNq2mxT29+7lNibMlSVzMTPQ3FvCpe4FMayfYP
	 PaTmfZ8UvksdQPElOcd4zt8dbUlvwcwc4fiVClCebcVGmyaLagQ7khQrEs/WrRJZHjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687483;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LTurdTtk71EBG1bu2lzxcr6Y/jVSqjWyhTmHIUXsaMk=;
	b=Cow8Oasgeyn+VZnPZlm9rggboYAS7JcT/0LY4/cN9VdFl7Kch1f1AFGqLFsahAoJ/non
	 Ol8wZFlZPiWLyuK8cSIhwazVCT45Zv0/mxsZ4AKQiB4YdcNfjHTk2cUtGAaHdl2WxRDxk
	 K03BVE65tnlhAvXf0Z7NQ+/k4nfbDzIrlITBZxb4qRuDBb6pxboeoBYZf0+SR/jTxRQXo
	 doFcx9Niyt4iogxcXOJxcmm9u36OvQEXxPEA61X4Ihs4USoAEv0Bv/dhFm8ni4B2uw4pg
	 Q6HRVZRvBpH9rFzhqTISfrPJrBT8Ykv7kFlO53Z8s5cMBeRGnVpiPRPEAiw0b24MKIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ry1xYHw2;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9D3606A323;
	Sat, 14 Nov 2026 20:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9D3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ry1xYHw2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LTurdTtk71EBG1bu2lzxcr6Y/jVSqjWyhTmHIUXsaMk=; b=Ry1xYHw27ee+K6wDenvXwCCEyR
	Mt424vj2WtQ3IOLnP7iz63coaelGGDN0EPGmYPML1+odrYJ7IHgNpdojBCL1ILD+vJjEZ5bDwAwOw
	M1o0wweKJdxmp3jp5g6TfQu3NFbxaCwbuYTYz1ZDklRRpgbPx6r/uZF8rHYlvuSsx/nNxV2WbD6jf
	h+IjeWl1JI/twpJsLDe3qjic6ubDycd6tQbShhFkjgX026IJI6vv1LDi78mjsQ6sz4YWI1TnK1lLq
	rObn6a7YYHG827e9gyO7MaclFJwuFwEG7xkp0eMCXBqAdFgqxjIwWgbozDYvzK8ok/9Nb5yqP4PZC
	MgedHuvQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKCH-0000000GiPK-0qHg;
	Sat, 14 Nov 2026 20:18:01 +0000
Message-ID: <2f7b7068-caf7-4e85-902e-9307be815ecb@infradead.org>
Date: Sat, 14 Nov 2026 12:18:00 -0800
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
Subject: Re: [PATCH 2/2] docs: kdoc: don't print warnings of stored entries
 twice
To: prateekshitjaiswal73@gmail.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
 <20261114-kdoc-dup-warnings-v1-2-265f89bc3f9c@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261114-kdoc-dup-warnings-v1-2-265f89bc3f9c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/26 10:14 PM, Prateekshit Jaiswal via B4 Relay wrote:
> From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
> 
> Commit 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently
> discarded") was meant to print warnings of entries that never reach
> the output step. With no symbol filter, kernel-doc now prints the
> warnings of every documented symbol twice:
> 
>   $ ./scripts/kernel-doc -none -Wall drivers/gpu/drm/i915/display/intel_dkl_phy.c
>   Warning: drivers/gpu/drm/i915/display/intel_dkl_phy.c:47 No description found for return value of 'intel_dkl_phy_read'
>   Warning: drivers/gpu/drm/i915/display/intel_dkl_phy.c:47 No description found for return value of 'intel_dkl_phy_read'
> 
> The flush uses "self.entry not in self.entries" to tell stored entries
> from discarded ones. output_declaration() stores a new KdocItem built
> from the entry, never the KernelEntry itself, so that test is always
> true. Every stored entry then warns once in the parser and once in the
> output plugin.
> 
> Those parser-side prints also ignore the later symbol filter, so
> "-function intel_dkl_phy_write" still warns about intel_dkl_phy_read().
> Commit 292eca316321 ("docs: kdoc: fix logic to handle unissued
> warnings") routes the flush through config.warning(), which increments
> the warning count. -Werror then reports "2 warnings as errors" for a
> single warning, and a -function run fails because of a different
> symbol.
> 
> Mark the entry as stored in output_declaration(), flush warnings only
> for entries that were not stored, and add tests for both cases. This
> needs the previous patch. Without it, symbols selected with -function
> or -export would lose their warnings.
> 
> Running "kernel-doc -none -Wall" over the 10320 .c and .h files with
> kernel-doc comments, the output shrinks from 87900 to 49625 lines,
> while the set of distinct lines stays the same.
> 
> The problem was found, and the fix and tests drafted, with the help of
> an AI coding assistant (Claude Code); I have reviewed and tested the
> result.
> 
> Fixes: 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently discarded")
> Signed-off-by: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>

Thank you very much. I had complained about this issue.

Tested-by: Randy Dunlap <rdunlap@infradead.org>

This reduces a full "make W=1 mandocs" from 31341 lines down to
21373 lines. That eliminates a LOT of noise/duplication when
reviewing/looking at warnings.

> ---
>  tools/lib/python/kdoc/kdoc_parser.py |  4 ++-
>  tools/unittests/test_kdoc_parser.py  | 55 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 1 deletion(-)

-- 
~Randy
