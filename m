Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE6647255B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929234; cv=none; b=UnRa1sZZR1H4NtpTHPpQSMWsda5hHMt72IDx1q1gaGy6w0Z/kaapDA5FwdJjM6O6JR++WjqVAdcdDoYK+/RdOoxTXqjifte2RTG6YtC1tck/y3Q/vtEXyRyycURjtqFA1GAH2nffGU0zjlys+PzyyHcVXpxm1Kj2kmMEtfeAozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929234; c=relaxed/simple;
	bh=XtWPDAhL88P9xmBjYjDa6FuSHwuos1FDu0CiPYmyLXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pvvfv8XApnMnjL3eNfbJOwr8VPi8MFMbCNeHfALUdc42AO3/WYLmcaK2qVffTA4IGYxBxnFclIeQGTubGs3faDpfpeOu94Y22aPxo2Z4p3uxX9dagi+x2lzT0mxvBGaAWiV0wBY887tuHYvAh5fchgDNTCxnTKfLWwDDxAzVRbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=Jp0O2RQu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="Jp0O2RQu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so621931f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1787929230; x=1788534030; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfZiElKe4UXrl5NCjFGN4jGVtfkor6YAv1JvkWiSTSM=;
        b=Jp0O2RQuLHOw9Atg+ws4G4c4RMBSEzIghOgUZ1Bkna0TVu01ZuD5WNObcRB56FpmVo
         E/OVRq8TZSUtXIXUtUHBdEaTvIAL5T/z8UJZCaS/U8HIoXdPPGsusrGunr0xGGJjI+9+
         F8otsme2E/k95AODBYeWJyGZGsIXx/WQTHsFpBPI4WWVkuL9bRo1AaiUd2Z4Auw4uGdb
         kTkBWbuS6B/7TaXykboH+DEJF86s8+nrc+tl6UvZUSAAeh6u+KoNqr7l45J09ElGxpcE
         LnRslsoFz9JdOWieR6UUqhPrsK7w1gIc+vUMeZ/+qg1bWyy1symljVBnhcxSvTsUsbIw
         sXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929230; x=1788534030;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MfZiElKe4UXrl5NCjFGN4jGVtfkor6YAv1JvkWiSTSM=;
        b=BW1tdAiQ1Z0M4PmFcs3z4GQUOzaVYZWr3n9c/0E7Shj5RRf4JKQf6ykP2uX3ogJCcq
         LdmJQ4routg0Qv4m1z8LHVdOIwtf/44KFrstuAEHDeetxx3WK225Nea+XQJqxYOd9Pkh
         ZMdhTuMZ7U9UDa0GU79OBBz56whWkzCKaL3Zz01YkCkImUcZ/OwkBobbAN5EiSbIqtwX
         JSH9YCWBVNzDGTNBIM0LUeaZ7d/lYeHa6p4pNDRHYVyGB4gX1blix0kwn4+MdruqBejL
         1wTlx7uWyyeDYRoUSTD6PPQuGEGT5OfyCxKE3xhnftj9quNobwz1cxt4+NUfV9Y1VCBD
         9eZw==
X-Forwarded-Encrypted: i=1; AHgh+Rowzb36DV+KVFii5QSsCAqdXCdIbQYiO7qput7tRkYghKilupu79z31fSF9Gjp7OxybXccTzHobZ7PrPiA=@vger.kernel.org
X-Gm-Message-State: AFuF++kMMe3GKe0wNdET7ieAC2dh7Ui6DKZXt6J9RkwFq9KJN6wvNjwn
	3D/SE5PqeOJLglspXmtUI1gRXoj5CGEXHj4BPCVENpg1hxiUI1F0+ZqADa8R3yz1zYWKAAEGC6u
	csNY5t+K94g==
