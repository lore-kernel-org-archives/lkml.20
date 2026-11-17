Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794917273;
	b=P3TiCxSymPjK5OHS9XZ2DtzjVLiXf8zYWVdqlXFxN+mjRcH7h+UMBhckLTRLRtPbBX6C
	 mrXbAHp2nv0nzC2qvUVhV5XCEpVylPvB3fhUSjKTkAxQsyE2ZVzAu87FgfdfJ1l+anWVv
	 E5nEuA+yhQNix+yxR71SqC66eMxE9efRAKErhX1smuyuosvI5CRs1ZzlnJ0o+Uf/VECT1
	 0iQGGPZyaUQOfwQQiPqC50dOdOm96ye3H4w7gnHkT9d8T/lCzjTjOI+OLelV3F4BhTC8W
	 IL6eXv8TBQrfuBidM3wt6wNs7G6Xk3Umy7XDk/02kuBRm5maqbUbHVEHlV7fgqQovLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
	b=Y3UT5YyS1Sj2f0AnumODFA1K/E1wFrFD/jN5NSOmy4qnhdGI03ULlFbgjIsHSBicKhR+
	 CUtAXj2MmyhLLjj/cy3dCa0SoiwCneK2QlDK0jJ2oLL+x9hCkocTjladvT/ZQDWOXCEIb
	 E+AhdV6qZCacqrsuz6GAe4RtfSZ/G0u1x/PaaRw2ztZEW7JVCCXmL+DDjnhWioRxes6tk
	 q67qCAqHSoAkKjSjqS7tSdx+kaEv4roIivzUVWNDte2/D0jBNxhq3qWQG/PZrKN56gBxi
	 RdsyrhURLw+cdvXvXoUUWtc43ZqspJAp7TE5NSb+Di5jas0GklUpO/32aPbZuiJuUXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yT2buM5f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D614606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D614606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yT2buM5f
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so349116a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917272; cv=none;
        d=google.com; s=arc-20260327;
        b=Yf0dYAkObq66HarmVpJWRfobksr1vzc4da/VfmdEp6+IQScPHXNz9B/iR9mkZL4pAq
         yDv/29EThGkNb7uT336UhUgjnbl9F+i30lhcjTjcshJFa01Gj2jWdhJxtBmTF9P3mAtk
         1gmZbMgnSkBh9aqfxUsp4iaf5yUcxARJkXlIiZmI7O1BqYutRp0h8K+VGaJhBT06HuiR
         3LHeuTON3vncU/URSxRu6mkY+uhdXtg/tnVWdYoQbhal8UL7j5oeIyFntHjVbuDS4B7e
         I+tT2S4sCsvG8bRMk51rgyr+91VzvKxOb/NdOyNscBGhEmpMuFRdjT5wFJGlGXmNEFgR
         amzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
        fh=8V3LxKbxH5x6zIia2ZtwmSFk/QHGFK3qO4JbjrGDRec=;
        b=kA77muNvXsUcqg10QttfWJhVY7rpXytYYfXf4/mY/BMyyF7+oIFD7g15irWUcNtN0p
         cMkGUDH37E9QLNGJoP1lvvmxhtvcRj69k8yaZ0gUZXZyyGs3fiTb01buAr4RbsChtbqa
         Zqcv/IRoZI52BMXAebVqSJMFxU4MVm9HQRGLSbArlbxExEmD1M8w2+qW8HqhkWE8ZzW5
         pqNB2quccVdMxCySEGoEePO68PFdaSRd5ZOK62s8jFcFOn95Gp6u3gQgZkkDocskR6sl
         s1Arh4zwFUV9JkekHGIsSc5GmLluajWVyreELWrz3wszGEb/2I3jTIPyBbWqVyPksFnh
         zcXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794917272; x=1795522072; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
        b=yT2buM5f/ppapgIKkt1qyAFXkHTCDWFxu1nFiQj/+1bnRTFgs0rjdWsDhnYZIrMfpr
         9xFTp+ilwjWZCyBJWqARWwVvmEEP+tSEiHOHeHFbkZnbSBB3NpDw6FbGUs+WYA342yuM
         AdsReXpslF04nw5MSv77LguBTMragel9DDMsKS/WFOIkgtpbjswkhuDkQ4Gq73LkjBDA
         tgFimZI40jBglY6FBQKhsD6kNSaLw2dm1yXda0yvAkaVcbxG4p2JRdBI7ANwIckv/Vct
         AP6lhaKtfLm3Z9IafVb0mFak1v6WIrKvojPNkmz9o2hz16VHbVwpHx35nEXDgb3G96qH
         tUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917272; x=1795522072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
        b=L6RV1T4Il9fTs+eP26dfJo8PtC1QVjuh+p1hChxg7XBy7JFlxa4+NxCwJlOVedeUR6
         VO4MuzG89DnL5uiNzXKjiI1jNtQuvE+wnjGlLhWu5DRd7YLDr0JMnN0osppGvCLwzKrE
         tOOifHqHHHCaqnqfyqmHDftaZ7fsQ5NFNhkX0w2Bb5DtYnsiVXvI4Pb3MIVYwRW8ErPh
         0QkwXR3g12tzdubCMk6dNN3S4bZyfs1AQqP06rXoBYOFdTBWF1q+w6i6Cb/uNczl0MYf
         Fi5cXHpb65kFrPB81HiRixtwQsRuduvdOMHeDMMDr69jEKSNrLaMckXoJzRAj8wpQyRI
         +Ryg==
