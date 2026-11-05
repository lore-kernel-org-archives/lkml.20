Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892831;
	b=QfTUQ8VuVFTRtkyWuuJ8WiLUkH0baoDk2UjiEcuDU3I7Z5WzdgR9jx96L+J3CSOLki1r
	 rUDY0t1IQv9fbsTdKMoZ8sWUU/yxTZ4Zxl2sIkBQnPs6hE+xPjXDXApdw/dSy0gEjge7D
	 05kMq8l/+PJHUBxST4lcYM3Sr40NSQJGxQSrhlAo7tkHMghWXEWwYtTkzXRURR/wAPKVN
	 a1vaeXS6UWpdKuH2fU7CAl2pemk5V1eUNT/An8SMTs7q/kTDa70MR7Ro0AmFWd7NOnA6x
	 UsjZ3QTkx9/CwOQqM0DR2bAMzy2ju8iJuDNRjosW/3CX9+plKh+nJpJ/fAFXZyGdruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892831;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4Vfkztk7lk/FPzIbLKt1z9U7nGy8flFzrS1duE7oyEU=;
	b=q5gBQYOYWi6qvqRma8rB80LTx4YwtwBFAOU6MSHA/6jC0HsHvKoHw/AtmFgnLHZXc+K9
	 VBS9KsbxvA9kpliL4DgfzbV0M2hWFgEVMQhupRzWmTT8foqJBCRnSdbReyP1cSGMNinv3
	 Xe7Oci+CWScygaTbkV2Z3elSF22MegJVjz4s0teHqkJldNHNbIaV/UN/Q+Olto2rOmxJd
	 PK4h+D1rIlBU6JVZV1UWY9wZAv3cTyWzwIV5fRPYR2MCnVwHRcSYkaVRfbrh/hrb3v5Lp
	 UsN323cnAlWXWt9sy44FpAowHldXj358qSlXkn2cqs82RZK4hmmZSs5JlPv9R6zUvmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QF3FviPs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6F1606A328;
	Thu,  5 Nov 2026 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QF3FviPs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EC81F00919;
	Thu,  5 Nov 2026 15:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892830;
	bh=4Vfkztk7lk/FPzIbLKt1z9U7nGy8flFzrS1duE7oyEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QF3FviPsikfE2k9wIMYS4AD8j3vLovG4pSdzN+OJlIg7lE3rNfQ3i40JLspvyq5nE
	 fyC0t1ut3A+W1yIEj6zZx0ilxMuZihZWtG0yBKTHCOPrpGXGKmn3UEpWSbch9tp1JL
	 t7ZgjiGdBqM6fBSsCUthUEfHBeiDuWdVQiLhBinRNuPdLN1pitOAJB4ZoqeIjaefR6
	 elU7cF2wf9fuUJ1vKrtTnU8eJgUti4YUGZ050l5ND4OH2RiU2InDbzQjioutTtZ119
	 47i1BUMaZyDfPPtSLLzfyoeNwodhmf8Ua45HrVWoASZ0h/y/neZgJ9NTju+dE6TABa
	 mt8xn949CGafA==
Message-ID: <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>
Date: Thu, 5 Nov 2026 16:33:44 +0100
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
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/11/2026 10:30, Jürgen Groß wrote:
> On 05.11.26 10:19, Andy Shevchenko wrote:
>> On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
>>> Refactoring of driver subsystems or some core driver parts often come
>>> with change of the actual drivers.  If that happens within one patch,
>>> people giving "Reviewed-by" tag only to piece of the patch, like one
>>> driver, and ignoring the rest including the main concept of the patch,
>>> are not really reviewing "the patch".
>>>
>>> As explained in the Submitting Patches document, the "Reviewer's
>>> statement of oversight" is for patch as in "entire patch" meaning:
>>>
>>>    (a) I have carried out a technical review of this patch to
>>>        evaluate its appropriateness and readiness for inclusion into
>>>        the mainline kernel.
>>>
>>> The sentence is explicit and complete, meaning it does not allow
>>> implicit variations like: "this patch or part of this patch".
>>>
>>> Reviewing pieces of the patch while ignoring the main part of it, is
>>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>>> not be applicable.
>>
>> I strongly disagree. It's all explained in the plenty threads you have started
>> on the Subject.
>>
>> TL;DR: As a reviewer for the piece in question I have done my part fully. It's
>> not my issue that the piece is bundled into a single patch. We have options:
>> 1) ask to split (and review as standalone piece);
>> 2) add (partial) Rb with the pointers of what exactly has been reviewed;
>> 3) ignore (silent agreement with the respective subsystem maintainer's opinion);
>> 4) ...something I forgot?..
>>
>> (even partial) Rb != Ack.
>>
> 
> I fully agree with Andy.
> 
> As the Xen maintainer I often have to look into such rework patches and often
> enough especially the Xen specific parts are mentioned in the patch description
> as "compile tested only".
> 
> I see a "Reviewed-by: ... # Xen parts" in such cases as a feedback to the author
> or committer that they don't have to look into those parts in more detail.
> 
> The value of such a R-b: is more questionable in case of a pure rename of a
> function or struct member, of course.
>

So you don't agree with "Reviewed-by: # subpart"? Sorry, but I have
troubles pointing your disagreement arguments to actual patch content.

Best regards,
Krzysztof
