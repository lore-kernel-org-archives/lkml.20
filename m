Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794098009;
	b=fpBDJa7Z5fvC024zFzL0fjCSaeLnyK0NAD3MCTQE2VGk8otJihXgu5R7DFtJ6vRWUo0m
	 22VgjP3a3H9eoRVpJROPUdQCO2ZiFTPT3Xb0GMxz+egcMFWj2FQER9bw+jNdR1jkiF9rv
	 HHDsDhxggjK6dc0QU/pJDqzHLNBS4WD5DxiGoU8qKUc2esAz3U+8AgCEIPtAqp8/beX75
	 QlxocLHY/wQtJWF02lN+yZB7foXw3ytRwuZ/maVptGKNwSIWZL3+jlGz4yu5IjL+zJ8aK
	 QP9PiFlKqUR7l9uKr/xJNQrA5WNCA3fkja8tej+wL/uavisRLhJzrX48n+Tf+5eP+IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794098009;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kmST5SxyWdqoxgmZ7dpias+E9CODkl5gXOtzoBLQgkw=;
	b=i4hrYdXaFdato+cPUX2ssX4CMFuMZj+xDXLCFYnxEs41Y9NZApt9mxOnKOMwY/zJBiAt
	 GJopXeYVZ3w8qeI+OMQVpN2YNdOfbMKtY48nOdDJkoVBdBKHX0fe025N5CNOLM3fUz80S
	 Y5IgW90bI77ARM/88WnEiOEKLfPkKog5ZQZs0AOTd0+H7TAh+UrfutrL31T+Y8/+XEfar
	 f4x1JPF/ryVzf5jfi/bWuSEmkuFVMAV4j77EbQPwvUXrqu24c6rkGynmoP4OSYiNoRgde
	 tKZZaVe5+9vUzVcDccVTdm7nsJCXWaVp24lSDHyofMhREqMmMUd3cLJvM74GSyEnnyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQO0pEYl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB70606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 00:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQO0pEYl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21E71F0089F;
	Sun,  8 Nov 2026 00:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794098008;
	bh=kmST5SxyWdqoxgmZ7dpias+E9CODkl5gXOtzoBLQgkw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TQO0pEYlhrtdqW/6QHSjfE/PgxdsldEp5fR5mm7aqvafRrNpd1P3jWEpUmDsh58Pp
	 p0Jkb7birrCeBNsRSGi9HURorB1RPvuFkDmUGEYJpI42kamXurrdQb6PYmhYh5KXKv
	 OVLLSdddGQwKn7/aLiSRGWLmdu+v75X6dBHQRa1YxSkXMFuLo1UjSIwhybxHynw46J
	 gGxzIAHbkmZkMfMHmNAi4Dslb0nfOoxIA66Z4BD9Go230DRtXbrL/7kQ/FuISE/shd
	 EzRPz6ptsk4269S3paJkx3Z7r9WGPe4ec4CEzh3oLBOnihYGWuyZHcjXagIVPODf5b
	 JAXdlPgvnUlCQ==
Message-ID: <a309cd65-afff-4c7e-8560-8b43f4f77fd5@kernel.org>
Date: Sat, 7 Nov 2026 16:33:26 -0800
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
Subject: Re: [PATCH v2 1/3] lib: extract 32bit mul/div helpers from nios2 into
 GENERIC_LIB
To: Simon Schuster <schuster.simon@siemens-energy.com>,
 Vineet Gupta <vgupta@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 David Laight <david.laight.linux@gmail.com>
References: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
 <20261103-nios2-remove-usage-of-libgcc-v2-1-5fabbedc49ec@siemens-energy.com>
 <bba7f6da-82ee-46cc-bd8f-b0e3e027f5e2@kernel.org>
 <20261106130738.avum4t2nhdnmenyu@dev-vm-schuster>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20261106130738.avum4t2nhdnmenyu@dev-vm-schuster>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 05:07, Simon Schuster wrote:
> Hello Vineet,
>
> On Tue, Nov 03, 2026 at 08:23:23PM -0800, Vineet Gupta wrote:
>>> +/*
>>> + * Software 32-bit multiply for cores built without the hardware multiplier.
>>> + */
>>> +s32 notrace __mulsi3(s32 a, s32 b);
>>> +s32 notrace __divsi3(s32 a, s32 b);
>>> +s32 notrace __udivsi3(s32 a, s32 b);
>>> +s32 notrace __modsi3(s32 a, s32 b);
>>> +s32 notrace __umodsi3(s32 a, s32 b);
>> Shouldn't the 'u' prefixed functions have unsigned int args, result.
>> It seems libgcc/?divmod.c doesn't but ARC does have nint_t for those which
>> is unsigned.
>> Nios it seems was removed from gcc?
> As David has correctly pointed out, nios2 was dropped from gcc with
> release line 14.y being the last one to contain it.
> So at least for nios2, it seems like it has always been the case that
> __udivsi3/__umodsi3 were declared as taking and returning SItypes:
>
> https://github.com/gcc-mirror/gcc/blob/releases/gcc-14/libgcc/config/nios2/lib2-divmod.c#L106
>
> Given that both implementations continue to pass it through to a very
> similarly looking udivmodsi4 as u32, I would assume that this has partly
> relied on 'why should the compiler do any strange upcasts here, it will
> just pass through the registers and be done with it and this is
> implementation-defined-good-enough', so I would not mind rolling a v3
> with u32s for __umodsi3 and __udivsi3. Are these the only two symbols
> you are concerned about, and would these signatures work for you?
>
> u32 notrace __udivsi3(u32 a, u32 b);
> u32 notrace __umodsi3(u32 a, u32 b);

Yep that's what I had in my local version.

Thx,
-Vineet
