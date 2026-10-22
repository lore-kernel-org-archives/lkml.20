Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682208;
	b=RTJFFhLaXAuFJFsVfUSooFQuMYMIawCE5JzDQ7xvLl+wIiJvnUJkh+zItm8tS93/zWaE
	 Awma+ZpRNMvmxMkhB4lAXV0qhoXjhYSECpjRWieVxatgTG6x72KPdVrgEoiCihwTfxDOs
	 opgMaAByoLWfBqDTrLs0llUefRrxqRdCCazjlLCs1YEdvxZWD6ess+yDw+YhGWruL90jx
	 1QAa/7Pmq1TD8A8qEXUzNKTAHVWk8ANcyFTQ/NS7IhQBBc4gA6ehGKHESpwqzdZhWVuSg
	 dz5uZNNTOgwdnKhl7OdIDSRT8JbEDFRJ+Opd1GDLsLKpKUAjenK+1latQqI0gkVBgRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=xUZNRCeZ9z5gfh4C0SQt/91FcFEsF8PF7oTyP3jiUAE=;
	b=4T9HJjMxyrRxWcwzCthrnt4rCMflQKrAOLwQw9c3LU1bniIXW5EX1C/NmQ5cjZgxu/3J
	 ZtJIiHbI2L0xUXuxvnSWUB8MQZbzJi7L0Vv3q169M1WPfdw01DkXTX3i5jksqOwtZSLYk
	 oAiwATdi9RF5LkevYGcKgI46blhiizfHj5D1d5z6x1OugtUpYDSXFy3pbIJybTc0inTyg
	 +AdfdSWdrjuZwgtMxov/EauWtZSLrl/LW6l5UG947mCKDLJigBJr+YPV4A1BdUiXovBai
	 7pY5qHGdgQlObLzSHs1GyCtMj6RMNHQ34Z7oE65kF+OdfNj2csId2HXkRKkA6U6E4nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PQNQg77c;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89CA606ACE3
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89CA606ACE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PQNQg77c
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d290b10a35so882292eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682206; x=1793287006; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xUZNRCeZ9z5gfh4C0SQt/91FcFEsF8PF7oTyP3jiUAE=;
        b=PQNQg77c9YG3sMVbs/CRq0dD0jdqBK16WUU/HsZLvNRmD61ES2q5Gq7LW9qCfkXlV5
         X6b2DjRZxuGdiriIhuEKnr7aSeVz41KF1PzdNamzm2BE901YBOl9tE2ooIcKGQteDybK
         KhbfsOTlAIQjCUV8SOBe0l3TmnMyLkfva4pk1fTo9jKhSgRR3UXjdMKgk+X6HZMYoql9
         sosC7O5QaEd7hQK9rAO4AP425tqoMxzI28lFLGLNBcMyUmbBWM4rE+4Ik0h9vsUxWlCn
         69adrX1U02e2t9gzo/dHFpIJqnn0Tzbt8A7K4VCvdNWRfY2N2yL2CQ2cc9bq7LsFTRJP
         A2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682206; x=1793287006;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xUZNRCeZ9z5gfh4C0SQt/91FcFEsF8PF7oTyP3jiUAE=;
        b=trVdc+rPaKIvIK7rRXDg0dpNJt0wnsEG7xfXb8k54sn5/hE15X7dHpp7mb2fKYdsMa
         DJQkeRZL+gquuYpW5SUomsLZDEQJ0wfdiwjY63RfBcOZOB6Zj4NCuSRnT83K74JzJ+jq
         fCSL7OUgo9Apg3BdHCUrlDnITs6Ka5VLhD4LijjjW/ReOPGGi/37V1mj3XkIcvgojg5F
         Er77FBemRQoOHEwBr1kIWSsGn3E9eJA9ZfX49M0ILK9ScHQj1wUp8iYD8YvPOOjalg4i
         kNU0JgB91Xrqj+/w0J3sg1IXxoExa0ZWaKY0PP3DG3gqVsfTJmk7s2lXsjPamyflmDAP
         wPBw==
X-Forwarded-Encrypted: i=1; AKwUvBxB4N8gBn7SgXSzUM21nW6CIm2JjuOSRGxvSGYeH1h3Zz5+7JqG2IjbfuR1HDWHOD6HP90kbpy0Xa/F4a0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoWHNHAwK8GK5uD7L+qHhi5nEgVq24up6fUQ3ETmTY+TSDT80h
	azZdf8UNJqWTejmfF8qbR4L3Pj4uK0jFCv4yT0nvq82w5e3RZ/I1ZdtS
