Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D573D954F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931297; cv=pass; b=cGQeRoPMls7/EjyZSKSeB+yQdrtiEu28MXYomGwp5pjJE+xlWEx+6xSXcdPOhtnToBSfJ9v8u2XALMeVpt27+KvaPyobm7PZh2eqnFBypiPR94dhROcnA+k0aTj/vxr6bhvuj5bWb6heZ3hTE14hKNzWwTcgzzQEAedkYWlJlcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931297; c=relaxed/simple;
	bh=P/U1cMPJqY9dNXetriJYw/wupYm/9XxB79CYTh+hdu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az9PYk4dVKTdxK728hugMBCC3Mw09DThGWWQIsqubPQUHVG0vVxRYOoG22w0S7+TDN96PL5IQMRUCzSOnfzenaskLm+XYB6VG/knYY/At8aKGE3u/E3dv4e86LyH5xNai5D1yiIOFPA6D4v+w+CEdPw0IYsBewXRYuDNKcgME6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qhg9EPk6; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qhg9EPk6"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-3396cec93b6so8403578eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790931295; cv=none;
        d=google.com; s=arc-20260327;
        b=pyoqCu4FelAp45aQrCcrZ5bq9iDUkT3kYds/u95QZY5PtSItkHncs0scXELkhaODee
         7dt4rz+rp2ycucFq3/ouxPM4FYMYRe2RFjouyYvrUC8rrLpjn8pRh/ERv3gepvXNvuW7
         dwUiQ0kPt6AP6q8cScRauXT9CQXKyI6L+rGnk9LMdhm+zjPXRumRKdxpdb7AoufC0AWP
         b8U4pIqU1PXDOp4MciQcfIoY8kZrNqaXnAw2AFRpEQF3C3QBZuuFDCFsG9UunT2pnIeA
         WE7qQr3ReM6rHtZZO3wU8miEqSXtRoYI0k4vmHF9TrDJESNhdwoYGM4WIqZJFTTsO7wh
         6RyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctDKAuUVYhXtpOzra8v5dPrewawKkNNZxcBIEtkkjAk=;
        fh=Yy8/EBdumvbmEJNDALB7MnIOGvqtG0fVlzoqANC6LZ8=;
        b=X0upZXMeyX6ZWLJGGwdT8v4b/Nyfwmis/P7/GIjyNc1Z95pFNUMEGSRLSrKNZKsFfg
         Lp4xK5YTiAXVG0QMLcliX0QGQN0UqWozIe+9sFGYe44M0ykPx6zV5cvD6EJTOUlvIzbf
         rEhIUA0MuCMl8juh0lj+QaTs9R3xtaCTFv7hq5D6szTYGB3CgTozXwzf/rmWAPRHkkYw
         mM4bW2aYxwQekIOTlBnsP/fAUfrogt+K6nZlQ4tljxCYM6yQLZtYWAPreJf7+hsDjzoY
         1b5POW42DR3x4Sg/5kHMW2Mc69muf42/AZvyr+aK09lA9GwBFdwK0XeEaT1e54OiSVwf
         MRew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790931295; x=1791536095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctDKAuUVYhXtpOzra8v5dPrewawKkNNZxcBIEtkkjAk=;
        b=Qhg9EPk6SirAiuew0f+EbJbEataGCy5cxmE79DiWs+oceGDykWfCWVXc2AcSarkZaB
         +Fm8Y1fSG0mEdP/YGO7UT7dBXkqjAKmMqJOb0iuQHX4h4et1LjUkfn5DFyt/FKWj1yXL
         U5B28A3QRGN7PwkblqtZU2EzzHtTXcrJr2vmjFgE/Td+ww7hixtbIFxj6jLdqV8nYQ+x
         e/1/ClpOA1agbsjnSrWKN+qkIxgNNa0bSHf9MMPWYqA/YhhfHn+WVsPdPRLz3L8/RoHn
         fLszjcaEpFaaHaIVRYkI54VFu67jWJtYwAo6c9Su1lvck478F2Eyokc30Q0CCSxAdD07
         jJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931295; x=1791536095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctDKAuUVYhXtpOzra8v5dPrewawKkNNZxcBIEtkkjAk=;
        b=s3HeN1wvYV19wLtMDmjfkge8T2gDBnRUdnJmJ3DswvVGeVpacmUJmD0G46FAZpBGu/
         2AvLgQp0CCVQxw25hnvYSWE3ZmVgkrkQPTNUq0HwibBoE73g3qqcDH2289k2cGl2RXce
         +f5tgTgsY9mdJ55nsPiSr+fm6sZJCxrSwLsROz3UrALifO4f/SJeK0S8+AHp4EuwHzXw
         6NUX57LB0AOySKsD7VaC+69h6O1R9bR7GKp+i3i/7uBX72fXrDdWHbrt33kzerzUFLoW
         veg41O3u9UQUKhqI9QzZehsDvs9d3Vo7NaX7QAcoVUUlalJnpSHym0bq630/OU0c0GUa
         7y6Q==
