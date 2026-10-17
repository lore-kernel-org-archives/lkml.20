Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF5C350A0F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792280310; cv=none; b=nQqMkzqkJUKEo55Ytmvbhat1WQk/smZj0F9EeKhzhnQLVdPn65nJwOZQJ410Zt2JA7Ue3KnUx6tJzKMlar26yQUMnWlD59AIIB3n/fO9/y5WgOum9dLd4XfGQrylgNiIS2Bmox75A0SS7tpi/epFtCOST94uIKuggjcKmVjns5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792280310; c=relaxed/simple;
	bh=JVTsBkfayrBjFco43pfXEbz4LFu5+JkfJk9QW5Tz/vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KExnQDilUXnW0wZ/we+uG1rXmbB0RudMGuQs2qOxPj+pqne/FpaqXdpy/WoVC9hwzjK3dJn6jR5E1x7Famg++ErgOS5IMn8dLZktGm4CkIg5PfRt2OG2LBglo8JqFOmzSFmAAxga0BPN5VlnYzJmBBEurINjxb+EWOISDJe+1lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=ZztgYOtE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZztgYOtE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so716435e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792280307; x=1792885107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wiwPMxdwxY4yPc3TWeM+k3SIkOD63HQmDE61mV/SD6Q=;
        b=ZztgYOtEfGLzfuT08RAgWIVm4ScmfMiNx9n2Vu5hDzX3/4sxQimTmCtlT/rXmJag+q
         bbvn0TLat+ML5LSBmi9tD/RNMV+LBtcq73KV4lZsXwGgEs2dX1GWjUi7T0WcfjaDY724
         8RZjswT9di3fo5Ghh/ipv71gWcP06DxYzezH9PlKBwZXi/IlqBULaMGT/EKwuVjQCYLE
         AOfzka34wMeTuCbcIQlZ+PY6DAHcwsCEMGpTg2mJjbMfi+8Tz8Mp2/UNli8MdIruIE1X
         +/aJp1ev8UPY+OL1R7HI/Asmi2HAEO7nqaP2sXCPMpvBc7h7YVNKxkz1peUCLDIv2gJc
         sSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792280307; x=1792885107;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wiwPMxdwxY4yPc3TWeM+k3SIkOD63HQmDE61mV/SD6Q=;
        b=ZMMXQI89q80rv0S432MadrrTfLT/i9i/r8tLafk+5GxOZizEjrlY68KTMGG6OfNPWS
         I84FEfeMdE03QULoKzoVo90LG7wJEEdbCGxLpYrO+y2zTNXtaLiXV09s28pXIToPSYv3
         opEdosTigGYV6TPTCxINrYDo7R4ODtRJAs6VV2Ukec0pMGNg/TM/maPgMVbuY4hvzOXN
         VdO/dpVYhOcCx3rEfg05tzlxndWXHXNzvNiOEtsqyW5sEuYSoAHEMS7OF8oLwDD8sOHX
         DrqjiXBv0LQc1w2D0dn+4Iq/9YZ5x47SZRqgqe7xJ1GUap8up5xIoo+Sa0gyM8C+Djlw
         Pd9A==
X-Forwarded-Encrypted: i=1; AKwUvByDPdBDQBAV8085YeLcunamNMftYeXarQgWc58M0eOV8pWu2KKRs5ykFyC7cybGaVmlCTYPg08twd/Is4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFF1yotzM2cFGLEynb/gOt+MuQwv2+rjOXH9Y+uCa8ubDt3XIX
	w5XUsuxIj69qPQaIwKC4Vp9JQ1bhUk2tOhbOA8RxMfW4wQ/XvtA4iCg=
X-Gm-Gg: AYBFou2+TKJmdVM2gFQhyOWQL3xXHt5oxAV7rEPh3IRmT009kr2FG3jCvwJB9Ipqn0I
	3fWnCFfGWhX5r67kEWbmKc50I8cwC4OMM7mdq5YWWLraAnfJEETCGPDqB9lx9eVrWNApk/NUkJL
	8u2Iw/Yjt7GOlgaAPSyBZcee2pYGGhHWC/1hdhSGud3OhOBYOW9LSzqog+6d4sjUXhSTLUVSrR9
	GtrjiyoyChdGkgevv/SS4X8BmJJoOvR0/2UPot1218fBXEEwKvuF523vDgG+6JsYfrxnWLGz9Vx
	+tfwKa/NTJ+5dDcpGmxJ7wl/PGOx0FwZSkaphlK0fy3/8vAwLVgBQl8PQjyfkr/7SCFfoaEcM9n
	BuEi97897erEhb/6PnPFMELGH+d+dQ2kjKjJeATyZXBhFJkCoY8ppfuwFOEl4LsLFvFqLZ2ofJL
	Dezx8RNhO5iJkYPThcfTGbbgV1umMtYQMe8N/HjB6oSQNFUXTsYiUGtxwI66l+uAksGb4ZrusSi
	kGoekY+pBJtPrdO40yke0TpaATzDrgmrrw0NlJLEMZTWZel
X-Received: by 2002:a05:600c:3488:b0:4a1:dbb7:bb44 with SMTP id 5b1f17b1804b1-4a1dbb7bc9emr40963825e9.5.1792280307200;
        Sat, 17 Oct 2026 16:38:27 -0700 (PDT)
Received: from [192.168.1.3] (p5b057d26.dip0.t-ipconnect.de. [91.5.125.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce02d619sm106283035e9.3.2026.10.17.16.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 16:38:26 -0700 (PDT)
Message-ID: <b6a433cc-b00c-4ecd-8549-c382b790ac15@googlemail.com>
Date: Sun, 18 Oct 2026 01:38:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 000/869] 6.12.114-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261017160036.979869304@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261017160036.979869304@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.10.2026 um 17:47 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.114 release.
> There are 869 patches in this series, all will be posted as a response
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
