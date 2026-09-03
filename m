Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072A171B1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412705; cv=pass; b=DrRNDn/f0kVzh77/Y90+qGGXJ5SdgXAfxAdbIaSljGBqC6fzBg0PZsRe0hl1fBqjc3hQPTy32LCiBIysxPUc+y8iwmtVG9KcbRsurcnWYjoMkenbTfeVWHp722YsKPV6yJe017doLbR8myQggfE+cfM6AGC6V8mapYdomJKGQp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412705; c=relaxed/simple;
	bh=hQGwiNsBhLcjr2x3lOVklBcAjBNib2HeV4EQAoRsLt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hn+Zk+yOLEj2bVN0D9E0csCWwDpqvzB9vcHPGXYjoxYml2bkIaVjO+KmdCR8mC/N6SWpjZQ2ZGDWpweUj8UFhFC6MtR4ZlTgYv/Kl3SeRHvtTZQCGWT/Y1l8rKFAit3NKzqypQDCN08eXE2OlpkZ/nKED2rrqY3n9e3TegGK/hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcaWuZoJ; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcaWuZoJ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so3288231a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788412702; cv=none;
        d=google.com; s=arc-20260327;
        b=FTIvETvVUfIeghmIr61nAdyCEOgrFWnLVVpf75EjlbJuWJgihLE8qiOVapfKkYrulj
         Mqh/2ZDn76b0pVMUGcaH3hc9Sh/H6okAajg1eGK6J2vrCNiSyAZl1tCLCgaxD1DSZGfm
         P5ledPeua4nzuK8cFxVRDix2vjkf9cMHhu3hKls0V9/Arl/YkoJbvzzThwMe8Va9hKYV
         2Ssqv0t0KPV8CwrBaRDsb+apJRMtdjF15Zg34b6qi/0mpbCjFuGymUUGLpoyVRwSBQIc
         06JmO+zUPsA22gxDHsO7xN30T9kOZbYGuIcMCfzl4FHvlLBSqkBgnDQl2A/u0PTjj6Q8
         SFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ikJWWDee5Muzvzg+dlA+QWCtKc5zclbTp4Z8G8xsTzU=;
        fh=ZLc/gYILC2+89vY71hoP6RmjaY0FhdP9UM6MZC58yJE=;
        b=PGDna4zLN8J0veNDbgW6bqiS6piA+5P8TU0YVS/bSA6W4I0DsElzb6hG27N+yEfDQN
         zX62MoB2xrPLE9QeCpAH/lp3x6ejFo1p1xb+HPNsw4MVaSIYFIQG1ew7wASna0TPnq0a
         1USi/ZkTZPFOVaKXhV8jXPIdhiI+uYjmwlnIE8HO4KNJq5aHMVmAJFkcUnd2bsdQDt6b
         svvp2g64D9mvUkxsz4b8FWwRvWGwxbYKoM22jU96eqLs/wy4kUU/DgIXmVMhV1k9Q2Gq
         8prOkIM/GFVbiIqJYSs9ZAlVDF0a0h0yndAD1WWk5/b+rps4uUJmQO2McuCHTVp3vQRN
         hY5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412702; x=1789017502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikJWWDee5Muzvzg+dlA+QWCtKc5zclbTp4Z8G8xsTzU=;
        b=WcaWuZoJmkCPwLYZeM1h6oxaCRYffc3G1J3mkQciH2WZ0ui6v+XMcdlI0oy6rlKb/i
         2SOVh8WcENmVEmX+uxlmhdj7AjCQcBAFMaqTDyJ3CBlwavcyT30rMhRqBY9BD0VN0/Ns
         ha3qXKUEBC197cgw3QB3fizUh9b4+tHInAlO2YngrMnTtZJOnFpCT0/y3CdG4d/PM+q9
         /tYLfgLPUg8bUlNyJjcDauxppergC3w7WuJ/RfZb7EquduEu81Sb2RCYVzkb/r9TKDvc
         KM7V6vo4LhpkEkV9l49UxjV26lkvOIzPqo7HalwUEwchOf86pmuKwtgaJa7+/NSjNSZ/
         AwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412702; x=1789017502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikJWWDee5Muzvzg+dlA+QWCtKc5zclbTp4Z8G8xsTzU=;
        b=BLJ23AytXPLZhl0vXvlP1v5JxDIcnjDxMWQEfQ/kfNx632tMdnaa1qxFUajBHaSsiv
         cXngB3X5jqKOUFFfvmgsEsnO9NXnZGLdaodSfByANerK8L+8cyeNSfeM7y/cFVOyMjJ3
         9MHQNtyhn5j+g0hEYT9mVeNL535V3Cd4Gv/ShxUElx6Gw0EK5DVGnC8eLqM3AVnm62Qs
         /bZPJneb/J4hiRhwExByDPXCVDrkzNNHhqJmTVrxqWuqdP4cfjLcLYDFsgENhifmyW1e
         h2kStqvZPa0h/W29i/5ouNvDndxGhYRygh9p0TjkOeHqUdeF6ayU3JKm4uz8+5b+QC2Y
         3Qww==
