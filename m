Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DE4ABBC7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719409; cv=pass; b=D2pVwtppyRcqOKkfAZHZPIQJAkRhy+7IgNkmLeHNO43Auvgi0A+C2UCj76qwUBrnNn5beGUpsKTtxboLKifzRTa1UpKCZzd146vCax97hrJZdIUXexlo7Pf5G7xLbqQ/TZ31+nPfb+FEBImUWXp0Pij0kyCa14mNOHnJ0mE81ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719409; c=relaxed/simple;
	bh=TNDOvls3vgiRBkknnAdh3h0dArjFRoCxPy7si575vY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxfbIKNoNMB2qqi5KbgzpgouzFUPCeWrm8dCGr1aYqTQ16+Cdg9io47WVYsX/FH7CbLnMPPfVFwkWLmulM/tGXvs9e3xmKVPSe4R55aBKHsnNv4Ap2O9UPrnh8up3BlTsnGqDs15yhp1lCy1YNKhQwe+PJ9DByvntqXwpmPAP74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rajagiritech.edu.in; spf=none smtp.mailfrom=rajagiritech.edu.in; dkim=pass (2048-bit key) header.d=rajagiritech-edu-in.20251104.gappssmtp.com header.i=@rajagiritech-edu-in.20251104.gappssmtp.com header.b=Rw1T6qIP; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rajagiritech.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rajagiritech.edu.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rajagiritech-edu-in.20251104.gappssmtp.com header.i=@rajagiritech-edu-in.20251104.gappssmtp.com header.b="Rw1T6qIP"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60b9so30940166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789719400; cv=none;
        d=google.com; s=arc-20260327;
        b=tBSYYq09k0RfspX1GJUCUyZL+mD68wxTBJUpjZtS1j53peURUM5hbmMoS0ED6ZSxo5
         jlMkEx3yENNvtoXOttSz7IolyT6G+r1hfRPOJGaimbapLItUO9PuKTcOzzW7cABa1g2O
         qx+jqfsBRvHbD0uU7tp90/kknxpTjJglr6kpJxnUIxe/C1tqnF+ht3u/qrgOOY0Iw8KQ
         QJbNgIN2tAC7g+PHDRz79iVPHvJ4eZ5yzUgg6+EWoOhVQYYqnDFJL+UfJavf3i1wxk+T
         Has2JePDh/PLOSaraa13zHwzCPDLgw6Afsfwocd38N95Jo3Eyc5QCp09Ef4LPEFy8Dd6
         8Uxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QK2RniNBtO2vqqVkyo1sh54+0yZPIP2ozVhRKL6eWs4=;
        fh=l6l3I3x7YzD8RseTNpZViRjKIRKwb2BuYje859jH6Y4=;
        b=lPtPvA5sTi+/oko0hPkpWazdoB88jOuk2NPt+CnIprf60pfACbsqqQXeZ2gTiTJ55y
         P2/HnAgDakRBdfbIWnukWiwBSWDSX4SCLXH/9+OgVhGIDYrciXvE7JW0ebLlQu6Dhhoj
         OAvSm7+BNf+R/5B6uRJagd+1zMfoEdr3xh7+n/+3NfgoyGqbiSrzcfA58reIgg0HGBDX
         yw4pD4BzyPkpsQRNzvX8Wx1rW7Kvo4wuHmq2c0lMccRZqecGsPfdQlxa+DTVwkXnGp7B
         qOGYxV+iT5qsjpmrwJwmHjJhVJWR7WmL50LDiGK85rm359luwEAQEWxEbmXlsEOfVIU0
         jZ6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rajagiritech-edu-in.20251104.gappssmtp.com; s=20251104; t=1789719400; x=1790324200; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QK2RniNBtO2vqqVkyo1sh54+0yZPIP2ozVhRKL6eWs4=;
        b=Rw1T6qIPJhS0Y7NzlwAziQAIIWr+L9Qw5zsucyBvCw6KEbxT8eviOb10WwWh0PGbYK
         2kGm6bq2T8MNlhhtsjy8KC+6eZsYc6P0qSzzpPov0R++Dj95GURZMnSCeM4fJNxR6ygm
         4ZjlT4U0XBZFJsSjwJoJsdk0sHpYjOkG+8Z/Su5SB4cbcyAR0K4OhsbAnIAWvnPMuaH2
         J5EGRlg4OtV1ywwb46C3aEevUUj9ERa3BlkMMv7VuKArc+0kyeCJdWHLM2V4bc4H2gbh
         ZefNzmfi3sN0KxCGJ6UlTy84BdwcqdfaMUAzIM/ACSYaN785bea5IJwFGysowpPj1z9C
         ownA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719400; x=1790324200;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QK2RniNBtO2vqqVkyo1sh54+0yZPIP2ozVhRKL6eWs4=;
        b=s1NI03njBHNTtUDR+OQbs43icuZA+j86BEc0G3V/BJ3f9uGHMQ+u6tblbBTkLdbB7V
         joEYIDyqjNm163S6XK7E51aiCFlTAr+hPNW9UZJghosVSHxcV2a4aOuNhyT+vz8wSBp/
         h5BwBcHrYdBXcZoB3i7X4iYJMSu/b0iyL0QKh0YGTXacMrPFF8KUs5BejwXaRWn5XYEz
         1srF+7Iewb9RvQ/QKeXnW9iWPKgrYTmL+YlD0Ubh1Sifr4JN5rdWvHmfS9Q4D5saDcnG
         0TmYC3FKq1A2mR42nfVSQQYNrzitHG8OFGRemT/Pe9F1R1lA6AZrdP+pmrAu+7BC87Ht
         y4jw==
