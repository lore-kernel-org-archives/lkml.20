Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5BC38332F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335259; cv=none; b=ahwb4gfY/+WhjYrU29Zo4ajZ5Xpa/uCno3DXkPr65IZs6FVbFrFsjHaybIXy4Gqesg1lGzH4Fa3t0BfbVpo5gIH0UPx8ef+2FmM0+X7f9aKpak/obzcaG2aqGLKr+dTKEYCrO9EdL1HnX9e1FWKD0MXvX+lN89lx0c+urC83Z3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335259; c=relaxed/simple;
	bh=RKak2zmWYF+GpFqqChnrW/qmu7cqpbBxX7ErYaQTolc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSpnPMijzKVy1nrUtgPydBnZitlpHWRrZCiIssaF0qbUdbG6A+KZvXun466pCeFUwImK5BtWGms2fRLW1c7mJo/jrEPQa6HvWcR0z8SMix3l48ED8abnscFU5+UyvP+rIu4E1YKo8prR+FZX1P6482SanWW9RVNv+ahadTvdDkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOiFg/Vy; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOiFg/Vy"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868cfc5c244so770147b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789335255; x=1789940055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncR3JGMBkM5rdgwQFwJccLWP5o2fK/QS48pwtx5DZrw=;
        b=pOiFg/Vyu9Azmd2xHk5BX+QhgFd4yN4iEFnHk6e3/QmMYg8PDM0CyGXeHQjAoBE3kZ
         vKIYNLnUTfRYtzCyhVuJwrXF6Yra8WybYye+XGSZwmiNt2PciSOOluoMS176bKsH5UIh
         b8n+FNHDUWt/H/5Km39dPrp172NAYdLGKlc32963V5/+/COoL1D4sZQxejkYY90JjGBq
         FPKEdZJmirtjnVoDWqDKO5a8mwUQIGullpfQywxIGb3JX+QW/l4s7jDwXL7Mz56E2wPH
         iNHp88igmiFDKvB6g3WSE2PuWHVnnGw5gMWKY1jpqtf9hMyDzLD2dL3FiBj8qEi5PtP4
         Inww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789335255; x=1789940055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncR3JGMBkM5rdgwQFwJccLWP5o2fK/QS48pwtx5DZrw=;
        b=XMlz06pb1t3+Yp2v4UY6YBkvvQ6ewqbJyDptcWwLyyaRgb3gAmGDzdDOoxD0PVObup
         zkkakbnkxBoyWFIcvt9ZaHz31/a7yywuG0xhFfBykqX9IAYuLe0JU4F464z/ZinMyjd+
         L1DGm0hjrYmfetUCJxmXeQKo9td9HbqUcx5+tCFYytp9nBwwvgf/UKr6bFm4tyJja7Jp
         ArF8b5zzCIPiXzxy547/AhH9rnjl6cKWtTwU6e/D/H5Mar4PKTU3mxW6iICRrWKtbYB0
         5nwnFMDBXSar/MrCLZB8u725McV9tOKLSYM7xSg43iFw/UG3tkJy799N9zQCRLcCQ38p
         rWIg==
X-Forwarded-Encrypted: i=1; AKwUvBwf7uvbgBmfhQZHRCK6ZFxO05+OlLPr9Yi3/xQX1aUvD2LiDxhWu1V/Wb2WBWoMEdSX6gB00iO9xw82Stw=@vger.kernel.org
X-Gm-Message-State: AFuF++mg9a0eh5DkBRvl4xfQGv5FiqfOX1nmUhP2lU4OmJz7IxAbxgoJ
	3juXlA1mKPH4iF6qp4J3EkyFs7p7q2JHFLRksiQK+ylts6ylvIb9xVzH
