Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B653386C03
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644643; cv=pass; b=qQNNLMhkA+XvCymlTV99BAEKZsgVeifVU538Zws9fVcOEgc1yNwaCs/K+J48Np9rllgvzYVw9VE6Y9PlAhiwbvPBQdcggm4Y7i9quCOD/pmbkUqY0t9m8KbLRMzGsM2aF/WV8hkj7t6oMlce1z7B3yiVhAYkY4mTeYQ0ur/HaS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644643; c=relaxed/simple;
	bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMZccHMMSh09Q4WxiNVadEAEEAzi7Lv8BIykflYxFa0n+QZ0JI+/lOKwcq0jGVEu9TNN95z9tfCxZBQ5eTklxIJdwAVWrrqa7xAOsFH7/cYIbfL/bVpCLfm/OxltMc98pV+EjfRjOceeT27zpSYqGDIp0ezbyRtq0zKECZUxEG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DWIz0/8l; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DWIz0/8l"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso6881595e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791644639; cv=none;
        d=google.com; s=arc-20260327;
        b=C+W9RugnSFrf7yyJnbpT+8qKM+/YAPcAD8C8+RCYlmGwlUaZQoXUJFXJ7oGbdfSwhz
         pZbyifXBReMyY1yPCilfZrF/ZB0ktiJWecQ1JMPPId6/q2eQWS+EGJ+I5Bid+ahQPuwE
         9PCYfsCZYXtMTh9rBgyXRTd+x0Os21hmU6XAWATY2yaysOYCOe9/hdaSkwsVjPDNby2q
         gdR6wRXEHwQOedqiU3BEdUZjWnEXuEV3BYHlnwZANC8UDAohtX6tQjxGAjVxttiuleli
         nirFfhpmRjcAEOAmjIr6X4nv145SShcigaLGDopBMFrQXiiCNgbfZT0czbfrMcVGmrdZ
         zcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
        fh=TJqNXKgIcTjiXXHZy9Z9ZQ038Tj+DqSVbtLujBaEKd0=;
        b=g/vN/aP9mnRJkXRkvqtk4L5O1fXISvqhiY0hD5FfwHJvk14BnV3CgX8kBaUspU8Ks9
         fuOWhBPqZElcZVfcIS8Pa8dMe7k87R+Ht+AevAluBBS/xkp6h6aV6yrg3UCEn4HFIsVV
         CMzz3YrTSi6ig6t9AgCcLM/k/+KTEvYjSOtOkjtBE6C5ZuZV/BYt921j5bedVDu0maC7
         5kegyClWhlQg0QtOCW7sNjB4YsN/yz93f5e7ssyg1Wl6OyfDRLtpbF9SWJSe2k7HpvV9
         7EwBgow5+MYO/vyqB4VbH7sh0JAof7DLh0VYY2MYkyQV9lpKhIrg1peNv1LIus8yfoU0
         cgkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791644639; x=1792249439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
        b=DWIz0/8lc4QHZ7bP3eOzEjFaaH4GQUOHsMiRqz+rn3aN9J3Qq01KkNTWWkYEz+bfgr
         pu2w2WwKff2ih1bTtBe5t7CgYGsxONJnS/R6rlzjvjgAX2yenrFZZsNr3UbheQs6qsOl
         S3EuVvnwMH16bf4kbalELFSBEkx0Jvyv7e/bYN+0ywrVzdhZPkzZnwHZJvS+6n0vqCfV
         NAEif1sBA3rEcOpXBqHSwijGUfdadtnQSNLx1wz7Lq1FT61tAMsUwYfnq9neAur4u3I9
         +Tg1yNHe3A1INCHDWfqACIpHMNWiIoR9axHsXSQekNg25CwoBqOh02okt846NdRRUp2M
         vgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791644639; x=1792249439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4M8q1Gw4JSNRpSJ6YMmuoD2ZiLo8ynCybzLGCHtt4s=;
        b=sKKVOnK/uASTJBrf9JE3GiNZ6RAiN+kWr1A2wiGtdaPdBa1n8bNpYPc6P+ISxwYOzU
         R0xmmz9JMF+PMUXwz8PXCXO3TdMh63rmn76JHWz20DIQR03br0aZagEs6L39mUzUwKpP
         O0xoV+QqMn+drMqn3zGdHgjQVg9jIOoIYW9NEN9Se26470WaRhP2ybtKtJPnKccJhyhf
         gRTgseqmj8foFZPneC7VpaGP439decw8Uga44dzhneOnY+pwFUyufi1Tp6IxrmsoCCo1
         yf3YFi9rPXTwQfZVW2NcNkmoUyxU7qw1PIx/AkoQbQX83rRTNkGuHXYQn23/J1FWpqIq
         wy8g==
X-Forwarded-Encrypted: i=1; AKwUvBzwvcTql0tWOab6OC4OBeEvDn/xoGO0vpto+ZYkBVmA33vtktnNuHV2/ull8B9gtd4CnzG9fjDRqbMcRac=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSR0BsuhwhYR44NBRPMVYlJehZN5EZAwNAT/c2eKNU4ZmLauJU
	e5KGEItwqpHTPKl7AlNtlU1ChtlnR+lpxm5ItpXCR0guHIygo2amJKN+ekSzAQoJq9RWSiitz88
	nIXJyl2L/ZIFhNhBqVVpVykCQjS6Qd5tYOD/bLowm
X-Gm-Gg: AYBFou19jdXMh+CL0ybHcfvaAWwslq8mt2bK/gnHRpVa71baF1D6MDAtXHIQr5gsDkQ
	CFHCuiubXb0GYuPxE9atZGIJDS9HKwZ4donEMmplcu5prOrg1bxuRD6TSlcZIXMHQgOTtM09HG9
	dAWwcky8dD1G2vSYBTIXZ4peiHo0hdrM8g0u7P/fBESqOuXD/4MtLvUyOXla/Kq7NG1dpeNtXNZ
	EMklFK4oX+nt2CenYnEHKneW9BmJ7veGmBB8+1XDJwN0Guy20DXFPRIUvN5aVpFEk23AigrDl9Y
	1UIJcuhzZWd0cxxzkLMYU12XR7zvC63LnIM45JipaQEhW6cD2HBR4oD066yCwrtCFn1RdKxgBLh
	z8ig5MNJ1G5YZev1IDih0
X-Received: by 2002:a05:600c:34cf:b0:4a0:159b:d2a9 with SMTP id
 5b1f17b1804b1-4a18e4d68aamr77276885e9.24.1791644638230; Sat, 10 Oct 2026
 08:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929190024.2248099-1-dakr@kernel.org>
In-Reply-To: <20260929190024.2248099-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 10 Oct 2026 17:03:45 +0200
X-Gm-Features: AclHuK8ZQUI3eItwXg_rZSYr1EbwRsPHujK2QRZB7QR-TB8HYr0HF9f_x1pIk1Y
Message-ID: <CAH5fLgh6siikdQ-vM2eMdbgqxOvquGuv=0UKZwidabj4tcGV7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: drm: Return impl PinInit from drm::Registration::new()
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 9:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Convert drm::Registration to return an impl PinInit<Self, Error> rather
> than creating a separate allocation. This removes an otherwise
> unnecessary allocation.
>
> Update both in-tree callers (nova, tyr) to construct their bus device
> private data using try_pin_init!().
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

For both:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
