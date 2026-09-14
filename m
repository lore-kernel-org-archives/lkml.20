Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A633A1CEA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419552; cv=pass; b=Nk7fWgnvAlKDI2NxPBcuVW7Ld39YYs7yuJIW++4HqEdc4SGZ8P3PBHEDmsHX6u+2r72wREfa29k+WQcYtSg1Q7G+4LjzcR9iqVoqGqotT/A/5myZfmaLCRXahvXwzc0OL5qkC5A2Oabr5jQ9H13SIx9w3ZJX8Q4p2aPOu7CORSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419552; c=relaxed/simple;
	bh=zXHIkXlSRZsfmNsjhNyw93di5/lnalEzLNTnyiY0Yks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eu2b/tmLdVqgQ1G6ZHIeY6lBQnWRyNSvqfcu2Fy+WNQEgT0LYh28DkSeM7BaQj0MNgRmlhQ2kH9oaxIexr8va0RJ8qw/ykWlGt+EEotO9gXcvTTAIKbbX7NbofQ19KTjHnUWJdKjJJulJ27t7NVTdtd6o49BePDr1Plp0j7Z8ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g3XrSp+8; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g3XrSp+8"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aae3149so2002954d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789419550; cv=none;
        d=google.com; s=arc-20260327;
        b=BCVN8AOxjtyeHpnvNAPhzEQowU6Gb1Bpc8IHRhl8b7U/hbR/L5CBfTZT8bVrtbmfSg
         Ef9Q29OAY39C6OEgcjG1eI19FwSL+Vj19VNTNZy+fZK6cXFHWz4GBLr7FCdRRQzIM4a1
         a4euf+bgK/881SXJjxd7TEOw+zl5K7iSHY2PKS7zpyuDbqB5WrzHuy54A+R6xnyym3eP
         7Pw/0zyU4nJidIvloWu1Ga8GzepxZ8UtIIFODJylZLADSxlDZiUmR5Q7f6cWcqYE1e6y
         95qbj3h3DWR3IhLeSC/r5y7QdKVcoXaRWWR/zAU2CHVbQYqNF7AXJyFokuqmul0hSYdB
         HOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zXHIkXlSRZsfmNsjhNyw93di5/lnalEzLNTnyiY0Yks=;
        fh=rLu9GsszKBI6jrVHUhRa5MSnGhkVNjxMrbiX+djVaYo=;
        b=GdqrlhbGuigOPD4Eqm+CeRZYKDzsECp7VEXzqyhKIrJPKc68ggV9Wu8YH9MtUu40r0
         YJw6fHEWOP7gjoTMO5Xt8R4DwD2nqbRhSR9RIYCvx9PuQ7FUi6d9yaT6g5ADm63KgvAY
         L2dNHTeYR+KebTqMc27v4g8aKjYaklapbmOQtaGUkEOTjIFwBCRT+hjtQpWiercd9QEt
         W6pog3iggieZyz2mOZlGSrfG5RKh8Oxq4dAFH7IEqfKCpmoBXdpFh519VOT4rdPg98AG
         4WIY382gnEXZAZKl4u3+aXsCpagSCwch1vKMDQgV4BBYqyuqzajhbdWiB7W1NEiQZ0kw
         Kieg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789419550; x=1790024350; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXHIkXlSRZsfmNsjhNyw93di5/lnalEzLNTnyiY0Yks=;
        b=g3XrSp+8DSd77bP69afDy0iJxFL9G6zyuH3HfnTrOJDIIBei15UTajbQnqvl3AeBO/
         zQr6Z2KxpDek92UjKGTDOUNCX1jlhIPtYJDvxf3p85y3w/oP2eYMTt9YvyAyawmlHPBK
         1U8tQ02XNjtxd4c/EQZ4UFf9BF+/51bbHtiaDsWEKmVCUj7OQNDK1IPEJtaWdmgaXXYA
         ZH7Q6zoqyTqDIKiPrbO360GAIBhAxqkdc+DfIXFs7nmGhIaLfdKUWVo0XMreXigk3D79
         GBMRcIayRrmL/D3rSK2jBQIjR/J4JuqrqVOad8Tof467r9EWZ8lgPKMhig9heXI4cgQq
         AUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789419550; x=1790024350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zXHIkXlSRZsfmNsjhNyw93di5/lnalEzLNTnyiY0Yks=;
        b=0+R9UUaerHXlWh+XzmadRYAXiVw1O0ELInAjSZ7ZbnYO7b4lDb/UDKjMom11ehmEG6
         ZtPXX0D5qpwCDQGT4l4NjY30bVuPnSmVaAbEZBUkqujylrgleMq50Ydg3YKh915y7gpK
         Dt7U4DEd/1Baqya6ppOgPVd8it8aTF+61AaxVZirrMC6mUtlfp38LJoMA3uEX1e3wN4H
         oT3objEV9YMPck40cXRpIIdSJADTtEYdgwVR2cqwkVMyk0SOb5e2WVSgnpowmvEd77LU
         wzjT6vQKuCHoFR8Bjv6FhaYRJDf8jFnqUOs+LyX2S+fta3FTDbUt6B6UInlt7LdXqJxo
         jHeg==
