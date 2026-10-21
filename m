Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564544;
	b=jRvlgIy48ADR3CFW7hsA5NYacMNtjNSitsksaEhHFBvhBtGRvXLHl8o2OEHKTryTbX8a
	 uKIMri5zeZuceVM4l2UOyvZyoevDKrWXgPPDpUQ1f0iPpsWPBK+9xENJjdCeWhVPBQWK0
	 6bPGX4u36UwhsK9OFhSAkSeXIhvZnS064uJt92cmr0yuRYqOANema6ffhsaAl0Xnhpbfz
	 bcWzHVBHtjUPchS2fgpx3REfl4hNHa54syAS2CdkjbVabYpRK7WczGo5Z/AIF6vVPbS+O
	 xH89+VnD4qB3ONRelt8Y6t51L1YDorqNnLGpXo0p0pKlmkjuyKTVMiodpTrvslXHcCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
	b=WQYqdi3bHaaSuZ6CK/eZHhaNVlzd/HMMepgOOblpAFhM/VmG0QWkpKD2VQNaKpEUcnLT
	 ctyMW93p8SmVKNtISC+5VSfbccW5ZPtyAHg1kDXcvAYW6gfwC7amE13Z/Lg0s8/ZPWArz
	 u0bVJFyOk1juN9begDSNorcpk282A0pb9qYMwXQNXSzCnKQV5iTgccRAqVd3WZsyUdFN1
	 q8mdYpifiT4VWaHJFdNfMoDiuyZjT30MNse366j15VTpoys9OMYUR7ViyhAcc8budxpxp
	 B219/3SKlL/7y0XF+rhMuupCaFcfOFa4sRtLULczsCokoufjOSSv/yMQ3cQiXeoAD8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SQsO8Joy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D2B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SQsO8Joy
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso443406a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564542; cv=none;
        d=google.com; s=arc-20260327;
        b=PlfR8tLN/ukluxlj2vtgAI6oGeDHNHaGsQoB/D7rs/MrZl+Iz8/c5UW5jZZ5FNZZoy
         MV+pUPLykVp7ROeImPD2VqgTOGfVLXYfNFneV70VBb03N63okhf8JfTD6rzCol4c5RWX
         O7uR6Rgkla38BUmpsCWffJGnqjLk4QEUpeyECE6OYifGB1FDRVA57hauSXU84/aoNKiH
         aYKppUxs27rZ4bveEsQELUuPcrUQXfpKUFJ92AauvuqNLxbxuhJqoORyqSmvEUyVmVhw
         Cdo/UVlAbuPhjYxoLNoSc7jOrlIIEmMwBYTpy3sukhQ4mAeFwiQnFiO+bwM0x0LvNRia
         kvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        fh=jG+bWquAms6zkwyuWKxAq/gRyyrn8Rn1BfcheTQ2zQw=;
        b=NDKtdaxzDfG2YtvlgrjPQK/eju6LRXiUFt4p1kKEH+RaywtWZ93mMlrXOUHkFOsxyC
         mmzxS+9vmbyL+HYpBbGBuCKKUv8TZset+E87PVrVgeQP5FLOhbLQPctXkhfnspQp/9VG
         vgvImt4BignqISjH7nEcAeLwf2SHqnVRa1/e4acioqtpa6ukg90ugNE6oJCLVh+jdsmh
         A6OOdygVAdSKkz1neQRwWx3LSdHgvPe0dgboyF3qtMxQgtpA5ueLBQ/xFE5C214fJXBc
         RHGPBA1zpp4ox41AmjBAJ0/ZGntdjd3ngcqkBO2sg4QsVYq/joilXUKaPPuMe2iihYwV
         11Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564542; x=1793169342; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=SQsO8Joyz7VS+7gfUvSNluNI65EhcKIFQMPJULqGN5UfjLP9MzbUUAM2GeJ3hqkllf
         uQTdBDyQbPPjRYGai0WfdeDnW3WO4+t42Z2mxWWGm4pmVnVlCQHe6qlpBR9vaZ+vllGx
         h2xGVBgEQCFKH11r+9q5QdY65sS295/+Tq2DS5ZXmmh/j1ULBCd9h7KS+U9B5Cl0c3Fo
         X3iBdo5tlBejOn37rvZjodYCVcBnhpW++UlRUA6F09Pri2F5ZzW1B1p7sy6bKVbEkrHz
         Wb8LUZX233PjNaT0LiBwXYPf0Yyg5Q1S+TRvn1by6+Fz8GSTOQ4X1R586y6DHikxclnf
         NB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564542; x=1793169342;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=tTAqog2E/BWXruUODGrdvj//Lf1r13ToZyRSOeFkjcGfvVsXv3gnfourwuA9jt9Ddn
         JRLS+xiNwgBy6HadoDsTO+DA0lJn/Ko+jXJ9UtNmmhdzkt7685xLqDwkAhHpdEoKso9o
         ShpNggQF/9gyrVEAjXNxTQB9Rh79LPKeOmBoUNn4cB5e5e+RDkfFVrNnFA383Kdbuku7
         0vbdaPisErd8nmXCSySVre02uyFJnAQmQX0L+MKtb7kE4V8CZb7MzbDEccsS+Qos32tw
         ZTEFoSm6xg5bjFd5eJsd/fR7HhktKik6nGWhV0PYN5G7v9aAD5gbPhE9+8je6Jq3LwjE
         Bqzw==