X-Gm-Gg: AYBFou3dO0BjLrHjtbexRqpWGrOwiAcYRupFbUL8PVUk7sziJnsoIe7U+Mk1H82uCf4
	/bfniEKYxehZp9klsU1eea0TgpjiLHk00W99hko3H1C8n0EH/MgUghy28VLN9MuhWTRE9uu4GtS
	MA11W+5YPuUeX+jzj/AvomICnicMyo1mfY4Ka0mJTzpzDbwNFgWVqQaQkeTty8/MhUCwniE/ocN
	LWjiBJZcJM7zEuEjMP/iCx3Cjt7rDp+xTXAPtdSoSvIDtU9kMahDp46tKXgRtqG90nMM8ymnOHr
	DqVYlBvWYog6l0WB68GMF+wgfDIuhvwrj4VxvR4gevBUi57Y2YXaG8X4r2dFUq4dQcMEgFXDqZk
	xERxGthxLqEMJPqjPheOZpSypcWKez6Thmt36f3O8rmjmSF4V2aeu9VUqJ6RQNTCbl5uqvvBobD
	EnuiIMliPy8CzUMsOR1gysP6XWyAusrw3o5Gb55/8W+BeDLKLX8dkCZL2ZKVezEXMfogOokANTT
	LG9z2HPzK+pP5BIZ8ZXAyab86wC9c3pSwUWk3M9ir57fm9oumC+aII3vqGdbwGpA23R2RpqjnWy
	nhAioNmdLok1/kQk7w/6GnaIJIo9BC9W577Qt3lLVQeJ
X-Received: by 2002:a05:6a00:2411:b0:857:7384:b5f9 with SMTP id d2e1a72fcca58-86b331dca83mr21777656b3a.21.1789335254696;
        Sun, 13 Sep 2026 14:34:14 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c5e8dsm3477094b3a.32.2026.09.13.14.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:34:14 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: min.ma@amd.com,
	lizhi.hou@amd.com,
	Min Ma <mamin506@gmail.com>
Cc: Eva Crystal <0xiviel@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] accel/amdxdna: stale mailbox channel pointer, unbounded register offsets
Date: Mon, 14 Sep 2026 09:31:54 +1200
Message-ID: <cover.1789334558.git.0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2 is two patches where v1 was one. The bounds check is unchanged in
substance. What is new is a use-after-free fix that has to go ahead of
it, and a small addition to the check itself.

Let me restate v1's framing before anything else, because the review
that prompted v2 is a good deal more confident about this driver than I
am, and I do not want its tone to carry into claims I cannot support.
The values in question come from NPU firmware, not from userspace. There
is no proof of concept, I have reproduced nothing, and it is not
established that the part can report a mailbox register outside the
mailbox aperture at all -- I could not locate the producing code in the
firmware image at instruction level, so I make no claim about the
emittable range, in either direction. What I can show is static: the
driver takes four register offsets from firmware, computes and stores
the exact bound they should be checked against, and never checks them.

v1 is at
https://lore.kernel.org/all/20260913200212.133126-1-0xiviel@gmail.com/
and the Sashiko AI review of it is
<20260913201914.464721F000FF@smtp.kernel.org>. It raised five points.
Two are addressed here; the other three are named at the bottom.

Patch 1 -- the stale channel pointer, and a correction
======================================================

The review says that patch 1/1 of v1, by adding a new -EINVAL return to
xdna_mailbox_start_channel(), "actively exposes a dangling pointer in
aie2_create_context()". I went and read it rather than take that on
trust, and the answer is in three parts.

The bug is real. hwctx->priv->mbox_chann is assigned in exactly one
place, aie2_message.c:257, and cleared in exactly one place,
aie2_message.c:297, inside aie2_destroy_context(). The free_channel:
path at aie2_message.c:279 frees the channel and leaves the pointer
pointing at it. Every consumer in the driver gates on that pointer being
non-NULL -- aie2_destroy_context() itself, aie2_sched_job_run() at
aie2_ctx.c:398, and six message helpers that return -ENODEV on NULL --
so the NULL check is this driver's test for "does this context have a
usable channel", and a stale pointer defeats all of it.

