Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116FF3932C6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362060; cv=none; b=QW6m8seR4ZZPZDyQMx4sI2TfK7d0tfaYpdxeX+F/Omnv4YkUad0ay6rqHQKlRiXXk/d5qeZNZacGiT3hTfecmhri94YSlqHZvlSoXLPrgTTBVOClK2/RdGDbYwU9ZKwIZmh3ZPgbaR9jaaBtqz/Q92+6XDLFRBHARJlnApGQ+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362060; c=relaxed/simple;
	bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=on7hdF3qaE1wF67gsRnvoBv/qNiZ1mUsAS+VuyJd9UysQpfuA8VCSv0lZuzW+WxUFyZUyd+8CW/kwUpr/luqc9GS8Cv1T8camrkw03x9NfG6n7Y0HInP6pnRrZs1pGOaAic4eR5soWrD8fFiSiH5e/AfQlII9vN3En0biUeteDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YuRYmcJB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YuRYmcJB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so36091855e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362055; x=1791966855; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=YuRYmcJBr7bRkIHW5cS3rRVHhMcU6eQfGY3vA4mJPU/9owTwr85YhgGKF+5JAu5HpS
         xbuTq9lDL+M2NNPwbBk555eHYcgF1GoYK6Kj9vHyCRh+LioCEHbs4yHXsXrHxREIr8Qp
         iVo7ACndj6rnzfKagReUmKm66RSfYp3ne5w5S7qEfGVRk1DQZC3JlIIpEXVXQL1BHQDR
         K04RGFGdPRijH8kio7I7NmBHvOrWDINDmmexWQ9O0SqdfLoy8cG/mK/ccnfrOz47VC93
         M18VY7Xz0Mde9r2oGW+C5MLlCif6wezSfBHjGIgSu/dTa4r0nqhs1LF03Y15Rz0rmWwS
         Z6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362055; x=1791966855;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=mMeQD3ugMJWAzIFgzoOGWhHzI9y3gFgjfh69qakl0Ufvl91yXAl/emJFJigo2J6/PU
         G3AJ93xsfmAy6lCu7yQYkfUDkbpF5xLftWqiTdSvjkzgSPua2RGrcHMSdk4t1iW9MXtB
         JzEnwY6ZrjKyxijIm4F4w9UwvLm/wY4hIN0QJc1noG7vPr0RCkiwh7gUsj4u4DkzbqgF
         ItC1ynhh5me482UB1qxzkLB0VWq9TNRmqoPTLnA/EEtrZCZc0rqiYGbBUffh5mmod1BM
         QrbqO2nJE8OWuE/sf5r91/iMuLWHjI9qcl8buJDRhz9fkP8ZEDGw0IBNPsLpVXMTCD/e
         K11A==
X-Forwarded-Encrypted: i=1; AKwUvBy1PSI7QXAMXAgUYuS6xXDQW2AXXFPuCKJeDY32HLD1Nq809/jvQ7NSaV5JmqHMSm7ZL6yZk3LPZG05pjU=@vger.kernel.org
X-Gm-Message-State: AFuF++nKeuVy7mAnwyQHvTnd6Zs52TArdVL1Wap0Tcl+hTsb8jfpYPED
	U22Ul6Nkf1MsbmYfCUUfihcb4ETdiwtubTMmbzoZHtJnk21hc1w5RnSul8v2gJkb6N8=
X-Gm-Gg: AYBFou0avKxTbzMljHGwrtiz8OYtUN00hii5tXqtzjQVb8UsBJbrqdY43Z9nh4oO+LS
	f6r3KlnjTNIeqC9X8sB+2xb8UsqD3TyhN0JUCjGVmsyaj9KL8j8wuqslhoDBhyvSe6kaYRlb5W/
	6oxt7idQma8Lfj9ZsEvTmsEkXey9dqDdLetY5Nww9kjqeI3480ocb14omnPQv+UWNnmUbTgYT5w
	HY3sFKMu9yvvafqkhWwLKvl0GjXR1awpec048zbJb0pGu/BixaMX0xLFpa2+1qWRcjWbfCMABkO
	9tVPdNWvXn2ZPCT7XqSXV3eCFEj6NXsGSAtMOCyzkLvkBP6zc1RqwV2T4irmtKDek86EX+U7QlG
	cyjUqzn7xI3i/n8ZrorDyWVTt42pxyXsOXr7pM5DDf1uB2QWbI8wcoMqLdcPqVROvrRW0kaChJr
	pZTsnx3LigrOQDSpL3iLxGme5NFZ6uOTagBK4+GBRi1UQXl+TwzJR7iFwHuoaD6xSAg0dTdRqx2
	Gpw2swP/bmqDhpLJpkz9jsq6Q==
X-Received: by 2002:a05:600c:5254:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a180679d9dmr19886705e9.33.1791362055220;
        Wed, 07 Oct 2026 01:34:15 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm79454375e9.2.2026.10.07.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:34:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 2/7] ASoC: meson: build gx-formatter as a separate
 module
In-Reply-To: <20261001-audin-v4-2-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-2-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:34:14 +0200
Message-ID: <1j8q49zz7d.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Instead of including it in 'snd-soc-meson-aiu', create a separate module
> for it. This way it can be independently selected by either AIU or the
> (upcoming) AUDIN.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
