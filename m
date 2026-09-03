Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ED634CFCA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788472245; cv=none; b=Pd2ARVwcwsrDiOG0Vym6l64KJq4pX4Krr85BufvlZJ7GfnOEAGSZFgCnQFV2jXkJPZJCciwYf4fi2OojyB1rlinRSEG168rtpbOfUINQd6wTAklOqDT9RKqYS8zP+FdWBrFazwiivZR+EUwPYnA4ayBCv6NGcjyzUm/A/S4l7WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788472245; c=relaxed/simple;
	bh=RJyxmUUV3U08VYUqohEPPRZebOh+mLvsJ+Epuu7hkJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oeot4eRT/THOjZPVlIVIu/ZrKkHMxhR0dI+ZFck77uJDlX+to7E1KAX58deeZuxPJfLGVZsazlyNUaDazg77i4w+m6JxxH7de954jRvko6Gc/28MdvhDfLghypM6eAQKzBXMGg8z+34JRJVYrmTV9lFBItM80QgVSmidP9wPl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JplcUyaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JplcUyaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89EF91F000E9;
	Thu,  3 Sep 2026 21:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788472243;
	bh=BXvl5u4iQF0jrTA4beD0d6Pr9qxyba84a0RIPaewqh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JplcUyaQ5b/2D7+zCvOaJNkw9NsEWL45sxCPsocdiRBrs2k76+xIEawCTvhaXOvqB
	 z/mFNuC186BGIhPuLIf/2A/Go6DIqBCQzc71BoiRKb2iovLf4pbdFd4Um6As6/9OSw
	 +xynDaV9j7VEEA3xVg37CklJNBl4nH5eZXp2alW704OMyHJGb4zVoHAHWW/aKeRBsr
	 BNOiireml+0jhalxag+SarzdyzbyYwqOPWYscnvmaE/QNH7Fe0AlvNO++k4WHa4Isy
	 858R4gtKff3aKJp/E6z/a9vBo5sIqIic8hAdcVkubAKqrDPfw8ZAwCQyQIzFD1MuL9
	 tAOXN1IoRD5lA==
Message-ID: <a6220041-7b92-4156-a095-b4a36eae2025@kernel.org>
Date: Thu, 3 Sep 2026 23:50:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
 David Laight <david.laight.linux@gmail.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>, Linus Torvalds <torvalds@linux-foundation.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin>
 <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin>
 <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <20260901222909.05d6239f@pumpkin>
 <1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
 <CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
 <20260901192523.0e989b10@robin>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20260901192523.0e989b10@robin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2026 at 01:25, Steven Rostedt wrote:
> On Tue, 1 Sep 2026 14:56:01 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
>>
>> In contrast, the existing macro is *not* garbage. It just says "does
>> casting -1 end up being larger than casting 1". Admittedly it *should*
>> cast 0, but then compilers are unhappy about comparing unsigned values
> 
> It originally did but was changed to 1 for exactly that reason [1].

I removed gcc's -Wtype-limits in commit 660e899103e2 ("kbuild: remove
gcc's -Wtype-limits"). d2802d0739dcc can probably be reverted.

>> against zero, so it's not great, but it's *simple*. It still gives
>> random results for 'bool', I guess, but is bool signed? I don't know,
>> I don't care.
> 
> Yeah, it was originally used for the tracing format files so that
> tooling can know how to display the raw values it parses. Also it is
> used for the filtering logic to know how to compare to the raw values.
> 
> I see is_signed_type() has picked up some use cases outside of tracing,
> so I'm not sure how much those other areas care about things like
> "bool".
> 
> -- Steve
> 
> 
> [1] d2802d0739dcc ("tracing: Compare to 1 instead of zero for is_signed_type()")


Yours sincerely,
Vincent Mailhol
