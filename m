Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C4C3FC5BE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762896; cv=none; b=fmJQc4++U7uMjAc/YVKwEiX8PSm32IFTcwAAXM1iW7gTaPPo575rZjdCVhJ1Y/DhFwCz8Y6I72D8sXciDdDODeHXuCu96WKyIYetaABrKxCRAbzQEDqOaWUVDN9m0ogKYZ4/9AQI30/Sy402p0MOQdpSXWgDadLS4qLuldnN2Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762896; c=relaxed/simple;
	bh=O9mJw1mFtGmDNnUGn3Ua5FjDw+saOXyZvNEc7h071tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hav+Tc6Lgj6f1DZq2ucrR5DsG1Jp5NICPxL2mtAeBPt2GTwozmRQsmg5otmAN0sA3cOXaTX/3CKgN88kJlalvsASolvoDD7633V1jcf0PxArlCuuW3f8OTJFcghBv2zztOn5aWO7xAqmjfFhyF8rUC6btxMCkW7Dgop0asNZOM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=PGjAaxB2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="PGjAaxB2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1670dad7a8so475621866b.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788762889; x=1789367689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=29/IdbzKS+1E5VRFpUT6IZq+515KxiY3P/9sFUWs3n4=;
        b=PGjAaxB2hyaIF6KvwAglt1zFbqAIf/iejDUpQsBN9yUqkpgY8Jg93ijWhVX8+LBVlL
         sklDs1Cq0XJcZEH6/QkZlna3p5G68+KwQ/2/xudAbJt6tGeiTWufCMCSxD2ZastleljZ
         7q2BOOnlQko2z0mcitMmJEnbW6FZm6VMXnnBuP6ESv4TzcQA/kkI/hDZ9X6uuFI7A7ZD
         CXOwML3ko1Q7NAbzAozkni062yr9yYGfcUfXd+JK59nCGCcyPVu5D8nNoec8ADCbyYt2
         OMLIKVY7JXNoEwFHssvm/YaVudKoFMFXdimGqnP9f4GFl+humi8L8wVxtL4TDxleVcn2
         QWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762889; x=1789367689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=29/IdbzKS+1E5VRFpUT6IZq+515KxiY3P/9sFUWs3n4=;
        b=RG+7GjjqhUSjBrlAy4UzqwZ2L4FUtYKcKWxCFcKBg0akkaZX+C7ikwAuRG/c4OQYeD
         s0y65SBU71rX99RO66haVzFkpFn/N0dLmkt6K9A/3CEJkz1/uH4lvvo6DSFNeHuyeH+Q
         TyWVk1ijO+qgwAf4ZoEXHhBaqyWk+qRs4MeQ3U9ih6H7kdPOLvT9GgOgBI1PFOz8Oi5w
         Ad/MSpRkIpQ4OXwjf7slzdYA3YAAnDZ08uf8SwEmUTthciSrLbomVKpjyQemrH9htapJ
         3nMZGDlsMdvnkA5hUrJGYOqJhMLjLfZxR+u8BuUIwlECwnJgH8tHdOKsmcdlUHN9BQ9L
         DzLg==
X-Gm-Message-State: AFuF++mHIh48SkDnshyv8gH+x2OHfkpm/x+iMJrIF01Xf1mLy+u1xbMa
	KHCh/jsCcZgjOUx8OnntsDVFYeZUmlyY39k9BtZ8Iv6gUUb86VA833bFpQRS4KCukUKEIZPZxoa
	0DBwUGRvC
X-Gm-Gg: AYBFou2Rh1MZhqIQo4mtaIkyGMhY0iEt2+WvGaift/Aft5URDM6RqsaBQdB24nB3B+n
	1QPuaXjyzSbWiDB4Sdsw60fOgW62Ota0Y6zKJ/Jm/Zo9ngZ95WfSRCiuzZXVNbfm3xcDJetVIHl
	RmzNvC3FtN4qkhFEHM5OwtuDzRPqH30BLVUGKweD4ZcWZeqGaMBRjiSgrVIqHQ2o8GYwaeq+xJi
	EONF18rFbQx4T9JIqYDEd+R936N6bsjJBWh0atu5MQkUwump9lm+jVM132/h9vTcfvr9MthfuGv
	ibve0vXjd7j2JxFFD6gmQjYOlfS7TKWlm9sNxQI+Zbl5ZvBx4aGEgBQoWtCUQLAuh98+pXg1WVw
	i1ph5s+HZR6TYPIlEgIJWUjV62n5tFWpCNXidYKzrN1flpkE3AWWP1PrPHv++uHp+7fCEUhRDud
	8/P/Fx5Xk0Gamm0C7UZTW6g5pORLfJdEsDyl8oloNF3DhbZaWGxUYd7syAcUWipfxCnyMtwGrjn
	6p4UYO2JBPMl/V3GXDyBA==
X-Received: by 2002:a17:906:eec9:b0:c26:19de:912a with SMTP id a640c23a62f3a-c2619dea136mr581294466b.29.1788762889525;
        Sun, 06 Sep 2026 23:34:49 -0700 (PDT)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036902sm415255766b.3.2026.09.06.23.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:34:48 -0700 (PDT)
Message-ID: <d60b8779-9ac8-46a6-8fce-250f17d27054@monstr.eu>
Date: Mon, 7 Sep 2026 08:34:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: fix typo "multipler" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org
References: <20260904113355.14914-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260904113355.14914-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 13:33, Hemanth Selam wrote:
> Correct "multipler" to "multiplier", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments,
> no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   arch/microblaze/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
> index 02e6be9c5b0d..56a161147606 100644
> --- a/arch/microblaze/Makefile
> +++ b/arch/microblaze/Makefile
> @@ -16,7 +16,7 @@ export CPU_VER CPU_MAJOR CPU_MINOR CPU_REV
>   # The various CONFIG_XILINX cpu features options are integers 0/1/2...
>   # rather than bools y/n
>   
> -# Work out HW multipler support. This is tricky.
> +# Work out HW multiplier support. This is tricky.
>   # 1. Spartan2 has no HW multipliers.
>   # 2. MicroBlaze v3.x always uses them, except in Spartan 2
>   # 3. All other FPGa/CPU ver combos, we can trust the CONFIG_ settings

Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

