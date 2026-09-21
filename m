Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE884C10CE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006034; cv=none; b=XV9N6zrNu4XpF99kn1XB8BeozNaVZT77OxCr6g+dB1fypKYh9rRZRIiNninQclFqNTzABfXWbYO4B4zm5Al2tqBjFBW9xqLfrneUG4b6XaTcNejMfQSm4B8AJx6cfsc7CAeaL40Kcjfq5eOlWUyCqQIQQ3Mt/anlEpzOQhxn0YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006034; c=relaxed/simple;
	bh=kAV83GG8Wx3vs0tpxEdTxwn0XZCNc0tZOHUrR9Lz48M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CUNpiKZP4NV+lvdopoGqfEP1QnksAg+9fBEwz2HaCGizSx+Rvzjwo8nKwmlfiggHlvWkWxQZrJSdFfM8FYqO/yfrRp16CoF9HGPekOFBpUZbViM1tQK49THKqv+fTbXTmoe1W/hDfaKcyPLICdcDcp43b4L1Eo4ZmxYzGXB7rYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eUb7/z9r; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eUb7/z9r"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso24075695ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790006032; x=1790610832; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAV83GG8Wx3vs0tpxEdTxwn0XZCNc0tZOHUrR9Lz48M=;
        b=eUb7/z9rRboiBmTpaCl6lc21MbiVYTqZq2BkuHUXMy9Qx+fjnMZz4Bb7z8d/uF2Ae3
         sT6WmYODcw0JVzrx7KxrQz4kFJ9Q5QYBH/IqEiZzxeO41MWHpaxFo8uQ6gb/y83kY2pB
         NP90W18zDe72xDHSnU3kKG76OQ0wDcb+Aqiz/atuxwrXdcg5t8RjpSF24W6IiaDErE2t
         VPuD5uClKy+m5MRUoNey4jqUD9zOxYKXxKhK+bO/fRcrzUMWgASfP5k+MOb7EZPjLhIx
         IcHGBNFRnSA/UAPQF9SrtFbt5/FJfbtqF+YAgEjAIdhAB7Kz2EOGo2WCHtpdijCvkjSW
         bOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006032; x=1790610832;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kAV83GG8Wx3vs0tpxEdTxwn0XZCNc0tZOHUrR9Lz48M=;
        b=qRG3M9wnsEgn2gISwRMu5aaQIrsdsoc/xUs6WhIOCUNLU/dxzpb/hA5pLCcPHsJXCc
         L6DXlO7qP2w1mnPCe1tt591QDsXIhPgKQs79hhhaT4xAf4B5/J3S55buVOHOssvyngig
         q99z/s6+25NFBT+hKL+/VgZ8QXqy+G974dkL75lfwUht8bs/C6I1UnjOHfFZKhJbvUyu
         BOWEYzbSipKNNrZZfxJs0MvyTMwvffW/vBcCBNUDi1um6yxKe29ZIhCBALftDYgS6+KD
         GdtSteV3q1kafCTN7rjrconCM1Q8qzQlLuBvB2b5qnETuRH/4SyHbukEwPomImySWdZ0
         vv5Q==
X-Forwarded-Encrypted: i=1; AKwUvByQeXuTPnr+Xe18Y03Efb+hd8G2t7rliP04iANsVoYG/58EArszXNicAaKKBgGKNP2BUKVVV9DHZBV45Sc=@vger.kernel.org
X-Gm-Message-State: AFuF++lzSPievjlBliYaYg69H1miHZKix7A/PQHTRbqMTyPN+4oigg3y
	++xUcu6k1Xwi7LqQCobBF6g5aux3Mh8qD33whd/O2wSL2D+LGOde+9ZqGFFtMkvp3Dk=
X-Gm-Gg: AYBFou1tdPg/eZ9JTcstVUPOwXiRnWhIAzh/yB53yS1/j6VbvxgPvnoOr0/gfYhJHQz
	OlOJdn8SfvbHcTVfFv9Zlq++5sABxLzN/ifmFojipoljVyZHGG5kB8Gk3Q3HzmiSDFznc+VxqPr
	ML4N7/fyA7ylMnLc3KAy+PSoPu617mhSHx8Xwt9e0TObYTs52wx/wHtOv2iJn7XqGoi0pMi2AJc
	eAkQPt3XDeXAa1JpOsmjfuGycVcN9XLKBfthItJUJ0Dcd0cnQMnBwpidE1n4/riSEADnVlt2YrG
	sOgLmdogfZtl8IJU+nEF5kPnfiu9S1Ue9k8Ak0ya3TqT2qoSWCx+jmkGqGu+JJIs5kZi9rECx97
	26IiWZzfz50R219HJq5QlbeGes5j2RcytF4T8Z3EcAgaYBvRVsxneToHJ+Gj1o8fmclD+bA364u
	wsUB8NDddaEejtw1KpyzxUuqjUAUMHWEPtMTlOmxtj0TmsMW81FT2FrcWA9Y1TOqXQ3b4=
X-Received: by 2002:a17:903:98f:b0:2dd:c053:e0f4 with SMTP id d9443c01a7336-2ddc053e132mr114905975ad.35.1790006031634;
        Mon, 21 Sep 2026 08:53:51 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ddc178701csm36425795ad.13.2026.09.21.08.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:53:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andrew Davis <afd@ti.com>, Tony Lindgren <tony@atomide.com>, Vignesh R
 <vigneshr@ti.com>, Andreas
 Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Davis
 <afd@ti.com>
Subject: Re: [PATCH v2 1/8] i2c: omap: Drop bit shift for I2C register
 addresses
In-Reply-To: <20260908154223.116074-2-afd@ti.com>
References: <20260908154223.116074-1-afd@ti.com>
 <20260908154223.116074-2-afd@ti.com>
Date: Mon, 21 Sep 2026 08:53:50 -0700
Message-ID: <7hzexad2i9.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Davis <afd@ti.com> writes:

> The OMAP7xx devices used a register address shift of 1, but this device
> has long since been removed from the kernel. So now no remaining board
> device uses a shift other than 2, and no DT supported platform ever did.
> We can drop this flag and use the pre-shifted register addresses. This
> simplifies the register access.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

Acked-by: Kevin Hilman <khilman@baylibre.com>

Feel free to take this with the rest of the drivers/i2c/ patches.

Kevin
