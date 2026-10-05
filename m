Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46444DA9CA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220672; cv=none; b=XpbRn4WhbdSyoxf3lix+IzLDiOE9Ex+z7LWeS/G5ysSvoPwjOoZOGHyh7f9CWMK1JWU3YINCGCcBy5GvStbhHS18OnkzRs+wEP9LQR+JWXcoplB3qe8QmgUsgYJQ+XqT94VEQcvwODu7xL0n4YKjdiSVs9G7HY9QAcgYpOh1Lt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220672; c=relaxed/simple;
	bh=0Hg/Hl+xyrdq4BMlDMKk7I4UI2i/FIMSsDUZlphM3tQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fYFdG7y06757xDtR+QQ5vTvUO2Q5/6lAVb0gtClEM39H2FV818QLPX3zm28xqHuQmeo3cPJO4cvvZvJybnjjeoiTIMWEv6Y1izBjiYmkT/7fTxMeCJSLciQATOl/tYdheNos6BMIJvF61NwGMzI7I9fK8hAJ/7DLQl8HSIksCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDIbKGuZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDIbKGuZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD7B1F00898;
	Mon,  5 Oct 2026 17:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220671;
	bh=Ymq6W5k88Rw+hVc9kKcw2Uav+weX0N5PgaqyYjKKNzI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=kDIbKGuZoC1H8ltVNn4uWnWUp1ldMPvq/u8Zj2BBGCDSqORZyRdgOMO2TLyUGTSsJ
	 Z9L6yEB1cWsuDPJH1YYIDKBYQtFPaFa68GKHWjI6i87C5lMW5gRHCT3HCNT55yqO98
	 bhH/Rr8vk2s4kscDewWiXMPTWYuoc76rbS5Nxxnihhy0xNiDXKhXUika2+HIjD+5Uu
	 lMP/EDxJCU/OiFKpkQtqf3Y7gNf/sEM3MTqNZOaZb+HK3jNwVPToUszWF3sKRhPSXt
	 NfrGzJnBZL7vwdh8HUhadqBuwRJaszf+3VgyWoAQsqbfrLG0pJ3+GXw5VeIwLlVcyC
	 ijkvN/gls3aVw==
Date: Mon, 5 Oct 2026 11:17:46 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: gao.rui@zte.com.cn
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    jiangfeng@kylinos.cn, david.laight.linux@gmail.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    jmontleo@redhat.com
Subject: Re: [PATCH v3] riscv: fix strnlen() overflow in Zbb implementation
In-Reply-To: <202609300948576198tT3nfO5VwsTwUw23gA9v@zte.com.cn>
Message-ID: <501e0def-c7ab-0f0c-cc19-7de5d253ca0d@kernel.org>
References: <202609300948576198tT3nfO5VwsTwUw23gA9v@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Gao Rui,

On Wed, 30 Sep 2026, gao.rui@zte.com.cn wrote:

> riscv: fix strnlen() overflow in Zbb implementation
> 
> The RISC-V Zbb optimized strnlen() implementation can return incorrect
> results when very large count values are supplied.
> 
> The previous implementation calculates an end address based on the
> input pointer and count. When count is close to SIZE_MAX, the address
> calculation may overflow, resulting in incorrect termination checks and
> wrong return values.
> 
> This issue was observed while running device-mapper tests:
> 
> dmsetup create testname9 --table "0 8 zero"
> cat /sys/block/dm-*/dm/name
> dmsetup remove testname9
> 
> Rework the Zbb implementation to use a word counter instead of an end
> address. This removes the dependency on end-address calculations,
> avoids overflow entirely, and simplifies the termination condition of
> the word scanning loop. The final length is calculated using the saved
> original pointer.
> 
> Performance was evaluated with string_bench_strnlen:
> 
> New Implementation Previous Implementation
> 
> len=0 : 71 ns/call 70 ns/call
> len=1 : 82 ns/call 81 ns/call
> len=7 : 83 ns/call 81 ns/call
> len=8 : 83 ns/call 81 ns/call
> len=16 : 94 ns/call 90 ns/call
> len=31 : 117 ns/call 113 ns/call
> len=64 : 175 ns/call 167 ns/call
> len=127 : 259 ns/call 258 ns/call
> len=512 : 802 ns/call 833 ns/call
> len=1024 : 1512 ns/call 1536 ns/call
> len=3173 : 4581 ns/call 4640 ns/call
> len=4096 : 6256 ns/call 6068 ns/call
> 
> Results show comparable performance to the previous implementation
> while fixing the overflow issue.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Suggested-by: DavidLaight <david.laight.linux@gmail.com>
> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>

Thanks for your patch.  I took Shao Mingyin's patch for this instead, 
although I would have preferred that he work with you to clean up your 
patch instead, for the reasons described in

https://lore.kernel.org/linux-riscv/970c63ed-9fa8-9d1f-4521-0a7119b9d6e5@kernel.org/

If you think that Shao Mingyin's approach can be improved upon, please 
send a followup patch.


- Paul
