Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3452B1C5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651800; cv=none; b=UZL8fuRE+VI+gGXjwa4fX+2KgRsWhmYvLvlLaR01ZmiqZZLucliYqw0dlKoQlbJC4OzhIJG71c+ZmoMDjta/94abTbGvI12wxaL6w1JLfJ2y9h1ccD+feGHxpG0A/RlaQbXdyhJm6jscdGT0mAgYaPFzuKWuBvZnvuCSguVNJ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651800; c=relaxed/simple;
	bh=dXnLeOc9+ZJIVZID1P8Qpbq024iE85sRajVA+G6bckA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOLU4/OiQC3lOrHyrRlWhccO2hAVWKpNwy+dyPq83WAi99lgR6Zg3rxalTPqGa3/VOQE5mEwKpZ9t/8sWOrA1PGnWcNmw0G011cOaySE2Ydew+qZNy7u5aBEhZYdBGwiyRbZoUewHenQjSeyiw5VqwCn2bRsAKgTymmSe+mDk14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=0GpUkFTJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="0GpUkFTJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so4108405e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789651793; x=1790256593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kc8SSZKaYeSDYTduIzKtgY7SY2vSIslvd8ziXmdFBEs=;
        b=0GpUkFTJ1DzSFvpaCcNcrf1B3dKDAuuztdNJ0x80FEwlnEsOeALHBcMKTM+KKK93ys
         96iFRHCFoy9slyl5POGPVU5f+kITrRrEVO0QKFfJqiJKt008upMW52trd7nGn9B9h45L
         VonzcCpLLCKrFMeZUVxCRs11Nx/If2g4BRfnpBd25SmJIn6RQgHbFdwskvINnJ43aW0S
         p5L5E2S+UtpEZBdB6Cgm0ORNTIE+H6ZfggBHrpye41dB1SKU//9fZBY7Tr/svCJ1LiMh
         jg5VKHjbNh+k7V58asMTv1FqkLJyYF7AR2UBkrSVLyK7wZXMuvZQOLUnNk73ogHxlz82
         V7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651793; x=1790256593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kc8SSZKaYeSDYTduIzKtgY7SY2vSIslvd8ziXmdFBEs=;
        b=EKQKO9og4A8v1ADK0K9y28YAOqjk1cy3q8bmq404PZhv4JLyfIt7iUnXMn8vcbGO+/
         QSc03dOhBEbMAT1dWfvvaJ2jKUxycdEy1OSaa4wq4930MobLzLLyvcgDOlQEnPNp7NdE
         AFM9ws0DrPAnEerQrWUhzt74oeHomhhV4r/UYdHIaRnfPbDAIGGjdObnZevN2eTp8e50
         2EL3LI4Y6TEd7vIu48NGLkEHJvtuLDQJizSO+7K+n3deaAIZpMSbPjmA6jeRsRbFfQh5
         qeamwzLh95LIDqfjuc8bC/xGaSh1eeWXhthzxCRvT/Sk63rJdohVnNbnk5FeYjCl2UX0
         JpYA==
X-Forwarded-Encrypted: i=1; AKwUvBxsjQMgnqC7dN3o9uExsqJZ0Ihtwo8S/wg11rY9Ai2j4wWFtcDnN/8VKZQdymcV2SqFhzKdsFUf/el3hWk=@vger.kernel.org
X-Gm-Message-State: AFuF++mby6JcNJQSbs7sUUCfoohLU4KInL7ucD8QTR2XG6ADOsbPNLa7
	2C9n8Fq41LVibHKoR5uL9f3Zwme9WxzqPvG5a8szTP83xiC9x9OrflfmVrNOSemtoQ==
X-Gm-Gg: AYBFou2Y3Nw5arInx7FN/O9LbRwG+lNVZahpibFOVKR7QV4LOdHAmwTNU1b99YK7QEC
	wOgjdc+vyshgRy2Wm0JtGz5cBf3mefWfezkagrVTCIJSbdZEQVeMRNWe/104KUPzj8ZVsmkIoQW
	njBLVmn40s4MNZzV0pzu2ezLXAEUnWaUvaQ4M6/LlYAlHV9M9+383EXU8aegwTDgmi2E+yP+zO9
	iG/h1L4ppIn0WIJCXhK4yIL7YI5TZi/SWxt0iUqFXhPV1NEOyhfmCXiqDhNZsLL8Q855BoNBizD
	24FJ0UMTDntPoTf8cArvJQEp0r8NM+4z5URZI3IvWYnt2sGBUK+dsa3VZukDSYKAGIe82vq2dRo
	VgsoRrN4DTLnHQmsA6Zab1TC4IjbdoL+MykCbRgSMYKV55+7AnFqu2Ri9nDocS6VgYKfYRMMZUL
	3ln62NJjGKhVwYfQ7nOpWcaWqzCxKD94gKsgLcmVsjvg/tIrJG1aNQUnPwi5pEVbjokpsZqJhAL
	PySufLUKqWaLqSjUY6lVIORFA4=
