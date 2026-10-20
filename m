Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792501135;
	b=ZP3CFJhZ42t21fEYfDhOStcDyiSgIutqA2mBc7FiaxIphL3pHw13QXHP7inzMghCpFU1
	 XPIrvyj/BGZER+BtImY1qF8Eek0LvyXy8SANiilK1ZeC01HZ2Pq9zo0Q/mHjzvRWObUu9
	 b33p6+Sqkk9+8CR2mKmaRAxnTw4lolN0avpSOCRod4WDCnB7aOqcLgwjVKcjxQQctGfmm
	 bnEngySu/v2qNvaihkk4Egse8jW6Fv+BxkhUynGKSaPh6OM/TaRewl+5fBQWAyU13cRPb
	 lHGeGU7/EvkTkEFfzGIFIWVJv7xDDBAbVTWwfQdACge48yGZ3bcIctww9rFpLNMg+qQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501135;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
	b=CmMLb8OicI8mHKnGiJvrMEM2DhLidKTim09FzUJD4c0Qh+krc3syTUweQfEn1OSf3L3L
	 6H3rBwJFFopMUn2++goVClwysG9uBXm2iDO4vQVaB340WM3i97ZYHjSY/D3BCP7U2h+jr
	 bUucuDCj2BCwkQcg7x+dNui0MnqXl+0+G87A1SDaXA7YWM17ITv2EuLzhz9TWI2gyfakL
	 1zzvto6WhNWGGtA1JoQa7MYIBKOeD004TWo2GZP5AT/EKCtjUxgxo5H5cDAcchmzgZBhy
	 Aa1Ldf8BxtnAc14BVQJ587EM0fi+3LcmHB//Ry18hNTZQhNjylLN1En1T3CC79/hD5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M09Z0Vco;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Wg7p6buZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED89606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED89606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M09Z0Vco;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Wg7p6buZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792501134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
	b=M09Z0Vco8gImomfu5QxOfu6+Rnar1kywixCuYq7KhuQBX1FDn+SMNSrNgYnmjivNVBHqux
	dIG8KoxvBwpA54I+uVCKTPnmB8/+NbHs4A7braIarIi8hRu2OqwjnvcN8AzYadMGmBMaSC
	0DeiLujlArfqRsdHD+okC/lt7TJkPgA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-vm4qE219OGSedOf4O640fQ-1; Tue, 20 Oct 2026 12:58:50 +0000
