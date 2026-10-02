Received: from mail-pj2-f15.google.com (mail-pj2-f15.google.com [74.125.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D824A05D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904873; cv=none; b=hgCVw03POnGyvK0BzlhDZ2/Tt1RxgPnBgTrQP77t6KP9LERN+lZIVJ/WgGXe+EsYn0hqNXhe+3caZCa97bUiDn4XuojhRMCqpHfgCT0wY13NiV71X8Twr9uldD2vQNdkEZRgBTNu/wyVUg8evRFFeJSURqj5V4d5QBMMCPP8xqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904873; c=relaxed/simple;
	bh=PembZoCdz+7bRnCQp2w/8rZ7ZuHcWjwUxhq5DImUPdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phDAbY31ucY7CAAWuxQoQkCQlgtI/1SOuxa/bk1PkA8bQvyb51VS8AMd5NjvzjWGy3Qh4uvDqlq6y8mmgv8bVefecF0m6BnSHuumZvGGacEu4iD7Rwqv6Dpif3QFddrM/c8rjIvCfLGZm9PR8CFdegvQ7YEuiCmu10Z92Et1vNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cz1VGMCP; arc=none smtp.client-ip=74.125.227.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cz1VGMCP"
Received: by mail-pj2-f15.google.com with SMTP id d9443c01a7336-2d747f01363so44255535ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904871; x=1791509671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yMXLLBKJIbIBHwP8/q6QCePmdG0lQXlkBnomt+ctiw=;
        b=cz1VGMCP8oC0NTq26m0aSvuxyTPUtCKGKamA42m7yIlT7RgOojQaYkE3CMdaaPT8HF
         PUUOaeyg3lHxjLHiipvwj7QCFUVMDkk4ZdYMi/jXyb2ovIzR+nrBy1/MX5M4sQDQ7kel
         8TV6sJnXs3sRWEgxW+rOMcxpoqOCZs7H0zwiP50VIx63/F0C39Vro5EiqITx7vk33pqf
         +Lq1jyVD6x3qxP66QKEUmNRW/jY0vhHcV7GeQ+HHajkIOVXyUKlmU07VAOP5OcImVLZn
         CyRpQ7sde8mfnjc9/ZDjl13MaZpiMIIn0sABCz9Ri24aulqvBhbED0l9uORKZoOB8/Wo
         42bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904871; x=1791509671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yMXLLBKJIbIBHwP8/q6QCePmdG0lQXlkBnomt+ctiw=;
        b=XaXRmU3d/c0gACx0goqlFCpd1U//fGr/cyjDd9h7ERJ6P/JGjkb8VR9p3C8wdb+0vU
         VhB2hKF8LBwwzV/jUTVoUGzRnSl8V6ddUfzgtJtbk0jpetX+bAy4zd16AO7yEtMxmQXn
         YHYbyjAUG36ugl3pKmi19GXQn3DDDmy/UzVemthRhcl2Ci8C6qgi+bRYtW3CQtvKFBZU
         uBKl07UtSaef+Rgs6NcyJmy6vGlgECv1KXf8YrXtoGt0ffOkGQlEzkutw6g/MHZkr8kV
         H1xX6fTvk0iwmqpobNoP5aXX7RRLifJjNUSzfWSyjo2dAJhMwa7CSCWJm1CoZNwuE/C2
         iK8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmMGFjxV0Yx2lrtKwlu+DPUK6hdit61YZnlzlGQSukv0DMrvq4uYc3/CaQjqn1zUlftrHPcIkNgQ8i38U=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2WbHygx4Td/kr77S/QL3I1fKAykj3wLT7g5S/hQvMNBVj+drt
	gNYtVefLsv3F+9vT3j08ppdwM1oqcSMdsxxg1kU3dT9QhBMboLcgddzM
X-Gm-Gg: AYBFou0Y+4eIEQqGEnuMsWXF5Gsa1dcoUsAiKwtYQOAh8pUdOVktw/2lItWsYcrg+cj
	YVtJKJkp2zJXq/Ko0T0pD425fSZ9Ns/4A3PLVa/6CQLFVCAkc2B0lsPnc3DXdVAwoxMZ2aFetgD
	+AS3FINT9HZlzDeG0uxBcPFJGRSTDp8hIscYqlIDxQ8mr16IKKPRIT0oTMSjHUfmq4/d4v2OqCN
	+zH2Odhlq6O7/u/XrqDkr6oCsSBcSQ3HSIi0sMOhVuVUf5uHyoPipv6ujDbhPbK+M2VlPV4azxk
	MlZdMfh6qH1J5YIxM7hTkW6+z5ZSebqsnrlNLhVJuVJiO6sbFnwUBAxkjsvL1TqfObU7MK4dt0+
	2AqkHZ1RW14Gy/uDJjYVoHgwsNEKdrHHPN93P6vqXU7m3snBPotIdKPsq3e8b7xK8O3KxJFc8l2
	i/n7B4siUe/eg13yp6sjy08qsQOx9VlSQqWBP45vAZLK3WsoGtOqTYwA9wvFTVb2l4
X-Received: by 2002:a17:90b:3c4f:b0:3a4:ab9f:c15 with SMTP id 98e67ed59e1d1-3a6cec6dbabmr1027973a91.32.1790904870899;
        Thu, 01 Oct 2026 18:34:30 -0700 (PDT)
Received: from [28.0.0.1] ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6e7401d04sm290543a91.14.2026.10.01.18.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 18:34:28 -0700 (PDT)
Message-ID: <3a035210-a620-465c-9f87-b5c5b45fdc17@gmail.com>
Date: Fri, 2 Oct 2026 09:34:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
To: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com, hansg@kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 W_Armin@gmx.de, ilya.gladyshev@linux.dev, foxido@foxido.dev, kento@kekto.ru,
 ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com,
 btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com,
 i@rsplwe.com, bozhenpeng93@gmail.com, martiya.ar@gmail.com,
 aleksejirlik@gmail.com
References: <20260929134503.17249-1-qby140326@gmail.com>
 <20260929134503.17249-6-qby140326@gmail.com>
 <20260930015058.3076905-1-uselessfire@gmail.com>
 <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
 <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/26 08:51, Miloš Vlku wrote:
> Follow-up to my own mail: I have now run those values rather than only
> reading them out of the tables.
>
> Built current pdx86 for-next with Chris's GET-only function-id change
> and balanced 1 / quiet 2 / performance 3 / full speed 4 on top. All four
> profiles apply and read back correctly, checked against the EC register
> each time:
>
>    low-power            -> QFAN 2
>    balanced             -> QFAN 1
>    balanced-performance -> QFAN 3
>    performance          -> QFAN 4
>
> All three power-profiles-daemon profiles work as well, so the desktop
> slider works end to end on TM2307.
>
> Two things fell out of that:
>
> - Without Chris's change every one of those writes fails with -ENOMSG
>    here, exactly as you described, and with it all of them succeed. So
>    that is a Tested-by from a second board if it is useful.
>
> - No machine-specific capability check is needed on this one.
>    WMI_FN_SYSTEM_AC_TYPE is unimplemented, Armin's work reports that as
>    -EOPNOTSUPP, and bitland_pp_check_capability() already treats that as
>    "skip the check". The stock one is fine as-is.
>
> So the TM2307 entry comes out as just a mode map plus a DMI match.
> Attached, against the v9 ops table and checkpatch-clean, in case it is
> useful to have in hand while you write the TM2309 one. I will resend it
> properly once that series settles -- posting it now mainly so the values
> sit somewhere concrete, and Mingyou can fold it straight into v10 if
> that is easier than carrying a separate patch.
>
> Thanks,
> Milos

Hello,

`git am` failed to apply it with a "corrupt patch" error.

Could you please regenerate it cleanly with `git format-patch` and send 
a v2 via `git send-email`? (don't edit the patch content manually)

Since the code logic itself doesn't need to change, feel free to include 
my Reviewed-by tag below in your v2 commit message:

Reviewed-by: Mingyou Chen <qby140326@gmail.com>

