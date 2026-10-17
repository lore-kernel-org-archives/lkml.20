Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C90C3AC0C3
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792223269; cv=pass; b=Q6lI55Fxzdye6//eQ7GT19DD9p+1iRxcLRXA+WO2Q5tOWS2r837kF2h1CktbDlFT3nRym3AvidKCt2ZDniJuxwf7DcVzr1JaJ3kn496ShhTGjDMiw8zbkYizvDxWKV/aPTtEvO85J3RNCKfopmFW+2Jd4pwmxBRw0rHT+FUmkrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792223269; c=relaxed/simple;
	bh=eRWmAlIfs3iswnjnTR4TzrAUiVQGOccDgG6x9wZmrjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGCjp4NdOnAmezJIIJPUPQDsegOR7ulz6br+HbAeiEXLyL2zhzW85W/VKtLImYd0gG4nXO8h0N8z70054c0/CfrIPf5QZdEvfr4EbOV/7qLllbbCeHK59Gt92KoL4x4esGzpHQYLYrOe3cZAyO+H4oDQKTI7mCKemK1oeJOoBXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehNE3iKR; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehNE3iKR"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b056d58f2aso5229097b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792223267; cv=none;
        d=google.com; s=arc-20260327;
        b=oq7uAxP3zoKFm6/ex9Z6EMenbG7K77IJg7UNWYFW09VO0Tab7sZP7OOwuXYtfO6oyh
         4gGYMkHUouMjpICN00nU4Y+1WX+ybHGUg8t5F+B/L/2UlJPUNkzu2JOPW39VNe6wT66J
         wJCSTpjzdlkSbTw35SKiNg22p8ggLKSpk5+kJJHW2X2d4XBZtfxnZl1cPacp57/FiOAJ
         ct7+NKDkvDETxqSNZ22NVD9AbfTqZ2afBiYjTjCwTChIbyYywSIKDKJhtKXgr3EtJl7+
         OA4GUzpmFc2xsZAAJY5bj4WRDuKzxja2o5Mi3PVc6f6+55pIWP1Vyht+332vCDWzmK5n
         C79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eRWmAlIfs3iswnjnTR4TzrAUiVQGOccDgG6x9wZmrjY=;
        fh=5Y+nrAoa5X6RQ8iHGGt/bFgzJDtX6Ppqgrpi8C3oFKU=;
        b=PHIjs9R6cS9eanf/zqg7NCIOcdqFng3xppaswtMAVO2YJeqiOkkjg67E++hu23qgup
         uxK9bIXUWbvTC/kcsD6SPb2qmOs9q61j+igcJEIyrNTmXXcnyPMDTlK2UuOFOW1GB/La
         UbSq3Cb2QHu0LUDj79VziFF4OrBZYDvPqPqdPSy00EqTgCdKYSibT7cXaLiS8pB9rZWB
         jvKNEvQYcdsNcMGkyQpqZ/afiUqHPjavoJCR5JYHx4LG17TnOvSLDLrij/4VekrJTpvb
         Okk58qMt9vzXYM9ewqU7wiH7WTJrm1GF5avxNmO1cSW7QCDonTU48Yv0DQtY9ww5cR0P
         cFPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792223267; x=1792828067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRWmAlIfs3iswnjnTR4TzrAUiVQGOccDgG6x9wZmrjY=;
        b=ehNE3iKR1FMemamaIhf7rKzmpTd6aUjpZVRlTnXw2rT2KeZFGpgrwgod4rnjB0KvfO
         O2RP9TFeydIiUuOuRXr9PVaK9SLUsxZ5ioS8yddVbtOZ1jBsLkR7RSGBiIhFZD+R1lxz
         aoUmGubuN1e70vklWPW3ERDyQC+I8z6DaR2t0h1fWqcxrEgGL1MUZVa0sYhUFA2YP5hk
         FXUI6VrPBFi3snLVMYVXR4j5vDaGH/n+L1GjQ95+H7A3Kp+du7aa3JLdrUjhyLkzG4H1
         Pmvy2oL1DK79enzif+W4ZD3rz/3YWvSQSSvDiEVwLJK4Er6SmlVw5AXwvLzSC3DD6mvD
         y26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792223267; x=1792828067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRWmAlIfs3iswnjnTR4TzrAUiVQGOccDgG6x9wZmrjY=;
        b=N1mtUXt5roGbKzC0XmZwq9LSbarvSz+hXt4bKRN8Nn1OPUzZKqKgVgN4H5b+pfWXcm
         eonQZ0mCAc/00C90OHyTsCmuR074yUKpTBcKAJ5xTY2uYdIAb1GmiwwBHUPLmDx+StM7
         7V46Amcs/Xrk7TiKmkbhQejXAfWRA3ZKBTyosOeI65nqs0DfGCAoGM0RsqfZhr2QUprn
         ULrGIqbEbV05CAPdkPBU43pG2uUxuNBF+BeKbnn42RxYpQHEU/6o26ZPJqA6sGGWA/EY
         flt9mjZBtkc4rOt9InJKdAzLBNWZJeJKhZUcWLX8/IMC5m2fZMTXmEJZx4g7AtlCWpOV
         7DAw==
