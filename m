Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2940D2F12DA
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621275; cv=none; b=GXHE+k5Rqke5Lk2wzdheURNxw7BhewaXjMKbpqZSoBtrksseeMvQjoPjM9lDsphV0hIlR2Y6c60DIx3N+oBL3h4wC7bcwfUY2ogvaTySSP24qo/9hFZdqSU8Ox0l+EnRhGZlm6Dsefipz/V77+IjV2+8rn9C/V6KsqJ9i7YSscw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621275; c=relaxed/simple;
	bh=TEwsiz8Ih8v3OgTNM9+K8zciWuPTlmI3xhjKYBAsVxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIdA4Dqp2rVSw8ZeZ5pSN/1+Ld1SLlh33IxeDHdIFZoBmYAnN8yuvTOw2z/YDOeapOBPHZUDRsjCzDkTnWx+Ps0Oqe4w4DoDxODgEsUn2ZKw1szcSLSKGhemoSgxKXs8RshoxHswur0y6t8mKNFhgjYiXMtZoY2eIDMJsSJJhQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLwN4DSz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLwN4DSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBED01F000FF
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791621272;
	bh=TEwsiz8Ih8v3OgTNM9+K8zciWuPTlmI3xhjKYBAsVxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PLwN4DSz+MbyaaTzYh3u8g0wC64SUgovp4AoIBMOd9SPEdz6u2hARWRz9WWxijN3W
	 UR/gBhkCVcaoSurICwD6lOfueyQ1oZ2YL/fguByVgHrNnJk273g7XAg5aZpW9gTjAP
	 a52T4c2CYMI19kZmwnwKxgcWLElTYfyoI5JhXNXe97ZJim9HKFspf/2PpjFyGeuGZc
	 6Lpal+n5DI+NdOkG017ggougwllBVdenoN/RA7SgrfWLwQGmCQMNiWZMy4w71z7mhg
	 zMWKPVbWRrldNu0VUOzM10zQDv2XQdVsdPrBQsgr+8WUTi86qtvfBM2y8Jzdev5kQv
	 uSGKriIjhFN7A==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48eee44b908so336947fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:34:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz27MH1U21BDFlnaS/iQTZBW/RZBQL+gpAUxt083kmx7jNOAPxsq8CEv9lCY+r/mUn7FP6uw8aoAshaDdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXvvtSk6hwTCOCO5Z7sE2omYhdhk69iLTBv04DC0sjefCmYCbe
	HDY01BM0tLP52fqEQf3hj5XdIRT2nF580vYKcsEwhDe9Eg+mvevMEzRKRixLcwQ50aTPuZqFf2G
	/RgeWQcpmijCxiaIx7Ar5ga1C8A4vqGM=
X-Received: by 2002:a05:6870:8a08:b0:494:b8f4:9a14 with SMTP id
 586e51a60fabf-4a2a8687b27mr3915629fac.6.1791621272059; Sat, 10 Oct 2026
 01:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008011359.63727-2-kylebot@openai.com>
In-Reply-To: <20261008011359.63727-2-kylebot@openai.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 10 Oct 2026 10:34:21 +0200
X-Gmail-Original-Message-ID: <CAL4Wiip1pwoyjOsCV2e9Bx7UJWY2mt+J28F3pc8huPEEVkavvA@mail.gmail.com>
X-Gm-Features: AclHuK9Y16wwCvAHyVouHe-_1ye9UA8IcdE1MMFK7IiU4cuP3BwSdjMWrWJExjQ
Message-ID: <CAL4Wiip1pwoyjOsCV2e9Bx7UJWY2mt+J28F3pc8huPEEVkavvA@mail.gmail.com>
Subject: Re: [PATCH net v2] netlink: avoid hashing the network namespace pointer
To: Kyle Zeng <kylebot@openai.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, outbounddisclosures@openai.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 8 oct. 2026 =C3=A0 03:14, Kyle Zeng <kylebot@openai.com> a =C3=A9cr=
it :
>
> The netlink rhashtable key includes a raw struct net pointer and a
> user-controlled port ID. Both /proc/net/netlink and socket diagnostics
> expose the table's bucket order. By binding and rebinding chosen
> NETLINK_USERSOCK port IDs, an unprivileged reader can distinguish equal
> buckets and recover the low bits of the Jenkins hash. Its 32-bit seed
> and the limited set of kernel-image slides can then be searched offline
> to recover the address of init_net.
>
> Use the namespace's unique, non-address net_cookie in the comparison
> key instead. It is assigned before the per-net initializers run and
> remains unchanged for the namespace's lifetime. The lookup key and
> object hash are still built by netlink_compare_arg_init(), keeping
> lookup, insertion, removal and rehashing consistent while preserving
> namespace separation. Neither public table walker needs to change.
>
> Reading the socket's namespace cookie in netlink_compare() is safe
> under RCU, including during namespace teardown. netlink_release()
> removes the socket from the hash table and defers its final put with
> call_rcu(). cleanup_net() runs the per-net exit methods and waits for
> outstanding RCU callbacks with rcu_barrier() before freeing namespace
> storage.
>
> Unlike ns.ns_id, net_cookie is also available and initialized during
> setup_net() in older stable kernels, making the change straightforward
> to backport to v5.15 and later.
>
> Fixes: c428ecd1a21f ("netlink: Move namespace into hash key")
> Assisted-by: LLM
> Signed-off-by: Kyle Zeng <kylebot@openai.com>
> ---
>
> Changes in v2:
> - Use net_cookie for compatibility with older stable kernels.
> - Name the key field net_cookie to avoid confusion with netns IDs.
> - Explain the RCU lifetime of the socket and network namespace.

Please next time add a Link to the prior version, and/or maybe give
credits to reviewers ideas,
this is something that humans care for.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
