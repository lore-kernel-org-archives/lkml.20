Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634077;
	b=SxwA4234Tcim0i1Lhs8EsWRl4NpC//fpfhMit/sSzs7ZjCf69C0XjtvR9oXs8rQfJnyu
	 m/iYjIBXRsd/VnIu5Ox2MfXJyL5FlEkYgrm2L5u4d4PBQ74blg80jCZpaCJpGAgqJKz/K
	 FtvssYaDYvsGi6lirn3nJcpeSGnKN99VKN13ScB2H0vgbpITAjOBnQ0nKnXfkOlDssvVa
	 drYVpK1HkCyw+e1V1qHfcJ4nUE0EJ5hdwbeGb0fwrwm9S2/grmtA0JA/FVPJnrRUaCSPu
	 dV0jI9eZdIPCRTYTOKvoMLUBc33+HJawsvRbFATDI2mHJSLKg11RRdXNNpm90OtkgxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7UB52tVNDDfF5HUvEfmsYcxjZsy5hBD2OO6zm5qdm2A=;
	b=hSBAUPGPzZkojv9auAwyLeh48GV+ra8iQJ7cnxcalsuP1carATNK2a/6u6V20Cm1x0y/
	 TdKESTcyn8VCbwIg+VFGz0hyLQxc0dV7u5EQflAZgA4KfB7JNtIIeCJElRec+UedIqWR2
	 PCmP3wcEGqKSuCAKuDI2vvtP+gkud83SJbDMDNk9TOuiAWelodHavqCQuhOoW+qF0Y2yw
	 PN5Vw1kx2DT/XDHa0wtLmcKlwFk6qtpRl9vPEgRxzVacWoTIIdXhuilRfXjXxddcRW5hR
	 /kpT3rPJoKNN0+bljjyyE3yRWDYTyWhEMC8Zl+/CYrJrmL4w5TlC93QDUk7+Bl3CF1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wszTJhyb;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E39607366B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E39607366B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wszTJhyb
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so2937836c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634076; x=1794238876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UB52tVNDDfF5HUvEfmsYcxjZsy5hBD2OO6zm5qdm2A=;
        b=wszTJhybx7K2hGSa67IFsU4dwnaBhboW5uoFNLHduVtyv6n+OZmw7RhhhrFphmmH6Q
         5zbSEoks6dUmnTZSn4Swhrby7gin7+lyl4Q1jFmUTIL59Onz7Z6aUmTXgmTpj6jif36x
         Lk2XiPgJVT12sal/76UkARbD4rxexRXn8mXsamfcw9+HfaZxpZhGWL0q0aJStmEXyDPQ
         PYbCOlgG1d4ohRHbJr6cvQR7l82KzKZFFzzsT1szW5bNWh+fVjhlN0/mB8jar2lsSSl5
         vLG9MhvDj1GojVwArH/lWw6QFbATkcKX2DAAKL4ouDErv1PuotXTZ7pORnqgWYd1/Ka9
         qJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634076; x=1794238876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7UB52tVNDDfF5HUvEfmsYcxjZsy5hBD2OO6zm5qdm2A=;
        b=sRfzJot+NDKNhvN/ExtPppbhiZqxq1n3XVI4o6BoWACEtVYLot4rqHBvOx6Tnqb7WM
         sy+/lksS4UGRZFh6D5tz2KfV9VbYaVKfCgDmnGqernTgddkuFMcgKl2BhZ/k551A5+iV
         dQNmLP78JeV5ZbuCxzgBIUmQ6g1d+K/CMJR9GFYnySccgyh8I5iwXLFuzD00TV3NunrM
         yuktYWbi2+SPeSA6Wi0jv2/8OD2I2oxHiVqXYcLNpyOyJxB3sVgp/JkvfJ3pTq55uxQU
         Cg9U6IQ/VZXYAWDMU+oJhVEVZJAoqvSCXyfDNohsaOd/B8PUfVJ495T13V1fi+DJRYEE
         ouSA==
X-Forwarded-Encrypted: i=1; AKwUvBwbnFnDPXRKjo6BDubMZ/yotY0x1N16sLkL77DKwq3x8UN1oYYl0DFLHYFE9b6yobqTimkTVedhdtybtkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+CDg9l6FQ+TX9dUuJgPLTkRNmjUipRUkQv8BYY9Ck1nVx1qCW
	m9ti6i//Jd5U3LfWC/drlF29IsPQ155MUtC4vioYRYgP/LsXLHfIEG49
X-Gm-Gg: AYBFou3zAo2LHAl6V8r/eKqn7Y93nJOCl3RwMUOKf45/K8D6NONPENWdbkuZ14y0EyB
	1vwLt9xkeAWZ/X/mGMQxPT7hefU4IGQbC3YKs7uOx2OlCdH2z4eVXPVeHDIEjQLL2YZw3bhESxA
	N7hVyfiwFMR06ZHB3IZVK9qpswIaCeIAGqZ03Ke+QZ8uyq9xEYvv4SwOYr7W++k+m2y7ormrRqY
	KVKMhDxWyZzymj2cFvJvvzxPnn45op0nxACD/RyWtRdlOrdRtXqEGl6QLKpojxE7WirJxNf/Duu
	cMbElpBg9fR5RN44Cjp1OpIDv6HL9K3R6dkb0tA2PW/EpmWMrmLY5fIcZiTemMT7qFa4IwKqAMG
	Uz/470pdQpfefSASn8Poun30OfqhfwNhbaTn86/2RA7wyk4kVlJ8QI8ZKj9iHvj1CmuiIMGrjjn
	p/1MpG48uxmwKN+iR/1F++YdbX/LB9/gywmz66KjZ8J5iwyAUN1poUl0NXoQCgQNeF+ocfSZUBG
	Ni+Hv59BAIhJaNyzzq2vxBo60cLD0PStP3pS5N2mNNL9xTwVtRUHDUCwRobwfqUAzetoFKZaB60
	LIUr0vPHzsgFofoTceBH+VUXz7BQ2wwwp1YRmm24LSXkxWE48oo=
X-Received: by 2002:a05:701b:2816:b0:144:e246:a0b2 with SMTP id a92af1059eb24-1ac6088a458mr15229325c88.44.1793634076329;
        Mon, 02 Nov 2026 07:41:16 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm60443825c88.7.2026.11.02.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:41:15 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	rosenp@gmail.com,
	sreekuttan2156239@gmail.com,
	tim.bird@sony.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: pcm: Fix source frame count calculation
Date: Mon,  2 Nov 2026 15:40:43 +0000
Message-ID: <20261102154043.2712-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87pkwn8ebe.wl-tiwai@suse.de>
References: <87pkwn8ebe.wl-tiwai@suse.de>
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

Hi,

Thanks for reviewing and applying the patch, and for adding the extra explanation.

Best regards,
Sreeraj