X-Gm-Gg: AYBFou1zx1E4qHBVdbYs8aLa1xtcuDPAlNVD6vWX/kZH3POGe/uoEAHQLyZVGfWc5Yq
	Z4mHOltvOydoVGT4+WeUjLkNS7jpgEC5liYkAdmcMrF5qII0uEJuYT3yQl4OrRHasxFTKWmZufu
	7QMh8rM59lvP4MV9cCtNc0suRFoElCfKTHzSpgZDKvDRz8XeThVe4tWSJcwcHuvnGZxCGAJW1Q/
	X5bHay/rZ7f5bqZ6emLAYnr9aLwSmUl8lSxqkTf1BPptkuTDnJubtkcLkPRK+sC2RRwSMcW/s/U
	9b8qFofHhuTBEwHfS7EzhzsAPksooPobYbGNX1s5RXvwntRpz661wk8/qd/bjM6nIyBRp4lQTvl
	8VPTPf3cUNeiAx+pu9krcNyjtSR+NikbwLD4B5qRh2znYINIruBSkmEBIs745amlNyRoKoQSHCZ
	z6Yjn+TGuvBZn2H8usI+KRmE/qoSp0GD1i3jGgMCraI4JJi9AT5Lk10SjqFQguP0OXL1Qlnjin+
	xhlAdxXCzG6Czija1Zc+a1nzX3bnXO+ESGvxxQ0WOGbRlxOJoBGxDpQG2Sc1soj+9Zi4msmGw5R
	wUZJwkTAipXyeJZlVsPUtOmnin7FEPKx5u1lrvbIT3dI8ywcHoQw5gsXD2l6sj/ZiUb3shvHo4p
	TxZVGBuV1c6w+nrDTXg9+9kGencYfHOdeJMbrcNadfUz1R4Kj4Ci+LG0vx7cP/2jXfv2mlVblBI
	Z8Wvs=
X-Received: by 2002:a05:6820:2219:b0:6ff:fcf5:40e9 with SMTP id 006d021491bc7-70942610aaemr3372897eaf.70.1792682206527;
        Thu, 22 Oct 2026 08:16:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d5eb8fc0sm4685631fac.1.2026.10.22.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:16:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net v5 0/5] ptp: make virtual clock sampling and teardown
 failure-safe
Date: Thu, 22 Oct 2026 09:16:40 -0600
Message-Id: <20261022-ptp-vclock-sampling-v5-0-06ceace17bac@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Oz2rDMAwG8FcpPtdDsl0T99T3KDs4spya5R9xM
 Bsl7z6Tw+hKt+Mn8f2ku8i8JM7ifLiLhUvKaRprOB0Pgm5+7FimULNQoCw4DXJeZ1mon+hDZj/
 MfRo76UBF1xhoyGlRm/PCMX3u6lWMvIr3OrylvE7L136p4L76Fy0oURJiS2itQ8+XbvCpf6Np2
 L2ifgwEOL02lATZcEAVTEDw8dnQDwbq14auRtDMhr1VkeyzYR6NP/4w1aDW2xipIW5/Gdu2fQM
 rWwO0hwEAAA==
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
Retry the first failed refresh promptly, then back off consecutive failures
up to the normal refresh interval. Queue the first refresh immediately
after registration. Prolonged sampling gaps remain subject to the existing
half-wrap conversion window and full-wrap sampling limit.

Changes in v5:
- Replace the fixed 10 ms failure retry with per-clock exponential backoff,
  starting at 10 ms and capped at the normal two-second interval. Reset
  the retry state after a successful refresh, following Sashiko's report
  and Paolo Abeni's review.
- Report: https://lore.kernel.org/r/179245576913.3135.17393378308394380121@kernel.org
- Rebase onto current net.
- Link to v4: https://patch.msgid.link/20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com

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
 drivers/ptp/ptp_private.h        |   5 +-
 drivers/ptp/ptp_sysfs.c          |  18 +++++-
 drivers/ptp/ptp_vclock.c         | 117 ++++++++++++++++++++++++++-------------
 include/linux/ptp_clock_kernel.h |   2 +-
 5 files changed, 104 insertions(+), 43 deletions(-)
---
base-commit: f4377bf85887f57b59abb5479f7660a81ffe4449
change-id: 20260930-ptp-vclock-sampling-902f98408c93

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

