Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925258;
	b=AHfcT8azRXBjzUhMEhZ19t9BKsTbb8ScPDbPJG60Q+IfM6MN+DAeg6x73jDGiKsy3Xdq
	 eyvuZtIUJ60BzcMj3dyExXdbALRR74a2xKh4Dyb8mHWYq7GV5zB01hd6/M+2DJK+57DEN
	 ZfGjWhXYqhoqOkuFPz+8rmnkqoSw0biyRYrjr4DKy8rFXVM8MoJH8QwZxBp82Yph7fQBl
	 exLGeChZT+Rbt0qlXrLKwTGS5XMwnrK1aCllQG7n2740dx49OCciuaj5ABFHNXrcAVYNB
	 nuKtwbSnDPkwmssu/XPEdwZjy+FSEgYwmlQoxtWMuzzbo88vK4IiqkhixPKpOILgO7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925258;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=viu1yje4As6OjByhd+biKMvb1JY5yU9tAC8Wwkiiqko=;
	b=L8SiMYrPYcWcW1nYdfwRstKV/RdWdqiC+/2uMZYqV29iNU36+0qn2lQp9KxtYZN5mrwx
	 eB79ynIVEiYMgr4FO/wV3YdWMVKVIQFWKI1vQxBmYqpPbLLsuEdYb6DmfJn96ZbRjUdYs
	 jI/g4htkY8uxpvRjuwwQ8W1nmp3rmcA/q2yOUNqjEWGr9YqNQl2vwAZPhcWTg3oHCPykE
	 URqyt/4vRmr6eBe9MFEPR678XzxNmyzt68XQiHPrZhZm0cyJs0bbWu9l5fZW9yG5u28SR
	 7lj/OkJVVHfIwVDQ8JKRL5LknI1KurxktnqPc1KYRBUcvUIhI19Ws5b80ytOeIeuGYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngAn6gaO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBA4606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngAn6gaO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFB81F000C5;
	Tue, 17 Nov 2026 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794925258;
	bh=viu1yje4As6OjByhd+biKMvb1JY5yU9tAC8Wwkiiqko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ngAn6gaOxuvKFm4o5ca0TX7e7f1Ly2G5dtLvAyv4P9a++xAkPCDa+Wuw3cJoXtRJQ
	 KPuox3JrZXg/M1hFCBWqSwkRK7GMNR8UdPmyUePP1j2WIHAHotnl/FgFN4xGeXa/mQ
	 Q1+aXz4c2pK2RhSJYALWw1a4DAGDcTugpdniJMKqTsFKziUniavOiOjj/t6E4ryT/v
	 JaCF0g/UXw7nxy1NysxUlzikBUwJJH/u1JbvSX3G/YGUuw3WpuGk+a7NVJK+1lUzgT
	 yjWXYyQ+vnmjf8xSssVUxaNfT4HxSULVJuCh6b91K+nKP1uD4bhatBA9p8P42FsJxH
	 DY0UlueYbDlkg==
Date: Tue, 17 Nov 2026 22:00:43 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] riscv: mm: fix set_memory_x() and
 kernel_page_present()
Message-ID: <avxeCy_ovH1BSyOo@xhacker>
References: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
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
In-Reply-To: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>

On Tue, Nov 17, 2026 at 04:00:19PM +0200, Mike Rapoport (Microsoft) wrote:
> These are two riscv fixes I found while working on a generic
> implementation of the set_memory APIs.
> 
> The first one stops set_memory_x() from making the linear map alias of
> module and BPF text executable.
> 
> The second one makes kernel_page_present() report the pages removed from
> the linear map as not present. Today it says they are mapped, and
> hibernation could copy them without mapping them first.
> 
> ---
> Changes in v2:
> - read the PMD entry once in kernel_page_present() (Jisheng)
> - Link to v1: https://patch.msgid.link/20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org

for the series:

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>


> 
> ---
> Mike Rapoport (Microsoft) (2):
>       riscv: mm: do not make the linear map alias executable in set_memory_*()
>       riscv: mm: check the valid bit in kernel_page_present()
> 
>  arch/riscv/mm/pageattr.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261112-fixes-riscv-3e48788f58fe
> 
> --
> Sincerely yours,
> Mike.
> 
