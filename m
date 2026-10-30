Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399629;
	b=h0wWnoP4CuE+I4KIohp1/KFxfH7gtk05jLCTQ3Y0fqtcKSnzQVB2CIVTokdhG1dpuEa3
	 v+kWpasCn8OiUQmieB8CJPq2CBsPdhakYk4HoCJTPlwtoLXGb+hjZYY5rWRCQq1sEGHmM
	 IO+NDZeDgmNryskCph7XGTYe1RQQSZWh+3Mo1GDTLkD1Jh+9MG3bx4uKa/YmlHmM4nPyb
	 g4nFfG5qs3veglqcsaXgxrs+fiJkQAsPmaGJNGnOGc66clud0sftP1VmBat45FwlqsYdG
	 GywNmoxkPxLTj8G/aqSqTCH3Ep4ev23QlOa6reha6M4ih0OOQC/rEPxmdhArF6Y4Gjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399629;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ucXB7kIXkR22wptA4ECw1Ukmrn4C7DPZ8GfL9sZbPxg=;
	b=rKrBVtmwXkeZuj0D6dbtLG34VN+VCkcJjGSjevS4mATU1LX0F9d77ARSw9snpsD+E9lG
	 M39aVMU/PDAi/TOjHpIgSYuHvl0XETo3yNbdOf2itnWr74tZDAiKvgYl9W2ffzQdRpVY0
	 EZO5LLG09ewOIo8K8fUxq1MDbfaSm5LOLk6XDFxqXbqkXd04xE77CMjjR3i9Jw4GIgC4y
	 Qy8rxU0HQbvcWRbm5tE5bi8OF0dwmkG5t+T4U8C6vb4N82yo97LKmsr+jssrvRI9M+vgx
	 sAF05jI2hDT3X5zPMRrrW8e+6iEE4nrFC/iyBLawY9RR9q1rMQHh6QmmHN8cX5p1rcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Vk97GFiK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD373606A31E;
	Fri, 30 Oct 2026 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Vk97GFiK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC75A1F000C1;
	Fri, 30 Oct 2026 22:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793399628;
	bh=ucXB7kIXkR22wptA4ECw1Ukmrn4C7DPZ8GfL9sZbPxg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Vk97GFiKii5heUCxUE0rGgXFrRQo8z7xlej80GQQndc0rTb+p2aICUANyQvibAKyg
	 3OoZjHTlLmP6Ja46z3aZqb0EUlojQj/Fyg6xq1NJ0wjDXXR4Sfb69m1VHnONpbtdby
	 0uhiQy7RzXCMegLzFo3y0rRkPyBUmBm9gD1U7PGY=
Date: Fri, 30 Oct 2026 15:33:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
Subject: Re: [PATCH linux-next] riscv/mm: fix up the mm-fixes merge of
 free_pmd_table()
Message-Id: <20261030153347.5641a97e22e18ddff6043416@linux-foundation.org>
In-Reply-To: <20261030221401.155797-1-sashal@kernel.org>
References: <as0D2sHzh_UnNF5L@sirena.org.uk>
	<20261030221401.155797-1-sashal@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 18:14:01 -0400 Sasha Levin <sashal@kernel.org> wrote:

> The mm-fixes merge reuses an older resolution of the conflict in
> remove_pud_mapping() and keeps the free_pmd_table() call that passes
> is_vmemmap. Commit f998a21c2ba5 ("riscv/mm: fix hotplug page-table
> destructor handling") in mm-fixes removed that argument, so a riscv
> build with CONFIG_MEMORY_HOTPLUG fails:
> 
>   arch/riscv/mm/init.c:1657:35: error: too many arguments to function call, expected 2, have 3
> 
> Drop the argument to match the mm-fixes version of the call.
> 
> ---
> Mark, this applies on top of next-20261030 and is meant to be folded into
> the mm-fixes merge resolution. Next/merge.log says it was resolved using
> a previous resolution, I think the one from the risc-v/mm conflict on
> 2026-10-12, which had the same problem (next-20261012 has it too).

Thanks.  The "mm: Fix page-table teardown during memory hot-remove", v3
series was problematic, but I now have all four patches lined up in
Muchun's as-sent order in mm-hotfixes-unstable.  I'll push that in the
next hour or three.  Then hopefully any -next merge resolution can just
go away.

