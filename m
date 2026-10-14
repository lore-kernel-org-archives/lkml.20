Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E013290C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948653; cv=none; b=bdwrSA6yIM8ou45XlWRj0hUTQn6PF95cQf0Aj0vtcDtYWR1xEFOlzrD5pa6fV+0hhqAxQ339u+NG+0MjMS3I19ct1sVd7uGDj+EFWoLBetSO7iqcJBrKWBqbk4Cg7HYCokDS1E6B8lUekAUQunpqQyEFGYM547L5uiwlxFQ2tHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948653; c=relaxed/simple;
	bh=8CHjeP8Mcvlw4nYB4mBgVrd6fK9AW4ESlUiGSAostRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZVy3iw5uhxftrcUKpNlvYv5bbPjDeFBsRDHny9pAo92eC506F54SJdDSTHcNzLWYFkDDcejvmIYOrNwqjR6cIq5EBScPpWTlDy0470/a4CUJBw7KujCFtBry3nFa7swJFBdB6egc9X/jzHcfZa2l2fcsEQDcP7WojMiGZp8vZAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXT96II2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXT96II2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so3016844a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948652; x=1792553452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRRWOWhQpgmt5kMWASSP/J+1TU6R/Bcg+mscQbFyQU4=;
        b=aXT96II2I5Fi/Dia/I7hmpqjVCtI/VELYT4jHjKoanrcCdxrRF//IwhGobrDfIjbdj
         ed3uj2aPkhRmnl6hWHwMjWaeUOEC0p0BhyuxTtixnM2frAJ1+4sdwo24Vd0vSF9HnO1l
         taUMR3xMBm1iU421GlEOxnZevwv6FBEpHqbUwthWPRBhOpuisrd+/B1gupsKP187iuTE
         1WEthHyTOZ1O9eDXGkHqy1hoJCoGM7HETQZxrZzc3aUuG5RS3E8rUHKX02UHnIg5V3Mt
         qHEPABQNwTNfguA37umDh/ExmMCTjsDmweDK4ND1/DSOOIcbwWQMIY/TeRMHg7ILfrcn
         mrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948652; x=1792553452;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRRWOWhQpgmt5kMWASSP/J+1TU6R/Bcg+mscQbFyQU4=;
        b=RBb4hjTQYAF3xdep8U+pUtddQ2XebaUD+mAUuu/qGSGXVMcIW/JN8sJYZuFL0TdzNK
         +jnuT4fBv1QZVWZiGzADx6BgcpYiFRzmeZ4kwjVoCEp9T2ORj2j26I8MlAP10pLqbBCm
         fCoxIL/8y6KEfjw3SIGB6IbxgRGU2Zin/N0oYKSXmPvfrXI/sWV5qgSLMKfK4dz71UZr
         gau8upX4WCHuPRnsdIddyWL6F5NUMQV2O4oH1QOdIBE4o4ovuwekYk8/1Sl8NNlmn79/
         rS6cx3E45QiuVNXOH92O8W8zPcJWzUy6zP7WDVtcSIUKmDFftxizECRRJISVhsUKsi4N
         n16A==
X-Forwarded-Encrypted: i=1; AKwUvBylPKVLhfe1pAxLoWTwKGIdCF2koUjOHdZkiY9kaIpXoHYdolnEitw7IDfDmxaTYOU2BciFQhUYrJYIpS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXhaXgAdJU49Ed1E9/fpeoqxKHcE0+yzzvyxyTvbwLfPzTKxgy
	fWfC9UksrKbxNcP3LSEZR4zRlkAkvYT4/iZNHEOTaepc7fBX1sp83YUS
X-Gm-Gg: AYBFou2iWGtjJwh5Pj+6OPBoiDHdZG7fLpQu/kDT8naoTq/F3CSe+uYY6qAJjgXqYRN
	Gqc9jCL5NPv6gc8pgIVRmAljCWjiEWo+KC6eSmXUWQ+ohNVnkby//fLP1i7ixImuHhAd11bEFdS
	DuvhB0bbj19pGdWnXonUh1rqUBhb4CRI8A6Bc5112n5MJx3zGPG9h9owuoxRHf17wjkLo9SIHbj
	GsQmRiOf4ZmFIqe2Ohg/URQH4/1LATVLCMxzZZWv6WKj9Vv96j6ZF7Mifd0/Z9FyCRYQ209uxIb
	izdwwRYktmMsWTeoL2/lHBqJyHelt+88QX7E0obapYrI1ok8MjvXtKqslBNTxEjty+c/oPBUal0
	Eez1cnLeEkanqhCUJs2t2Vti0zM6IV/zMUAni1c7KgnYE5t0PnD+RyQXLaGB6jv+/+bzFpVKBee
	d3hUW4zOazm7eJsBQo+pRrGALcpyxT85fP4f+6Oiri0KcMgxYU0WwLmsxRktNxSnGQt+n0hZHAq
	Io/hDz0RgMRpLf5MUG3OesCa5f255dHvYvCUHABzU30IxJOXzkiqXAM4cCbfyLraw5/YisjMaMK
	9QUTAp2gZUtxa+/iShjcEDpnrAg=
