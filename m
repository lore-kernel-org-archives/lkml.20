Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387879;
	b=sZ19DtX88M7yo0hrU/tdlKQTGRk/LZcMAyLi5/pdDkse+RU89SqGVULxTHwKoi70eXKp
	 iFrEyILkKQc1n7oQsid8OdfvTpgfBupLDxaxuec1zk7pexkZQZT3+ckDGisZlnKZ8eqfp
	 bGFsSXIP0ApXr8e1wm5ktFUZ1K33taLgbMplBDyRzpky1Tuh4jFA/6cDxkALELnLK6iRv
	 Che1iDGmFfR4AitAWQ4L8it6tzlFfxphOQM0irywRAsxTPwV/Kjjuzbw3gxqLYuuB/nFI
	 HWWVGs9/oa5/vvoSy4/iy5MFJIunITQ4MJkGXxz7KpuwwUZ42VaNVjklakTyhZ/wkkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4NSXIHHAlrlnWpquuqYJcuGA/ysXonzJiU11gCiOoV0=;
	b=REPsXNfjMqm0pg1R0Tm6JQOSUrc7W63Bzd/CX8mdUbClgKAu/1XQxtRkhTtxOG1kEZcF
	 bjzYkhWjl6IKQsCNmLuf5Whz8uIyGWQKO3CR4pLKcvaKoUIQOnhd5Bsut/fpU7iPLMxMA
	 9CZoavXCy3h5QHS8A5aC5HUblG8LMXeC5YbDP2qHZ8tb57u3Q+ZS3I2m3qqNSE7/o6JYN
	 pFgPTc71nxFJqrewXOz/s212SR3QsfK+t/sTMo3J4xGxZtSG46r+oV9UQy01zWP/iOdfh
	 WY2u9zBXz2rcS2Np2pZtIhPSp4X/PO3JgXjtLvNZ5LM/xUoPpbOqr4sTtZ+X37DTBEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkIseqOq;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099C60A260D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4099C60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkIseqOq
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1426745a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794387878; x=1794992678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NSXIHHAlrlnWpquuqYJcuGA/ysXonzJiU11gCiOoV0=;
        b=IkIseqOqTOh3WorZtKvcSXdkAWviUdNa/2w+WVJ0aaVWd47QTEgB69MkdRXndYImEz
         66vLSOnif29aFvOTWsBI/c34lf9PalGndEq+FGKEM+L4gDWHtZmmbi0nusuxLCW4yEHx
         P7/Xr9C1xxZyA2lxn3408YkpQOdglt3kQsgM1Zoi640LX2YSYJAQePy1PQaP2G7j5JU3
         gRC4z16EpzgTMbFtwOOcEXB92pyJo9yhcx2O5WOLDCYCncOn9nBrgLySkc/RkZ9SedUk
         Ia2Y5KWTIx+du+gNz03ZnEewCpoAIt5F3N5xqf5CI6WTo+QJs+d7OUrp2ODn9v1Zu9Ax
         nzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387878; x=1794992678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NSXIHHAlrlnWpquuqYJcuGA/ysXonzJiU11gCiOoV0=;
        b=vD4pM1kXG2hXrTQ+jkksweE2I5fiXjZbDdJwfE5wq6vT0YHL3YvsFSB2UiWD1Ja58p
         Dalf5dCi5meCEOgKnMoSXojMiPiKk7Z4OeYzGdYSLLfCa9k3Z5XGGHHdztMgEWK6+ImE
         yupFl2F9f920bMwDNf0UNt+LXjoOE3CLXoYFRhVIJCiZyU7/OYNtcUJ+BNY2DSD0+mOF
         uRwzDb5CYuVQzp/YrOoNKaGYfZf6kWf81lOksOAwJ44d1f1J21VfV44GrxpwHbEGzYfr
         JJVTWD2mTaJnc8yrhPmBEtDXJwsA4N+kmku5ypeiPPAQ6wET9eHl0DUoVRpfpQfCKJ8v
         ZXdQ==
