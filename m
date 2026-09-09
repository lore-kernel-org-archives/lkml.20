Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9846EC98
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941324; cv=none; b=r9/McCpq72V8b88uZM4GmVfC1vzaqRjxofZXVyJEuKCLIEbIdR4KGlVypC+wZ5kHWnz15ZL+NyLGhjEQmQDvodZ5MU7PzLatRF+Yp49rQU4vuUEyqnPur578whqTcY5xJD0zt6ZAlgHcs23uInigtej3k6LMewSRzTz15/iMkU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941324; c=relaxed/simple;
	bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EW2m476DjnI2jCD9GjQz/tCVB6UGQrT9b6g+qajTrEzavKOu67hvwby2Due/4u3K2Bo0vFg5NIOT6Fab63SKXgRuJpeyt3PooFDknb0y9dog5R9b1x0bs8DawhZB/OZCDMS6lbMaX95x5ZsOHW347DCK45JK27T8g6EMj2Ev7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqeAGu3l; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqeAGu3l"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso48000415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941321; x=1789546121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
        b=EqeAGu3lDZ5wIt1qBPKH2nmJSryWB+DBCIRKnhhHjUMd6lMA7PmjY19q2YLwgOB7zl
         yqgEcj4uHp9WA/IFnMM1fo37UIFy3rAAjhZFrNCbOD6i/bCQyLPt+yVd26Qswc4yKznl
         MZ6iLO3i06u5WUeTLScq/SuwmWsUL7Y5RwaOJZQdgyBNyEnpHJ8z22FFq+YaenMMJqrF
         TT8Zkw+uEPf2nvJ/LkaRiBQn54LyMe70coN8EtOoROd32BWTVULHh6hL1FhzKEsn2mCm
         rz12aS8q6LXFx3LoCc6jUyC4N3FReBKyd9zLRvNa0s9M9yPA/6pg4OMY+NWeSLGg0rF2
         kypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941321; x=1789546121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
        b=YfYAhyq14rt6ltLwezRxioYOKRQiv4A3emK3wQZiXdGnLFKXpPEov/EMIx/MD7/q9o
         tPpzLGJtygt2+O4jlc1o5j2+1v9E6+k4/msbjcvrS2bVRMsZNEvPAPCMxDHiKPPmskUn
         Uv6k2nTx785jw3sB+k+p1EvBKU17qsSYTBZAu9BHYONyCK+md7yp8fytOCEbSE6gxUrC
         sryoFgkpNfc0vQ7BhC37gbYguyju9+H+Ny3RIN3aXPyjbMg5teMOyz2f4UpoasY2GchJ
         UTbMNHtYMipJ17uKqRL7tm3anek5N9O1RbFt6YqIoySTjY3IVg5TzunAJVFk6WWprhKs
         KG4A==
X-Forwarded-Encrypted: i=1; AKwUvBzWVxGLqUHsZkM0HXDpfBDTvHDj/VXRSjzw9prlyaBNb1ZqTDzk8Q8+jEkqG7+CFt+7xxxx+ao27HI/v0M=@vger.kernel.org
X-Gm-Message-State: AFuF++mOvxIsrSs1xy9wQSLQHYDZit6Eu5kQhA1LJrAHbFGrenFLqd6t
	jLTZaKK17739D1Hv1tzIVnnI5zdKSsndqfgxfKwnKLSU9bsOQFqtt0t+
X-Gm-Gg: AYBFou15baLmt+Cu7z0O+fCMyyFiYXIMhej40N5bRpU7agcyMuR+KbLBq+8Jq+g7sGw
	yeql3AoVwq/4fHELmqnw6eRiZiabTZONYrAfJ4JKjDiWMz+z9T0voJSpAiQcVDlwCE+esWHj4oA
	LaiuN10SsS7NdGWYXXrPrqnSg75mxRrfR8uZvh2Y8mLZrbbnATGlnAP6vKWyO+n+N8PEw9uA9sG
	GVl79vH92XNYBZRhXOnadGs5XKr25fX2qp8myB6a1DZHvb+d/p6kbIAPHxgvT0qP+iUSY6/wn6n
	REdVGUciB2qJcw56EwmOacXWTuLMbC0z9m5RTY7iwmRRI5kmjTmAIXe7DjgT246Hx6V4uyCuqV+
	PgVs8rRISL+iAup4ox86/RmGGB1u+ZuHOE3JmyzwKobOB8IucTMLrmkvZwQPps2KId9WVua1B8E
	FDDy8OViJFOpg3ZHYSDtX1Faj+1jcqam3BMU7p7yxlkPYwKq/GEB6s7SoPGU7aLDzdmqMgKMn2n
	HBq
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr303543295e9.26.1788941320634;
        Wed, 09 Sep 2026 01:08:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm607453595e9.5.2026.09.09.01.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:08:40 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: haibo.chen@nxp.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  9 Sep 2026 10:08:39 +0200
Message-ID: <20260909080839.2297374-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909064415.pel5dilh7nrkxz6u@shlinux89>
References: <20260903075940.2089367-4-mehmet.fide@gmail.com> <20260909064415.pel5dilh7nrkxz6u@shlinux89>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Haibo,

On Wed, Sep 09, 2026 at 02:44:15PM +0800, Bough Chen wrote:
> dir_unreadable is now set from a second source (PINCTRL_BACKEND with no
> direction register, in addition to GPIO_GENERIC_UNREADABLE_REG_DIR);
> worth a line in the commit message.

Will do in v6, together with your Reviewed-by on 1/3 and 3/3. Thanks
for checking the i.MX7ULP/i.MX8ULP side as well.

Mehmet
