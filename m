Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793532404;
	b=hUzDwP7nDL3yaVnzHuFV92ubShOv5oQVq+spacGISzgI5I/nJI/HICDku+XrGmKVQGTZ
	 /D2cBOO1s6FuDmNFjxzs7ZkqEDyA7tblvXTmc7idzdYfqFk2QH6YZyoJ8zLm8ByZisc/8
	 loV+vvh7R+2FvsssLXjtGyCZdnd3RghaHxu2iqJFtSODp/T9lDKbjnOBApCh33Ewj87wJ
	 UFdJkIzxVN8uuAMm7kG8PX2w+HPTpoaSOpXXN7etHMzITDtwQzBesKyZ+usN0kcxhf8QG
	 f5nJ1bdaJV3Df6WTtOl7I8UKYHUh/ybwJi+JCJKTCqn3jbZ+mILcFls7iBpBjD0v1hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793532404;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Y7DbtWg4XSzHpKwXOrwZjoFzW+NxxxNgXpxrWbQBBqo=;
	b=vsSW0rMN4zUBDnZmFeZ/R9Riz/PSNQvszC+NxESigDHQAbxxYwf0F5Wxppqw7h3yCEiM
	 6pbJyQQzE5kWuFZJ7oTS79ybVNZPLu3puLzxraSwsWkurjx01jNkIXu2ERk7Pb0WvadJW
	 sJPgBxuAlbTe/vUv+TKRrktx8R5WjbeKe1Vj+u5ZM0CQGpSGFErfY6gc7Ho1oGk9a/Too
	 Dsv6u99zILldmN89+WI2X8TKMnMB9nnjeYaFnsh9s6yiiJOnVxnXCm0VDlVX7Le9mgcrc
	 FGMPfScKI9QzbCmSj/johq3EvihZMIUlFIt2FHUaNI1yjDxAzqa//irJbNe39p5Uugw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5Vlps0q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890A606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5Vlps0q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4473C1F000C1;
	Sun,  1 Nov 2026 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793532403;
	bh=Y7DbtWg4XSzHpKwXOrwZjoFzW+NxxxNgXpxrWbQBBqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W5Vlps0qb7PytAKu33KdwTLNBR/6b3ZB6CzdzOEu3yOE3h6zSlyHJInEnoK/pKbel
	 wzuHvBK7vDGUds5N7hhsCWfG8PqgJ1ArQn5T5T0UuG8MEFggMC/c0q87luE701A+uQ
	 Q5FhSBRRxets5m7HQr4JOa5zEHrGuj9If1rwb4+U8372orSgW/4fVFkNH3zugDIvAb
	 Jv38Nsh/TX0Y44xLIVfQ3S5AkavpB/xqk+MI05iKQGc/t13AkSECYGmAVNc4m5c+3F
	 iHwDsABvOtwDIkKf2SEPodHzvSLIJl0DIyEkS3HzRN2EutrWg6sz9EqRlwNNs8XZgB
	 4N6Cz1+LELjOA==
Message-ID: <efe70a7a-32ad-4b7c-a514-b27bc1ac16b3@kernel.org>
Date: Sun, 1 Nov 2026 12:26:39 +0100
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
To: Dave Hansen <dave.hansen@intel.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org
References: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
 <20261031-processor_select_is_not_an_expert_feature-v1-3-6227bdbbe5a9@kernel.org>
 <efbf7f55-755b-49e1-aa01-dae92fadb426@intel.com>
From: Vincent Mailhol <mailhol@kernel.org>
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
In-Reply-To: <efbf7f55-755b-49e1-aa01-dae92fadb426@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2026 at 14:58, Dave Hansen wrote:
> On 10/31/26 00:51, Vincent Mailhol wrote:
>> Remove the EXPERT dependency from PROCESSOR_SELECT. Make the option N by
>> default so that all x86 CPU types remain supported by default.
> 
> I actually kinda despise the vendor selection stuff in the first place.
> 
> It just causes problems. Like for protection keys. I diligently made it
> Intel-only when it was merged. But AMD came along and ruined my party
> when they added support for it. We had to go do more work later to make
> it available on AMD.

I think I am still missing the connection between the protection-key
example and keeping PROCESSOR_SELECT behind EXPERT. When AMD added
protection-key support, the dependency needed updating regardless of
whether vendor selection was visible outside EXPERT.

I understand that setting the correct CPU_SUP_* dependencies can be
challenging, but those dependencies are the developer's
responsibility. I don't think EXPERT is intended to hide symbols
whose dependencies are difficult to implement correctly in Kconfig. My
understanding is that it hides questions which require advanced
knowledge from the user configuring the kernel.

> It's also one of those things that inevitably hides build problems.
> 
> Hiding it all behind EXPERT seems very prudent to me. I'm not seeing
> justification in this series to change that.

My justification is that the configuration process currently seems
backward. For example, an AMD-only build doesn't need
MITIGATION_CALL_DEPTH_TRACKING. Today, the user would need to navigate
the "Mitigations for CPU vulnerabilities" menu and understand that
option to disable it individually. It seems easier to ask which CPU
vendors need to be supported and let Kconfig exclude features specific
to the other vendors. The same reasoning applies to other symbols with
CPU_SUP_* dependencies.

Generally speaking, my opinion is that EXPERT should be applied to the
child symbols rather than their parents. The deeper we go in the
dependency tree, the more specialised the options become and the more
expertise they require.

I agree that keeping vendor selection behind EXPERT reduces exposure
to configuration combinations that may receive limited testing. But if
there is a bug in Kconfig, is limiting exposure the correct strategy?
In the end, it just hides a genuine bug without addressing the root
cause.


Yours sincerely,
Vincent Mailhol
