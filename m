Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D832559315
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926588; cv=none; b=GOgldUq7G5h7nKvmcHQ8Fn8IvCtOSGavqlOk6u47K2GhpoMwQLF7nNZnMcrulLX0WfjeXNJUO9hWE8oAxtgE1n8qEIQHWPDZgPtuPSnfpHtShyeGTKyYbuEhjDo5Ioo4mNh+zEq7VwZu+ZrL5q7scKsyVP7OD/Whl4rA4I4eRxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926588; c=relaxed/simple;
	bh=yiESBERC+Xl3L7/FsxOPHfK5bIOLCgd7G0wZyXxK1mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iUUgGgEdZXq438F/MfJwgnnbG/HxZ4+fIYUNTOVpfFDQ1Dk5B60oQxp/7Mor5M3wq+sO8Klpa5Ucir9HTsRY6kDAWx/17m8du5syYkcxqRFvkKgJz2MMnxD3udwhL0MLOBsWoBLm+urDcCMxZZc8r+Or6iHyF2H+9fu7tucrZno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=FiF4LpHU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FiF4LpHU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so29702795e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791926582; x=1792531382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNr9QrvvLJoXy24Y9C0L722O7ExNexOvKEg2BEzpUi0=;
        b=FiF4LpHUWTc7u89iIkiTPgfMImLvX7iKSW8Lj45AdTsCMpEOu7S0Qw4/+iRaDiNuJn
         UNEQwVuLtxeRaVn51aqyQBYONkrFw7bC7mhtLWbnMK5eoUEs5kdr5Rwc9oifFOvh8hOI
         b5Z8sSb3EyZ0qis79oCnYsxKcli80Vpflixt3xYWRqOqmJJGckqIXjEIHLygNyuQDFeq
         IB0nmMMkd4XrDLq7d2iqz8w5eNxGHFA1ub6+fCaeQUEXJKJoCPYTFzJFxRvg4uLJ6KE4
         Fv0qopsINOJbGAh9ruO/huvBEqRbt0EjkvXXp+0nw4ZCwc4AwbfpzJmRoOVgYRnwMctw
         KpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926582; x=1792531382;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNr9QrvvLJoXy24Y9C0L722O7ExNexOvKEg2BEzpUi0=;
        b=boXgqQ7RAmOlGBaMy3TL/Dp7tSQQDIjrPAL0KvLm9Xl0lNovMysN5Jhv8rI3tlrkyK
         avU1dEBirYerV+9jsp6L+kp9r/urpQGKgDKwk3EsNJCcqIjbdL8wfgPQ5/2JfwiHUgQF
         1RYMQKXWJXYiPoYT/Yn6qGOgQeWqtJ6p2ef4IUM6XdPtrz0hEC18lMldrgI6QhoCyPyk
         /lbeZJT9NNyPluyL+SBapwqEt52TT861faPWcmuBjjVrb96Vp3iWfI4bk13KlDpU8gAr
         aQ4fQNtc1Tl8wF9rBNXVH2IUtUNGr05q/EhlCfUvNMKdHgn+THtMS5OXa8nUDfdzeSkM
         Fj8g==
X-Forwarded-Encrypted: i=1; AKwUvBwzyKhPuKqH2POwdh/H4DpmjzmrhCRk9lSGEhVoOAk0HF6TNyRujBfDa8lyt2/vgHMPQKdNYhrcnTnCwP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYITEipr4XduJgy+5z5DVSLlT/5it2nF1oueeqUYtS9PuS88xl1W
	j7BR5QPyObWHkJA+9tOVVpN1Zmd2FPl1KwrdP51N/43sF1SS9wFPbKQ=
X-Gm-Gg: AYBFou2EoCB2thBWNV1fSCSchKScXazxvxhEN4QjepUYXWE7irPJaJA270Ugq7/BVT2
	BufgE4TohxLrivfHL8NS6Ffa6jxA/vS4KcH6DIQ57zGh4tV94v2G7KC6n44HaOrVNIU9K2IMrGB
	MKkWTHYeeanRyUpfz51U2H96MZGqy0fVYzty2GsGpqxqInuYIB0p07NsUkFwoWDVaJuYJ/v78by
	wa6YztKVYzryXnncXICUqrwLcDl4rHo46gf6LDwSnNRJSZdhlmtQqXC86gj9k695XwwdGmdKUSm
	pemL8errUMfU7JH1zmL1xXKqyieRtRNKY63Q/QaXPwMtCkYHSdB9FC/nlDEGBJh6wdjd0qP75tG
	azoR6rPHw9ERfBNg+k8aP0VmtGknvVM/G99jCSlfk2Feones2MzWmLZD9UbdUUIoHmc++wmGwHQ
	MflgKQGe4n1wFU8Eub5IFFaSe6hiX7JwZ3Clb53l0w+5ZOnMin5i90Xbr7L+8Yl6sVZoJIw+7V7
	X2KUWeMiPr5Twzy+xLuGGvwKdObO69/W1yZUKwEhzX53LGz
X-Received: by 2002:a05:600c:8519:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a18e4a16femr256430895e9.10.1791926582261;
        Tue, 13 Oct 2026 14:23:02 -0700 (PDT)
Received: from [192.168.1.3] (p5b057b0e.dip0.t-ipconnect.de. [91.5.123.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm613852585e9.8.2026.10.13.14.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 14:23:01 -0700 (PDT)
Message-ID: <d65b9db1-3445-440c-917d-fce806af41c6@googlemail.com>
Date: Tue, 13 Oct 2026 23:23:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 000/281] 7.2.11-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261013112855.045212108@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261013112855.045212108@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.10.2026 um 13:35 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.11 release.
> There are 281 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
