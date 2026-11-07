Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058287;
	b=dV3I1b2Q7HaUIgyRgGUPiGRKGhMu8uONwq+B7nYlLIP2JrK4IQzPejPqbtEj9aLX/yvY
	 u3Dk8RKxcLAZIfqrQdqpgI+5CKv/dl4sBpzuRIxw9MGt9NzZeaiRDPLU8g9b1UirQ1CSK
	 V+6Fo8esaFJkqSQBUwEpEJ0rvzAum5DR9CHVCbbvw81ZsDjqzgwy5Q8kav4IbdYKORJc6
	 jnzOGPs6THKQ3ifwsnhdLEWzHbVIIF/3B2fGJ6lTbO1ToUcedIi/Et7/ADBEs2p+O8++x
	 l9/+p7Z2JG9qArKdSrZa9Rcb3UOe0XDyURYwRFZERDNiQYQ9ejsvS4AlKsjrJFA77nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058287;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=uioOfdaChpgNKoCkMvX7C1NIWfaIypCIHiX26RAAF2Y=;
	b=HcQo0+X+Wdj/WUd5IfXhtLRf9VU4pybLLzfallVRU1usiiTk38Ips3BNI6QFToKq4gye
	 m9QDKcpsb0Ig0S1qvWxXT+AyxWtjFe0AqySHGewChRt+mE7hWrK8PXf4rHUcR4L6n1RLP
	 z6ab3sTuSfu8N28dxmnHPH6sizqOpi9rlx3rhrkWHH6JNm9JT14XZozRPHcAt2OAA2HCU
	 Qxoc4nfrucSymA7trUZj5vBQMdFtzwqkXPWp6Rk0TkuaHKbvzOn1zsHoOk9YoZ1/kbup2
	 SZ6DHHHmUfh934ZXM19aUr5XNboSGWqM+ltAYC62Oyg7DXbtn0dyxyyTJj3GrsvLTYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHnhbvla;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8709606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHnhbvla
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690EB1F0089F;
	Sat,  7 Nov 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794058286;
	bh=uioOfdaChpgNKoCkMvX7C1NIWfaIypCIHiX26RAAF2Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IHnhbvlaftjfCAg+fhxLI5iDMkVEu2Bfyq9nvte1kfrTAiiHRpqbZOlUfQ5RGOC6q
	 bT9hUDiHgY5t/tPPWQ9r7LnWH0VD1po7OnuURf8Ki4MQ31cu1S1GRCw6NkYodMMJmp
	 JPQQwN1c0hJx/d9Uyf2+3+zIDp7FSGUrSGdEf3yxTY/8YFYB9W4avO6XexUQhth422
	 BP3Y3ml9Y01VqI6nmEG7QFqe7izxy7/aQKw4AjsjoMqlsW00DbzOIvR78kQg6EhE3n
	 jJbSsvF108HRdmmoiiFEI8b2bdI6YCatQz1Xm9nPn81MimnTZPLty3pzxnZBu0Lx/D
	 5yuo47ZDS/ZWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5E0FD380821F;
	Sat,  7 Nov 2026 13:31:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH v1] riscv: mm: Define PAGE_KERNEL_RO
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179405828510.1177315.1002226727110636993.git-patchwork-notify@kernel.org>
Date: Sat, 07 Nov 2026 13:31:25 +0000
References: <20261018023649.798595-1-nickolai@csail.mit.edu>
In-Reply-To: <20261018023649.798595-1-nickolai@csail.mit.edu>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Sat, 17 Oct 2026 22:36:49 -0400 you wrote:
> Kernel mappings that generic code creates read-only are writable on
> riscv. With HugeTLB vmemmap optimization (selected by riscv and on by
> default with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON), the tail
> vmemmap pages of every optimized huge page are remapped to one shared
> page with PAGE_KERNEL_RO so that a stray write to a tail struct page
> faults. On riscv that remap keeps _PAGE_WRITE, so such a write silently
> changes the struct pages of every optimized huge page instead.
> early_memremap_ro() (EFI system and configuration tables), the
> firmware loader's vmap() of the loaded image, and acpi_os_ioremap() for
> EFI runtime code and NOMAP regions, which asks for a read-only mapping
> precisely to avoid a writable mapping of executable code, are affected
> the same way.
> 
> [...]

Here is the summary with links:
  - [v1] riscv: mm: Define PAGE_KERNEL_RO
    https://git.kernel.org/riscv/c/551bdd6fcaba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


