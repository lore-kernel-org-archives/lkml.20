Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3957A2DA74C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706031; cv=pass; b=f4D8+8BPJ0l2qCOXxdRpEqJe6G+GraN0tcBOHW0S1fj1h06OQPTUim2YS3J9A6fcSVl5cUDV1zksJ7s8p6/Cuh51PiO7Lhp44K3T0irkmvGe1P62LQ26+xSAANulD7SNifQQKkiPvQENUgFB5+zMdXvyOlaGvanvgvAshHvmtrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706031; c=relaxed/simple;
	bh=DBqqHAGSczpthp7loMH7wLmtYZ/JVKvH0RGvHHoN8+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayOTSTyLbdFZdu9ba6xs65CTFmhNUEkC0sdbwGp6uCxpx9c9fvCHut0Mj4270Eyy1UQpsEvs69lcCm5TgJgujSrvUGNpBuI0qzE9Ux1aNPNmBM00FaQ+uYdmZWsNGfXxXc2pmvDzsnWZFQXBuN9zGKQE01/9ccI/tOJ5ihG9wQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rajagiritech.edu.in; spf=none smtp.mailfrom=rajagiritech.edu.in; dkim=pass (2048-bit key) header.d=rajagiritech-edu-in.20251104.gappssmtp.com header.i=@rajagiritech-edu-in.20251104.gappssmtp.com header.b=iIYTmwId; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rajagiritech.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rajagiritech.edu.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rajagiritech-edu-in.20251104.gappssmtp.com header.i=@rajagiritech-edu-in.20251104.gappssmtp.com header.b="iIYTmwId"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c207cb16cf5so398006966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788706028; cv=none;
        d=google.com; s=arc-20260327;
        b=dXy0DgVsQ1D7JZrPsi0dyDo+Pzcs6aL5+I4Nz31MpYW0yLqlQL4IEeK7Hbc2JYZ3/G
         r0fuUTZbAXZ5N/qwirMfQZREYVESLRSbj11oK6aXxcuairYV1s3X8fRE1AK4XTj2PRtY
         oVck/Y1zL3d1YixaTMJMqnmkBYA9a0hoDIDmkmF43m8MZaKkAkup1WQHHCiXEHSv8MJM
         aeFkpR76K0lbCfsckowkkfqkWUQmEYTd5UW/XiGIIS7HkzqzDpuDWg6VMfxxjkC4io+z
         QscziVS72V2JVQb0eP8YjR/LTgUwAz9Cl4udXptwUf+G+ruiV99E0UJ+VYqa8Zg1hZvh
         3MEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fMw2a7h4FJa1ynMxKC2OZdTyNmHlbWlyFXY/M2wRjrI=;
        fh=lT4WopW3wLwDX2PudQw+1unFOiuJubDuvViXkd78iag=;
        b=iM820UdR1iHYB+LC2Ug49qBuGkeyNNw80Xii2FFezveQ4wsA/gKNnUU6edHjFPIhwy
         IBrNxVLgPRgTVVQVUDef/D3IqyNiP195ECbAuNlh48VJTqJ2hRuKSKxQpYRaSxU3/dWS
         48GJUdIwbFlK/dvoiDF3SUZmoeLHKo3eeaHcGPjmt7IJqonRkCRXHAvIQ8etnfT8ODuy
         PVGxOUqJ+ugAlKPhzc7hRh2fTYCHkE1q20G3w/d0U+ESGQCNKqUFB3DzhjavFgGK8/74
         U6cbhEo3c2RgLz2DLCu9hDXp17aScxQoBP4GO+rUB31Zq6KQpUKE32v30SluCT1iCgAd
         CjEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rajagiritech-edu-in.20251104.gappssmtp.com; s=20251104; t=1788706028; x=1789310828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fMw2a7h4FJa1ynMxKC2OZdTyNmHlbWlyFXY/M2wRjrI=;
        b=iIYTmwIde1cba2Q//LXtNwLXZxx8YaZm68U3uba1OZGxN2H049jvAvTsUgHqU0sTbt
         oip36PBpzYwaIUTCHZmszroi1Iz1mgmixG55qM7ohXt51prO69INMyTb2nQNXhYD1K52
         SF3n5sy/UElYPhs7w1etiluG2Av1geQWrkniqNSQvqAMPAQabm3M13RYnuLx1NkKbnG8
         QWi8GNmGQANCFVcVmYzTpWaHA6OTCP7UI0fTr3PN8mNfDu0caZ455Dn1jAHIbY9jx57m
         Bb36zpXCBq8kzXlhaYxFfyRZj1Tv0fnYz+BIq+/XsKMsZocAeQvtfU06cZ8ortLrXeHM
         LLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788706028; x=1789310828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fMw2a7h4FJa1ynMxKC2OZdTyNmHlbWlyFXY/M2wRjrI=;
        b=glc6ZQ+8mxhVpvZ0v47MYYscEBRQfgyHFVXOosybPbhtUgvRbkELmiV5i4DObQv7hR
         gXZO8hCNkiZVyrTTUTKM8BamSDLmcAU1+gvcU1wfonKUXzj66BJfHFMDrPSRvUbWZzZa
         TEHeQBkp20AIM3rSWICyfQGe2BN2WU/osIyvEUqeiAajuuOW6aLbLVHXGe2PBUtewxPu
         nis3XDUCw/soiGBL8YeZIRoPEY7xPL93zXV8Be2qhJ8JGPTf9kMZc4wRs+wkTrtJR9B1
         9JIQqMmrdgPdjtZRQt0810dHGoIYi8oKDRKV3qruSkSzkuWMB32rPQji0lGLBsrOTfRj
         iEYA==