The route the review gives for reaching it is not correct. It says that
after a failed create, "aie2_xrs_unload() subsequently calls
aie2_destroy_context()". On that path it does not: when aie2_xrs_load()
fails, xrs_allocate_resource() goes to free_node and calls
remove_solver_node() without invoking ->unload at all
(aie2_solver.c:325), and aie2_hwctx_init() then skips
aie2_release_resource() entirely and reaches kfree(priv). The stale
pointer never outlives the structure that holds it, and CREATE_HWCTX is
not affected.

The reachable route is restart. aie2_hwctx_restart() calls
aie2_create_context() directly on a hardware context that is already
live, and that context survives a failure there: aie2_sched_job_timedout()
discards the return value (aie2_ctx.c:498) and aie2_hwctx_resume() only
propagates it. What is left is a live context holding a freed channel,
and three separate paths then take the non-NULL branch on it -- the next
submitted job, through the guard in aie2_sched_job_run(); a second
command timeout, through aie2_hwctx_stop(); and closing the device,
through aie2_hwctx_fini() -> aie2_release_resource() ->
xrs_release_resource() -> aie2_xrs_unload() -> aie2_destroy_context().
The last of those does reach aie2_destroy_context() from
aie2_xrs_unload(), so the review's conclusion is right even though the
trace it gives for it is not.

And v1 did not introduce it. xdna_mailbox_start_channel() could already
fail twice over before v1 touched it: the ring buffer sizes firmware
reports are rejected unless both are powers of two
(amdxdna_mailbox.c:516 -- the same trust boundary this series is about),
and request_irq() can fail (amdxdna_mailbox.c:531). v1 added a third
trigger to a path that was already live. The defect dates to
d5b8b0347fa8 ("accel/amdxdna: Split mailbox channel create function"),
which landed in v7.0-rc3 and is in 7.0.y, 7.1.y and 7.2.y: before that
commit a single xdna_mailbox_create_channel() returned NULL on every
failure, the pointer was assigned NULL, and the guard held. It is
unfixed in mainline, linux-next, drm-misc-next and stable/master as of
today.

So patch 1 is a fix in its own right and not a consequence of patch 2,
and it carries a Fixes: tag and Cc: stable accordingly. Note that
aie4_mailbox_start() already does exactly this -- frees the channel and
then clears ndev->aie.mgmt_chann, aie4_pci.c:198 -- so patch 1 only
brings the AIE2 hardware-context path into line with the AIE4
management path in the same driver.

Two patches rather than one, deliberately. I considered folding the
clear into the bounds check, since that is the change that surfaced it,
and I think that would be wrong on three counts. The rationales differ:
one is a use-after-free on a path that is reachable today, the other is
validation at a trust boundary with no reproducer and an explicitly
unestablished trigger. The backport stories differ: patch 1 has a
Fixes: tag, applies to the stable branches that carry d5b8b0347fa8, and
wants to go there; patch 2 has no Fixes: tag and does not apply before
v7.2, for the reasons below. And the acceptance stories differ -- I
would rather patch 1 stand or fall on its own than be contingent on
whether you want patch 2 at all. Patch 1 is first so that patch 2's new
failure return lands on a path that is already correct.

Patch 2 -- the bounds check
===========================

The shape of it, unchanged from v1. Firmware reports where a mailbox
channel's head and tail registers live: in the management mailbox block
it writes into the SRAM BAR, read by aie2_get_mgmt_chann_info(), and in
the CREATE_CONTEXT response, read by aie2_create_context() for every
hardware context. AIE2_MBOX_OFF() converts each to a raw byte offset
into the mailbox mapping. aie2_hw_start() and aie2_create_context() each
derive the mailbox interrupt register by adding 4 to one of them. On
AIE4, aie4_mailbox_start() takes four such offsets straight out of the
mailbox_info block. mailbox_reg_read() and mailbox_reg_write() then add
the offset to xdna_mailbox_res::mbox_base and hand the result to
readl()/writel(). Nothing in between compares it to anything.
AIE2_MBOX_OFF() is an unsigned 32-bit subtraction, so a reported address
below the aperture base does not fail closed but wraps to a very large
offset, and the + 4 can wrap independently of the value it derives from.

