Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946974349AF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447400; cv=pass; b=GvSI/nV+OZqQ5MYDiKzzQeEauHhhrVs+dG55DtH27ejIdNRN3b9H0fXSlnrpZxOsBguP3L0DDKKC8bbZRq6/9ZHGpJerbympqUaYsWawdemIt8/vhZLk2yGM0fpMtCYW3Fap1Y5bYW/N7Q2woIAKigP5nbSCZz4ndos5i1qciYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447400; c=relaxed/simple;
	bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6D2pPYCJO0qjg02iQ40F0Q2LJ4JSHKf4t/6KxiKeUINY103foiSaY5KX3y0rPNh5TszRvVC9p0tluT/IunolDLE+4h2Xq3pu+2ta1bPhkifNTdkZFRN3LRq1umZZncJHl63RuxlbuWeI/H8ZIlkZ6jBq3/XkSzk8v8uvx9Zxww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ8R94iD; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ8R94iD"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efebso456979266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447397; cv=none;
        d=google.com; s=arc-20260327;
        b=en+x7U391svxEzFZKwRnH+WWiyp4GQAHEqSW/v70M0WvcM8qjDvTHhmqXi1kAqJwWa
         krb2OQGYm8XZVAgb9fhNbB+qjJKFrXc5+U4Yw3LjKVGsvIoeppyTyQ86c+kt82SVFX6f
         gK15/iqh7DOujScn5/mlN1MUk6i7oZAiaBw1i+xzqk195/g1x6oxF0xrMTjyarMEw+pP
         +zkydtAzEYChVpZORx7NTOY2QL6TE3J27DqsNMgyhLGJWtbbN3GaXSAxvuIwBb+KvxSG
         XSwcks8sv04rXuUBqF1WzyHGg+rmlEU4ElMPNL9AlY9B5T9e5eM5dwngTZYu50Wlcclt
         kOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
        fh=kUWMLGS7891POQylB4NjOyBrdqbD7vYtQ2CGnlc7VaA=;
        b=bIdRzLrmWZMfL5oa52AntE8lX+qMom3GF+GPDQkqZUd3YXvCn/6EhKpirSuO2IKYIY
         ttv19TF3z6kWzVoHemTcn+rUl5EQq45g2eiLD1SKX2tbvq5poG+tEX+OsnbWUOLUZGjW
         rTRqck/1Fx3mneNVyl5F4Ii5Pz7Lngz8m1A7cEgYjDCaHa+kleu8dpsj2yBhymtWtWV1
         IJQUTAMMtMhSQ/fxS6PI7WU7jkn3jWVv7qmh2WztaXhpTgADOmqMnlIJjMEXV2geUNW3
         2arReA8OFaOxGufdk880qdphqAmO+iCOEPFvPNT9jTX9mW6ZpfIWzBv+2PTLDAh0k6js
         qeWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447397; x=1790052197; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
        b=TQ8R94iDFwXuJX7e14L8JdC4fweRv2qVAmZU/jAi6qsHVzhqAaj7nr+GXUKXCzvRoI
         thn85S3kjCkA1cyuDHqjGcbqmKDE2+PAJk4Re+5yJPczSLI8X5G3v32HgYqLFD8nZVCd
         QfXWZ0W3FMzavuYh+n6X+REVhPcer3q95CI/qoqRbRwfzFbZGTuEjFhYBEdVnjbsWl0U
         4MHRNUZFeUXh5uFkHYoVKXxi60mCuSpdBV2DZTxWFXNtzLojwOfcUlXzp62RzO9YB03O
         401yW1UPVYTxjXKZeKs7zsF2heAkCsciqeeQEfl5b45Sg/eVImKV6zds/cp1tAzbjMak
         MiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447397; x=1790052197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
        b=NdZLjCf9RW+AsOkHLvSCqkpXgIcy8vMf6EJjGJWwKMMIOXdAFM3gHnf7CNO4PvF75I
         PUPJ2wROx7kLrLV57m+JDvVy/CkmgvjMSZ990UhtYBRLWRShh71YHj39RX4ybJFcXXjb
         3WRU2x3eoAvWvOR5Yl8TiecVOR/NmjioOINg0YEsT4W6m8EWExlpM/2Kal4AEH6Myrlq
         SzdTGd+C8BwEnUPvgjPIe4ieN9jOYTvVKyy8aVVn5BZWSmbhZsvN8673/0PeHkPvJ3yS
         CxrfpKGQ5ty4dDPvcZ8/J7+8MnNslec77vUTUKf8rwqFX7JhsoHDZj0YeirkdM6br78U
         AEaw==
X-Forwarded-Encrypted: i=1; AKwUvBz78z3xiLoFaCl39NrUHb+nElgq153SxqRVTKn2R5JN5K9A44Qu9vXGGo8Vg7ocXUCR4YVxLhJjMlNp5po=@vger.kernel.org
X-Gm-Message-State: AFuF++nzdTGhtNmNdQ+f6Sb1Jbn+l28Jc+PinTzAdInI2ZkRhY+1u0Rx
	hKexIxk1Q+xrXXsRedrotIoUNpyjz7mYe0D/KUuyL3/sGybEQM3TAreMg1nC3+E/ZwM6tuWz+p3
	ibBrRAk263PeZO7lFQ0+/bm+2CvvG8n8=
X-Gm-Gg: AYBFou2HrQfWbtP5Rl78DAmJs/fe3D11iKzCMMVqTOtcqwZX6IVK27yqCosb/55CaYE
	9HejaihhZd2vgdJJnTBmzzr3DvXGO7wDwgLVHIk6VGS3HWRKpYaWXJO77eZNWelL2Uq5+G/pZ20
	lcMwKd/JwIZnS9Tj0sphwrrhui82IwCIRobB5b82ic3f6831tuBIywiQTUcQHnObimNI6NrHHdx
	vblJDPUCz9s6bATdl3xfOUZ+NcF3ccEL5HUhPZJ2qOpatL2xggNdJbg9jRWuAgFS8UFAEztUTCk
	8lbtM2t10GFiXdyd/+2x+d5WieFKGIDmNX3N45LjScyijIP0nKpcGg==
X-Received: by 2002:a17:907:1ca7:b0:c24:87e3:b8b8 with SMTP id
 a640c23a62f3a-c29b85faa3bmr342332266b.17.1789447396541; Mon, 14 Sep 2026
 21:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-6-linux.amoon@gmail.com>
 <5c24248e-bee2-4256-af8f-a80be6744431@kernel.org>
In-Reply-To: <5c24248e-bee2-4256-af8f-a80be6744431@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:13:00 +0530
X-Gm-Features: AcwNN1URmaKTajm5R0ygh2EGOJeV70g6e6uI0S2uQ6QQ5XvRrWbqrXu2Cftp_OY
Message-ID: <CANAwSgR6sEz8am8Vd_32EhnNjfybZAr=JR1MUjLHidZ+5mdTww@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] thermal/drivers/exynos: Remove redundant
 base_second register resource
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > The Exynos5420 TRIMINFO register can be accessed through the main TMU
> > register space, so a separate register mapping is not required.
>
> No, the address is misplaced. You completely ignored entire point for
> second base, without any arguments, any data, anything, and just drop it
> completely.
>
> NAK
I removed base_second based on the observation that it is only used to access
EXYNOS_TMU_REG_TRIMINFO for the CPU and GPU instances.
It is not used for any other TMU register accesses in the driver.

>
> Best regards,
> Krzysztof

Thanks
-Anand
