Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658023BE621
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255310; cv=none; b=pawdv2R5JUNMYYlHLJ+giAh+yFuPsTBp6B+eMZcqiKOmusEj3JiTsVjde5OHshl8DB8J8SnaPZHoIwfZC8msULjlE8miQnbYKSh02kXomS2h8+nRzAkO5oSA3v3mUzWXWUxmmvyjxrnv9yQTSuqLHdHeohCy0y6RAO33fZHzT3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255310; c=relaxed/simple;
	bh=f0oOwJ99ASBwohPnUw6E+rSWJn8E7P22P3UNI/krsOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBjXwDztnbqmjOZFvOZLtXQwU9hWU3V15HS+pDchexlAgspP9iIFr8s/i/BK1GJm7KdF9F7x4UuIGnv5CfDEBYiNuoWVq0S2MvVvu4mup4DcJmtC6nqi6ktqOXl1R9prjsKgeX824fPNFMoLLatq4NKEPu5P5baX97fb0zqf400=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaqPQQaB; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaqPQQaB"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-918f75a68f0so13557786d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255308; x=1792860108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJIcl5oLftMCiRZNmyVUnJAZje8wxQdTARXgo+oxa1E=;
        b=eaqPQQaBtGDG4Hzd2VZQKPEnLDGwTroNn+VSySiQssXijYvMQmXTzNeIgSkJxWK2d3
         PbDSaNgAagAzegi2jRxPuIHJ4LPUwpA2EA+aMJgZHDQbzi2BpFjz9a9xVPWIR0sW+O3C
         A+brrb1J15bXvwwugKD+DouyK5VjA6664zHiwsXeeQDygIxntBTwU24M+owZHOe5aQwq
         nOun5yHsz0zeYJE3sxRQBrGIq5YPOW1vgqX58VKuRevXLH/8hv4b6bFCWHzo/cVR8XDw
         gXIpsqwoRG6WzSiFrEEhLtZzMFSmEVuN0pbRDM/ReQjKkRm96Sf0z9tPTdVGrV8IK63L
         nICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255308; x=1792860108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJIcl5oLftMCiRZNmyVUnJAZje8wxQdTARXgo+oxa1E=;
        b=noNFScr4gnmCRFGE/Rw/YSChKJnB8qhLWHHMlntL6/aVTJlPEzIwWAjESWswJL8X7j
         02AJKUR3CxDoGUyfqyrXIDFinFlXUu17JXpkx+6Db+t/gvtrdR+rmew2mnXRH/LR51/6
         vgG2LqFwnXIiQGuLUcWCEgB6IoomIys/vg3PnUMB2AnHCadiaQBSxnGUemPGc26R+bJI
         CukvjNGRFZ02UUrsTUsBnbIm3Xq06p3ol7+rrJpJtKOcqmIaaSpvtHE2jCZCX17fmYam
         dZikE6JjatZlpLNhXQvBvghRN++RVRBv49oPQDi3mMfqlR4cHvCAIzqTRALUKH7xvmws
         8TRg==
X-Forwarded-Encrypted: i=1; AKwUvBxUst9V+/do5ry/D9Eh5W/kD6xovNvjtHaMZXbknAkJQo+LicfV+pKGjTQrR+XaQ++TY4szChVeWyTW8W0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLpM15W14MK6PQPJ/+bmh79l3ZPKnWzSYIAV/mOg7TKU7DNvI+
	pfo7ayttfk7wFsl13C25/GapR6YSyulBpI/qj674vzfOU0xLUntoqTDQ
X-Gm-Gg: AYBFou2HPequw2F6XonCn9DaoMRwmv7T6tzdrCkWCHTnPMvfmCkkg7Zg3H28VfaKCpn
	lMubuxK3KFkoHuJZcSwWKnDgC9EAYflcH30LXtzzd0JkJHb3ZRVMIjgf9ly5JVF74gj1fTYqB22
	tA9Kad+46GcTWsuRC5DZlgJiMjUahkt9COQXuhKED0cNWPq1QmfK39EzI0bzOoBcz4+q4rBD0nq
	Nej1U+YsxtiNH32LuXpsub1p8Q/zdoUnW5t4j4FgNtUlF7mbgXmRu1CO9gbz66m1Btpj+oyLMb2
	Q3zKXFVDomg+ii1IZAXgRKKPcb+WPuxzmurQ6eNXvcuxpQ0+GMXDqK6UwVw7jA/jer/Y/jL5hJJ
	/eg5M6EeuNxJmTfLjMeWtpg2lGmeC2CI5U0FfkvHvVQ6wKUwVEu87D8orbqntMxyiIIk3IzwWMp
	gbgi4OKvQxrhW2v6uBvEGE3AVF8dVHJT1Xus60/zAJnPdTF0QgYIq8+XX8wtKIfi3E
X-Received: by 2002:a05:6214:3b89:b0:90c:4422:84d1 with SMTP id 6a1803df08f44-91bdf17e317mr60816536d6.30.1792255308456;
        Sat, 17 Oct 2026 09:41:48 -0700 (PDT)
Received: from beelink ([187.15.140.245])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcb8c4adasm51061296d6.1.2026.10.17.09.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:41:48 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v11 0/2] HID: multitouch: fix haptic lifetime on delayed input release
Date: Sat, 17 Oct 2026 13:41:37 -0300
Message-ID: <20261017164139.1791033-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v10 review found that the multitouch slot setup ran before validating
the haptic class and selecting the input that owns FF. This could set
INPUT_MT_TOTAL_FORCE on an input without haptics. If no multitouch
touchpad input was found, haptic mode could remain enabled.

Patch 2 now validates the class and attaches FF before setting up MT
slots. It selects the input where multitouch touchpad pressure was
mapped with gram or newton units, so an earlier multitouch report
without haptic pressure cannot take the sole FF instance. Only that
input gets pointer emulation, total force and haptic pressure
accounting. Haptic mode is disabled if no input receives FF. Patch 1
is unchanged from v10.

Tested on x86_64 with W=1. The HID multitouch module compiled, and
QEMU/KVM with KASAN completed 10 virtual UHID haptic cycles and 10
multi-input cycles with a non-multitouch report before the multitouch
report. The tests checked FF_HAPTIC, effect upload and playback, HID
removal with an open evdev fd, and final release. Two negative fixtures
had gram pressure but either no haptic reports or no touchpad report.
With two contacts, v10 summed ABS_PRESSURE to 30 in both cases; v11
reported the oldest contact's pressure of 10. A split-report fixture
placed a multitouch report without pressure before the pressure-bearing
one; FF, INPUT_PROP_POINTER and ABS_PRESSURE were on the latter input.
No KASAN report was emitted. Physical hardware was not tested.

Base: 58161ead29e50d70a317ea26b472e0c7508e69da
v9: https://lore.kernel.org/linux-input/20261017140332.1480375-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  HID: haptic: make FF creation the last fallible init step
  HID: multitouch: give FF core ownership of haptic state

 drivers/hid/hid-haptic.c     | 161 +++++++++++++++++------------------
 drivers/hid/hid-haptic.h     |   6 +-
 drivers/hid/hid-multitouch.c |  59 ++++++++++---
 3 files changed, 125 insertions(+), 101 deletions(-)

-- 
2.53.0

