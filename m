Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF8D35B136
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617510; cv=none; b=WjUwjlGnw1XA9h7+gaOHbu8VZpRU/uOOvcKL1pI3Od/mIgdwHVS5+rBuSb1771LBvlAqBIpFYqmvt7i2ZmS0ZXDdEtLZTSRiyVLrUps429zQwP/Gnsd7fFWRDluvB68FTXotUAujAbVANxmP2kfoIEgrj2+oEtskox9HvZrmwgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617510; c=relaxed/simple;
	bh=gGIQqAtOYp6FmGoba/0GwWH7Rb1QNGW3JCo9imFFhSU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M7+oE1yQLQnomRBJlmC9To/LzgvpPcOb/pva36o/ajN5h6M+tJDMGzLH5HA6C/zpvoEECTL3nWs25910Qpy9Hcmpl4lbirR/e02JF/sLFTD3N1o2y132puoGiH22QZuQ+tk2wCQMBoiz+nRHDoC0nDrpID6FWrjOPAqoTWamflc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mONGnMoM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mONGnMoM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48436216a98so1306105f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617506; x=1789222306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zoxIv5Nmy3/BgkU/sQVcWqwr00bml9z+9xXr1ZneJw=;
        b=mONGnMoMIzo8kljpcWl0YjEvxTOHINorPlXo1yEXgAWa5WNAkZ4ZSUH2dnoQ2tttQ/
         Xq6UyfI0vbwO1GSdi1JEcAIpr9Nzk8Oje2FlrIC3E6NM/zGP0WD2yUPnnLWP0MdbiCMw
         EH3brlW0nadeN0/Y2j2V6Sj8sWj9rVcYveWFaCothxudxcDQW/Xopz3qnycA4z516dj/
         yWa72CP13zIP0t8QtOKdyqJleUhWYxSjtWSetCNPAbJk9/b9AcGLbJLEwgJQ80MWrfa4
         qgroXtWKTUKRUYEDaCKDNJLGg3M6eoV7egTx5Sa1vUmrePJgA2TiCXZeSNpU8EP9/bku
         NGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617506; x=1789222306;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zoxIv5Nmy3/BgkU/sQVcWqwr00bml9z+9xXr1ZneJw=;
        b=ZR9YF7Vmai5Z02eXpeZDSOfCtPdQkAlAEtrNMnB4zopMGDrw4gc5PIlkZMYvsgJFjw
         4+9gocLiHmlqFz641ZaxreNESJIUFY8a7anJ4BfZXCkbkm54HIBRtlCIRePIlUnOeg+V
         lhHcXouPAR3eLF2U90uVjckNrK6+NJkDdNb6Acx1TZRI+BOEmKSZe/bGNPMmuEiCi2f9
         Ohv5cTMefDWyER7RtpV/t4ym2Ej1pzJKVV7wpRytLAIZXOeKUfzZLi8vqCPif5EjE3PN
         e22brMykDFD/eHjgJkFdtA85Tgp2bMg7WCAEXUJn+B2IbHtI2o5bGG7o8v2NZ3AjvRad
         wVXA==
X-Forwarded-Encrypted: i=1; AKwUvBz0XaVOFfM57wMXy/qXSOi8ehVwArEtq4s4i5hIDEGd8/XJClEmaEDCvxzpDEgXpF4WDN4sMC6nO525Bl4=@vger.kernel.org
X-Gm-Message-State: AFuF++lwdYMUi6vLV/VswZl5rHtiEV+fRrVL3Na8uXBkaqxOqk4jStUu
	gE+7HgS787mVjIRJ27+oLfYXeva0T7S4TRWgtLXZOTgxY/q4tNiV1nHWoSgyQ18P
