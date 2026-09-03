Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6523B6BFD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468664; cv=pass; b=X1ODeIH7udKdNJaEpGNJpSTGuuK2fxQnaKqUCsxaVyROHMwHYTzfrwrSo4XnwKW1lu+bulSyiX3R1f5Ng2K7HKp/Y56NC9r1xvTjdotW8EFjiQAsMX8gXlyJVBNzHJiXPL17cNMHxjZimC/SFVVPqFHDz+iEIMjhGEu82yUr8N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468664; c=relaxed/simple;
	bh=DP2FBzJ8iXfoFOY1nTI6q6k8Vof4SeIiVJ8Yy49X2P0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwbxR/d2fxNrGhVDogSG97IYPxlo6+50IzjsqypwXlx0qfsqSDbJWnw71pZidtBCPhNIP5jtwE0n2xClgb9Ogj71lMwJkyxH1P4QX1idtPgLUOp9LG0Tq+FW5HzCsOxJRQc9g/wDhVIw/++NXZlOmliRdlf0vJatKMHvRQlJjGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X6z8O6uc; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X6z8O6uc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48431648f33so1021914f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788468659; cv=none;
        d=google.com; s=arc-20260327;
        b=mjJ7eSQriOe/pbQtV67jTxU9tsaSCCC/3uk8Fj0wQpGtcP2XfBNPy9PtI47jbN9Lra
         gK00/GK7dVz4+EM1McyH5V9BlLXgD4so6A7KUVshR7VshhywKSwLyE5oO5U9MxPMciZ8
         luWZoThl6vwkqxgf/CLYV8MVODBw9OkX9Wkrj9O21VCy3K2eETg7yjvL8sPn6KWwjMoE
         ytnXTJtPfmyTdkqhfboqDBbkw4+VmFBRQfrMlAsJDoUqpBcMyFNxiQRmB0X5fkE+ySyA
         heCzewP8SklH6wtkgSGUQydXdGu9iBv5AaMv0Gw6M0uJ5339pTi9PT6AgTDV5iza9/HO
         osmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DP2FBzJ8iXfoFOY1nTI6q6k8Vof4SeIiVJ8Yy49X2P0=;
        fh=3M/cEtSaVC9hng0dppawV/2VJZn1rhYoo2fPMbmKW8Y=;
        b=GWxctaj4d6j27A8jx8JTvd98X6VyvU8ECDyV/vmmdZmoMRWUjua3ZmkBQLmWQ91oO9
         uOC5QjJ84yDFOHXsh33NqHJUGLnKdyqmsxx5YaWscvUqWKSCYw2GvVPgLI5j/8Fx1s1n
         SqlB0Jw3lhBDZQ288OpBjFo5hQGUverCD+I+rJ49JcJeI01qyplASp6m1pmCvkkmghjg
         Z4EQwEWT1qEUgBzafXFf968LGUZqfJ7uRseKn6qJJUd2b57HC7OtfhlmPUFkYhKxcqMB
         rFydHS7SuvFsiVaVDAittIFPgVYauYhbaIzy4RlUd8VJBKiUMtNs0t3wSpyPx7Y/PxMw
         sNKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788468659; x=1789073459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DP2FBzJ8iXfoFOY1nTI6q6k8Vof4SeIiVJ8Yy49X2P0=;
        b=X6z8O6uclmzLcr8ei+Rm2+5NJHloS3Jf4k5eyufwW+O+n5z3DdFUvslIF7RbhlonVX
         px3dCydRDLMLhEwXL+gN1SzWuJDrJjJ0MlxC4mg2nVZWtxbPvkVJg/fhbESpmnQbsLzk
         pSDxe8Gtg6mGYLbNvsow947OpqTVJMBCS5EkdgadVK3AJQObLeCe2+q29TVqPRwmQeay
         00nAyzoMbaMo2xw+pVGLmwWC4f/XP+nZ/WplkAJgjBtIn9nyA0a5skPDwGus55UfpibD
         GNTGS9xnsBai+se4RQHRXTxOtQZ6shSmm+4qV2oxRBAkX8J5jb/5+2l1buNmNK+SPArt
         DexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788468659; x=1789073459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DP2FBzJ8iXfoFOY1nTI6q6k8Vof4SeIiVJ8Yy49X2P0=;
        b=mg8zpw8F+F82GlGZG6AW6qwEO+2x1+VERdoQBMSfAKo1nfVZPEG/x3q24Rskew+pGa
         Xf7Zh81VS3WWNy4d0H72QSM/UpUvDK95Cfjs4NWajIyCJgXpboJcjBURaJZcMCsJxbxv
         CxlNBf4TCgnFyzHkEsmUf+ax7U/3BCFq0Z1IcYZQECUaam9Du08PeHWhQYk7s2OjSPNk
         llhAL1OfZ7wLY/QPrF866z7UlafluKOItpkd87AjbXBbxPNEMPX7mcn0A7ZEVJF4XAaT
         VcRmvjMpk7sWxeeZQ8cbb3QJto6CDvx1cy5tCsrY07VK+ErbUow332ihjTACTBQfg9I6
         gqjA==
