Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9674B515E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825918; cv=none; b=YHmtXr/+TH3SOSCTEy1iBXeMB375BjlV21QaiTJ3jKCRYs6+CJRD8Hn2QjNmdEwGAj1TJ2It7aaaCF+Puv6PTpi/k+ejuE8qV/WPCHg5vhzCqJ7wxfaZbAT8mcTkfcUHgBcFzLhxW8BJ89JbMTkKeBo2SLfg3iqQx919aorKXd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825918; c=relaxed/simple;
	bh=CvlM6xA8VlWc6Ji76HuweckfK55eNfrwYKeQJ9w1dEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCR8TjEmqkJCsVtSRH9wtX91GvYJPPgnujibFK+NAmehPfZyrxhqMwRp4OToIsFvAZv/6+FJD2PbGuHI9K7gBhm4LevZ+xawg+7CpnrX2lqV0Y/nms0LN17acc1I3Kjh4gi97WxFoqaa16lhKgbjU4q5Anwy2DkNDoL4ZsCgw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DlDoZ3Sw; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DlDoZ3Sw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3156e7705cso343251066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791825914; x=1792430714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HD5aw7UMIRYNc89NKfyFFJghCkhEvyc5vpGgRAhz0B4=;
        b=DlDoZ3SwLTquroWAYWUqp4GvvSst/iaBa1L08laniLgN+1GnGXFNfjFAat9+t3+kuj
         sPV7SDHIWOR3E9RI16gey+wyUPmY7MtwDdeddY7Qye295SW585lgSZUgHEWsbBr4WvN2
         7u1aO5Q2xfciuqwSbCVzt/0kpqQ1SjqoSih+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825914; x=1792430714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HD5aw7UMIRYNc89NKfyFFJghCkhEvyc5vpGgRAhz0B4=;
        b=XJYDkjpCGwynFoGg1vfMfThuzMkFrxwQX2g893/KVR0BYdOTUIUrBQLA9WY++XT8/5
         x7O5ktJunsD509LUEbIHYHYa7cO78vsgwu1uhXvHPT6ycFMxhjmijccDNqeSszD4AcbE
         u+SYGWgH0F/UJjh/n1YE0A3enxAEYKWsui0OxPWA/3ZY2kgueQoQEzLVPx3ZjJCwZSxI
         OZG3cgT9WTDHw1YvydfTFDVyYyfrVMjPfaXxihyCjN3JksJpl63V65I1HZo3lVEMkbZ1
         TjVOA7OcIyHh4+Emak/inUfHTPzUQvVpfR/K5Pbkr5lndcwMKxscqCidDz/GweNEuanJ
         SRAA==
X-Forwarded-Encrypted: i=1; AKwUvBzguihHPhZcpx0yusSKaio+6qgEb7PaGgG12I2mRW/839ybrpo9X8+SCUkMThUtRINOOn74G+6dpFvmUdM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAWCYILhykG5OVIgttokmbR3GLB6R1H4KsmWEprDaUlJiiVV/J
	MRJCWzqdWgV030fiQjnHKd/rU9z4H2kYcLwgaO4tTkPIzy1JKDN0ukB9IT84WYtUQEM3H8OMzTp
	F9GvvKUI=
X-Gm-Gg: AYBFou3aA3TgCdxxOVoos+t1pwOky2Gshj1xeYD8O9X4pbL9VPvmtKMyBtSZLnpQGmV
	6uvrIRIHjJFpv1L/M4wqWwscc33IWwjImgH5b7uP/oAz1JMZ9wwulL4iZxQ4DgKLkc8R8qvNW/9
	cHhybWffq4ELC042uDPBxgf6tK4Y0qTTO3SQ6B0HpQ0uYKDdI+VjfkRA1FdF7nQAFL2o//5vUn3
	ZcFT2q6YW+d0UQNwSza8DSsNfdBiyz2gjszqdfzkMR2cMwMQaeqg1veqzI2f8aNs8S3kWLIU+8O
	Z8/Aw6txyKsDrGhw2J8N+vor+L4Zxfrier9ASvg3bASmQxqPJLCW6/gHsrybdGIqwP8UEAcYg/n
	AmG65z5dwijvjc8GOVftzpgkySN8PZGb8Ety5Ac4vLLCXIOjRCSgMhHakmoL/1sawUsiWA4q5BT
	q+LwZU+5d9NbYrbRl2WXwyfxWoqE2ecEQmmQ69ctwK7N7biTk5Bn/rNqnEbmYzGDR2LxIxVggmE
	ceu0iryuFKMdrg19glVBNEYdrOr3mHTCOnS4Umq/kXw0eBX
X-Received: by 2002:a17:907:2d88:b0:c2e:4373:521 with SMTP id a640c23a62f3a-c31aa0d2286mr877053166b.46.1791825913928;
        Mon, 12 Oct 2026 10:25:13 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ad0ad1sm490386066b.77.2026.10.12.10.25.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:25:13 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c31a34de844so317065166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:25:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxok+m8J9lNRe6Pca07IXzE05YCVLAnMfhW1mHzyWEkiagPqFTtLOsSI6f8AQ+ieYoAfKovdqnYUZEGkYs=@vger.kernel.org
X-Received: by 2002:a17:907:c0d:b0:c2e:3ed7:7db4 with SMTP id
 a640c23a62f3a-c31aa00dc1bmr965271766b.23.1791825913111; Mon, 12 Oct 2026
 10:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
 <CAHk-=wiSL2hmOhLz6f_pY-SD+Q=2q+swkENsHhWvwtL8az1Wqw@mail.gmail.com>
 <asuOoUt8XcOJJmSE@laps> <CAHk-=wgAJjTXvGBehCycoObUb45sXdW_-WkLkcd0cZp+fonYHQ@mail.gmail.com>
 <3ca592b2-a411-4353-ae13-06e84021955b@sirena.org.uk>
In-Reply-To: <3ca592b2-a411-4353-ae13-06e84021955b@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Oct 2026 10:24:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wionXXuNeBs80ECLud+N0s3yi1tyFsvvtfqO1S+1KQLSw@mail.gmail.com>
X-Gm-Features: AclHuK_3WGeCYYaIzDjHhf1BqYJHFTxMhc8qHDSZ14y2g74T56ibvKD0pJMEe28
Message-ID: <CAHk-=wionXXuNeBs80ECLud+N0s3yi1tyFsvvtfqO1S+1KQLSw@mail.gmail.com>
Subject: Re: [GIT PULL] regulator fixes for v7.3-rc6
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 at 06:29, Mark Brown <broonie@kernel.org> wrote:
>
> Sorry, I was under the impression that the keyring you were using was
> tied in with the kernel.org keyring

It is. Not automatically - but when I see missing keys, the first
thing I do is check the kernel.org repo.

But your new key had not actually shown up there. I don't know what
the latency for it normally is, but I think it's all "entirely manual,
random when it gets updated".

Right now the last update to your key on kernel.org is from July, and
that looks like it was just an automated "update signatures" kind of
thing, not actual new key data.

           Linus
