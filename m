Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BDF4A2626
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965741; cv=none; b=raQir2X09nJpHshLVIfhZiLkoiVoQTxLTaff2oXIWYOkKRdhjoNRhZjmJHskD/xBaLqIgeeQMcraQcneHXXMo+CKQnF4QXPgSKRC3NrNUVTRtnIYLiph8QiHOCpCoEa77Ha9lcwJh10O1rib5o+UNj3K2i/B4jpGuin67KNI1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965741; c=relaxed/simple;
	bh=Jy21Spwkgjb6XMpEYLFn8RZ8houUdP1vTbK7y45kJuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oYIs9tE5CXmzIgDzjfjxMLJ+vAgXEok+r4/68nLWpprISucvsDH6hi4Ikwb1w/P3z5y/+i2QgiwbxkI/fNwYLsn0rnFXSloycxNTDN4rC33NKhKqtHPVPv3yxpbEZpRkQk3CsNBtshOheZx/ZFgbwmRclB7qcfmEmdlHsn7YYLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG/PPLUB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG/PPLUB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89a595332c7so2024679b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791965732; x=1792570532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PboKOrqQwewyKEheT1zYUFWFbeqlewnmjUU+OIA0cnM=;
        b=dG/PPLUBZMAdY9hlsQMLpwjPxgH7tLKIk287WNii7ojfXRabBJDwYHuH9z9zTfwuWn
         eJlAJQ42pokvkf5z60iZmSuRoFxcAY6rRDW4Fi5djrnfZoafmLx3ZgFvRA7RvKgiTL+7
         kCRUQyHcy6FRTRgAYNHe4pJ4+aeQicb8aXdlkmwH82y5PmlE+dU/AQbRLNES3ntRfLXU
         1TsVCv1C74ySSkEMe1ek+U4X3Sy0QAkMgRR/Ny6k0HT2qzwrXT/FPzJTmo4bYvglE+5N
         cEcrZlWGaLfpY+rZLMlLJc/oQQKcnT49f+3IfVpUoh8TY+mnHC6TJ9FrSW69mYqGmTCo
         ZhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965732; x=1792570532;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PboKOrqQwewyKEheT1zYUFWFbeqlewnmjUU+OIA0cnM=;
        b=HKRjI3qxoATlslvE3s4PdnY+mY7O4RiSYitI5OeV+aUw5LOYZ9vKfgGUqVQAMMwthP
         YAdjG7CvzXDdm9ou1ZIwqPbSIQbsI3RqaueIj1cD7WqdQsoyteRPtQx1LOHrxmgWAoP9
         lYTcoUlGJJF7fL6OcZK3Tx0eRjc0h3wGNw2fSSZOU3fpiZwrZ+hxneh/E0w75gis2ft8
         5xF8XIHQwznu45E76lTDOS/NZfK97QcCqiA80OWRhyy4lV65f6P5wIGq9WAMa0+7qEhl
         VUb6BB1ExSs1qSV9RbkZof0wgTbgJjLFN9YG1pcFHvRaxH5CiHJBYIcZ/hVsIhNHehg3
         uHRg==
X-Forwarded-Encrypted: i=1; AKwUvBzMfZX89nFWE1Lm5EZd5jbo+f8faJxjeTy1lrmcch5PBKx48H2jlZWzetOVbCaIHerVXOHd90j1sZvA6r4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHrpg7+fnIt1naE3NXV+MoxuHMtwYq88961cp3YhjxdCwC69Iv
	pjhevWAylroEvDAii/jHZyzUgax9rF9QWpBmt1AFtNClwEKBchtjWUxj
