Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7F62931CE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758016; cv=none; b=bzv80oqpa8AceeZwfDuefGMH3xxDgfz0tLLmpmHBIcgHtCuRhyEPopfcYkn+wOauPSlSAwWOhGIG8Dt/nUYD8y6U6VlrdFTdkx/gFWAYQyxb1YqBWwa5yG9vNY+GPc8Eh5ESwsl/gTahUX9sO0CX774e4A7xkZ/yjZ4HvnP8wJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758016; c=relaxed/simple;
	bh=t4U0Jc1prbLxYSkEeJam5m7mHYjxnvcC+aOU88zRphg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nayUH5UE2pYkSoBR5b/JUrWs20XHHWmw28yJ0ZmnahWLDitL1Sdxh4FyosGUifJMpVPJIoMvtFydguEzROPDW6K/JLPjyfDoj72iFWFpAbl7LGRIdmQA/ylF4Unmn4AX5x98D0bcvhHvWgV+ahA4iZ15UY6QD7qgh5kGZMAGEwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D21A1F00A3A;
	Mon,  7 Sep 2026 05:13:34 +0000 (UTC)
Message-ID: <347c0282-4cc0-4583-8aa3-7c7fbd59b14d@linux-m68k.org>
Date: Mon, 7 Sep 2026 15:13:29 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: fix typo "eanble" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
References: <20260904112245.37109-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260904112245.37109-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hemanth,

On 4/9/26 21:22, Hemanth Selam wrote:
> Correct "eanble" to "Enable", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

This is related to ColdFire support, so I will apply to for-next branch of
m68knommu git tree.

Thanks
Greg


> ---
>  arch/m68k/include/asm/m53xxacr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/m53xxacr.h b/arch/m68k/include/asm/m53xxacr.h
> index 692f90e7fecc..a29ad33aaf05 100644
> --- a/arch/m68k/include/asm/m53xxacr.h
> +++ b/arch/m68k/include/asm/m53xxacr.h
> @@ -32,7 +32,7 @@
>  #define CACR_DCM_PRE	0x00000200	/* Cache inhibited, precise */
>  #define CACR_DCM_IMPRE	0x00000300	/* Cache inhibited, imprecise */
>  #define CACR_WPROTECT	0x00000020	/* Write protect*/
> -#define CACR_EUSP	0x00000010	/* Eanble separate user a7 */
> +#define CACR_EUSP	0x00000010	/* Enable separate user a7 */
>  
>  /*
>   * Define the Access Control register flags.

