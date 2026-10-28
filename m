Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218125;
	b=VuSxVze+s1gLqRVYQwRu4GLgRLmI+XZjMiGoqN8jyWZHLyit8dIz0otcjAZdIX7R6CFZ
	 MrZ3ag49Uz+M/2NOTEHXgx+g05/J3ZQNsO+mV+nGPaNpeTMeXLJkI9TpZcMflyf754OJx
	 bkmWRie1b65zap2CF4kZLL06Dml0Svh8/ndJAJ9NC3UMrQ3KGv4WmkvY9rz0UiKjfM8/y
	 U0t6j8NHsTUr4dFM1CRatxxUSIks7ri26ut/n+3XU8UrdU4hIAkAIiusu7ajzZvLBNSzn
	 iezc50zaXiUBOUkcdZa4Qhx8F9nt3NLUdNQWvWT5TuC/D6k08di150CKgFEBg3dlUkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d+5HBhkNFeyDx3qyEQJ5AhFw9+RggXPzV0LcOtob1yU=;
	b=W1j+Bwh1kuQ0A1DqJrKcBcJCnLJ5DR/UaTF/OCO3zQ4DSCxCwl5gwEHwiVjwLqjtZkW4
	 hi//kdigmEdTI/N2DRlGA6BCy/HxIMBrgDP1/J7NNh3X/J7on6CMA4rAJAjiRgm+grjFx
	 ESV+lh0ANS2GNONYB/grylMqfjuI9Spthx13X0zYVaoJLAOD5yIdA041OEftte00J8Emg
	 cR1IaOwMRNJhp/T7iLSOKOR8Tf3+imEKoEJkCTe5Q5G2DLqJSaJrjSJEoTYuwPLCfBqKW
	 1BvFhYhwG6STMhNuQI6GGw/8BFhGtvM09CsaQ5FSRyliaxzpaO564/OXiRDgKJWn3QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uar8ghj4;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F318D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F318D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uar8ghj4
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1106771f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218123; x=1793822923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+5HBhkNFeyDx3qyEQJ5AhFw9+RggXPzV0LcOtob1yU=;
        b=Uar8ghj4+6eXnxT1nKfQnOY536xiE/FG7IlKPVu65A0nq+rzliG5J6+NlZQTAB/BvG
         Vaqd1GbhFT1CMQ6rptk016vz83AF2tpHnNsZBVWmUsadlVjPJrR1pGCF9QKRTX0C3rch
         YIdT7YsnbrOuwjJg+Os4TQ/ilpUCVMa+ocFLpBd+WWMf6OClrcCyJ8ttkG6SU9DaE/wa
         sc1orZyl7rdoV2fV04amh7HK44RXEPFHvEyXeZ3UjnQoDN9eX1Cl7GFHKuc43jn2FuTM
         p9WutA+9obT09wdPj0hMDnLRxOEtNV1ppsn7/b12lQxrT60CBrNjXBldiefo2J/rs3DR
         72HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218123; x=1793822923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+5HBhkNFeyDx3qyEQJ5AhFw9+RggXPzV0LcOtob1yU=;
        b=fwg8Ef0qbDpnOxgmcHq6FC10GFP6ouBdpKUB6byLrwPJbeDelEBQyW24p5vuCheg1l
         cnDjPAFNcAN/DLOhm3ZodNI+y4l0pWYlpaaWROXh0AiWVeXhdI8JJyOsS8M+BWz+TOlh
         1Fxfjs4NTPPvaex95L3FGyXNwRtvK0A1ryMqpQwef/GfhcmqrqF9IkPvpQG3mRwJLdNv
         lIozCwzqoz8sjbqGOspthnyTz4ivBTTmG0onv5ZVO6LkxZkORGXQ4WClVymoWbQar5HK
         4zdtIVMC+5DLO0u+01acA01glwWOs514J9EVtoKSZqcDR3w1/+fN/mhX/ZkSrOO7kLYu
         cjSg==
