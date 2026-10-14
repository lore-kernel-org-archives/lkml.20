Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F40552956
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991464; cv=none; b=llId1eY3+P85L9jHElcK2uxFtIkVubZcp34RfIIVfqDu2NP0sZ+jX39qCEW9htS6zfDUR35ikhY0LI/vWSg+XAqPj5r2LzzR3YRGGiRFSeM6GzIENFZ+z8ERv+UWUUj+3xdwjTY5oelYKjRzAXFC65vqlie9Zk3mmmUPbAypxgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991464; c=relaxed/simple;
	bh=uJs7Q/nbINZCv8pxkeEm5kUTXjclJUkD8CviIygWOgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=usOgBCWMI6mHuvqaQL/mU3Hf2+CSdN8cY/MjzevsFXx93Yn6UDavND8g9qP7Dhwywk5E4vBXKqTzPbn22/6PBxcVmBEUfDo5JmkHJUnVR7/prLHxH/su1i9OauFqwfhzRFzMnFU5uSuHGbMiZsRJg8AHC66N7NlPHRaN9/VvLcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=saIRvitx; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saIRvitx"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so2683227a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991463; x=1792596263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VKfw1rt9H81CsdERhpyJEUv2S5zyztQdAr0TPPYK7vk=;
        b=saIRvitx+qGDE2zsMv1LvHfzrH2/EEe+JPt3F1fhY2SHIZn8cyOG+pBeT0mke7//Hx
         iCAYa+KINCS6kM5vL3QaS7Sy4xfZh4q9KKW99jN3Lyw7YgaJM1JGAr8TFO8fEmom2lF7
         cHCo4ENwk3Ek4srwnIJkp9K9roLMaGIrpRl/MLUNF/0WMNF/ruVOQoHn8yyxFcXkMe+7
         0/GsjG+OZyf8YytoQC1XKeLYWmdWUY70FuLsF/r8fwTRUhwCl9foHaBwSLySVYmDUE09
         5r0JSl7YQ57opxJl69w/nrEg5id6dfVF74wAMnA7RbSTD/ss/u3m95ws+vW+BmY8kFhu
         m3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991463; x=1792596263;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKfw1rt9H81CsdERhpyJEUv2S5zyztQdAr0TPPYK7vk=;
        b=maiWLathlP90gz34WGZ1CerK9zjsOgLOL3GFdOwiCxBWmmg/gA8RPRy3Sb7gLAov8n
         KuIp2din5qn3ngRK3tZAHZ/WE/2jCT1DPf+5a/289aclBlIhg/yspwRvMWbcG0l0IBC3
         nsb7b9NmS32WLxo1YJrBNsr9HW5091cHz0iV//e5Cet0/t6PkXQi7TiS7KRl2qiwrqKJ
         j0ZiBSrp5fC0seQxonNIEAEhOHjZACrzDHzXeuTMIWll27J6WbDNz5LOJrpx6VpPm5pQ
         ft0AmcKrMS/rCQ4T/xnULwS6j/W8JPY1FZLWQ4W4QpxfsQW35v0BvGvtuiVU6w7VPHzG
         Q9Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwPCJuLshODNNoiYLWucCSorkKLuqCFW90LfjvGVS73dm1IV4yM9fUPY54lTGMcTldLrpQt5vsTbWDxNYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWwEwGrSdUPsrtUiOW3IqbhwkYhxq4W/tWMx9Lfw8Re8JOuJTM
	ykFheQT7cCk+ZFRysq62cl8kH9x7UmZv9VAEOkx9yJ+D6ZlavW6cXdmc
X-Gm-Gg: AYBFou1UM+xlEiHwYQSG+xQguiZCkC3nCVL00ZUkzK+Hsg1ZjgidWS21HXYNd5nLiaL
	OsAOn4umaZ7LC2EkWCAKpw2xtOk+Q8HZOFaotaEdjre9BE4uu/Opj7vT2UtKkcyi5vCUOvhDdiC
	WULw6RSkXuccB2Wj3Xba7JVWfHgmNlVLNscZpaNA9aEdkleLIFNqIFuJszM+Jp1TT9BuC+NQ34L
	4RF1HkPsUYtP3lT+b3Up+H6IFNfGqlDek/6EGtQZXo3Hp23nvhxKIwNen+TCqwsUZeOok5Zv8uL
	sktt/lE5n05LaIRuIhnUxsqjDVgJBM/xpSQCp+ykCJzrSHqzU8raO40p9FWyaCrpcMRZq4jBBaG
	IxWjDe44yQfskQ1Zmb7oZMevIbGH6KikFauwGdEvKxvs670nbH5Zud2B84nSwKp1fGAyCUr/9IO
	Tx/Ma3jzsPLZoMS+42A6Vu33GKD2O6cCSKYdI3CscRd3KB5mlv12ylx0Xq50km6PvwLcmv12wCq
	RfHRol+s7eoW9WSgx3NKZat/Sm7+B0WM1jLN13CRqtdTVd2RnFesfWqdKr7UzdtfzXfSpAEy2Xh
	oPEEfzAU6Cg3qrI=
X-Received: by 2002:a05:6a21:7a8b:b0:3e1:46cb:494a with SMTP id adf61e73a8af0-3e16bec12cemr12908889637.57.1791991462425;
        Wed, 14 Oct 2026 08:24:22 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dc37c2c1sm6096526a12.6.2026.10.14.08.24.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 08:24:21 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v3 0/2] ALSA: pcm: preserve capture tail during drain
