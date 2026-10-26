Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002406;
	b=LZQ/mJ/2Fq/SyUJHub5WzUkpIyL/qELVEBZqjKSbqDOybO29Q2DmaHeYJUIAoL8NMh7R
	 TKh2BIMLW55hklTDIk3e7PKHqpxL+pWxeRZEXHMpO0vssEV70LggyTzNzvRDO8Q+5aegW
	 ILjVdl7Cd/NYYmcVRvfgHnxNC3j/9Ieeqxgoe9boe3tNyC/EJJjPwIzB0nelJJ9JuHJtJ
	 j17rYDhPljQ7c2TWY3yoj8gE9IfB+lYVnZZTJmxKWRPRve+lWLd2dCZT3c45ojAEyaoLm
	 6fcdw4T/blaOW0jvSebQEgCvJopw6B2dsU80OWQRRTZJAqNErSaGckR/O+0kRSmOa/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c8wD/NgRN1vKnswesHA4v4xfkwqTNGymHPvs1+drLPQ=;
	b=1GyLkqipiVDTHScomuDqob7KDwpqkgb+ay/Ygrx0gT8dje9fPJ7BoEsXg8J81QYjIGsX
	 syBATVZzSA/FPdY4CuOkthwsWDszWWrlUZKOJX9E9eEvtnOIqVg/KZfpzCVX0YmpabDFP
	 gLIO0vlZRAY7nhe9JUpphMfnuMBz3BaZJCAPQK2GM5O6WPOPXmM5+4AllqgOdkhhUxaE8
	 gaS2fBQUlU4kUP3l13seu55IuM3qcmv6l4A7ECi4KrV358ayCPZChVcDE+SJq565F8J5l
	 /o0yN/hVsjZZilKCJt1Z8eBdNKHlGTMS3wmotOaVFvAnaOs/hS4kmJCCLOvtzIYxJkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c8yC2OSE;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E39606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c8yC2OSE
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso123013e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793002404; x=1793607204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8wD/NgRN1vKnswesHA4v4xfkwqTNGymHPvs1+drLPQ=;
        b=c8yC2OSEPjjy8V7oBRN61y2M/0GWFZHgDZoSlFSAtUPwNLmT79evOgmDCrPmurAqXV
         n4tJGvjFemnFdh7uC9CFdsMYD+pcfenx9HYz6rr2jhzDZaYjQog9t+8jaC/k78WeiwiH
         0S+hBiPAFoFVIXpRtsP2QyGpZSZe+BJ5g+xNPi6eodToio5qwQLGzZ+2VaqEk23FP8k4
         rFOz6LNRZY3TZgqGYJV5e8bZcbT+uTvY9zmvDKR2nXb2f9PIj3yL4YDHo9QO0+iAchP9
         CL71UQM8PklWePpe68gynaTxp3K+dbJCVtVSCTjSr0tI0gJY9pb9DhEQL98lfq9bUfFN
         xjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793002404; x=1793607204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8wD/NgRN1vKnswesHA4v4xfkwqTNGymHPvs1+drLPQ=;
        b=sf1O2j9y3+efxKlRl5l67DI/Stg0QbKHPiaqi9BSWvZ59pDxoyyrx9i86UWJHJWl5i
         sD5A+IqNZejTfS8SqMTpK7/YJ+ueVakdBwLWfemZ+Y+mDRTBrrJc80Wjl8fwYoP+XiZe
         vijGAfuFcFNgPN4nZO6KlyS7YBb/Yv5eDiX1CvK3NuQ3sLYAOvEEjAmVGRdiPJmubvVq
         oa8ha7+PdCbgvUQYhXqRrxglrMGC2Nis9L1jwP7AybECzkMS4wj1zyZ8s28mgNOzz8gf
         bGjOmEZSjHKNc9adICkhw97VhOuiArqdoamo/gIOdtAMFbxq2wSIsqkSQOfhZKSoof60
         /PSA==
X-Forwarded-Encrypted: i=1; AKwUvByMEtlARXmgyfXJ3/c6/tHvIXpFDOS44cniKZPPziu36UW0X/IFVGUm0m5I4tWboZSQwMXLWEhyBMAvY2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIadVBU3m1ARR4C1SotNT43Ac6CgSFqzXcpn1zj+fOu40H4B5PM
	nyogDYadGFlAhACbkm3N8O4N9WJlRaKBurmk97wjgA8lJ7PbMjF2UMXl
X-Gm-Gg: AYBFou3GQeqdPzQ9CTHsj4Jdxo1YdxbzKKTjUMK3Lq7fURyI0NJoKVFD75N6JC0JdKd
	XBBjL3tnCrI8Km19T3cMKP7NT4wTcYMs+p7ExXIsF9tj1gJF6v2mXFFstrgpMh/mdkXoCuaRYAW
	ucUFzQhwHyd5ASH8U7Qqar/0LJuMjV0EBMv/Vv+G8dNprMCp7iFnJGb/KdeGCNp2uM3m/mo8PmZ
	myo4qmpwDKluGHvpq5oj6uFhcXXtLe/sEZBafNObMVYwppkDZRRy8H0Sr74syMsrC97YIR1F6OJ
	XhD/VbXpPGYAV+PlO2o3+cfrZhYQySaq4O5vmq2u31iaNvV7qu/qSqgMkGRTfgI2O0H++8wVcQl
	lFDUYtXfLLN2MeWH4bhoN+cmgST1PEScPx+Zy9+eNukHVuPuUtnZoVIZ/qUpzZmyMCm0K7a0CRB
	sKHS9n2jhEoSm3t2SW28YdwSLdsfZq9MpIKKJ3gwhfIs3Ff3wWhseiH6kbPEQRnuHdKle8b3JeQ
	cyuuXNR4avXpJ+zVdqWtvkJuVRCGUnt+f/3cIrTdBD+XvxAY7ZvDWPOStFw26vCuhiR3C/Ppyw/
	2aAB6s6HZjOBm3EHYsk937l80DWZmbXsbFj8Q1oMGxx8XS0oQC2b4irIlmdVfw==
X-Received: by 2002:a05:6512:3f08:b0:5bf:a42d:9115 with SMTP id 2adb3069b0e04-5bfb7171b91mr2214747e87.4.1793002403616;
        Mon, 26 Oct 2026 01:13:23 -0700 (PDT)
Received: from yantra.. (nekmmqusumz5xuyc5yb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b52c:35a:762:9323])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb952a61fsm1177483e87.75.2026.10.26.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:13:23 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic@kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Marco Elver <elver@google.com>,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Mon, 26 Oct 2026 10:13:18 +0200
Message-ID: <20261026081318.318870-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025215954.73549810@jic23-hlaptop>
References: <20261025191510.22261-1-zoone.rupert@gmail.com> <76bbebb4-7337-486d-8f21-a39bcb6dca93@acm.org> <20261025215954.73549810@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 25, 2026 at 09:59:54PM +0000, Jonathan Cameron wrote:
> Rupesh, if you think that is coming soon then please just make
> next version of this the first patch in that series.

It is close. The other fixes are done and build clean, and most of them
match Bart's branch. I'll send them as one series with this as the first
patch.
