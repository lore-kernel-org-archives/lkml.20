Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.46.171.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139878;
	b=yra89Z4aBafRJSUY7zx7FII4ZDMRW1I0NbTQp+OdpuxVXqomZrsg9Ld7As9g3XkGFEeE
	 HtCZE47WTvGnlf1SCeOmGmsyJg3FSmsl/e2/FIMv99xX5DoEXlfa2ao88cx2hrMYV0yj4
	 Xyl6CamwT1Q4E3koycCYa1eiOawheAShpjRbfp8g9tQ9VCLI4nrmQPAEXsBKSgmWgO4Ft
	 Mty7U0tF0fMP+qc9cC1PWF4JOABPUWJYne6w2p/7qjmrb4CxNziacc1d+5ylIRs9A7pKG
	 LzlpDyabEfgbmWGQgCXN7pTab3Hm8gHp27SQQSYGgYgAu4xE3KrCM+c+YRD4GYlKi5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139878;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=6ef9yYLdxXIUGY8RVd41r6+xeg6pmHrfr32Rdvc2dTg=;
	b=IsZMRLyKbA7AaKBqc9A7JUyxrVHH7FvyPbeX2OpECLCP+DmTeIAYVubcWWg9KYxsvORt
	 1GrJBy/lj1XIEfu/kRhPqgvmp1qcVpwDRfLiYcenXLckbb46Icx83QqSzqMEFKx36Z5ft
	 g69lfSINSPfQBLOmG/AskYjH1Ft3TJGzEswslSky1ccoNmVHqvdFusu3RD1D1zmo5cJ1p
	 DoKoKeObzwmdHVlKw2mmMB9yNynBQ5/6xW0VsWVBZ7SPZRLUqpYNtffetOROBPCZaJDu/
	 95yX/W0rrJW8kasSuk/GoRPbI8UNSUOf6M55PQtklBUoqaDTeDOSD5qUnPwSGNxMIVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=X5JHOSGd;
	arc=none smtp.remote-ip=78.46.171.57
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA344606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA344606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=X5JHOSGd
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 4AA21BF696
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:11:08 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id C2583BD2E8
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:11:07 +0200 (EET)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 238B4200CB3
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:11:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1794139867;
	bh=6ef9yYLdxXIUGY8RVd41r6+xeg6pmHrfr32Rdvc2dTg=;
	h=Received:From:Subject:To;
	b=X5JHOSGdzcMu1lhkVgTmf19kZrRQ4H9TFEz7eoilykvLMm5pvdVDwTq9Pt5jMIQtL
	 BHW4VcQpJhZa0FLkwYU6mfOXURodAf3T7HVfgL7G6Ub4WREseK4OmbNjJU2fNvlTYM
	 8LoH+OCPoTAH03RC8buIMKoMDX8powryCZKtT9jDIugcMOfg0ifqxn+iyQq47My/vG
	 0DWSlG/gll2GixhrVNqtxH60iumZqPZj06E4+AAROdV7iN3YoRrti5JAkEx2VV0Xvf
	 kcKE0I5EP6un2LwOO/ILz8O2NKNTZdXsxQfLnTm5TvGaPtBf0NF4q7ssSxkeZpXAN7
	 XuZsaMaUERU2g==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2ed1b9e8f43so96985ad.1
        for <linux-kernel@vger.kernel.org>;
 Sun, 08 Nov 2026 04:11:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErG6LExm2M9w9saW1k2hTuWEhzDamght6Dv+RPU5Wx8smK0IFnuylneT2zgF3zZjXzMjT2ky7cUEsn/ye6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T2ggoaDzhsYct6Q1YukdefQJpzAYmA0uf4hBNQsgVtqQSb+02
	6PnhaioKaXY4cZnl0T4SyRcv3WVX2wlR+hbBxd84XAhSOIinMMz6xpXCOAlU3VypeyHGYDsxo4C
	vcECGQMSQjsAeLvAzPd7X4dlUIZIlkcI=
X-Received: by 2002:a17:903:3810:b0:2df:8733:f229 with SMTP id
 d9443c01a7336-2ed837595c8mr11333125ad.24.1794139865573; Sun, 08 Nov 2026
 04:11:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108020351.62494-1-hijae99@gmail.com>
In-Reply-To: <20261108020351.62494-1-hijae99@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 8 Nov 2026 13:10:54 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGjyhc_j-gaoTj=ijD6us=7QbNyXymT_Gbd3iNue5_RiQ@mail.gmail.com>
X-Gm-Features: AclHuK-zKZVbA7hsNK4LKG0ZduJ3hbw5slvRyY_Oky5Z8mfep99kmAdzUSaMCtQ
Message-ID: 
 <CAGwozwGjyhc_j-gaoTj=ijD6us=7QbNyXymT_Gbd3iNue5_RiQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ayaneo-ec: Enable charge control on Flip KB
To: Hijae Song <hijae99@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179413986739.727791.12755407714450825350@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 8 Nov 2026 at 03:04, Hijae Song <hijae99@gmail.com> wrote:
>
> Flip KB was matched to quirk_fan (fan control only), the same
> quirk used for boards without a working charge-limit EC
> interface. Testing on real hardware shows the charge-limit
> register works identically to AIR/AIR 1S/KUN, so switch it to
> quirk_charge_limit.
>
> Verified on real hardware: switching charge_behaviour to
> inhibit-charge stops the charge current (status: Not charging,
> power_now: 0), and switching back to auto resumes charging.
>

I would have liked a slightly shorter description with the slop "
Verified on real hardware:" cut out, but it is not worth resending.
Ideally dropping the second paragraph, and swapping "real hardware"
with "the device"

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

Antheas

> Signed-off-by: Hijae Song <hijae99@gmail.com>
> ---
>  drivers/platform/x86/ayaneo-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> index 41a24e09..6fe2387d 100644
> --- a/drivers/platform/x86/ayaneo-ec.c
> +++ b/drivers/platform/x86/ayaneo-ec.c
> @@ -88,7 +88,7 @@ static const struct dmi_system_id dmi_table[] = {
>                         DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>                         DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
>                 },
> -               .driver_data = (void *)&quirk_fan,
> +               .driver_data = (void *)&quirk_charge_limit,
>         },
>         {
>                 .matches = {
> --
> 2.54.0 (Apple Git-157)
>
>

