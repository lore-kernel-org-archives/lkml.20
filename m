Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792691585;
	b=JwXFxq+9elg7woE5Vd8EGw5zVu11ROM/kqLirhM1B0kU9y/x12DfYpSWXN2MuEJUvSgD
	 BxvsyprsNczQy/cfTqNqH+dMRKmIgKxkgF6CgHc/onWGPEoTCyUZpIsneZ0mYpCbpLFsW
	 +FvjxtVSibU2RS7j4YVmfJdgSiURQKc9g2kSF8T51/Utc9XnOIJ/jzBOPmZCIaljNsFrh
	 lTwUrDRjgyk449mdKBnBbp9cXZbE5sX2uGpBY7jp5uuIjEo390kk08YKeKQLjkROD0/yp
	 DO8bWHYWY089yvTNdZfbp+HSZ6wVdtdaOtC1JixMYXHbGsneeJLO8HUm7yrK6oSkifw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
	b=Ok+F6+V+0IzRmAn3Jw4G49DXP3GbRLZrOLPx73VnCOG1t4LD7kRItwjuJsfWAtK6fga6
	 Hz40dy29r3h+v9lhDk//ig0e9rRGyVDV6oLrd/hszjC5+d+wuZInJOq5Uz47ZjCIlZ00b
	 btka6SWrzz5E+01egDERl5F4NcO2M5v0l0BU57imaLV2B0mUc7b6Uj4Efr2M9/usp+MbV
	 uJKxN3jOcW2RtAaBhtAm9oj/ChBriek1aLlmy6RWqMoSgSoNebaCBib1OU0/92fVDoLXE
	 hVRcH9NjdPH/Y90uLWfi4+tdUkrtLNjenxm6tt4YflvQZoIJkRmIM1SNHypdPBwYjRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdWRFVVR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750C5606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 750C5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdWRFVVR
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35829219da8so1345457eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792691584; cv=none;
        d=google.com; s=arc-20260327;
        b=o+ZoQ2V2xwaG6eKb4zS2NyghKqeqX4jyv+0N9DL8QJTsoqz8J1Og14LAnhtcxlsUfi
         +65HLMcwkRG0EkLSGNtToLkzg+jMS9+xBaDH2li3eGyhHrlwpCYsxZQhoUEm3xJmIiK9
         EDhQn6ihybrz9mqh/r1AEYqiKd6TSRmxgNbCTpRgr3thVQ2W+aKgdpSZpSrcAMlSUQUl
         RkrZbQXqtpH1tf8wxVId1vElixErDokfSQV6EDvnPzhE7kzOdUDCZ2kRnPiRvYMUkOX3
         rCi9NyYqftj+pVRGl4CIMyePCjmHA5pbG6pnjWnEnBsqlbhDzcxalmP+8kAzeRsvVwaq
         r7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        fh=NZfudvWa/PIoggWegxqdZsggKxq3/k1nWC/eHxDHenQ=;
        b=YLnecpStBAkp6ojCQM01biLOtfaXwsJMAqeQRstezX7VwYzbIKB5kYP5W6S1VMguN5
         C6wgfGifce02Yq8a1f8Ux8rr390xkpvGzcCMGJe+rdX7OahIfuSri2x9LFuVEp2ymPHA
         /xPZsxANzwMFK6ds4pHuGjlOmdvJ636nQ7KBgTSLPYg8MtEseRVe7sry2k+ut7nDh7Ew
         8xfCTh0SUzYYnyHwdGSQntq6sBPGKACWhcLIJW1X/o7INzQ1nXVLHPV7gezWEhJm+2TA
         H3j/rhh/B9W3keFfA7HGFMMHOnmOKqv7ri8Hz3Q9uzU6dHjKpkUT9VIFACvfa668Ao5g
         yvTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792691584; x=1793296384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        b=CdWRFVVRQFA7nUIEbW9/tuJ4GmATopKWcFmos2aLIz3VeptOn8kVZBD1BAB0fOT5ti
         iH2TdABNtqgWFySel6gPxtwrMOUDidEbyaIWboNu3OWXv2xFwD2l65i1ZRPbb81GTRNk
         7cwzieID3NXpEioeJiX2lh15lDBWOycH3jFXVZuBdOZB3BWFLdfINCnxJgob/hpFPx+v
         N8AJMVFlDMH6aMCcHJXW2au0INS95a1s8MAiYvFXIAqnwbNiNQpFd+gzIEONWen23FBv
         NEbhhdP68Wz/JBqcjICoTozj1zQKg8BF3eyJym3D99zB3Wwg6gK7lK2ZZpZsCIDkYJYG
         wliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691584; x=1793296384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        b=Dc8ousUx9TqracrDxQ0Ros9KAqoa8dkX4dm6gc8ndnAywAjdreDyrRR3C8Z5BcwgC0
         3AD5ZYWh5cfETITr5Z1gQbacZi2MJA+VF/JiWXqVcSEH/vskyXWGMeNdB7vPJ+Y1jnE3
         /EaQUPk4LkpXVKrE2LnIttfwUxBLQiqpD5d1PqHqw7G0N85VCbLdd9HLEPk8abxxrnvm
         YhNgCaMSVVOqsugljuBmeFUm6Oph0QWappd0JL/hIn609E0i/R5nLqgb1RzElxSW/BfH
         2kiZgkujfJTSALMVKA6Rik8Ub7mwGEQpIhmSLVlPIELdIgM7XeckV33Pyr4uplJ7YXdk
         7Tig==
