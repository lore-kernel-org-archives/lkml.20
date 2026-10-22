Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684609;
	b=IActGW4GS4O/kE6fikTcS8DavdY8OpRrikaQkOvgb0xRJh7oMWq6oLPGJqscoevnIuGi
	 hHS34k/M+e1duGmKow7TvldYTx9A+ktdM9V4avn6blu/wsJ0e0yfEzxSG0zBeNXVvzBuE
	 qUhhY4YV3zroq5pEsbQnKaFNcwiXp2hjMQdyACFHnWNJm8MIMhW7cKNgqc8d2owfO/mG+
	 hUZ1kWK2rey9g6YqcXF3wVy7qmqpdFTBRVR1sKOPH4Hlx7Ydtq0gGLW39KO7uYhBuqKa8
	 bVK/FNaxX9EHcK7KZIj5j6mTBrmEUWXEUgdvY/bTKt754+tPHx++ZMwzCTzkvoX45RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684609;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=kQqslYQbtEJ7eXqkg2/pGAuY39Uz8kMMiIdDfjUmGqk=;
	b=3AgR8hDiPCQeK6cxeW8cZMuWDthBUyGHKUvdiKgwp285LeQxmKBmH5n9hR7jasndwAdg
	 nIag667q2QaERO9H3NrhDEjvh1i5DvffO83QNA6nDfoYbJof7FDsK6OusO+gHdCtv0U2f
	 AVlNPPB+5fWjIYDrq/mRokBLHnfuJfjBD/OIeaIDu/tSwF6o4Vx1CzFxhdDE23PBS1wqn
	 peoJSgBIOtlgkyk/LN1PoyjW8/ZkhdoM2lBfU3MWU62szVuAf869GVOoIwE1+CPrpx1sc
	 j/yez3RXilEwmnPaS97AXrUnd0KtZza0s+HMcqSX3GcBEz4wSDSgHWUuBz7FTpH77Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=RzD1Ug0w;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4057A606A319;
	Thu, 22 Oct 2026 15:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4057A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=RzD1Ug0w
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 62CD4415BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792684608; bh=kQqslYQbtEJ7eXqkg2/pGAuY39Uz8kMMiIdDfjUmGqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RzD1Ug0wHP1MkJ4jEutNUGT6NBSqA0C8NXFj7nPhfObZXJtjVJWjkdj64b5QQLvTi
	 WW46xJpyVmk3T6jzNSoib0WDfHEXQV75W/7COVwURxLXyi/i4DXoU8WCHeJ84BynLM
	 tVVv37ZlO/JI0BiiZs/K0PYeT+p+zLv0Wj0nQaMYPWqrWc4E4qp/dc4pe9OuSz9GSN
	 6NyJ36IPPsIsoUEGOjdzdnweeilgJnkryPOczha1EHJ5cTW+O6TVyDwEdGRQSdxRZe
	 LMBysae9e7k/wlWOn8EwdaWTUj5MvSvMWOpMO9GjovTjTYJ+ekaI1UbsUFHwQFI0/S
	 K0GeaYR3gGotg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 62CD4415BF;
	Thu, 22 Oct 2026 15:56:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Jakub
 Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc
 output
In-Reply-To: <87bj8toh7w.fsf@trenco.lwn.net>
References: <20261002230114.39651-1-kmehltretter@gmail.com>
 <8733u8w6p4.fsf@trenco.lwn.net> <20261014233956.605e0960@foz.lan>
 <atIw3EWamd4KN4VP@gmail.com> <87bj8toh7w.fsf@trenco.lwn.net>
Date: Thu, 22 Oct 2026 09:56:47 -0600
Message-ID: <87qzhh20g0.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Karl Mehltretter <kmehltretter@gmail.com> writes:
>
>> On Wed, Oct 14, 2026 at 11:46:13PM +0100, Mauro Carvalho Chehab wrote:
>>> On Wed, 14 Oct 2026 11:08:39 -0600
>>> Jonathan Corbet <corbet@lwn.net> wrote:
>>> 
>>> > Which versions of Sphinx and docutils have you tested this with?  I
>>> > needs to work across the full range of supported versions...
>>> 
>>> The minimal docutils supported is 0.16, and the minimal Sphinx
>>> supported version is 3.4.4.
>>> 
>>> You can use /tools/docs/test_doc_build.py to double check if your change
>>> is compatible with the minimal supported Sphinx/docutils versions.
>>> 
>>
>> I completed the A/B matrix using tools/docs/test_doc_build.py -f. The
>> full matrix shows the improvement without a regression. 
>>
>> I also tested Sphinx 9.0.0, 9.0.4, and 9.1.0, plus the previously
>> discussed Sphinx 9.1.0 / Docutils 0.21.2 pair.
>>
>> In total, this covered 32 combinations and 64 full htmldocs builds: A
>> unpatched and B patched.
>>
>> Successful, with identical A/B output and normalized diagnostics (26):
>>
>>   Docutils  Sphinx
>>   --------  --------------------------------------------------------
>>   0.16      3.4.3, 3.5.0, 4.0.0
>>   0.17      4.1.0, 4.3.0, 4.4.0
>>   0.17.1    4.5.0, 5.0.0, 5.1.0
>>   0.18      5.2.0
>>   0.18.1    5.3.0, 6.0.0, 6.1.0, 6.1.1, 6.2.0, 7.0.0, 7.1.0
>>   0.20      7.2.6, 7.3.0
>>   0.20.1    7.4.0, 7.4.7
>>   0.21      8.0.0
>>   0.21.1    8.1.0, 8.1.3
>>   0.21.2    8.2.0, 9.1.0
>
> That seems exhaustive, thanks :)
>
> I have buttoned things up for the first 7.4 pull, but will consider this
> for later in the merge window.

Now applied, thanks.

jon
