Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601616;
	b=iLQLUatiIyXzw6SKT5YBlk/4BXQYMkma3H3TtIqeTvNh+G7TOQ+8IOXMR7sGNmlIic7A
	 Jn7KyX7DwTUo9wnng4taGsa6V92BR1fuXBtw7I5ox6kmxK7L8m/B3/DBhJJF4qj+3f6yI
	 uUqHOJ0oqM5FsCxDhvS83gg5Wjec8/jVYARQ2MP7Br6MIEChAl3Bp4qjp0GgG9JiIvJ0y
	 MmKDdA4fMNa/vzxb1eY32PBPpNk/rHQC12bUq/Fu8zN4QwqhvsTeD0Yx4n/Tnb+ypJ3Lz
	 eTldVGaYmMCzUiW+qakW7qZPiwmee0zcil2IcO9Fc0N+cn99vjyWAn1rJv1/JBOFHsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2O2TnvNsnknB44ezKCjK5OImxLFDNz8sdbJ2VBlzgdc=;
	b=q7WDUFi6p7jnn07BavFwafjb84Ip10hDOIHMA/tj4Q5MRi20bt3WZ7JydTlQTb6WACQm
	 3PjaLwll+6Q/O+XRyxuUs+hCeHr9Ja9QDaNqCllZKS/o1FzgY3s44j/1Tn1Jz47hgQ3rs
	 FN9ZP+T/cFsTT7gxQ3zWoG9xw+Ec3fCU/SDPOSJfTfdobw7QxadAfnCQZU7rCD/Q8K5tm
	 qDChlTnAUeXq2Mv0sccvESUArW6J+nd3FE2u3n5z8yWwgpBNyhwc5MizZ9OSTYHl6Su31
	 tFeirPk93xwqztyveZoDpndVjYFIvjAgHocx47WTxx8qz6v8HAYSnuq90vrVy9M0EsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUcqmEYa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E19606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E19606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUcqmEYa
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be4b29df8cso139273e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:26:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601614; cv=none;
        d=google.com; s=arc-20260327;
        b=jwBC4IwPRYXdIOnrdgSzCLcli8jvb/tsEdR7tIBsbF3+e3/8+sn9OolBec/N4JUT9i
         cXmLismD5IriMBYZToqyzPkzqQUKAHNMFXjqtlne5/HBndAZ+TLRTgsU0W4pqgS6OSnj
         vVC4U+1Q5saIoakcn/IhtjRWo3a2aHv7ricig5txK0XiQ/OFdZ7wIBQ1TsjJEaZSVunB
         tfATL2Q9n/JRRJBEM8DMGrZEAR1c+5OYUJenS/e4NrH04huZ16BNmtJp7fsiErh+wcpo
         49MHRzmhjcU+ZBMUSfq8ftbmoyENbd/JVvBa64exA1444hc99zUtBOtqVgp7H+ONNFGR
         r2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2O2TnvNsnknB44ezKCjK5OImxLFDNz8sdbJ2VBlzgdc=;
        fh=4AJAreTd50N8/SoxPiSEZYPrF/l4P44FYy0qLPMODtE=;
        b=XooU6J6MJy4haBC9kI5lE/vJtvpx/+G4hwAFVWT74hfTcVsLFglRNSJEYUNg+vWeJ3
         SqGjOQElkwupXzXoLbOywCG0RUKoEA4abGqCZiB35ed/Y/E+z3b5idIP4I8WxP1O8fZx
         zwiDG1l1u0Nep9r36FpaKDmBlX9IS6NeKQLNikwkgNrOSRe9mQ2/AW+83u+MfOnf6ApH
         vjtIjj9E18xjO+Xic5dV3MLXJmwcKdbqTSCi/DHWSd/HTDIMpBEgQc6Z7aZAL3om0ir/
         fawBeNFL68O2tVO3+209FJlJ6VIp9eVEt8PDXi/vtV6O9418MYfOd1To1/JD3kvCESLJ
         kIdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601614; x=1795206414; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O2TnvNsnknB44ezKCjK5OImxLFDNz8sdbJ2VBlzgdc=;
        b=DUcqmEYayYoveruRS1dgsIUc5UcHBRASHp8a+d/bIN+Fs50f1gjQZ7Kk658yW7/nt+
         yr4oEZdZPuk1DmIXUBNpGF/uffpzVqxmL+I/T4mO5L1CPMdoePvIVGGrTZjkLdPjoV/a
         +3sQAX9jjJClmgcgkyUQGqNKDI66T1oh43/ArNUT4rls/tCqCNzVlJ1S5zyay0E36B2r
         v2wzxCKkLZEoN9TeonnoK3yxCyARxoW+wHUMnIHir0nm+5FJXY2cEBfBJ4i7sitCa+FJ
         mSIhgyvW8Z3p5jJ0IRGb+dFBJHT6ed27qbIsFNbK4ZlWz4BD6qHCaEkrOngoQW71W4wX
         PPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601614; x=1795206414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2O2TnvNsnknB44ezKCjK5OImxLFDNz8sdbJ2VBlzgdc=;
        b=AuFJO73KmbBPfp3+81VXQrKcq6fqui3PqwWpjv6QJxrvLooQ5yDHfNAR0ThocwRCJg
         kz9k/oL+3nlrmdfaHNfJEyPHohAyyoNcGH6VG6HQAeATBbq/+L0wGv0xa1UQ9aFRUPad
         onMwGWmEQ92NZfYulFXuuxjT5kIaveA17HK+exn26evcgBO3UcZIZhMp0mu7e861IPr+
         HZqBawbuzX0YkIe4UqlHYyLTD+874iuvA1Vt45eRyEfyu9xPL2rSVGCceznlSOLie5Cs
         gXrvVTMdO0TcoW2oou4Qp+srzIPkT3YqeD3fa8lkiSnRuboaFInAiDnrcKUKmDyR8KPj
         8ZEA==