X-Forwarded-Encrypted: i=1; AKwUvBynpXNwYXX7du9YmLH9pk4PcIH8hZ+d8ys9nG8BunEboeVv7E5lfPN9DXnluZqSSWSge7QDO8MWYAxsEqU=@vger.kernel.org
X-Gm-Message-State: AFuF++nFqg2VdAU5/dGte+2CYakXMwa+ZFfrsRQcM3OIh4Gpz6KRaIvz
	pYsLJKyEymwN4dAeFumwVIl+3OP071Q4miRt6Q22xi4lImM4Tkb2fqaY+79aMD0ArF7swr0cDN6
	Vh07sL7Cxn0PrvCsNKUyT92eHKkwNqsjn8ctTM0I=
X-Gm-Gg: AYBFou2qwjXdgQG4bhGMl2rOGcR2TDkBDVY0gsD2loSONz/0xJ3XqibB5+ysvsVPL3p
	0Z7gih20KflOGoyEQZ1Vviax3ndJnIPdhV5tBKdbM0KykJ/qw78GFWqBvZIqH2UFeOp9pcrtI5d
	1pDvhAa5THfG1cTsAB+axRaP2oBoiElnf3iCW+nhoVrUL49iMGp9onJw0UOFtSk6ID3LIk2hzBY
	llcfMarJ1T+pOV+aFJJslBnwPkY8GUkCZtUBG+mZkXI0ffG07fYGvLkNoNUdja4YRErV1JOTLvS
	zexmTCnVwIkf2sdBaVN2AwLDVt+wC9AGByXnMCEgtyAuW4+Ruk3NQj+VsDYwYIGVLwqZsYAQeoo
	hfTK5Ph5uKBOCHKmrXa0xWiXJ1phDp4E=
X-Received: by 2002:a05:6402:21d4:b0:6a0:dda3:83db with SMTP id
 4fb4d7f45d1cf-6a6818d24f1mr6640392a12.0.1788412701843; Wed, 02 Sep 2026
 22:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <7f44a90b0479bc98b15fc5ff4095ed555d33e805.1788277742.git.mattst88@gmail.com>
In-Reply-To: <7f44a90b0479bc98b15fc5ff4095ed555d33e805.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 07:18:10 +0200
X-Gm-Features: AcwNN1UJWKF1dweJFPbkwbs0re3gejXqbNx5ovSIuGBRoGj-WcE8-7WNhKzB9S4
Message-ID: <CA+=Fv5Q74ZS_rL4qRpxX4fsdW9eCZkk-C13E3-aqgxQhFnGApA@mail.gmail.com>
Subject: Re: [PATCH 19/24] alpha: discard .eh_frame and the relocation sections
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> gcc emits .eh_frame for Alpha even though the kernel builds with
> -fno-asynchronous-unwind-tables, and nothing in the kernel consumes it:
> the stack trace code scans the stack for text addresses rather than
> unwinding DWARF.  It was allocated in the loaded image, so dropping it
> shrinks vmlinux by about 1.1MB for a Marvel SMP configuration.
>
> The .rela* sections are equally useless, as the kernel image is not
> relocatable.  The linker was already dropping their contents.
>
> Both were being placed as orphan sections, which is what drew attention
> to them.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---

I verified that .eh_frame and .rela* sections were present in the
linker input objects but absent from the final vmlinux. The resulting
compressed kernel image also booted successfully on an Alpha UP2000.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