X-Received: by 2002:a17:90b:1c87:b0:3ab:d26b:c2d1 with SMTP id 98e67ed59e1d1-3abd26bc3demr9656235a91.11.1791948651628;
        Tue, 13 Oct 2026 20:30:51 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6019ca59sm2504749a91.9.2026.10.13.20.30.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 20:30:51 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 0/2] ALSA: pcm: preserve capture tail during drain
Date: Wed, 14 Oct 2026 12:30:47 +0900
Message-ID: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Base: d58a3ac9b1719fdf8ce9d286be606128aeebf1aa
      ("ALSA: virtio: Keep control payloads alive through DMA completion")
      Local tip of the five submitted v3 patches; not an upstream commit.
Previous series: <cover.1791881787.git.mynameisjune111@gmail.com>
Link: https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/

This is a follow-up RFC, not a replacement or v4 of that five-patch series.
The submitted v3 fixes ACK error propagation, failed START recovery, and
message/buffer lifetime through completion and reset. It does not add the
VZ capture profile or the ALSA core drain handling in these companion RFCs.

This series proposes two changes to capture drain handling:

1. Permit capture transfer calls while the runtime is DRAINING, so buffered
   tail frames remain readable instead of returning -EBADFD at the state
   check. Playback access rules remain unchanged.
2. Refresh active capture hardware pointers before the linked group enters
   DRAINING, so a final subperiod tail is accounted. Hold the link read lock
   across the initial operation and take each member's stream lock for its
   pointer refresh. Propagate pointer errors before the drain transition.

These are ALSA core changes, not VZ quirks. They apply with all VZ options
disabled and can affect other capture drivers, including linked-stream drain
ordering. No new ioctl is added, but applications can observe buffered data
where the previous state check rejected a read. The appropriate core drain
semantics and locking scope need review independently of VZ support.

Dependencies

Apply these two patches in order on v3. They do not depend on the companion
STOP/RELEASE wait patch. The VZ capture RFC requires all three prerequisites.
The base is pinned for reproducibility; this is not a claim that the core
changes are inherently dependent on virtio-snd lifetime fixes.

Validation and limits

The complete local candidate (v3 plus all four RFC patches) was freshly
built on 2026-10-14 as an ARM64 KASAN Image and installed module set with
W=1, release 7.3.0-rc6-snd-lifetime-kasan. No old kernel objects were reused.
There were no build errors or warnings in the changed sound paths; 517
-Woverride-init warnings remain in two unchanged ARM64 base files.
This is a rebuild of the pinned candidate, not a rebase to a newer upstream
or sound maintainer tree.

With this kernel under ordinary TCG, no-query short-tail drain returns
1023 frames (FNV-1a64 20d61b4edef6d535) and 2047 frames
(af2de207e4d27535); drop returns zero. Each run also passes a following
capture with fatal-overrun checking, playback drain guard and teardown.
Earlier W=1 core builds included patch 1 alone. The separate historical
linked-pointer-error fixture used an earlier stable virtio-snd module to
isolate the core change; it is not one of the ten current candidate cases.

The QEMU 11.1.2 fixture includes backend reset cleanup changes as well as
fault injection. These are integrated candidate results, not standalone
v3 or isolated-patch proof, and not stock-QEMU, VZ or hardware acceptance.
Earlier runs failed follow-on capture with ring saturation and overruns;
those logs remain retained. Final passes do not establish a permanent fix
for load or clock/scheduling sensitivity.

Physical ALSA devices and the full range of linked capture/playback groups
remain untested. Historical AirPods capture does not isolate core drain
semantics. Playback access rules remain unchanged, but the shared drain
entry locking/order changes also need review for playback-led groups.

Reproducer

A source-only bundle contains the pinned base/v3/RFC preparation recipe,
kernel builder, QEMU patch stack, guest probes and all ten runtime commands.
See qemu/README.txt and qemu/VALIDATION-RESULTS.txt in that bundle. The final
runtime set passed under ordinary TCG; no KASAN/BUG/WARNING/oops/panic was
matched. The 24 Python harness tests and relocated source comparison also
passed. Existing v3 patches are included only as build prerequisites, not
for resubmission. Reproducer source (pinned commit):
https://github.com/whatisyourname0/virtio-snd-reproducer/tree/7a9876738bdc70ce669f02ec31fe8968eb0ee4fc/rfc/vz-capture-20261014
The source bundle includes qemu/README.txt with the full build/run recipe,
qemu/VALIDATION-RESULTS.txt and checksums. Downloaded public files were
verified against the tested source package. Bundled RFC mail drafts are
reproduction snapshots; these emails are the submission copies.

Questions for review

- Is reading buffered capture data in DRAINING the intended ALSA contract,
  or should the driver expose that tail through a different transition?
- Is drain entry the correct place to refresh capture pointers, including
  when draining a paused stream or a linked capture/playback group?
- Is the proposed link-lock/member-lock scope appropriate when a pointer
  error can stop the group? Which other driver or linked-stream cases
  should be required before treating this as a general core fix?

Joonho Lee (2):
  ALSA: pcm: allow capture reads while draining
  ALSA: pcm: refresh capture pointers before drain

 sound/core/pcm_lib.c    | 10 +++++++---
 sound/core/pcm_native.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 10 deletions(-)

