Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FDF45FFA2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144694; cv=pass; b=bnj+wA5vYU501drxewVVvYl56XbofiPJyRtk3FfaAFaUeAbg/RSevngEqRk87BydY2eyl4aVETEhZvLVo4n+3mRrvlm28CxCqHjNjBi2gBSfYH5aBUtjYP2yUU9J/RNDxp+BtsatX4k8/3Jgo4zy4U4u1RokepTJ2PAK4qJ2E+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144694; c=relaxed/simple;
	bh=Z05kgezgeQBnAhHNLQ06IrbWptjbuPKQZgHZ1hJUBJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdVQIe0Zvcf/MJu4jJ6/rSIhb3WmnICrJxGOMgESSStKct4c1lr8/hFelPLzvB29dlk39FYma9AGASc/VJUxEusBwKfYY5kxMvhhTD3PS1vEznT0X4pG+4SlG/pDCmrwhriw1G4l8q6T5xCrXX/H+4jIx6MZeduHRP3WBXsOzQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2M4yfDS; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2M4yfDS"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2949ed8cc3so204562366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789144687; cv=none;
        d=google.com; s=arc-20260327;
        b=j0ncfCmCxrJs5fyTWCPHGui7/BYq5hmUeckFEuE0vzXMR28C6sosg4V/NX1V2cutbH
         3W4oUm8qP6ZznjwZWB+ykBU2vRTUEsx+WaHHIueZ9u5/esBEjPg813LDDtwJYNH9+Szh
         /Nf48KGLFT6C2dV/S0WMQln0arFOgdXjfRxJn79mjEVsApxsDcpkEEsUSON+e6PhZZTk
         rk31HCJG79bFcgjkokcebMSjMeoHDcLwY3Crapo3cIQ7zA/kAYqozJ+/eOopp4pgbGre
         FTEuSv5u9T+4cZcWhzBUgMRCdcbfqeTsPlDH5ATOt+42vGO9JQXyxavbk8GbX8NTAkUZ
         FtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z05kgezgeQBnAhHNLQ06IrbWptjbuPKQZgHZ1hJUBJw=;
        fh=sog//v2rjv1Iivt8HUMeC15J83D4vsnx1N7Yip0Hfzs=;
        b=C6seemnHFdgvl9LvSGka+VFoQ3MPuJIW1PuU9HPRjpTMyMaK1Hk7T/NV4XEolfP5V0
         mWP2rvqpHHBHhBYixSZ+u2pVK2OiNwoul0dORpnf7jChsJcvWT7lwryDrQHTIndIb0JA
         QPoyRKdwjcI1nTZveM1UNssQjACd918IdDOgyG0RhYb7TsX4EwWzrtic3YPyIzUCHw82
         zkJckBQlw7qLGzLYMomqAhBba5WGuLI8p/bVYr49Ri50ZR1LARv9cxZY8K0e53XIbr6n
         Xz4Siw69wWiTaYLFj5gW+d8QQh5bbwMc//UgbONnMnmlvusLPqucRH7ipt7DpgV6T8hv
         eNPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789144687; x=1789749487; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z05kgezgeQBnAhHNLQ06IrbWptjbuPKQZgHZ1hJUBJw=;
        b=g2M4yfDSACO/61PjGPBqrQrc0uxYXzpECVYGcmNPOYeaVOercFn43MaC34b7TKeOyQ
         /vboXhT84q4ct7WEnTdjtTEPCkIxDqVol49N9RvYqqrqJFZ2+kouvQKAB4ziBlVuN7ci
         +UH/CzRekC6lUCYwHDjF38Xv6OPAmykgyhQ1LZvh/YZd43KOUnp+HhIAP41WbAl8jbuN
         crgTVbtRD9D+cDvw1ZIS+QSLRRUbXrnlA69krUc3znpM/G5PTzsiJ7+J77KVPhNc7MMg
         H1OnUKJfSWUe1oixFPMtZZmH0g1nfLBX8DY5S3Bl5pUjx6/aVqpvRHp66BaDgp1IbvW3
         Pswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144687; x=1789749487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z05kgezgeQBnAhHNLQ06IrbWptjbuPKQZgHZ1hJUBJw=;
        b=pfsnrRi2H6va73OGI9rmbUCZeNeOZFov4PLoDDEPF4yRXAB5YU6giP2WjctqxYHJl5
         E8V4PuHPBz9/bcWsA3XuHhpStYnhBIbYOpr4bnfHTHgDsEGLA8Px8dZmnIMUNtTV5hAo
         n1lmqBhGAjqRp63UfyewtkTL3JanVjlzmcXvW16mUDj5d1wJ+r1SSoW37zj1gk3L5jY6
         g3ADC+Ar+upyYeLuitdG2jW6HasV8f94t5h+pkUWDYHiaCA35+OECKN8ZitYubpFZTSd
         sG3lUo5YwlixkZW7ZhR7uE8yQEZeuxe6WPJDYKRCgeB9InOEcj7nVD9bucS0KIg3p5Q0
         qK3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxySxKHtofuwbkfJGNEx0DhAreLAuB11oulRe6671aTjSh3WHBd9U8apAA+TNeQWX9CGHYWWgaON+sD/iU=@vger.kernel.org
