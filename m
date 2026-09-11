Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB4345D91E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115173; cv=none; b=L2TBiYOlBXuBHJ6FCZffYQp6yp4uRVlxGSU+E5XR24tOpyNF+FppHtfAXxr7tcPlcTZm41qthCyhbme+7pUUG4h5cbeMy45bCmHb4xSzNShmiT9eIXWYr2LvHYhy1d278Inp/lwvHd2I4XE0HSH+whW7N8h2mMOyJNft7ZECpOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115173; c=relaxed/simple;
	bh=2kvGXRAqVZDcJZKczMh3qqj+fDfIG86LBpesa05gpG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID; b=AXB3y2L1MxqDkVNAy1QN0+mNWrJOGcxZJl6tLgPjsJMhTZOO8WgtOstPh5zYz+dGOpZAvmA0xQ2/xW0t3xm7lotT/Gx2AMjULZwiAsu/56fla9f6sSc0+bumB0FN919Mis3FPObQF3LuK3NvbXuYukU4EOLPMn4oXfN6V5DIJuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quKZSaGF; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quKZSaGF"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398b3d66515so837850a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789115166; x=1789719966; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bjhH5Fnhw/BjVRr46A9maSwy2qrf+Pc0uw9RKK3CLk0=;
        b=quKZSaGF93hs7rETyRK4CmpTYwhlZ/iEVdVIuGM9Ikrf2SrzG0uI7t52DaYGDU8qp8
         +Db0MBVeUeyI68MmJlfZbq2TzRRZwtq7/NzMZfEl03ky/ET11v+ExP4CMx3yPUzsLOfO
         MlsbH81EUKeYDLHdmofg09HfGfhYRg1ysoH6QQCwZkLLmPBastpLtYO7qfGj3MBuOC7C
         Pu6mxrvZa/RkmK6QkTvu2aOysoAQe/vu+zs2twyKEyultLc+pIieM+Q1eEdXBVUXRqtD
         hKyTRPFQrDA37dIY6+iUx6O3NjASzSriwFhRdZerXskbwJ7euQ4HVpZhc6wF/jak8PWK
         Wu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789115166; x=1789719966;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjhH5Fnhw/BjVRr46A9maSwy2qrf+Pc0uw9RKK3CLk0=;
        b=nGPrEaMeT0WG67OuEyF5XXJWO/xNgzGHsoSlwW69fZMkLa1vrxcR9PWVmgMnzXZ3XV
         Tgz+KosFnuODmDrhAyzciVSMoYoXoImCW67bXCSEZYjqZXUoXKJE2gqEHpvX7Hay83WV
         JjxszAndbqhpFGbB0QzFW1H28IdxOt7wUV7WDZbjTaIsBWCIz5wiUCC9VwkVwzaLEAgT
         RMM5utL3i7299raMzK6YnzQG5SJRpbIwe75PZs7aof00Spa5W25w9G+KPBx6EoGM3NiK
         oxfJbXe1lovNuHdoThwchxJJ3ZBtZVH0FILHSMTGqpYu5PKv58fgsCOkcZvMOyvg8Ep/
         dWLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjCr8oR4U0IdUF0LuTvAP5yk6fArNN5Gg8yFn1WuMZCgFrCcCdkIvoo1gCVE85qd5C2fKCubqtgEdzeRw=@vger.kernel.org
X-Gm-Message-State: AFuF++kgKt3tZS6O+LzCrNj35Y6AVgX226Q1mpycuEtf3Y/ukJCwZg1F
	7wRslY7j+lnTvs5dngDjineCa0ot1wRPoZT5NlwMatHILBb6NzUBp4RR
X-Gm-Gg: AYBFou1DQ1nju7NJBPOzHWKDxUwvjFjxEoDPzE/7nyWChAPgLw5caBSL4ljeg2N0IIQ
	MUZ7IfecfWTdThbrBnxz6Gz629jiR/55myPufwOol+hYdVUAhJhr1cGrc6Jkr9UeEIxhVg6jXn6
	xkumOae1WmpgTaZYbd032a5MDN7XH5m9vkq9vZTOYpGjzKOufFeS+fQbq9zGhgejU8pMseBYGSp
	MXJjLN1+1as5D+I2OFeP5XkVn9LU6BePAp8yG78op1KZsEDkYSisLkC7LTjwyDiBMubCu3dUyd1
	9Ch5MqLd7qgg17GvO7wD+KoV9hH07szeFUJNKVjRjc1iDMOr4Nnf4nMbBFkuqo//7YY9JmpHGpG
	FlJs7mPoeJdF2h8PQBh75OQPgv5tQBt9uX0CPQu9ZicwRK4MRZvHiecrExCm5MUO8oJdUumiPwM
	2dLGwk4v6TdYGsKQj7I0/ArFkZSi6nLMhbbGLKOzs/vZeCPfLGXtGPNOqjvBRIaO4+LAQz0WqJW
	BgDeF4IrCQLqGfGF4rANgUykA==
X-Received: by 2002:a17:90b:1648:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39d9bec50b9mr4918364a91.10.1789115166444;
        Fri, 11 Sep 2026 01:26:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm1308649eec.8.2026.09.11.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:26:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: kvm: fix repeated word 'is' in comment
In-Reply-To:
 <CA+EHjTwW64qwPPAY7GpGWnW7kTHgK+NOycPD+ztZLu8MxhKEgg@mail.gmail.com>
References: <20260904122445.31163-1-hemanth.selam@gmail.com>
 <20260904122445.31163-4-hemanth.selam@gmail.com>
 <CA+EHjTwW64qwPPAY7GpGWnW7kTHgK+NOycPD+ztZLu8MxhKEgg@mail.gmail.com>
Date: Fri, 11 Sep 2026 13:55:59 +0530
Message-ID: <178911515996.474202.18153234548688379981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Fri, 4 Sept 2026 at 13:46, Fuad Tabba wrote:
> The typo here is that the first "is" should have been an "it", rather
> than being a duplicate.

You are right, and the patch as I sent it makes the sentence worse
rather than better.  Please drop 3/3; it should not be applied.

I should have read the sentence instead of the checkpatch warning, and
Andrew made the same point in this thread.  I have stopped treating that
warning as a list of things to fix.

The comment still reads "assumes that is is run from EL2".  If you would
like the correction, the line should be:

   * This code assumes that it is run from EL2, and that it is part of

and I will send it as a single patch, or leave it for whoever next
touches the file, whichever you prefer.

Thanks for catching it,
Hemanth

