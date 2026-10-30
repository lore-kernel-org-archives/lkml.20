Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793337996;
	b=gq8G3HfFo30EugizkV21PGLD6qvI6zrzNOJyllcwNGDY+SvGzSbp3lkONDhhhf53/fTJ
	 dCLqW+oCvAvzJOxzvzRAbdBf9a8ZI9OMjs5YJXczbNpX6DODib2iuXG2c+mngrOa3ybvV
	 Egxuh4yy6OHF4N2AH5QDzjGyL0BN4mU44VEkxhoaMQIaOZImMzrLH1mOA7mbB96sjVXRT
	 ywOCs2hHdLI/dziOBHwP3enUgDP4yXOfoyop/7wLpkkGPuJAdlxlQi4HuAO6tnj88Klav
	 Hp5RdPO0Xj95mhPRTznuhdputrDie7I4e16UaQdhPGysqgpKOto/S9E+ljDNNHAhh3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EYLJkULI4RCqRinApGy05xYoNrT80+MOd8wREM3Ge2s=;
	b=QQZALUDCUH9AqCUUgMo21k+DZ7nIHorjy79yfTPnJm1tOth81CPqURBcMUbvcKLubx/0
	 qvvjuzvHHL2izShVKOCL70byXlnMYn23I1AqvyjtlWTNQXEXG/TvZClQ1qyr+mjyeYpEX
	 7oRKF4JhDNkBcEyPKzts7MJHrYjGMxjDLildsNPOFS+gjL+o47URF1y/XDrYDvlQor61G
	 1vJQqs67UH4ImBXg3e5PZd4NsTcaRyAQYlqNC0d9h6VgOCbPVWLpHb6orNj/7N63ASOq0
	 V8edXoGIPw2JO8168IMVTGE6KBHnWLAMYm7HXYg9gk1MGP9ePjv5piyR2G5UOOSa2ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBHNmIiK;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B66606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBHNmIiK
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so131126a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793337996; x=1793942796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYLJkULI4RCqRinApGy05xYoNrT80+MOd8wREM3Ge2s=;
        b=XBHNmIiKhTKucSo1DaUnHEnqdoTMSrYApbsQpUxmRwR6OMjVuJ4PYbJNA0QO65MUR+
         vD02OU2lrvUAqcp9zK91VPlx7qx+PPHi2tP2Y4J8yHvG33F+5GActOSCDpnkUbDZURhC
         ejsPs+tSMz1CWNlGHlriBoUH4rruFFkCqpG8GXjp5W0kov5t04VRsxhpFHThbRBUBH1l
         AqkoBKxUkfslDqVWc4SsedBo/o+r4II40bbh8xxorpzjxoz19sHQ1rdjnOoEGX1lJbvW
         llkRZDjoN8/yLoRTnTrysq6yvu1gglr2VDVOeALR/KtgY6KwUjoEhaW8eAEjNxaHuKRD
         TNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337996; x=1793942796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYLJkULI4RCqRinApGy05xYoNrT80+MOd8wREM3Ge2s=;
        b=vBgNM21gqtB6JxXhCvwDU/MFHV2nEqYQrkULeflaqzc9PU5QIb66ehZLmsdH/AgqEc
         /7joQ/JnJ8Zr/PFBdSB/n8p/ZTAjhZ/sHlLh1TV6rwGQ74TloMfEj9p19Lz8XR3k1qZZ
         vehSU75dvukUYNEKVRVk0ON1IJR49NPKWclceiVVQsJN8BS1B/8yG+yJsarxzcziMzW0
         nWCzjIay+ip/6zl5wNgzMZogVVr+c/WwWH4DIdGYIvnf4+flij8+fkVs1YDO2ZzlobuJ
         pvpEn/yutOOQlnr7tSW64D/ElgqOaBs7JYA9U6Pt02mClQdK+R7FPbfzB8v1l3Dm/z+l
         FMpA==
X-Forwarded-Encrypted: i=1; AKwUvBw+n/2WXD1cktc32OmWDkA6Nh9MpjhrR9fYt3ULxXDtOlyZ9ydWeV0J7Ci6miGIkl4eSJ5hEUBuU8lqxEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTC+yUSwZ/mF5L5I8lUJiomZaftN9cUFFxvICVqq0AnbHDkT8L
	KAKy36krs2lFP1ueYaqfyez8N7FuJ4fP2If/YV7bfkl4qdsdJtUkZNRk
