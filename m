Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792624656;
	b=jT2bJeZKiGPwBGHmlT9UEHgLLsoYtczlqB1izziIoHGWcVfD6T8NKv9qortEBCcSY56Y
	 VJXU3zuIlUISIYW2gI7pODUCAN793h8MeZ2DmrgUnnEKOlmxsnizGOstNWpAEjRNOwIHV
	 cBK6jAcGSEgm1icHr+N54pj3v1EeVz0QIgIpINOfMSEscAGROa36VsnWbmOvkxlIOks9T
	 5BpX1Jzw214QL+uzTKKapB3gLVtIxOMHB1xFoDwNKaqK4UoiaU9pqGPh89TFGkcvLida4
	 LzNVSsamD6idBK/7CMuzS4UyhFx7ml1ww12dsYDFYuq7V758wqEIb7qJaVrHwBRc6lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792624656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lY6ateJ8HoOldOVrxlHhBNu0dJYaIqqKKUkZiKAttn0=;
	b=Tar6u3fry1eagSwfMYkKnp7bZTFvvzzpCiRRBy6qvhV0Dh36ZAquJWBF3Z/kG/s0KP6J
	 sw/g800q7goUJ3p4Gh2/jvYe2T+mOeeZnQlsiFuDmFa63aZlzg/+WtlRcZ7gApNI+U9Og
	 eIXa0KXAjzuZrChRJkTqNBVc978FbwNTq4ieQ5OiSzREtuMd8LzOcp4E9xT6vNP5nB4gy
	 J1EyceqkY4u0a5YhGd3W2fQfWti+Ch3/NTv1E8ERX6xD6ghSngTlfDLwtzZPe80fo0cSj
	 xLXEXmRa/F7n2lZmzwyteVy0/8UJt79yvNWAVyeVqq0lj+JZzQJt3IAms3f9n05FBww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="g/bQ6o/7";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F4606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g/bQ6o/7
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1076960a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792624650; x=1793229450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lY6ateJ8HoOldOVrxlHhBNu0dJYaIqqKKUkZiKAttn0=;
        b=g/bQ6o/7g4dMFGgqWKRYEYUUXHE6B+8vGdyVy7kua5ZduXUK9y57+JSv1pe8l8EoVs
         tF2VNhDi51sKdqkUUdwOhN26Nmr8dhoq3cNfBMzq19qs55I8IF5r0DbWT4Aayclm4RMi
         8ZjjLe1qtfxPbwTdKCrrcs77KtcNasXI2KPOdFIzquHE0SazyyT1uuc2/Ns2zKjKcFk1
         SdGMvJzJQIsiFutvLRlPCr6Lw4S1oVyYIGGV8j0yShYp6ZkzVvPqUY+pEPvraMGzGD2x
         GDmyE1cZLg1pmhWsYZIhB8oW4w/DBViZQWnGHQQJwjfN6P8W4fO31VBU1cok/2djVHPI
         2Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792624650; x=1793229450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lY6ateJ8HoOldOVrxlHhBNu0dJYaIqqKKUkZiKAttn0=;
        b=tGUp7HlX9aJeX5dt0TjPCN+a3BurvFRVWlVtgdwqljZKBQCEHtSWrBWB0Xgh6WOQF/
         wm+g3wFJNYinkfgFCykM8YW/pBLQNlIlh5MF4qlS8Aw6BNvCDUtOWrnT7PSM5qZsfAXg
         95Z7fzLuJFiH1uoABuN9TILyAj40ugJTs++iI768hVduQKgixSioNnJcckdM//aUmJr0
         3ZEFuRSXshxOxxag3kmHO8AYjiBPJwZlVBBpoID54gFgvJ7FPz48GH/JXlp0Dl8/UK59
         tPU2ju1a00uy3RMaPTpWoSmlwgwRKvEMlEKrPO6sMTG3MCxFUA0C344TvjC38QBTbqfx
         dfrw==
X-Forwarded-Encrypted: i=1; AKwUvBwKbij6pOjltlVRV/w2QogLSvHktz609wkXQfmZUaTCQCkl1NbEvDfMhFMQVVHlDaPxWhMKx6QTfMMWaaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJayKKRyb/mQt7n8Z0GjkgnS6nhR/Lo5qNIwO8WBhK939eCRgcv
	fwFJewdrxmklbp3x0sAmbBI9Ee5vz7Qr+RJnwe8kbNkYWjaEPgP8xNxS