X-Forwarded-Encrypted: i=1; AKwUvBznprjpJfUx9WBOOia3wunkUTYj6MNzkLCvu2iklTp9EEtll+Uciw61SatoN56LPL/IPhjvF79eal68wvo=@vger.kernel.org
X-Gm-Message-State: AFuF++kGtcjpMEDTmC28cM8+idwtinh/5YbsYIurE/0xdqxpu6BjCD3A
	4C7ogZOODEifjMmBmhb8UoNOBfTZgkYy2nlbjHRQILM1UE0VCBQVq+uJWYIabKtgKpjtpW/ph3t
	luwBR7uJmEBUKhTsCIv8yLKCamFP9tUOYVEcAkF5T8g==
X-Gm-Gg: AYBFou2iJE5GpISmoBVjNzw+OhLetFymUeFnGAbW0kdpmKRV5Yf0j2DGV7VA8aOmFHt
	mJo3xtZA1xRSVMry5WcebbuIrNs8VuGrY1dMIGixljZVIk4lS4KkjZq80YWP2qpai48yoQPDK4I
	tcUTtjf1vpBUJWveVxUxhBDguypsoDj2zJfWf7CnkHLSlY76GfXU7Iozz8tStpMRXxvXH7hGT6H
	IFPYENrB1q/Z6nn1lvY4q5F69ADxrUsMcmRy44KeiypiI9e/MYwwF4qxsbmfukX0/FhWUFbGDt0
	shrAnR8Ql3SNB53qEsFfPv+cYvKZWcTa60yUxhxymKHo5y0YwfSHuczmibmHm98PXXJadSEO2NZ
	ZIz7LWaN/wMs4c3oFYLyYXVrnnUAeD1CJYNH93eQulba6Y9XMvgH6BY0lfY/Uv8TtPM14Q2IxoY
	Rhk4/N1RdWqYWa
X-Received: by 2002:a17:907:94c7:b0:c21:4393:c41a with SMTP id
 a640c23a62f3a-c260c9b556dmr671749166b.11.1788706028458; Sun, 06 Sep 2026
 07:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904045803.810145556@linuxfoundation.org>
In-Reply-To: <20260904045803.810145556@linuxfoundation.org>
From: Jeffrin Thalakkottoor <jeffrin@rajagiritech.edu.in>
Date: Sun, 6 Sep 2026 20:16:29 +0530
X-Gm-Features: AcwNN1V3DdZWjKZZI59W-lXeZk-QDF9YMp4RrSPhW5D9Euh9iW7L-2IdybpMmLo
Message-ID: <CAG=yYw=4c2nQXppcKfCv01om-zohPbZoafSfhFSCgOu4cxZuVA@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/713] 7.2.4-rc1 review
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

 Compiled and booted  7.2.4-rc1 (using qemu-system-x86_64)

No new typical dmesg regressions .

Tested-by: Jeffrin Jose T <jeffrin@rajagiritech.edu.in>


--
software engineer
rajagiri school of engineering and technology