X-Forwarded-Encrypted: i=1; AKwUvBydVm2f4OVuNUHKvoXUOWSfmPHW1/7VMhiUBLuB2RPkkFdGrzTtFcv+bwPM1GFouInRHye0QSU/K/Aw6xc=@vger.kernel.org
X-Gm-Message-State: AFuF++lRsW9I91Z8uoKT/vhJ/LKlS2XSPSvomskyk6ccaMPJadvcaTX1
	4m1UGrYcl6NyY3hOWnIjYq9P0xP79UslwuCTIf9qpaE/HUZOOAVl9zsFQK4YrogAREN8/fikP3t
	rJoxraWbqUYjRY8NyY4lMWqTr39WdHnbchjfLgNer
X-Gm-Gg: AYBFou1n5ac7rNDtKQVXNIwbCNN78hcyXpbvf2HWc1oDBlYdBiMqmiIjFZ4e/3PB4pI
	SelBPm8iEnW1vkhJQLZS39PY/GBKYnzXCqVEQu/qM2UEf8zq2G3rzT0nU6maGO0nrrSMszYpbLo
	2WUR3XlNa/R+qeLTKfSOhtrZ9tneiYqivSjjsLe0NgKK7Y+Biowsxja7OUOvSxQkfg0+goPpjn/
	AcxB3KmChgGNcBEY8Hi3LwgPOwXaoVh1Z78pEhnd37/MFpwuSjjwtZm47TcS2hCgVLVr0aWD2ba
	LZMZ1yP/78rEbxobqHEzd9kZcbJ9qJ+0bT9PsImz3UJVPBPou9196I0KJWOAIcRisXipUq8KvwQ
	2XZ2mHQ/7RPRfTURmm+I=
X-Received: by 2002:a05:701b:454b:10b0:13f:b41f:bda with SMTP id
 a92af1059eb24-14f5bbfad15mr1971743c88.16.1790931294099; Fri, 02 Oct 2026
 01:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919080220.37633-1-kmehltretter@gmail.com>
In-Reply-To: <20260919080220.37633-1-kmehltretter@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 2 Oct 2026 10:54:17 +0200
X-Gm-Features: AclHuK_xPy7pmlelPsg2VXs0Vq_-NGFA_31GHsaXMwm0TDPjp6488qpSYf0caU4
Message-ID: <CAG_fn=UsWR5eMLRv5L9SD7+7nWoyTADV2LjsO_aik_J0yHFYEA@mail.gmail.com>
Subject: Re: [PATCH v3] kcov: report spurious PCs in the interrupt selftest
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, 
	Bradley Morgan <include@grrlz.net>, Thomas Gleixner <tglx@kernel.org>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 10:02=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:

> Add decanonicalize_ip() as the inverse of canonicalize_ip(), which
> subtracts kaslr_offset() from recorded PCs. Restore that offset before
> printing the PCs with %pB, since KCOV records return addresses.

Can you also briefly mention the switch to kcov_start()/kcov_stop()?

>
> Fixes: 6cd0dd934b03 ("kcov: Add interrupt handling self test")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Tested-by: Alexander Potapenko <glider@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

We're almost there, see some nits below.

>
> +#ifdef CONFIG_KCOV_SELFTEST
> +static unsigned long decanonicalize_ip(unsigned long ip)

Please mark as __init, this function is only called by selftest().


> @@ -1111,15 +1123,26 @@ static void __init selftest(void)
>          * leaks out of that section and leads to spurious coverage.
>          * It's hard to call the actual interrupt handler directly,
>          * so we just loop here for a bit waiting for a timer interrupt.
> -        * We set kcov_mode to enable tracing, but don't setup the area,
> -        * so any attempt to trace will crash. Note: we must not call any
> +        * Set up a small coverage area so that leaks record their PCs
> +        * instead of crashing on a NULL dereference. The first word hold=
s

Please focus on the current behavior rather than patch history. We
don't need to mention NULL dereference here.

> +        * the count, leaving room for 15 PCs. Note: we must not call any
>          * potentially traced functions in this region.
>          */
> +       kcov_start(current, NULL, ARRAY_SIZE(selftest_area),
> +                  selftest_area, KCOV_MODE_TRACE_PC, 0);
>         start =3D jiffies;
> -       WRITE_ONCE(current->kcov_mode, KCOV_MODE_TRACE_PC);
>         while ((jiffies - start) * MSEC_PER_SEC / HZ < 300)
> -               ;
> -       WRITE_ONCE(current->kcov_mode, 0);
> +               cpu_relax();
> +       kcov_stop(current);
> +
> +       if (selftest_area[0]) {
> +               pr_err("spurious coverage detected during interrupt selft=
est:\n");
> +               for (i =3D 1; i <=3D selftest_area[0]; i++) {

Let's `READ_ONCE(selftest_area[0])` above instead.
