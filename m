Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77083F507
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329908; cv=none; b=hUSe/sIeWkvWMStVW9hy1/4tYYs7iPlBF3cey3I1F/HRWpX5zjh3eoHv2Ct6rUwq7r4NNs74IDJtEqRhuW9jlQ9C/1YX4qZbhdCYBStYplu2dYH36/ue7o7kHWBHGSFJVWnvOPK3RuH5QEWB6DJOTLOIoc5nIfXOOQvKqHaCS00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329908; c=relaxed/simple;
	bh=zX28kH/WAZyw2E6SHCnSKnqRtnLeLcRdWoyY8oAPl/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCaCMd/TW32h+mK/+n+gXfx18VcGuq5QBD0N5yI+7jBiXNQJALNssu5Dl/KXleM0F0OnTcej9u9Rjwpj1nhKWSGRlCAedKn3evCa6pSWdl/6x4akGJH8ysPAZ+KbH7dPVKKXZmvcbTwmbXP958Bw9w64hlyeBJq1DN3va+5thm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWZZeJaF; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWZZeJaF"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eefae4so3666715ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789329907; x=1789934707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sf2mM+0FSeHh2dziQvsLoHJODGB0iyYj41aqVIfwGU0=;
        b=MWZZeJaFDe+D8qGpXxGyBFP6Smkk31ui8HoLANbf9lspzF0iKd5ne4iwu5R/6cWehi
         lRV3fWV1b+HAIWMjNhgFM1OhfLtNjMPkKPO9qZwpIgVahxrM1elcyBIFno0vQpst/vHv
         n64kfouLdg1V2scEX6rnKvH5DuXtbqtO5A3ZECtsiU20pYcmw+P8UgoBYsuyxnxZMo21
         PGv1iwi2IXKY2tlhzmRw3egkivp3+LK8bg0yeo6bxQpOhBrcTPzCaSnq/l8RdzHlfcg/
         9aP8xhQrerzm+Wxls+2Ojl5X1F0BD9Za2wLmpYQ9CqtSJvMPaLz94lZjh4tabA6ct4dX
         c9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789329907; x=1789934707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sf2mM+0FSeHh2dziQvsLoHJODGB0iyYj41aqVIfwGU0=;
        b=HvXwxXpicisucTLwbL/jzImv9lSRV/smSa68KDTjX3c70inwPZyb14wuYuJFIh1PTW
         JD4qQiaJNWfuq5Nof49oY0eitFmHZ36wOCCO5IrD/MneGFeSl2xcQJtnnik3s86zHYK8
         TP67WSHigyH76nMlKXe2BgNJan+l832CV7Z/U2Dr+qCtnF8rPuubB4tTbe2Y1riwPdYi
         iOfOflG1UOHsb7IB0cGYovKgHbfBTvVb1ZZJG2KWOKKY1Tc7bFQzrrA4OOXt6KTON1WK
         A/BLrOeuIN3JpfFPtL+WZva1K91I61suCifL4mpyQAxQUZZF3qxhps6B94cTgn0WgTl/
         VO4g==
X-Forwarded-Encrypted: i=1; AKwUvBxlbwSm8/1vNnBs6XtoeC9eJuvlft4rnSqcmJy5OfDeh+qdCWcEz/JXnW6YH5ErtP6QL5RvGrYEPLT2FeM=@vger.kernel.org
X-Gm-Message-State: AFuF++lzRUiok6k9xSk8HFCb9H8rcEOTfX5e5l5lC3wlmM7CJ97KzpWM
	5fqAybg/ukfnHO1M9NrrSBn7q0tJmBFV3JoUIqKZMUnVbHdseanr/9dR
X-Gm-Gg: AYBFou0FHYo2o7OoZFoMTb0eJnbuxC5LLfjkfC596T74iHHAYfeZ/CSAkxeQm+DFbTW
	nTnTUlx/u/gcZtcssGxCb7/zBOdCf7x8uxv2Rf96HniRNAczsdR81O5RMHEmYOJ/ySxwuuq3lSY
	/tApxv9KDT68inlpCpXi0tl+s93GPGql+XfNrPBsNQRbDvY/WWtLZFjhv/LRDyDLXudlW91oSk1
	Zid+ceVYTEU2HsCdzX5uS83Aj5+RK30cAFsnm0RRk57ptFwKlA+TyeUSSIJ4qf6QGBVG8QMq7LO
	nN/f7HJ+g4yP/InS5GkRWI0x9daf0myWYCILQUsqqslVXf0yV+7G3lEP463Mpb+Vfyu2iD1P7OL
	zJ02WDtH9ritWlgjf02rQy7eM5EI2NXtJsa7yY1eMWrndwXdrS2K+CTPy196G6wa09Sf46SGSRO
	9YNJdZRgaigBKFlJYzTuq3DKiNcZqQovwC+fI3B5UxKWgyWLuakwT9/wLbFNWTmKiSx0y9fyRuj
	+iX3SD7gzpMakAP/nmqPhCAFJOTNO8yh1JQaZjjZy034kjH4j0xTlhlN61rWWFpundhgABbH0md
	q+yDukUunn0DLf+eoTZJQcMLnruU/jSbkhDPjhyLGn70XSutq4i2a+I=
