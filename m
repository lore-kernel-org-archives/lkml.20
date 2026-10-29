Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280799;
	b=3kSJ23mF5LK/fSdJYD2ywNYL0Fwcn5XakyOiBRXyhYpu///3EwyFuyHcSfpXOGQTEKzP
	 j7UY/0+TFfpQbbJcBMAG4Rdf1i9XNo1/HUhc5Jc5rejRqMYsSNYUAi+KL6yPu0WqFSmXE
	 qpWSC/g/jTv99xK7MOlxujl6KGjz8aMe1L1W+IxrGXFjqz0mOXYUG0ds0ju5bc2AhIBYA
	 jBrDy2r02X9Wxog16FWNX0Fo3UsSZsXHf6RXzh3MwlnCyokPM2X5fJ/zhYualCmj0iKUr
	 77UOtaEgoCN6KXeFDl1i2amwbrQwhtUriMTcJIFuUmrMvI+Gdf/s0el/qCyd9lzUd9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2i3HYlB+GbvhTKq0vS61Mj8mgAms2UmILds9Leq0HNQ=;
	b=yt93RvT5NXdpSyN+tm/Ie7sTYS2JklWv2UjGr309oRvsx1hNqiJl12Oa1LLTgm/Eqie+
	 Gl8pnpLSfUVf1LwTI8SSqZZR9mFVNkd6DNUycyEv7Ym08eBRlh4PyLecmqtrmM9wU9xuS
	 4cLhCHXLltXiNXjY67zymEy6d6l+ZLBc94NfoDbrwQ7ur5mR5VJyPmeee1W9HrE3FuEaj
	 pieU/qrzh76YIA/5ij7iXozjURNo2FiS1xTKFBEr0ezLyrxspeGtCZTG7L8SA437ijK+h
	 abYoO5yE/TGH+rcNweXSZs0NGvFifGPfchN35jwHfnDFE5R9MgGmU4/TERCEz6EMdNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBk1Rza3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAC606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31BAC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBk1Rza3
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e4c00d71aso193547085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793280797; cv=none;
        d=google.com; s=arc-20260327;
        b=UHM4Xz2IIrBigMX+Kud2zB8Qv74zgageXaMJFGHq3mW86qsnDhicgJQZfjsZM0iPki
         ICtuLC+/7GSMLs806M86yJzXLeDx7Wa8pDZEiglOZ/e8eIqBZ33zoqVbDO963KIBAXUH
         Blt+kKgYdDF+OJyHLAYjDx0cfzikWbXGGxhExokVAm7uC8Abj6rDKZu4sXqgyhD4+M8A
         q6f2Bzcg67tVwO1CNlMEkiTMRs/gw3nY7eLqYSqzUEuVkApBzVNLlzV7Tqo1w4S3LXWY
         1W7tgkBUk2x6TRvNQTfVmxNK/qUuTmhlPEfxuE3dY0MK663tBoo96SHcDCIXWlwyIhAa
         rQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2i3HYlB+GbvhTKq0vS61Mj8mgAms2UmILds9Leq0HNQ=;
        fh=RsXRCTz2wqFNfEHrpUGMPAOggENKrxrZZlGpAy5BRU4=;
        b=OKt5dxolBQjLRmCiCuVZ6SC/d2PHS15Jh+yzbkJElKXlgWtg2Klju3S34aOlbv4zZ2
         SGjBtfp56wi4juHHK0xzGg3OfGB9K5BBz/KKmUn8DSwnCrBK269KL9iHHc9H262qZu6p
         zvv+1JgwjSHN6fwj3jD+mNk8jECQav5PRg1KWzqcgFNPUwKdQR706PjlvsyXcbrAdjJ+
         zldfE4tbgxbklRYrqxE+ty3JCLsqNTbPVx8wah59j6SjLhrvK5oRdDsUDfbK8h/V44+q
         KVRJW8xXgE/Wm2APm6Vsj30j1HpydxIfxXFTLsUV8lxia/7dkZgPCRwPK2JPE2nugPbN
         1lwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793280797; x=1793885597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2i3HYlB+GbvhTKq0vS61Mj8mgAms2UmILds9Leq0HNQ=;
        b=rBk1Rza3nDUnh651/Pwns2HNDnuy/0lby1QjU9+b3t9q5BL07PwHCmGSDtDQ4PIZug
         Kx42Hs6ZrSeflD/Dq7B3pRfWwQ/ZEc8oMkPyGE8kwCz9NqTt3KtSHDgR0eNz3xdzFpTv
         B02ZVtutkAoPAQ70c0A4NLpq0i6Jp4e1Kf3f90oAPLWsCrr5XpX2TjxqLXoTVkwWRBe/
         fDxnPtQLgDBGvnYCOP/LRKhA8EmyIxEbQ7+9RGZ+nZmsE2FF7HEgK9DFNIm6XvCs/Ph1
         DqFipXqM3CYZ6xkNqoTWAZZ9klLdvKP2ch05kyi4hmVOTNeMQrqc2/4eKXOLfrKdGevR
         fxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280797; x=1793885597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2i3HYlB+GbvhTKq0vS61Mj8mgAms2UmILds9Leq0HNQ=;
        b=EeaOdKNY+Prq9zBHR7H2fIoRY1C2pKTT+udnxXP+9IckumPgCCXZQ10ERzOU6jDpXj
         wIqAeI0DTMT3QFK7leKVXOPmV2y6Ap+6Q1Gl4Jo0mb0pkhTESxDPIGiJ/KQBAYCrJqxW
         LjYmBxeUaDZOj1h0trCvJr8HgG+w3R5EDEcDHWeDSWAugYKiSd6rUyjfd7xSoN75+prM
         9Ifx7B8h/yC874sPLVuz58tz85SQL9mDjdlZ8uR5N6kebCHd4uItVljmep6SjoFE3ZLb
         AIWH4WLfjVNo0exE8ac7bH3U6l118kfEp9ykH2bIPNoBf2Vu84hxoe+nKP+d5lgt2Y1p
         2GTw==
