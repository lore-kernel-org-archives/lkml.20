Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776216;
	b=tyX7JGECH4fZ+ka9c9g+wq1gtdfDrZNVksUTMgPTeGzwU5ZvFrqX6Utm7TTF0J1qiHqY
	 ERe/3w0fWrkglTCaJa9dO1tfIMv6L1WFVHh5D7/iiflQXWt8I2odmKPs54k7fob/Ag9nj
	 iOduz7YJgmOq1oo4rQYO3vk2yC2mVLL+6Rx+knqOHvRXvftEDho/KN+HAaYCjn6nfGIBC
	 oyL//0cPytkRBcLvSNR/Uur9jGrvIdmvHfZfT55B3NGWFfEQMDLmpzJCCK8H13hXYGrri
	 iKI1EKJiqlxOPR8nf9bpxxgns6HjQuPDdQwKmk1CBDQMuKsUmcsuPSP64aWmUrJjSIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776216;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=S0BHfFduDwTHFEISNw42NSLvoYXkrHxyD6q47x8m6Vs=;
	b=ZyxA4Klo9KgdmOcgEZIhQliN+zM7+57zdIZ+rZt4vHvsP2xvakvKxWA6M9vWYb5OzY9n
	 edibrczIi8BYiGMuQ9LxV6WiJ0AkJs62/B+WQKks9VTNpCvVw0jb2HrC0RmxyuQcUEz/c
	 sbOKoLuKwkKlUMDqgfYVHIIgSpvGTY5obIM62n0/k5iEYItpXPW3QeNmOiTbzt7Txaa31
	 BXp9XvseNjt/opSuaexuLW8YDGBQMR7tWHfDJ+hePZHDd40Y0jbcqZ1bUyN0GJVKF+ZMM
	 MKarWBKuAPNLseeDtE8ehnukKrN5U2vV73CL31RGPp2T19SVUUn+KnZGKD7LyFGOW6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbyfBbjs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2A2606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbyfBbjs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584741F0093A;
	Wed,  4 Nov 2026 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776215;
	bh=S0BHfFduDwTHFEISNw42NSLvoYXkrHxyD6q47x8m6Vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZbyfBbjs17XLoV6p/ay/lNXPhlbnq+tSh1JBbEiFiKvodNIwbiTJyJgMNN0X1uERt
	 KrMgQCa7p/LDYCWAM8UTKIaaTS7hkCO+vj+1T4C1e75OPj5IRBRZ2o1QiteNKeGsH6
	 eoJ98VeLk+VSF80+3LXbcMSA7TfIHtOxtu6qJhXgjFfVzqiYrRpbjR0p+/BaxA5cey
	 lSTyKwRQziFh6lCAsw2kN0hThRwHlt3xps6ZTby01oq2s1r7ZVPyXWvJoFdOLPJ0pL
	 xJrQbh1/x58tzTLkE4IDuN8YMOCRN25XuaVskaxHHdv7+7DVlRQxbYdBXAFUlgBEpd
	 KZd5JtiG51i3w==
Date: Wed, 4 Nov 2026 08:10:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dca: unregister the provider when domain allocation fails
Message-ID: <20261104-quixotic-vigilant-skua-193fe6@quoll>
References: <20261104032501.1554137-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104032501.1554137-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 03:25:01 +0000, Wentao Liang wrote:
> register_dca_provider() registers the provider in sysfs and in the
> provider IDR before it tries to create a new domain.  If the domain
> allocation fails, the function returns -ENODEV without calling
> dca_sysfs_remove_provider(), so the IDR entry and the sysfs device stay
> registered while the caller frees the provider, leaving a dangling
> pointer behind that a later lookup can dereference.
> 
> Remove the sysfs and IDR registration before bailing out, matching what
> the adjacent error path already does.
> 
> Fixes: a1741e7fcbc1 ("locking, drivers/dca: Annotate dca_lock as raw")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/dca/dca-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




