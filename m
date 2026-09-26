Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9C8126C02;
	Sat, 26 Sep 2026 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790435782; cv=none; b=b8V7KgBvZNNsXxQyYzEwD7uaAv2W/0AGr6tCLWeinmMuSYKNCbixET9zuqbq04TQkuoCGYq2oZ93/Dc8P2mYAyxP8wG+MGAQ75/LQiblIfSivMRUCo3mxBmAuQ1aacZLTk6xnNZ641fFM2RmuapEggnKJI5ExmHlyOok9Ka9hHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790435782; c=relaxed/simple;
	bh=t4vWu3B9ZEwE7hnyuf1Ijn9YMK82c4KZ/+1eVqcnips=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jtgkaq0Hw5zcsjwOYzjHrJrMF5XFtZ3eyK+kF8njJHwLDRrt7UrvhMxj+r6jC1EHZqRQe4Tn59Dnop2RhcgSSsZKRs6IxBUxBikz8w/TZQcRkUWwwy0pPAQY4Wdrq9ReqSGrJgZMfdVdvOf9DLgqhaTB32FNKlpI0YhkuU8jpl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hjsTco3l; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hjsTco3l"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E70ED408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790435774; bh=64FoRmQNRaTNoDkYZDUJCuDx2ju8jS6sOgONL7BMKPs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hjsTco3lrEWAcWaJZFzB1us1B3TxAwzyYOpRr7l2yrt4FcQPcp5nJy+ftKZf6xsCx
	 YLhokfAqobwaxZu9/b9VGeXiY5vGz5CQwvuVHNN9XDjuMDw0wfWu0+lXPwoFrHlUKN
	 8R0scZRIi9RzsHIwaVUQxCb2Yk+77fcQErgxChsELvABiLUp4pm8qBBMvvaMuI6TOF
	 nxQ00rGCC+1p0BRj/kwhspP8hflzUUg/KBqe41NS/UpfjazIqFPfKGV+yjFUo+dgbN
	 qkvd4rmJ1bP/cQhIVWsTnnQe83VcrstRxhqAKLt+q6CYfw8oejlpzxFabbBBpn3pZy
	 1h0zyI9oGum+A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E70ED408B3;
	Sat, 26 Sep 2026 15:16:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>, bvanassche@acm.org
Cc: peterz@infradead.org, elver@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 rdunlap@infradead.org, mchehab@kernel.org, aleksandr.loktionov@intel.com,
 kees@kernel.org, tudor.ambarus@linaro.org
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct
 declaration
In-Reply-To: <20260926095405.56438-1-emmaonana18@gmail.com>
References: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org>
 <20260926095405.56438-1-emmaonana18@gmail.com>
Date: Sat, 26 Sep 2026 09:16:13 -0600
Message-ID: <87o6dk3uwy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com> writes:

>> +context_lock_struct(debugfs_cancellation);
>> ...
>> -context_lock_struct(debugfs_cancellation) {
>> +struct debugfs_cancellation {
>
> I still think the tool-side fix is the better route: `debugfs_cancellation`
> is the only one with a kernel-doc comment today, but the next comment
> added above any of the others would hit the same error, and we'd be
> fixing the same warning again.
>
> The part that really sold me on changing the tool was a general ordering
> issue in `dump_struct()`: unlike `dump_var()` and `dump_function()`, it
> applied the transforms only to the members after `split_struct_proto()`,
> so they could never repair the declaration line itself. Moving the
> transform earlier fixes that, and a full-tree A/B test removes the
> existing warning without adding any new ones.
>
> Would you and Marco prefer the tool-side fix, or should I respin with the
> `debugfs.h` change?

I think that making the docs tools more robust, and avoiding the forcing
of code changes to make the tools happy, are good things, so I am
inclined to accept this change.

Omokefe, I have to ask: did you write this patch yourself, or was there
LLM assistance as well?  In the latter case, it needs an Assisted-by
tag.

Thanks,

jon