X-Forwarded-Encrypted: i=1; AKwUvBy9rk64ZvOzA7VflgvZT5Kb9Dh0shQpvUIykdYLHpTKvtqCP0J6PQWwUTCMT0Vr1acD80ydpVReKT/ugrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgDkTTWHybDxyXOyBqdAg1aoJK31OEO70BvVF0volCbP1EzP9i
	5fh4qowygxMXACvCdo2y5NXDO8JYE2EF3jBi1zptXf9/Rznk7msr/P+Ok/XS7CbTgWAvJSmVx7a
	KyKwDLsmJZW5TDFr7wrIrEBQvDNYTu/31EjfB6WI=
X-Gm-Gg: AYBFou2sE5ulE4h1/acNaeGfxMDNVVYsKCHDv/Bi06+misyWEHCv55ZPtfJ9jKHMdoG
	4sOPRFB6G9ZiTV3t351dUmf5ltxpyvHkg1zmTkwwYR9c0zg2HltKWZEI+y4B28YrWVpl2mvSxpE
	Zt9KZBrLsU4ZQ/BA6+roF5DIHKTOhKJL+FxqoKiPe2qRwURxsth8v6TRH9hTOPXyVZcAoQ5IfWZ
	CXJlTUHwE8ubKWzu+Th0nfczNRFuE79/CrXMUB6Df8/wve1p22QbjgJwIVwuMur68oYXWWRYknN
	eBuHTOYsY0csu5xWO81chRtkaEHS5XQchZhCf+XDf0OrcpzK/TJbswGXQfZHHBR/xXHKClo+CsC
	EYEm1XjjkQUhC549Yp6KE0pPdDPaJglGU3MSC
X-Received: by 2002:a05:620a:4628:b0:93f:1cd7:734b with SMTP id
 af79cd13be357-94408cf970amr830248485a.34.1793280796965; Thu, 29 Oct 2026
 06:33:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028155005.174417-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261028155005.174417-1-mbkchelofficialdev@gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Thu, 29 Oct 2026 15:33:05 +0200
X-Gm-Features: AclHuK9wwROn4TU15KaNzEXIRId3eBxRzEJjMKpQJVL7IKBQ3GuCcnxcaYqj24A
Message-ID: <CA+YDrKBAPZ9MHB46wVSsD4Vd-R8L1Kkz=Vp-F32+WyfJ5FDaoQ@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: document emit_base in ModInfoBuilder
To: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that I made a typo in my last name in the "From" and
"Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".

If the patch is accepted, could you please apply it with the corrected name=
?

Thanks,
Ivan

=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:50, Iva=
n Tverdohleb <mbkchelofficialdev@gmail.com>:
>
> Add documentation for the emit_base method within the ModInfoBuilder
> struct. Explain its role in formatting metadata strings, handling the
> differentiation between built-in and loadable modules, and managing
> linker sections and conditional compilation.
>
> Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
> ---
>  rust/macros/module.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 0a7b9e24c..6f361013f 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
>          }
>      }
>
> +    /// Emits a single metadata entry into the module information table.
> +    ///
> +    /// This method formats a `field=3Dcontent\0` byte string and places=
 it into the
> +    /// `.modinfo` linker section. For built-in modules (`builtin =3D=3D=
 true`), the string
> +    /// is prefixed with the module name (`module.field=3Dcontent\0`) to=
 avoid naming
> +    /// collisions in the final monolithic kernel binary.
> +    ///
> +    /// It automatically generates a unique static identifier using an i=
nternal counter
> +    /// and applies appropriate conditional compilation attributes (`#[c=
fg(MODULE)]` or
> +    /// `#[cfg(not(MODULE))]`) based on the target type.
>      fn emit_base(&mut self, field: &str, content: &str, builtin: bool, p=
aram: bool) {
>          let string =3D if builtin {
>              // Built-in modules prefix their modinfo strings by `module.=
`.
> --
> 2.56.0
>
