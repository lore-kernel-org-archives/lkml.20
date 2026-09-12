Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155CB37883C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789241837; cv=pass; b=EwTfm7srdX+0UE2d9WtQY1+xH5SxyfH8rqE+ZG1F/E7g3Xg6h1Hwv23hVtzPo9OjT2xF/VEStNMttHcHetvGXncfqh54vuqhSZXDeK+VS+lXCIbF4ADQwqgCKiQrnbQirbC/eqaZ5NBiFMfOXquG0wEkziNv0tlIbcxRB52MiK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789241837; c=relaxed/simple;
	bh=rTTsBHK4um1yjRGf2YHu9S8y6qTmA6zHLJxC9T3Jyao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhRK1mWwQmlRcNiKOZKH0xREudDI+nD7WD+JNNRCxQhdhx9uazbwjAALMnce/+/U27VzVIAsvQAHgdCLoNgnkD7vB9vVRN58caIISb844mUon1tP3fLxzr/knUPKpUf/6IFkHMmJ/C3fJjE5UlfjzNbrTI1aUERwCyeAROqKB2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5BPX/27; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5BPX/27"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so126590166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789241834; cv=none;
        d=google.com; s=arc-20260327;
        b=LNmM8hbNNeQKTkG1EOA+itd6T92CWDszwh3PrOgfYs90CEfuKnOsRwFc39/eDnUZj1
         qYYF6RPyZxoJL8t2m/Lq8kgK0DLxJ/kMoZQPdTktd6uWdmmHkmPNnnqy//3hhKkZgqNe
         1okYeApgeieDKLCz78rknuwjx/c2gyeq9FIf+RVPllkWJHUqrScF0TGqbJ6FLDf79Vju
         sI+3xs6ft+9pptKlDTgF3gMr3RzlV+D+eoSSj6A5SLGLnyjbjIj49uct4z1gjBG5/l5W
         iMnvrQ5OrbN6wJoZnnD6UFgDxzldfJTt0Alca2hQS5HrIJ1/+fX0CAjLu1EKZyfsDWqZ
         vmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rTTsBHK4um1yjRGf2YHu9S8y6qTmA6zHLJxC9T3Jyao=;
        fh=pcRzWpppAwCj8YkABY7PLEamVp5e8Wvn112TxBy9w2w=;
        b=gejMhIY8Kq5IiwRCUcpD3bQhaKeDEIZOz567/FGCkmonXTjIinTdfGoyrSJ8E1meri
         7DJl0QCoymnSBtuwqBaJH3ztfSqfqHfvs5iK1ApSvkypz06CkmfLZc0CqutoSY89lAQg
         +ruUXcXkyOPQANQrFvC4DwhD8u67G/4cA9Kiq54WkRqTDDdUCa3u9XZHZsaJP1S9cp/j
         llJpa09ExJm257imjR9CuVqcb3AzOxET0P1pYHpsVhwgLsHE20KmWhhEy5sUDIwz9m7p
         Gcg+mG3gmvDX7+NvWcr+pN30LkhHWrqVoVWdUEcKGoB2z58uPbdObqpYN1mZfKGakcP/
         C10w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789241834; x=1789846634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTTsBHK4um1yjRGf2YHu9S8y6qTmA6zHLJxC9T3Jyao=;
        b=S5BPX/273smdf5hGu1RZqsnKIeG9jaEAApfwcb3c3vcOS+iRFwsRGpQq+7OjUMoi15
         kX4sHxeOONT3uDDQ4eEUuo0CMxSDaCepgYZ5nYxFTdvkhG//sGuoHXn1sgIx/Q+BjQ/Q
         1CIAkvlwwjlZSYUmNtYzxdBkwVQjHKbVu1FundhKsNpUft/gKcPtSAFTTzcX86GRp7hY
         oeHg208vN7VnE4fv1maRPx4P22lBp2Y4+ORQ46jrk5NsCPr8G4hSWKl42/gjuuq6EsT5
         QxrV0CZhcE9wGY5BuOhG1gScvJPw6TKmltQfZNIGOnTrE4sti4I4em7Y9vO2yo2a0CAL
         tWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789241834; x=1789846634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rTTsBHK4um1yjRGf2YHu9S8y6qTmA6zHLJxC9T3Jyao=;
        b=QX3ExDWZG/NkRbis5l/tTJZQfB3kwmYQM5eu33oyKQUQAB7T19nzGjYaTxJemGkAdR
         2xLcmUctUTGq2Kuki1vi0HICWsg33eF7NP1BDKfS0Lme3H9IZcrjEe877ralmRk+iyII
         F3GmfNaJSng67bgZfLxHfFQbUPv+3/k01CGqdWQUAqppBynISnB0wK0nxWD+Mqq06uVy
         H7qEzmFCxHdEPGoh5rlS8iSdeM1UGMN2Z+/vzXYuqxi1JyCSlAGTc+E5WLEbdguiNGnr
         IiJlwVOq26fb9yjiqem3pc+PEslbi3NKyrjHriX0cif9RcQLO0UI+1HMrB/9/mKSIiW5
         w5Eg==