X-Forwarded-Encrypted: i=1; AKwUvBzBZ33y1yzyDNu4Hau9aW9CBQ/PdQZXF6hY0IaeRv7UWv4WKAEjUGHX0eAByAwYhr6P1r03+3nXbZY14dE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQTLMMfJo1/yNSWxwnqx9XiaiTCFhcTe0jolEpkL3VxvqYLpFC
	qCUb5JCUe2aFFN56DVMOrg5/qBtgVbYnRD47gemYtMaQiG+Fijc5o9RsvHUfviQHYvrScdCLTr9
	hRpUWf4ssQbs5U1uaSx3htgkOLnH2gfY=
X-Gm-Gg: AYBFou0TYOKM3pxt091PggK0KE2YnPFEcmw3bhARdQtzip2ljGYrj09fv2lbAFxfS+p
	kryKZX0KoAhun7s7qkRhrNvQVEiCFk5MuXN+OoTA3Gi5ir9pcRYdYHha1IT/uWtgYN+V6Unv/eK
	zEkMWSU4mLgpSv2LucvnIy5vL+hVqIFfxmFAFylL7ZGF2zdTEQ1tgvnRCULuNcVKhsoV/Zmp6VB
	dtQBE2aZnrY/AxXr5BnNq066dK85g6Ota+Vf4SKt4/GXn6Es3H5lxu8P0MELBmJKtQEHQdP7VLH
	1Wd14l8ENrS+l67j4rByXPgxfh6OntYrKrUMyVpl/7GVPeSk/NbR032a6u4lEmLRB2NVH2uVSM9
	eTsES0RQ7BPi1FHOE96tKyNQv2j0s9Y5ZdXMAW16Vw8rw0L83fFNOBU+PC7cyikFVKdag+mk=
X-Received: by 2002:a05:7023:d08:b0:190:716:4822 with SMTP id
 a92af1059eb24-19599bd3be6mr253220c88.8.1792691584483; Thu, 22 Oct 2026
 10:53:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015130628.184279-1-clamor95@gmail.com> <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
In-Reply-To: <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 22 Oct 2026 20:52:52 +0300
X-Gm-Features: AclHuK804zMlj-QH-mnS-Z0lN9YQ0e8iLQ84s-klji9qX-wEVgx75tAGWTn5j64
Message-ID: <CAPVz0n3goYTds2oVExJUwNcOr4kHAHUntCt0yHMueOnJ3GxCGQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate
 all codec support into a single schema
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:0=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 15, 2026 at 04:06:27PM +0300, Svyatoslav Ryhel wrote:
> > The number of codecs supported by the NVIDIA Tegra audio complex is
> > increasing, which leads to an increasing number of bindings with minima=
l
> > changes. The main differences between codecs are the compatible strings
> > and possible pin configurations. With the introduction of auxiliary
> > devices, a definitive description of possible pin configurations become=
s
> > nearly impossible.
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.

Hello Mark!

Just FYI, this commit should be applicable to the current next since
it was made on top of the recently merged Tegra ASoC schema for
wm8994.

Best regards,
Svyatoslav R.
