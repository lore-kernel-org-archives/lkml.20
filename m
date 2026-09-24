Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D116F49C4CA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262817; cv=none; b=aqsRkLC6WRmcOVrQZvoy3SBT46iQGh7sZZ2fSAKC9e9Ky6y42Ad4K6Oo68POCIQkWLT7wY8F6QuriR3m6R0/HvD0sUpBQj9U3z2+qyda/W9vw8HVACSmR0paiO/HBPst94Tua+sBl4lRqqlgLUc8N2ubfBL0vj282D2sMSVZp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262817; c=relaxed/simple;
	bh=vBZNIMcrFusc7oIU7IAyIFJoDxVBsHLcKvTckgQuMm8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ajmc2wCuTc6zVUAQc6hsHm/bR0Bs82lL3zlb39yC23SAfjyJ9ncGRTLRrmLNKwEpyg+HhtK78T00TpMNYW3Yw+3lwnsRYM0y3YnFghr6F11LfHaLX8a1ZcHtbMpqbZGK6PDsMndW2gHkxRI/T4XI/eM4lvKqw49O1gcewhdf40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI9alQAy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI9alQAy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso862658f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790262813; x=1790867613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DCS5WVHgbfqAUCE9Nm3HZBU7EdbFt5hV09Y99Fzxq1o=;
        b=AI9alQAyK+kqAKyuzWl2XYuEyR48+koGm5fiERRqM3/jIdzNDB2cHrM2WWQAkBpu+J
         BJ8JQQ/ReiBYAk+dnr2mcLG+2iMryyDrYzNXG+ep6EAUwyWsndDHRJHmU9kjsiLDZdOV
         KfoUwK5pAeKl2UtmRIOCDbdivc+WYGJC2e4i4lwW20w4bo82T5qhI62C064Q7hkFc/NW
         lQoxtwmBcejF4G2WUts+AHouAglI9YzC/Ws5KM9AFSepO6qFel9lhgjMVGMSKyPja6hG
         KNmv8ntq8Cfkyi0cpR6cksp9zbJDyjAlF69sn543Zu0dmBsmx78rNALpe1kfoCV48A6o
         x+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262813; x=1790867613;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCS5WVHgbfqAUCE9Nm3HZBU7EdbFt5hV09Y99Fzxq1o=;
        b=1JW0WLqzsmk32gsrpX0mfbRuB5isukMWHfIAp6/O6lBsVV1ei0byPmkmSQzYgQ0hIj
         MHpnTGo7mZ8JjLJrrnGKBbPWTlA38fW1jq0wQwfOzIyN+LgGoM/WztIjmhp+hDTVvCSK
         SoWiC7TEx4VD02KLgXULKYYE2+rw88FZPXoj7+cOOgXym2Li8TliHuYweuAPRBntExIr
         Vnixc4DjZIhouYaZ7BReEd1F34ieF/lXlQCKWGguWR8pb0HsE5Kjoc+vtKvFgH0YTSuO
         Tma3X0rCsLUXNBACew8q15eY2ZLjdEv+dbHSrJ00iyxloK0mUJ5ZLLxC/gnKqKTKPatr
         CPqg==
X-Forwarded-Encrypted: i=1; AKwUvBwCGJ9vN05aytG1ayRbyIrKZUpp7+Xo4dkg7bVTx4aMYBJdC0lT9UoSkoWTUrV4nPOiHQAO5t59eAGo/Zs=@vger.kernel.org
X-Gm-Message-State: AFuF++ny8bwMDZjD3/ebXUgngkc+BvXKEcp63QkIz+qjLbMslr1cbnUY
	MhPME2xI9vR5oyGyXtPlKz03KNSr+vMaeLXl1G/7QUX4O8jy3djx1nf4giXuOQ==
X-Gm-Gg: AYBFou0mU1U3y1mnLC2nz7MUxpdlvfwI0ocA4hLS9cfWMaJd6D0N+7AJJ77++BVPd50
	nzVjezqw+pgvtErc82Y/t4viSFgleX9cht51VQiE9ViknQHxdcohAZ6+yO3BPebLiAtgWWUuJ1b
	1yMwSa/ySo1pJMqV64A5Eb75Wi5bi3wZNg8p9qJOPx351wDNwwzD68FjLYC65PF7XGf3kpPXMSq
	f8uILHYHXj92vmTGk7gbCGG7UUzazKwkg6QKuPm7oY/RhiWZBjDZOCGyI4b+hrvi6GPPGw5BfJB
	4RMJn/WSqdvosARnmLH+UJac9Hi1RGTkXdVPU2iv4r8QSWNLBr7IkFDA6ysE5Ro5qEmTXdRSFAa
	Tvsjf4WBVi3yObqTpRDlxXBijHsksQzgq1svz/qEdt8fTXbaHUypk5n9Nzd/sguLp9nrNzKHTfA
	L/fLM4kB2z5TrgL2OVTrRkhu0ecipuODov8/mieLbB/qXt+0HYtkn/m/z+7lZ9SQAqCTjOzFzfs
	afklC6se2NH5Doj8tfnp+LUAWjb4OWoOVyMK97jU+2WhvZ5wcj/ZMGNsWd3YFeR+bgOp28bmuqq
	bOmy0LywY0oez0EK6Sd1eXr4vNf64eXbzsueqDs1YUcdIju5N9gD2+M2aKueKI99AbkpA2l9AIb
	1voBnCmbiCxj5Fl1uU+jwjbIlTBLybq1BNxP4Fm6MHeJvR3gOpxzGlqKYHv/oKhnh7NqA4r9S5s
	J2lwhb
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr48456315e9.4.1790262812943;
        Thu, 24 Sep 2026 08:13:32 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de187asm72623085e9.7.2026.09.24.08.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:13:32 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:13:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Message-ID: <20260924171332.00001f82@gmail.com>
In-Reply-To: <20260924-topic-sm8x50-iio-max34417-adc-v2-2-9a0609e72f5c@linaro.org>
References: <20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org>
	<20260924-topic-sm8x50-iio-max34417-adc-v2-2-9a0609e72f5c@linaro.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 15:14:16 +0200
Neil Armstrong <neil.armstrong@linaro.org> wrote:

> The MAX34417 is a specialized current and voltage monitor used to
> determine power consumption of portable systems. The driver support
> getting the channels voltage and accumulated average power over an
> I2C/SMBUS serial interface.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Unfortunately you were too fast and there was another reply on v1 :(

-- 
Kind regards,
Joshua Crofts
