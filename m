Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85CF550DAF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991936; cv=none; b=iHJ2nLFwmjWQ4skQwiKBPuyTfQbXZSPbRpRwo0gby+sNg7eU+2D5c98BlOBJepRZCoH4pTDOAkBOs+8ZP8+bm1k5EBgqqMP/BDKUeGULU67cbR5WHISDJ9UP0klJEy4924KX1ZlY8gSHrhxBkSwSjqxd1FBPZStBiUihZjqfKyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991936; c=relaxed/simple;
	bh=gSKqSmXip3sn8EnFq9N3wtwsiEZNIKbyvltPr41U76s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0yCYN8wmePQae1iRg5yi+6w5zwGaqKxDTqX/grrFcgx/tNWbvLhpobFkqRKbZW97/fkeVZFW1VC+pKyvyVlVz8qD+xB30YJrrLB/toagnHl6oBvZBtpPc+gmLcocZbbk6Yf3mo12CMy4rnDopKzQn8eQXXD4WORHlSafXBMkQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFFcR/Cz; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFFcR/Cz"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2377648a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991933; x=1792596733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XqKz7CRVs28cW4eIvExMSd5yvZIIuml+6hL7rdRqk2o=;
        b=sFFcR/CzpPfyPMuwKJ9DfaDJLLV9L8Tm5LCFvXnm0R5w9qkeCyA818p+812MU/FXfU
         GGhHKW7VSoUxfE36yP39cDu3rE5ZQFXu/BoprgWRiXl7gJOY6adZyGzH4frZd6R2Iltd
         /9zYC3aHN8IOTHbS8GcJX65UN8Kdw+2D1d7BI9cVOgazrVgYCsFTXOn8VTaWoGXWzmuL
         axPBM502s1Sx0ApatQ7z1IxRpaGsHwFU0s0mbiKAlqvGyARSzMMMewNTqRmHnrhOWMJ0
         NOzA/Y6ob/R6ixEQpQS8H55CU+tBoBQwofIFRTTlUOqBO7vdqxof15wo2DUq64oJ7qHt
         miVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991933; x=1792596733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqKz7CRVs28cW4eIvExMSd5yvZIIuml+6hL7rdRqk2o=;
        b=j6f6fj4SfmGBQmImdKX6ogDD0tbItzybtGDYClY54Ku0XXTl1PWLsabkRoFda6Ghvg
         30iaHq+/WCJjbVcRTVAJ2K8cjYE0AOYdhvcvVOuQt700aN0Af4SiN+h3CYM2xhceVcc8
         HC/SR6t2hh9vVgJuGKmYF7VOfEiWYStfFHjXKvz8MYeKZsTzmvDC0xKBGlPG0byaTwIm
         p/zBjGlc3DL9jvEueJA19jzdJ5g/4IW2vrekl8L/abOhoh2YVhYA1e3pnw73JJ0ush6L
         JKE3j3HkC88tvScIsIYfqmPvRG6bDszk7Xi5ziPS3V0FHjlmTjLSx5eAG9xLD830oSMC
         x5Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzV3chUNaAqOCWCk8TF71TFIiSo5q4Uc941FL+EPsWRng5Egxqf8fkpA9rlsLhqlLS7QXJcXxi9p6XXztM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBSTNOs5GyVar4p0ixmCvcwgBzzjjnwdgpitKfS0JwvwUtBXJY
	CVTnLJ37hI9+VM8RtbsbprR91dF18/CvHn1n8Xi2TheutQaO8VxH+I0a
X-Gm-Gg: AYBFou2foEmEzLaWzze9/pID6Wj4b5g+M/UbEqfoyEJomDZMb4tzboIPZuKFkrnE2dE
	t6ntfFQ8UBkocIzbos8eIdStYvRd5pvqyCbhSnvUc++twiZgx0p7sNEnQqCbkPGXv6nb0/mPzlg
	dqlqx60iQeR+CzKcmZEi1KQ9yFF4k8677janIcNKPiJWKUKoFoD4i101zZaUQbfxVe1IUE+t2vz
	ziSW4ei0xQTSKokDtjwpZg1nK3TsmTaJFDjA+03raA+SasJlcMf//CTK6dMYopd7NGq8kVM+b+i
	QPFX5S2XMkB9i6Fw0iqqMRMdsQAPA9P8SmMjpWxwjVRdthAXUEcJ0twyh5ME22rxVhBGlqrU//k
	qHbUcNcfZ6WWzH8OFNImOzqbkQl4GnPPzYqnaLLSeM6wxpKn33Z/S2Y2Dh3mOYDtwu8BeiDmDec
	h7qCQtxevzKt1wEGhkK0Fe79raXjt0jgqiqRENiLK7yScpEU5C0pa+oTgzy9akVESrLcco6Zavy
	4urANbEzZWuMdw2FPXp1Xwbk2a6vHkdC1TjOF54ff2NgNzLvjcyPWPpJLKqMbNHsvPmppPGnGlR
	b4IxnjS04xsScL0=
X-Received: by 2002:a17:90a:c88b:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ab3af73a91mr13301264a91.49.1791991932825;
        Wed, 14 Oct 2026 08:32:12 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24af99sm4976795a91.8.2026.10.14.08.32.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 08:32:11 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/1] ALSA: virtio: stage capture for VZ backends
