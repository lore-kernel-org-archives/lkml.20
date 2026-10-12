Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957036D4E1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785554; cv=none; b=mfTwUFV8IMa6NUIHMMO37tY2V60RVwoD6i70YnNOXnfMHIgkQ/3gD5n3o2Yke3l4ETJgSvg8I9H9wwk2+cGePUxBWTBznNeaFLzgDDNixoPQ8jCHx0hdQLSC9yWqVMbhn/jgcfa29WvArDQ2tbpwgc4VA8c2Sf4pZk7YzMCPq7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785554; c=relaxed/simple;
	bh=zZXbfruO/r/RWqf/E75oLX6W4C4wA0wKXl1yDwwK0Zs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=ZWNJTMRsOwTJnqfk2xRdEADR24K/gaJbpdNBC1Jr+Un4x9xz5SpNHjjYeqqylXStjcNjDqbbcrfO5zgYk90qz220pDhAsDZA6ojcvo6nEfmGPuYIbCT2VF2uTrjbmCf6wAOHhA/YPgDtenFdrYhA3zNUD2Y05Gq7SJj+y8D3nvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8tDgM4r; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8tDgM4r"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so2190634eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791785553; x=1792390353; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4HdBEWpf0g+zfKwHgHUCZB4RLqnwmfHXY9y3S77eIlQ=;
        b=E8tDgM4rs8KdG7AE2DyALGcKo4Og5/xmtTe70lY2GEFzDh5te340MBIXXm1bpiRDP4
         +J/+8z9Fik6QpOlAPSnUZYwaGbfO0VjIjHTPQod8Jzy6UXybiUzCyN/Hz9rZlTP0HRb/
         ARuJICMmv/1/mbVnrrZQyYit7s3LpGHh4OBfWsUuGh+LVMLC+Bt1oW/laCRi8FvTEieA
         IEmW2aiW79CyArxqi/DTCtMt1689AYqaNI8AwqrAGbHlW11n4dg6CNxsOmmICvQ3Iu+U
         FkhPpmpq61LTBp6WyWP2yzpZCQylvNeYYRJcpGWLVkP9+VIF+YdHzUlbE+7WvFhlcHs3
         NuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785553; x=1792390353;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4HdBEWpf0g+zfKwHgHUCZB4RLqnwmfHXY9y3S77eIlQ=;
        b=rywd5VP77HoRzP0uNQ6hjJAQIp2Xr/qQ+h898TdB+PjsVBlI3NSpvw8Kd5ih5bxNpF
         FNOw3G4bVugc/3DDvmkoY5VQ1VL4b+B9FHr56PEHwRQ2tybHpi8kyT6KhQoH/pLcOnQv
         3M9eAQQsTBAygGznMU3tHwsae1T1IZcJOvfDQ30cJejiUrz+6MgQvw9PP0kxBjwJyUYe
         TPHCicEUF5Qmvm8yABSYSCXFm0prkP+ukwqvtCL0DVqVeSzm/+/ywjLzNqhXHYP8NvKN
         FVGMyxKw4JNhPqJ8aiKN0xAkWbadVu5zbuCjwOZxjUxeZ20BIvzEUSIjYgjDH7oxx0+9
         KmnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjz+siFyx6leitMf5oEpxoSVlrmmY4vUpvrPPKnVJpQk1Zd2q+ajRgVK4FJpSUNlj4NwcZFjm96ldumZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcH6NnVZKD9KpbGfg7WdummHNOGpmYzkOiJzRg1rBdRBT92vBp
	Ym+IaY5IO7RyBxy+I2BxzwIrEGIs8cEqpmuPP6xitFDNHKZDxIZmyGnS
X-Gm-Gg: AYBFou0qPImyjGmQ+LQG0T99os/9XZRWrLjw63ffOjMN5SG7apLLxCdLAPmBPCT6BPD
	9u/h+hVgybah/FU4kyCfEraQafreDThk8JF6WYDgE3Mf9of9eB0D63fCQRE10dAgRoY29le4UPo
	LJs5t5JoBCacaWkMVe4VeR1yRR6v/o+G8WufgfBKPz+Hr2TAOjUGG3U/ZmkyPx47P7n3Ve8CUCE
	4mjmy6AmYJe9oVBN2rdi+lWoJmFoP7z4yjPQ3CWwVuvAqUd/HuNO0rh8PkGfq3VJ/nnKvo59KZV
	SEvCZKzZiFrNfDOZXn3Se+9u4Mjj0HnVxqvcxSHrhVaDPF7hhPjdsJ6teaJEiiOz9t8gZUdBXnf
	RWkzVuaoJBgf3nNsPnz4zUxxPi0nljRydOD/sTaGhLSVklJhJph6kcZa6rmQKCu9DWDgQKEOz9F
	EJEax7rPRTtjs9DWrdTle5rEVM3Q1zr+cqbJSuzzX2HeMNPDyGTOZpxM3bPlBrA6jx2XXP2/4N8
	jbTJiO6WcaPw+bCUBPrZslzT72GFdmnX63pJQI=
X-Received: by 2002:a05:693c:42c9:b0:359:9e84:dc99 with SMTP id 5a478bee46e88-3599e84ea9bmr4362357eec.0.1791785552678;
        Sun, 11 Oct 2026 23:12:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:8999:e631:ed58:366a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm29420009eec.2.2026.10.11.23.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:12:31 -0700 (PDT)
Date: Sun, 11 Oct 2026 23:12:30 -0700
Message-ID: <98c68af25f9fc08500eb818a6d77d0d7@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Karlos Abel <kabel@voidship.net>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: discard pre-registration events and test state seeding
In-Reply-To: <179175785190.2.15570576039664484922.input-plain-reply@voidship.net>
References: <20261010180031.7-1-kabel@voidship.net> <assT056aFmzMHmON@google.com> <179175785190.2.15570576039664484922.input-plain-reply@voidship.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Karlos,

On Sun, Oct 11, 2026 at 06:30:51PM -0400, Karlos Abel wrote:
> The observed problem is the initial switch event being delivered later and
> undoing a subsequent Bluetooth soft-block. It does not depend on the event
> timestamp.
>
> hotkey_init() seeds SW_RFKILL_ALL=1 before registering the input device,
> without calling input_sync(). That updates the switch state, but also
> leaves the event queued across registration.
>
> In the unpatched hardware trace:
>
> At 74.486 seconds, Bluetooth is explicitly soft-blocked.
> At 80.300 seconds, Xorg injects LED updates followed by SYN_REPORT. There
> is already one event queued.
> That flush delivers the old SW_RFKILL_ALL=1 to rfkill_event(), which
> schedules a global unblock and turns Bluetooth back on.
>
> rfkill_start() already reads the initial switch state when the handler
> attaches; this later delivery produces an additional action after userspace
> has changed the soft-block state.
>
> Regarding the missing input_sync(): from reading the initialization path,
> simply adding it alongside the seed would be ignored because EV_SYN is not
> enabled on this device until input_register_device().

Thank you for the trace - that makes the whole picture clear.

If input core handles EV_SYN properly from the start without requiring it
to be set in dev->evbit, calling input_sync() while seeding initial device
state will flush dev->vals right away. Then those seeded events will not
stay stuck in the queue and handlers attached later will never see them,
so there is no need to explicitly reset the queue in
input_register_device().

I will apply a patch to input core to always accept EV_SYN events. Could
you please send a patch for thinkpad_acpi adding the missing
input_sync(tpacpi_inputdev) after reporting the initial switch states in
hotkey_init()?

Thanks.

-- 
Dmitry
