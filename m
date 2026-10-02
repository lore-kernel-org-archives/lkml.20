Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755CE3E3158
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953056; cv=none; b=OrzhRoMG0M5uN6z4ooJ9QTbhDS3F+/eLeaZRrlznupYH59AlGvqAWTyP2yhd+iOcXYnCaIgB0yMC5YostkYBuiq7tKIlA2O3YxGvAnQvLLNv7pbnIigyAwYoz4T6l6pmGLgnVD3M1dWnSaOeKzoTfEsyG0woudkHE4cRa6Fzv/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953056; c=relaxed/simple;
	bh=rVzBsTW363J9DBMqRi7lrd/ji8V0IdYi3FlzxPji3ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EufPH9HLfv/hxOxN9OjiSYL+C1RmzZY5f4//dfW0XWr5/yZEzXGlMglRHbOHGYpvXsOyP2F4ddO7HcU0pw21yZ9iN+lxw9FstNl6YG4RYuJPWCrEv5Bx1rWS7KrxMnsLyE06EeFjpPk5iugjJ0IVC2QXB8sVCIPAHtA1jlVG+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzlYOcF8; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzlYOcF8"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da8so820773f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790953054; x=1791557854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sm8JPCWbAApRAMwGsNgfiFY0TBpYU88/gVEa2zC8pcI=;
        b=lzlYOcF83nUWmoFD9b/z2smf8UJ6IBKZcJb2h0HVp8yR/J0+31NLZnxc0j8tQlWGlX
         9JDYq1FykSU10sBKZnjHSYYmeHpj3hHzE0c2KwdIKcLBUNzhLh8VO3MQ75irzoNh7DlR
         YJNmzMzdJWc/xS3coP4lmzl0z/oEYYUQV8LQm/OnlBfHD7K9ilJuNIJL4D/f5U+ykzr1
         dikeQpA9l8PoVsK6sR5k/JE3GhYQHz/arA7EOB4XvUma/wesAd0EeA4K2EV3JRtbXIbe
         /9wimOx2eDJUYSXapJ0+rJTpyWpy4ubzd5KDfUtGzWGju8ZftynULAYgXHvdY9ZZt29H
         pBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953054; x=1791557854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sm8JPCWbAApRAMwGsNgfiFY0TBpYU88/gVEa2zC8pcI=;
        b=NwXk3wWFfGo5AklyyiwNIw9Y37GpFDoJzbsn10yyyUEXfwIgMtpqnytPEHC3o1bIBG
         ZVJfSg+f44YTp4QJI57kjkYUapTg6ub7HLtzwJGwFEDmZy/lErJ3b4EJw+yPjWvQmPqR
         /oKl2ZDMqLLQrY5E3t34rFf7XTycMisGRBlsJVeJInkts4BlhoDEvz2IFyN0g1M6Rbk6
         l0gRSfH/RJ+Wecv4oLjt57pndPHSlgLWljAAXcXZoYZQBeTuoUdg9GCgIdxmzcf1nBYC
         whaGKYcTA0bbmf/x1bElvjpsfNeg+DkEnq4yp39JGFqEnroAU1uU5Pg1P1LkZejK4hUX
         dKzA==
X-Forwarded-Encrypted: i=1; AKwUvBy8ULx1nCmJR2PHks9NSHGBG8WxJrlZ+vksWVElcJ0618CR+XhVvR8jLpAzqnT2RGmdQRH7ikEf9tv1OKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/XkVDzS947sLGx0uFGAzkjNVp6Ydue6OD/bbN1tUtnj6Caty7
	We6zDvEomjnW++RGzqKVuZnYZESeKujZqUjhRHJ1AiUb7jXeenDpu4Ym
X-Gm-Gg: AYBFou0xiowoTEmGodR3zad0Tftlw8ZtCL2NL+wYiAYyP71jKvnHqjyiksyzzDi0in/
	mBCO9CCXygmcqWQtbeEfHJ7mD/SU0TsHxXV4mSMrILiFKWahBWk5VT4DM8Aistj2jhOotq6W4U0
	mEn6/AwrME9BTHEeelnkW3hdPjncV4UthhTZmP+NDnSarovbUlqHS8QhujWGuQ22/u6+QN595YC
	yw/wBnrttHOtmuF9qg+VmMOFmNGoDBKeBMPawo8t2yl5ouWgcnOLfPpN0rnx5EYdpg/onAJURKp
	ZWXcJ0dH4/lPBdwDyNYFBs3CVtTwepVBOsC1ZhCTbvbq9JR1lc0C1uY1jm1Kb01FOkjuyxr3NvK
	LflXLpxuc+pwb1zfBOCpLd10C+KZuTrJ8AY6qloiqudMTzswr2+MADQHWTRis0oauKN8gu7/S5P
	m2nTAeuP850zLTLEWMaoYXM+On+dMFD1Vwbzpv2Zx3vr6BpJ9vk2ldiiUFVcDt75lSJ5PRApXua
	YEAKtqZkz9vE79REAa5TbjPel1gUho=
X-Received: by 2002:a5d:64ca:0:b0:487:8ba:8b4c with SMTP id ffacd0b85a97d-48b126feec1mr5682586f8f.1.1790953053551;
        Fri, 02 Oct 2026 07:57:33 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104d58sm6571986f8f.28.2026.10.02.07.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:57:33 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: dietmar.eggemann@arm.com,
	elif.topuz@arm.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	sh@gentwo.org,
	vincent.guittot@linaro.org
Subject: Re: [PATCH v2 4/5] sched/eevdf: Keep expired protection expired across reweighting
Date: Fri,  2 Oct 2026 17:57:29 +0300
Message-ID: <20261002145729.11981-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ac4671ff-18a7-4447-84e6-30d35df1c7af@arm.com>
References: <ac4671ff-18a7-4447-84e6-30d35df1c7af@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> No, you're correct, do you wanna fold mine into your fix and send that out?
> (I think it looks better squashed but feel free to just pick mine up as your 1/2
> if you disagree)
> With 1/5 and 3+5/5 dropped there's only the refactor remaining and I might
> as well send that as standalone.

OK, I'll squash it, do some magic and send it afterwards. Something unexpected happens,
I'll mail here. I'll add your Co-developed-by and Signed-off-by, hope that's OK.

Thanks, 
Kayra :>

