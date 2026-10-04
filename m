Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F53EF0C2
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 22:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791152507; cv=none; b=fh3ME7/bZt8JbcQp1UZcz+SRrhZ94FWuqgN/WnHRQLThmbN3TPdMsUB944wRkKx2KWbL5YRl/1WsfQQiVHbgcysCCg4mh0YxUIcHngt5px8fJcNlYlToZiJipsPcQvTVqtLoyhFA4WdmkXdpSejCOzwSiMGFFVFPAauLsSdp2/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791152507; c=relaxed/simple;
	bh=e23D1N217Q1BrBansmoyVjYyZlayVlBrqaks7re7t6s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U1Sus6aZTQEheFTn1u35qgPDlL+XptbKAe1MMlzyrCtETVxBG51XiWiG1qbQQaqNNleInORl1bsBWAsLFm6Gj/5tvhm+x9ayL1dpj5ZLBlWVElQEzhDo/9ktmiD8jNI/9T+yjCovSTZVvAQJXG7Gi0tHTv0l7YA897MTcPZQbUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOKvSeV4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOKvSeV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C5F1F00893;
	Sun,  4 Oct 2026 22:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791152495;
	bh=PwXClfBVN3IVDB6KiSTGz0B78VZtRvypodlscWOMyoo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GOKvSeV4+ez5C5LqQqZBBUXHnqUAIdUc0ks/jjIHoFYbSXbkYD6+Tkj0laM1b8xiA
	 pjAIGP61HfV3JiV8NvaiWfmdoEgkGvduBWKzW8gRX1gqIh7JD9awF1gv825TDrfBEc
	 5Am6iVG4aMqlHKC9oO/WrQPvyi9DewMNluLR7D0u0NM7YIGlzokzmlke0GcOp+8/n5
	 lfBlA+qx/xEBKzfCuqxVac7wvlQOvgmk3PGxpE0qug5OsGzdxRLp2bKLrGEYGsrJCD
	 rX57pSc+JaedkViuyNB4PAVwh+SClTd2bQjooV3pdQkgGZqEQOWHlNpel6PO4VRGvs
	 QSypB1jZYeWbg==
Date: Sun, 4 Oct 2026 16:21:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: fix RVG_SYSTEM_CSR_MASK width mask
In-Reply-To: <20260911194233.3379532-1-aurelien@aurel32.net>
Message-ID: <6ce0769c-4683-0e62-e3b2-56b3300a45a2@kernel.org>
References: <20260911194233.3379532-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Sep 2026, Aurelien Jarno wrote:

> RVG_SYSTEM_CSR_MASK should be 12 bits [31:20], shifted down by 20 bits.
> Replace GENMASK(12, 0) by GENMASK(11, 0).
> 
> Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks, queued for v7.4.


- Paul
