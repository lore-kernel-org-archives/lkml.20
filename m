Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51834FDE75;
	Thu, 15 Oct 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072243; cv=none; b=ox+6XTPR7hx5DQqag59DOQVFZRUYMF1rkF6zHKjH1pFH5cbbTgJydFFwOn8tx0mDXFrziYCVqKKYdgnR9zjYbEs+hPHmtATHam7l2AXIG4f7ySUi0E2yvBbe0tX17apiuvuDcGJdQsW4m5wRxbNP8te435Piehpv349kVN8SGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072243; c=relaxed/simple;
	bh=SjlwPy0CRFqomUfSqsGh6ay+B0bDNNJbX3CFGC4BM4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IL1PWda3vFvtXRVF9yJu/N2M+RT+12lCuSWGwzCSSI998IekmJtPcJ8nN8zMx+rb+r0PEUG1zAq+cNU51SPJX3BsROSl5BhaHAw5v3JSO4LPYqCeTwdndu7Ln8kPuom5eeQNqDR84Gj6hLl+mNs9HFjXTLnpL5n2ZjDQZL0qc48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=P0UWooro; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="P0UWooro"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D9C0B4091F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792072241; bh=R2BXY9y/wAaqLSkiSl4J5qkXQhTuV5TrTLzdsEXJLuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P0UWoorozbN6ujMZclvz85JPKgd8DVsEVD4A+7ZqwjeOf6njcaRlD3BN5I+JOopLK
	 ABMzcwrgCBdpgjnESFpp48yeopxwN0WlFUbSQIwu2BJFNBSh7nlNj2Y+hDFYoayu2y
	 x/zbHvJKmKd1I/g5SqBaZJpq2RF2XYVzh0pVtbr8t37c5WxNHk9fHDInCavnI9cOdS
	 eHnF75xhDeBCCjGHgbgVgyvOjMUgc4sEjQGw7YKpYK7nCYIxoU4uSBylMMBx1ysnjv
	 GlPblNZwpDKaGvOMxob+kl7SiHQQYIcX+rxf3FlXePW3oHzL3gLeMWkt50oFcy9ufv
	 7ssyoGEly0rtw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D9C0B4091F;
	Thu, 15 Oct 2026 13:50:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weijie Yuan <wy@wyuan.org>, Daniel Pereira <danielmaraboo@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: doc-guide: add a guide for translators
In-Reply-To: <atDVxZQUiJfsqEBr@wyuan.org>
References: <20261013003702.5824-1-danielmaraboo@gmail.com>
 <20261013003702.5824-2-danielmaraboo@gmail.com>
 <atC5u4RPzVkVgTNm@wyuan.org>
 <CAMAsx6eef_2Gcf_WhvTkFWz-fOjyaWjP+h3US0v1=w-W5RdHBQ@mail.gmail.com>
 <atDVxZQUiJfsqEBr@wyuan.org>
Date: Thu, 15 Oct 2026 07:50:40 -0600
Message-ID: <87o6cvrs27.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Weijie Yuan <wy@wyuan.org> writes:

>> > For the Translator field, zh_TW just did a cleanup to totally remove
>> > them.
>> 
>> Makes sense. I dropped the ":Translator:" line from the example, and the
>> guide keeps the advice to leave contact information to MAINTAINERS.
>
> I personally think this is somehow a hard tradeoff, so my opinion is
> rather neutral, and I respect your decisions.
>
> On the one hand, I think keeping this field is indeed a way to give
> credit to the contributors, which can motivate more contributions and
> contributors. On the other hand, over the years, this field has seemed a
> bit cumbersome and inconsistent in both Chinese translations.

I personally don't see why translations are different from any other
contribution in this regard.  The credit lives in the commit logs; we
don't sprinkle our names throughout the source for every change we make.

Thanks,

jon
