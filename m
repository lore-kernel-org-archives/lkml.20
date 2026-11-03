Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664250;
	b=xpjFWbIVV/mF7U7JUIvqrx3480VG6g1VPWl/QxTIdFVuSs0dCLVS647HeypNEoslj9Vb
	 ZfWSVtt9dhfQj+fB5h9UgxLZQScAjFl/Xzq+K32lDUMKmuBn1aMSJL70bjLBZvfE4fLOd
	 j2bhVffWJehz90EyY2kwCBeeaVg/eAxW0JFbV+vEfVBG7wGTJPZ6yi3Pm+JXJDRCOJjKm
	 vdoqGi7LP+vLkefS0oEG8+/EQ2o37JPjrJp1uSP+vkjOAy+/PKi0orSeIToE3aJxu5XlJ
	 80GzDa2WcPbP7TlBftKDtGv8179F+Z03A3tzJVEvYmnUXqjpxxoei+uZDtKgCCOsPhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+xha+Bm67+MTTTxe8zWpGLZyuEH2aPDjA0HzC7mHdv4=;
	b=flnfmc4bcOYK1gHZzWMdfb2ODEzrl5oNPZi9kN4tPS4ALORRsZQpiA0LslkYPdziE+P8
	 S16koDMeeEzfNNcnaaarDgg4t9kwmF+31BN5VR5OCVjUeytqEQkrDfQDZF4Fn9jCbPXAU
	 k7Xn15k1uFPeESIQMKzUw3Jg/u/qqu38e80Mzo9X+KgURme1TswyHhJGRr3YgNdHBACDL
	 DgdPsYNMuleifoVAZSe7Z4qQeZfmGShxC2FYaZabzNupX2HxiC7vpy+rRzA/AFYYA5TMe
	 fX6NS3mDXzHSmzxurgkKagKO/1/6LHpXENALW69wvv2xU05k1TtaHUZ+/Y78Pcxn8kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlGGacwU;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172AD606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 172AD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlGGacwU
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ea7987517aso23857175ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664249; x=1794269049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+xha+Bm67+MTTTxe8zWpGLZyuEH2aPDjA0HzC7mHdv4=;
        b=XlGGacwU2cabT9/Ee4V6juXO2Nu9VlnNUNk04R2Z0sJJplCxlKKi0N1Pwarf0Y98sV
         tyg8OzYb1kVKnhOl2sqbudvunhZ8LQ+vQHB+Ql1S4Wj2Yzfcjtj1kA/LAcaOqBw2fagp
         xg+ROtIsQzkg10q4NQDEMztYwHOQgSi47eV5k3hZ3ZRP7AVtqYuZrFrTU1G84oz5+5kP
         2F7gBa+aoE5+qeyu7Ev/ktK93UGdwXB7M3eAP4TFatTmS11x36DH96BTYdgsXbQopQ0n
         dm9CHfRRct86ZXwjV3ukbIbM1KT/jMoCL3vaKLv11vd4afeKzKmBj8r+Fm/sUgfCDmZo
         RGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664249; x=1794269049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xha+Bm67+MTTTxe8zWpGLZyuEH2aPDjA0HzC7mHdv4=;
        b=N9//KlV0sE38ytZ6s1j5xwOFxnXH8D0nzX5g5kDj3XlSpnB3T+2pK97WtIcFn+R42e
         mlZJhiscbQD0944nVYv8gPlOYFHXYFJiyZPq+1Zn8dm+0M7hH6FA2VW2Hnqe1L8fPvGU
         XOpGE4VsmnjZmn7p3qs4t+QRvkQLkhdCgLaYwbSkMoPkFUhPVtyalJdizo33F5y0kuPT
         u24O5O21niTRceG/QoNe5XQR7ya5vZNbiACd8qHEfiqF2pdVkyoCDGNTJgOqPy9Uj+vo
         0hDW3CN1mOkM3ljxz5VQIuAohkfyUMPj5tgyx/X9ZYtV8kj4jmIDaAQYMZNoGnOyQrPz
         vbqw==
