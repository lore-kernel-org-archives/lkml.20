Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959992;
	b=XrapwAdPgbuvU4ozmlYo7dxKuTS3xu8p3DNvOLuoIUxvgBGg7LZ0vzVN4UJh2RvFiCun
	 djsQyC5rNlpLp/HivLiAqgwT1YdxaXADDLa6f/gAQwLxhBDeh0JSQR3jDVZBl0l2UKZVM
	 Z8Tr8+GDmBhzKJcdo6FU4twYENJEEvw7RiFAizQ75pIZbcxxDVDPjuDaRZYoJuWDtEM0K
	 edUvwE3QKkLo0dzL6im5K4k+zeUOwot0F7utmM+lKcm+OKu+1NF0NSy1dnH7yVbUOGmWj
	 LB8chu8207Os6ya23ScbAwe0lOCS8dLgovmqbsKXPGnzPug8NHpV/e3Jm6L9tFfHLDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6TKu6N+rhcGhq3Fl4eGSM3fARudAqk/2MFphQxFlg48=;
	b=4XYO1B2brDERel4AGRPsYiwJ2SeOPlSddNvafbhDkZwy1Xu0uwmd2jMcyxpFKEhYZdKX
	 yL6qzUjqJWlM6OjAAg0ZgMifAsXkFX3qXPsDzqXX5yLeBg/MgIYy09ZlvfSmKHIusX4Og
	 OOIQglfSOTo/lyxVnDZ9/oNX+qnBkt0HwXioYwxHHMPzCjORAMcqsm2x1Ikk63c22ebc0
	 Qe/QMVNb0ejxTFwtiLjWBrYKcWr+oJtHZ0IJ38KhaER+YarcBZ6nc7XbHko/LeuhCFy7t
	 OlKhIIfmXey8+xmDBGfry9UDj+S0X0i+mMWMV/stSDy834Rg/tQIEo3a7jFYCvy4D8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9A3jtTp;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7B0606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7B0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9A3jtTp
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso234805f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959990; x=1794564790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TKu6N+rhcGhq3Fl4eGSM3fARudAqk/2MFphQxFlg48=;
        b=X9A3jtTp7Ko789WWbZOSPq8aXjkK3KS/97s/T/qVgGPFaMoBksrMLm7+PMR7DY6TB9
         Mq4Uv5ZOroiecbMwFPDZ+JKLCm5dY6Pv6mVs2ni9NWeJ5hbfTm+4qe0t7LD5a4O4X1cW
         cnCDVRZBv03KgC1R0imMEYXU5OV46xJBfIf8U5z7h9Y00MVN3RcG0t3oqCG+jKViKPwp
         8CUoYhen+YHxIogOYIsVv+bx5qU5jZG08Qae1pq2nnh+iqWJPIFQfBq4rbsAAl+DXCVp
         E50pVoVfc2oPmgyJmAKuKVxC/Ql9rkAIBLBzHH6eMkRtL9vapj29wM1gD/xr7Fcw+kMT
         KZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959990; x=1794564790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TKu6N+rhcGhq3Fl4eGSM3fARudAqk/2MFphQxFlg48=;
        b=cXbf8KnilyogL6gImy2lF0geHaBqd5PDmWh1Gqo8GFa5yiqsFXVQNIqFJLhJpzR49z
         iVW3SGjFs7QzZXsh2Xs/yFz+NNvSvVk+8gAllr17Geprn91YkyqM4M+zxU+ZozUZ1qMn
         vn1g6zZTAyWyrqtUr8f2QOp+XrG2kl7NIrZCAx+BtTMBbVCRVKHi8jsbhNTtvQFmZvmv
         mnBpHSsUGb2QcRIF5ukyonVYSjCrOVYS0fNtQuGFK2dNbqO2huFjorGZM6y7e0aVkRij
         hxsINf6rzle2bep1K4IGza28ppr6suX9f853ixCZ1frbGBodD6iqZmjCkFNQkwRwyVfO
         wpLg==
X-Forwarded-Encrypted: i=1; AKwUvBw6egqOt9pPgkYGt+K2KuS18qPJgrby48fsnuFVxek+sMIO0PeOhXV0zVm25/+42e+iVtQEGN1MWfvGy7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e3CNlfBVem3YZQstq34FD1oiUwXDqq1Tn8UZ1IvSiDZwEw+61
	oELg+eGYDQkoSsK4gvgEJ9Tq4Wn6wwiCaxqBl+PvmMNdUyJd40gUePen
X-Gm-Gg: AYBFou1mcg/RsSIXD0jiadI8zJQevYppxEP4lGcVeKIN7vlEO9ICDKbYhz+fyZjSv23
	gTAJnvXZKdgtOt7dPSFHFlxjys/xc9RUnxZbu8l9FZevtqxhkwd0du7AH2aV/TTe6Z0sn1RoPTn
	6POsFT1f0HyEpNBgF/XeB4dP0JupZaivKM/one/twvbf4vEU/R6dFJvJUAC/B2gEUhO7wVHLOvN
	CMuyObRDgVEGzkMM/ET4Z4hrhst9U/Sx3psfwWPRgyWhKCwzfXo7pqadP0ov566z2mAMCVuP0VI
	pnkS2Hj+FUXb2TfWs0Iy/sUDh6TWHxfLZ66Z0MtdRlyO6hXSVsTbCqklvnF09EO20DpP+Gr1HOC
	NYV6Qkenjf6uQjdviKmAMHAv4+PTNOoCfVDK6lhGKudQ+m3BhdI+6G7CYQa9L2MZpExduzjEVfa
	CJEH5x2PUSq6/hfYdYY47isww39y0WKE2A+11Mpw8wLTAdcWNlIIy8CZH8IpFFX3AjT7nqz9BpK
	ZoSTv5erwyX2jtK0yQ1rh+ayKfTqhP9mnb+mVTslYMUbZcWEBOM+EblnDxaw4yBToT7AiIqRk2f
	kP5bYHqADEjqAwi7AwazfowseqwdHoyYq58=
X-Received: by 2002:a05:600c:8819:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4b6db2ba2ebmr27307405e9.1.1793959989827;
        Fri, 06 Nov 2026 02:13:09 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723310fsm2934846f8f.32.2026.11.06.02.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:13:09 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 11/24] phy: zte: Add ZTE ZX279128S PCIe PHY driver
Date: Fri,  6 Nov 2026 11:13:07 +0100
Message-Id: <20261106101307.3936492-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261014072109.1759502-12-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-12-ghahramani.navid@gmail.com>
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

Hi Navid,

On Wed, Oct 14, 2026 at 08:20:51AM +0100, Navid Ghahremani wrote:
> +		if (i == 0 && port->has_cal) {
> +			ret = regmap_write(zphy->regmap, CRM1_PHY1_CAL1, 0x00202d5a);
> +			if (ret)
> +				return ret;
> +			ret = regmap_write(zphy->regmap, CRM1_PHY1_CAL0, 0x0046c24a);

On my unit both read back 0 after boot: there seems to be no register
at 0x1b0/0x1b4 in the top CRM. The vendor kernel writes these two
values into the port 1 controller's "ctrl" window instead
(0x09600000 + 0x1b4, then + 0x1b0); with this series those read
0x00203c78 / 0x0c46c24a. The link trains anyway (the MT7916 enumerates
at 2.5 GT/s), so it may only matter for signal margin, but as written
the writes have no effect.

Agustin