X-Gm-Gg: AYBFou3LT9p5rPwuR8aHqEuGLx4nY0arIvWlkxVhHdNtiHMMe2DR3RcZ8aFcN16uAol
	Qoq/VNv1CnzSP2syuRuOO5hKz4OBCppzD3QCjJv80pREyOeWp+/srwXKSA1ygo1NCHM8Y8YqF65
	oHReYYMtZ2RMhvb3jbvsdPWA2NsJddZLc9rUiQtsEZKLslvrVwIJV4w288H0k5zeYd6uEKXhVdg
	q0ARkFusbmpCS6ALmpLyStQ2qOfBvBJ4HJ6WxwymOVNL/B2S4EVFk7lMrY5REvGZXaugRDmcK3F
	PxH3NSwCVXBiYt0/QMFbUPPGKmbpSaZXRoAapRSXcgHgwkZYiMj2c+OMtoUsCI/Esr879RmIqhb
	jdOJlliW5GYLOWDdKfuzqTC13sQ4AJZZY0zNP9ZjnwhGktkG1ddJzeUa4rprPY12dNSTNJCPQa1
	id7XoPCeNn9NvVTfWOv5LmoYGxLr3+tJyY+oa4H/a0MnWbziycoCN3j6l0c7csFNnOAIpMp9ge9
	nJvw13+MiAN4TK00+ioP5bdGaAVpgoAR6H7lJ1scVokDoH+r3CMj2FPNqYG
X-Received: by 2002:a17:90b:4b8b:b0:3ac:c03a:38b0 with SMTP id 98e67ed59e1d1-3ad86dcaf71mr2917316a91.8.1792624650002;
        Wed, 21 Oct 2026 16:17:30 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada47f1b8fsm1343576a91.0.2026.10.21.16.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:17:27 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jose E. Marchesi" <jose.marchesi@oracle.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Simon Horman <horms@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] unroll: Make unrolled, unrolled_full and unrolled_none function-like
Date: Thu, 22 Oct 2026 07:16:32 +0800
Message-Id: <20261021231632.687227-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0a38e0b0-2508-41c1-bd99-d15c27579307@intel.com>
References: <20261016025613.2690485-1-shingekinocore@gmail.com> <0a38e0b0-2508-41c1-bd99-d15c27579307@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 21, 2026 at 05:02:30PM +0200, Alexander Lobakin wrote:
> We have either plain-named attributes like `notrace` (BTW what if you
> name your variable as `notrace`?) or underscored like `__always_inline`.
> If you really need to name your variables `unrolled`, then I'd expect
> changing these macros to `__unrolled` etc, not to `unrolled()`.
> Although I'm not sure we really need it, there's tons of such macros in
> the kernel -- try naming your variable `current`.

A variable named notrace or current fails to build, and so does one
named unrolled_full. The one that worries me is unrolled: on GCC it
expands to an empty _Pragma(), so a function parameter of that name
compiles with only -Wunknown-pragmas warnings (not errors without
CONFIG_WERROR) and silently loses its name:

	int add(int unrolled, int x) { return unrolled + x; }

builds as "return x;" with GCC 11 to 16 (Clang rejects it). Nothing in
the tree does that today; this is about not leaving the trap for the
next file that includes <linux/unroll.h>.

I see three ways to close it:

1. This patch: make the three macros function-like, as unrolled_count()
   and UNROLL() already are. Variables, members and parameters with
   these names are then left alone. Cost: an attribute that looks like
   a call.

2. Your suggestion: rename them to __unrolled, __unrolled_full and
   __unrolled_none, like __always_inline. The attribute syntax stays,
   and nobody names a variable that way. Cost: inconsistent names,
   unless unrolled_count() is renamed as well.

3. Drop unrolled and unrolled_none, which have no users. This removes
   the silent case and touches only unroll.h; a variable named
   unrolled_full still fails to build, but with an error, not silently.

Which would you prefer? I can send v2 for 2 or 3, or leave 1 as posted.

Thanks,
Tzu-Ching
