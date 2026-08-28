Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6215448BBE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920456; cv=none; b=Qrm9vpjnj4NNEDku3SnanSCDVotz3D4VeEhDHGEt+iNL17bRbjG6hThc14IeWvugB4FCEgA9OgDZASDcK6S7f1KINFRzjWWjhdTRYiwXuNVuLtTzCcs8JzNFja/IzFxDpwd7QCOHSPrvy8PMOS5qGPHkfZEoACsX67zsVP+G5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920456; c=relaxed/simple;
	bh=81KqIzUsGy1qulpSNvHF5tHp4EdkXa0CFFj1Th1yeB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u7TeVpgRoJVmaUzBDubkQquwz2al59p6MlovUSc0YWAUmR85rVld2jLZhK6JtGBWqQFQhqUS/GDsIN31uxi7yRfQLb61AUa2KQeK477hdE1sjwW+b3UNDrgeENdnq9tsIxPM3GmB1Fhpaqk483K+e/7uCjk3mqhphMdZIbJb2UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InBfzPrF; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InBfzPrF"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-396b3d0df94so1022652a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787920441; x=1788525241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81KqIzUsGy1qulpSNvHF5tHp4EdkXa0CFFj1Th1yeB0=;
        b=InBfzPrF6XcLPpVlbWPMag5qtY0BcTyp2hdXOghKgCSlGAeGp8/HPnWRasLxJR5fvw
         bXpNzWyw/LHMUd2L33OKCgHOKS1H5i/dr3Tbt3xx9an6ztswKj19qIpjlRQynoaWqsOj
         kaJdqD0mt5UDBszcWI2SL30+qbedy3thZOD1qSAyRe2y3NjJh/zIn5Far0ZtGtEHMc89
         3AaOjdKR5/3akHFrGzec7sc0x3dBEEKWhB4sHFpolr44UNKLPhaEk1sLvzbXi7LznL71
         mf+4Oe8u1BU+n7Mmb2MiBn6/HEs6M8LPjOlYg0h8Uxl7vCNdTnskR0MURjFE9/7mqjme
         2mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920441; x=1788525241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81KqIzUsGy1qulpSNvHF5tHp4EdkXa0CFFj1Th1yeB0=;
        b=m9aIrr6iMkSGk2zvlW1FJu85Dcu180qXZVVoxT+UelUYM75ZhjbBpdULbahSwUl/sQ
         HZLJAjqP5BmQGgVSbM+SHDdnTJjDcrMsB8tf9wR/x3Q1e1EocydfN0kqYka54IOpDJ/P
         Ldm0sG2tjLYjiXJlrfet2jLsF2Rw6rNJITAlTV/vrlRflmzNHg9cttLwYVCV8YN1or20
         bYFX8QUhmeGdFItB/15cn30SItGR5DJG2ppnOiq9SKVMqdq4V2MfLyoVMUq8pDJO8rFK
         TM/ckfFU0Okwoi8pVj0Ah5+/f6N2o9ouZ8Lf7UmMZxFDuwE0c3m/hOyncct3CmJI9NSI
         hkHw==
X-Forwarded-Encrypted: i=1; AHgh+Rqo4F/Ag21YrsA6Lfs80sT3HIXEpbSzFn4en2RzpIomso+LTIuf7dK5kpU0byH1PcGsKmwPOFTgWI0T9Wc=@vger.kernel.org
X-Gm-Message-State: AFuF++mhpJSCbgx3NmccZY8/1neK/8OdJQbH3QVomRrdshmrLIGRAxRB
	6EOSZNT6z1CsBZJessOaDWwdpV3F6gUSJRYvs+KYzMxge+iJcWWRNv4i
X-Gm-Gg: AR+sD12nKqyBi6T6fn7AO4NH14VUN0MAX5Q+xlTF0Wk4EZnr3nsrjpS+BL6EGXuUKEo
	YgjYh3OAi3Sp8lL991PGt4xQ0ipdqsWrY1F1AaVW16FoGSFu1WNfy+sVdPnopPxupzMi1laG+uQ
	VttJu04Idm4wbrGxr6DbJkGoPEh/8j5SG7h7Vn4ojUVQeEPTgkUclcop/s2hNlpgXprKOXfkyjz
	wWYm9np4wxo5Mt8DC98rjnKAFBLRizYLWocxh/vBmQ5QBvdDyc3PsmD4MRelo9yqo2b+3geoGY3
	Wn94IiVqW5cxH/2396OJQ9/eo5JN4weORciooDlbhsqcukuAuut5cKW4LK8KC732JYzLUvHw/zL
	5IH1riVjTP8EhiuCanyHv6WHQfP13kN8yMkDlqlmcIQavnoY5MxMQyDaZ7g/9qlUts+9eG3V3/o
	te/8QUlYZqeQ2+w3zN6CoVglJS0egyYI0UY3cjeK5dH7jMTYR5ldTJgOKbUroUjJupJqvc/0dB8
	Q==
X-Received: by 2002:a17:90b:164b:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-396d0e27d7amr12963110a91.2.1787920440975;
        Fri, 28 Aug 2026 05:34:00 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1868086sm7009846a91.9.2026.08.28.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:34:00 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH] exfat: validate vendor allocation directory entries
Date: Fri, 28 Aug 2026 20:33:42 +0800
Message-Id: <20260828123342.1095335-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKYAXd9cKQ_Z9ZXRuE8qgA9qHMxO-__pt5J9xxDTyJ-E8PkR-w@mail.gmail.com>
References: <CAKYAXd9cKQ_Z9ZXRuE8qgA9qHMxO-__pt5J9xxDTyJ-E8PkR-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for the review.

EXFAT_CLU_TO_B() was replaced by exfat_cluster_to_bytes() in the
current tree. I missed this API change when preparing the patch.

I will send a v2 shortly.

Thanks.
