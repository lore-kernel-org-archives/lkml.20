Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD1D4D4867;
	Fri,  9 Oct 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559244; cv=none; b=Ay71/tfhAf3hxnZsl6k0/RyMjSOKZokwejPW/X8lOslFaxpa9cTXINUR2Ysto8eCaJHM90PGgOQARR3H091x/V733Bbd2hu2HJKfO73Bs59D2asfGYTq7oK449vlqFBvKgu7tC0NnI6s+JDgwhBeV/1r7HBV6OpO6OwZPEUk9Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559244; c=relaxed/simple;
	bh=igkR6oZaJNB119k4ar5BBv3eWH4uV3qXpqYUvh2iXvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S9oT5tOdYurtj2aZgbaOIjHW1SAA41MXgzYlwQQJH5YgZJNdutthkEEZ01qaTlTbE05exZEpHq6s0b+4a/j0m3Oa0n5OhPkYmn/O8VIm0bQuqysk0XVsdDBTtLMhOTPlNc08bp95cTa3Z5gokq8trdsvn9nC8njSZOQ8bpQFgwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tYCpnGPL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tYCpnGPL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 01B50408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791559236; bh=igkR6oZaJNB119k4ar5BBv3eWH4uV3qXpqYUvh2iXvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tYCpnGPLttPQ+2Ny9k/bxAop5yDy0XuOyr990hr5l+qDWTiK8VlgXaaKX5ZPCCk30
	 Fym10Tzr1YtkbQ3EVvTcSOhqGue6/a+KFMXUsUZtGnJpioT+rtUp/zGrlxwQSQ5AYZ
	 9IrGnmPDEdH1kQTlHbPLG8GHQk6qtGbahN0pZBV3k2IRu2CmKkzsCzxJpLAO9wyV5x
	 siyoDT7FtegEDLqdwOgTaN1vx772qbSdve8xIgtFYwH+WgkDX0Xi7q4S5UYpi1AtmS
	 sCr+/MNh1Ik0BSEnWYrpR39rwY0/8m6K2RCEM3X//syFvt8M37CsjGqZEgG1QclHPn
	 x0qAVIAEAcqMw==
Received: from localhost (unknown [205.220.129.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 01B50408FF;
	Fri,  9 Oct 2026 15:20:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
 federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by references
In-Reply-To: <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
Date: Fri, 09 Oct 2026 09:20:18 -0600
Message-ID: <87h5iuc34d.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 09/10/2026 10:31, Sasha Levin wrote:
>> The Maintainers Summit reached consensus to deprecate the Assisted-by
>> tag. Remove the documentation requiring it.
>
> Please provide here some sort of arguments used in that summit
> consensus/discussion. This basically reverts/changes previous consensus
> [1], which is fine itself, but it lacks reasoning.
>
> [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/

I'm working on a report on the discussion, don't worry...Monday or
Tuesday probably.

jon