X-Gm-Message-State: AFuF++m3p40RgfK/8qU/fCi2Em27rBrqj357eVQPOwobHZgmrzV58ysR
	ZhSGetJaIykW960K74vtyFtnDB0lRTl+sAK5usoRIiEUN2/sD8MGGPD7yUTXYbT2NxnkVmnIaHt
	HPjoWxmjyHrH5uXEYHaVoDwoyqA4z34qlFByo
X-Gm-Gg: AYBFou37Q8ZBeKXAiHQDJoqPKxuEetCnYUoAxqRcT6SrZm1YtjM4oZ4SV8zoYk7mU2+
	8imBFLNK2brpsCBdt7B5B31+Yp9CZ6eQIL8OTa45GdN2HBW8BDer+ciUUJV549s+rx/Ly56oSjN
	Gwgp3yg5yNyloAuMl3DBRTo6WoDBzMndTfRdO9HDHROPvGhz/+OhlR+21CRhDFHUjvUoS9yFHXJ
	z/gA850tAk4QEPtui3nQXLh9TmQFzezZZF4Pg2xwDXz6pmz+lgysln+vadSLHldA74+PFd2zuc4
	xNSFuwgc9e3qvBi4vYmFjIdCWbF5IKJLlMqDRsnOCzReJaC6iBlVDe5EzcoPZb5A
X-Received: by 2002:a17:907:73cd:b0:c1c:2007:298e with SMTP id
 a640c23a62f3a-c29666bc8e7mr228183666b.24.1789144686888; Fri, 11 Sep 2026
 09:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904111731.673341-1-main.kalliope@gmail.com>
 <20260904111731.673341-3-main.kalliope@gmail.com> <CAM1=_QTN3JJ6jtckf32F8wxBzLDbHSrzUttyMBWNqZKmRe=2rg@mail.gmail.com>
In-Reply-To: <CAM1=_QTN3JJ6jtckf32F8wxBzLDbHSrzUttyMBWNqZKmRe=2rg@mail.gmail.com>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 11 Sep 2026 12:37:53 -0400
X-Gm-Features: AcwNN1UBDacB_mdUgPo31Abc79q-kaSzXTwE_yQATKEr1z50cei1mPjcgBoyYeY
Message-ID: <CAJZwKkghmHn1twrwTtfGSZg5NZ5FMu8L_=6N_pb0VrP75GMKGg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, mips: Add support for BPF_MOVSX in
 the JITs
To: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I would suggest that we do this optimization.

Thanks for reviewing. I'll get working on the seb/seh additions and
ISA-specific MOVSX handling. I'll send SDIV/SMOD v4 with the updated
uasm patch, followed by MOVSX v3.

Nicholas