X-Gm-Gg: AYBFou05nhCfznKsF7vOjW+tVkM+H9PjsqmSccDPoGk4fWnZfx5SZEx9K8eqzlINDEe
	xY2Xn/bSzySM5JmBlYbqk6JrxMQrkien3aOLCD8cfzJ9++UHFG9Vvmcr26mCJz32URDD5X7ElNq
	EKAq07u+6iPFFGkCWn2Y7IM8nluOP3gQ6oEDyoK9yvJ4AQQvpbSm9xdammX38TVeoY5CiLxZGWF
	Fh/DkwglgtdXlFPXwLpNbqtJrKUm71hrnuZ2ZYDTF0BDr7NdX00cT3BmmAN7T5L2kLpPTHmjm0V
	QTOazQUbHQToaH+ZiBNtX+I8M2+2+Afh8UuFmgQY6VlTbjbBCgruTDJsS4pqB5sKPSX9Nh7QKoo
	1UKTJiBqVj31V0qUXos7T1gOahP03T2Hya2YXUKtazYFbowt6781dJjCzna90dt99QKDN7vpiqL
	Mfsh3eLrCxzgISLKA0AhaIBjb2q2XC4Xf7XYiqLZFDzPtaPM6G5VMColmHg1arRszLNgNgnzqik
	StPKWRVFRkpZXnWcEv1gZbM8tIwfJUmWR6rp7QR7LZRTNsS/9FjKe1ek2H1wUlRaWpdTTd+AcNe
	+sZEqCiFpyOdDYk=
X-Received: by 2002:a05:6a00:23c8:b0:874:705d:f64d with SMTP id d2e1a72fcca58-897c6443144mr11859234b3a.27.1791965731814;
        Wed, 14 Oct 2026 01:15:31 -0700 (PDT)
