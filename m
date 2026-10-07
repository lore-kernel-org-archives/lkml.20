Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67665389458
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385898; cv=none; b=tByCekg9syy1pBJkwLefl1VzijaHmhM2TUgHB75NuidMn9FQemYQuhHQDojezLpLjQr2pPYpjzNo8nsQJDKPfk2hk61ZNeNUMMcSA8QU8ePaFLulhifSn90txEwCuLyAQ160VWQBhcofMRKPGVoLYUPz2XN/FVh1J12I6+rQBT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385898; c=relaxed/simple;
	bh=z/0u9mNvhjssedwqAWw/XvFLzI5A68iLZ1EfJ4C89nE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ln2v48bZpOPGFvoVLgJXWhdF+seuYOdknA6JKsMuCayW9EnwRFSOmnxy9Gd84haeG/YkkO3XdyEc8h/gkIqpPCYh1yWk7K83938e6cdV3mkp18mRuCnZiEs4mJfE1U1wY5AlK0qKNF6tA9Kq9NMw7jQpVYU7xswFr2TFOjmli1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKV3S2ng; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKV3S2ng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28B51F000FF;
	Wed,  7 Oct 2026 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791385885;
	bh=JddtNEM6goEHGBJSj2WoyIxr3Xm40ZzTJFU/GODnDUg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=jKV3S2ngpMBgIicHLl5IIJQn7FDOFWATwz7suVFR80ZWriS1jjgad+CyKocwqAxm/
	 /a9j+0WttA4AG4v7k8taVcsm1nXgN2TRvxWskm+aScG6D5BmgZn+qKSWfJSr8vQdmd
	 1n47CHttreGS9qwySjCKYwgaJ5W3dRPGp7wBjJnj8VlL6MS6wPFVvSlWEPHtvP4Zk/
	 Ca3WKxiwVBV/2/vsslBFu4Duxn9l7qZ9XRJOkb2/UNwKGBZLeo4wpagGrs6DN5Pem+
	 skfxkEN1Muz5s39d2fY/rgWR/6ZGKo9KQCWIq7VyZ0wUg4QedmX5EUg5fOTO5YZ+wW
	 kjhGXKHsxUpiw==
Date: Wed, 7 Oct 2026 09:11:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Leo Yu-Chi Liang <leo.liang@sifive.com>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, wangruikang@iscas.ac.cn, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: fix NR_CPUS range leaking 64-bit default onto
 32-bit builds
In-Reply-To: <20261007045229.36114-1-leo.liang@sifive.com>
Message-ID: <3e8a895f-f5d3-bad6-0a34-d1d716ef3a26@kernel.org>
References: <20261007045229.36114-1-leo.liang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Oct 2026, Leo Yu-Chi Liang wrote:

> rv32_defconfig is built in two stages:
> 
> - the generic (64-bit-oriented) "defconfig" target runs first
>   and resolves a concrete NR_CPUS value using the 64BIT default.
> - then 32-bit.config is merged on top via merge_config.sh,
>   which does not touch NR_CPUS.
> 
> The final "make olddefconfig" pass sees NR_CPUS=256 is still within
> the "2 512" range therefore never recalculates it against the 32BIT
> default of 32, silently keeping the leaked 64-bit-stage value.
> 
> The NR_CPUS-scaled regions (percpu areas, ...etc) of the resulting
> CONFIG_NR_CPUS=256 on a 32-bit build bloats and does not fit in the
> percpu/stack layout for rv32 and hangs early boot on QEMU's virt machine.
> 
> Fix this by explicitly specify the range for 32/64 and SBI_V01/!SBI_V01.
> 
> Fixes: 0fa749771993 ("riscv: Raise default NR_CPUS for 64BIT to 256")
> Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>

Thanks, queued for v7.3-rc.


- Paul