New in v2: the check also requires the offset to be 32-bit aligned. The
review asked whether it should, and I think yes, though not for the
reason it gives -- it asks about alignment faults, Machine Check
Exceptions and PCIe AER, and I am not going to repeat that, because on
x86 an unaligned readl() to MMIO is a split transaction rather than a
fault and I have not shown otherwise on this part. The argument I will
make is narrower and checkable: all six users of these offsets go
through mailbox_reg_read() or mailbox_reg_write(), whose bodies are a
bare readl() and a bare writel(), and the driver has no narrower or
wider mailbox accessor, so an offset that is not a multiple of four
cannot name a register in this block whatever else is true of it. The
driver already reasons this way about firmware input one screen away:
mailbox_get_msg() pairs a range check with IS_ALIGNED(tail, 4) for the
ring tail firmware writes, at amdxdna_mailbox.c:294.

Why this is a patch rather than generic hardening: the driver already
treats firmware as an input to validate, in at least six places. It
rejects a bad management-mailbox magic (aie2_pci.c:93), checks the
reported protocol version (aie_check_protocol(), aie.c:68), range- and
alignment-checks the ring tail firmware writes (amdxdna_mailbox.c:294),
rejects an out-of-range device revision (aie2_message.c:1262), bounds a
reported error count against the buffer that has to hold it
(aie2_error.c:312), and -- the closest parallel -- bounds a
firmware-returned fw_ctx_id against priv->hwctx_limit before using it as
an array index, in aie2_fill_hwctx_map() at aie2_pci.c:917. That last
one is this patch in miniature: same source, same driver, a stored limit
consulted before use. The mailbox register offsets are the one
firmware-supplied value left unbounded, and the limit they should be
bounded against, xdna_mailbox_res::mbox_size, is assigned on the line
after the mbox_base they are added to, in the same struct, and then read
nowhere in the driver.

