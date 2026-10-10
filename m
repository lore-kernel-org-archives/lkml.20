Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6A43655E7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595716; cv=pass; b=dPrFtCWlA6xG0T6n0ZaijC3QwADsBnB8Atgy5nTAqqq1H/0OOkVCMQUOOPl5oqCLLv+E3bGJx9ogsvM8Ol9Eakrc4x9ZXUkyXppBXOVRxKO0sTiWXinUSzlPoryrJ7xspaRNAavJ9G5UTLTeQojaV8eIsrJVvANz5I8MMElJKlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595716; c=relaxed/simple;
	bh=PQqVEjZzdFp6GX6b1o8Wd/bxI6ijPC2wBjMspU1yLMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5tHTaR4ufRXwKJfQ4vJPCqBZxZtbYdoJFq/vmp+JLUBya9+HyV3uF/FpXAflk1GrMfG3q3ApWF+nbFwKPMEUZhkTskcNp0SOQwCJveXqkzUeCUWDfDhiVLMbXiCQjLIELmu1hSpH+Cas52+WseJF/47ysu+CNMS0VALVcMqCRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzT60l2j; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzT60l2j"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bccc73eea4so4158828e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791595713; cv=none;
        d=google.com; s=arc-20260327;
        b=oEMj34jU1TdbzM6ml7YB0CH/gdGKA4ikamVM9bpzhUVRdri1dAzfiQHzIydsOn5EqL
         qlsZVzqOmuJilnUnDtaJiXfPNcuC5xrgEmjiIRUdE7qurXQwHyosHLZC5TzGvVu2oFrY
         cJMSZnXrKSSNFi8SFdwca++KGgCspgtE1nc4Mq4CLKTzq+arUiQLDTjJDl/HHMg7GyEC
         6GsngsTOVkz993+bU+TDey3uMfFAZ8m9R3vS3k/d9iJul0rsUvg2FckSs7sPI3YZTWRH
         FdCaepWR8+nntMprMbhIJUan6gU3mswQlSB81y8aAR1unStWRodu2WorWV1QPNHJJ6KD
         tuFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T/OzwRCxr09DXaCzTWYlnEF4rrRvRgzzD/Ns0ejgdsg=;
        fh=5/hjH+DWjW7HSKGWeE1ez74CqUXq9hJWWYGFOgwuNu0=;
        b=ObdCLCC2gVAmIHRF6MV5t7iWprgDsuvn0GSWbrLUzu15XpUFMGkLeO3ueil6AKhKdU
         pK92/jBVlUftDRfOE9DP67P3WniZy9VOgdlUEBb2F9muyiEL4oidFi7HHg0xd2zV2mbe
         iVpeqyXuQs16arhv7So04NdSfBsrcAJIiq7dld0qYMsX8W8fKBBfODY/bWaQDu6Zsz2J
         W8p2+jVdqktOLE+KKD08a9WjK9YgBaY498UCUNvZU8wWfkIzHqS219O3np++maklB7V0
         /tAf0xut/XygglTpXVw0MZ/Tt8iN/s65tW8Ne87HJtWBNjkedqnyjpSQ2OYWwwh3/GCm
         itEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791595713; x=1792200513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/OzwRCxr09DXaCzTWYlnEF4rrRvRgzzD/Ns0ejgdsg=;
        b=OzT60l2jIGPMMgXLWRAOXHu3a/uKiubgWpCPialmeFR7MzXzPlteL6nzmBxaiZLsjR
         RT5lQ/TdjJMYVsmgYor+zZ/viJPrbQDoGg9kpjT9pwlUqQ09Zf5y4epvxYJOidElaOhx
         Kj/Sy+FJRQ53U6AXZ6bccMg/6BiVZ/Q1hByBLy8sEJ+x1+foc5+jC3UF3x3hAcj41QT8
         rBRLyBeSGjVK5Oep/YS03/R76wuwnMU7H0POqX4pBp9OBkM0c/t5Yl94/EVUXH9S7Kfl
         qxWMs9CQwZ55IrWX8AtUIcvR4OlUAm5wYbfa1JBSiUtcPeKDPFdfKYcZPn0CtgIHtVSX
         xYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791595713; x=1792200513;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T/OzwRCxr09DXaCzTWYlnEF4rrRvRgzzD/Ns0ejgdsg=;
        b=pse47QMcoBaLmluE4/zmNlI/fAGMwjbjeJOPelkaFkoD7AF2CHmpWW+OtN7hxVW7RG
         4YbCwsdaSr+3Bw1dfYQ+WbHFtRHPfgEknZU7kyp6XvQ1ZtvXYcAplDWhaJHUeLthKhMJ
         LGgtrqIGBZVJuKKjYLUFh4kynoLZ5g6rK0mSasn4Z2E/pZzpWK367E0hoD0YLyxD7Udi
         a4t+2wFRuDxvGTA6R3jshgoktHuaIlEuoJQoh/JhcrkkYFEn/aKkq1TC1wi+SBWBAdhV
         B5wr4oauukBLo5cqZJxR4EeyvKyIJE+iLhHvZEWJaO2QKAq28hslRoC2ou/6HhdmEkLY
         GCEg==