X-Gm-Gg: AYBFou1ZhXf14/235Rc0QtaipnW+v2zCnVW0gAaNhZfEaVajMdgoAnG4Za2aY+JN2Kd
	rOv649mnehr07h8UojWR4vro+SBHMdfOUbviiZqv+Pm7AoURvvQ2BjDLqlbntY0r+Rg684F/ZT4
	rl9N6o9GDvLuNA2dpp02oAK40wwi1EtGGMEcVEGoO7EWa5Un0dMxlk1BaSBeHUPt2vAZNEYMQlf
	PsOw4KXku5b7goLsjV3IdGbe86F6szL93F4olmTgsfri0LaLzTwYB5bZplQNPWuKIw4OtFQTteX
	Nj/JUpDExqKKMlG+yNZbpdNhm0QRCqCw2Ue8clFBxlS6vgb5ME9mFxzD0pEt6RQx1iP0Aeg817L
	tJz9Nj8wXe5ka6gL8UFs9MyDqc+jiQbqDSZUuUL0pIalfc4Cs9ygQP7cCAJFtgBAXkJxSYhTcR/
	qoEzKnzwSwqbYi5WZftgaH9YZQR2ff1DXBRVGLJl+b7ZUdFk+8IVxudpVGUK9FZxaqhrb1y1h6S
	jPdtpR+DM198Xx613AD+eka9QcWEVSmm8/efyM781IJ9A1PG5Cn6XbDghuwMSs8xhs=
X-Received: by 2002:a05:600c:6011:b0:49c:ffa2:1f3d with SMTP id 5b1f17b1804b1-49cffa21f83mr54434245e9.30.1788617505797;
        Sat, 05 Sep 2026 07:11:45 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm14931097f8f.10.2026.09.05.07.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 07:11:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1235548d-5326-4ab7-be9a-f33954e8fe40@gmail.com>
Date: Sat, 5 Sep 2026 15:11:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH 1/2] kconfig: preserve the final answer when input has no
 newline
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905123237.40670-1-hexvalid@gmail.com>
Content-Language: en-US
In-Reply-To: <20260905123237.40670-1-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Erkan,

I see that this is your first patch submission to the kernel. Welcome!

First thing, if you run the ./scripts/get_maintainer.pl check on this
patch, it should list a few more people to CC.

On 9/5/26 13:32, Erkan Erdem wrote:
> conf_string() unconditionally removes the last character returned by
> fgets(), assuming that it is a newline. When redirected input ends
> without a newline, the last character is part of the answer instead.
> For example, feeding 42 to an integer prompt stores 4, and feeding
> 0xff to a hexadecimal prompt stores 0xf. Both commands succeed despite
> silently changing the supplied value.
> 
> Strip the newline with strcspn() so that a complete answer at EOF is
> preserved. Keep the existing handling of newline-terminated and empty
> answers unchanged.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
> 
> An AI coding assistant found the issue, prepared the fix and changelog,
> and ran the verification below after a request to find reproducible
> functional bugs in Linux development tools.
> 
> Validation:
> - Built conf with Clang on macOS and GCC in an x86_64 Linux container,
>   using -Wall -Wmissing-prototypes -Wstrict-prototypes -Werror.
> - Ran 60 before/after executions on each platform, covering oldaskconfig
>   and oldconfig with string, int and hex answers. Unterminated answers
>   retain their last character. Newline, empty-answer, empty-input and
>   CRLF controls keep the same results.
> - The 21 existing Kconfig tests pass on macOS.
> - This tests the host configuration tool; a complete kernel was not built.

Since you already have some tests, it would be good to add a basic test
for this in scripts/kconfig/tests.

Kconfig doesn't have as many tests as it should, and it's been
complained about by some core maintainers in the past [1].

> 
>  scripts/kconfig/conf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fe8ba09b..46c9ca64 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -343,7 +343,7 @@ static int conf_string(struct menu *menu)
>  			}
>  			/* fall through */
>  		default:
> -			line[strlen(line)-1] = 0;
> +			line[strcspn(line, "\n")] = 0;
>  			def = line;
>  		}
>  		if (def && sym_set_string_value(sym, def))
> 
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c

Otherwise this change looks good to me (and is more readable).

Link: https://lore.kernel.org/all/20180206093803.GC31558@kroah.com/ [1]

- Julian Braha