For precedent on the boundary itself -- not as a claim about this driver
-- accel/ivpu, the other NPU driver in accel/, took four fixes in 2026
whose entire content is a firmware-supplied value used without
validation. Each was assigned a CVE and each was backported across
several stable branches:

  commit d9faef564438 ("accel/ivpu: Fix signed integer truncation in
  IPC receive") -- CVE-2026-53202
  commit dd1311bcf0e6 ("accel/ivpu: Add bounds checks for firmware log
  indices") -- CVE-2026-53205
  commit 1d0b597facdd ("accel/ivpu: Add bounds check for firmware
  runtime memory") -- CVE-2026-53206
  commit ddb44baed257 ("accel/ivpu: Reject firmware log with size
  smaller than header") -- CVE-2026-72089

I cite them only for the principle that in this subsystem "firmware
reported it" has been treated as a reason to check a value rather than a
reason to trust it. They say nothing about whether this driver has a
real problem.

On impact, stated conservatively. This is not a controlled write
primitive and I am not presenting it as one. The offset is chosen by
firmware, not by an attacker: I have not shown any path by which
userspace influences what firmware puts in cq_info.head_addr, and I did
not look for one. The data written is not attacker-chosen either -- the
writes are a ring pointer the driver computed, or the constant 0 for the
interrupt acknowledge. The landing address is mbox_base + offset, where
mbox_base is a vmalloc-space address an attacker neither controls nor
observes. The realistic outcome of an out-of-range offset is an MMIO
access outside the ioremap: either a fault at a kernel virtual address,
from the rx workqueue or from the ioctl path, or a write into whatever
else is mapped there. On parts where the mailbox BAR is also the public
register BAR, an overshoot that stays inside the BAR reaches public
registers instead of mailbox head and tail. That is a landing-zone
detail, not an impact upgrade.

The check goes in xdna_mailbox_start_channel(). I considered putting it
in mailbox_reg_read()/mailbox_reg_write() instead, since that is where
an offset meets readl()/writel(), but the six call sites argue against
it: two return void and two return a u32 in which every value is a legal
register value, so a guard there could only silently skip a write or
fabricate a read, and it would sit in the per-message IO path. All six
take their offset from mb_chann->res[] or mb_chann->iohub_int_addr, and
xdna_mailbox_start_channel() is the only writer of either, so it is a
genuine choke point: the management channel, every hardware context and
the AIE4 path all pass through it, and the derived interrupt register
arrives there as a parameter, which a check at the producing sites would
not cover. It already validates the ring sizes, it already returns int,
and all three callers handle a failure -- aie2_hw_start() and
aie4_mailbox_start() unwind and fail the probe or resume, and
aie2_create_context() frees the channel and destroys the firmware
context, so AMDXDNA_CREATE_HWCTX returns an error to userspace rather
than leaving a channel that accesses outside its mapping.

No Fixes: tag on patch 2, deliberately. The defect dates to the driver's
initial merge in v6.14-rc1, but this patch does not apply to any of the
three commits that introduced it, and I checked rather than assumed: at
that point the accessors used a u64 address with (void *) casts, and the
function this patch changes did not exist -- it was
xdna_mailbox_create_channel(), returning a pointer and NULL on error
rather than an int. A Fixes: tag would point at trees the patch cannot
be applied to without being rewritten. Say the word if you would rather
have the provenance recorded and deal with the backport separately.
Patch 1 is a different matter and does carry one.

Changes since v1
================

- Split into two patches; the new patch 1 clears
  hwctx->priv->mbox_chann on the free_channel: error path of
  aie2_create_context(), with a Fixes: tag and Cc: stable. Raised by
  the Sashiko AI review of v1; see the correction above -- the bug is
  real and reachable, but it predates v1 and the route given in the
  review is not the one that reaches it.
- mailbox_reg_in_range() now also requires IS_ALIGNED(mbox_reg, 4), and
  the dev_err() text says so. Raised by the same review; the reasoning
  given here is not the reasoning it offered.
- Rebased from d681d7ef617e onto 22098763a10d; no amdxdna changes in
  between.

Not addressed here
==================

The same review raised three more issues, all of them pre-existing and
none of them in this code path. I am not widening this series to cover
them, but they are not being ignored either:

- ring buffer bounds -- rb_start_addr is unchecked against
  ringbuf_size, and a small rb_size underflows in the wrap-around
  arithmetic;
- the synchronous-message timeout leaving a callback pointing at a
  destroyed stack frame in xdna_send_msg_wait();
- the msgid and mb_msg leak on that same timeout.

The first two are a good deal more serious than anything in this series
if they hold up, and they deserve their own patches with their own
analysis rather than being appended to a bounds check. I am working
through them separately and will send them when I can say something
definite about reachability.

Base and testing
================

Based on commit 22098763a10d ("Merge tag 'trace-v7.3-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace"), which
is mainline HEAD as I write this. Builds clean on x86_64 with
CONFIG_DRM_ACCEL_AMDXDNA=m, gcc 15.3, W=1, no new warnings;
checkpatch --strict reports nothing on either patch. Not tested on
hardware: I have no way to make firmware report an out-of-range offset,
which is the same gap described at the top, and I have not tried to
force the restart failure that reaches the use-after-free in patch 1.

Eva Crystal (2):
  accel/amdxdna: clear the mailbox channel pointer when starting it
    fails
  accel/amdxdna: bound the firmware-supplied mailbox register offsets

 drivers/accel/amdxdna/aie2_message.c    |  1 +
 drivers/accel/amdxdna/amdxdna_mailbox.c | 37 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)


base-commit: 22098763a10d9c1340827fcf6edab66f153b27f0
-- 
2.53.0

