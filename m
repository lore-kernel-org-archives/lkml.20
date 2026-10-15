Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B9E47ACE4;
	Thu, 15 Oct 2026 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069258; cv=none; b=tx72oM2bfW8PTL4k1H+nx//EMg9bCpNUpdvdV5oqxN8wtXcwJBVmIA4jkWQjjO4ILFlAqSRQa3Qqm3rON3ueq77/YqSjKwwz2gVBkFCimfZ1Fa+wYDwyxkTXL0wP5PqkPIh4qw5LZzJDTXbCKOu9QIEFil9j3xqT0UkoBnz2jgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069258; c=relaxed/simple;
	bh=zkKSwzqobtkO50buLWMNOEnQsxnqkwYG6uach0BOGmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j+ASBaqFXIBvF+SjqbWCvDYlB+vWHE46xYwJXnsZfn94mqEkTBQup0annWBsIQMvozME5OJ8xPmV8No90UWntJnBqvnxh7HxJTJIZY/Lfsf6WeuP9RLylUambeocM5qzGxBNOppd66f1uwzm0p8l0CL/Pt6O2UHA5CK20uWVH9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DERIIPKu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DERIIPKu"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 20D4D408F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792069250; bh=RP/W6qL9Y9sy24N/XTNR7g/wdRCQod3TW5Vn48QZhOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DERIIPKuZ28chcZG/gwdW6ghWeGJWjr3oT/gL5Yc0GU0+VWYowGtxYPE5S/l64Kpf
	 xwcvm5IdlpQtFxLYtn9k9J1eW3Nu9TiFkgSptEaJ2ao05i9CRhWVSDcl6VqfCuaGNF
	 nRiT7YGLmUEffjhOhiZZ3TRSqXmRYzqCjoM/CKEoN5RKDtw1f+QbAXHQibbKcGmipx
	 odd4ybaK77K3zaXzvqOUhaV9NVVDFFaGK/OTMVFXihk7Pqn79zFCMARvuLSfqZ/Sox
	 0jJ36ZWiXPPMFenMCV1vX8fD78/GAJnOn5JlrTWh/2l+eDOy+B2m7mMH0M7t/v3zNb
	 JcVx5qcWc8w2A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 20D4D408F6;
	Thu, 15 Oct 2026 13:00:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, rdunlap@infradead.org, mchehab@kernel.org,
 aleksandr.loktionov@intel.com, bvanassche@acm.org,
 tudor.ambarus@linaro.org, emmaonana18@gmail.com
Subject: Re: [PATCH] docs: kdoc: strip DOMAIN_NS() wrapper in function
 prototypes
In-Reply-To: <20261015005314.7195-1-emmaonana18@gmail.com>
References: <20261014224714.16922-1-emmaonana18@gmail.com>
 <20261015005314.7195-1-emmaonana18@gmail.com>
Date: Thu, 15 Oct 2026 07:00:49 -0600
Message-ID: <8733u7t8xq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com> writes:

> On Wed, 14 Oct 2026 11:22:02 -0600, Jonathan Corbet <corbet@lwn.net> wrote:
>>> Neither of these patches applies to docs-next...what did you base them
>>> on?
>>
>> Hi Jon,
>>
>> I had mistakenly based both patches on mainline rather than docs-next.
>> I have rebased both on top of docs-next and sent a v2 for each:
>>
>> - docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint parser:
>>   https://lore.kernel.org/all/20261014223134.14772-1-emmaonana18@gmail.com/
>>
>> - docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes:
>>   https://lore.kernel.org/all/20261014223437.16164-1-emmaonana18@gmail.com/
>>
>
> I just noticed another mistake on my part, because I prepared
> the two v2 patches on separate independent branches off docs-next, both
> patches add their regression test at the exact same location in
> tools/unittests/test_kdoc_parser.py (line 444). Applying them sequentially will
> cause a merge conflict
>
> I didn't realize that patches modifying the exact same context in a file
> should be stacked sequentially on a single branch as a patch series
> rather than developed on separate branches.
>
> Should I respin them as a 2-patch series against docs-next,
> or would you prefer to resolve when applying?

Redo them as a two-patch series if you could.

Thanks,

jon
