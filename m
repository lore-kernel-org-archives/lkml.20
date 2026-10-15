Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769ED3B6C09
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107221; cv=none; b=UZRRKcZw47gIJB3vd6ci7OFSDSaHZKLe1EYuoDbO+5eRdsTMwSYP3iANINxl3cJmeWpEzzFzhbnTeiQFnrxG+LZImYFsPrOyTUFJCaIK6hfUlhY6bgcQ8YtPHCCx+5Ub/iIRKXxDvnVgQlJtD1bte96RnPvGLQEnwi+iODIeVA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107221; c=relaxed/simple;
	bh=CNPsR7bzQDLmgfpvT3zgzovzG/cYekzcy5fSLl9hrrg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BORF0XqVj8TNl0NvvAH63JqgxZK8NwxitcdsLZzivIfNZwFoBarTfATZrQeT4mD1U6hZCwzmP59qaoykjQqW+9k21xA5YGkJLowUSfA1DHnAGS9uykPqKraLWaRQWqYVp4uV9egOv2ZmQnZRshGDnkUGMhD61SryWhyL1RKgyos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Duz+gkKS; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Duz+gkKS"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6d290b10a35so2286308eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792107218; x=1792712018; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zdD17TQF6DaYFKwkt5ECBqDYHDfoAehq3WTKwKTpVWA=;
        b=Duz+gkKSP59wp634+7Kd8g2EIWVtABdIwSF9baB06xqJ0P2vG/WEsAujSndwtsMF2s
         kedVs990V+hpFyLk1IUIpof06mUmr2FhqqYzRcmpHeQcs43mJsvDRDUi3hRacMklpAxq
         DKHMhL2DuieoQhg3T//is8T+RF3evY8mEWGwNRC+r8VUkeBRscoaP3R0avFOS9iUpV/v
         OWuLpRlEu3/YJDpUkbMYbwD457Y/DJTof5k+cQfm+eKvceOmYMKKeZHjA0/rMr/PEAgn
         Ew6dXVDdPhNAuZGmJnIkMDSa0RtvhrWzygavPNjzRpOE1AMH61HK7p8eHR2+NRXA+MoM
         i3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792107218; x=1792712018;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zdD17TQF6DaYFKwkt5ECBqDYHDfoAehq3WTKwKTpVWA=;
        b=Zj5Dcm1DAcuqKxMtXsw2k/DUFo4qgKgp4TzMHWeZrLl5eq7qgEew80tUQ7Xk6zpb3l
         683iJPVxOpeRtncBDVihIu42fOK325IVAp4LqlopduavidAHPQL/6kuWnMnFSlltij+E
         3P7MolZF3UmmhrtFh3mEXLk6M3pOaaAHhhiVaWizocsgmrX4NtWl65lQsC/iLYaIZswa
         6uVyh+eX7maFLjsLn/U5GqPfMYx8dMm9NLDuejufQ9fTpvASgfcfFs1T7770btQMs2xj
         2CemVlUNESgBUZOF1KAaTKSTXilojjGpfgbYiMySv000Xl/Kjf2ta0mQkJTIqHbUM0VQ
         NJ/A==
X-Forwarded-Encrypted: i=1; AKwUvBzMkXj+SFtJrHED4cnR2d3VtK5AxnTjOeCnALwkj2HVJkumUROrK7QavBx7tD1rXUWjzMzIAFRSJQqirBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6I86TpK0LdnPG90jPNRy9QdCvuz+b1OVxR5oqUYzgXUDlmqob
	kGHr24DozoHRq/KaKZbRYrxc0vfov40oQIan+Izppi6zFk70wCVtx4RT
X-Gm-Gg: AYBFou2Vql7p0p5rsXqzZD29MqD6+XNcHcQo8YtU6De+WLRRNGiL5obVwphLaxIb6N0
	lPxqICJCDlAVDTE8Ca5qfYkT+QD6gbBiT0oBtDlFWe9U5viPdaU0GP+l1AkeK20L6yxRGD/7x19
	a4kMVP+fnG5jBf9E5kSfcVVQTIXE4ITW+txR/S498dixaTKEtKUjtT5wGP/SORFvBzVQAl6zCHt
	IwANBa6u4GgzG464ji/0U1FXEEiRSM3NCI++xPsafkyDsv9vUDU5etKhIK6I+IQuylJtBjMC4uP
	+RUmCfQzcL2I+oEaN/QqnPBNqM/KZuCKtBUvLNMgYTH8TzObX35BS5lpY+bot5ZUGpr7T2nqq9u
	U/wU7fSq2g5cvgMr+rrFwNcxucpuN1wkPYi3xx1jN1tyiVlJ2UBpyLpysoUsB+TcQtzwhUD2M3X
	/nU5QmAMpzPGv5ANXKJebSUGblhedGy4Sq2NYnMeNoB5Y+hgynH8rE6Xk5o8dO2zo20PhBoZ8df
	TuPCXS9lAPhSKzN/DjtTZa6gVgT3qHsmsBONLTqh0mVbXFayhG5lo3y7pRzxV7y37oSmaURD7ye
	Qs25Rlaa2f4Fw+vlZeyKZzhuiUvVnKGXPIb5Pp5u4TaG8ZyFARHFHzrAcpT5kCtAhcUphbguUfr
	5nwRHQqJrnPhB0mREldIO6g==
