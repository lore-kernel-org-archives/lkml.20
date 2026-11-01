Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.197
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793522928;
	b=dQ33UCwNcERQ98533vQ8Ip3ZJVjlUAEofsob+XwnP18RP+5RhoBXF+xuYakUjL9Mr/Ck
	 fTKwqtXlpq3Jc/esCkK8Q5kPk5+/SZRt0mkPIgqvqgTi4UjE2umcrrflU+t+hvbtfVOWA
	 G8EY2L/IUJBlL0UPOfCpvKFy4IEC2MgS48jkQCCPYXIzfTQg/N2KGGpZqSWveLgWIm/kZ
	 +oIsOzDx9sziAqidRCSUjZ3pfe3htZo4sdczSbZfSwxthuD/jX5MeJwxB+gnCoUnbZw17
	 L+rg/N3ph3/nGS1zNfW7UfVVK/HdLBZJTPCdXxAFNax+1A8gBXHcpe4Ca0f3cY4d+cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793522928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=d/S5ktHJXzZ3XHV4tu6kTnRxiDsegSAXyqGvriPXGfk=;
	b=a5oCBG4fcc3vZGmMEShxl83ymXfoiFuzSPeeXOFhN3PhJ2afN6HoGFnF+Ew3CsBxS0ZU
	 3zlF6q9A2cyscxg/4suIMMLsABBndY33GLGxHJ4RrmXZWXvGAOy8l4X1lnhhTPUiQMaZM
	 lY/ljoxtBR0qMUlXyJfZjersr0tHue7EyS4jVWvQrqdP78B4LwoTgtnmJpBHOBhUzge25
	 FgIzEtFz9mhdQPER852mvwu5L0HyynBhpA1S5jEdigQXWykLSmVxAtCeI1Ri4/PPYqcG6
	 CZBUjz2xF4uw43Fy2YPACyvcmftUSjfUNMP51A4E1bjuoXbZS9ME78FIJ2uesqda1yA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObqtDW4F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.197
Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F5A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F5A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObqtDW4F
Received: by mail-oi2-f5.google.com with SMTP id 5614622812f47-5413fa881a9so850696b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793522926; cv=none;
        d=google.com; s=arc-20260327;
        b=bVxpGgup8OevCeyx7/FDbK4/fMw5U7CycRbWiRtTVheZM9ylcdAt0Gj+tZPDPOb91z
         X8GjPgHqPdsFUg4/XNgbFkR3Wd1LFyxCzBmufrGdPmLX2N2CZRdMRDHxfHAvoB+rXzyR
         zV9Gr0ry9vt+owVbwC5fY0Hw/z2J4yfG2tPiMRKr+MV8FmiZPJXEmUcIr+kicAFJlUTi
         ClRcf3AGHePCgGVHwx5Sq92qqf2J0jCyFBCFC1Cdw/hBCtbZzPEGe3vU6jQS6Jvf3Zmz
         UPNT0qe0hKCoLfGU2enPWufX0M62vrHYH3E/RzlcilUzYxVxTu+QHG+tQK+vRkbpRDFV
         K+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d/S5ktHJXzZ3XHV4tu6kTnRxiDsegSAXyqGvriPXGfk=;
        fh=NIZLVQaonkgFDYCDEoOrLPhYFJFfxYqxDZQsb7ti2gg=;
        b=kb1Vu28mCZskmeaa3mRODGaYillE2/sndwnaNSIfL4JM8s833w/ahxY4NlPfHyarEb
         +UIh03pv7uHZLiNsT7/6B0ZBo70PdqODiT21F3P+V2/Dr20L85UIYJ2Q5D+zVsSNMoXH
         FzSgfW7o60eOQmyRYKlsTHv/phrs8mOU2pcsoNxVWK7AvrhcZKz0gpiarands0al97gO
         d71V57Y/u4A825i9Oo8fnaek9awf/n5QZuXI+Uo82+mpLSk1TSfYAxIwCALY52zAdxGR
         o3xIOKdBGSE8R/H9bGrtxtHF2cccnT5/rHj66rMT/V5Umdn9iQAenPvmVW6cFa4AWAdb
         d+KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793522926; x=1794127726; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/S5ktHJXzZ3XHV4tu6kTnRxiDsegSAXyqGvriPXGfk=;
        b=ObqtDW4FRXJELhMOZeV8NF8cSpvQaH2+hoZiUktDas3rWpL2YDvv/6MsuuKuUpV/aF
         imA0T8VkcX/9fnWMNULQSbQUUsxYHO6pVx/prh3fwzrYanUoZoEcmI+7DdC5AZbhY0JD
         u2qvG1/TW9GE2fdoxQhfkoTnYM4JtMTjLfKMPN5uCZEI/k9HAZ4onhqF9+cxKw3q6AFG
         mnkIluESBi4UNsvnPZvPWt2S02Y5kbQqpN2YOdMcIs4gNMNwhsVPNSpcQOdEFMtMqeTy
         4+0Voc9WymPTAWTaZKNbZyy7vnQTd/PspWBu/KMJOdaD+/fu4cVfWq7BZCac/LpwB5q8
         QHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793522926; x=1794127726;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d/S5ktHJXzZ3XHV4tu6kTnRxiDsegSAXyqGvriPXGfk=;
        b=OWAURZUtGTpaZUy8Hf0SFqXov8j0s7RoBP1drmWenLzr4U6uj4vBeE6oeEmnDtXZTn
         LRuzPPGJt676BTMkTaFBlb7ASCsTwBCfLN0ChmR0NsjeIex6v5buQWVYfVbzs48qk5JU
         4YzESbEhngCcEWNa672McjETY9gvcl6jzT/BLGt2Sq1E/1BXsmkiPSrgAqvFPS6wMRlE
         NKr7Oj0DRwVBV26h0xw99C/oRT6pydR92hYBi0hrIywr9Mm6yNF/PTFnqfU1/fUyqlmk
         LJ7i+Sy/L06wfpyzSdUU9Qs8v6QBDsk8FohMek9QEjgQ38kdL35RKkqsT7oA4beYINrg
         Kbyw==
