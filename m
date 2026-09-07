Received: from mail-oa2-f10.google.com (mail-oa2-f10.google.com [74.125.231.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5382529AB1A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759935; cv=none; b=bYTkQ+5RontuHAUZsZgcFrG9fDaFClSTJE4kw9EgX9Gibs/evR+cH+ze60VhZvJLqG8U6E29jeWJCUwH7Hg7D7hJM/1bt9IftugT7xoNmfE1qoLWU75TgM5ZJnEfjAGMtWrDZGxDhj2HUiPtCHs2Y36YzOgSw0Fxz16UcJK7BPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759935; c=relaxed/simple;
	bh=o5qbbR1yQ4iI2orK8p1mAk+KPmFDgRJcpOZbeD4+1ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7N7TL/OJ7ra+XtBedL4MTeU9SljIs+o94V6H7O5UKhQdxaQJDBSkfWeruykQux1MEpA1FCD34hcu8WvETJDqpaG/pd//PYqAY16fQE/hiVASwgTTVoAqdF8TFGeTcbi48Lg+6rPotQT62R2gnv3OPCpFq26b8xPo7GWOAIVx7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzoHsfgK; arc=none smtp.client-ip=74.125.231.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzoHsfgK"
Received: by mail-oa2-f10.google.com with SMTP id 586e51a60fabf-46adea418f3so1086754fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759933; x=1789364733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5qbbR1yQ4iI2orK8p1mAk+KPmFDgRJcpOZbeD4+1ts=;
        b=OzoHsfgKSxlFS/vp8mQ2DIFeyaZaI/JWkEtasr3Yn2mTIqwE73jWgKbUpwUVdcarEe
         6M+J+pOeoMbpNo0MYKzAuk3lhYUnZ+Qy6KEeVOMtuzVqS2Qat5xOBZTtVmcBWMdd2BRw
         rF7G2Ax+iUzNfu9H+yWMImppDHtvtoyptHDEtQCtjEomlzeJS6jZVMvziFjQ5bNJavcg
         4ojDBQhXohwo2fjOqAiTx+nOrxuC+ga+pkbO+vOZ7WGFeNbYmp95jIQIsYk69JddDs63
         SAYWt1X1KHT9Hc+4xao5kLaB9Rs8mw1EzczV8TQB/zWfFr7qGnuE+IIup6xrMYEJ8Kgp
         JbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759933; x=1789364733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5qbbR1yQ4iI2orK8p1mAk+KPmFDgRJcpOZbeD4+1ts=;
        b=Pl0s5AvDPbxIto5tLeVLdK1RG5negBwbMLV7fq4kZnh2CTFhktS38iOtqzgIPvRdD3
         BQ2dYQtEG43gF4jEH6HgaDOOXFMAi7gJ6AOiPZUQOi17VpCC61fFGi5MPu4IbXkg2OcC
         k5vQ7+MoS0p4wAp4zh6/pI9LiNGA8FqWD633+hTsWODj+FXxlII2mmHiSahD96H4aaYB
         UtiV/TT9ZHiZ9l+OONlSiyyV5TUTRMvkaDICCH70K+mLRd6NGVynE5ugRwD7/KnOxWto
         GQJowZ6QssmW0CPWRmYV48bPIlkOXlB/LSSYyODXMP3PmjNyxH+z7GFsDEu7e3gjws8w
         lfBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzR3m04bQ6RFZfsFwWKYuu5oFR5AhjLEGyJg+yCwR4h+L07aZc/J2lXl9hP+vm+gYBkSoN5EmZ14vZCHJE=@vger.kernel.org
X-Gm-Message-State: AFuF++lyCIRToaQGnmWl0lR7WjOIet/Fb04Drp2gewFDwD/H8Sz1WMgQ
	smnpcIHbC7AqqsWLsSJATwj2Ukcy8ZREeIp59O2JJFFExSieNoIcg5sH
X-Gm-Gg: AYBFou2D8GIvlaG8x3bIlodldsEe22togA2ilClOF7bstOlDhyF2DK+xLLlQIvYZaHH
	va+ZTosTtcSJWIVqnI/P68Wc8vWevaaqQxL6UfEQr9vRBKPhSAkAZ+3KoQlntu0nwLNE5Gt7Y56
	nZX7VjvFRx6wFVLbwHqlkalmbi+Wvzmv7qay06HbY4P/ifUtEEy6orloz2Vf15TWe9ZF7kWSv7/
	rbQ+JrKx+as6NtMhsvo4ayixpusROYZ5XaNHFFjJ+mD8bVVLm1Ep0bd7IyPeHNYTpg1GzcMi9Vp
	oCjlbsrItl6bo8t3kgIf/ZHqHYeyw3musL4TAhtYVuxhYGJYL7YkH7LJVILhlHlHu/IOMeqfJvH
	wLEcNZ+4B7we3dVuVRDKvxxDK3A1ZWrnLdOhSdL3zummdCv0n6Jv+pjlPzV5fS5Al+m+TUXQsIa
	5viCiTjKkw2G20FFWPtDHvz4yO1QlN/6uDhLxGHYCfWn4aeJv1/tOse++1umfGZw==
X-Received: by 2002:a05:6870:96a3:b0:440:67b1:b59b with SMTP id 586e51a60fabf-4754d5745e0mr13037030fac.0.1788759932942;
        Sun, 06 Sep 2026 22:45:32 -0700 (PDT)
Received: from ryan-dell ([2600:100b:b039:79f4:f7f:ccf7:cd6f:384])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47989a71ebbsm204482fac.17.2026.09.06.22.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:45:31 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nickolay Goppen <setotau@mainlining.org>
Subject: Re: [PATCH 0/2] drm/panel: add Novatek NT51021 1200x1920 DSI panel driver
Date: Mon,  7 Sep 2026 00:45:06 -0500
Message-ID: <20260907054509.118237-1-ryanbrue.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905-rbrue-drm-panel-add-novatek-nt51021-v1-0-939f59e89fc9@gmail.com>
References: <20260905-rbrue-drm-panel-add-novatek-nt51021-v1-0-939f59e89fc9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please disregard this series.

Nickolay Goppen posted an NT51021 driver a week before my patch, and I
didn't catch it.

https://lore.kernel.org/all/20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org/

I checked that there were no patches on the mailing list prior to
working on it, and then forgot to check prior to sending mine. What are
the odds, for an 8+ year old panel? :D

His covers more panels, but my panel seems to be slightly different
from his, based on the vendor kernel I referenced for my bringup. I
tested his driver on my hardware and it works; I'm going to make a
reply on that thread, and I will set up the Amazon Fire HD 10 panel as
a variant on top of his series instead.

Sorry for the noise, I'm new to this and I hope to learn quickly.

Ryan
