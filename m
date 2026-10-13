Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646425304B4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915218; cv=none; b=EGADFmebbQJcmMCjVZAyJC3IPnVc071TuiAZBWbcXLM9Bfg+NC+nXO4t10F/f3RncDQwF4/IRa2KbGhNBGCiyk8RhnsJpC8PBXvseZb+eRcfk40QYkDAzFX1IUmmn1moyBSRDL77b5lf056VJ8szT3OQq4uf/5FkCM1bESf6/yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915218; c=relaxed/simple;
	bh=p/LeoY8oW4ZcMNr9MNsFO8YGI1ZLRh8OYU4+K6O6RMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nilyc53/xDhz9i5CqCr3NEhYHzgrjCWToErVGMX5JOsEdI6KV6pYG6kaqnG374QtrrJdhbLOCFq8o8kYEuTC9KFf+ypQxP8GeDifTevxb8LkxnwTokD8YOWACkDr9+EXy5eEpHmr6IJvQlO8CQx40+meFuCqbnsPnl53e9FJTZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=YMaghwkW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="YMaghwkW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-85377c8bc96so1402580b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791915216; x=1792520016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VhuK/BYJoyJDHlMffiVTc+pqt7ZYhMeD2kIg//kcPM=;
        b=YMaghwkWir7ydsrEDWXUDqx0UgwS0GpOsL/wD0jzcGLiBCpKfz7/kgugEb5hD0manA
         bR5Zhtnx2umoqHQMh67dJwQ5QBzWhqpAoqe5x1588Lxzw3hNlQxL1m3oaxjLLg1Rf4o4
         qwJFqLyNRQOvu6B9gDeSMzEouj6rEbeJjLL2Vhb1gdfKeyNazbYCoZRgFXkrEbUrebu4
         BCRgD3NFDInVz7R0rthZH8bzTqYaDtwhroIbledyliLL7lizjoIDKhK/eI8pY/iLEj87
         JZJSumfhRwADNTE8c72Tj8pl+o9xDSJDu6FUi7CZSFht+N3kf8a0DN5lxDmITkaXxslh
         kjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915216; x=1792520016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VhuK/BYJoyJDHlMffiVTc+pqt7ZYhMeD2kIg//kcPM=;
        b=FFjbIa0VZrpY39uWglP8+IZjQwW8sqLWa3FqcBZ1UCW52Ku2LDnt6Y9rB6pzGAf1Oa
         vb5y+E+KLq+k/8PGwFILZg+qg/g4bLSpUIfjpCAwyj+bE83adl+ZsOX0tJAjzyyaQIV0
         7wZWFPwfyt538G9n3JB5VyuL18l1Tb/JVk6sgV49D7y+tYWQLWgXPc7q5lwEdsTAekTy
         6DQPYSF+MtZcYDWPvWmQHlbCdhg/G02tXO6T5CRhe2GhKxuxFAj38av7yHthGnj5la6B
         V0/i3ort8o33c8UpJCkwbsW1EJES55A0VDGXe1RUt9kH8iqQxLzXgbIW58+Y3ThZxxmE
         Eqng==
X-Forwarded-Encrypted: i=1; AKwUvByhRRLScDcgj9Kl5y8x+EI1mQTL/MSToF/Fqb/YoNJkfwI53xH9kZT4q3N+emBIwh7ge3755dfvvF7s1G4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh7SFyjbFw3B/NMcXCufMNYbb+3mYjM/9X3fS95dDDoPkJmbtq
	pyun9F1mxwpTazHjDHJ9Ott+9tNJqm2u0WI3RJlC5WQtT/fZjlUG2qkQISF5UrdMAIc=
X-Gm-Gg: AYBFou3OF+XJiwCy33fctVW6HMJhYoOnG5p3o00dSWj9YBNY2JBtyIqRNpoY7t3Kwt8
	pWO53IcllN9zPK8ri43jqcBX278n/3j9l9z4grzJKpl7OIQYmr1j4XQw5xINctbdrHLsSXKv6ZE
	GoKgCEVD5jvWyGu6sKRtgBj+xAwC/eUU7l2Qd+afbWIOsgBIPcJUrLc6UfqjSp1uKbNB3UVlYYD
	4ry1x1rNrxHNP+MSUeWl6feszfEQGpJJG8mwfWnB509TsqYJOQreyomLKj5YgCtq/iZb8NXWJ3f
	k708O5tad9fFmmIz1AOnNpeak/M65ibZHjADzFcq56pGZmcHu3RgUJAr2H8qXgMdMmRjkBGlZtI
	VhrzOS1uPMWu6BDGT4B55+5JsWq8q2YYhrl8ya6TjCjYvCxT1fUoyjnNlRjVcxhlQL1go4QMArm
	tsHVNkWC9t/T82DnA7maNE9O3zhYFvkPShwgm5uPsy0aPq2L0FfrZl1I4WiJeUFHSdr7gMe3Gm+
	nEyeLdoC5NDlmqvu93nVZXz1CTT/Vc=
X-Received: by 2002:a05:6a21:483:b0:3e0:da23:874e with SMTP id adf61e73a8af0-3e16bdae7acmr12155970637.21.1791915215614;
        Tue, 13 Oct 2026 11:13:35 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e082e4sm5923184a12.10.2026.10.13.11.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:13:35 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v2 2/2] scsi: mvumi: reject an out-of-range handshake frame length
Date: Wed, 14 Oct 2026 03:13:20 +0900
Message-ID: <20261013181320.3421771-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-170275@kernel.org>
References: <20261013173145.3412863-1-yhlee@isslab.korea.ac.kr> <20261013173145.3412863-3-yhlee@isslab.korea.ac.kr> <sashiko-outbox-170275@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the re-review.

I answered the endianness and handshake-abort points on the v1 thread --
briefly: frame_length is a native u16 that the driver reads and writes
without byte-swapping everywhere, and the error return matches the existing
checksum/page-code paths while this patch already replaces the infinite
loop with a bounded rejection:
  https://lore.kernel.org/linux-scsi/20261013173536.3414059-1-yhlee@isslab.korea.ac.kr/

On the two new points:

- READ_ONCE: v2 already compiles to a single load of frame_length here (the
  bound check and the checksum use the same register), so the double fetch
  is not present in the object code.  I can wrap the read in READ_ONCE() to
  guarantee that at the language level if you prefer.
- allocation sizing: you are right -- max_io and the cl_in/out entry sizes
  from the handshake page feed an unchecked multiply in mvumi_init_data()
  and can under-allocate.  That is a separate bug from the frame_length
  bound in this patch; I will address it in its own patch.