X-MC-Unique: vm4qE219OGSedOf4O640fQ-1
X-Mimecast-MFC-AGG-ID: vm4qE219OGSedOf4O640fQ_1792501130
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c4445512dso2862866f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792501129; cv=none;
        d=google.com; s=arc-20260327;
        b=oIlllGcsMgfOw/DOl8Yz4BLzxhIAPKZN5rjJEQyhLfLW+yNNsVCef8LsjbXp0burHD
         Kx6aDg38tpeyPsh4CPLohukBXlIzh7wUG9Q/N6tPbs5LUaYLTxDIlz/2a/KFgD/sB37/
         RkqaYobLRfZKhCcc3vSe+KjTrI00dReH10d0vONSTGBhaBdgm+lN7zDxTrL7Es3DGmkF
         W0vWTfSiPEat3gCazNe+s5E6RfX5rw53SC5iIKP3wUc3pMev3Ijf39LpeRRmhYCrMZkZ
         wcNq7CR9RToCNHmICR/CtoYulg/n8Wt+vUqXisZMWUT0JMjnLk918iJrFfw5c8eZ2EUa
         sfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
        fh=+ajOIVFcpOtSE56nf7C4vg6b6Cakf0VZvwuZS5UGL8E=;
        b=Xo9OB4pm4rfzv8URm4CvekyNTFL3WXAV6VdoHQ1LNQrijlAqkpbzQ6Zb9o3aClOKcm
         HfOjiO1r1q6Awc0Rfbr8BBk3YwtgfAK5t2/rMcYlPo9feikbU5XbcTVsyTFEpG09VEs6
         5t7LYU7MGjt9llm8GJcg9Z3EN4yK0Qy5B4ze6K70Z0qPinjx6VpAGl8X2dhcTVGKUUaU
         CDOChJyRb0Af99WT/Ji4ABkXlbS52vEs1Ic/NSIf7dVtj09aHZyq0gFhiJU13yoHoqx9
         78p2iOTjO4y8Vg3zNt2S7Nghqw0lwA9eKHTN07kNYcmbKSZRLWIcyuUXPjbiTXoosFPH
         VjkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792501129; x=1793105929; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
        b=Wg7p6buZuipxNpz0ZdaQxziAT1GrbeVjckzLhmLQDo1l2a/gL5BbVaxUHuLM0r6TMO
         RNZYYxsSb1i+ZA28kk8sMNdPWY7EFnRRbLUkjav0ea3idgcT8vSyK2vcxgUjomdUnQqG
         LBTw7mfTU9TXN5TUed1lmm9irUxsGt5/IP++bJBMnuTMdSvJ3gji6Vr46pa/RqRNFtOr
         tSgFBuprcnq62amlw4EeoSpryudQsEkWcUjPZ1Bi50kFRMSATC1PVdTXPmibog1A1qhj
         cTl3yqaTbLSS+9awdfTKNV+shJ5h/WI7lT7HYAJKn4+c9tEIFOke9N7mMj2QzkTIYbOw
         M8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501129; x=1793105929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VUxthBqiZaOd+FFznks+MirJZVKuej0EZmOWkfi5vpk=;
        b=dbB0lbX1Y2Du+yUHiMMGH1AQ7MYhohwoWg+w2/mEBu4q2k2SOaqmIjoYoO4jL4Z1tC
         gZ495dkvjLKM9On9HwOoiCBkn27VBQzJeq2psZ9JfptQcmkPI14BjX67LoTTvZOz6wCg
         dTjNpa347doBd176CBeB3RPNp6YPjDfmG3rnbu/Z3Q8aE2y0I8HewbCFaMmFVnlME4ju
         mk7rd/nlVdsAEBgo15//HvLaI7XLwMufBCbTmee8OOmV35HpYwSsGaCy8Bk/YgCNH0xL
         Icz/uD+/kW1H+nRzEOlKXBOvudEePm4LvelwiLjX9e0KCrbA6Y9g1hWazh1nNtUFuaEC
         9YLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7Yf/1moyfM3JmEpYaWUPvFxs0NlJIWvlBQjFuE79y9KRBH2KQxVj83fuP9hgyAH9AHOV2H1feX/oafJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN9aBtOmEYvj8GkgqBfSnuF+bB9Zxxo9ydKh375nWlICr1E8mI
	NldcYlE1XL1jrIbsRua0ypcTNBV7HtxUMXn3qQhaeQXMwErqXg0xEr9kQa3ZIBaaNXUP5+R5Rm3
	de+W82aHet8ws48ameMhLendahM8POdyPT2l7Ukv24sRhEEgzDNzYm/8vd8/C1kYqgvfekOxESL
	Cr7DoXTwjsNAz/ho7d3ZhHlZifFLCaBB5PALclFMVc
X-Gm-Gg: AYBFou12Txvv8iL0ZIG6ulqsazuQdcQrcDcoK0vowO4vy8hucvVBqTamMH5Ufqjdk8p
	EtliYa5YnQF6XzWlcP/2QTtqj93kXK+w28SgyQbOjNcOcMW2owRDuIcM/NX2CR3pplcwhJuMNEw
	dFlVqKiWupAvHnJcjtuEG7NXPy/Har20bZPs5FxMSDiE1uiObb76/UFFLt13t71QAz3QjHju6ds
	UGC6gA0OU2vD+oRuk3Fs1M6nVO/1U0/dCYr68N/cxELzfVozpIHUyWCCg4rDg==
X-Received: by 2002:a05:6000:24c5:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48e07bc17f7mr19463054f8f.28.1792501129594;
        Tue, 20 Oct 2026 05:58:49 -0700 (PDT)
X-Received: by 2002:a05:6000:24c5:b0:488:7b66:140c with SMTP id
 ffacd0b85a97d-48e07bc17f7mr19463023f8f.28.1792501129183; Tue, 20 Oct 2026
 05:58:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atdeLNa8rtifVnaV@sirena.co.uk>
In-Reply-To: <atdeLNa8rtifVnaV@sirena.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 20 Oct 2026 14:58:35 +0200
X-Gm-Features: AclHuK_EyXz6S57-dKvlnTp-wiyLvlM_cIx0foL-YU26mYTOQGN3J0P1sUFgOR4
Message-ID: <CABgObfZJJ8WF4cYm-cqYY0OOBs2zJCBV54+c3YVjCaBv_CiAmQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm tree
To: Mark Brown <broonie@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il mar 20 ott 2026, 14:27 Mark Brown <broonie@kernel.org> ha scritto:
>
> Hi all,
>
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
>
>   tools/testing/selftests/kvm/x86/nested_x2apic_test.c
>
> between commit:
>
>   994489f04ebbb ("Merge tag 'kvm-x86-selftests-7.4' of https://github.com/kvm-x86/linux into HEAD")
>
> from the kvm tree and commit:
>
>   8b0aa41839602 ("Merge branch 'selftests'")
>
> from the kvm-x86 tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Oops, my (harmless) mistake in solving the conflict. I will add a
fixup patch to kvm/next.

Paolo