X-Forwarded-Encrypted: i=1; AKwUvByi8GxUrANwieU29CSojdUAnuywqYHKqNUK/hg10NBgYNNRGgvk90hHA197ezRLwEtjxPsG/yUDhVufGY4=@vger.kernel.org
X-Gm-Message-State: AFuF++lDqw3GgzjYdzjcCAN5TBQp4LZYlvDqBtmNqfKto4JVvyx6Zdsl
	y70AAs+JEyBATa7dNBthiFgkO4nm53pPD3snICgPvpnnxWB71Ej++z2fy501MQ3I27DZUUbIOUc
	NIQxpdoNzwu6O4nhMtwOViRjk4qp7uz52cE1INe8SsLg2p7uNsqsvEeKKPSU=
X-Gm-Gg: AYBFou2ZJZoGVPszXiKB1Kgr40IdNy0J8QlYTxGeyNOHNXmy7TCGHzWtPbHPsoimtvQ
	DARD3cMGNDMKKUlNPs3Ly3/0J4hxiSo6owRMy0fFp+w4s3CuBaqrNKt/mRkASWEzCqNGdwJgTBo
	reAyavAwZG/JpQtp6FnKCf4URl1MKhQU7bc24dC9Y9sXPt2YBaVElJ8TFryXAq3nuvIZ+V1vesf
	x+Vz30PUt2FmiYsP9xspU1OG2NwM8ry+P1LxtVgk5ns7wDqArIykDpRVvxF0YI7/mQQ55ZRVm4z
	fVpsYNa6Y0pHWL/gX9HzQbPDqv2vpUP8J5wzRYP9XI4a9VbkaXg2Ae33xepxY0pzfhmQMc8E9CB
	pmKk9Mhww/Q==
X-Received: by 2002:a05:690e:4106:b0:66f:c206:ce5c with SMTP id
 956f58d0204a3-6714e065236mr1515465d50.25.1789419549739; Mon, 14 Sep 2026
 13:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com> <aqUzq9MIS8hBFDtD@ninjato>
In-Reply-To: <aqUzq9MIS8hBFDtD@ninjato>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Mon, 14 Sep 2026 13:58:58 -0700
X-Gm-Features: AcwNN1XF8K5ytkkhsSc9MQM1N7ybF0zeDQt7mDN5z5dkxKGPpd2y9acjgqdJRV0
Message-ID: <CAHreonGf47y5_fjSWeXOZ4XswQwyfozTCww8=cKUrJoB_Jf0XQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] i3c: Introduce i3c device userspace interface
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> An idea: because this project only contains 'i3ctransfer' at the moment,
> it probably makes sense to provide this tool with the Kernel, placed in
> the 'tools' directory? We can seperate it again if it becomes too big or
> we want its own community there. But for now, I think it could make
> sense unless you want to maintain this repo as well?

I think this is pretty reasonable. I can incorporate i3c-tools in a
new revision of this changeset as well (Given all the input, a new
revision will surely be coming).

Thanks,
Sam
