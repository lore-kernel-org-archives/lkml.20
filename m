Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792766805;
	b=AGvS6CsIvkjS89hvNzhhFml+XmxnrOp19C/fYY2OrQgZfIfwd8RsEpklb8E1H1nKW5Xd
	 kMzNNfrbpYDurRjqJLdR52P4tJ04NewB6PspYgo+UEaVGG7wxgOU2knH2smz2RW/7r+LG
	 SmuRE7a9BbMmLLKIMzWR93PrqkqyRsLm5up13QyYFwNJgSUa13NwYuMJeeA2zB45tmXRj
	 VG/2lU+XGMpEFcLDmg4sojBI6KpjIZStdpkjU4o0RyzgfNwaGpqRV4q0DrD1mhSvKtTM6
	 omDcqdr4HY+hOrVqblXyCN2Iuvf/5wPLpjIB6t1AZCO5d8kn5v7LmmP0VI6WIjniTlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QJW09rmXkrEkYFRlCkDFiS/aHyTVspbIpRwFPjx9KZY=;
	b=QP+B7MMvexnpKuw6LmzUXGd97jKU/2lcm1DRjLPUWkfxtZApkDoslMiRHpEruDQ1g3R8
	 fObrpKIIap94fZKrRAdwaqiO2JMFlYtE8bHAt1OMk1yI+z2WyqwUvWmjS5duGF3p5zL8i
	 Wrmbp/lz2dAcaiKaALrzJ1sN6cK5tyxHCSnTRKP/KjWA6RbslMmwoDlnHuPkM9R2JjI0M
	 gZRKWfULDuLJhg2qavAZ0y9Y5zKWbknz79h9hT1gTODWUlt2dK3dnXPVqOtBKOldwRfKN
	 T3RAwfE1TGaITCQANRAd83Wr5hn5TK+M5LpGMjrNAsHRmk/LUjqExCt7Bx9Tuc2ZZMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ja1Vk0HP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ACA606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8ACA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ja1Vk0HP
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35e8253292cso86033eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792766804; cv=none;
        d=google.com; s=arc-20260327;
        b=mE/dlkBzEuDjWb1BALDzeejYm2RKokSFpFjmB3as6XLAinbvAZCJlajcC7F6yrTDc5
         Vn1VIk4C1OovfJf6292D4GQ4ncW40rAw2jPRku6ROkw830xzkBOjM841fmg72f/hdWVd
         WMSAaqkLvYXKc6HdjYt17CDHudkRQMwRFDjJ224lSP/sGBMEtoDO89kGPt0wMoBDq3XS
         kFnPFHefDo0Zmrsm5Kop6IkR7Q9Y7OnhakzpenH9Dq/v1Tz5xcBOGmn8lanBZc79TFNl
         SrmfFuB+bY0pXVkYbWeGECbiR2G6H/ah6X5WLwBOrW89RkcvUxbfQ1JLJcIToWfGX0vF
         JXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJW09rmXkrEkYFRlCkDFiS/aHyTVspbIpRwFPjx9KZY=;
        fh=VbKzF1CH+C1g2Chqj+PVhfRCjoXWTgt9RNS+T0qKTco=;
        b=ByjU8tIU7vto3H3ldS1YLO7y23I0FoemAkx7Vc4esL5eEuNHGoSvsO27c8rskkiHb8
         oHt+YOSUrzlx8d4PFdajYpvhHceRNL5Fqc29fPPiAZdzrEvrW0pqLL7QqoeW2+fG3/Nr
         wRpshvQxWEBg6bVQw4/3EFTT8VHifuX9CNUwpU6Zh5kAI1cwYi8AVOXrgwwfD3rloa2z
         GRQhS/luWTRwtcCvijHzPh/1EHTG3WZtcdodQU8e0SvMAt+3cA4b6XFOWESFwKEK2o2e
         G85PWYTpHre+grc5S8XZ93d9OdKErUN9iFy5HGPsYuuiQTsMtnf8oJkSDvX1bNmA6zAx
         lXxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792766804; x=1793371604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QJW09rmXkrEkYFRlCkDFiS/aHyTVspbIpRwFPjx9KZY=;
        b=Ja1Vk0HP7icNlXXp9Ah3W66PCfNsN+UKGfZ8fRnBidhLNFTQU2YrliFG1JN14f/0Wf
         OZU7Jr4tTgWMmlqGtG5wkSs8UCLzjbDtSUzvfCj5aYWlhJGPaeRBQPCSUfBqV30G83kq
         /o4dasPIyAsKXe5ULpuY+3109/OeHPQrHjVWB5r1grftTB9B54yzDXcA9f0bl9O8ZX+B
         WyPmN/ngv5Xhtivmod24/fCuLD2QUTSPjAg5Pk1heL60LcI+ugF9byETnkjCs4y1IC6H
         kRfMZWEsVnDtnSrFMat9HEv0WUHTBwkLZ6wL5zuC8IiTK9rnLP9O8v0eK934JRGyHfXl
         PQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766804; x=1793371604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJW09rmXkrEkYFRlCkDFiS/aHyTVspbIpRwFPjx9KZY=;
        b=qn5/gnLdBgQ3izYuq+lZa0+m8Ijv8eCyav44PrGEWHA1N2bxYlwENffDWMVscqSno2
         Qeem39lBLRi5BfEJerFrhDsswSkm9rrRCHXqDe89ok2Xt3xM/T4NBqvCi50b/BBwEl9Z
         Hn70P+zaIW/qNJoQwQ4dEkeoidXsjfBzXJ+tyswrmqi/SAYMvINm4uvYYird4mZgkbpN
         6wmpzH68cRnVRb/0vcMsmmwhSiz4oM3Sc/j02To8OupEOOf0xxH0dutKlvaCaacSimFE
         yenY4Z6TNJQ0dbkBLeC/0RFzD9DNAHOMjQJTrGzlAM2fJRy0hqFnMxj8iRe/RM5+PQNb
         lhEw==