X-Forwarded-Encrypted: i=1; AKwUvBzFD2rGwlYVUNfqJF8wOcKYxS1piil/Mg19NPRpPqB/Wxfreo5WDog+yi0SZ+GzGBfv8YrQGBXCnx9kFO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/wpjO1k3CUNm4Yc38+c0/MwIX340GymhILc/rDfy2EB/nMy0g
	mAFJ0/tQ91MEYiF/Fh8W0ooudHj2blUiTyR8prWk1mMdsOSJbZo9WD8x7h38A7b464QHOp23vVs
	BYINNjE3hRK5f/i8nu9P0qlRPmaEiXI0=
X-Gm-Gg: AYBFou1zzAxTcQ3X4PbDt2IoKQ0VmDGV/baFpaiz3Y3s9eedS15jIRJJfEF7VhPHPVW
	N8ijRwOou5lFJACqyFnsbHB5a0n07AphuybrPxL1cgYMy4DRHexf/GVgbM0B3JmQrxmPrgOVirY
	gKPA28bdXt51xjx6OYC1MnOKnNXB3VTwkxv9y9VTj7NCmd6fNMQlCAo0dtkPwMDPhFmjo6Aa7Si
	2xnbP+lCp+ZZZc06iDFpn7ruRRoRN0wSNoHOwwpeOEVEtc8PjenvFuOqvJQjWZEkU828DaQIRVv
	UMrgX/nHS777A/QKiNxzjoavHbTRuuRoa4/0iAeesYRc9ginOP018KBzLbAvCNzKxs2d2X8jvLR
	9FjZTKGJ+rWWovLAM+c84q5/GxoCS0uQhoHV6Qf90LeQAWF3c2eaIrfDX
X-Received: by 2002:a05:6402:2105:b0:6ac:5de8:ab5c with SMTP id
 4fb4d7f45d1cf-6b408ea04f0mr627314a12.10.1792564542175; Tue, 20 Oct 2026
 23:35:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <20261021023245.GA3650393-robh@kernel.org>
In-Reply-To: <20261021023245.GA3650393-robh@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:35:30 +0200
X-Gm-Features: AclHuK-lIJk49lXRNa98GE7gi3l_Bk4TgNu432VwdO696lfchFDIYtZnsg1U3Dw
Message-ID: <CAORyz2JS1vf7P2cQkzYse_WheB4xYMmywWi6v2pNbeFSkCO9ZA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Or drop the example. Is this one really different enough from the
> existing example(s)?

I am so sorry, there actually was a previous email by Krzystof
Kozlowski where he already asked me to do that and I thought I had
done it!
I'll send out v11 without the example.