X-Forwarded-Encrypted: i=1; AKwUvBwAiLXNXRsmMeA3HgOcizOBZehv90uoc7gS25ATF0a49lww0lfBGDvkK8kAB/AygY8jXmsX14vAqYb3WuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnaSxwNk1w842mHu+vaPkNXZryw+t6GCw4+UCnZYpZQEkRE7f2
	0Lx1kbDRrxLFYCzm15MQc5MVYEVEprZRbVlxKyGcbBhKWISJIGIdhuQLQ3TAbDzjWAEaviG1VnP
	DiipCwU9wfTURyzb8LO6nmn6fzAuu4vw=
X-Gm-Gg: AYBFou0s8ZLZETaKW8J1rVIe25g3rb2QbWG2fY1v1Qovfl32vgEZutmqVumsdBGKN3E
	huSx54sxVCjygBUPh5b7erba+TFfZ5F0XgbE53B+vLEHdAxBu79njJ4NiZRL8h8kxTmquqfjp1O
	0E39SPjFsRRtIoq//5h65pMvwt35vHPcHV+VccURwtNTn4IK7BUeFM4qm8s4opsPUCD3DORLCfI
	Poj85Wx1LtduxaSgYO7Hrh57vQHHaMc3By5KHZjnFM60N1EplftgQBUysGenDsCMVOEuFRb1GRI
	BLSmp8u5jO1pQnkkNvL1v6wN8K3Bn9NLjFeRFO2fiw8YknEZluZSuhb8wnw/YeTFgXHHIKDXjkz
	Hp7sVpLQ00A==
X-Received: by 2002:a05:690c:f:b0:8b0:ac9e:14f7 with SMTP id
 00721157ae682-8b0f2164c94mr7719657b3.28.1792223266956; Sat, 17 Oct 2026
 00:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-key-management-objects-candidate-0002-v3-2baa8cad2bb554364e10@gmail.com>
 <20261017035156.GA29318@sol>
In-Reply-To: <20261017035156.GA29318@sol>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 17 Oct 2026 15:47:32 +0800
X-Gm-Features: AclHuK-HpdMP-grbZn8KpuFXmo2CHX60pojXLGdBgVLSQqCwngEWAu1uK5ALbG8
Message-ID: <CAFRLqsWcV=0MKituMQqALy_2rS3kOPPFpMHxn7yRxoyxOHp6hg@mail.gmail.com>
Subject: Re: [PATCH v2] keys: Avoid the owner account dereference in named
 keyring lookup
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, jarkko@kernel.org, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, sergeh@kernel.org, 
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Eric Biggers <ebiggers@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8817=E6=
=97=A5=E5=91=A8=E5=85=AD 11:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Don't key_serial_next() and find_ge_key() (used when reading from
> /proc/keys) have the same bug?
>
> - Eric

Thansk a lot for the reivew. You're right =E2=80=94 key_serial_next() and
find_ge_key() have
the same issue.

I'll send a follow-up patch to fix those as well.

Thanks for the catch again.

Best regards,
Cen Zhang