X-Forwarded-Encrypted: i=1; AKwUvBweg6wOPk+2dTvYWZiEy4sxvpJV+dAq+Yx+dKsiFpjgGueh35VWYglSAeVH+J1DSckzxAP3/W1y6Y57WLc=@vger.kernel.org
X-Gm-Message-State: AFuF++lpbdlmToYCVL+vPKrxAOWHq4sZy0Zeb+wuMRn3oxwsw/P1528T
	ZfD4dlxGv5+9Fd/fJmV4OXxL0NktPBJxwqAbPBMGNJ5hRYRwU8bw/CUVD8da31vPWoNK77rrR9s
	y4ICMsVYbG2Ip2Wgx+DFdTFovv+aos4w=
X-Gm-Gg: AYBFou3S80yee6WM35AtdYOQh9dkjJEAdxe34y2PxTtCCzd6TrEn33teCIlgjkViQBL
	AfZpShp7g+ozAgwp1x1XOLaziw4L4DWpCkIVs2s9TJI51WV15Y9/utbfVhSVSwjkBue9jW8LNNq
	O9io155P3SWKq10yFEGWp6kE56cTNhp0Qsw8hPZGeqXf4LFINEMpJPBlj6CjHxiPJIRCpi13c+C
	RGuN3/9FhMiYHncKifRSdN9jm5tBAXPVVkqs0BT5tY3gazknBevqwHFysYWNhwR6emj0LB0ln8f
	oxjfxPfUciWcFvVzilqg1aK21ge5X0UhEGa1L4nkgwBMh0njtj3MgA==
X-Received: by 2002:a17:907:7245:b0:c26:2a5:819 with SMTP id
 a640c23a62f3a-c29666f6d30mr953226066b.18.1789241834024; Sat, 12 Sep 2026
 12:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912041220.444715-3-main.kalliope@gmail.com> <1b4cc37b0ee6e1aa473c372e07c89f8fd60ac5f89bad550275edd3f7dc8f8e24@mail.kernel.org>
In-Reply-To: <1b4cc37b0ee6e1aa473c372e07c89f8fd60ac5f89bad550275edd3f7dc8f8e24@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Sat, 12 Sep 2026 15:37:02 -0400
X-Gm-Features: AcwNN1WgyD2ePwBCZDxRvueIh3zWMk4fdTmPoVsiLcsmEMMRdq6RUEG1P4mLE08
Message-ID: <CAJZwKkiwTqeVrB=KRYOVrN3h1CD-K60FbYPg7aH-NaqiLecwxA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/2] bpf, mips: Add support for BPF_MOVSX in
 the JITs
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, johan.almbladh@anyfinetworks.com, paulburton@kernel.org, 
	tsbogend@alpha.franken.de, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

> The changelog describes a silent miscompilation of already-loadable BPF
> programs, which indicates this is a bug fix. Should this include a Fixes:
> tag pointing to the commit that introduced BPF_MOVSX to the instruction
> set?

This adds MOVSX support that the MIPS JITs have not previously
implemented. I classified it as architecture enablement and targeted
bpf-next on that basis. The incorrect ordinary-MOV lowering described
in the changelog is real.

This distinction was discussed during the RV32 MOVSX review. Pu Lehui
explicitly requested an "Add support" title and removal of the same
Fixes: 8100928c8814 tag, treating the change as added JIT support:

https://lore.kernel.org/bpf/2ca2a85a-d4a9-4459-a534-6159de6e5890@huawei.com/

> Does this compile? The MIPS uasm assembler appears to have no seb/seh
> emitter.

Yes, with the prerequisite declared in the cover letter. Patch 2/3 of
SDIV/SMOD v4 adds the uasm declarations, encodings and emitters for
seb/seh:

https://lore.kernel.org/bpf/20260911213340.3767930-3-main.kalliope@gmail.com/

The MOVSX cover letter links that series and includes its prerequisite
patch IDs. Applying MOVSX without it leaves those emitters undefined.

I built the combined stack and ran test_bpf under QEMU Malta on
little-endian MIPS32 R1/R2/R6 and MIPS64 R2/R6. All five MOVSX cases
passed with the JIT on each profile and all 16 signed DIV/MOD cases also
passed.

Nicholas
