Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169464;
	b=03XPYjJppvHiufRpXsEQTI9V3C9wQQZShLNzb8/T1DrKTyOzEn4V+hq6xvMxuda58J5u
	 v6yuFcWHnwQiFgYOCqFt12BSNjxClvb1HK96CVTJRjF1xAvcC7ChnJMxU8jXQ6M8Yl7rs
	 2AcuAvsiTbm2xO9B5+OYUgBVEz+E32+1uqAdqryv35vl27x4KzMJEL5nYZtgn4I747ihC
	 +MIwKzHekSqSg8PFVvadLS/vzB09S/T5jXO1uP3+JfWQOJTShBYUCXW4aiUK/we0C3j8l
	 Ch/eBu1fU+iVNqvyDWm2zO126H5iyTAzSy29wf3R96g0HDnB3AtwBrYA8sbrjY5E8qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=U6Ai3RX3XOfep+2NZPYc+asEVycV3qACLtEG8MfT9tU=;
	b=CEU6MWlgvKwqbmco8AcAFhBzqdf4EYTtk7kVuNBLir/6MHb2ywM3f9L3DTNq8bthR5Du
	 O461ykYESle7pSww9Vz6GF6QEdTQlSSuF3/OC4+uVtZBsByVJISLGCEeBuHepi3zJ5mNN
	 wnssSG1IzqFCRuSzMuSNcSTjZu9DiOH++5UAQmI5fUrgEX+WnHTVZ6eMXtkaStoI7oQNc
	 Ky+ksvuey1Iv3eYu8p7OqQgDXWEBBtkUPN10fd75xxRasRsouOGxRbV2wAhK0rIj3J8uE
	 BOI2vhyEdVupJRZT6UzgD031GanhwoJSg1xqD6zq7TteR7NpYlDpfcexXN40gfS2euA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHTLLd4f;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B9E607943A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B9E607943A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHTLLd4f
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f563d1c6so51395f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169462; x=1794774262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U6Ai3RX3XOfep+2NZPYc+asEVycV3qACLtEG8MfT9tU=;
        b=jHTLLd4fpz/icE7NfXAZClbnA8xkbQscrSmCRQpuELsK3h2USWg26Q3W6X8Vavja/L
         YLuhSHHIG97DX4Vku+lKQ2EJXlBPD/S7j+2GLvRFfD2GgzMkrv7scQDmx7PLk6QJ1GgM
         PWl/PkvzVNw4VyKwJyFRKazgq68h2GJlW7EhU+GrXvvPro56OQPXNhQqGpeX/40ymLxj
         7tR/YLUgNyo8tuk6Uk9aJHZSZmUdSOHYHEUPJLAjhJgoaJmYUBqB+4vV+axs4J55hgKr
         2hbYZSc1NAORavxZXXtqrACfeAFj/iDoiX+nZltzr1sjsdOsP5t3BHwzH8Yqt/vVBiRs
         Ej9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169462; x=1794774262;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U6Ai3RX3XOfep+2NZPYc+asEVycV3qACLtEG8MfT9tU=;
        b=jhDHpfaenX6PZWcBJ2c8ZgA8DWpMfsqpZkbr8H/eZkQ7GyiquHVWIVxICwKjwM+LpI
         A4CpAZPbrK0xQ/NhhHca5tYFjC7zvYFwhCmfEcqcnWi4Rn92GCDDuIy6D14EkQLwmaRG
         JMiSk1R3Fxdj1zomLFDF2oQluVsyEZ2PGSlMzwW/pvLLtabPCgATW4HeLNCV4Bt/sE0L
         HLOxs34KGEHK2RMRYgNOxnanrqsmWoZrQXoQnqEB0KQsavnZ4qRfMzZk4IKlB3vsEdyo
         st79zsd3ZAAxKnrJ7ErEB3LKiCQQWp+dX4GlhnA4tcRv1wufyV/dbOC79OcrTxsWOD51
         WoaQ==
X-Forwarded-Encrypted: i=1; AL+hErGb6dyc4K5l3iBetpKIMCNxPhDcBPz7nJ0Ui1amDFuL7eBqk2YzmgtB4vebt/KHAiQA+tei62Utfx2MBjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wkJhObAhv4pVPPQD8PgbgZhuegHmOdhvNCEPxxfAZegcFApKu
	rr6J45kY7ln3XHjROlFzZEaG9znBIV9rJyReno8lDeZT/rzTbL14Bkgp
