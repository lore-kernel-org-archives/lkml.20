Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F3E3BED7B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161714; cv=none; b=hjcehBaRPYfWePQp3o4oLL1UgaE46IYe7Velh/wEACS4ThkJYvbl8/CWSQQMGH5FmCG5R9o1mioEZX2pyyiTTHwfS/sovnPTBZK2DFOQ5GqU4dQW2eiBfvL6qWPyktQW+n/CVc/lh6wi4CqAytNQli3CbjLbV6RBaTkFUUSqrD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161714; c=relaxed/simple;
	bh=EEpMdvaSoRRNpzIw0uDeIf4lK9QMPRgw6IJLb2ROgLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Akkytic91UN1cb0vdjaobr53zEQXkXdlvvfDPVBFUz+zybhegXgFgMqDrjHKsV7xeVg4FImCFVk9w6/CyL9lEZKV3c1H5l1cgH+EbRv9HGisA0O+PkS/+Naah+S8qQVwetjYmDuiezXFdXbGdJaw9ROxOuaMbNuBd9tWxAm8k28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=w4ha3H9d; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="w4ha3H9d"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c252e703fa3so461795666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788161709; x=1788766509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUJjc7NoHpI9mQtQ42R4ZIO0mKllq40nvRDUfnZeAwE=;
        b=w4ha3H9dVC1Efofo3tJo/HL9RrkUlZaoaUmmlVNDrQWVzoE8QV/NRsLqd/08zBvOUm
         o5G5iBS+LxfFwSZxL1xjGabQdUWrbG5mRYGhK+IK47AYVgrj6j+d5pWK7yteDZ1O0X5N
         JBJnVHRQZ6Ngba9tGFTYTI5+XXORDKy6H0ZJ2LRLazVDfGzIfTQG/CKUfEqXdz0MYt1T
         emzpTiY3wnOALRii/tQ0o1SEdDcn2Rv0qs3qjL462gdUMq0MYZlZToR9LOHaI+Lw9OWA
         o54aTmuaCeKCkTcVxhMcJ8yNTuVlXnxdMm4sfH14Ac4AnMujJyo8oTqiD0rjDevGSJAx
         f1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161709; x=1788766509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUJjc7NoHpI9mQtQ42R4ZIO0mKllq40nvRDUfnZeAwE=;
        b=BnW6ZDpudpohVqY1AtsA81hO/jvtZMQ8MYJUrfq1ZlBx/IyBVXvBLc7R+AN70UaPgw
         tuoACtkxhQwxJ+mf9ce5oq9g9YeUWNBwbPVwJ7KBcedh2pdFf9UP3BmrsmNyz/s4JNSC
         F6jJ5GqNZyIIA4rYoWh/fOfZGwgUgiS7wZ7IN9wL0VpR/UtqqZc5zfO/5qUTK18BVRL1
         Ar2C2TDEmF52O2VSTTGVKWGI3JDIOti7rs44Y1FeQStTI4RkqT0HfbfdENR1xqo8G6px
         AeEihLik9ed8IZgBz5Xd4DE4xLLEC1E8jzQK/oQEeci3jt8ce2piibOHQHCRtPg6JLwq
         0p1g==
X-Forwarded-Encrypted: i=1; AKwUvBzzUlbWaZnADtFEfpzrGTZOzWkk86l4nhPkBPCFt5GQPjuke0whoyAOPHjkJpYXrj8Fq/A+nBUDrHoPZhE=@vger.kernel.org
X-Gm-Message-State: AFuF++lf9gwmEkp9n45X4tiRAorbBn0wNDVbPmrFpNhZbF5mRwYe8VyR
	wxBseM/9HlDIKCJBBihRUP7DezDAfpvvwHSboyrELOBJLhLROmJR7VZ3IkT2iksZUg==
X-Gm-Gg: AYBFou3vo2zWDLyG341RUYBh1At77tsWpJvEIot8RIWx6lzerI6dAkqrS0IK0YCex68
	AtVp5rH4Zj3j3DwbSdnF/pyfgHAmqd5qhwJ55kODMS0gn82r4E94icUM03URRFpsOlhHdH0YbTz
	CFUmY6BefV1Ms+TgDzWj6Dx2ooBXUA8twvudI4hV/tmwzfruKDSOOJeXRm8JsToeE1WXVnoWBfh
	8OArP9qf6H2p1Fod/fhxHWyg5ncx8oo7s50vnGVAfMu4BjIt/hQ+w+lgvCDcegQuMhQ3y6zXDnB
	cWVDy/eX/gUZoFCPMZzD0EDoMtLMzYe5WtbmcVI6kZiBCVTSF9XmduwdBp+2+WsPh8lT9z5QQNh
	NwSpzXknKVOsBqVk4l5tTG80If/pYU/B0G/m4Svk3lu0nXlJ/ouMYYOmt7GmQnJruigWYa1cqOg
	eYoObIEDheF8y9uAOOYcTZuMJwt4g1IhK3bA2UNyLcudaQucyw55Mzv2Cmqg/ErbE5/3Wc/LVsx
	9YK1tUJlUpufBipqlmpkdNZALJR3NShF+QI
X-Received: by 2002:a17:907:960d:b0:c25:659:89ba with SMTP id a640c23a62f3a-c2556c4b566mr1404315366b.9.1788161708901;
        Mon, 31 Aug 2026 00:35:08 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2cc8asm404441566b.26.2026.08.31.00.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:35:08 -0700 (PDT)
Message-ID: <ab3f14c3-8249-492a-b3d9-817504095610@monstr.eu>
Date: Mon, 31 Aug 2026 09:35:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: Fix MB_MANAGER build with older binutils
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260813024026.5402-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260813024026.5402-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/13/26 04:40, Karl Mehltretter wrote:
> Commit 88707ebe77e2 ("microblaze: Add custom break vector handler for mb
> manager") added the suspend mnemonic to the MB Manager break handler.
> 
> GNU as only learned this mnemonic in binutils 2.42. Linux supports
> binutils 2.30, where enabling CONFIG_MB_MANAGER fails:
> 
>    arch/microblaze/kernel/entry.S:946: Error: unknown opcode "suspend"
> 
> The suspend mnemonic is an alias for mbar 24, and both encode as
> 0xbb020004. Use the underlying instruction, which GNU as 2.30 already
> supports.
> 
> Fixes: 88707ebe77e2 ("microblaze: Add custom break vector handler for mb manager")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310310151.UhB396Qs-lkp@intel.com/
> Suggested-by: Michal Simek <monstr@monstr.eu>
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>   arch/microblaze/kernel/entry.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/microblaze/kernel/entry.S b/arch/microblaze/kernel/entry.S
> index 582d7256d8154..ad44341a5dbc7 100644
> --- a/arch/microblaze/kernel/entry.S
> +++ b/arch/microblaze/kernel/entry.S
> @@ -943,7 +943,7 @@ ret_from_break:
>   	mbar	1
>   	mbar	2
>   	bri	4
> -	suspend
> +	mbar	24 /* suspend */
>   	nop
>   #endif
>   

Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