X-Forwarded-Encrypted: i=1; AKwUvBxO7n1ljd7FPt9xO3n7oZj/zW8OGj/m9ZUAPtWL2Z8+v0in3gbX15KZevtIrNkRF3TuZ7/eLFZsDVXaKvE=@vger.kernel.org
X-Gm-Message-State: AFuF++nrO+GTeDIwnKEkyL7AzFRtKkJRlCLEA+f9n4yqrvvEwqXY5hs8
	5lxgIfAC4ysZFetFFxjmbPkHNLY4ULPC1gxFSu6ccNdaP/ELdnWLbNQ4CevxvJeZvQp8QxXiIrf
	lfrMblHEOtHKaDh9wIKjCvsIWUsvxBQ46WWi8OWw=
X-Gm-Gg: AYBFou0fMR//fpvAyrhtn/gGHsC1VTllnrkddFNzYfB/n1Fa6KRXNwt7lnv1dED696F
	TfeNwpsQkGWIghfl3TNN7rj3aPtc2pr8qYUmIk9OCwY88WIxHRVdQmndNPyISnCHHnUiQbUvgg5
	Qnnyy0DTeoBNmdwWj+5t1a9qJ5R+bt1OfhBI94fDpknsShvRGqRHsDbWQc++6G0LOJigf0q4YDu
	XLZGK4t+PAYSN3rv0xEQZSLL7ShBTn+fgP4qB2zh3Idovwm9KOWm5WltKMQSUvlU7Bz0uSqVSnR
	dtG8focyfVS9ZR0pVQDKTuk2WGs0B/RVpEMMYlAMI5FXFxf9FOv/UuIQxlt39e66KUQ4CkwzChT
	QUfksXfE/geCYCCuIGk8RASiG1Hgf+mww6G24WXQIUgrYxbmkTFk2csZYfWBxFDVIdtimGWT8
X-Received: by 2002:a5d:64cf:0:b0:485:8224:1a45 with SMTP id
 ffacd0b85a97d-48589235705mr443849f8f.22.1788468658993; Thu, 03 Sep 2026
 13:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-timekeeping-ktime_sec-v1-1-b33017536aa9@linutronix.de>
In-Reply-To: <20260903-timekeeping-ktime_sec-v1-1-b33017536aa9@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 3 Sep 2026 13:50:47 -0700
X-Gm-Features: AcwNN1UWui204eQB74K3UOlUebQxOrzuXmi3JoyaoomXPCkvqos9agvyTBIpFBU
Message-ID: <CANDhNCoaV2LQ-MbVsHkRmFxdU0ceAbBiU4qXRJj53_8NqGj1jQ@mail.gmail.com>
Subject: Re: [PATCH] timekeeping: Use READ_ONCE/WRITE_ONCE() for ktime_sec to
 prevent tearing
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:11=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> The timekeeper update path uses a bulk memcpy() to synchronize the
> timekeeper structure, which is not guaranteed to be atomic. This allows f=
or
> torn reads in ktime_get_seconds() which bypasses the sequence counter
> protection for performance.
>
> To prevent reading a torn ktime_sec value, enforce atomic-like
> access by using WRITE_ONCE() for the critical field before the bulk
> memcpy() in timekeeping_update_from_shadow(). Correspondingly, use
> READ_ONCE() in ktime_get_seconds() to ensure a fresh, consistent load
> from memory.
>
> The same was done for xtime_sec and ktime_get_real_seconds() in commit
> d7fc133bf91f ("timekeeping: Use READ_ONCE/WRITE_ONCE() for xtime_sec to
> prevent tearing").
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>
> ---
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
