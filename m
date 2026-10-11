Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEFA314D13
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736772; cv=pass; b=bcJOVHdAEEYpW6mX35OYq0RU16Wgcgsw+bAK8uhI6hsOd7CpRsGBQv20w0AK7dqdF6wWctZkRaUmnY39MnCPa08P8DYXOg5fSJSojePYBFaS3QYpqtZjt79WJlE3zOKIRaMwQnqkVay4t3cFAtPCPQmTJRhwYkJT9nirJv6cSGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736772; c=relaxed/simple;
	bh=zBtcwkC1UetxURqz8HrxesKE3ZLqea1Q818EN42uR6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIAy58AOoXQD4a33v2mJE1kR6r1Kq99k98k6/v+QCIPRGOJmDmY30fBiDgn+TtqYDT1rElxBuUC+XfoG8yNJPuL1Myepq7dujS5RlkiR0rZGlB2Wp0/NPBRBvylqpPxJHe8d7SO5/XgOIzeDArj59QBeKCWYtiNo8IreE5Gt3rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Faz7hsFn; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Faz7hsFn"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-355724d032fso132864eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791736770; cv=none;
        d=google.com; s=arc-20260327;
        b=Qsu5OfLxAl0TC0KT3KyLBrnYs+8ysdpolwPbN/XPT2AAeqxNiMMkHyokrHgKitQ/iP
         +7gwka4d97dyqvTC2zURGLZjijwd6EaNSL8+7Hy2wwCTu5jMkPA1NqacNWRy+gHPDLBZ
         bHzXVTpyeB/Ng0cruzwL+fPsFGjCE3LooeMLRu04kQThGXyGDwPQAaauhlbnEfY4qqSc
         mnKULqKMnd2a8MAFNYjvPMXYIGVXgnv/dUoChZd0jztQhdQnBfNOuEkZe+ywJHpTNNMg
         jEGFWMwypys+rG9Aqx4kjnTNO8SdoldFO5xjnLE1OLYVKWpc0l3IjK/uTLgwAzBBfHj8
         WjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zBtcwkC1UetxURqz8HrxesKE3ZLqea1Q818EN42uR6c=;
        fh=nr91vGeL4XM7DFQ7nbCtf7SpSR/uwvACIMSdpH4Sktg=;
        b=eaLlsCicAO0A9asSRLeNZXrc6v5XyTjPnsJiiYNSdkWV+k8piZnpscN8Ajx3rWJLj0
         lAk92VAzSiAhZ1F9q01iq1YuDJcuE3WHuYt5o0ixAJhbdVi3iOz+AzzY2BfOlT4a1wsj
         cqIi94ztCptOeCsp5nmBDwM+LSiGQBf/kggu2ZXy7KHRE05G0dx5dpKF/yKTlB/SI7EV
         ty3w51/7QpCiJxZOW4tkE6Ejaojizvk+yQkFamPezexW8HiHurBp6W5JZMUzLt/vrD+I
         /bG/VA6OdqiEcVwRXuUfKuryxZn1XP5fSvpbO8W+dtFvmdabVL0X9/TvKRkzAbpsIc+I
         0wcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791736770; x=1792341570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zBtcwkC1UetxURqz8HrxesKE3ZLqea1Q818EN42uR6c=;
        b=Faz7hsFnunGBHFqvsdNz3nQC3xV8RWVEyPmMPWEqWUFm/fOEwbqslWHwSqFsom4Vnb
         FVuoLwUkLAlR11Nv4GXo5YZlhc1mHd1Vwwq+uF4Cw2XpBb50gVe1LrKDgpAqhEchOWZ/
         OCehoGQthN5aPqFr/n47yXSbgUeC1ey6JGPv7b5e4mj1154Ri75TGeqvNlDRd17IW6Vd
         lF6uCPI72Eh3T1wTkEq1vZFBm5PFOpQ2YkNv6jtKMkWWH2Utbt+3UmJzyEbLs16+CvGx
         zLfQuePWe01+IWyHa9cweBCOlgi2At1/8KQxrRC9iGZETagFEUJUvdiDq4Izln8V58qn
         JndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736770; x=1792341570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBtcwkC1UetxURqz8HrxesKE3ZLqea1Q818EN42uR6c=;
        b=qwrs3eHzDpKUu302ofjtB9EquNRipnYCH9OWt1xLgqO5P2nelVSN37e21IZ7pkntOC
         Cq7fPRmioD8PwGCQ8Gg3m0nWP1QSjJ5OYYXb7YUK4SFoT7mgQZ+otFV3O/LdaDjOuW0o
         Gv01tL8sbsHJbkNrc9h6GDuBphdfySM1OsN0eY08xvim9L7QKrrGWnKYCLkEzMt7L4Bs
         IIGOec06RrDZzaALN6DGKQyflAVrnDk4hyCzPBiJWHRRWHPbNC4d9n0Lh8/ApI39Hn2q
         4N9u9YAUdfAKCUXHgQlsZNDPDczQaRR81rMz4UXgXM0OeiiXrR5t6fK72636oTmyewMD
         qkZw==