X-Received: by 2002:a17:90a:28f:b0:39d:b57e:b47d with SMTP id 98e67ed59e1d1-39dd55d31e4mr2699554a91.8.1789329906574;
        Sun, 13 Sep 2026 13:05:06 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm3676635a91.0.2026.09.13.13.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:05:06 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Eva Crystal <0xiviel@gmail.com>
Subject: [PATCH 0/1] accel/amdxdna: bound the firmware-supplied mailbox register offsets
Date: Mon, 14 Sep 2026 08:02:11 +1200
Message-ID: <20260913200212.133126-1-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a change at the firmware-to-driver trust boundary, and I would
rather be plain about that before anything else. The values in question
come from NPU firmware, not from userspace. There is no proof of
concept, I have reproduced nothing, and it is not established that the
part can report a mailbox register outside the mailbox aperture at all
-- I could not locate the producing code in the firmware image at
instruction level, so I make no claim about the emittable range, in
either direction. What I can show is static: the driver takes four
register offsets from firmware, computes and stores the exact bound
they should be checked against, and never checks them.

The shape of it. Firmware reports where a mailbox channel's head and
tail registers live: in the management mailbox block it writes into the
SRAM BAR, read by aie2_get_mgmt_chann_info(), and in the CREATE_CONTEXT
response, read by aie2_create_context() for every hardware context.
AIE2_MBOX_OFF() converts each to a raw byte offset into the mailbox
mapping. aie2_hw_start() and aie2_create_context() each derive the
mailbox interrupt register by adding 4 to one of them. On AIE4,
aie4_mailbox_start() takes four such offsets straight out of the
mailbox_info block. mailbox_reg_read() and mailbox_reg_write() then add
the offset to xdna_mailbox_res::mbox_base and hand the result to
readl()/writel(). Nothing in between compares it to anything.
AIE2_MBOX_OFF() is an unsigned 32-bit subtraction, so a reported address
below the aperture base does not fail closed but wraps to a very large
offset, and the + 4 can wrap independently of the value it derives from.

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

The patch itself is one check, in xdna_mailbox_start_channel(). I
considered putting the bound in mailbox_reg_read()/mailbox_reg_write()
instead, since that is where an offset meets readl()/writel(), but the
six call sites argue against it: two return void and two return a u32 in
which every value is a legal register value, so a guard there could only
silently skip a write or fabricate a read, and it would sit in the
per-message IO path. All six take their offset from mb_chann->res[] or
mb_chann->iohub_int_addr, and xdna_mailbox_start_channel() is the only
writer of either, so it is a genuine choke point: the management
channel, every hardware context and the AIE4 path all pass through it,
and the derived interrupt register arrives there as a parameter, which a
check at the producing sites would not cover. It already validates the
ring sizes, it already returns int, and all three callers handle a
failure -- aie2_hw_start() and aie4_mailbox_start() unwind and fail the
probe or resume, and aie2_create_context() frees the channel and
destroys the firmware context, so AMDXDNA_CREATE_HWCTX returns an error
to userspace rather than leaving a channel that accesses outside its
mapping.

No Fixes: tag, deliberately. The defect dates to the driver's initial
merge in v6.14-rc1, but this patch does not apply to any of the three
commits that introduced it, and I checked rather than assumed: at that
point the accessors used a u64 address with (void *) casts, and the
function this patch changes did not exist -- it was
xdna_mailbox_create_channel(), returning a pointer and NULL on error
rather than an int. A Fixes: tag would point at trees the patch cannot
be applied to without being rewritten. Say the word if you would rather
have the provenance recorded and deal with the backport separately.

Based on commit d681d7ef617e ("Merge misc regression fixes that seem to
have fallen through the cracks"). Builds clean on x86_64 with
CONFIG_DRM_ACCEL_AMDXDNA=m, gcc 15.3, W=1, no new warnings;
checkpatch --strict reports nothing. Not tested on hardware: I have no
way to make firmware report an out-of-range offset, which is the same
gap described at the top.

Eva Crystal (1):
  accel/amdxdna: bound the firmware-supplied mailbox register offsets

 drivers/accel/amdxdna/amdxdna_mailbox.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

-- 
2.53.0