Received: from localhost.localdomain ([121.137.86.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d803cf66fsm796426b3a.32.2026.10.14.01.15.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 01:15:30 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/1] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 14 Oct 2026 17:15:25 +0900
Message-ID: <rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com>
In-Reply-To: <rfc-generic-control-wait-0.112c40f0e9284eaa@gmail.com>
References: <rfc-generic-control-wait-0.112c40f0e9284eaa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes since RFC v1

The implementation patch is unchanged. This revision adds machine-readable
base/prerequisite information and updates the integrated regression results
to use the revised core capture-drain patch. The generic wait and VZ
behavior changes proposed in v1 remain open design questions.

The public base and ordered prerequisite patch IDs appear below. The local
v3 tip d58a3ac9b1719fdf8ce9d286be606128aeebf1aa is reconstructed by applying
the five v3 patches to that public base; it is not an upstream commit.

This is v2 of this follow-up RFC, not v4 of the five-patch virtio-snd
lifetime series. The v3 prerequisite thread is:
https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/
The submitted v3 fixes ACK error propagation, failed START recovery, and
message/buffer lifetime through completion and reset. It does not add the
VZ capture profile or the ALSA core drain handling in these companion RFCs.

A pending signal can end the STOP or RELEASE wait while the request is
still owned by the device. A later teardown can then submit another RELEASE
before the earlier request completes. Keeping its memory alive, as v3 does,
does not by itself resolve that ordering problem.

This patch makes synchronous STOP and RELEASE waits non-interruptible,
using the existing message timeout. Completion or reset cancellation can
still wake the waiter. Other control requests remain interruptible.

This changes teardown responsiveness for virtio-snd generally, even with
all VZ options disabled: a signal no longer ends these waits immediately.
It does not introduce a new ioctl or wire command. Each wait uses the
configured timeout; this is not a bound on the whole close/exit sequence.
A timeout still leaves device completion uncertain; this patch alone
does not establish safe retry ordering after every timeout.

Dependencies

This patch applies directly to v3, independently of the two ALSA core drain
patches. The companion VZ capture RFC requires this patch and both core
patches. Keeping these reviews separate should allow a decision on teardown
waiting without requiring agreement on the VZ compatibility profile.

Validation and limits

Earlier isolated v3-plus-wait-change STD and VZ builds passed. The earlier
source-extracted comparison passed 108 candidate assertions; v3 has the
expected 14 wait-selection failures, without sanitizer diagnostics. This
models kernel primitives, not real scheduler interleavings or hardware DMA.

The complete local candidate (v3 plus all four RFC patches, including the
revised core locking) was freshly built on 2026-10-14 as an ARM64 Image and
full module set with W=1, KASAN, PROVE_LOCKING, LOCKDEP and
DEBUG_ATOMIC_SLEEP, release 7.3.0-rc6-snd-rfc-cleanup-lockdep.
There were no build errors or warnings in the changed sound paths; 517
-Woverride-init warnings remain in two unchanged ARM64 base files.
This is a rebuild of the pinned candidate, not a rebase to a newer upstream
or sound maintainer tree.

With this kernel, delayed PREPARE/START/STOP/RELEASE responses passed under
ordinary TCG: each targeted command executes once, then its response is
held for 1500 ms against a 1000 ms driver timeout. The reader wakes with
zero frames and final XRUN/-EPIPE; prepare returns -EIO before reprobe and
capture succeeds afterwards. STOP/RELEASE may first return -EIO or -EPIPE,
depending on which ALSA wait/XRUN condition is observed first.

The direct STOP and RELEASE tests hold a request, send SIGKILL, then perform
device unbind/rebind after the process exits. Exit took 1.03s and 1.05s of
guest time. Reset cancels the held descriptor, and no late completion is
observed beyond its original deadline; playback/capture/replay passes.
These runs exercise reset after timeout, not every reset/wait race.

The QEMU 11.1.2 fixture includes backend reset cleanup changes as well as
fault injection. These are integrated candidate results, not standalone
v3 or isolated-patch proof, and not stock-QEMU, VZ or hardware acceptance.
Earlier runs failed follow-on capture with ring saturation and overruns;
those logs remain retained. Final passes do not establish a permanent fix
for load or clock/scheduling sensitivity.

All ten ordinary-TCG regression scenarios passed with the fresh candidate,
as did the additional linked-stream error/recovery fixture and 24 Python
harness tests. Successful runtime logs contained no KASAN, lockdep, WARNING,
BUG, Oops or panic diagnostics. Initial harness/CPU-configuration failures
are retained as invalid attempts, not counted as kernel passes.
No new real-microphone or VZ runtime test was performed for this revision.

Reproducer

The previously published source package remains at this pinned commit:
https://github.com/whatisyourname0/virtio-snd-reproducer/tree/7a9876738bdc70ce669f02ec31fe8968eb0ee4fc/rfc/vz-capture-20261014
It contains the original RFC snapshots, kernel builder, QEMU fixture and
ten runtime commands. It does not contain the revised core locking or the
newly rebuilt linked-stream fixture. Do not treat it as the exact source
of the new results above. Existing v3 patches in it are build prerequisites,
not patches being resubmitted.

The revised source stack, four signed implementation patches, exact kernel
config and portable linked-stream fixture are published at this commit:
https://github.com/whatisyourname0/virtio-snd-reproducer/tree/64fa85f3260b45e7dbb85c4eee68a5b4a8b064e1/rfc/vz-capture-20261014/sashiko-followup
The public source recipe reconstructs all eight changed files byte-for-byte
against the tested candidate. The packaged linked fixture also passed with
freshly compiled probes, a new Alpine rootfs and a rebuilt test module on
the same KASAN/lockdep kernel. The public archive was downloaded and checked
against the local source package. See README.md and RESULTS.txt at that URL.
This supplements the earlier bundle; use its corrected core 2/2 patch
rather than the earlier core 2/2 snapshot.

Questions for review

- Is a bounded, non-interruptible STOP/RELEASE wait the right teardown
  contract, given the effect on process exit latency?
- Would retaining explicit in-flight teardown state across an interrupted
  wait be preferable to changing interruptibility?
- Should timeout/retry serialization be required in this generic change,
  rather than addressed separately by the companion state machine?

Joonho Lee (1):
  ALSA: virtio: wait through signals for PCM teardown

 sound/virtio/virtio_ctl_msg.c | 15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

base-commit: 8d70e364e866bdfca81eee24d0688fac9472cfb9
prerequisite-patch-id: 39fb327a004c966ab90f66a34a64bbdbb3ffb475
prerequisite-patch-id: 7c6bc344656fd839ae0d697ba18d66ac0b47827a
prerequisite-patch-id: 9dd290ac3147fa7b49a475d7df8a6172778f2860
prerequisite-patch-id: f4c24a5e441343a690f4ac2437f181c815bc23d0
prerequisite-patch-id: ab4a5b770247a65272ab7af18a75a147daf81287
