Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A05038F9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790638000; cv=none; b=aEtmTh4g4FCzsqsx+9n3Tvq12NkD5UUFtBZHm7VA0jU4f9Pws6xFqgUJ5VT1cl+xXpWA+5khrt5xVr777TMRxQuJeoRGQpYXXbQHiaF0FG2S6DJxPscOyM8fE4DQFjMTEiitco+hyfTNba20E3bIpPGp3KNzhpUsp9Ap+K7klcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790638000; c=relaxed/simple;
	bh=ImnVREnlEeFJR7B7Mod3ObpgEIQ6gLW4hGB0JEWUNA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aa2xuwIbRC3tv4YW/rEE2IFry3F+uagYRd4RHJd1Jqk2aRGhA2woAYWx0gXDOo65PEEl6I0odHiHMtTqLw7gGKMBbOwnYjFdRm/Lq++QNLbH6IGC9btCoBi2LkOpFPHgbcv/586GghrqXlvtPOVqbuAbUZ1SdWsU4UC68U42ggg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir+lmguz; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir+lmguz"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988b3922341so333135241.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790637997; x=1791242797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImnVREnlEeFJR7B7Mod3ObpgEIQ6gLW4hGB0JEWUNA0=;
        b=ir+lmguzHOe9JLjA1c0mRFFY2lST9x/SCwugLMptIJ8xoYqfRNqd8OWalaMtZc6nVP
         NeGocSbA8bsvif7kX4+RirSeUpz7i4nCRksdkFNdmvrlrIswS8FclATXr3VL1SQCAM2K
         YQNA7WuHiq8BMGNGKCDVO30NXD4lwHqJPoLHWbX4wyLtbmIT/ODG/Bl5T39B9DBccRPP
         QuLrYmWuciz1uk8px+OElDoJDGeCUmBo1Nnct2j1fnryEDIGvpvjRYWbXUpUaEXUTOEa
         HZ4v72RHQovqSVkBHqM5LbiRdvYzm1Y1fVS3JIQTs0gvFiUtqkLPscD7fqVyA3TClS57
         TWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637997; x=1791242797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImnVREnlEeFJR7B7Mod3ObpgEIQ6gLW4hGB0JEWUNA0=;
        b=INq7AWIbCRnIf/zwcHVAuDoXtX4W6xsFEERapDmBz5qa5zLCXCP1Rqfr8dDV8j6rOX
         O6datmgxYnBZS3Yur90yXp+BFaPjw4fyxwv6SRdK06OSBSR7px2tDnl6gxA7thDivBGa
         A/MBkIs+bIDw7XDgXl4NKWWnQ9nCvOeFmTze6nWQGz9mcHdPcGOORtuJL6hTbChHRlsP
         EgGY+gOb2SwSBZFw1KjRpSIH36QbJ4ld+qWojp02SQAOnbcwvV/m6reMv/CCawFjItou
         YkBf3CqfOPWvfoexi8jwUns0QgawSDKXQ+J/JMY6iPoKv5yk3iAsKskkU/P7Tvtlor+C
         sUdg==
X-Forwarded-Encrypted: i=1; AKwUvBw/OgJoiTSWdWRjQ2xnwK2HH8hgmES9FOC/ZsWZnVKrbX3g9dtD/bFHeIVsFJFnkMW6egBfSrP7lh+lXpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7iaMP96w4N9iejXzHHtyqwcxjMNPHvJJSKN8pkKA8CSY++6Da
	kyl7dE/1i5TLG3m27O3aotqdK5qN7HXO7s4uV9vaWjmX13/plCBMX3bj
X-Gm-Gg: AYBFou1Tjrt67dyptOd+oJMnnzFxE2inXA1kOWo4Y7X/c8CxsVnGOfSfd3E4jyMuhud
	vx0Bp4KgpDKVX5GvRUCceb6MEagttKfATj0XSwtPAgNIj2obSqmXegjvn8pZiGcJ7mv62zFTb77
	65/xXpCKgII2CCYQ/k5dVn1dk8We9JL0uPBlnvrXiBANPk0P8o0TXQYMtKJAFPH71aVGyrvGhwf
	HpRJqCNHvZWtkpCNK0HZY1/TpnXFr/jC5nnbYQhbsHRN1ZcNcslbvqn6QHnoj0eUxIOjIdOezAJ
	p7m6l7V6sAwkaqcbZ/ZZzYnjndryoeGHeU/P7cZr9EG2Og5r4/lmszJOqYflAOFZ7GCUxepVrvE
	aYhReuLa7vOi5v+2N7ZwkjxHYsuzbNo6WPohFU7W53rpaxWhgS46AEkcvg01eMMFlSlTRei+Q8v
	OD3Iut4okwXyqS3q0a/iEuxv9Du/XlicFjNyS69Hm4amsS+7BROiWY5O9Kqnn92kq3X2iM5vXcg
	1E0e6/ab5+OVnqp80/h2LPSW4Myr/QGPkTZqbEAiFJEjLN7tRXBcOazUu6XJLhR
X-Received: by 2002:a05:6102:f0c:b0:7a7:198a:c2c5 with SMTP id ada2fe7eead31-7b1d74b3a82mr2945563137.35.1790637997372;
        Mon, 28 Sep 2026 16:26:37 -0700 (PDT)
Received: from ?IPV6:2803:9800:a0a8:8014:618c:a663:bfd0:635e? ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b159055sm11172269137.3.2026.09.28.16.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 16:26:36 -0700 (PDT)
Message-ID: <595cf557-e386-4ca3-b8ea-2ce7fe160018@gmail.com>
Date: Mon, 28 Sep 2026 20:26:33 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
To: Chris Taraszka <chris@miget.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>,
 Mingyou Chen <qby140326@gmail.com>
References: <20260928153902.139956-1-chris@miget.com>
 <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com>
 <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com>
Content-Language: en-US
From: Matias Civadda <matias.civadda2342001@gmail.com>
In-Reply-To: <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chris,

No problem, your proposal works for me. Please CC me when you send
the series so I can test the shared changes and base my TM2107 v3
on your generic patch.

Thanks,
Matias

> Thanks, makes sense.
>
> Matias, one thing I ran into when trying your generic part on the
> Xiaomi Book Pro 14: its values are sparse (0x02, 0x03, 0x04, 0x09,
> 0x0a) and 0x02 and 0x0a both mean low-power. With a profile array
> indexed by the firmware value, the unused slots read back as
> PLATFORM_PROFILE_LOW_POWER (0), and the reverse lookup for low-power
> finds index 0, which this firmware ignores.
>
> So I'd suggest {value, profile} pairs for the shared part. I have that
> as a standalone patch on pdx86/for-next, with only the profile table
> in the quirk struct, so your response layout and AC check handling
> would go on top in your TM2107 patch. If that works for you I'll send
> it as v2 together with the Xiaomi entry, and you can base your v3 on
> it. If you'd rather own the generic patch, that's fine too, I'll
> rebase the Xiaomi part on yours.
>
