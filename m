Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349788;
	b=Raq6i7xeqVvYRlBx2Duhd6FbAs63x5j2/mIs4gwRjGYWu7X7Q5L8kzU0mwXJw+Uyi9MK
	 UmNoFvgQiQMI5Kv9kziZXjZPDQVj580lwIQl1DGry0PhCW6v/j/+Wr/vS8wVUF7Jbul7o
	 /KTZ1zGhIKk4TyZkuwn6aDWUHjsn08TaV7EsPVRVkdsxPZjfRQfnfzHTIRqfUOJc7YAcz
	 9Jk0gHUSc0tjzvZJ8KoYN1oCrlX7Eum74OxRPAJgkxKH45iu2amjDVlwtUPjNTeWyYrKi
	 97WJqjP7Zln2veyip/Y9xndQltsflvdgob2HL7pnWCFB9JlrYG+cZvxjvYyRN4YVBDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349788;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mGFgE6nRqGFa9z1MspHoLsZtUrKzktRfJG0pHHmSuUk=;
	b=nE9WTJfI8VIL6Cnkgfea7uO0Ni4I9cmNeDGkn7ZgvBlTogm6UN+WsC9AwUilVad9LVik
	 RMM1TLDFhyEWDpOoFU42iEeqR54+JobH1F5kyOTsUlPKPdzrX0u9bcNU84DUOAI5Z/N+B
	 Vc3m5OxUKax70Mk2cabA9206hTxC5h5WyBK8BAkng4I60i9ZCI3bHjVVu/ZHAGJpurhP2
	 ID34lr17nRI3R7iWh4wNMMg4AUAEUKLvXdBw2oRtWgx+aQcJIq1e/0/PnyGqaWyWNwvjJ
	 7r/FV29qFahGeWq/nEArLv46qqko0Z2qi4JJctU2OiQb9MFSVP9hW/iwIrlkOWuZu8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwBI9pTE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79453606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwBI9pTE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FD51F000C1;
	Fri, 30 Oct 2026 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349788;
	bh=mGFgE6nRqGFa9z1MspHoLsZtUrKzktRfJG0pHHmSuUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RwBI9pTE+HxhMC+6T9Cv92LmRW/knaFrLAeOKsovVARgYaWbbF9myImW62kIQWurM
	 WQiBZEIhqi8o+PVZzTpW5gO6S26rKhrcZyxJq8eiOiJ9cuDN7rsk4EF/uNOXP8foQK
	 UeOmY9vFepjPy7b/9a+fntDLYYuV872WWfKfsC0p868J9CMMrDwTQXn1mhUm0jQpZI
	 CihjthA5lfau5sCi2pl2/J/6puZw2RWGahk40n7Ac1e7uwL1CSA72jKfWICzDPRPbi
	 yFANqXil246zuw+XEcKuORBs5j5Tjkk2V/SDvZgnglhw+EEJKg0BFvfSaiVKjrsdlz
	 jkZ3AtMzoHMRA==
Message-ID: <b9473eb8-55f8-4263-80d5-a7bc0f31697b@kernel.org>
Date: Fri, 30 Oct 2026 09:43:04 +0100
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
Subject: Re: [PATCH 0/9] w1: a bunch of llm-found fixes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
 stable <stable@kernel.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
 <c1845af2-cd2f-41db-9407-ed2d1f073a27@kernel.org>
 <2026103048-unkind-eatery-98dc@gregkh>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <2026103048-unkind-eatery-98dc@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2026 09:22, Greg Kroah-Hartman wrote:
> On Fri, Oct 30, 2026 at 09:14:02AM +0100, Krzysztof Kozlowski wrote:
>> On 27/10/2026 17:04, Greg Kroah-Hartman wrote:
>>> Here's a series of some small llm-found fixes that have been sent to me
>>> recently.  Most of them are just minor bugfixes and locking cleanups,
>>> but they are good to have from what I can tell.
>>>
>>> Submitting them here to get a solid Sashiko run.  If they seem sane, and
>>> you want me to take these directly through my char-misc tree I can do
>>> that now, or I can gladly wait for you to resend them if you wish to do
>>> that instead.
>>
>> Problem is that it seems Sashiko skipped them:
>> https://sashiko.dev/#/patchset/20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4%40linuxfoundation.org
>>
>> Status is "Skipped" everywhere.
> 
> Shows "Reviewed" everywhere for me for all of them with "no regression".
> 
> Are we seeing different outputs?

This I see as well, but then I opened individual patch and each one has:

 To: None    Cc: None    Status: Skipped
Tokens used: In: 389k · Cached: 678k · Out: 32k

ok, maybe that's just confusing interface and patch was reviewed.

Best regards,
Krzysztof
