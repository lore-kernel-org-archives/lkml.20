Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEBF35B62F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948645; cv=none; b=ZV4aOixXRoVAdfTInIrKv9/sWI6+tYkEf1Nb8eJGsFeRt3exwf/xlwXqrS536dVPiS5MbewYLQYMWDKMgcHSSq5mCMza1XLxWAM8B+3+Wtgy3+UqXjzmvXzCfCekNlgq2mXknkB4paHOPbGG6NTl68DdSnlBWmfn0Jm/8FC1Smc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948645; c=relaxed/simple;
	bh=OQUeIiNH3AkOCvu2Yrgwm/MEfZa1fYsH7e7htsI51cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mWwit/HKRVS8Rj2bnibv9RimxnsX/HGesvelSEAxbvqNPn89168QMT0WncJ0MCxtB6nYtfuvZqSGldWdiR1swysgOYc34vtZRJwT2n91sFj9dImocx5WMYvGIvm9WYZ9IyxMgfIYXRwEMWKisMkk1fDhUzm3ba90Vw/mKykc/PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3p7ju4H; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3p7ju4H"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a813079a55so3229848a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948642; x=1792553442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CoiEcMZfz2BFBf5znP5oWgBmQOMNmu3cqdO1IbIkOOY=;
        b=U3p7ju4HXEPqlitb2F+EV6D7dX0aaXC9IDtQ3ptUxXVW411HlX6f/z1/pCcu2O2KIz
         iSPw5gDzUvq+jxmt0zG021J0EhnMee9ZAeCujcBk9RAv+QQi544ShdJf+ZiTrr2Bf6Ti
         jsarEbr3F9++v5aTvTRVGCHYaqiU0IAKMZa8eG68iqYvGyl/ixKLnauxUADcWqhCVoEn
         d8NhIrV2uZnMKJ/pUfATs4DWdRb1OD9mMMOua4PKCp2lEEzZzgiUg/Jr9/sCcRRmAhqD
         eJNqKP3bE5nH07csIBaU6syNnpJInQvBJJf7ZlK7+WQPSm2BF8pIzN63v50WT3Z9eKzl
         Y7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948642; x=1792553442;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CoiEcMZfz2BFBf5znP5oWgBmQOMNmu3cqdO1IbIkOOY=;
        b=0WIs5OPHFwM/LmEr+7MqKpF4YrBm1KF3sznCR+SMJosJ7dvKUw5ntHk4UI9Ab8ksQD
         QJEBypo4ykGwVsxeTr8F7bBrsY2q0l5b+t2G13d05wVBLL5VLRjqydquUPISrotrkaBw
         i+Bk1smaaRUSGF+nMLMCv7E1xpa0AzARvUbwtxf82dVhZsFar/7dpzZaSBeBqVFk4B6d
         XEb4RC5u+6OkO/zzxk4T40G1+M5KMcmTP3dcXVU3GiLWolmryphageBzhU8LVcOoI9GV
         BC0kUnF48dDHRfJXkUlhdtYl9ahfAq6hWzzXN/CgfoE/rPIENPb28E3yvjr+mgU3mz9T
         1mPA==
X-Forwarded-Encrypted: i=1; AKwUvBwXLrqNpbD++a/2V/oBX7dCt8SD/O/zuCa9DjaNAdRwMoZDJ61hjg9/z3O3MJz20YvduqqW+CdAa/ybPNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVxBj2acQyuHtzDWnW74b5sbFn3aYq7iaWOwf6FJmiYX/Esz6x
	53PG1pfJK3Wbf7I/um7hrJ38J89Odcd/wGowcHojMu633tE3FAtvbIQ7
X-Gm-Gg: AYBFou1n+ccoYUyLujGxDeacmrlLC2pjDyouVP3Rv399RF4b4CEiLVwZ0MAM9YnB5C9
	y3P671nryKO/pEIRMIjmF6YyJ0LSfYo8oPqYWDchxauw9t2ch4jfeQdqzMav2sYRsr+MOZO1I/7
	lb7XexfVFFHfclA74KND0Hdj61WxRZerWpm8/cYqh6lD50OJbiiJbPw6pVDKzt4TmVnCiyCkvrq
	I52beApdaEF8dOXu1fTOl2RkZjOSiRrtXA7S+EummeR8CkyxIpQ4KfCofktGKlvpJWfJTL94s0S
	tFPr4pQLS7d2H6zgerIOQM41xrDGc6m7y0FdZEfyReWNHYJyacoBVIx8/j6a7dAQdx/eDbGwwnW
	kg+SX+MZE/dLyA+LUcSD3F+YrxAvQ0xjD2NnZOX4rcqK6eeXizrZ2Ws9R+N7XeiGxZ+cHBfimeL
	LuBTbYcAsbkwtcW98Va81HHZN9obQllGg1LeNFLDbAjHi8uTupd8HBwsPVW6vPBniuTSCOacDST
	DB3kJQrV9lNdlQfsEBJ9AH0yUbAyFQV/49pXPl5NRxq3hqEteFzE2Q8tiPGtJb2lsHU9YwaCOfR
	feDo9IPh1zDI0r3WEeDNWjykwz8=
X-Received: by 2002:a17:90b:4e8b:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3abbe66dfa9mr5759893a91.32.1791948641919;
        Tue, 13 Oct 2026 20:30:41 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac60064254sm2226483a91.4.2026.10.13.20.30.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 20:30:41 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 14 Oct 2026 12:30:37 +0900
Message-ID: <rfc-generic-control-wait-0.112c40f0e9284eaa@gmail.com>
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

Earlier isolated v3-plus-wait-change STD and VZ builds passed. The current
source-extracted comparison passes 108 candidate assertions; v3 has the
expected 14 wait-selection failures, without sanitizer diagnostics. This
models kernel primitives, not real scheduler interleavings or hardware DMA.

The complete local candidate (v3 plus all four RFC patches) was freshly
built on 2026-10-14 as an ARM64 KASAN Image and installed module set with
W=1, release 7.3.0-rc6-snd-lifetime-kasan. No old kernel objects were reused.
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
device unbind/rebind after the process exits. Exit took 1.04s and 1.02s of
guest time. Reset cancels the held descriptor, and no late completion is
observed beyond its original deadline; playback/capture/replay passes.
These runs exercise reset after timeout, not every reset/wait race.

The QEMU 11.1.2 fixture includes backend reset cleanup changes as well as
fault injection. These are integrated candidate results, not standalone
v3 or isolated-patch proof, and not stock-QEMU, VZ or hardware acceptance.
Earlier runs failed follow-on capture with ring saturation and overruns;
those logs remain retained. Final passes do not establish a permanent fix
for load or clock/scheduling sensitivity.

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