Date: Thu, 15 Oct 2026 00:32:07 +0900
Message-ID: <rfc-v2-vz-capture-compat-0.b9ab4c1540dc4691@gmail.com>
In-Reply-To: <rfc-vz-capture-compat-0.112c40f0e9284eaa@gmail.com>
References: <rfc-vz-capture-compat-0.112c40f0e9284eaa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This updates the VZ capture RFC with an explicit public base and its
prerequisite series. The implementation is unchanged from v1. The core
prerequisite is now the capture-drain RFC v3, including the notify=false
pointer update discussed with Takashi.

The patch adds request-owned capture staging, validates completion sizes,
and accounts for captured data independently of fixed-size requests. It
also adds an opt-in pause/restart path using RELEASE and reprepare.

The five module parameters default to off: capture_staging,
capture_packed_status, capture_allow_short, capture_allow_empty, and
capture_pause_restart. Enabling the profile is still an explicit choice.
Automatic VZ detection, a negotiated feature and Docker Desktop host-audio
routing are outside this patch.

Please apply the following on base 8d70e364e866, in this order:

1. The five virtio-snd lifetime/error-recovery v3 patches:
   https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/
2. The generic teardown wait RFC v2:
   https://lore.kernel.org/all/rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com/
3. Both core capture-drain RFC v3 patches:
   https://lore.kernel.org/all/rfc-v3-core-capture-drain-0.cf2e307fcac34b6a@gmail.com/
4. This VZ patch.

The trailers below identify all eight prerequisites in application order.
The three prerequisite-message-id hints identify the public Lore threads
containing them. I fetched those threads, checked every stable patch ID,
and applied the stack from the declared base. The resulting nine changed
source files match the kernel and modules used for the tests below.
Use core v3 in place of core v2; the two revisions must not be stacked.

Core v3 refreshes capture pointers inside the drain action and suppresses
nested stop actions during that update. Its proposed error policy ends a
failing capture member in SETUP while allowing a healthy linked member to
retain its tail in DRAINING. A blocking capture-only drain returns 0 if
the action otherwise succeeds. Whether it should instead report EPIPE
after stopping all members remains a question in the core discussion:
https://lore.kernel.org/all/core-drain-linked-lock-reply.cf2e307fcac34b6a@gmail.com/
This generic core behavior also applies with the VZ parameters disabled.

Validation with the complete stack above:

- Rebuilt the ARM64 Image and modules with W=1, KASAN, lockdep and
  atomic-sleep debugging. There were no build errors or sound warnings;
  the base emitted 517 -Woverride-init warnings outside sound/.
- Passed 10 QEMU scenarios: short capture tails, drop, delayed
  PREPARE/START/STOP/RELEASE, pending RX after RELEASE, and held STOP and
  RELEASE requests followed by SIGKILL, timeout, reset and I/O recovery.
- Passed 24 synthetic linked capture cases across atomic and nonatomic
  locking, covering pointer faults, tail reads and reopen/recovery.
  Two additional unlinked controls also passed.
- Candidate runs produced no KASAN or lockdep diagnostics.

The QEMU tests use modified fault-injection and backend-reset fixtures.
The rebuilt stack has not been tested with a physical microphone or VZ.
Earlier AirPods results used a different kernel/module set. Input
switching, sleep/wake, freeze/restore, physical non-coherent DMA, NOMMU,
other Docker VMMs and mixed capture/playback linked groups still need
coverage. Nonblocking drain behavior has only been code-reviewed.

The existing public test package is at:
https://github.com/whatisyourname0/virtio-snd-reproducer/tree/64fa85f3260b45e7dbb85c4eee68a5b4a8b064e1/rfc/vz-capture-20261014/sashiko-followup
That snapshot contains the earlier core v2 source. The prerequisite mails
above provide the exact updated stack. The new linked capture fixture and
comparison logs are still local.

I would appreciate feedback on these points before splitting this up:

- Which observed behaviors should be fixed in Apple's backend?
- What activation mechanism would be acceptable for the compatibility
  profile? The module parameters are experimental.
- Is RELEASE/reprepare an acceptable way to implement pause for this
  backend, and what constraints should it have?
- How should capture staging and lifecycle handling be split for review?

Thanks,
Joonho

Changes in v2:
- Pin the public base, list the eight prerequisite patch IDs, and add
  Message-ID hints for the three public prerequisite series.
- Use core capture-drain v3 and report tests on that integrated stack.
- Preserve the VZ implementation and its existing human signoff.

Assisted-by: LLM

base-commit: 8d70e364e866bdfca81eee24d0688fac9472cfb9
prerequisite-patch-id: 39fb327a004c966ab90f66a34a64bbdbb3ffb475
prerequisite-patch-id: 7c6bc344656fd839ae0d697ba18d66ac0b47827a
prerequisite-patch-id: 9dd290ac3147fa7b49a475d7df8a6172778f2860
prerequisite-patch-id: f4c24a5e441343a690f4ac2437f181c815bc23d0
prerequisite-patch-id: ab4a5b770247a65272ab7af18a75a147daf81287
prerequisite-patch-id: cfe3e7000e695a2fda27993f4d9acf0a637cf24e
prerequisite-patch-id: 0fc5fec2c6ac5d3043cf2210570472ed4ce32952
prerequisite-patch-id: fa5c13a4c698a82bdce335a34c22e66bf72960d8
prerequisite-message-id: cover.1791881787.git.mynameisjune111@gmail.com
prerequisite-message-id: rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com
prerequisite-message-id: rfc-v3-core-capture-drain-0.cf2e307fcac34b6a@gmail.com
