Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199D36E478
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748840; cv=pass; b=krzGgGaZOuF6ymoVuSaE7dCjJwy/bmcVkq9d/Pqr9EpmGPYN/yzwQ0QnBQTyC8/fpRvuRzonFq2bhwnct5kukVJYfw4529KHDA1nXRdGLVEtXGnR7lL2Jxl7aMgwuwJnQO7LHfRQnqn7nApIRSRfWXNAZX4CTsF6Y+YNoU1K76g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748840; c=relaxed/simple;
	bh=bYL7lEF9EBPQywYdkV6utsdpe40zrBCiNEczQQi1TLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJVq+DIjfnix4LxAmkOl6hokQkuqYMnAqRW6BzVpavvhWbp5Hfr8fySvZsKv/7RtK2zCsDgJM0Xh/tQhq/U9BcMxo1HNs+YUemSWzStfMHZE0KfX1EuQpOpFde1inZFYPMNnT8jiyFsV1HGC6mTMko0RTRctzoN7nhv35hpDTr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFgLvk6A; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFgLvk6A"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5338f65913dso15555871cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748839; cv=none;
        d=google.com; s=arc-20260327;
        b=dYS4bqTi4hGBrlWxtd+/XXaYy22q9v0maXtqG6KO9AT3UHk1rclynKpD2u3h5urq9S
         DHq5Wh7Z53ipKVXY0kZEndnJ5qpKW/BH4MCyNEEvh8ERtkEnIu8sj/d1yRk2HTVgBU12
         DH8Kk7PChQXCO3i68WE6T4Rkn+2cbrY4x/dfI+ouv7QZqn7ZqFZF+ax9P99mfwY5ybb3
         GMmhf7d2NHrTjckcywJsRBVFp2hAViXIGxWtTN/6xahZZiDlQGx4/e3FclnoqYq//j+i
         +hOTz4BSA9mX0ycQG8ZY90ZxOUWXn05gtEYz66tWiF+c3Tg8HG/3/4j0SpT1GVuIhyln
         OgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zEv4PBcdGJDyHGXZpS5PeBl71OvDfJp17c7butaS+8w=;
        fh=2yUn44xAJVhDwWkuB7aYbUKdZwv95wwVybLoXHO4iac=;
        b=CPoz4HnpGfPavfckwJ5JCT7YRf4pzo4PhfwpiwFL59amW7pVP8fWRjvxLUHl4408Q/
         vBTJPIdalUkM1iYEJezzxt0Ul6geIjiaRWOqbO5tR+aDV3+Zfj4hvdQi1vkssLXzMYCz
         Q1HVByIM9QN1h/kVzKtu3SyHTIChUxolKcnECxqoiNyU3dzNExJ8XbbdD7wpgnIAJsfZ
         5t8cKqxBilL9CEonS0HUFZo4Vh8Su4Je+0gdUYibLBubHEwUCtHLRR1VFsuKnnYAhcUI
         54weM6UjQFyhFM3SiS35CDLINMlMb2X1xsSzBWvlTD22HQySfEnHEQLmXuDXQg4LQkar
         +7ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748839; x=1792353639; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEv4PBcdGJDyHGXZpS5PeBl71OvDfJp17c7butaS+8w=;
        b=nFgLvk6ANtc75TLdOPiXFZhd1E85fsQCgoQ61chlKgskQ5qhEia0QJNh50h6IzybU2
         uR/XpbYAd3p43clsD4xqDu8SWjXe/PfS8bSVdZx77iBdWM1L7jSPgVMj7lkPeC7Ph3Du
         Ln5F4iHXkvnpMQlSy67WMc4KURYFIFCgWlE7RPepzYkvWSue2ROsMqyL3XDPZH9GB2WE
         bxA1lTxjD0yln+0age9c03dgFRpOOBiHk/WByTlswsrGIYYclcOKVlWhvi5loDYHtULg
         MECmEVgQGfI0O5uA7sANanWYrh1IoqdvTagHP7meXK4MeWXDaaoiGIvIsMFzxAMFZZVx
         i5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748839; x=1792353639;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zEv4PBcdGJDyHGXZpS5PeBl71OvDfJp17c7butaS+8w=;
        b=r6SzmKkqAYGSZkIrKbb4wJ3jY04XUbS/fyVnluF8VavvNWYVtwcQZzZ7p9ZcY2F7WR
         ZOzFKU1VuEE1vcMRpBI1UV0SoEtmYxJxToX8btK7Xh4+i3PZ5VI2Dy3sYKm8+IMTu0In
         +2KYMpNTdR9jsBqLy0jweyXw1Udmph/k5fgUFqDfIGiLBJGEtD68YUfg9qomffSrTysC
         y1mle+Uis3MFqz07r1GMhNMzYFI6SdfdFBj3f3fzNutK/5/RLvBVA4aAr1k9/3TibF0D
         0kz709WAdV+1gh+EG6C4VsyF3OF9TtRzp28N49+sNiUQ7vWjNYvPlt3k4iviICX7pj4b
         b2kw==