X-Received: by 2002:a05:6820:1c84:b0:6f8:3d45:b469 with SMTP id 006d021491bc7-6f83d460e66mr9271597eaf.86.1792107218216;
        Thu, 15 Oct 2026 16:33:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70188bd9ecdsm525519eaf.2.2026.10.15.16.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:33:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net v4 0/5] ptp: make virtual clock sampling and teardown
 failure-safe
Date: Thu, 15 Oct 2026 17:33:30 -0600
Message-Id: <20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQrCMBAF4KtI1o7MJDU0rryHuIjJtA32j6YER
 Xp3QxciUly+ecz3XiLyFDiK0+4lJk4hhqHPodjvhGtsXzMEn7OQKDUahTDOIyTXDu4O0XZjG/o
 aDMrKlAWWziiRP8eJq/BY1YvoeRbXfGxCnIfpuS4lWqu/aCIgcEQ3R1obsnyuOxvagxu61UvyY
 xDicduQgFCyJ+kLT2irX0N9GaS2DZUNr5gLtlpWTn8by7K8AbaT4nBDAQAA
X-Change-ID: 20260930-ptp-vclock-sampling-902f98408c93
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Fix virtual-clock sampling errors, registration rollback and parent
teardown in separate patches. Keep failed PHC reads out of the timecounter
and serialize extended samples with virtual-clock adjustments. Also
preserve the zero sentinel for packets without hardware timestamps.

Retain the existing cyclecounter mask, scaling and conversion windows.
Retry failed refreshes promptly and queue the first refresh immediately
after registration. This does not guarantee recovery across prolonged
sampling gaps or assume full-width nanosecond samples.

Changes in v4:
- Retry failed refreshes after 10 ms, keeping the normal two-second
  interval after success.
- Queue the first refresh immediately after registration, while keeping
  counter initialization before publication.
- Clarify the half-wrap conversion window and full-wrap sampling limit.
- Document the zero-input return from ptp_convert_timestamp().
- Add Vadim Fedorenko's Reviewed-by tags to patches 1 and 5.
- Rebase onto current net.
- Link to v3: https://patch.msgid.link/20261013-ptp-vclock-sampling-v3-0-d3ee4ea62fc6@gmail.com

Changes in v3:
- Split the independent fixes into separate patches, as requested by Paolo.
- Retain the existing timecounter arithmetic and conversion windows; drop
  the full-width rewrite and extended-read anchor updates from v2.
- Propagate registration errors through sysfs, including a failed initial
  PHC sample, and initialize the counter before publishing the clock.
- Preserve absent hardware timestamps instead of converting zero.
- Correct the sysfs teardown rationale and its Fixes tag.
- Rebase onto current net.
- Link to v2: https://patch.msgid.link/20261005-ptp-vclock-sampling-v2-0-8ed12d4d10af@gmail.com

Changes in v2:
- Drain virtual clock sysfs changes before parent unregister walks children.
- Use full-width samples and overflow-safe scaling across long sampling gaps.
- Update the anchor for extended and cross-timestamp reads under the clock lock.
- Link to v1: https://patch.msgid.link/20260930-ptp-vclock-sampling-v1-1-c11bc16691ae@gmail.com

Assisted-by: Codex:gpt-6-astra
---
James Hilliard (5):
      ptp: drain virtual clock sysfs operations before unregistering children
      ptp: unwind partially completed virtual clock creation
      ptp: vclock: propagate physical clock sampling errors
      ptp: vclock: serialize extended samples with counter updates
      ptp: vclock: preserve missing hardware timestamps

 drivers/ptp/ptp_clock.c          |   5 ++
 drivers/ptp/ptp_private.h        |   4 +-
 drivers/ptp/ptp_sysfs.c          |  18 ++++++-
 drivers/ptp/ptp_vclock.c         | 109 +++++++++++++++++++++++++--------------
 include/linux/ptp_clock_kernel.h |   2 +-
 5 files changed, 95 insertions(+), 43 deletions(-)
---
base-commit: 045958acaa75205b31578cb22c4345e28dd2e4bf
change-id: 20260930-ptp-vclock-sampling-902f98408c93

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

