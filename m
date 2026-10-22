Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667574;
	b=zmuG0ZmTBaqCAkmZf292dSwqJJGksxAgxaJVchIUoaazpwy/4AwcDPQfcSiiV0xRY6B9
	 6AfGkjz7S5TtIWFXi0wLk8C1MXbcSbl1zpJx9tK2c2JV/Mczt/uq/oCx6CI9vVgELu9rL
	 NfH8nPhBuIaHeEDMhWjUUydCwKSMOLAYNWj+en0zxj1rGKLGLVi3Sjb0otTPPNkqh6gsj
	 T0EVbw1AmhJV48MgHNBhhAb30i6cn5ieGYeGTNjMlq31E6fnaQuktmHhn7zvMTng3qvcW
	 nu/cJeuR5LLRjbAEgXDzUWdcJjIvZ3KE4VHz3/GhLwwqeGrUnFDcES2lWxnYlYVGA3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GgDo4vP1xHG06cdv66t6KcA+DO/n1085uQpIt3C0Ugo=;
	b=za57HIODHf7X9G4eUN45qAWvYUEeouDs7L5Dh63TuJJp9X64RLGfpcuXgQbvfLdXo5HD
	 GJhRsxtZDjsDG28QfiNe6OsevtWQKsJtC4NVTexF9OthMyM1avmRQU5qYSg6qJzwnphC4
	 cD3CKp6dj1kUUYFHwZdbvrd9omy3PePWTIf2UND4M339p7ChhwPohl6c9FULesaLheBqL
	 kHnG4vIsZsSrlGeKP1xRCnVfKLYGDGCXBISlBuZu7IJ2A4WIll4WpamGMv2oqin3f7Gh9
	 lQtzu32u8eiY7YF9rBc9CMezJ4rOVa4W4kzTouxM19dzEWBEsDFdaaTz3Sx1pvFp8ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcTQ4KX2;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5A6606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5A6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcTQ4KX2
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-368581df789so953681eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667573; x=1793272373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgDo4vP1xHG06cdv66t6KcA+DO/n1085uQpIt3C0Ugo=;
        b=ZcTQ4KX2ntDRRIv4SBZYFcVfL7jnVW4UQvhEXGWiWO2WaAXbf6L074aFxyEF5iD3VU
         4TFuic1S+pCJGiSI35lB4I7yYkRHGoOHkXdWSQQR4U3pV/n4zJyPtm5tJ9to/ZtLygIL
         le71bgQxKUPJ3MyAo6g+jM3qtoi2NVbf5Tu1U4XLU3wq22zUyKosor89B0sLXvg0yDIV
         3DGnLQGNFIpxfp8p3/AE3QP52gMje/KQmxEVfnDkaKCDVcPIHw+3dGzlspUpR5Wj1XX5
         GsY/RV6Ly2TXnB+77J5z05vj6zruUmcCqE0FNG9s5P/kBrLI+wnh5D1vQfOLRbScC5sV
         x3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667573; x=1793272373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgDo4vP1xHG06cdv66t6KcA+DO/n1085uQpIt3C0Ugo=;
        b=poBotWUHeNHlIsl0mh5rQ3L3o7fEVgvDnuwFHE1p49zXEXujwnKsIuSJoQoYd0Rxkb
         c6JDZMTyY2k9y7cphe89BTP5ulkMcsfqd4YeDE3SkcX3ihQa3qCwD2j9rRpchHfbPXFT
         2+HBxyb4Aru9qu5ybVDLDIkqtqyNQQTZXZFWNWwugQL7Y/4+6VPMHIzVHQKRuCt6dKID
         VGy2r5eLNfreobiw+49Igl67nDaQC4V084m9UPCGRzNsoHCAbc5H1fcVdBC1u4HsBU/r
         5WTC+q2+G7KaIFIZ3sw7RxrkFAMdYes6y02i2tm6FrKxDc0te/5imICW3xg1P9UStUfW
         39OQ==
X-Forwarded-Encrypted: i=1; AKwUvBzas65lh9JAd0UlQ15BLljELIS9za714oOoVepc7H27oKAfFdj7sw/9e8/Noi0TD+hPq71ou6fC2mavXog=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcNkELNXJzlY/CYrNsjwkR1+rc9EON3QL4ASoQ+FN5Vi+GXtKA
	GkHs8JLq9JL2OvaNGV3DULym1HL1zShK+v5xFzrLD6FYzFdzNew16zTY
X-Gm-Gg: AYBFou1hRiM4Gl/Gf76u6Q9W2NNpB/uIxE+x+eO5G6P+JHoC4FJ2P5u6nvugza2PPW5
	LPDNttqxvGAFg0v/4/7B+TSe4PFjUQYvQQjJmr4xZFSa6f938FgBUtfmVN3vO4DOAtBVhZzhdUk
	0oLw2FmPyhu+4XwFqUfFO5dOVITXlceVM7ybA9ybwIVMZeyW/5b1mtET6Xt9asOYBDZYuII//QS
	6aTtJtjwpOMjMYXytAOHp0SaJwWx5csT6L6A2a7ht7nfZ+jqTCl3P/4SEmOSAw1KvMrzPbNzeix
	zjAONLyIphH/Vw6VJaWmXjlQZJErlTHRUTync54/zcYE/cqtaTMMD7mgeuCzXwrKDJVcKYwuHU3
	m8tXANo30W0D+M1FJWZPI6m2bIvT1M2OE7vHojKzLyXQ0xtIhlgRuYHs6SJT4ogIXbHIACvm7B/
	7V3QOt/+BKrMHzs60VGmeBYFJ6EkgVEt5JSQa88ilCEyTXsR0qVgENOcsfA86Nhxc+N6Esoe6ma
	LUPlTMPRNs2z4r1mr1BMYEGPajWzz5CsghawdXWwNY1TQJr42I8PngouwhQsPwR4tysFItDNS2O
	RotTCjFbeF0+QoaowV7CSjWtQ/KRlH+jwYMiiLA9Wj2pd9TNGd/PwlmOqFZBVL51bjrkqmWBMQJ
	+EbY4MSoAmeFM
X-Received: by 2002:a05:7301:4392:b0:35a:3b98:b428 with SMTP id 5a478bee46e88-368af6a28c6mr2581832eec.12.1792667572921;
        Thu, 22 Oct 2026 04:12:52 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:12:52 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/3] selftests: ALSA: pcmtest: Test error injection and pause
Date: Thu, 22 Oct 2026 20:12:41 +0900
Message-ID: <cover.1792660433.git.sammiee5311@gmail.com>
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

The pcmtest driver can return errors from its PCM callbacks and
supports pause, but the selftest covers neither. This series adds tests
for both.

Patch 1 moves the capture data check into a helper, so patch 3 can
reuse it. Patch 2 tests each inject_*_err parameter. Patch 3 tests
pausing a capture stream.

Tested on x86_64 with the sound/for-next driver, built for a 6.17 host.
All 10 tests pass in three runs. To check that the pause test catches
real bugs, I loaded two broken drivers. One keeps running on PAUSE_PUSH.
The other restarts the data on PAUSE_RELEASE. Only capture_pause fails
on each.

HyeongJun An (3):
  selftests: ALSA: pcmtest: Move the capture data check into a helper
  selftests: ALSA: pcmtest: Test errors from the PCM callbacks
  selftests: ALSA: pcmtest: Test pausing a capture stream

 .../selftests/alsa/test-pcmtest-driver.c      | 167 +++++++++++++++++-
 1 file changed, 158 insertions(+), 9 deletions(-)

-- 
2.43.0

