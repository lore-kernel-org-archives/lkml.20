Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894041;
	b=XENl4j8nv771AwFBEt2dOzEjh33SMXI1V8yjkM3T60x4lVbSZg0DU+C8+HH3A3zxhJWQ
	 DysluH5Dr4DMkOkOHVsgUmiF3vS3gNQowArPJmnTqPeKAiH6j5e7YeQUs9NsYF9FzMaM+
	 CApY/nUOn2APZkzwk01O/eheiDG1yKf6M9pjfFNsfy021j91BCViJ+h8IpNYfgMl9/MKm
	 jPsi47WeQlVegKP33Yn9Q81taMUwEmyM7AwjTEK2jRrd1Od4cJfbV+PoH4bW3nbpgiYIq
	 Jl9zr4tnyW+vmhTZdN5yDLOFFrDIA2rHGRtRiprsT55PtXfJ9GdsnD4oa6uprqEN9jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894041;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=auTA8l5D6HvTiSdgLgxsl5IELUAU/Q3ayct6vi4jkvI=;
	b=izPqbiHbbpMs/oyE/9kOcB5fA9ooBWp+L1GB5owawLZIUhGgLI0fBhUscOwe/uuXDmpR
	 60DM70en69UMk0Dly3CXiCJWSMVcRDoNp+eApQOJSYVYaHrLXKoZ5LY/mRnENlHDpdsFK
	 Q/0h7kegRzom3ooV9Yy3OsfEP8CtvIAxzpXdM7xXEcWOU6sAf7HPA3E7rVh4kIE4d7Iyl
	 V32aQvumsP+c6/KJEs/9Bo4Dq1Y2HXiZazX9pZsjuOpkM0IIqAtLvhHU/6hSW8avtopOa
	 DV08YvUwBkmDhn/lF+dKPo7sWgR5/yllAAAuENno37KaArpVf1+vYsD0Z7cobyQtcqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPqUoj1o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8A606A608;
	Thu,  5 Nov 2026 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPqUoj1o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19141F0093A;
	Thu,  5 Nov 2026 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793894041;
	bh=auTA8l5D6HvTiSdgLgxsl5IELUAU/Q3ayct6vi4jkvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lPqUoj1ooaSooOkIE9v+XmX0cp1VBlR4hUdEt8QcenW/PD1gFHckAi/RgKdSZBrxL
	 xVp5Tq/pcS/w1vx02YbASzIwoaoht7PAvK2JN0mof+zAqJl1lmEQfbck9BfBh0k5+Q
	 NrvBTrM83RwkQygFoiBeO+g39ezCeSDLgoqxErJXOZelrifpieeoEk+8aANI+g3Sbj
	 niU9IHxjMJUeALZqsmVUCpmtHsl0VLgsMwDHKEIIMogxt7rqrmVQtCEIqB63zeNUGP
	 l8+VvLz5on0qxgv9DxplnfzOAueNPjFVOMDJeXugVP09AiLYAnBEW2Bx0JBRN+otZR
	 tXhn55HKVYoJQ==
Message-ID: <76b98471-ae9b-4ff3-8337-b50d75c4b7de@kernel.org>
Date: Thu, 5 Nov 2026 16:53:55 +0100
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
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Juergen Gross <jgross@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
 <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>
 <f5ac5472-da79-4ac5-82de-36b2f5978f45@suse.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <f5ac5472-da79-4ac5-82de-36b2f5978f45@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/11/2026 16:44, Juergen Gross wrote:
> On 05.11.26 16:33, Krzysztof Kozlowski wrote:
>> On 05/11/2026 10:30, Jürgen Groß wrote:
>>> On 05.11.26 10:19, Andy Shevchenko wrote:
>>>> On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
>>>>> Refactoring of driver subsystems or some core driver parts often come
>>>>> with change of the actual drivers.  If that happens within one patch,
>>>>> people giving "Reviewed-by" tag only to piece of the patch, like one
>>>>> driver, and ignoring the rest including the main concept of the patch,
>>>>> are not really reviewing "the patch".
>>>>>
>>>>> As explained in the Submitting Patches document, the "Reviewer's
>>>>> statement of oversight" is for patch as in "entire patch" meaning:
>>>>>
>>>>>     (a) I have carried out a technical review of this patch to
>>>>>         evaluate its appropriateness and readiness for inclusion into
>>>>>         the mainline kernel.
>>>>>
>>>>> The sentence is explicit and complete, meaning it does not allow
>>>>> implicit variations like: "this patch or part of this patch".
>>>>>
>>>>> Reviewing pieces of the patch while ignoring the main part of it, is
>>>>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>>>>> not be applicable.
>>>>
>>>> I strongly disagree. It's all explained in the plenty threads you have started
>>>> on the Subject.
>>>>
>>>> TL;DR: As a reviewer for the piece in question I have done my part fully. It's
>>>> not my issue that the piece is bundled into a single patch. We have options:
>>>> 1) ask to split (and review as standalone piece);
>>>> 2) add (partial) Rb with the pointers of what exactly has been reviewed;
>>>> 3) ignore (silent agreement with the respective subsystem maintainer's opinion);
>>>> 4) ...something I forgot?..
>>>>
>>>> (even partial) Rb != Ack.
>>>>
>>>
>>> I fully agree with Andy.
>>>
>>> As the Xen maintainer I often have to look into such rework patches and often
>>> enough especially the Xen specific parts are mentioned in the patch description
>>> as "compile tested only".
>>>
>>> I see a "Reviewed-by: ... # Xen parts" in such cases as a feedback to the author
>>> or committer that they don't have to look into those parts in more detail.
>>>
>>> The value of such a R-b: is more questionable in case of a pure rename of a
>>> function or struct member, of course.
>>>
>>
>> So you don't agree with "Reviewed-by: # subpart"? Sorry, but I have
>> troubles pointing your disagreement arguments to actual patch content.
> I agree that "Reviewed-by: # subpart" is very valuable and should be used
> in cases where the review really adds some value.
> 
> It is different to "Acked-by:" and IMHO not interchangeable with it.

The patch does not make them interchangeable. The patch suggest two
choices if the reviewer's statement of oversight does not apply.

So repeating - which part of patch you disagree with? That reviewer's
statement of oversight says something else?

Best regards,
Krzysztof