X-Forwarded-Encrypted: i=1; AL+hErF2pKGgzEbRatN2pNBBIx9cYpv98Xb0fnwam6scyHwed28bnf3OqDVHvBCvOWceUKDY2lscdnFKIAhJF20=@vger.kernel.org
X-Gm-Message-State: APuU4Z/22yIZcp1ZTgQyi9cKWTiCn5UH9v+v9+T+sIh74AvGuezsp7Fe
	T1XlrbBhy1YGAPunqIBKMcGlbAUMzKWmH4jWJsT6h3GvA5cHtTabgFdEn1GKTSyniEbqGbuX9jO
	Zgl7008ZGIvGzAED6m8PAt1BNAAq115Y=
X-Gm-Gg: AYBFou1XR0OHIKDU8bAqhksLGr9/eYOAmZ6XCrJO5VShA24bmQnAj+JwoDbhbKINcIL
	MME5Quhjx2UXfLl0OFuq3tdXUqXECME/m4AH4TnNnhMkCE4FSHk/RSL1PpUW/sfwpLICY2cxcNu
	LLO+iNowJ9WPWVdmLy461DDQIf9wva1NyrIbKehO6y3FmmX8IJUr9JWlJo5J8FO8k8FjUsjxQFt
	NotgENil0XiB2GKFSf8pwXi4yiV0KGgydopHadFeweGBaRMyNya/CYUINHATHzzCqBZNdLfcKnt
	YIQ8x1jFXuiZHr3QLH/o7MnrhHLDkKJTPSHG5DoMVGJRLk61pYuZ/VYPwEUxQDmein0bYoopyq3
	Q2AGRfpPJK1sAoeq2e5C8PynONxLLRJI0MMfyR+BmMizwuHLH+UaLF3G/2Qogmm0qQG4fdgg=
X-Received: by 2002:a05:6512:3d20:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1709e0a05mr1672668e87.3.1794601614323; Fri, 13 Nov 2026
 12:26:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-devfreq-resume-freq-v1-1-90de450ccbd0@gmail.com>
In-Reply-To: <20261110-devfreq-resume-freq-v1-1-90de450ccbd0@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:26:43 -0800
X-Gm-Features: AclHuK-ahf_hbv0JWK-ZmP02YMwbUIbSPumHjPuGK0NbDWVoZDeErVULM14wNLg
Message-ID: <CAEy9hNXV1Lr01gy1V1rZsDwWOt328nZOxsNomEk=vKLqXhNMDA@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: Resume at the frequency from before suspend
To: aiyengar1990@gmail.com
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Dong Aisheng <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A correction to the commit message: no mainline panthor platform has a
GPU suspend OPP, so the panthor example does not happen there. I hit it
with an RK3588 device tree change that is not upstream.

A mainline case is lima on RK3528: the lowest GPU OPP is marked
opp-suspend and lima calls devfreq_suspend_device() from runtime
suspend. I have not tested that board. The fix is unchanged.

Arun