X-Gm-Gg: AYBFou2Uo3c7VMgHN+yL/1ryATSD/xKyLvkCFiWpXcR8WtC6/IT1iNSQyFhdBJ34mjX
	stkgIrR5NnMIlxXORK9iTXr5HDLjlyxsI2iT8cfDBSwdSxia/FGaUOtweZJjRUCsgTbkyU7SPKo
	D6ENvLqzw7EsHqpMt6pyFAySCcvteekTiTHouY8mtflluGC7XQNwT3wnIT5ptq7jdTk9RM7ViJU
	955YTSCIprs1VSn7IqgZcONKMlKUFXark1S3nLo41bACj8EI1uXb2gGP8X/Dm7AZpn7UZtYNhEq
	9FN4f1ykbJ+7aFxFudHrfc8QRBXkrEet4HC9apz5UnIx2e/zc28rzV9B3T4MiJQ09NBYzrz9HLc
	ZJxjXfqBk88c8vLIb4uDLb3B2/4qNdXiU51yiosXjsZ4mtWRSGFBh8RNRurtx6ybVtQdAiV+rut
	NWzN6qNDiz7y6yGZqbzJTxav9ST3PMzO+tmug4UumDBD4OBO0NJDnLWLR+tPgDUodwDtlXSYKEY
	c65RaT6IHO0BSMsvfX9HAv4Y298VD7dB+OkGznR8LKxPtG7U+tpdYLODmwefzlixbnkM5Z0n23M
	9MIwLs23wHzpUFl4KooTun0Djk1BXC9HHURZS5Ms1DTs0KJ1Zk3EEQ==
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr38276815e9.35.1794169461719;
        Sun, 08 Nov 2026 12:24:21 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fc31sm5714139f8f.48.2026.11.08.12.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:24:21 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 0/4] landlock: Fix REFER in layered domains
Date: Sun, 08 Nov 2026 21:23:47 +0100
Message-Id: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWOwQ6DIAxAf8VwHqZFtrid9h+LB8CqTIUFnJkx/
 vtQb33Ny2tXFilYiuyRrSzQbKP1LoG4ZMx0yrXEbZ2YCRA3RCi5lnxQrh686XmghgJ33jUxLZc
 0N7UqtdEEWkqWGp+k2N/Rf1Unx69+k5n26G50Nk4+LMcDM+7eeQsKQBASMUdxL68ceeu8Mn0BA
 M92VHbIjR9ZtW3bH7NpTwjFAAAA
X-Change-ID: 20261108-b4-landlock-refer-nonfs-layer-fda8bcbe0b44
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

This patchset fixes a bug in Landlock layering,
reported by Dwi Siswanto in [1] and [2].  (Thanks!)

The bug
=======

When Landlock initializes layer masks for path walk based checks, it
unconditionally adds the LANDLOCK_ACCESS_FS_REFER access right to the
handled access rights.

This leads to a wrong layer composition, in cases where the following
layers are stacked:

1. A FS layer restricting REFER, but also allowing REFER in a rule
   (e.g., handle REFER, but allow REFER on /)
2. A non-FS layer (e.g., networking-only layer)

When these rulesets are enforced **individually**, there are REFER
operations that are allowed in both rulesets -- the ones that 1
allows.

When these rulesets are enforced **on top of each other**, the non-FS
layer starts enforcing REFER implicitly as well, and all REFER
operations are denied.

This patchset
=============

This patchset fixes the issue in three commits:

1) The fix, which should be backportable to older kernels
   and which is CC'd to stable@.
2) Regression selftests.
3) A more elegant fix for newer kernels,
   which is intentionally *not* CC'd to stable@,
   because it would break on older kernels.

   In newer kernels, we already add the "REFER" access right to the
   handled access rights when we merge the ruleset into the new
   domain, so there is no additional calculation to do for it.
4) A documentation update to clarify the situations where the *_REFER
   right is implicit.

Please let me know what you think!

–Günther

[1] https://github.com/landlock-lsm/go-landlock/issues/66
[2] https://github.com/landlock-lsm/linux/issues/67

---
Changes in v2:
- Rebase on master and resolve conflicts
- Fixed documentation as pointed out by Dwi Siswanto in
  https://lore.kernel.org/all/20261101125114.19009-1-me@dw1.io/
- Link to v1: https://patch.msgid.link/20261030102411.12985-1-gnoack3000@gmail.com

---
Günther Noack (4):
      landlock: Fix layer composition of LANDLOCK_ACCESS_FS_REFER
      selftests/landlock: Test that layering does not break refer
      landlock: Simplify landlock_get_fs_access_mask()
      landlock: Clarify implicit handling of LANDLOCK_ACCESS_FS_REFER

 include/uapi/linux/landlock.h              | 17 +++++++------
 security/landlock/access.h                 |  9 ++++---
 security/landlock/domain.h                 |  9 ++++---
 tools/testing/selftests/landlock/fs_test.c | 39 ++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 15 deletions(-)
---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261108-b4-landlock-refer-nonfs-layer-fda8bcbe0b44

Best regards,
--  
Günther Noack <gnoack3000@gmail.com>