X-Gm-Gg: AR+sD10NdvhHPEAWk/f639aCxk7yAWOmQTA2AgT+BQQeKBFMtZ6lt/jd4STDnFukDRu
	S4FLnvHrizMcpn1NPr6XrtCl+Hfk0zr06rl9YEZy8awpEICr6JRxAnMnH4fJLjS3Q4+LFENLckx
	hcdr9kl7jYZjw8ZghCg2wcsK/n5gmd5hIw8261yqFb/2oC5fNGH1w5XF7P30pehoywKbm5SWbpO
	Mf8klhsYEQqlRghvTBwVouyZyUj3taxb8NlUmI5SlQohvvkECx9utVDgVsKc8q8Hgav/B3zsBC2
	0yqDuwcOgyeY0YlaFg4KTX3Cq6UOVOyE6NjU9CQF8+RZ0/Ypkw/jQfZ7faHWB/zkYO5WgNGevfj
	+qn/8KDxZ4dA0Fs0qISrCFEFN4Q22Fy5OcRachA+4Nq5ksmPg72Onzk6G0U0TWYnGDrXq4nA2SM
	l2g5OMc42/anuYHU/cTxyhLhaR0aNLcDab7jL/QMOnfclNZCxg8s4u0galfA==
X-Received: by 2002:a05:6000:4693:b0:482:f5f6:d253 with SMTP id ffacd0b85a97d-482f79b0528mr9587670f8f.12.1787929229177;
        Fri, 28 Aug 2026 08:00:29 -0700 (PDT)
Received: from somecomputer ([195.65.134.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20737sm3989620f8f.22.2026.08.28.08.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:00:28 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] UBI and UBIFS updates for 7.3-rc1
Date: Fri, 28 Aug 2026 17:00:27 +0200
Message-ID: <7545938.rdbgypaU67@nailgun>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Linus,

The following changes since commit 075b74841bd0065a3bda3440873c747938e69b68:

  Linux 7.2-rc6 (2026-08-02 16:24:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-7.3-rc1

for you to fetch changes up to a5e0055eac837a1168c781653943d4a0d9920af3:

  UBI: support per-device wear-leveling threshold (2026-08-12 00:08:54 +0200)

----------------------------------------------------------------
This pull request contains updates for UBI and UBIFS:

UBI:
- Support for a per-device wear-leveling threshold
- Various fixes and cleanups of error paths
- Correctly preserve torture flag up wear-leveling

UBIFS:
- Various fixes and cleanups of error paths and kernel-doc

----------------------------------------------------------------
Ibrahim Hashimov (1):
      ubifs: fix out-of-bounds read in signature length check

Ran Hongyun (2):
      UBI: fix two issues in the ubi.mtd MODULE_PARM_DESC
      UBI: support per-device wear-leveling threshold

Randy Dunlap (3):
      ubifs: debug.h: fix kernel-doc struct prototypes
      ubifs: key.h: use correct function parameter name
      ubifs: ubifs.h: clean up kernel-doc comments

Yuho Choi (2):
      ubi: Fix rollback for explicit UBI device numbers
      mtd: ubi: Release device reference on busy detach

Zhihao Cheng (2):
      UBI: Preserve torture flag when rescheduling failed erasures
      UBI: fastmap: Pass to_be_tortured when reusing old fastmap PEBs

 drivers/mtd/ubi/attach.c     |  4 ++--
 drivers/mtd/ubi/build.c      | 48 +++++++++++++++++++++++++++++++--------
 drivers/mtd/ubi/cdev.c       |  2 +-
 drivers/mtd/ubi/fastmap-wl.c |  8 +++----
 drivers/mtd/ubi/fastmap.c    |  6 +++--
 drivers/mtd/ubi/io.c         | 11 +++++----
 drivers/mtd/ubi/ubi.h        | 25 +++++++++++++++++---
 drivers/mtd/ubi/wl.c         | 54 +++++++++++++++-----------------------------
 fs/ubifs/auth.c              |  2 +-
 fs/ubifs/debug.h             |  4 ++--
 fs/ubifs/key.h               |  2 +-
 fs/ubifs/ubifs.h             | 20 +++++++++-------
 include/uapi/mtd/ubi-user.h  | 10 +++++++-
 13 files changed, 122 insertions(+), 74 deletions(-)