X-Forwarded-Encrypted: i=1; AL+hErGg4VUC4leTYvZGaiW5wWdNIIZNVknH9dDqks3Wfl+qlZdOoSG666nb5GcVkzfUCd6QNWYHTSZilJfQb2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZFpwKE32Ji+vX9CfRJQ48RtdhYJ77DGu+3j9m+7MowU3G+Cbf
	BpklsaWMxmHDRNy5ZtsZk/CwOxbeTWsqkcepy3PQrDOi/wnzAnvu4gASdUzVJ/Xre3gOYGVVHGt
	ol+BdhfnXOXPfnEaqEybCFE76g+cE8qI=
X-Gm-Gg: AYBFou0/3ScC1GsMDoUwzjCu/A2CXlfsdZ+AmweHiT9Aphpj+QZOyUwGxe7ibRimrpl
	FVBZaT02dEMB6H2JV8jRlSpU+D7NgHnPjeWZya5S7onFOcM98n3k65IbtP4badoOmO4XASMVntL
	WqfxWTOigivFu88LF7qmxKUhzTsCiAQQ3qCRMCIj4UBdNP0LFbiNrXQno1IEOiguojwjnfwDsK7
	qWX6fMlDC5hbw7j093RKgmEgyMySQm7qzMjO9JWfu0L/YdOksQ6xDOfqIZWYlRbXuerD9Vq2zQQ
	K2aCK9AorquR3Ay5cgnRVVhcyPMYpG7jF4U10jv9RxqJX3o8Hp3KPlvGoKXrWtmPs1xWJxNTpUQ
	D5yrenOPQsEBXYgzl7phqZ6MYKEplHxQdZjM=
X-Received: by 2002:a05:6402:c6c1:10b0:6b1:d62b:a8dc with SMTP id
 4fb4d7f45d1cf-6b7c08b4e88mr7273282a12.1.1794917271385; Tue, 17 Nov 2026
 04:07:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117113402.728183-1-l.scorcia@gmail.com> <7fb43d3c-8c9d-43b5-b979-aef65f362ed9@collabora.com>
In-Reply-To: <7fb43d3c-8c9d-43b5-b979-aef65f362ed9@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 13:07:40 +0100
X-Gm-Features: AclHuK843kgmezwD-dXfy2-fm2q_WSzPEZgRrKlkUSUYV45gRmYPefogu3Bgl1c
Message-ID: <CAORyz2L_NDcvj3KkD_6CPFO3QhX1dGWphc7Pfacif2x0n=O_DQ@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mt8167-mmsys: fix errors in
 multiple-output display paths
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> This misses a Fixes tag.
> Please add the relevant one and resend.

Sure, thank you!
--
Luca