X-Forwarded-Encrypted: i=1; AKwUvBzUtCjNStmSNNSN7ekHsJDqmamzaGaP9DWqPzCDVPWOFJL02HUyvJMTnpMiklogA0OATB4JP9fTVMB9PVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbePwPcW+UstuGZ1cm6wZbLY/mFkwweaZrV7RZlBaejIGaWqo5
	On4jlS9mtRaVsNBPPLx42xQqWjX7I/OH64G84HeDAuKmSSFju2WRT5glkX4axSe+VmBv9ElKMQj
	Yw4rabZqzRZ191JrTWR0fCj5Tnn0ExjU=
X-Gm-Gg: AYBFou0xqOQtqwBEe/tyJAHOKWerAnnYvmREOR90+PqngTAfDSczkmgMkGiaEooPuGq
	6cs89wxsa7vBptKtzMVfJtF6NGP3ExC4OCKHKW4tLTuQLhbrRrH7wq3upXDF6BdP670R9TNfKGy
	aqneH2vUR5CDKoo6QXwO+jTiCH3XeVDvRRJwetKMKuMUANE1T1Ig/Q9qyj34iEPDQuUXf9cDWrz
	yLrLwo0RL7/oWVwRS/t6DgjW84k3WlvrxzKcO4MH+mjmVDpycvWkERBQbcZAmKxmuPkYXjtRgsA
	iH8UWzU7dPoOeUN0jyGKcBTMqRZpdHQ7r/GFDmGz8eSbQMjDhWY98sKVl/lTwViDI8SJuRyEIYV
	ZWogMn5tnF3MVMNhl0R0G5jiVV7Zx3KVdO4mFJKZ5d41/xcYySDO1TblCmVre8oG68otNJEo=
X-Received: by 2002:a05:622a:1ba3:b0:535:a5f9:7524 with SMTP id
 d75a77b69052e-535a5f9783cmr124819321cf.67.1791748838418; Sun, 11 Oct 2026
 13:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-6-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-6-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:00:22 -0400
X-Gm-Features: AclHuK-icwgsC48Km-eUTvYCG_61xgnem75VKlOo5DkjLHSa5iilCjLTl0a3u8c
Message-ID: <CAEdQ38G6KtnJVgS=5VtJQyNy3Z+LQwgaaAWc4MvJfxRGU=yF2g@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] alpha: decode Clipper environmental events and
 retain console logs
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +     if (header->code != 0x206 ||
> +         clipper_process_environment(header, 0) != MCHK_DISPOSITION_DISMISS) {

clipper_process_environment() returns MCHK_DISPOSITION_REPORT for any
valid frame and UNKNOWN_ERROR for a truncated one. It never returns
DISMISS, so this condition is always true. The silent first pass can
go, and the body can lose a level of indentation.

> +     status |= CLIPPER_BITS(CLIPPER_EnvQW1SMIR, frame->smir, 0x15);

Your cover letter says SMIR bit 0 stayed set in all three reports,
including the one after the supply was reconnected and its own failure
bit had cleared. With this mask that last report prints "System Power
Supply failure detected" for a recovery. Bit 0 looks latched, or
inverted like the halt and reset bits. I would treat it as raw context
(mask 0x14) until we know. Could you post the dmesg from that test?

> +             if (packet->type == EL_TYPE__REGATTA__PROCESSOR_ERROR_FRAME ||

Minor: Titan prints by_type.regatta_frame.cpuid for these. It would be
useful here as well.