Date: Thu, 15 Oct 2026 00:24:16 +0900
Message-ID: <rfc-v3-core-capture-drain-0.cf2e307fcac34b6a@gmail.com>
In-Reply-To: <core-drain-linked-lock-reply.cf2e307fcac34b6a@gmail.com>
References: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com> <rfc-core-capture-drain-2.112c40f0e9284eaa@gmail.com> <8733u8g0kh.wl-tiwai@suse.de> <87y0c0el29.wl-tiwai@suse.de> <core-drain-linked-lock-reply.cf2e307fcac34b6a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This updates the core capture-drain RFC to v3. The separate five-patch
virtio-snd lifetime v3 series remains unchanged.

Patch 1 still permits reads of buffered capture data in DRAINING.
Patch 2 follows Takashi Iwai's suggestion to refresh a running capture
pointer inside snd_pcm_do_drain_init(), under the existing drain action's
stream and group locks. It removes v2's separate pre-action traversal and
link rwsem handling.

The pointer helper accepts a notify flag. Drain init disables nested XRUN
and drain-complete actions and owns the subsequent stop/state transition.
The direct SNDRV_PCM_POS_XRUN return from a driver's pointer callback needs
the same guard as the stop-threshold path; the sketch did not guard that
early branch. Ordinary pointer updates and period notifications still use
notify=true.

There is an observable difference from v2 on a capture pointer error.
V2 returned EPIPE and put the linked group in XRUN. The new callback ends
the failing member in SETUP and continues processing other members. A
blocking capture-only drain returns 0 if the action otherwise succeeds;
an unaffected member's valid tail can remain readable in DRAINING. The
failed member has no readable tail in SETUP. The existing nonblocking
EAGAIN policy is unchanged. This policy remains open for review.

Takashi's later reply proposed calling snd_pcm_update_hw_ptr() directly:
https://lore.kernel.org/all/87y0c0el29.wl-tiwai@suse.de/
I tested that literal alternative with a synthetic linked capture driver.
A later member returning SNDRV_PCM_POS_XRUN recursively enters
snd_pcm_stop() while the drain action already holds the group locks.
Lockdep reports recursive acquisition of group->lock (atomic) and
group->mutex (nonatomic); both runs remain blocked until the 45-second
host bound. Unlinked controls complete with both implementations.
The candidate therefore retains notify=false and guards both XRUN paths.
The deadlock above was reproduced with the later direct-call proposal.
The submitted v2 used a separate pre-action traversal.

Initial review:
https://lore.kernel.org/all/8733u8g0kh.wl-tiwai@suse.de/
Previous core v2:
https://lore.kernel.org/all/rfc-v2-core-capture-drain-0.2eddd58a796e497f@gmail.com/
Lifetime v3 prerequisite:
https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/

Apply core patches 1 and 2 after the five lifetime v3 patches on the public
base below. Core does not require the generic wait or VZ profile patch;
this base is pinned to reproduce the integrated test stack. Replace old
core 2/2 with this revision.

Validation on the rebuilt 7.3.0-rc6-snd-rfc-tiwai-lockdep ARM64 kernel:
- Full Image and module build with W=1, KASAN, lockdep and atomic-sleep
  debugging: no errors or sound warnings. The base emitted 517
  -Woverride-init warnings outside sound/.
- All 10 QEMU scenarios passed: short capture tails, drop, delayed
  PREPARE/START/STOP/RELEASE, pending RX after RELEASE, and actual held
  STOP/RELEASE with SIGKILL, timeout, reset and subsequent I/O recovery.
- All 24 synthetic linked cases passed across atomic and nonatomic locks:
  zero/tail data, sentinel/threshold faults in the first/later member,
  normal active XRUN reporting, unlink/prepare and close/reopen recovery.
  The shared-STOP fixture also checks a later member's frozen final tail.
- Two additional unlinked candidate controls passed and matched the
  literal proposal's unlinked state, read error and recovery behavior.
- No KASAN or lockdep diagnostics occurred in candidate runs; the two
  intentional alternative-module failures are recorded separately.
- The corrected harness invocations passed 19 lifecycle and 5 direct-reset
  tests; the initial collection-error log is retained separately.
  Both signed patches pass strict checkpatch without errors or warnings.
The QEMU fault/reset fixtures use modified test backends. The build
includes the unchanged companion patches.
No new physical microphone or Virtualization.framework test is claimed.
Mixed capture/playback linked groups and physical drivers remain untested.
Nonblocking EAGAIN preservation was code-reviewed; runtime testing of
that behavior remains pending.

Questions:
- Is the proposed drain-time error policy (local SETUP and successful
  blocking drain) intended, or should an error be reported after all
  members have been stopped?
- Is refreshing each member immediately before its STOP sufficient for
  drivers whose first STOP freezes linked hardware, provided later pointer
  callbacks report their stable final positions?
- Which additional physical-driver or mixed capture/playback group tests
  should be required before this becomes a non-RFC core change?

Assisted-by: LLM

The new linked reproducer and comparison logs are currently local. The
earlier public reproducer package contains the core v2 implementation.
This revision does not claim a new public reproducer URL.

base-commit: 8d70e364e866bdfca81eee24d0688fac9472cfb9
prerequisite-patch-id: 39fb327a004c966ab90f66a34a64bbdbb3ffb475
prerequisite-patch-id: 7c6bc344656fd839ae0d697ba18d66ac0b47827a
prerequisite-patch-id: 9dd290ac3147fa7b49a475d7df8a6172778f2860
prerequisite-patch-id: f4c24a5e441343a690f4ac2437f181c815bc23d0
prerequisite-patch-id: ab4a5b770247a65272ab7af18a75a147daf81287
