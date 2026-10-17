Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C926F31B833
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792271545; cv=none; b=JWYl9PR2PdpquQRDnC5l8cepPVfHMFLzXFA7H8+FSAE5f+qSWB54YCsdgfRvedkC1y0aqE3zfOJ+BAEXjGSqfBhoZh++W5lrJxwDMl7JD+XQzEPBjqK5jE99ZawgRg5qbjO/c77MNk6zOMFfInQDQGADFBLTV5gx03wMqjLj8e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792271545; c=relaxed/simple;
	bh=1a6d4YWLN/lAapj6huADHnUJGpf/vQt1DOaw2a5vl+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oq+maEbqoHHRke2eXj0VQdnwPOvtDXIFMB+JcCttpEI+zahQhxbhxfouArY7SnDtaAEwpKURu1xGFdFf6pffQA07uOIG+kHTwUw7hNS0FQDeSnLhIBV3jsSxM9fqs2PO4rsUmifPrCDabDX8wykCVIK3MEQjBnfi53BN4iSA3xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVADFAGH; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVADFAGH"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15354aa70e8so127854c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792271544; x=1792876344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joO8dipaKt5pd8TYNmoROqoyiP5BZuk4U22kJRWCaOk=;
        b=sVADFAGHoi+JQQ5l9tstwHW381DGjVBLUv2HpT/nhPwI1EHCMv5bR3cQeAznsvNRIL
         CPagtuAvu9vVIVDOTLHLjVhs08UJkPLO+kcBfufhGDp/1VK9lHmgHxL/TpijJ4STXfRH
         60ryyAiENs6k4vt16YOvVObm6M6kd11bZm+dAdnlxkRSHdLUD47ZuSDo/npbUOVWkMjK
         B1oM79bmyluMqTCdWJTDwgeRW7/qqW6iD6nsnix4YIwoIbgMIW7aVh8MFfiTU3yb1wd6
         ao5smBwZfNwFNZOwDrTgBVmrikZlu3yaG0kMXTKZY7IfcHZhPnA6iUBp9/Sx+vYMK+vT
         qTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792271544; x=1792876344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=joO8dipaKt5pd8TYNmoROqoyiP5BZuk4U22kJRWCaOk=;
        b=iBgpxEl4UitcLZmw6+OTYVF7zsN+548mP+EEmwgVStad8C1G1TZN190msSZgEe+aR2
         2rlylRLSDpwlMZ/6Y7Rdcv2r627GDRVc3grSzPNggW12DhuWQUZSlpkLiVTtNNndG6xa
         QC+xRew0BOnHh85LusijZDD7OTCS7hYUKuLyqaLiMEVv2VL4o4Yh/7hpJqXEFQEc4tfP
         im9nX7VAjjpqSMVvO1Akhee4YBApTk0OWef/K+tJ4qJmmu3fOBicoGLCgxIK5ghbh7Ae
         FPbuxuRElIG55Xti+gFUjNOCA2DjX5CO45LO63OEniLExmJ+PBjkpVLi7GE67EJNjwvp
         wutA==
X-Forwarded-Encrypted: i=1; AKwUvBwsBVwn4phtl2rLJdk8h850k0q1yhvt82PRpoJphI05yinki/+guGJ6z7xo81CqLU+ASL/vHfKNbD3vYY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu8tL5AS75JDMx1YRJMHZSuN71RqLZeE84CODFi6zZRlCL4TMA
	8nRcYY+7cNyr7hDuNnk9JRhobuiXLFRhG7RVowKpy2SW29+c0/IBbTU=
X-Gm-Gg: AYBFou3k5Lf6objaUgyxV61fa/mrXoV4osyWnmWVBmf7QD6ptNoTskPByTH02YpsMAg
	hx1w+ZAtS80Z13D7XOmw4HlETPH6BC+OFBuJbeWvzP/By8CTvRoPde5TqAAr8stpkV1UQ2xKXUd
	oAM9d7Y2MLATrAAYbNI5inYbgUrCEW3ADwgEs4RLse3Vs8+amexxBuV/slFMY72YWoutX43MS1r
	N35h6fXD6K3pxmzUuclMKf0tB2CdBKu1Kjt727HmfSFM0k0sf1R77s7QJ5bjae//nyH8fjiUb7W
	yPTy5haOUdZorztsTYoImR9I6x/7H8bQAUHvzbV+ezq4jNEJ+4N4eT5Qo9IAjyvX8bRRIsn6Dfr
	roV159w851o6mjgWXlIFdjB5CFl65GFq0Px6ZXw9RTPE22jOGfHLgVIxTh3JRh0qXcsRgtjIvD4
	xADRypB3ogx7OtV1NcoiLxs0tbXqp2EP8TtbCO0ln+pWnuZBAjsjt9EtkuxhDo3kynDdBLZqrjP
	HpaR5InRXNs3A4Rwlg4kR87YDUps1r5f1ZJR399/i4=
X-Received: by 2002:a05:7022:f50b:b0:17c:a0c5:8c9a with SMTP id a92af1059eb24-18514914deamr5675222c88.42.1792271543515;
        Sat, 17 Oct 2026 14:12:23 -0700 (PDT)
Received: from [192.168.1.45] ([45.127.46.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm9294998c88.19.2026.10.17.14.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 14:12:22 -0700 (PDT)
Message-ID: <5d5812be-430d-47f3-9e08-287300284c62@gmail.com>
Date: Sun, 18 Oct 2026 02:42:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: ccs811: Deassert WAKE GPIO on error paths
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 Joshua Crofts <joshua.crofts1@gmail.com>
References: <20261015123023.3417-1-nikhilgtr@gmail.com>
 <20261017214659.5bbebc38@jic23-hlaptop>
Content-Language: en-US
From: Nikhil Gautam <nikhilgtr@gmail.com>
In-Reply-To: <20261017214659.5bbebc38@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jonathan,

Thanks for the review.

>> Ensure the WAKE GPIO is deasserted when status polling fails or
>> the data-ready timeout expires. Early returns could leave WAKE asserted,
>> preventing the sensor from returning to its low-power state and
>> potentially disrupting subsequent I2C transactions.
> I need more on this point to know whether we care if an error
> means we don't deassert the wake pin.
>
> Why would failing to go to sleep break future transactions?
> I'd kind of assume we'd awaken an already awake device (which sounds
> idempotent but maybe not?) and carry on from there?
>
> Jonathan

The relevant information is in the CCS811 datasheet (v1-06),
under “CCS811 – Pin Assignment” (page 4) and “Detailed Description” 
(page 7 onwards).

The datasheet specifies that nWAKE is active-low and should be asserted
before an I²C transaction and held low throughout it. It also describes
the sleep behavior: when nWAKE is deasserted, the device enters sleep
mode and ignores I²C requests. The timing specifications specify a 50 µs
wake-up time and a minimum 20 µs deassertion interval.

I agree that the datasheet does not explicitly state that leaving nWAKE
asserted after an error will cause subsequent transactions to fail.
My concern is primarily that an early return leaves the device awake
instead of restoring the intended low-power state.

I'll adjust the justification accordingly, rather than claiming that 
subsequent
transactions would necessarily be disrupted.

Thanks,
Nikhil
