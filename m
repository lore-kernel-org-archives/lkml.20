Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067D7443ABE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792184820; cv=none; b=ZG8KtMxYkBv9W9e5wVuDp24diqBHMljNSdmQ63n+z6Ykoqv8TAECLNl+Bz9cu+jN5aorimyEhlBA+aP1BuhouQQOWIf4WmgnwkKHjBPLfwDpboOQhBE84xUhBLyf8MmXfVEG2OsbY9bB3PVhqxovBl2XFOCODdT69+mG2/BwZNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792184820; c=relaxed/simple;
	bh=qACrisRzdT8dand7fpk7ARLIVFnOA5BPJfRaVsoceZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnD72f3Ca+Y88LzSnh7tqZ4HaTzePjb0TFNvEAsRqk9yGHky6/UaW7B+fZKTC1rnQ0eSJ1F7foKwSPIWW0uEjKo0jTeRThf6F9QQRhOTBAGfbqGyWKLiUMAmPyVl68HEFE2iIZeE5J5NWCCrzJbCJ6ydWT5bmzrvkZhwbZvqSGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Dc3mqgG4; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Dc3mqgG4"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0e21048f8so3676907b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792184818; x=1792789618; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uJsfOfOfTjTwCAELnZwu530q6Z1HdI+8JO9XYfcC6o=;
        b=Dc3mqgG4F2pQfCBRHqIM2563Px2OYLQy4KoYxysa+fkn+P1uG3hm7ht/lNgXdGe/Jq
         qjdVewvTECfR8BlxYMKPDqlQoyR6dbFUUn1uaQjfM0HrbnfsUMIRszyT28TvkzvKeC9F
         QRUUzdlVhvxztXCeXIR3MeBo0vV+h4OSYrbvtO/7+jNzgCdJ7eV55f9O8bfSlbCNWi+C
         92DgrlACdK0gi4UCSN35K06xTJJMoi2VFvf6VLEc+XW/ev7W/WB1gHsNf/3C5EfZuQDA
         oyPI+xniN/1KUq+FTkdZdvqNyhJc3NpFlywEkx4/JgAv7UJFevgB9/TjlTlDsOlo8BRd
         9Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184818; x=1792789618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5uJsfOfOfTjTwCAELnZwu530q6Z1HdI+8JO9XYfcC6o=;
        b=kTvzPZMedDwCYHqmZNnNpzABvvQnEpnWzQZuvhnnoJAx7IwUMe1IVgaiH7S+XyX+6V
         MU6ckqywAqmh2DZ8fXzppk9WbZfvw9pW9ktX3EoOJf8Ca6wQBg2NkZdPouHDwmouP8EP
         sKzOEyGPB1/YvA6zMjLq+60PaLL09stwrFO6GjxtwglsAJ3jxp9W14WETCR2XkdkpVMI
         skceowu0X5DBmPVbnt7cx5NxStzDdak722Zxuy6EOoLjh+/VcY4I+UyP1Y1sWOF0Ib2Y
         nG3mZzVBoKTZfQLImnTHX7VxW+IL4nnOvG9QfwxuiaqFv0dttAOalE7s/YnU7wI8gV5Z
         KaDg==
X-Forwarded-Encrypted: i=1; AKwUvByJfkWliwYOCAUE5ELDae/IWQ+wV5CkwNRlVeR0SnuEFABvowUvrekPpHf/9l1rerqgqDoF+0Im75uskSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfHc713txFCN66eYm98ZbIdjTOyVKsXBn02XzJ/fGAP3Z5cPfa
	OctXDWuxtfvrbZkV0FZY2vUH9nvxG6Rm29ZPhQCcyC0hODZHPY9yoLiKi51rXxmDExo=
X-Gm-Gg: AYBFou3bk48uHI3aiRMepQSnj7TPS/BwJbemY3peuX8sn4IvWojhPI9VmS1VarzxpWD
	F3C2HdtbXjwZ2A03ONIk84j5mngCxWc5TVWVDw0nAk868aZkK6PyPfH+XC3nJ61ZNRhxtFpqXNs
	B0mCfv4FCF29nNoqZYyAN6JZC64c4sneG2+A7w0YSt+wZ/79EmkRgHLam66XVBowRODfrGmOwEq
	/g/yOWs++jbeCWyXj/L8LveoH5r2m/g1/1aiKphglVmNrEQwA52fdhRjF8VS25cLZnRIA9Jqvxa
	vIxyBrAdqYaeOQBse+XpGuWzHr88S/d3gGigvwfQwL0NwM5XGgrFNCFRWGHZKKOKm4/8voZUD7D
	Av3cdzvV/irpkE/ibqHr6G0lhsEZj9YCmIsudNtiu6PbB+topizg3rwCbWEkW0PRW3CSl0ERIcb
	AnVhJPSjK1+2CTthpnODSRSxb0UM7lRquL5wZsyltLcE6vgsuaT0NFgIVRBrTydZmqYY0rfuyCk
	me2RnMvgLkbRfgQG0Nt
X-Received: by 2002:a05:690c:883:b0:8ae:b617:7135 with SMTP id 00721157ae682-8b0f21978a0mr4730247b3.43.1792184817948;
        Fri, 16 Oct 2026 14:06:57 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58881f3sm13891687b3.8.2026.10.16.14.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:06:57 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:06:56 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when
 available
Message-ID: <atKR8HnbkSf_xZAm@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>

On Tue, Oct 06, 2026 at 09:52:59AM +0200, Radim Krcmár wrote:
> User-mode use of Zicbom and Zicboz requires senvcfg.CBCFE and
> senvcfg.CBZE, respectively, which we set only when all harts have the
> extension.  hwprobe reports the extensions from the per-hart ISA bitmaps
> alone, so it can advertise extensions that are always disabled in
> user-mode.
> 
> Report correct environment to user-mode.
> 
> Fixes: 1b57747e978f ("riscv: Enable cbo.zero only when all harts support Zicboz")
> Fixes: eb1003970940 ("RISC-V: hwprobe: Expose Zicbom extension and its block size")
> Signed-off-by: Radim Krcmár <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
>  arch/riscv/kernel/sys_hwprobe.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index b57ccd116bb1..c74e36e8fcdd 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -91,6 +91,12 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  	if (has_vector() && riscv_isa_extension_available(NULL, V))
>  		pair->value |= RISCV_HWPROBE_IMA_V;
>  
> +	if (riscv_isa_extension_available(NULL, ZICBOM))
> +		pair->value |= RISCV_HWPROBE_EXT_ZICBOM;
> +
> +	if (riscv_isa_extension_available(NULL, ZICBOZ))
> +		pair->value |= RISCV_HWPROBE_EXT_ZICBOZ;
> +
>  	/*
>  	 * Loop through and record extensions that 1) anyone has, and 2) anyone
>  	 * doesn't have.
> @@ -120,9 +126,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(isainfo->isa, ZCB, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZCLSD, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZCMOP, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZICBOM, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZICBOP, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZICBOZ, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZICFILP, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZICNTR, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZICOND, pair->value, missing);
> -- 
> 2.55.0
> 
