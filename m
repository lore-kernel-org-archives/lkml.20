Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411522;
	b=ahoGOHiNnDgm/jKGb1hFj2l67YzzTuNOou+pot0JvWBVxjhatk1pXihcTyQzImN7aJdM
	 hglbQ4kYsVouMHlatG/dIbsteXJVWFFfLVzjcBDFiwXKrbt+TGLDgMsFwAq/zlApa98/T
	 HDDCpL+bUpMUtMo0kMAKjdJ7lEK9cGaIwCqMNs3yhAjQjRsj3RoQJvSnMxhG9jRUJngQi
	 o/V8orwbSxsvwptNu50GR/HlGV0DsdRMtz+YXbkbyWnM+YfXCcUnawVpVxojjIfVTvajI
	 ZjS8AL3f5qeEV7KAnVkCT5vHXbNtgwv5RiAPpuxWAepuPkGwBfekY1dnPnvrfF70lsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411522;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3hzhLkfLUr5hkJiZG4EDECMR3tAu6ENF4hGmO7g9NvQ=;
	b=PE3VwePdQp4aCsMqfs/h+MPt1xzpfy6nzMrZywCHKzkh2qeAqfePj8P6B6GSFj7QX+QH
	 4vd+6K0gH6lHGhF2kaaGqmB/uIB9p8mA1+kiw2KSPDRW4pfWtIiqIrFHHN3Fz7RfeXq1J
	 j4CIw3d9+hcVmOegNau472wBzLoR2/VLy1Bk+nFaiEBq47qIPwfMJir+BFw3RcUVmWJfl
	 jiOqp2MIfKq++vSQCPS4LaaRpU8ZPahu0lvltUKKBcDTU7TdmP4xvC43mKSqUIwo6pmdn
	 /FASdpGNZBwovAiIUq+QhqvYhSs53CCUapNBvh0PkJXjdtV8TfhXjJKtl+WyAn8u/uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YepYSDR+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CAD606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YepYSDR+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE151F00A0D;
	Wed, 11 Nov 2026 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794411522;
	bh=3hzhLkfLUr5hkJiZG4EDECMR3tAu6ENF4hGmO7g9NvQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=YepYSDR+fVSkax6M38d+Eushf1cgyV6Yhbsvg925tS2ENWgdJAty1V2Dfzn1SL7cd
	 5j3dh8sgynVFcNuYllukCisvDfCAGcgujhWr4s8pvK3RQdN1KInRUY37yzVVMM5WIz
	 S37q4tKc7wqmlVoxbaz4YuS1kEwlGcTo5yIzobv8ykIwmZ+3mbqqlZznudAmb85ETn
	 TUNp/REa39RG37sVx/se0hHymcDSrrgRxwzOsjiOfSLSD7U9yNQvCSg9mtaHgXlkQo
	 cM9Yhl0zGGjOuJsKZL11B+O0KAcOqnU6UfzGVACFxGufhwk2ZgXsy2WgvNaBZmyTmH
	 foKByViQf+LrA==
Message-ID: <30db0b9c-cd43-409e-a39c-f91dee446d55@kernel.org>
Date: Wed, 11 Nov 2026 16:38:38 +0100
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
Subject: Re: [PATCH 3/3] x86/cpu: don't gate PROCESSOR_SELECT with EXPERT
From: Vincent Mailhol <mailhol@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org
References: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
 <20261031-processor_select_is_not_an_expert_feature-v1-3-6227bdbbe5a9@kernel.org>
 <efbf7f55-755b-49e1-aa01-dae92fadb426@intel.com>
 <efe70a7a-32ad-4b7c-a514-b27bc1ac16b3@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBAhsDBQsJCAcC
 AiICBhUKCQgLAgQWAgMBAh4HAheAFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmrTM8wFCR1O
 HxcACgkQq1/riG27mcJ2KAEAhG19xBSkjiA9dtatvq2WJnGaes4SUmY+LSn7dh1Lf7YBAIwB
 lsMMmigMTk3Qgwymg1nT+Z8z1Owc/TGtRlo4ZcwMzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmAhsMFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmrTNKcFCRUFdT0ACgkQq1/riG27mcLEVwD/VmnQtTf6yhowaIFj
 AjUtwiyQz9ja4NRu9GOvz/pb2L8A/3QcADR0dcxADGsmOiBpN2M9KI7nqdNIq3VPM/3/5fcB
In-Reply-To: <efe70a7a-32ad-4b7c-a514-b27bc1ac16b3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dave, Boris,

On 01/11/2026 at 12:26, Vincent Mailhol wrote:
> On 31/10/2026 at 14:58, Dave Hansen wrote:
>> On 10/31/26 00:51, Vincent Mailhol wrote:
>>> Remove the EXPERT dependency from PROCESSOR_SELECT. Make the option N by
>>> default so that all x86 CPU types remain supported by default.
>>
>> I actually kinda despise the vendor selection stuff in the first place.
>>
>> It just causes problems. Like for protection keys. I diligently made it
>> Intel-only when it was merged. But AMD came along and ruined my party
>> when they added support for it. We had to go do more work later to make
>> it available on AMD.
> 
> I think I am still missing the connection between the protection-key
> example and keeping PROCESSOR_SELECT behind EXPERT. When AMD added
> protection-key support, the dependency needed updating regardless of
> whether vendor selection was visible outside EXPERT.
> 
> I understand that setting the correct CPU_SUP_* dependencies can be
> challenging, but those dependencies are the developer's
> responsibility. I don't think EXPERT is intended to hide symbols
> whose dependencies are difficult to implement correctly in Kconfig. My
> understanding is that it hides questions which require advanced
> knowledge from the user configuring the kernel.
> 
>> It's also one of those things that inevitably hides build problems.
>>
>> Hiding it all behind EXPERT seems very prudent to me. I'm not seeing
>> justification in this series to change that.
> 
> My justification is that the configuration process currently seems
> backward. For example, an AMD-only build doesn't need
> MITIGATION_CALL_DEPTH_TRACKING. Today, the user would need to navigate
> the "Mitigations for CPU vulnerabilities" menu and understand that
> option to disable it individually. It seems easier to ask which CPU
> vendors need to be supported and let Kconfig exclude features specific
> to the other vendors. The same reasoning applies to other symbols with
> CPU_SUP_* dependencies.
> 
> Generally speaking, my opinion is that EXPERT should be applied to the
> child symbols rather than their parents. The deeper we go in the
> dependency tree, the more specialised the options become and the more
> expertise they require.
> 
> I agree that keeping vendor selection behind EXPERT reduces exposure
> to configuration combinations that may receive limited testing. But if
> there is a bug in Kconfig, is limiting exposure the correct strategy?
> In the end, it just hides a genuine bug without addressing the root
> cause.

Have you had a chance to read my replies?

I wrote patch 3 because, as a user configuring a kernel for my own
machine, I felt that choosing the supported CPU vendors directly
improved the configuration experience.

If, after considering my arguments, you still prefer to keep
PROCESSOR_SELECT behind EXPERT, that's fine with me. In that case, would
you consider picking up patches 1 and 2 independently?


Yours sincerely,
Vincent Mailhol