X-Forwarded-Encrypted: i=1; AKwUvBxKmz8bvqTujMF5UzpjoKaslpnRFnO4tAFEeDWy/C4L89np3xnRQpyH0JeulWenoynmUgskK90e7P8wnVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmlkbW0wbqSSzkUjHSQ2Ns3IWwiK3QA4VC98AG0C7UbnyIsRdN
	F2K3P+dNHOWvsX4Jua4e7zhqJSTNohio76BWf6CbIhRrYRP0onJgJmn+CzZUXmEsFiVI1SK6i8z
	T1Cs8OXjpl8Oa+AJd3yyPiap86PNbgzk=
X-Gm-Gg: AYBFou11PY/LmWt2mC976hlNvXKdjWz9a3YcXlImkgWOVFiFxDhDYUvvW0G9l2xk+qu
	MllRBlZyouGVYFT+99Xc9Oqr8X1wM/dS12zP1IWL353/cQ3kPJW3A72mEYhGsoeEXy8IG16W3De
	2wMK8CHr9N0I+WXFUB+UQZ77VC9abBv01Hi7/6Qwk9E+W6xvymgp16k0v3bSIS3DAgfMMG44ZYb
	YyVdk7aH8oOldj+odKud51yFLFPzdoV+aM+1Dy0RSNm3OvhrCCkUHktr/JaEV2ud3rTQCOAB9ky
	BW63v9UCIFNb8GaP4oGGlQgPHJv2V2BgnfFUFiiPM3aiZacrs+ASAp6gubAV0xJEM2CGIzda+6u
	Kwk4nPyS9La6CFCLV2GzbIrwDvXcYwCjk/DpryUypmOVsVnqNtlxbcQ7usBsgikQ40y+CrZMSoS
	W6uFCvMAOYYpNt4iwoYFQ/23UKrXqqR+Zcg11kDPUJAJ4DjdkZygqgzfTdAo60hAyS37L2HGchK
	qomd9C+9CvM/LWIfQ+W+92+QXneBu4Gwgq5
X-Received: by 2002:a05:693c:88d4:10b0:369:289a:d31a with SMTP id
 5a478bee46e88-369d8fb0485mr5202778eec.0.1792766803831; Fri, 23 Oct 2026
 07:46:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021001327.GA2730064@ax162>
In-Reply-To: <20261021001327.GA2730064@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Oct 2026 16:46:31 +0200
X-Gm-Features: AclHuK92RKUIr4fkuSKKQu6ug8T2C79gbzvQ8i9JmmXxl0iYsgxYP38OflibXxQ
Message-ID: <CANiq72=X-DXrEZ=+1PWfY=sd0Tpo-WwScvUCKCsD5NcN1xd5Tw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.4 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:13=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 23.1.4 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 23.x
> series is no longer supported.

Looks good, thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
