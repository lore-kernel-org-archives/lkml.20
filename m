Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD43839B9
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330903; cv=none; b=ThGskDIgmcp/OlzQSEme0ZW/J1Un+p9d9Y9G2a3202p3bI6NPyPUUqcXCsLsw4oT1CvqLQBUAELDM95rqa7pA5uyj0MSnmkeXIU4Pkg8iuIeY5mL6uaw/mZSBZ5xt3p6zuMAcgRFMLEm1p1/J+3/PUj2hkl+VgM9yiYB5WI6ccY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330903; c=relaxed/simple;
	bh=9px0KKW6+S6ScpCVxlEJlJB8scT76HzwC5B67rbvQqU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aIpZGrSp7xsCQJxVr6osiaMXOY2CL8Qklo+OAfGBhwlCjLuAfODJ87ekB6KraN1iNsR7L8fGsFLC33zVkrNlfSYavvZuFfL2TE1kHwPJQulU4L8cW04hVV6RfapP3/AGx6oq/G+adQgN65bJ9d1T2zl+4nkQIddRIF1G6uUg13s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfGD1mtK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfGD1mtK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so10952645e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791330900; x=1791935700; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6caTqpTyvHD+5gas9OwUK4EamiM1ZGZZvDW5j5iNI9E=;
        b=XfGD1mtKeebY3+K65lCZNAnkklZoR+jt/3nc/FEURugGFGRUlf0hLUwQCo5fIfPKQ8
         s/O4NuGq4eKJHO3U0GbIB3fgxzQn6ouACn/sI4fMRSUQMTjtNInwWhnw81yZV+F8hEnd
         TDE2Wf8ewbLZLwKh9HH5e5oLAkSBf9J4FJZd7jvW+SwuSRZSmTHbRTWHCRFScdRx8n3/
         HQyLkvReMY0tQaGeCxzleRiLRQ4fxYr5H4H80F2xQSuDS/uxZzqacBnnznmBFC4J9H4U
         JaH8Yc1M5iBT1KQYRD6cSRXBPBcOiPvzWvsEv46O3XuQDl6nSLNYLZcUEOTAh+1iQDjv
         GSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330900; x=1791935700;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6caTqpTyvHD+5gas9OwUK4EamiM1ZGZZvDW5j5iNI9E=;
        b=Sc0jyLL9qPVds3N/IeeyFjgl5dlazNmB7axn6c00A50ZcpCxomY6rtyyTKbvX9REff
         NIRsBSolmNOtAnhQeasfFSLtHWRO+CUB9TmZ+8agRxLgY397P0ZlCgOX4edEBybJGRLm
         VkQDYWJHY0q/JHtBhktP51kHNPfWtaDdLRrUf8olboavH7xcSywCtbVn5b4M4XhtxCCi
         rs1r/PNp6XFbB4l/kdRSv1BJXN5v4sQWd32WeW41n/MPi+MU37V4QCW7H5w7d/Dn36Dp
         K94PuU5L42njO2fS9EqtkFvbxmw5GjJjhoYPjQkgA6b4KDamSXRJNQv6YVNebDu8yvzW
         rqFA==
X-Forwarded-Encrypted: i=1; AKwUvBxD2FlLMMmtGXHpIg3V1UFxg2QJ1vcl3aquu2HzMNG1CgKM7UcounO/C6vtSygY2Ve4my1UQ3I7chJGamI=@vger.kernel.org
X-Gm-Message-State: AFuF++nPNpdxcDZH+0iGWJj4C7coSEptEPaSsfW2IgQ5GL8ipIv0x5eR
	JYIRS3F46dlyzdVJEAdLaBgInFZFthRL0NmcDy5OKw7wggs2crN3tRge
X-Gm-Gg: AYBFou36+GkXCUi4sz1jHfQPmgVBFjXoJ8lAyRUiNWSdDmWbFvcZmtKOXNolhs64UEL
	3mnMHP5B8zFZF2SmPJRtVhqXFDvNC4Odq9eusVdJd0ZXStPd5vvOGmH2RzG5w1IUUP0inX0I+3y
	o0EYtVphN0Lkb9qNt7te7ZDmqNKH8LYFZMr3NsgDdD/3fLVM9S0O0Ymi7oX/oEouWexAGMQYdLl
	q5+hI9npJGaILFmlSC9eGPNPE6A9tnci/tvNV9ID6qQmmrsz4ToB9TRUKlcyzjaYbg2kBbzZnuZ
	WwQDPaHwBzDcSgvzDi1xMjdSJSmiq4FC+byFBG00Zos2nG6YH1DYTdt7HMIE3uMQ8VpZvd5YNJZ
	mMViPe9D/pB0EFLVPqWrh1jjAYd3czgQTDj/GeHz7W9rb8+P06TBzCnR9FTg/JdAaiuM/V0EMyJ
	2h2aRLKEgIEwP6+cseZ4dIIM68Bm41+jqtCpSrpCDqXziKiTMN0X/TigDyI2KgY1r3pDgNFm/xI
	ahj/cSFchawGMBEDERyhiw7bJR/9GcxrYNbSK4YMQ6PJA==
X-Received: by 2002:a05:600c:3c89:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-4a18041b75amr5330465e9.14.1791330900202;
        Tue, 06 Oct 2026 16:55:00 -0700 (PDT)
Received: from [192.168.221.223] ([81.0.216.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1787e7792sm102154535e9.0.2026.10.06.16.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:54:53 -0700
Message-Id: <179133089395.137225.157195939155119911.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791330897; l=2848;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=9px0KKW6+S6ScpCVxlEJlJB8scT76HzwC5B67rbvQqU=;
 b=IXpSMuCwkwGtNWcB7512IaSVcHgJ+fHhO6oesNjxGTtxqvfRZo5010Ya/IUUAm0m6WTneDU0U
 7fvpY2pUXB9Agq9hTCrj6KqydJ8MqYBgJRDet0FngldtFfBWReUK8Uw
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

> User-mode use of Zcd, Zcf, Zfa, Zfbfmin, Zfh and Zfhmin requires
> non-Off sstatus.FS, which we set only when has_fpu() (CONFIG_FPU and D
> on all harts).  The vector floating-point extensions Zve32f, Zve64f,
> Zve64d, Zvfbfmin, Zvfbfwma, Zvfh and Zvfhmin require it as well, but
> hwprobe gates them only on has_vector().  hwprobe otherwise reports the
> extensions from the per-hart ISA bitmaps alone, so it can advertise
> extensions that are always disabled in user-mode.
> 
> Report correct environment to user-mode.
> 
> Fixes: 2e2cf5581fcc ("riscv: cpufeature: add validation for zfa, zfh and zfhmin")
> Fixes: de8f8282a969 ("riscv: hwprobe: add zve Vector subextensions into hwprobe interface")
> Fixes: 5dadda5e6a59 ("riscv: hwprobe: export Zvfh[min] ISA extensions")
> Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
>
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 7818e1d32622..b57ccd116bb1 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -146,15 +146,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		if (has_vector()) {
>  			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVE32X, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVE64X, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKB, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKG, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKNED, pair->value, missing);
> @@ -163,14 +156,26 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  			EXT_KEY(isainfo->isa, ZVKSED, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKSH, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKT, pair->value, missing);
> +
> +			if (has_fpu()) {
> +				EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);

The vector Kconfig is gated on FPU=y so the vector instructions can't
ever be enabled when FPU=n.

-- 
- Charlie

