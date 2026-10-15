Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3B843B49D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093667; cv=none; b=i1sJUfP061B8ToR9AkWJKTcZSrw8tYUv1UgG21Fdxqa+KXdPj4O5IyR4w3l4UhZ4Kf+c3ov7BTUUkEbUsosJtnA3Z8ozpT/AFX522Q0XgyEK8LOMXAf3raIKjHBGkpI3nGyCZ1kaC91caeL4lkeAGHS4BI7uMZE8MKhNo1vXKL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093667; c=relaxed/simple;
	bh=Lvu8bhCvl4Gx6QrlBiKWXsLgcVGs4226pEjWm6a8HHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXlQwkNbIgIJkKGiqWZ3FI8OXtoMwCsiGIdsn5rVpGcS7gqCPZxtVBvGSx81woC9Zbza849Hm3EqjzD8GAQso5QkZNmYHFkM55qJvmMCSHUdkTkdNwnq8hurxNgDL3Xc8wgB6uediFKIXytfu4Pi2b9/KLVZ2Idc757dQ1EqWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XyNNeGor; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XyNNeGor"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8253bc5a613so1810782a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792093663; x=1792698463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLyXpqOX1Wq1Gtt7ggrKXwSvKZc+5L4zCwwVoXGTvF0=;
        b=XyNNeGorFjM9Q41WaNkCf0rWHRsAGsFzOT6/Nuc0b1BACAt8GDi4T8EkQAjaao+Vt1
         BbqRbGH62my38643lBz7aGIjZj50drVFyiqzqPcrCF9bGRTdB6Uy/EieRWAZ/li/BJ5x
         lM0E/Q0i3ncSSB//1PU1xoHloUIvdkmsFobtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093663; x=1792698463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLyXpqOX1Wq1Gtt7ggrKXwSvKZc+5L4zCwwVoXGTvF0=;
        b=I0vXbckcyL7TDhs59HInCMyOIUTqgypoasd3ImDebas/KIuSp4gIWKlvtIuujxjJdK
         EgzrneRr8mmEeygsMKeo/qBn2DOdCp6MNxszkGvwWloGzewJQchvxbOzOQKQrfx9nkaA
         VZ9E5Zudi85KnMfLXdronGDkqhDnjSOJSUJuyBYzuLKYRuldrTB8gDMF2d78od8FLol5
         G2qqWPiKz6LcjmXr2gHJkV0fxh7gYm+KyYKHZo2ESRCJF688UvTAKmNxUS4hPauizExc
         /5TRIACWhKJG9rfZt4Q/LNKSR4PfNkk3he35jZ3pSopU9u2du/g67FzVLMLRATkYY5Kg
         V3iw==
X-Forwarded-Encrypted: i=1; AKwUvBwvDXzmVsdQ9/9lWwhcYSNzxWrWzWGJDBr/qLvED1jHOFi1aebTNv2nxDp9CsLx+Abt5LUYdlEumrlHXJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKWFudbNh8llI9h5n4o6nDTnP7/tUtJaEDdJMegTLGkV2fHohT
	5vVxrL/3psy3Hw5Y0IMKUuZdiwGcWru4BMPabFlsznGsnIYKi92lrvNAShwkLQU7sTY=
X-Gm-Gg: AYBFou2bP8KZ3/3DDYeGdAnjL+iK19FH63spa5Up7db5W1WkC+WN3yw2XEVJsWoFp/x
	y583LNl6v4a8lu4LyrN9pVN128veQWmtlimnZmkONW6wX9ppxr0aZ2ECS0Evks4Uxtf5lAFOemp
	al5jHnT4Uvux39LTB5H1ia9DKYE96gs6IvCUK3YWS03ZZrXZe9gP49bt0grmYDD1J1jUTUUGfus
	ybZuEbXrmK7UrPXK4QTnEXbWg7fzIgpTy0GNgVvLCBJKvVjiBsvDkSqVl1WxGXwqWq2UYB2sz10
	3H8Y8YZMO+rTY4BIBxvO9Gn7xJmzMQn7k3oKxg4ZbIXTbQQ+vmick4mfjXHVkNgp9pBYYJA4s9I
	QZU5z+JTKuk14s/9HHuZoU1kA+k+RAVbESbGLwkBpbRIQoCun1EmiyXrnjjV2bn/sksKmg9RxQo
	9+fvIgZy3cBAYf24Nv0G5TMzukqjUhBTssMBprqrnbb+tOD7dqL+Ea3NMDtHOo0ADoyoa/P2rTi
	CB4qn8=
X-Received: by 2002:a05:6830:43a1:b0:7f6:96ad:36a8 with SMTP id 46e09a7af769-83094798f74mr18262866a34.8.1792093662804;
        Thu, 15 Oct 2026 12:47:42 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a7003d35sm36481a34.26.2026.10.15.12.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:47:42 -0700 (PDT)
Message-ID: <2fcf2983-0972-427b-ad05-b403e325ce40@linuxfoundation.org>
Date: Thu, 15 Oct 2026 13:47:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Start removing X86_X32_ABI
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>, Bill Wendling <morbo@google.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Tomas Glozar <tglozar@kernel.org>,
 Willy Tarreau <w@1wt.eu>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/26 12:47, Sebastian Andrzej Siewior wrote:
> Patch #2 prepares the removal of the X32 ABI and has the broader
> reasoning. Patch #1 removes x32 from the selftests because it does not
> have a depends on and assumes x32 to be always available on x64 and so
> it breaks.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> v4…v5: https://patch.msgid.link/20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc
>    - reword commit message for #2 as requested by hpa to state that this
>      is the last warning.
> 
> v3…v4: https://patch.msgid.link/20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de
>    - Depend on BROKEN instead of removing it.
> 
> v2…v3: https://patch.msgid.link/20260707212252.bYk3-AlU@linutronix.de
>    - added a nolibc-selftests patch to not break it in their setup since
>      it does not depend on the symbol.
> 
> v1…v2: https://lore.kernel.org/r/20260523093734.A3AR7reJ@linutronix.de
>    - reworded commit message
> 
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Jonathan Corbet <corbet@lwn.net>,
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Neal Gompa <neal@gompa.dev>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Sam James <sam@gentoo.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Thomas Weißschuh <linux@weissschuh.net>
> Cc: Tomas Glozar <tglozar@kernel.org>
> Cc: Willy Tarreau <w@1wt.eu>
> Cc: x86@kernel.org
> To: linux-kernel@vger.kernel.org
> To: linux-kselftest@vger.kernel.org
> 
> ---
> Sebastian Andrzej Siewior (1):
>        x86: Start removing X86_X32_ABI
> 
> Thomas Weißschuh (1):
>        selftests/nolibc: remove the x32 testcase
> 
>   arch/x86/Kconfig                               | 2 +-
>   tools/testing/selftests/nolibc/Makefile.nolibc | 6 ------
>   tools/testing/selftests/nolibc/run-tests.sh    | 7 +------
>   3 files changed, 2 insertions(+), 13 deletions(-)
> ---

For selftests:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Do you plan to cleanup x32 checks from selftests/x86 Makefiles?

thanks,
-- Shuah