X-Forwarded-Encrypted: i=1; AKwUvBzQWDlLSyL4Buw0bqcodsEDe+Yov5Xe0Oxtvp4y9BMxksXlA/mMoklki72C58KuSkRTqinIMkp4NQkVXIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNBXCL2cpStxlmcXudkccbPyRdt0s7uGfMt0fhmEdDbjWxMdJo
	yFT1bCKpMAWZ+NMGaK67Vwu8CSbzL1r62vOamOqZinm7i1ow0Kee7hHkqJYDlv8t89kb8TRXLPB
	zK8zAJMZOjxfAMTxtUp7UWGcNJma5EOc=
X-Gm-Gg: AYBFou2ay/JesNtBEfBtl3UWerRa/CAGSFqUwGbeV9yL6XAfDpgTXkdOhzbxiwpKGQk
	KNNQ1jAjPAa2l6sPjeIPYZmpVDElQ0tQKvK9alnSPancoqV+PRf6LA7lHgtz3NDFHbmYx5nXXGp
	Z06YHUm2YAaQVAKvB3hMRACEqImlxNuvgos6l7PEkevjJ6h/1Sh5WJnB4ILZ/FgYndZG0N2I/tx
	z60Jm8uNDDRdTHaLb/wPWIToT6E6LrXhk+HOen//7I83hafW/Q+W+G+mggMEHjvY0Hw6zG/ALC6
	GzNf/V7L1+6uD9/ff8Yj0ZtgWg5WwUxVpv/uOwUbpfhQ4xlcfpEBmOl+xIp98sj0tDuXMYsikoN
	HxbblRyg+e4PXFc7FS4BTYIBARRjRwmzCSU8ILyYsYePRfOu3xMBVNUhBZW42OXDX/vNEfU/ylI
	seDf670mRedYCauBOtXXTs+rzq0pzsKGE9KxI2Hydd5Hp2Y1F3t9li
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id
 5a478bee46e88-3537dfdd089mr19829223eec.1.1791736770408; Sun, 11 Oct 2026
 09:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009140946.008206689@linuxfoundation.org> <20261011111313.27648-1-ojeda@kernel.org>
 <2026101124-rethink-craftily-cb25@gregkh> <CANiq72ndhLush3bugar1YGPnsein8min1k3_NucBxzFwCWe9Ug@mail.gmail.com>
 <2026101103-fling-stipulate-084f@gregkh>
In-Reply-To: <2026101103-fling-stipulate-084f@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 18:39:14 +0200
X-Gm-Features: AclHuK894KXAsXO3p-x4bVKeUE-imiIjXxXeY6DW6N_dPzUVgjRMS5Bea-wNMLs
Message-ID: <CANiq72kjJ__OnsTjmsuQZH8+U-cRDCNnRpSuHU3PwYYT07Xf0Q@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/428] 7.2.10-rc1 review
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, achill@achill.org, akpm@linux-foundation.org, 
	broonie@kernel.org, conor@kernel.org, f.fainelli@gmail.com, 
	hargar@microsoft.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, lkft-triage@lists.linaro.org, patches@kernelci.org, 
	patches@lists.linux.dev, pavel@nabladev.com, rwarsow@gmx.de, shuah@kernel.org, 
	sr@sladewatkins.com, stable@vger.kernel.org, sudipm.mukherjee@gmail.com, 
	torvalds@linux-foundation.org, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 4:17=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> If that works, can you, or someone else, send an updated version of that
> commit for the next round of stable releases as I dropped it for this
> one.

Done (I didn't add vger).

Alice: please double-check, thanks!

Cheers,
Miguel
