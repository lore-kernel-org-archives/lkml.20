Received: from mail-wr2-f27.google.com (mail-wr2-f27.google.com [74.125.225.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E397081A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818423; cv=none; b=hci0F1FtCY1QMJkYYGpeNH9Xd6PiI79A8nwaXquhWdkzo/9V+WunL0twVfRb2QdmYnlL6AxExd5uBXmlucdvgzdNLYYfCk15ErikfWoXpJIpj8JfcuKU0+ZgETqpwNGH4lQw/EkdySQSd+wfIQzccGeOxmtS5TwI+CDbI+55PJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818423; c=relaxed/simple;
	bh=5/be281ZQD53yG9ylgU/R8rXnCdN/BCUnoqRoANjqpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxYbUCA6BHeBEC+5xgcY0acnV3aYMk8+sjaCEaJ7A1WbzZnMI/zYWFZTpFaCLx+RCDoZitTOxbknix2fgwqJLzDCOt9V7S0rSBrNTsn7r6vR8rhkWviHqbjtCRhGtWjet4vz5jhkKFb/0NoauMa1C3c/CoFptrct9jeo13kSaMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpzYHOte; arc=none smtp.client-ip=74.125.225.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpzYHOte"
Received: by mail-wr2-f27.google.com with SMTP id ffacd0b85a97d-4843796e373so853804f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789818420; x=1790423220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZZo/bO8FaeKZufIlk6aWKDCilZFtBs5IDhS4usmAPk=;
        b=IpzYHOteFMpyOiXD2+gCx/yTW4XFuMlQangK0MJTUFpF9jU1qdPCJezToDUZ3p2T7c
         kiwlgdQo+qfeMyhw/KkZgJpmPgySSL7gwg+W4EPVgcfqVV786ExhOzWtsESK6uUuKpvm
         KcnDb+zyMqFIeIaWIbUsXHYWa1IdYZhpojuFDxM3xs+gsgeW9QAjgreUfkitz4b6LdQ2
         q0ApfvC5lJwcsmw6PjjlNT3/nbnK+iVEMChIAukC5CgfgB4KSI3GiVpe6idE2lhbPhoZ
         xUzhVD63o1GGv8aE9CDv9LqcrHD2QXqfiRCssitck2G4OG64UIfddLUf297BPVTAinEN
         67PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789818420; x=1790423220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ZZo/bO8FaeKZufIlk6aWKDCilZFtBs5IDhS4usmAPk=;
        b=Hj2POkOZnFF8NTo7uqkNhSDocsFUKsgAkvqHmMkaFvqK8vlPvWYxebnP6wHeb9GjKr
         mHwl0wWb1VoUc1ARLenURfoUUj3vMg9OTkJeMSBMCKw6SulpRLHfp+UidchWwJb6EGlj
         fFWQmnbhxE6ekg1C3PoSY8DYggJETbimkwx+FUchqNdAxUgQo06NRQJ0XkL54dihlaKL
         kWK9iOAqaaRtiRwwjDVyV/fO8WWIqe1WHD7+ew5Z9qr2+V8IIls792mocV0XIIoIPdFC
         yPE4ec39mOgQjmNSPGXSKMsf1hVEGxKzvbkQkUrTxtCS82e3PqzAylIKUuFoMzADlZr/
         e7VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsUmijdg/YB2a6P3Y72sxDuSUTA8raGr9lSgVMYf2rq7SYwUhHaemUkuWiLMgiMWZeTu2iYrbK8wh9UQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++n/KnOCd0Ej9wQxfRV0LtvsW0Vx/vvVKdTF/tMo8b+nRBulHxFm
	+gQiu9RdtN1oaGtj9iLSqmq/QN3KYgtOqeXoqVnwvYfVDbEpyIbMlSYE
X-Gm-Gg: AYBFou14hp2P4Tkt1u2tUoOAPehcUyjhTuPvtCAY5bFzCStwshXlIXx5PStIZibH9+T
	VkX704aI4hfnrNTw5iQYx34OEAESnfzqyq0ibHAFWIEanLnlm13bwQ0FwyKsN3L/k5gRuGjcJiG
	X0eEnQamBMLg0Mrun3PpeZ+ilzuJyVboSFMLgUZE/c+8MZp/v4YYQhNsVQajjmRzbmqUSJzjvUb
	cm3jgox+SLqK9Icu/a48V0tIPbRZOA1LEMGs8qN0+uyWdqWY8/CN70sPQs3iT8sDIVZiZz8/IcW
	cGtCiipBFW1f+jEwW5I6TqEz9wbrJkvol0X+Rl+EW70luy0oJijb71a/ZnrG3ipe2i4ZJsIPKal
	LPnXFCLrL2c8ZLgd2oi14/A1iNagpousbIA82wD5psSTc1IL5o78IgYkSb9R6NVgtfDuS4Go+Jb
	DIyUs6Adv6NgxKRoLi/JhXhq0apHdhapDl49l+hVJ0n77uXk1h/H0i4AHnH6YQcHDjgfOHbagkr
	qVReKhBP4BboAAvRyeGzihzNw2A3janiZ4bx4qR57ZnuRG6geLs39EqztU9CGBNbCw=
X-Received: by 2002:adf:e00e:0:20b0:487:2329:9d0a with SMTP id ffacd0b85a97d-4872329a02bmr2732830f8f.33.1789818420344;
        Sat, 19 Sep 2026 04:47:00 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460898sm6168114f8f.9.2026.09.19.04.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 04:46:59 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <4d1eee3a-a5f9-467e-880e-4f2815851b09@gmail.com>
Date: Sat, 19 Sep 2026 12:46:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Peter Korsgaard <jacmet@uclibc.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9ceb2ab6-f532-49a2-b30b-ecdb4eb4b7b0@gmail.com>
 <20260918213430.3-1-tulnov.dl@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260918213430.3-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/26 22:34, Dmitrii Tulnov wrote:
> randconfig checks the numeric range of each probability but does not
> validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
> accepted as 50:0:0: the '%' is parsed repeatedly as zero. For the
> documented value 50, tristate y/m/n probabilities are 25%/25%/50%.
> With 50%, both y/m probabilities silently become zero, reducing the
> coverage of random configuration builds. Empty fields and extra fields
> are also accepted.
> 
> Warn when the value does not follow the documented decimal format. For
> malformed inputs whose parsed probabilities are in range, preserve the
> existing interpretation unless KCONFIG_WERROR is set. In that case, exit
> with an error before writing the configuration. Leading whitespace and
> signs are accepted by strtol(), but also trigger the warning because they
> are outside the documented format.
> 
> Keep the strtol() result as long until the range check. This rejects
> out-of-range values that narrowing to int previously made valid, such as
> 4294967296 becoming zero on a 64-bit host, regardless of KCONFIG_WERROR.
> 
> Add regression tests for one warning per malformed input, preserved
> configurations, KCONFIG_WERROR, out-of-range values, the supported
> probability formats, and the documented empty-value default.
> 
> Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
> Assisted-by: LLM
> Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
Tested-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Julian Braha <julianbraha@gmail.com>