X-Forwarded-Encrypted: i=1; AKwUvBytiXmRptfojYPJRxhaA2ChHWNUaakxgCqXrUv/5XgEvF5wTkGyLSkGqVXabeNaTtENfXcicg70GqETCQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeAGhAgX0TNMwOl518f8fhFkHMW5OZfcG9bg/Kct5ydwPgUgyE
	PA4uQJwj/58oiV+YYumnkqoiDcDHmyC1/h/J984yphF9Lpk4tED8kydTUG7MB4V+nBv5BgT/IkE
	/AGA/Qls96Le2C39EOzi34trcWe0ZwDlEYxM4
X-Gm-Gg: AYBFou2bWmh9V0Ay58bS7dWljdoxkuLEtdsDoQ2knikQ1WukM70X3qv29c1bLI8G4E7
	yLUw/YFLALpqHPD3jAjyW6Dj43HWpFt3+4KPvkR4N68W7QZnT1WC3Y6UDIHUGGMA6lAwpc5IUt1
	EhIHuSJV3gOQQJ7TztoJ9GgsgrPREZX3LNs3MkELtCVN0gHQsBXRmsYNx6oTSaNlxuerHpD6hMM
	PY1ARpX16KSU50nYzhszrE+3q5vc6z0XAAPanBOLfwp01AQNQ2trJangsxWzCiT5lrTdvge3wAq
	M21ghBBZepOURHEVyRxEa7Gtr/QvIVjetwE84tlfZc6IIB806+1V0zw4Kl/gNM2lo4mTE3USEZY
	6xzSmw/GH7xLztA==
X-Received: by 2002:a05:6512:3b8a:b0:5ba:3534:fb7d with SMTP id
 2adb3069b0e04-5bcdd1c306fmr1257293e87.2.1791595712594; Fri, 09 Oct 2026
 18:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009092759.968521-1-linmag7@gmail.com>
In-Reply-To: <20261009092759.968521-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:28:20 -0400
X-Gm-Features: AclHuK8uJFVvPcUKKOimU7sHm2iZxU66fHvjABbh1-Xp-I4g_eUpWRz-8ZK04_o
Message-ID: <CAEdQ38FEDRnc6DR0mTtiAfct2WwvSVjrFWtTzQrN-DtECaS-MQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/seccomp: add Alpha support to seccomp_bpf
To: Magnus Lindholm <linmag7@gmail.com>
Cc: kees@kernel.org, shuah@kernel.org, wad@chromium.org, 
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026 at 11:27 AM Magnus Lindholm <linmag7@gmail.com> wrote:
> Skip the pre-notification signal test when /proc/self/syscall is absent,
> rather than unconditionally skipping it on Alpha.

Nothing in the tree skips it on Alpha; that was only in v1.

> +/* Alpha returns positive errno in r0 with the r19/a3 error flag set. */
> +# define SYSCALL_RET_SET(_regs, _val)                                \

r19 is still the fourth syscall argument at an entry stop, so this
relies on the callers also setting the syscall number to -1. Worth
saying so in the comment.

> +     if (access("/proc/self/syscall", R_OK) != 0 && errno == ENOENT)
> +             SKIP(return, "/proc/<pid>/syscall not available on this kernel");

Alpha selects HAVE_ARCH_TRACEHOOK, so the file is there and this never
triggers. I guess that is why you have 12 skips now instead of 13.
Please drop the hunk, or send it separately for UML and friends.

With that:

Reviewed-by: Matt Turner <mattst88@gmail.com>

Build-tested only, with a cross compiler.

Unrelated to this patch: with the selftest setting a3 itself, do we
still need the fixup at the end of alpha_elf_gregs_set()? As it stands a
tracer cannot skip a syscall and have it return a small positive value;
it comes back as an errno. The r0 == syscall_saved_nr check in
alpha_finish_syscall_to_user_mode() has the same kind of problem.

Matt
