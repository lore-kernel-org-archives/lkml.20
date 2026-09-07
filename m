Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C96134B669
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757748; cv=none; b=gz6191eLO3UqZyFu5hUHpE3GUUy2h/sJhy5xcCGXIm2aatOowCuGtigTenG/0Ny3GBJqr+28GgmtMUfOOBuj/wUuJz0pXIzGi5KurqFEy/Uo9lC/JrKo2+kfbcgXtbJPTebLXTBufgkLvQ/Dz9zHI+cclADod4YZdBTEiYnj18U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757748; c=relaxed/simple;
	bh=aegAgGrgZYW4K0GvKRNriugYJVkaljJLt2KcfkmmOSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0VAF0AuziJBTJavKu08CZx5PGpJA18YzUJvi5Lx9jH/yfVn9v2GJWygXDUphKQ22cATIWWXJ1jb0yOiyWn5r1qfuG/DT5BgN439vDXCTuX/134AnZOjdj+9saDJi/rAA9kV9HmJ95x6sBZ3FB81LmBHNsLwXBtYBt3aWBDad4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033D11F00A3A;
	Mon,  7 Sep 2026 05:09:05 +0000 (UTC)
Message-ID: <a0844255-193a-41fe-9f58-40c1508ea72e@linux-m68k.org>
Date: Mon, 7 Sep 2026 15:08:44 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k: coldfire: fix typos in reset.c comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20260907044545.6187-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260907044545.6187-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hemanth,

On 7/9/26 14:45, Hemanth Selam wrote:
> Correct "reseting" to "resetting" and "ColdFure" to "ColdFire".
> 
> v1 fixed only "reseting", which checkpatch had flagged, and left
> "ColdFure" two words earlier untouched.  Josh Juran spotted it.
> 
> Only touches a comment, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Thanks for updating with the suggested fix to "ColdFire".
Applied to for-next branch of m68knommu git tree.

Regards
Greg



> ---
>  arch/m68k/coldfire/reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/coldfire/reset.c b/arch/m68k/coldfire/reset.c
> index 6e5f8ab39f32..079c92593eff 100644
> --- a/arch/m68k/coldfire/reset.c
> +++ b/arch/m68k/coldfire/reset.c
> @@ -16,7 +16,7 @@
>  #include <asm/mcfsim.h>
>  
>  /*
> - *	There are 2 common methods amongst the ColdFure parts for reseting
> + *	There are 2 common methods amongst the ColdFire parts for resetting
>   *	the CPU. But there are couple of exceptions, the 5272 and the 547x
>   *	have something completely special to them, and we let their specific
>   *	subarch code handle them.

