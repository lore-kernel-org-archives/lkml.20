Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA5381EAB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475495; cv=none; b=gbw3RucYuHYUM52hK2IP3fdTdPrb3NPJbr6VoHZ/gBb2M3Wm6mEI37oXk5VBbOhn8iouQfDx+M4ye3kFgCd0i4an+RwvdIqGffdsfmCXOoyodU15QlDd2pAbxz9xkB1vzQCNLSbmw+PgVxnzi/rzvBewnKman7oAPSC7e91Mlsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475495; c=relaxed/simple;
	bh=gp/guim2U2TXqMSDAlQK+Xx6LE7zPva5TPHf8VCElsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3xhVWc8xVSm4SFHV6AEXpv1aqmSQbEHEV9JX4Mwjfjntt8yY+7FJR9kireIizT1lSRrbfnqt5CPZWzIGLRei11V8mJsL+GM7uGWfitawDxge0hFFea228wXIvmHau6jyafupZQLbxTQCfPSwEa8ch9FWQq1k59PZhU6eVhesUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQFUkCL2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQFUkCL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2613F1F000FF;
	Thu,  8 Oct 2026 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791475494;
	bh=eguc3+mJSr4pZxNWl4wHcofhJ+5wcBB3WBZPc9PQ3Vg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cQFUkCL2DdydsMsp3GjVaBQsqUR7zMxRxoophamo5scJ3M/OTC858rTZXg9I6oSxK
	 SrMgqiA5sCsIYH7aVRS+5tI0YEXwuK3MzYpJ19orJJc8fgGX1Z5WF2fHBFXHkuSZ4p
	 ueuW82xWgaZ8/6AThr5dgYyn7YaGw+Sz3HKQudfI5IHWE7AeWRclO3UTIANKlIFupG
	 0kuQt6d9hKQiKtJplyfRebqeeo9MELeOaT++sCf7fn11No3RZluuSMBjRw6Fiu+DtN
	 MNmqp2nxr8aw4CNjytlYO4JdyUcXf6ZeHRzRXVRErtJt6cmAE8ZpkpIGflmHr3Ffro
	 AlG6rEyIIyfNw==
Message-ID: <d9e61e64-e300-415d-9b3f-0030425ce24b@kernel.org>
Date: Thu, 8 Oct 2026 18:04:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
Content-Language: fr
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org, users@kernel.org
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <CAHmME9rh7k0vNrBt4yF7fOgir3yuhrFawPnmsJpeYBCLg-r6bA@mail.gmail.com>
 <20261008-quiet-lucky-ferret-3498cb@lemur>
 <e1f160bb-adef-49e0-acb6-628b259b7975@kernel.org>
 <20261008-quantum-polar-kraken-890dac@lemur>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20261008-quantum-polar-kraken-890dac@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2026 16:05, Konstantin Ryabitsev wrote:
> On Thu, Oct 08, 2026 at 03:22:56PM +0200, Matthieu Baerts wrote:
>> Is this list actively being used? The risk I see with this list is
>> having someone sending a new version of an existing patch only to this
>> list: this version will then be picked by tools like b4. If the
>> maintainer doesn't pay attention to the info messages, a wrong version
>> might be applied instead. Maybe b4 should catch such patches?
> 
> I'm trying to think of how this would happen. If the submitter users
> get-maintainer.pl, then they should always get the correct set of lists. If
> they aren't using get-maintainer.pl, then they aren't really likely to use
> just the patches archive list.
> 
> If they use b4 to send the patches, then even if they do manage to mess up the
> recipients, somehow, the maintainer should still be able to find it via the
> change-id search.

Sorry, I meant to say: when someone is trying to discretely get a bad
version applied on purpose. For example: user A sends a v1 using
get_maintainer.pl, then user B (or A) could send a v2 (or a v1 with
other content) only to patches@lists.linux.dev. In this case, a
maintainer who wants to apply the original v1, might end-up applying the
"bad" and "hidden" patch.

Or maybe "b4" already prevents that or is clear enough when picking a
newer/different version than the given one?

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

