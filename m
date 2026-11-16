Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846804;
	b=Hy2gvGLNiZTTq9XazUv0YQb0Fhuj+V8uPklGNoJCXy4Vn3ppJbAZ3jROkTi/Mfuoyvip
	 PPYay5C6tpyZHJAFlJrgeBTC7UovemAsWjv2n6pwYV7Kc3cFrxhG/BiISF3c7RkTZFX0c
	 CxtATgwlhfv26JOpay8EsDliifoaPRIiidgOIg6y00mKumybme6/aVCdLKvqFrKFwULQj
	 mp1KxMDpB+FxzzTw0jnYlMXmQnkpglf+8nceIjvzyusQfkdp/dE7golBBWIlYbejyop/P
	 H2nnW+OMavVBV0sjEHiALsa4aRqwh1eo3GupTrwscKwHmP4TGT0dGHdEb+7GwJ285UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846804;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GXr7TvVYy4WPx6ph5OJOFoOmqPDe/zCDq2W6XppAZFY=;
	b=z3SD/Ez4Zss0JqHIrBGWOVy5GjAkpsM4ceftBfrf9k2e1lharM2hUSSwSmY7I2Zjnckl
	 bo8Oh1XbCDXRlYOCVHWL20IyBdpfhhSfhSrZy36vlz/TSPwKd7Yn4Z1RG6eYs6beWHAVb
	 9dVJSY7bQAlFGOb12Wh+/D2y1UwG2svSt0YxgMJ79FSFcauE5eKFvtPazUfU9BYm+birI
	 AtkQHKIqeBja3X1l10wp11Nbre4MpSPQr4W31mP/kCN1A+V6Hbkpopc8A1bewNq/lb6qM
	 HrSvPPlTZZfuUyHKR4uwLg6FZsBefgPVEjh226KMdZJGgpPCY4+1NSSExvvAUnMPtCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oybvROvg;
	arc=none smtp.remote-ip=95.215.58.84
Received: from mta1.migadu.com (out-84.mta1.migadu.com [95.215.58.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3A606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C3A606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oybvROvg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GXr7TvVYy4WPx6ph5OJOFoOmqPDe/zCDq2W6XppAZFY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794846801; v=1; x=1795451601;
 b=oybvROvg9H0z8m6wYuLe3i+Ft06BKiv4FDWi1L5WtqnJc9gTQvmRu5EFYPLjFBbBlw/EMPVB
 qWcLb/tAh3gae6y3URWo88rD4zZS5LnyQINop/KgLgJzSiSr3XjNuYhStQQ6rQYp6ZO7NJrXGn9
 /rtjn1Ffn20oD3WppxPTNUZw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c435ed4e4590a9ee;
	Mon, 16 Nov 2026 16:33:21 +0000
X-Mizu-Trace-ID: c435ed4e4590a9ee
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be58ad9600so11574e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:33:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErECpz4CgvbUJ5IXG4QA3xT8ipPHNa4UYC76G/soxRGDhYe8XHR/rZ/WIAVSjzXIHjAvWAhpBs4BP8r4Mfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tu1zh7urxvPj9WqogCZYG340O9qW8h7XFddZQS5RmKXPsGq8G
	tmaakKnSOc5k1HT7ZsEhiLDWIPh0QyfI9OQOR/f7+w3MhvIqei68ICl3xtOsKrAzQjpu6k3sX0y
	zC1mgEVkDI06N28NIxtsVbvbE5rEn1YG4YN0cUGcm
X-Received: by 2002:a05:6512:1156:b0:5c1:5978:6abf with SMTP id
 2adb3069b0e04-5c17e42fd2fmr254711e87.9.1794846796829; Mon, 16 Nov 2026
 08:33:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com> <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
 <avsNdPissIDAb1hA@google.com>
In-Reply-To: <avsNdPissIDAb1hA@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:32:40 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
X-Gm-Features: AclHuK_oLN7lZHnxxyf05gt8nVYYVHzgK9T59Mb4I86hjWlMfwLiJmejDHvb7kk
Message-ID: <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Mostafa Saleh <smostafa@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 14:04, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> Ha yes of course, that's the host s2 we are mapping into. And on the guest side,
> we are only changing the software bits, so no CMO. Actually I should have read
> the comment in stage2_map_walker_try_leaf() more carefully.
>
> That said, I wonder if that shouldn't be handled by the hypervisor, just like
> hyp_poison_page() do the cache clean.
>
> That would be slightly slower than letting the guest (who has a mapping already)
> do it, but pKVM is enforcing isolation between host and guest, and it feels like
> it should do it by default no matter the memory transition.

After the discussion on the related thread [1], if we have the zeroing
here, we need the clean here as well. So I think that this patch is
the right fix now.

Cheers,
/fuad


[1] https://lore.kernel.org/all/CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com/


>
> --
> Vincent