X-Gm-Gg: AYBFou2WKZzfVR8ZaQJCYXIBYWMnWI+x0BPg2nwoT4kIBN2d0bMy26nejcM/eUAjxnE
	1qcB0bVSBx3UrCxVx+8BbXK8qCFOJOlmMX1zut5DuypoqOUQywn86VBp+IEBJ+ZswbgQOwumQT5
	TQOXakznjNWF8XLUjGkZd5b62XCNHrkqRQODcFAaaI8UqXN/tIVP3BNDxBMn76MqU5U5Wx3az5d
	4n2cm8pOs7wdGMLbWKjCrh6JAhk5FqNTDNsXgkhMFt13o1/Bvbn1pUCQEMwnw0EZO5ed8wOjwOG
	hXLc/UsuWk+MdTfLR/H10OCWZdfTY3qOTlGM+H5/+w7T5VH69Jr2qrw4fF6hrQ/oAgBQiDo1gO0
	SgvnncxOKYb7XyTyW1URLFlR+yoMkeN11bPcLIJxQ4zgTwroSo3Ko06b4ZgnijCOphty1FcKR9B
	WwXnlhU+FPWJYOq8QzQtB7lATsPq1FbiedpYWiJKzpXAX7eGQ3Qc0XE/41Hh3oEFkXEnY8VTEHB
	3ggQ5ZHppoxgrqSKSRdTO50Fy0eAp7xBgHAt1oknMBz0qYFYKzgMZsk/VK3JeVhLBZHFQhuq4c6
	Gdpg1rjDwmITxRLqAJWKUWHKBgn6oHk8UUD8F1nw0V9hN5M/MuFep1SdCTdSJcZDy7c6fw4duKa
	JtoTnKOFB+w8/JPLEJILoj+cXCHiRFKkz5xSm+2FNRIp3jAynPh5cBIEKPYQOFD++WkHA
X-Received: by 2002:a17:90a:ec8e:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3ae897d5fc0mr792195a91.34.1793337995724;
        Thu, 29 Oct 2026 22:26:35 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:34 -0700 (PDT)
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
Subject: [PATCH v10 00/14] ALSA: virtio: staged capture recovery and PCM RESET synchronization
Date: Fri, 30 Oct 2026 14:26:15 +0900
Message-ID: <20261030052629.27742-1-mynameisjune111@gmail.com>
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

This revision supersedes v9 and includes its unmerged prerequisites.
Apply patches 1-14 directly to sound.git for-next at
a4311e9447bbb219044db38897f95be112f46a8a. Targeting 7.5 or later still
works for me.

Previous revision:
https://lore.kernel.org/all/20261029085032.70689-1-mynameisjune111@gmail.com/T/

The series adds staged capture accounting for shared users such as
dsnoop, lifecycle recovery, and synchronized PCM RESET accounting. The
capture compatibility options remain opt-in and disabled by default.

Changes since v9

Sashiko raised five findings in patch 9 and four in patch 14. I folded
their fixes into those patches. The other patches retain their code;
patch 13 has refreshed hunk positions. The final postimage matches the
candidate used for the new regression tests.

Patch 9 now checks for a detached virtqueue in the PCM IRQ callback.
Period work is disabled until open succeeds and disabled synchronously at
close, including ordinary capture. hw_free cancels work after teardown
even when cleanup returns an error. These changes cover late producers
after reset, failed restore, and pause-restart error handling.

Playback and capture ACK take each runtime's buffer_mutex with a trylock
while holding the PCM lock. This excludes prepare without waiting in the
reverse lock order. Linked prepare marks buffer_accessing negative only
on the member that initiated the action, so checking that counter alone
left later members exposed to the old appl_ptr during counter
initialization.

sync_stop checks the PCM state under its stream lock after acquiring the
lifecycle mutex. This waits for trigger to finish and preserves a newer
active stream. A definitely rejected native pause also refills RX buffers
that returned while transfer was disabled. Failed recovery latches XRUN
and keeps the teardown obligation.

Patch 14 suppresses ACK refill during the common RESET pointer
observation. Paused RESET observes the latest device pointer before
rebasing indirect positions. A late refill failure retains XRUN across
capture completions, and RESET avoids scheduling new work while the
device is resetting.