X-Forwarded-Encrypted: i=1; AL+hErHjNDU1evPLXcWOv9W6CoQSH7ZCAgzAsgni+H2ZrRrzLTzYiX5rBxA4ZpqQtu1bNXm4PZ+uFADgdPqIWmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z92wWh4VpCV6lqNFyap31gDKCvst9J2A6ndMKYcdmbiS2iaODHP
	rKhVYQ6s+KAU4CjhirwgiBbPjQG8fZ3wZuCuou0UJthsWSWLqlGI3OFTfIq+QmmK
X-Gm-Gg: AYBFou0WJkDT3pYLAx0hIL5BXFxpqyKU60yd/YiaaR+vmmhL8bk1Oh55NQF81pKj+vE
	IgasNnxHgsVqQ/f+izt/kSYiuZAs+Bzkb8AbkjaYu3o05mqIDNH2D2b13p0dzM3Q6UmAAS4q0WF
	NaTEpGg2cTUH181fsIsT52Y+mt9hwnJg4kqZ0QHN38VCI2H28hWIO/Up3fWRGrEM76bQ1ft0ywr
	u5HRVYfLJgACxRBj2YUGK07w0QOweMdW/uUvm8FNhwbX5t9AHpT6y9KglAWpUeqQeClVzWr2bxt
	zT+U0of3e1A7NT8m3EHi2bEITcgoi6SkMfTS0p+nKhQnqeOSD13WJvo/3+BsIoqCeBGidapS5K5
	ORPs4XsjFKKPNTmVLtoe7kVZGOx1MOXvv32/EKKzuBDaOyL7sePyfOucTYxBKsD13FGVKu4F5rZ
	AuXjZCwXck6M949zej+4chCHSgae09R0PcYJpEkzqv8wP90LhpLiIszkiEcEz9xjiJ3E3J5gnlU
	s0sqX130sZbFAgTFi6tZJjux4D4m0c9JE/W45iTgr01stE0C6E0pAMjRdeO7P4mhb8j4iZvpEf8
	zuAU2olXKMxn6UYe17SRWdrqEZa5i+Q0oScsatrk+EBqBU9TsTtWZwhjCWk5WGoGVVrEdYOSUAf
	00XWnodKnf0WNVBjkE0DYGTOEv3vVCd9O3f5j5wIDlck=
X-Received: by 2002:a05:6a20:a106:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-3f2fc99fc04mr2159073637.23.1794387878436;
        Wed, 11 Nov 2026 01:04:38 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7cede06sm1929924b3a.7.2026.11.11.01.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:37 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	ivan.orlov0322@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 0/2] ALSA: pcmtest: Add a volume control with event fault injection
Date: Wed, 11 Nov 2026 18:04:27 +0900
Message-ID: <cover.1794386073.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello Takashi,

This is the non-RFC version of [1], which Mark found reasonable [2].

Patch 1 fixes the places where pcmtest.rst does not match the driver.
Patch 2 adds the volume control and its two fault parameters, and
documents them.

mixer-test results on the new control, under qemu on sound/for-next:

  no fault                    all 8 checks pass
  inject_ctl_no_event=1       only event_missing fails
  inject_ctl_spurious_event=1 only event_spurious fails

The pcmtest selftest still passes all 10 tests.

Changes since the RFC:
- document the new parameters
- rename the control to "Test Playback Volume", which the OSS mixer
  emulation does not map
- add the documentation fix as patch 1

[1] https://lore.kernel.org/all/20261103011000.1012035-1-sammiee5311@gmail.com/
[2] https://lore.kernel.org/all/61df01a7-10ee-407e-879f-d9c1085a5d43@sirena.org.uk/

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 under qemu.

Best regards,
HyeongJun An

HyeongJun An (2):
  ALSA: doc: pcmtest: Update to match the driver
  ALSA: pcmtest: Add a volume control with event fault injection

 Documentation/sound/cards/pcmtest.rst | 25 ++++++++--
 sound/drivers/pcmtest.c               | 68 +++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 4 deletions(-)

-- 
2.43.0

