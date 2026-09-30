Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFEC49E138
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766955; cv=none; b=BFf6KfALMymwuKMZst5T7i8yg9f+yzZvOpvyJg13MbiBjM6Q9iLl0WhsJxT1s6YzpImPbDcwSEFFjSJWXQan0SC7/RSMT581mMQIIfEnHSsMr0OMTBWaaB0ZIN3s4sICmU/Lc4sY/x8zd8PWb0sdvCZE5hVy90Tzek1VZVG1nGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766955; c=relaxed/simple;
	bh=rSgDQXtkBUcI8Uwuh9JsK0ZtlAqY1r/1adpyEamAgRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5t6V882AxRMYL5K6RyscjjczBDZHliZDKd9pPrv7kDFCYdwULwcww/Gx67sFVzDwdUm13Ts98jY/bxMLZvEdWVkFHg6wu7ByFZHKeQCo4dqEanDYxIpfhmX1hvyYlrhWxT+QfX4umVhyFXMGaILyZ/1jPqmtqLlD2GepvYmUjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG5Y8CqV; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG5Y8CqV"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804c1728f9so4036944b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766952; x=1791371752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEdmlVadIcezq2ZsZ8/Ln2Oh6O1HspeuQRgFacxN4xI=;
        b=gG5Y8CqVFtyYzVCQ1rUxoCrfOKOLm4MfxBukYU4r3syS37rlJmLGTyfNBPfWBKh9/9
         udUUk2k3pJra1/yUJn11Z+3jODkFk6HlfnO+UkXcNuR7ZBzCNANwzhqI+yPnpN6ukoiv
         5KNs1HTGJoRT+ODUjXFXbd2Vdxibd+OWuKT/AniZdK+pOAhK6tKyUuABG0QOBNVWgVI6
         IRjdXS01Dj+Ff1InDAeZI0JI7y0avYTbzhJCUlCazOA331njf5NhrWLqD3sAdLNahnEh
         0iEk5fM72IiMyLoDO7bSJUnJiHt2yzGkIOiNF/EnB9jLCLpJ10/KgqjDB4ivKsUDfb+v
         rztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766952; x=1791371752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEdmlVadIcezq2ZsZ8/Ln2Oh6O1HspeuQRgFacxN4xI=;
        b=yTWShyXQbc7F1pStAct4dCbQgGQ1BtftijL9kSfEdHnfLT81fmFp0b4+NjVhwve+Cm
         WkV4ZjqrXI9sqOqOL7O8Q4FQCklDQ50TiHxk0kKexWagqJMIf6VZnvELPyBmWzA873Cw
         tweiPH1o2q6FFh2XQWvcm96MzZRAPBOekgM3Puoq3OOx4hpPTYtIeb2ZSaGAzjdFaPLZ
         Wb9n+Zz+rxZOa/+6UwEX1eOFAmNM1gWiHgg4b5bDPaQF3mtPaODVGx98ffF3GQxPr0Kp
         vHfXNvk8Gw+mgGmFdSAcuIE0vYiEL7l+VZuVVZhhgETCt1oKTwIpfjYPn6xegoBvozrW
         xVGg==
X-Forwarded-Encrypted: i=1; AKwUvBzVzWhlSsELU5v8qT9ylhjE20+d6a6p7P5LxgQ5CGazPtmixk+J8FhUTV/My2hpor8kVqiyvG9mh/giLF0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpOs7ZKCS+zYRsORNx1gHrrbsP78DJXCBWnFOsCcduepgdzJkS
	EOjz/YnSIBNXRQfLqjyYssvmXD+bcXJ4JpnCOtZoJxXv+3tjc1UMARPUEF8rmttC
X-Gm-Gg: AYBFou2jd3/zqHZ+67qeftL3vjM1/lsAiRpA/NNzm3knj3khjTuYxQiFJCAta1nv3MG
	+ha+7bvS78qlL/IMRijTdGjIGUFnC9k8LLRbYevO8Irtv6TLKDm9uBp8fAGaEiRdRiX9wR+ZiCd
	bfIbl76s7jyYJjcjZZVtv9bhmdJYRx0fpZNlAeKYzZSeh2Tduig8O5vHgXFJik1L+oFWyoeWNSE
	pSaHxbGsT2UBuYzaw1BcySY1IDM/Fw8s5M/j8AULcKpYzYPNskGbVoWWs2uip3z0mkd061oHhwf
	Bc2oIU/YHAZGcM4anahuqj5XnQBsR7bIq92I2SVQmZM5VtvVldwLMv4SFQsBGTQbJ2oEF6Ht35b
	M+vdwITDCHlYmuQNe5oXEX+jcGSHClpOmWMecsOR/XvRWyruzwBGsEvwrUGBd1vvDShnw2IQrtJ
	a7UyMfbwZhotKzQDpubOmVzvh92plkGIUXaTl+DM3xeQRXZijkcR2849srVve34rkNIaa8L39JB
	xGDcI8/c905rbWlV/tUO3lPTLJ2J7+gUsAG+IYxygXr37E+xPv1PSvGZJ/Vuhv2pyDAZ82MggA=
X-Received: by 2002:a05:6a00:99f:b0:881:bc81:e8f6 with SMTP id d2e1a72fcca58-8874c9d1e5emr866456b3a.23.1790766952061;
        Wed, 30 Sep 2026 04:15:52 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726c07f4asm634108b3a.59.2026.09.30.04.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:51 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/2] selftests/alsa: Do not take another control's event as our own
Date: Wed, 30 Sep 2026 20:15:33 +0900
Message-ID: <20260930111534.3782264-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111534.3782264-1-sammiee5311@gmail.com>
References: <20260930111534.3782264-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wait_for_event() skips an event for a different control with a
continue inside its do-while loop. But continue goes straight to the
loop condition, and that tests the mask of the event just skipped. So
a value event for another control ends the wait as if it were ours.

A driver that notifies a second control from its put() queues that
event first. The core only sends ours once put() returns. So the wait
returns early and leaves ours in the queue. The next test then
reports it as spurious. And event_missing passes for a control whose
put() said nothing changed, as long as it notified a neighbour.

To fix this, clear the mask before skipping the event.

Fixes: b1446bda5645 ("kselftest: alsa: Check for event generation when we write to controls")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 tools/testing/selftests/alsa/mixer-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 53a72753bb08..02136c436e16 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -267,6 +267,8 @@ static int wait_for_event(struct ctl_data *ctl, int timeout)
 		if (ev_id != snd_ctl_elem_info_get_numid(ctl->info)) {
 			ksft_print_msg("Event for unexpected ctl %s\n",
 				       snd_ctl_event_elem_get_name(event));
+			/* The loop condition must not see the other control's mask */
+			mask = 0;
 			continue;
 		}
 
-- 
2.43.0

