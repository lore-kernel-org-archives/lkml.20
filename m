Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD80560ADE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992908; cv=none; b=jELTmwvV41HADGaod5p1WBATsvyhmmkUVoTyKhs/Mo2eg9KLeAvRaRgVKCMHhcfaKl4AyOpKomwPk1tNu8zULT4bbwPfK7DgGVgdZGqJXvmgfBIJ5VPtFFOg6hdVrjVIyz336+Um7rU3J+pX65hFgUHMJCYAoc/wxBY4k+asYMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992908; c=relaxed/simple;
	bh=a/8E072az9TqNHLpioLquDWQWwqCcSa7yW3WWTPze/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZVKHPL7LVXz5hTQFZGMlbK+M+GIfzX79aiWHu8QakclPXkfD+1Bu7bDIJg9NTiBbNIu50p6DlT++neJgkJh/An0scrF7PrAJyjIn/welZbJfa3nDSQovrEcmr7ZEes/vwf0Olhe9m8GpP5xtSRPRudI0YRmBhEqB+w64ZpnoMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d9VB9f63; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d9VB9f63"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-824e6e6ed71so918373a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791992899; x=1792597699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3h7V9jz/etfn6h0SF0dpBgn4IBujQwOBPWBG/0f6sUE=;
        b=d9VB9f63WVnp+oPh2oiL/UmkRHgA3vbnlY6DHN2FFxcjrO0+v312PkvTr57h8WRWsZ
         fnyEvneoJ8OWw2p0yFiGpoOIKvCfp86wNCRLJkGlNhVyZmT4s0LJL64lLm8HnEW2ro/O
         /HTMCUaNsldip2fp+EfkdTvN+AIYP2B7c8yaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992899; x=1792597699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3h7V9jz/etfn6h0SF0dpBgn4IBujQwOBPWBG/0f6sUE=;
        b=LuK8FAfgAWgNE7tMKsyjhkE9bYtIJEgnb79ITR7Ym48mEk8K1wX+jA/IORoR3mOpiv
         QByRiLHZGFfELp0CZOqnSD0PJS/QA/BDbpH9JHmolRQt+iU6VGOSYxBo2k0euhD0MtbA
         OYUfvv8TpeQdimBIqwgFXFITi2P0C36vcT3iogflGLEEGVCZ9zGXe7sV8ItOEOA4dNPT
         WvM6Mhv1EbaihFHb8I7uKx21Hyud7eWYIjeDi4SAJFhBEsTsLhdfo+SpRybSrjCnfbmJ
         utR70MukV1ymyfZ1mhWHvq+a7+Y2LqOgnWeZ4bA2+PMW3HiqIS1uEJOSa5exekh6jT36
         o4OA==
X-Forwarded-Encrypted: i=1; AKwUvBxKDviEQ7Tu1GynXCk3D2rooHU/5ZKzBNjfnlzfLoGuHb3cU1JUO3SajTLwAbzp8xfp7ETcQip2oTi5tpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0mvBYt6ufd/5gJMX3xQx4QxHYA1erGDroU/F/thi+pNt1qJrP
	sH4qHwPsytlhW7qBmv2RPH0ydqTE23ibsn7jYKOKksoiU8b3Q55MrxyCoEyqRRdps3s=
X-Gm-Gg: AYBFou0TfjKCseDnOFr2+LJvhSGoz3bpYtsP3JVERKWMSxsW26lMcYDqPRSEgQHYVRw
	k46F5bousTBORnK6FK/KKWsFgKOVXnTyjl86hh8JAMcSK7s8WY0E+wif0VoZwUM/o/+U/QRg/Mk
	J7eNyim1OqCkrzywxmhWvCE3F9pDCWKhHQ8QAlD00mgit5Ia3ZtZqZ0o7BF/BXj8oZXPcMmxiJE
	EGVLPvuOyv3+jhivBoI16MgODpzqDebTqZP7o/acUGxSoDDhKo/DYfipMGg8TTys5jPRJQwy2vz
	YPrHxhUkxj6IFKSHUHEyTmFw29fQoV6Qvr34OJA0sjki5zrv2dWVOZtkFVbHMdEFUMJB9pY41pF
	bROObrg3C1jHk/zibvq0PIpiChXIuQXnqZPS2kqPGDvlyd1LphDdSnaudnbptlmVkpEiuMFnBsE
	HbOlNfUBIhtNYM5FGqAqDEasSzWpCouXY8t++rxl1MY/UHzsBsLTETprkIRDKtPDujTD4yHABOV
	yBuzMqA
X-Received: by 2002:a05:6830:3c84:b0:81f:b957:abae with SMTP id 46e09a7af769-83090e15bb3mr14254616a34.1.1791992898993;
        Wed, 14 Oct 2026 08:48:18 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a47048sm15062632a34.19.2026.10.14.08.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:48:18 -0700 (PDT)
Message-ID: <1f1b5c35-fdfc-490d-9196-97621915140e@linuxfoundation.org>
Date: Wed, 14 Oct 2026 09:48:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: lib.mk: Don't fail install if no modules were
 built
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261014-kselftest-lib-no-modules-v1-1-e4f7208dcb56@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261014-kselftest-lib-no-modules-v1-1-e4f7208dcb56@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 07:03, Mark Brown wrote:
> The install rule for TEST_GEN_MODS_DIR copies *.ko from the directory
> with rsync which fails if there are no modules, for example because the
> directory's Makefile skipped building them. Only run rsync if there is
> something to install. This currently affects the livepatch suite but it
> seems sensible to fix here for added robstness.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Thanks. I picked this up for 7.4-rc1

thanks,
-- Shuah
