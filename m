Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905187;
	b=RYJk8KieWsevkWk5oRY5zlkskZXkFdZ3XxG/MPL+p3UXhdLLnNIf3lT0TBNIKr4TiLt8
	 OM361qBAELMHXOYK5tWGxmxfDcxXu1rnJF80vIRU1BQiO0b7LSWltGJBfFmkQHkb2Zgdg
	 Q+7PQ8YYSbvbTRaRwxEzSgYsTKv+m+7QQ4U+NOtvA6c6KOZ0SLSzIbihcf+7n5LviEAam
	 UeNJFgmTx7etV2sn35M/ps++qYP5Jj2Zk0H1oQQKFA+9DtnOFBFbgXztoQ7uN1VnNQ+aF
	 HMrOotgddfKbpN+hP8L9CzqmdKwvfz9NxF0iEOtvDUiB2jL3xUisD+GizP0LCPRTTHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CeUUT3Q4JYEP/r8GnfprbKgPDs256aM4zq4jrxr8WPU=;
	b=tEADZER+dlk8NzMqu2CP+ZQk96N7Sbv2m6+BluKtZC7tk6Ibqt5AG1Ja5rXSuxY12iwL
	 e02tVq5MQQGgRorvml2RIIgz+segF67ooHYA0pQwiN+2xobtCUR4zcJ6CDHf2zK1ng7yP
	 eKRskP7a3QNyNRn/7DJkJMevHvyNHBx7ObSj9eDUeCFjtNFUct/QtR+LLTBHy7JaRGOI/
	 eKeJDF90JDOCAHbZNPyiGaHuHnPKCApfR6yGSzARyHXLvlmA4zFYt34BHn1vBd4/Pk6Tl
	 nc/5tjrphJ4A60Z9g0VBWdrjyhSRRLu3E51v/V29F66+0mILtRTw3Ylzm/ytKGbCIkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b2CrKQXu;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203A9606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 203A9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b2CrKQXu
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-181516de561so1298935c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905186; x=1793509986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeUUT3Q4JYEP/r8GnfprbKgPDs256aM4zq4jrxr8WPU=;
        b=b2CrKQXuwNaOhsB4GJvQgVrSOHnLHJWOGtto5K2czZVUpIqFD5aTdKI7BctRZtGO7Y
         CCYx7y3+Ug4Td4Sk65aVjO7JKHLnHK9FP17a0AKugnduiilnP3nka1PSUegIY5jdgXPr
         PuYTwTATeIWtkvHjgEtqowAWpIKw9iaSRLjkGYQQgXeZ935+hRL7HSMRj9sVTi4h8IZP
         JkOfasuUN4KGUSWOB/uA6hu/2te6pm8EVlsCB7wBzyIiS6STgQuJPBvSZQyummyt0WxX
         oJnAGaJoVyu3muUPgm6sImMaHhGa3YS3jpHz6YSFrhOJ6XyrH9VK5yAen4kKb4/6E+Uf
         8vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905186; x=1793509986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeUUT3Q4JYEP/r8GnfprbKgPDs256aM4zq4jrxr8WPU=;
        b=Q1PqkAl5G70qZtOa0HuK7MlYbwX8GAjb4Ded2koZu3O6CLOd4ryNcD73HtLV6MuPUw
         u4YO6V8XKaSF27o/wpObHGJubETQ1OAsq1BcmdZsXbvWDyN412htnQQWy0pJzeC+8Rew
         A5HMVnT1H4As2xYsoZfIYPUFyCxL1sfE1sDbwTVbGAsh8ChDwEF+FJ5YOdPHnAVpfVOz
         rzXjGGotL2LRzL6C73mv51BXVdI798UeSTHrhdOnKslqk9ApfNc3+NeDoZGLh1YVGcj6
         DNcfM3cwCXCN2sTUl9SK3roH0iPwhAcrsrgFWRR91pLd1yA0qNV/oEC0NBPkj/DQlQ7z
         8L+A==