X-Received: by 2002:a05:600c:46ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49eb7339895mr154172245e9.13.1789651793298;
        Thu, 17 Sep 2026 06:29:53 -0700 (PDT)
Received: from fighter ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2356d1sm97548275e9.6.2026.09.17.06.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:29:52 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-pm@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Evan Green <evgreen@chromium.org>,
	Sean Rhodes <sean@starlabs.systems>,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Xueqin Luo <luoxueqin@kylinos.cn>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
Subject: [PATCH v3 RESEND 0/4] PM: hibernate: encrypted snapshots under lockdown
Date: Thu, 17 Sep 2026 14:29:46 +0100
Message-ID: <cover.1789651778.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdown disables hibernation because resume restores kernel memory from an
image userspace can modify. This also prevents a TPM-backed uswsusp
implementation from using /dev/snapshot under lockdown.

This series encrypts and authenticates the snapshot in the kernel. The kernel
generates the image key and wraps it with a seed supplied by trusted early
userspace. TPM policy and unsealing remain outside the PM code.

The seed interface is first-writer-wins and does not provide freshness.
Trusted early userspace must provision it before untrusted privileged code
runs and enforce the required TPM policy, rollback protection and recovery
handling.

Tested on StarFighter MTL with Secure Boot disabled, integrity lockdown
selected manually and a TPM-sealed seed. Keyless and user-key S4 cycles
resumed the same process and boot ID with the swap header restored. Corrupted
wrapped data, invalid magic, a corrupted complete-chunk tag and a wrong user
key were rejected. On exact v3, the user-key cycle and the allocation, free
and reallocation path used by swap-write confinement also passed.

Previous version as it was updated whist waiting review:
https://lore.kernel.org/all/cover.1785838445.git.sean@starlabs.systems/

Changes in v3:
- Rebase on current upstream master.
- Preserve and validate the saved encrypted metadata boundary on resume.
- Drain buffered metadata before a late user-key transition.
- Reserve enough encrypted image space if userspace adds a user key after
  querying the image size.
- Apply swap-write confinement before enabling the lockdown exception, while
  preserving the ordinary availability check which routes lockdown writes to
  the confined path.
- Account the pages actually allocated through the snapshot API instead of
  assuming a userspace swap-map format.
- Document the first-writer, anti-replay and userspace I/O requirements.
- Remove an unused swap reverse-mapping helper and tighten local naming.

Changes in v2:
- Keep raw writes to active swap blocked under lockdown.
- Track encrypted snapshot bytes and header writes before allowing
  lockdown-time image writes.
- Split the encrypted stream at the metadata boundary only when a user-key
  transition is used.
- Return -EFAULT for userspace copy failures.
- Document resume meta_size handling.

Evan Green (1):
  PM: hibernate: add seed-wrapped encrypted snapshots

Sean Rhodes (3):
  PM: hibernate: confine encrypted snapshot writes
  PM: hibernate: permit encrypted snapshot device under lockdown
  PM: hibernate: document encrypted snapshot seed ABI

 Documentation/ABI/testing/sysfs-power   |  18 +
 Documentation/power/userland-swsusp.rst |  33 +
 block/fops.c                            |  58 +-
 include/linux/suspend.h                 |  24 +
 include/linux/swap.h                    |   9 +
 include/uapi/linux/suspend_ioctls.h     |  31 +-
 kernel/power/Kconfig                    |  15 +
 kernel/power/Makefile                   |   1 +
 kernel/power/hibernate.c                |  32 +
 kernel/power/power.h                    |   3 +
 kernel/power/snapenc.c                  | 952 ++++++++++++++++++++++++
 kernel/power/snapshot.c                 |   5 +
 kernel/power/swap.c                     |  87 +++
 kernel/power/user.c                     | 272 ++++++-
 kernel/power/user.h                     | 150 ++++
 mm/swapfile.c                           |  25 +
 16 files changed, 1683 insertions(+), 32 deletions(-)
 create mode 100644 kernel/power/snapenc.c
 create mode 100644 kernel/power/user.h