X-Forwarded-Encrypted: i=1; AKwUvBxydifDBY1x4oKDxMrX1lHSfW8nMov4wPb3VpagkJpqei5AF/9w/SRf0xK9CJ8lD+ExX0V+Z/O3CSk0J8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgMeBEUMV4xkFStz5kPCIoC+Cv2M1xR7vK+4k4Jfm7PXYE47MB
	qBW6faipEUIV8KXtbufJAx7d3aQMGvS93dbamYHUt5xQ2siadar+OZDGYLW4EQhGdv+ATRzAaNQ
	AWPBMjdkb07MyoPph/ZwZKVVmn3hGJIg=
X-Gm-Gg: AYBFou0RxXtXTNYyjFZ/aIogDr5V0Od8/b9F/cHupax7Q8BY1pF0aIxFqMOFHaYQg9E
	iKPdYwTxYx8KIwd/sX08Ar5fpNmgsaUhJeE9dwfZqr8fNiUUwaJFTCnIhus0HrBzVU86kNExZaa
	tEv2d32ZYPyFMEiTx9y2faR3AqG+yHNWl78K75DFq5jK2pIQ3xPUrA3lT7SFuleFb1nQFSkA3tR
	aSXKc0c5ElCrLSpMiq8Z7uXVZFJEztlXZXFS0HzJ4eRqP+GjjMJiTl9nYQk66amjjXZ8sXuC51Y
	XBFaAwNq9eXslgIKjGoGehTSw3F94dZG3SltA/COtuoRP9GTaw9M+v9VERyGk/iRWEcam3BdVdM
	Ns/wvQYcTqhtn/lTWKHGdL8aaGKDgeNWQ0EHajnWcvk13favmuVY3XuaRLXvJKbJzL5qvk8w=
X-Received: by 2002:a05:6808:c40a:b0:4b9:e65b:8c33 with SMTP id
 5614622812f47-5640ddb8b16mr4287436b6e.33.1793522926506; Sun, 01 Nov 2026
 01:48:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031233219.9362-1-dennylin0707@gmail.com> <DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com>
In-Reply-To: <DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Sun, 1 Nov 2026 01:48:35 -0700
X-Gm-Features: AclHuK8izB10BirS0avFrgzOPpGyLn4aCmUm016M7Kdli5O9sXkRb-1DHgSukmQ
Message-ID: <CAGEkeHeVXp7NK68WyOKfTt9429Au7Q5eQ9G0u35m=hZ8mZ16_A@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Match unsigned enum values when dumping data
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: andrii@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net, 
	yonghong.song@linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Pls check what clang puts into ld_imm64 for such enumerator.

I checked Clang 14.0.6 and 18.1.3. Both emit 0x0000000080000000
for 0x80000000U, so libbpf's sign-extended orig_val fails the
LDIMM64 check in bpf_core_patch_insn() today.

With Clang 14, -1 is emitted as 0xffffffffffffffff, but the enum
has kflag=0. Using the helper directly in CO-RE fixes the unsigned
case but fails that same check for this signed case.

In my offline relocation tests, with modern local BTF and a legacy
signed target enum with kflag=0, the check passes, but the helper
patches -1 as 0x00000000ffffffff. I'd leave CO-RE unchanged in this
series to avoid those regressions.

> Pls send libbpf, bpftool and the selftest as one series.

Will do. I'll use the shared helper, preserve existing enum name
matches, and add regression tests for legacy BTF.

Thanks,
Hungyu
