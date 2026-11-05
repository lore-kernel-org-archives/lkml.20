Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851531;
	b=U32CthRg06WdVRy/gMEZOE5GCwF4AMnPMtpXChTc4fuXEa3poB/CjWEMQuwc3ctkhDXH
	 5oyWmJav9x/DtAXzmGfrM4FwAVCzfQrM/q/rbE0AbDHE7vvhEcvl8rVN921b8vligqFI4
	 D2W6nCzPiztRIN5yA3c/EOW3E/SLw4185oOPyRls85MKzRA8FR3jJv4vQL1lntLeHEeAh
	 QwqVRzzqSFUarq9AlfIhcM9a2TViFBdRl3mjthoh6b9ULjK+KTTmuiRRmUZ9Z5I7gh6KI
	 Qx28jFqqh4l6IhokGIOpKDamah6aczGzUUhqn6Lmkk7qRYM5B8AStbdmE3sFYzU+eQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uhXzNT85syfQsWP0/fY2t6PKYwrrbIrshv8CnCw1QDI=;
	b=xM3UBGOBFWF244zGKw88o52Ebc8sI2aXjalbEn5PEVHKBBcBpjBtxgbK7O17VcT4qo4L
	 bW/3KOyKtCleUzb3DOxUOCgOkIWVJmU1Nzj8CSnlu+9Px+RVvPeImlMHDKpTUX77xZvMa
	 1MD6w38QNySVWPvBxqAd7cjJVKo8CScVl35C+tMUdC/RMSHiDb8QHZwVIFvuG5vFOTgjf
	 JKlUVCkLkynnGSh0V2/dv/8UAqtsRusmcx3ZlragO0p24K7tsecF6qq8Q1dlp2S6jObrq
	 ipW6ZozbGQvfIwo4oHrI/o04VdOKiObTsM08QRzdIrASs/2I8huEiQdKpPsv9imz7LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reznichenko.net;
	spf=none smtp.mailfrom=dpplabs.com;
	dkim=pass header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=VepMpLxv;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A8606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D54A8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=VepMpLxv
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1266867a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1793851529; x=1794456329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhXzNT85syfQsWP0/fY2t6PKYwrrbIrshv8CnCw1QDI=;
        b=VepMpLxvKUhAHEzmMxos/BPDl/sT7G+0yhx4Zk7yWSt5UDWMfcPoIqi9A8cLFBmmyf
         EgS8G51JP6+LZZESQUChnBfhaOE6Z9pmH+L+NiFBOJFr1HTAHg9aFWiAMP8KetLKV2SE
         DkCiMQAPKbqeGWSHRWdUGp6u7QcolbWnJBn6yDYNCIm2eOkZdz6QHjWTp58C+yDxMMPf
         bMSr3hoixMSO3XLVoTYFocBLYCPA2xLecXMbhgS1EOdK3RXptrl5qWat5U6SWswGx4k/
         vp0Q75iVBE/7NAr+PKAu4Q7sSULsB7PbXcsH2+5hxwnqF2z7u1czO82bOmT9YqXbvLDX
         N7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851529; x=1794456329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhXzNT85syfQsWP0/fY2t6PKYwrrbIrshv8CnCw1QDI=;
        b=mu05Oixho0y4hb+sBAZxYzqHJoOYpoR7ODjqBif69zeOU3HiRKpJ6TCtm05N59vMCw
         PAPRtsGoHmaXhH2HRwP+3qvY9Z0ci1Q6SJs/UOpCtUaGkWsdk6QsdK2lV48kmgRuCWk0
         UvXu/Uus6dlw3yIuu8uikfRmzse0tf0f0FMz13QaKZcc3QKGCENXPFlYrhlv1n140jY5
         Yx0crxlRqfXuJo2CT/i0aVxfEYsTXMIQ+IjgC70mLO61TEjZI6jLV+j+nx1Yrkg6+p/G
         0lzfU87yp/w9Z+w5rtvCIFCUgZDsKPSBxf5yqmMYPZU7R2NvA+z65EaA7EY6vxU1BTRw
         JbMg==
X-Forwarded-Encrypted: i=1; AKwUvBwIZjwczto5B8T+36cp5R74r92ZyOWC0LTpmChUGwi4nAoJ+HJW6UGM0R1X/OSz/v7aQ4mPQ9e2tGRWPhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mo5pZ6O+I7+gCG5+OTc0m/5SV3aMpUaPtXvDTSJjFL1hkKX8s
	eS/8Agdjvlmloi/opsy5vTnNc0AnPQGVgTUFlzAk/Mj5lW/eHuoetN8q8GxVE11jC+E=
X-Gm-Gg: AYBFou0zIdfxR8yrlF14ZJGbXx/H7hmIeNhZfhz0Jh4ery0dB7lXhg0T56YO5HBS2gX
	FAiOxk7oEvX3W0k/hs4JmvrGsj+MwyQTtLHV64xfzlgvSww3Pl/sb/avFZyRbTh9PDvKDcTpp15
	f8lWQVfQDMzV8lJ+Y1PhlowXc4b8GSR59UQRath9AtYk2CgdVx4VxGQe1xD/wweICZqRF5J8gYi
	gQD4spAMGEmBWrQ+B4SNyf6tf+rZQe4KuVNiWBibDLldp6uaM6kfauV7hinTE/uBjZzvYbDne9Z
	zNRkaTi6CuUzJKHl8VZHku5onNu1uwCPGsHPsFMXZ1rKYZ8wQbZYAMEr1aJuc0BaHMStqukd1O2
	WZDe/CvZMv1JWyBsMrSP65EExxwTxcoMiHlTqZHHccyGFhl7BZ5Wn/sz1rpsOZZdRDD46QoiIaF
	BD4udwXsWHAjaaqy6X18vJ+azyn8ZjYccZWuBsAlkkw6LQfMcoav6/0H7UcPwjnGN9RK6CxPwbd
	7HuXhLj8uyexnQYWcVPyy3SuKoPggh9h1yw/7fR7lAA9WFW/X13vSYyhkQhnGcVeYSYYPedv4lZ
	AvZFvkFXsgoXP3d8+4oo
X-Received: by 2002:a17:90b:3142:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ae897f3919mr15959327a91.28.1793851529190;
        Wed, 04 Nov 2026 20:05:29 -0800 (PST)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b90def97sm952109a91.7.2026.11.04.20.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:05:28 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: romain.tisserand@gmail.com
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 4/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Wed,  4 Nov 2026 20:05:26 -0800
Message-ID: <20261105040526.26323-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-5-romain.tisserand@gmail.com>
References: <20261103110524.2812831-5-romain.tisserand@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> As on stock,
> the panel is set to the 18 bpp interface pixel format while the DSI link
> carries RGB888, so the panel shows 6 bits per color.

Minor suggestion: please drop the implication that COLMOD 0x66 causes DSI to 
display at 6bpc; the datasheet doesn't establish that causality. 
I think COLMOD only applies to DPI and DBI, not DSI. The initialization 
sequence can remain unchanged. Non-blocking.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
