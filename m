Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA57B3624DB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884006; cv=none; b=gH+xSmvyUsiLlhqWCGS/CU6W6ODBblu6KSYlPiGBFRVM+HNhIbnEjPGEYGPKpz2hfwUR2Itu8azd/3WlYP4tpxsXLvht4Lit4gmAX5eKTmxnKgazVK9+TCoW2oMF3bcTl33ttrDrc+hhYlvkqRkW+Rjwsu/O9grRgIBN78r3TGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884006; c=relaxed/simple;
	bh=QpWWOwFBULeKwYI4PCedm3/zoOvVb+lhUJD3npEojNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyxNh12physpGgChA0BXzax9h7uJbpo448qleO0wkCF21lX/8N5LbSFkmGX1rVMWGkJy7+m+wr05Pj4u0vQniQxFdkHC9KeWnh4wLhndvll//5dwnEsf2PKh3co1V6s1RZq7pl1WaoZF1AUYgaOafsMRUp+SOdzc56S5t6Pg3J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnGilOSX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnGilOSX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso42633855e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883996; x=1789488796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZozWtHmNmFGuuXS6rdSiwWmzJrbj3zMVvcx41YYesA=;
        b=SnGilOSXtKXLaV8URfU9kS+2KjHUs0CgWyL6QMqRmQVNUIqv+vZpuItpucgTLOv7Rt
         m1FnKQN0vmozNALEOmp36wWMLweiIXIxlRis4ngI274awT5JTvLiTf4G5R2C0JhfyoH/
         SWAY9jbgyyuolLTzTM5fQRgEdeGXICONY/QpXeLZ5kZW/J12UGZJfCOqjEeKUxbkYiAT
         mGC+P4Uogxwc+/UCBu/6/aJNVSNAqbrFM5jvTPLjvfqHMbznxn60TLbTYqzLV1xDkK5o
         LCDaOKFr7UUrKZd9BbdS7zangrSs7KQ7qrwn+gDcPh1HGtvld+fwtZwxIyLgFH05dmIe
         RgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883996; x=1789488796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZozWtHmNmFGuuXS6rdSiwWmzJrbj3zMVvcx41YYesA=;
        b=TFY8KUWy9tGE8kNcxYfhzDspKrSKi6ZUe5mjNXswMVdk/fNEmRRGOUguTK07s1DMlh
         JSr3H5KniallRAUI2/Ysefo9+WMt8cZqvr7mgdFpJ7+RdTpcqM48R24PznSrXSjBJfEZ
         thlWPqDxK+X/UrQTU0W8fXK1cO/J8AemJEbnRx39XKGMb70NGyNn0DSamvG2f32P4rSd
         w2Mt7oOasWXUiHFQgrkefrqaHt+PF6yCm0J6Ieu+GYJqxaD1D2wygYvwzqonph8+gUbK
         FQN48WcsNE3xQ4iK6hdK1SXVC03U6a3f1+zXj1aYEt3pKc1qxILWDoG1LSycGhQWDzP+
         yx9g==
X-Forwarded-Encrypted: i=1; AKwUvBxfgaAH6P/LSllK1TYF8yfHB7U3RSbaK6MU0mrXsJuKrWAX85KeEPiJOjiIBoKHASXbQp8XpZU2rJwhIG4=@vger.kernel.org
X-Gm-Message-State: AFuF++laYsRVsvQGP/HMPz1UjMdM/oz7BMrVyFFxK3af8Rt4cUMu7HfV
	SZ/VdO87IZB+493tnAcfGHa81Sf0Sq8hvAT9n7pTSlt8WOefxhPT87Y=
X-Gm-Gg: AYBFou2Ktkq6ttb4FgerEXZ1Z0Am4gfTeN4ff3lBkl+RpticUVV+2DVkRJYrZhFwKS/
	iipgu/awOgZrtniR7xxebQpLuR5cE7ObdjFbBV4m1yRwNLZExTlSOBrer4uXPGIPcnl3VIyvh2/
	9od44Qq2PXUyXuRBnSBvQUbBG44nkSB2rd16MVUpMy6+BPNKNswjNtl4NJueBD4jyu4dtjtlAaB
	fv6WTBH4L0e5gh/QOsrCnc+BzG+/4jKIkzDLl8DBRP1lcy4KrlqTQrVBQbrbTQ3w00TtJgOsvMq
	utNbdHK/Z06i49Jgvsi80UTciUlwcDv4WPuyoOhsOkomPcDkFuNepzExZprv1WYymP9p45cRAns
	KUxv7rXcSAP9HksK3diS1nVvkWuSTmwDw/6AatK7ozKtOpTcQ0U8GQYtOOsQaKyDjpiU3uTSw+9
	PzGXH8+oQJ7Rd5hnizrSAOdHBOXnM4wtfxaWT0kwKgiYHtDVkCOZMnHuDKzhq3/+Of3Xs0ptS6V
	wEvVhd7TDgBUlYaf7kDNwhGJH2rWbthMe/wADHagb95nBwOuNnro/kMcJg=
X-Received: by 2002:a05:600d:8445:10b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49cf825d77amr217235175e9.11.1788883996080;
        Tue, 08 Sep 2026 09:13:16 -0700 (PDT)
Received: from latitude7275 (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm404906985e9.0.2026.09.08.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:13:15 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thierry Chatard <tchatard@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: int3472: Add TPS68470 board data for Dell Latitude 7275
Date: Tue,  8 Sep 2026 18:13:22 +0200
Message-ID: <20260908161322.334690-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apptlIQexoFg42DF@kekkonen.localdomain>
References: <20260904062006.39209-1-dmanresa@gmail.com> <apptlIQexoFg42DF@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Fri, 4 Sep 2026, Sakari Ailus wrote:
> What's below would better fit after the '---' line.

Will do in v2.

> Is this the same issue than for Latutude 5285 here
> <URL:https://lore.kernel.org/linux-media/20260831160754.9857-1-tchatard@gmail.com/>?

Yes, exactly the same. On the 7275 the GEXP device declares

  OperationRegion (BAR0, SystemMemory, SB04, 0x0208)

and the I2C4 controller (INT3446) builds its _CRS from the same SB04
variable, so intel_lpss_acpi fails with -EBUSY unless
acpi_enforce_resources=lax is given. Thierry's patch 1/8 fixes it here
too once a "Latitude 7275" entry is added to intel_lpss_quirk_dmi[]. I'll
send that as a small patch on top of his series; Thierry, if you would
rather fold it into v11, I'm happy to provide a Tested-by.

The other 5285 quirk, the static clock consumer list for the broken
INT3479 _DEP, is not needed on the 7275: tps68470-clk already lists
i2c-INT3479:00 as a consumer in clk_summary.

Thanks,
D.
