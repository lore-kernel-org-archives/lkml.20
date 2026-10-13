Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48F13955CA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878190; cv=none; b=Y9DUPnWAmwE+mNuqj0KZNhCncTj+M2ecmBHWvTFFNpLFHKYphUoc5RMguAAaJj/LHd+wRrEAAasUYEOCJcKqaP3z2SKLaDohB64J1CbIT4q8RMOkg/jBWyk3U6ISnZYNAphiggjDTWhu7sNNRNUMmPtE9jFedsgQmXK1C44o3QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878190; c=relaxed/simple;
	bh=6Hw6zOizikH4nU5MtOUJGtJVcNg17esB1LQ9dVjUH4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLGKmjiOlcI8NcgjSDg1J3TlavscQvMJ2J4JAnHt5sj3noWKvo+2TDw/4cDVNu2IuE730UHVObyGrkmBHUGtVdD+M7jJE1IF8ekb3K228wG3Xx8GrtTIIOVMF3JG2IftSKSL7ExCS/k2jpnUCbPj7a0AmS83Vq1J/Wz0MROHNvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=V6tzbRee; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="V6tzbRee"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e831e86ebfso13586905ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791878189; x=1792482989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jANvN0a80qAhabkHU+c1blDJzLk3XqzePiZeFwrI4g=;
        b=V6tzbReeS+Q8e8j+UVIysvotjKUF/OGHOMXq7HNsSECehnjjsa/A21Y4QL+SPKJ1gP
         BrlqQA66c1joyrdGG18xan1W8MRZxvsGHAAd61dwRQN0gX8AQCu7/+0VV5n+OnT6LFu9
         3+c03ec2wCCsVLW5NjIhkogAPj2KWsdzEy7EEBUnOz+bwEclsxB02f5vaWou7GON10j1
         mQ9y6lT5gBd36ZSJz2zcac2DbLOEyQwN83oWbdQFV81mLqxb6IBjgXfrXEDIO5Arxi8g
         xRqxUfYqerJ+1NMwlxkVqtz1PiGfToNMtzU+JnFRPJabxpZjfM+ATDf4QEy0zaFwOKKI
         V/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878189; x=1792482989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jANvN0a80qAhabkHU+c1blDJzLk3XqzePiZeFwrI4g=;
        b=qbrKYIAjdOhCILEnU8mgwhYzOG15/WXPhb4DJLwKX1R+6cj9ndb5MPDJJtJdeTM1Hc
         dBuZxmRuHsIncsnGOFOzwJeRlLqRoNvb4pYRE3ULY3lfUHuJP4wxiAHAGBnpskcJwiF8
         W4zzV0FbrdtSmOyzRZAs7RUsuxIPh506qwM8fRbk0/hrmtPjzm/GUtaU7Ja1rSAKnBfr
         yzsvXhP2VN1emWiizMdk2NRw7KDl/K7t7TmNGd5jz8hXlfTNdbGrdhYHMOTM1nZFT+tz
         DZmaCd4t5oJ459NWOS58jbKMElNIIihCsBtx4Vrn6xamyHPeOmzPcT7MWmswHm7xd8D9
         yp4g==
X-Forwarded-Encrypted: i=1; AKwUvBysHjP3QC+lKIGjwCK9J/TlLSFVVJdoe/I/4Myo7NMlcMcBoVN5vOIdm/i8VWyBy2Ufe3PRfBq6nSqGgk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYISHpyDan0JjSqBP260ntJD9jf4NnB+ovQ81WfPdwRFNcJYNAwy
	y0pUXCVogXQAwsuqxtiVHQcdNqVEb14Qkr2FXFXsCcL3BGAtZTr3eS+05ycSy6/KXrhuDOGverm
	Kjp60n+9C9g==
X-Gm-Gg: AYBFou3UOPjAW4iyay6uVYBUAjPhQ8cd9VKhBtlYyXN3khgsFWZXK8yWBlZTLFCLJfz
	y77WHMeFEkaE0Nwd2/J25ZEREs/uUfuqRTl9wbs9mGB5sw2EI+yeZUv97UVP1nLomd9LbA5wPeF
	0hMZNIKAxjtTobcuxSzrkx2aL1qhU21Ajqa+JcFTu/Qq0ugy09PKewhXygfWpKkxtNKBC87aic0
	ZpbNM2n5JJhhGhuMM4ZfWAyvx0BBAVxoUjGIMyr1wkp0N8wVwTH7op+/RHtuHFTc61Nim/S7iGL
	UFTkCe59zGPN1lqxRztwusENvY5zqsHrggewApq0mtCYhkiow13uw9Pov6KsPuuxFf0/bV5z3xo
	ZcK1g3N/Ia4twsNaoi2550JtEFsz5rBeBa7td0Lmts/YTyXuDQDMrkSYREZt2YNzDoOr08Pyt1p
	vT5OT9A3pAgJOCCC7qncQMxByTjxLIPRCL+yNGdkC4bt6sKlU20GzoqHWZqr2Uz5AUfqNnP1BFT
	9LaVg==
X-Received: by 2002:a17:902:e947:b0:2e5:9923:5582 with SMTP id d9443c01a7336-2e842bc0a30mr98712345ad.29.1791878189071;
        Tue, 13 Oct 2026 00:56:29 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422ba80asm52420885ad.63.2026.10.13.00.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:56:28 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
Date: Tue, 13 Oct 2026 16:56:15 +0900
Message-ID: <20261013075615.2940598-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-169209@kernel.org>
References: <20261013073328.2936318-2-yhlee@isslab.korea.ac.kr> <sashiko-outbox-169209@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ignored usb_ep_queue() return value is pre-existing - it has been that
way since the original c52661d60f63, and this patch only corrects the
allocation flag.  GFP_ATOMIC is required here because bot_send_bad_status()
and bot_send_status() run from the endpoint completion callbacks with
interrupts disabled; GFP_KERNEL was the bug.

Handling a usb_ep_queue() failure (completing the command so the session
does not stall) is a separate, pre-existing issue and would be a follow-up
rather than part of this flag fix.

Thanks,
Yehyeong