X-Forwarded-Encrypted: i=1; AKwUvBzsSh9MzEmgjbHwUb6G0c/UtPl9jpBsWGwtJCYUT2XhhqXLZr8SX1rTZPW/E7fvRa+nI93DsipbABrJmpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP/8z2EYx1rZ1p6BlFM+jyurI9GTd43xbKacPfsIHoqPeE7Ob+
	JxKUNTvxWB0szYMNnAQKxEs6aXli8EhRZsUxS0szQfHVRr3paNgOY3tQ5HTtUm+w
X-Gm-Gg: AYBFou1ylbaY0tEvOn0CMv7J4VvV+bGaxO7NKY0WI2vg9zxX9SK8YwROpxM/rgQqeJO
	i9lpm4erBmdQXq057iMVIdX44YFn//2j14uXUqv3eBA2ZrJLlFLmE26qo+rYItPtal+NCqnVeud
	t0YhVvNjINTe3zkudHEkPmxFjDMVGLAzj7zn8CuuTj6ym561IQh/auY74sEk/O9JxfBh9Vf6G/x
	MJtGGjhuXOK38PE1GwJbOsFqbCqPhwCiMJgRSye0bDC9+ZpiFI5kBX2e6dikbdP5oTV7er5s2E+
	EEyJym2igGWNei2S7e7dZ/d+YTNzPYoOL5yr6p/O3GnowWe/bJZhCKYevoHeqDXefWdBpFdDHAW
	Ix+Hnuctj3PQrFRYweu5r2Em0aTsNmrR8zbsb7jPJwFfzZB6EGfuVDKB+a1TpHMgmLnJFM/X911
	SQPNW+A267hVdF6ESbJfeXHbUU8bhLdhQ0eFFILyUqLjTVY4LL866Rb7wqdLAbraGPOxw0chto9
	JCFa6RIZj723Kx1DkirhTOMgV5Osb9Nh0TvMR6NwKiMgraGXyeSD/ZLAX5ghaFblxKFARoH5rDP
	40pWrjERIj5Cdby6Gq9wXDJZUXjP1HgVwxcWqOkhCx8DRSfeXrV14RbBINJN9gUeAM1xkD5jeA=
	=
X-Received: by 2002:a05:701b:4554:10b0:19f:cc98:f603 with SMTP id a92af1059eb24-19fccb77ab4mr88773c88.1.1792905185931;
        Sat, 24 Oct 2026 22:13:05 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm12588456c88.14.2026.10.24.22.13.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 22:13:05 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ALSA: virtio-snd: fix dsnoop capture with staged buffers
Date: Sun, 25 Oct 2026 14:12:59 +0900
Message-ID: <20261025051301.54640-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Hi,

Changes in v2:
* Add a machine-readable base commit, nine prerequisite patch IDs and
  four prerequisite thread hints for automated baseline reconstruction.
* Keep both patch bodies, code changes and existing sign-offs unchanged.

The v1 submission was indexed, but Sashiko could not apply patch 2 against
its default baselines. The prerequisite links in v1 were prose only.

Previous version:
https://lore.kernel.org/linux-sound/20261024023232.84448-1-mynameisjune111@gmail.com/

This series fixes dsnoop capture on top of the staged-capture virtio-snd
changes. dsnoop configures its slave with stop_threshold == boundary and
can keep capture running without advancing the slave application pointer as
an ordinary reader would. The staged-capture accounting currently exhausts
its bounded unread capacity in this configuration.

The first patch marks stop_threshold accesses used by the driver's policy
sampling. READ_ONCE/WRITE_ONCE provide single-access annotations; the
virtio-snd state transitions remain protected by the substream lock.

The second patch caches the prepared boundary and samples the stop policy
under that lock. A completion uses one sampled policy for validation,
copying and queue refill. Free-running capture keeps requests queued and
retains the existing frame, payload and pointer-window checks. Returning to
bounded capture restores unread accounting from the monotonic counters. If
the outstanding data already fills the ring, the policy helper returns
-EPIPE without changing the cached mode or counters. The detecting RX,
pointer or ACK path then reports XRUN through its existing error path.
This does not guarantee a synchronous error from the sw_params ioctl.

