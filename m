Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C453AD50B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790380121; cv=none; b=CLwXhLT0nheUS/Q06mtomM92ZwdnvfPuNjrIwJ2mVAvNgfsWSsXnVt3lpAf3Ht8ww7rOP/x//8+8YyOn7Y0Ze57rntPW653qNTB+BG/vNoeXlrCtgC2DIbDUwwmUEa53yxN7szUz5IvevfbskU+hSAvi173qn6AbM1KTMcrsIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790380121; c=relaxed/simple;
	bh=3eLZrsu0AMyuiZyP/tIbl/IRNuIdDkrgbWe01if/vMk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bPfKl5B0tZFwX9p68K+u2OSddgOZj5ZHsnGg0IwXLUdeYUR2eDyjwuavPd3WGdg/F7OkcgJrKpCamkV5AzlWcP5r65OPHkMCErY3lWvRe/8qadvYK+2bh/UU+G+m+HcpEDvdb0ICw+TgthJ28BfecZSTuW9mGZcxFLo/ZOlUDxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDGo+f8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDGo+f8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612491F000FF;
	Fri, 25 Sep 2026 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790380120;
	bh=J+M33NAyGSzOubJELAznu648UId0n2/UxhskdMsd6PU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=YDGo+f8SBIabB5AlVZjw1FBM4xikyYXwnmWgVWQLVSNoNF2PprCkjdb7oSzinUEfb
	 NSvjQYRjIjLcohyVj50K7FPbwutcyTS2YyahXw1Td1G8CewaZupgCEee7MVb+XCmTC
	 LBOD2hdrsbExKVb/FBbcGCRhlPJntzO1PssAbKyoWESRRQcZFB/lwP/kSOhW8IoRYS
	 /18a7ip9c586i7h8fD+HtItMQiRWxh8mAs5Unz/DcBeRtz9AJfueQkmKVmr4J/qEjK
	 nQ5VwFAFfaOJGYSMdCDEwa9Djkfs3jo64Z0QnNGK2Ao1LTTvNqeKQZOPBcAHnYjPcQ
	 31j7DPl2y/5nw==
Date: Fri, 25 Sep 2026 17:48:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <blum@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
    Samuel Holland <samuel.holland@sifive.com>, Zishun Yi <vulab@iscas.ac.cn>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in
 compat_mode_detect()
In-Reply-To: <20260924213256.122530-2-blum@kernel.org>
Message-ID: <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
References: <20260924213256.122530-2-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Sep 2026, Thorsten Blum wrote:

> Replace hard-coded strings with the str_supported_unsupported() helper.
> This unifies the output and helps the linker with deduplication, which
> can result in a smaller binary.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Thanks, queued for v7.4.

- Paul
