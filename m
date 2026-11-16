Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835155;
	b=rlr3tCRSKZSnrHfoyxHaV4TCjavWaMCGpcr2+4Wfj6f+luozGbgyCd+DqNv2gNn96GCV
	 WVf+y1nVzcFIM2+uKq2bgjDhS7xMzzapogdvWGhoiBME32X4PKlEF4aevWZ44Yvnbpfh3
	 9UmUuWhs3Sr/f+TjxOMNUUz+R7WFt5vkjVc+FnhY3GHBUBJAXC6+B5XsVf3XwTBI2cff+
	 hi7LbAQ13MpiXzhReaPWsypV6ujVVxvWRGU2eVIaxteRof5imHyJfzkIuQm7jAm4py5k2
	 1PpjDmngzqU8vxlN6g4IeMEEza9dpTnnmesDF1335vHqGuXYpJkmTPiYMu+GEYa67IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835155;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rsuJe9P+iHNYNY32mC3I7LyX21wYzZJPcOl6VhaHjnY=;
	b=fNVNiSijwt1yNk81vRr+Z8G5MiTbJgSCTzQ/htnRxo9Ru0BuYWIbvImK0koQQiosrPD6
	 V6ltiR3k3vx8IbgYd1rpB8cFg5F+YSi+PLW1f9PQ0ZAHah5JbYqGqLj42fqkd1i/pjCWF
	 CZv+cFrdewcDPM9CzvK/rOqaWbuhUj37vF4mz0XnL/pajC9PvEGjzsC62WUmFEcIS/86z
	 vj1IAf/u4AU6e9QZiVSJBjqPyNGiedtsWUXSn0tNb9MvjcZHhZQZqul+jFyBT6DnbDmjo
	 he4MJnuLc6UF6KaFdSi25yq+P0yjQMKUObjyvRtr5gSKBT5NJowuiWvKR3/WBXYeN+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a85l0JbR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD336606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a85l0JbR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90011F000C5;
	Mon, 16 Nov 2026 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794835155;
	bh=rsuJe9P+iHNYNY32mC3I7LyX21wYzZJPcOl6VhaHjnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=a85l0JbRUNUmJpT4BUIoLJUDIs6AnVL95e0jf/GFQcsoA2Nv6zjDgDpFugF6pvVpu
	 zrrPCU0PPAFsL4f/9NjmIbkRq3bfed6yDY+JqHfDVh88abxVyv6cwMDUMokgfhXLa1
	 181MaAZIGCAYnbXppdSo/bA1T/LV7yI7llAILIaK6GBKc/pYAV1Tf69U8PEO74t9eS
	 gqY8HFRLpNs9T4F6UVLgH6tHJsJfTv+BJhvfLb9s0cwZy7O3ihHOMJpfVYUNh5Eawt
	 /0x3LW55Aca5uOKlo1PCxLXor9RNkGU+GZyAu7gN4HiNeZXeAO9HIbbNSA7pc4thNU
	 MB7uMbUsppY3A==
Message-ID: <69073cae-ced9-407d-ba96-e55fc7635735@kernel.org>
Date: Mon, 16 Nov 2026 07:19:13 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] lib: Add software mul/div helpers and use them
 from nios2
To: Simon Schuster <schuster.simon@siemens-energy.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>
References: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/26 09:58, Simon Schuster wrote:
> Recently, there have been linking failures on nios2 regarding libgcc
> symbols that we reexport to modules (in particular __mulsi3 [0], and
> __divsi3_table [1]).
> 
> In the resulting discussion, Arnd suggested [2] dropping the libgcc
> dependency altogether, as -- while specific functions might be fine --
> libgcc does not expect to run in a kernel-like freestanding environment.
> 
> To this end, Dinh Nguyen was kind enough to locate and extract
> GPLv2-compliant versions of the software mul/div/mod functions required
> by nios2 gcc and integrate them into the kernel. As Arnd also suggested
> [3] that these might be helpful to other smaller architectures (such as
> arc or openrisc), I've further extracted them to lib/ with corresponding
> CONFIG_GENERIC_LIB_* options that allow selectively enabling and
> exporting these as required.
> 
> The patch series compiles mostly^4 fine in a nios2 allyesconfig
> without modpost errors; a quick boot test on a regular build also
> completed successfully.
> 
> Best regards,
> Simon
> 
> 0: https://lore.kernel.org/lkml/20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de/
> 1: https://lore.kernel.org/lkml/20261026234452.1086974-1-sashal@kernel.org/
> 2: https://lore.kernel.org/lkml/686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com/
> 3: https://lore.kernel.org/lkml/426c73b7-b4dc-4b68-9aa5-6145a13280bc@app.fastmail.com/
> 4: There seems to be an unrelated issue in linux-next regarding
>     CONFIG_PNFS_BLOCK. Furthermore -Wno-attribute-alias
>     -Wno-missing-prototypes -Wno-missing-declarations and
>     -Wno-unused-function were required due to unrelated Werror-related
>     compilation issues; but as this series concerns compiler intrinsics
>     that are never explicitly referenced in code and it links fine this
>     seems acceptable to me.
> 
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> ---
> Changes in v3:
> - Switch __udivsi3 and __umodsi3 signature from s32 to u32 as requested
>    by Vineet Gupta in <bba7f6da-82ee-46cc-bd8f-b0e3e027f5e2@kernel.org>
> - Link to v2: https://lore.kernel.org/r/20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com
> 
> Changes in v2:
> - Reorganised to directly add to lib/* skipping arch/nios2/lib/math.c
> - Dropped __gcc_bcmp as it is not actually needed
> - Link to v1: https://lore.kernel.org/r/20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com
> 
> ---
If there are no further comments on this patchset, I can pull it in?

Thanks,
Dinh