The ACK accounting and subsequent queue refill each sample the policy under
the appropriate locks. Prepare and teardown reset the cached state. The
existing ACK-race and priority changes are prerequisites to this series and
are excluded from these two diffs.

Testing:

* ARM64 QEMU synthetic dsnoop capture: 12 files and 2,160,000 frames
  matched the reference sequence from each client's observed starting
  position. All 48 corruption, loss, duplication and reordering controls
  were detected.
* Default KCSAN: 13/13 cases and 619 policy transitions passed without
  race or lockdep reports. Forced RX/ACK policy changes and four isolated
  policy-helper branches passed under KASAN and KCSAN.
* macOS VZ with MOTU UltraLite-mk5 at 48 kHz: comparisons used one or two
  vCPUs and idle or CPU-saturated guests. The baseline failed all 32
  shared-client captures. The candidate passed 48 captures and eight
  recovery diagnostics, including mixed-rate sharing, client departure,
  reopening and recovery after an intentionally delayed reader.
  Loaded shared captures ran for 70 seconds. All eight accepted VM runs
  shut down on the first request.

The physical tests checked frame counts and nonzero input. Exact sample
continuity was checked with the QEMU synthetic source. VZ exposed mono;
these tests do not establish physical input-channel routing or multichannel
support. Aggressive KCSAN still produced dsnoop client-threshold XRUNs with
a 160 ms buffer. Further isolation supports a deadline sensitivity, but
does not exclude every kernel timing contribution. Separate generic KCSAN
reports remain recorded in the test evidence.

This series depends on the staged-capture prerequisite stack below. The
tested local base is 8d0d4c1a6c4bcb81ae9f52d1c0d979fafb2e22f2, consisting
of nine prerequisite patches above sound.git commit
5618f6837ef3314e2c581d4c05ec13b7ed975cb4.

Prerequisites, in application order:

1-5. Lifetime and error recovery v3:
https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/
6. Generic teardown/control wait v2:
https://lore.kernel.org/all/rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com/
7. VZ staged capture v2:
https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
8-9. ACK accounting and high-priority period work:
https://lore.kernel.org/all/rfc-virtio-snd-capture-followups-1.f2737c95c12e45b4@gmail.com/
https://lore.kernel.org/all/rfc-virtio-snd-capture-followups-2.f2737c95c12e45b4@gmail.com/

This fixes the staged-capture accounting introduced by that prerequisite
stack. The reproductions do not establish the same failure in an unmodified
upstream kernel.

The policy uses the existing stop_threshold == boundary convention.
Sampling it under the driver lock avoids introducing a PCM stream lock into
RX completion. A completion overlapping a policy update may finish with the
previous policy; its accounting and refill use that same sample. Rejecting
a transition whose bounded accounting cannot be restored preserves
explicit overflow detection and lets the caller recover the stream.

Patches:
  ALSA: pcm: mark stop-threshold accesses for capture policy sampling
  ALSA: virtio-snd: fix dsnoop capture with staged buffers

Thanks,
Joonho

---
base-commit: 5618f6837ef3314e2c581d4c05ec13b7ed975cb4
prerequisite-patch-id: 39fb327a004c966ab90f66a34a64bbdbb3ffb475
prerequisite-patch-id: 7c6bc344656fd839ae0d697ba18d66ac0b47827a
prerequisite-patch-id: 9dd290ac3147fa7b49a475d7df8a6172778f2860
prerequisite-patch-id: f4c24a5e441343a690f4ac2437f181c815bc23d0
prerequisite-patch-id: ab4a5b770247a65272ab7af18a75a147daf81287
prerequisite-patch-id: cfe3e7000e695a2fda27993f4d9acf0a637cf24e
prerequisite-patch-id: 771e8815f2b874d98376f309dc60bc90244f378c
prerequisite-patch-id: fdea8eaa29a47360e19820e27301dd8b6b26e43e
prerequisite-patch-id: 67ffb5c72970e1aeace72b6537dab1b977a3fc6c
prerequisite-message-id: cover.1791881787.git.mynameisjune111@gmail.com
prerequisite-message-id: rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com
prerequisite-message-id: rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com
prerequisite-message-id: rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com