X-Forwarded-Encrypted: i=1; AKwUvBywjibPUEB9VTCnD29FeJk475ocq7jHnIIIJ9vpr96Fq5lS2awfjvrG3Cej55zNxtrbdEvcvL6ak2CYuxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ish+rs5sg6FO3G7lOHm8XL6VLU0MYVV5vmxzFbsnIr8Pbt9So
	IfHhYsx8etQ78NEXuuVYnfmNQRvM8obn1ezP4I+IUvPIrdkvUhzsIYpH
X-Gm-Gg: AYBFou0tYcImCg4rQykpzRu3Qw6O9x+b1L0cxCh5sT6Wwr1JECgXxWg7Zs+NCbXiHIG
	7JbYY/ep/4b0z3WAYfe0OCVY36RnLiLpy4JVvfTXa4tDfAdRhQZLrKwqjNaCeT54fIojFAdV6kL
	kIAY/qQ68db8f7ns0KsaTvJrqLi8C6MnvhKr7kE04nxA1YehUWYCPlluvLdClBhs4ndEo2oLyH5
	UmqEjzXnSsJSSOrddrnEl7heq5iIUf7dCkN2ooy3HjxFt1Qnk8ZdL0tIB+rHWA4NHNUkuJUg/Ur
	cXr/Gc0Lggc18IAau2XmJZIkl3d2sVoBnkIINpSScoHmMM7wPF1QSb89h/mesYnKZJA2OILQ7wq
	rt2ZA/BbBfUZeSI1Ay/8hVJyKYIdwfOnJ2g7spHcRuEokNaIr/NUzlPwZVK8Pxwx4hCDWN02Whl
	+bYNiUmAn2OegYSDCYMcxWdJHUAlhO3wKWAaQyPDQsq5IeeaIrsjyF5iW0hTEVRcQ0pbIvAekuf
	VSz9cl4lxFlTzi8hBUk9j1Eoq5fL+Rn0RC1SmftpRiAwPBHWZRQKupYt9psOHs/fkWHGbYiaaPc
	9c5HFU+nfFt+Y3vNLes6LEjk8qmkB4FImwABQywHd5+Y7c0ztz+lFTkkH8r07dd3SPwVxpenqB6
	+C1EqMZTOYvuv056oHEx3tOrEzsZtbIVOrnM6u5TnMoBxft4=
X-Received: by 2002:a17:90b:48c6:b0:3ac:af8b:6f4 with SMTP id 98e67ed59e1d1-3ae898352c3mr9667896a91.37.1793664249367;
        Mon, 02 Nov 2026 16:04:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:08 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v12 00/12] ALSA: virtio: staged capture recovery and PCM RESET synchronization
Date: Tue,  3 Nov 2026 09:03:51 +0900
Message-ID: <20261103000403.67106-1-mynameisjune111@gmail.com>
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

Hi Takashi,

This revision replaces v11 and carries the unmerged prerequisites.
Apply patches 1-12 to sound.git for-next at
a4311e9447bbb219044db38897f95be112f46a8a.
Targeting 7.5 or later still works for me.

Previous revision:
https://lore.kernel.org/linux-sound/20261031020855.2402-1-mynameisjune111@gmail.com/T/

The series adds staged capture for shared clients such as dsnoop,
lifecycle recovery and synchronized PCM RESET accounting. Capture
compatibility options remain opt-in and disabled by default.

Changes since v11

The ACK path tried buffer_mutex while holding the PCM lock. That mutex
can already be held during normal RESET, refinement and linked prepare.
ACK then returned -EBADFD despite a valid stream. Private accounting can
also change before the indirect helper sees the ACK error.

Patch 10 uses the PCM lock for ACK and prepare accounting, with a
preparing gate lasting until the RESET callback completes. The core
keeps that same lock through its public pointer rebase. Playback RESET
rebases private accounting while preserving queued TX ownership. Both
capture modes synchronize their private pointers with the common reset,
including RESET from PREPARED. Queue-to-substream lock order is retained.