X-Forwarded-Encrypted: i=1; AKwUvByKMo1FD40a6jUoUS/J7qoZx5zorXVOl83EtL2rV7m9IIUq1D7x+ocaeLpGn+O8Fp/UClAUEyXps17/aD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaXyDraJpXqRhVb09sw/o2GL2VCPyEGYOgwH0XYZpjK0eJI+QM
	LbgfDusTyyM1rTVplhxzy2PquM7ehBW9NASbrBXaH0RnkCK9Akejwf9C
X-Gm-Gg: AYBFou1FcFU9PCF/Hg+k+p2JU/kHS9XUBqPbDFAPWXjp6NXrCsyIkn8xVEVzttujhHL
	5iwR1IaSxxUoWGXI/+o7LM+tO2XGMpOGHoJR2eZV4cAKy5/LA0BEIw4Me54hbBynMB8oHpor7FD
	J6KEdUw8yq9KWS8e1c7TP9ZUH7Fz3+LeSg0XF8YdzJgWc7lsC8hHjt2hificTP0itV38ffJj5kD
	2iD8e2dQBxwxzzBHkeCjqugtj2Wtf07FVdDThcvmpUI4ZF0NMs2NTosHwOluEIikwf2eIL/3s+4
	5bITwHIZVO39EcIh9JWeeFcAdbpeksGMpi2RVgMdok1KJCJUrcQ+16S3g+8BrYQnOzpwiA/47LF
	1slXaHS6HmM7PDUt/GvBfZWLTpyXANsupXLPN9NgqwxTujQTgvw5UC1Trn2g/+aY13B+OBtSIfC
	qlJwtgOaElvrNBn/Bdz0iH6yn2r1oWEoXzZQAbw3FjoCjWgP6ccVciWW0rWCCOKmRAIlno/kapO
	iXB2GoLE2MVZaw3vcv9Tc710j6975I6k6u67epq9I4ifaFpY/SbgN2KhjBbkhfMfL6TMR3IhDKA
	ZLqnWtpIhtI+1ChPrg==
X-Received: by 2002:a05:6000:26d1:b0:487:27f9:834 with SMTP id ffacd0b85a97d-48e5d2f9845mr8356353f8f.41.1793218123270;
        Wed, 28 Oct 2026 13:08:43 -0700 (PDT)
Received: from fedora ([2a02:587:85d1:a500:5135:1deb:a9ab:fb3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm30134320f8f.4.2026.10.28.13.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:08:42 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH v2 0/3] HID: Replace deprecated create_singlethread_workqueue
Date: Wed, 28 Oct 2026 22:08:36 +0200
Message-ID: <20261028200839.202670-1-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
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

Hi maintainers,

This patch series replaces the deprecated create_singlethread_workqueue()
with the more efficient alloc_ordered_workqueue() in three HID drivers.

Changes in v2:
- Addressed Sashiko bot review regarding WQ_MEM_RECLAIM misuse. Changed
  flags to 0 since these queues do not participate in memory reclaim.
- Fixed a critical format string vulnerability in hid-haptic.c by passing
  the format string directly to alloc_ordered_workqueue() and removing
  the unnecessary kmalloc/sprintf.
- Verified runtime behavior by compiling a minimal kernel and booting in
  QEMU. Confirmed successful initialization and safe HID descriptor parsing
  via a uhid fuzzer. But needs testing on real hardware.

Best regards,
George

George Karagounis (3):
  HID: haptic: Replace create_singlethread_workqueue with
    alloc_ordered_workqueue
  HID: elo: Replace create_singlethread_workqueue with
    alloc_ordered_workqueue
  HID: logitech-hidpp: Replace create_singlethread_workqueue with
    alloc_ordered_workqueue

 drivers/hid/hid-elo.c            | 2 +-
 drivers/hid/hid-haptic.c         | 8 +-------
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 3 files changed, 3 insertions(+), 9 deletions(-)

-- 
2.56.0