X-Forwarded-Encrypted: i=1; AKwUvBxf55ArMPQHVl3IwqGAJQvuLuP7aouIN9ArpsStHWPfHW9/lIhLZyk5kpBKmf0QodzRXCdEBXWovDi+Vgo=@vger.kernel.org
X-Gm-Message-State: AFuF++la6FN528nlUKlTccBknmwvT5TeEjyYrsgfKQG0xuYE2kILjo+f
	2tiXrO1FmvaDwIh+mAb1gHCWzJtzDx0zzJsCSeFtasxbpfMnUdurBMqSH5DKy9TXgDLfaFPzVCE
	5Zx//J1zBn8eTi5eOVbOpcQ+5+ESEObVg3yHM7uzSLw==
X-Gm-Gg: AYBFou3JrDXCxtD7S3JiDx9rFYsAI9VMgYMi/JUCKs+HDGhtHI8SYFxK0l1RqY6sVdP
	xJa7uNd28op3KVu+YaXGVuETahwggYHDIVJOLoPYu0T9Xg7faP1qW2DJu6xmaQVX3UV/ewBfIKm
	IGJ4dvuMiUgnrR5Ua9AGHB9FScW8I2vRq0YgEObUznHyEkPaBDh35t3BhoMHoTmVpRGrmmIQwUO
	3b1DwRnZJpNdZYStJLBan+Tp78dxFfZI8gw9RF3Hv15zdqfGuk3+whyEB+zcpMhL6VlYuVWEYGh
	BcuBZHv7tkCaqiLG+bY9/6Gm8ppmpm2/OzSu4GzRnO6DQhvFWQCpCwqKk1/HKYWNweKHIZvoYdB
	f9xAngillXJ8NxMU/P8zY+jtrRnWD3/buJIXvPMRIrYJqWQNQ+zsa6vA0oleH4bTHckm5xz3yga
	+XEesKh2EmYyi+Yc51xDoE1w==
X-Received: by 2002:a17:907:1c94:b0:c25:f7db:4be9 with SMTP id
 a640c23a62f3a-c2a16555e01mr184141366b.15.1789719399510; Fri, 18 Sep 2026
 01:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917151350.597953846@linuxfoundation.org>
In-Reply-To: <20260917151350.597953846@linuxfoundation.org>
From: Jeffrin Thalakkottoor <jeffrin@rajagiritech.edu.in>
Date: Fri, 18 Sep 2026 13:46:01 +0530
X-Gm-Features: AcwNN1XZmitjPyByb4HhRsoztvZ-v5CbuVYZ54pDo3GeAR4HAdHrMWruHo8HW08
Message-ID: <CAG=yYwmjqJ6jBZb0UJPbcxTyv=eFs_GmNmu0sNR9Vbm0FAx=qg@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/733] 7.2.7-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com
Content-Type: text/plain; charset="UTF-8"

  hello,

 Compiled and booted  7.2.7-rc1 (using qemu-system-x86_64)

No new typical dmesg regressions .

Tested-by: Jeffrin Jose T <jeffrin@rajagiritech.edu.in>


--
software engineer
rajagiri school of engineering and technology
