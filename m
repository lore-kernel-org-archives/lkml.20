Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB65427FA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190143; cv=none; b=ZjEJvVRAuHwZ7fxmpgT2VlqtQBOUvmm3WtjevRqfDEa+rgKOm3EmwnHWry31UHMK5A479LLy665zGSr1Ha78HeUlXBrBOYC7Yd6NlmRb05k/qavqhAnNqLILAwaMnpkPqtKThCnZBpVXDZF3F8mBLhE2U5iiZFQdJ+1oZYATM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190143; c=relaxed/simple;
	bh=AOPkpmlru9z/R5HME2uR2o9uvHSAkwTBymd5hIWm4vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSFeJzKaB1jR7nTQfiy7I/F0Y91A31bEeVSZ3DIwCqHrKp7C4zq6sffiMenCkGqZRzcq7djRv/tsSya9TqIqIEh6OXoq88VBC1yihG0Mdh7ZXUFaDN+VoByYLeRw9WIg5Xm2TDK9eEiUjhvJ0ONJOSobRD8u6r7G3C8jJlIzm7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZr5obj7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZr5obj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02CC1F00ADB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788190141;
	bh=AOPkpmlru9z/R5HME2uR2o9uvHSAkwTBymd5hIWm4vw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PZr5obj74iI2yRG1erlOg0ixBUSXQ5+W/goLH+PNWarpYQYt/4eKssQjEW5cnCSnR
	 uDT76lIzIDeHYJzM4qV+gkZ1nvMayWm53Z9X9Vmu+I4eqJmq/rUr4t8IQgeLdO+m28
	 0LvFCFmB3m6j2s+k08hdLDkXe7G0PBTnvUQDa3jb10P7lM/myGRKo+t3lQoWUCd620
	 0XaSsV+YxMVMvZeETfUZHcwEeT9IKFExi0P/u70Jdwp964XT5Rdt26YLWF7GHq4Qx5
	 P1lW99I8rByAEqlu5u5um4rVZw8vhCEZZnCDgecEdgtzIDRBTwP2xqiqR/VTpjDBhz
	 1q9h3CK8GQB1g==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2533d83e3bso600644766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:29:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqXe6/MfxBJGm6ty/mT7l49gbdiHk7kvK7j7LDg18g5F9toDlEfWop8W83NgyqNHIeXNHvY4MT3WmUhnA0=@vger.kernel.org
X-Gm-Message-State: AFuF++k8yJs9VosKNgzfY7aghX6/KL8pl4Qzu1QOJRzYkWwztiCqeouW
	cYqMQZyUgjyM4bI4gHYvQMQsrPrPgx5hk9M20dMEwpZ19RJJxT3zlqAe/Jt1h68hqNe3X8VqBN5
	81yUKkAxv4h8OD5S1rCUQ7s6Z4FEVapQ=
X-Received: by 2002:a17:907:3c93:b0:c25:30ec:bec3 with SMTP id
 a640c23a62f3a-c25b3be4d0emr99362366b.8.1788190140473; Mon, 31 Aug 2026
 08:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <20260830114731.8322-3-wujianyue000@gmail.com>
In-Reply-To: <20260830114731.8322-3-wujianyue000@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 31 Aug 2026 08:28:48 -0700
X-Gmail-Original-Message-ID: <CAO9r8zO2=jFCWi1sOnG6-7BHpipaOk39BvidOhgc9teU4=An4g@mail.gmail.com>
X-Gm-Features: AcwNN1WiqXZX0xUWfhOyFt6aWO50yX4NiX5jnep3OaZPKrV3GzShT5JH5NZ16os
Message-ID: <CAO9r8zO2=jFCWi1sOnG6-7BHpipaOk39BvidOhgc9teU4=An4g@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/3] mm/zswap: replace the zswap_pools list with a
 fixed pools array
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 4:47=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com>=
 wrote:
>
> Originally zswap holds its pools on an RCU list whose head also serves
> as the "current pool". Only a handful of pools are ever live at once,
> since a new pool is only created when the compressor is (re)set and
> pools are reused across compressor switches.
>
> Hold the pools in a fixed ZSWAP_MAX_POOLS-element array so each pool
> has a stable slot number, and track the current pool with a separate
> rcu-protected pointer.
>
> Slot 0 is intentionally left unused (always NULL): a zeroed or
> incorrectly initialized pool index then resolves to NULL and trips a
> WARN rather than silently aliasing a live pool in another slot.
>
> The array keeps the same RCU publish/retire discipline the list had,
> so lookup and teardown stay equivalent. A fully-constructed pool is
> stored into its slot as the last step of zswap_pool_create(), so array
> walkers only ever observe a NULL slot or a ready pool. Pool creation
> is serialized by the module-wide kernel param mutex (all built-in
> params share one lock) and otherwise only happens during
> single-threaded init, so no two creators race for a slot.
> zswap_pools_lock still serializes the store against a retiring pool
> clearing its slot in __zswap_pool_empty().
>
> Behavior change: the fixed array bounds the number of simultaneously
> live pools at ZSWAP_MAX_POOLS - 1 (15, since slot 0 is reserved),
> whereas the old list was unbounded. A pool is only live while it is
> the current pool or still has stored pages referencing it, and pools
> are reused across compressor switches, so 15 is far more than any real
> configuration needs. Once all slots are occupied, creating a pool for
> a 16th distinct compressor fails: zswap_pool_create() errors and
> returns NULL, and the compressor switch is rejected with -EINVAL
> rather than silently succeeding. The cap can be raised by increasing
> ZSWAP_MAX_POOLS (bounded by the u8 slot index, so up to 256).
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Acked-by: Yosry Ahmed <yosry@kernel.org>