Paused native capture accepts RX completions from the live prepared
epoch even when transfers are disabled. Refill remains gated by transfer
state. Resume preserves the notification floor, so real missed periods
retain their PCM timer ticks and synthetic progress adds none. Device
events and failed STOP latch XRUN and wake readers. ACK rejects invalid
or stopped streams. Failed PREPARE preserves the previous accounting.

Ordinary RX validates status and payload before advancing counters.
Empty STOP responses contribute zero frames. Full-ring XRUN detection
remains enabled: sample checks showed a real overwritten ring after a
220 ms observation delay. A candidate that suppressed the error returned
frame 31680 where frame 24000 was expected. That candidate was discarded.
The final code reports -EPIPE and recovers through prepare. Normal drain
returns the expected 64-frame tail. The full-ring check in v11 remains
valid; the corrected issue is frame accounting for empty STOP responses.

Byte alignment uses gcd(frame_bits, 8), preserving byte-aligned queue
boundaries for packed 4-bit formats. Broader format runtime coverage is
still pending.

Several findings reproduce before v11, including ACK mutex contention
in the earlier lifecycle implementation and playback RESET accounting.
The ACK mutex findings share one synchronization cause. The staged
pause-tail and missed-period failures reproduce in both v10 and v11.
The local comparison retains original, earlier and final results.

Patch layout and dependencies

  1-6: ACK errors, START/RELEASE recovery and request/DMA lifetime.
  7:   Core stop-threshold accesses used by capture policy sampling.
  8:   Partial-progress notification under the PCM stream lock.
  9:   Optional PCM reset operation under the stream lock.
  10:  Staged capture, lifecycle serialization and driver RESET users.
  11:  Staged capture work priority.
  12:  Capture compatibility option documentation.

Patches 1-8 are unchanged from v11. The previous core patch 12 moves to
patch 9 without a code change. Previous driver patches 9, 13 and 14 are
combined in patch 10 with the corrections above. ACK's preparing gate
and its RESET completion must arrive together; separating them would
leave an intermediate driver with no matching completion path.
Previous patches 10 and 11 become patches 11 and 12.

The core API stays separate from its driver users. Drivers without a
reset callback retain the ioctl path. Linked RESET and prepare stop at
the first error and can leave earlier members completed. Applications
must recover the group after partial failure. A zero callback result
allows the core rebase; later I/O can report XRUN. The internal
snd_pcm_ops change requires out-of-tree users to be rebuilt.

Validation

The final source matches the corrected candidate byte for byte across
all 15 touched files. The comparison includes 43 ARM64 QEMU runs, with
56 transition checks across ordinary/staged capture and KASAN/KCSAN,
and four linked prepare/ACK checks. Faults include ACK contention,
failed PREPARE/STOP, paused RX, status-only RX and invalid ACK states.
KASAN, lockdep and KCSAN_STRICT reported no diagnostics in those runs.

Uninstrumented RW and MMAP captures ran for 70 seconds per mode and
capture policy, with pause, RESET and reopen. All 14 segments,
14,208,000 mono S16 frames at 48 kHz, matched independent sequence
hashes. Native-pause tail checks and PCM timer tests compared v11 with
the correction. Core compatibility tests include 72 callback/legacy,
atomic/nonatomic and linked-failure checks, plus snd-dummy playback and
capture. Test hooks are excluded from the submitted source.

Each of the 12 reconstructed intermediate sources is checked by applying
its mail patch to the pinned baseline and comparing the postimage.
ARM64 W=1 Image/modules builds and additional intermediate-stage runtime
checks are recorded in the local submission package. Fifteen additional
VM runs passed, including 28 injected transition checks at patch 10.

These are ARM64 QEMU TCG tests with two vCPUs and 512 MiB. Physical
VZ/MOTU acceptance for this revision and broader format, multichannel
and architecture runtime coverage remain pending. Earlier high-load
TCG XRUN results limit performance conclusions; this revision does not
claim a general CPU or scheduling improvement. The optional core APIs
and linked RESET partial-failure policy still need maintainer review.

Coding assistance was used for analysis, implementation, fixtures and
this explanation. The patches carry Assisted-by: LLM.

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