A further playback check found the same prepare/ACK window: a forced ACK
consumed the old appl_ptr after the driver counters were reset, and the
first write failed with -EPIPE. The buffer_mutex trylock now protects
playback as well. Limiting the XRUN latch to capture also preserves the
earlier TX completion behavior and playback pause/resume after an event.
Both cases passed with recovery and reopen on the corrected candidate.

Patch layout

  1-6: ACK errors, START/RELEASE recovery, and request/DMA lifetime.
  7:   Core stop-threshold accesses used by capture policy sampling.
  8:   Partial-progress notification under the PCM stream lock.
  9:   Staged capture, dsnoop policy, and lifecycle recovery; uses 1-8.
  10:  Staged capture work priority; uses 9.
  11:  Capture compatibility option documentation.
  12:  Optional PCM reset operation under the stream lock.
  13:  Staged capture RESET accounting; uses 9 and 12.
  14:  Ordinary capture RESET accounting; follows 12-13.

The IRQ and work-lifetime fixes are present from patch 9, where their new
lifecycle paths appear. The ordinary RESET observation flag and error
latch are introduced with patch 14. The two ALSA core API patches remain
separate from the driver changes that use them.

RESET behavior

The callback retains the common pointer and time handling through
snd_pcm_lib_reset(). Zero permits the core to complete the member's
position and appl_ptr rebase while holding its stream lock. Drivers
without the callback keep their existing ioctl path.

A late refill failure permits that rebase and reports XRUN afterwards.
RESET can return zero before the notification worker publishes the error.
A nonblocking read can initially return -EAGAIN and later -EPIPE; paused
resume is rejected. Prepare or reopen is required for recovery. Linked
RESET and prepare stop at the first error without rollback, so earlier
members may already have completed. These policies are unchanged from v9.
The internal snd_pcm_ops addition requires module rebuilds.

Validation

Seven reported conditions were reproduced against v9 and passed with the
fixes: the NULL-queue crash, prepare/ACK interference, RX starvation
after pause rejection, stale sync_stop, nested RESET refill, stale paused
positions, and loss of the latched XRUN. Prepare/ACK tests also covered a
real linked playback/capture group with capture as a later member.

The two work-lifetime findings share the close barrier. The original UAF
itself was not reproduced. Tests exercised active freeze, RESET, failed
restore, close, late work submission after runtime release, and recovery
for ordinary and staged capture. The uncertain control-result subcase of
the pause finding was checked statically; the forced pause rejection
tests used a definite error.

Thirteen fresh ARM64 QEMU runs passed with KASAN and lockdep after these
playback corrections. For each capture mode, an uninstrumented build
recorded 70 seconds through RW and another 70 seconds through MMAP after
paused RESET, followed by reopen checks. All 14 captured segments,
14,208,000 S16 mono frames at 48 kHz, matched SHA-256 values generated
independently from QEMU's sequence metadata. The comparison accounts for
the intended RESET discard boundary and the backend's epoch change at
restart.

RW and MMAP use separate VM boots to stay within the test backend's
4,096-response limit. Test hooks are separate from the submitted code.
ARM64 W=1 Image/modules and ARM32 LLVM object builds passed. Series
application checks compare every intermediate postimage and the final
source with the validated candidate.

Three fresh intermediate stage tests passed: native and pause-restart
capture at patch 9, and paused MMAP RESET/reopen at patch 13. The three
patch-13 capture segments also matched the backend sequence. Stages 9-14
built without compiler warnings. Separate failed-START tests checked
prepare, direct reconfiguration with the same geometry, and close/reopen
recovery.

Earlier prerequisite and RESET tests remain relevant where their source
is unchanged. The new 70-second results do not measure high-load
behavior. Earlier TCG tests had reader gaps of 165-283 ms against 160 ms
buffers; those comparisons cannot establish performance equivalence or
exclude a regression. Work priority provides no real-time guarantee.

This revision still needs physical VZ/MOTU acceptance, a separate KCSAN
run, and broader format, multichannel, playback-error, and ARM32 runtime
testing. Playback event tests cover completion-policy preservation and
pause/resume, leaving broader playback error validation pending. The
partial-progress helper and linked RESET contract also need maintainer
review.

Coding assistance was used to analyze the reports, prepare the fixes and
test fixtures, and draft these explanations. The patches carry
Assisted-by: LLM.

Thanks, Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
