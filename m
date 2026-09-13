Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED64385D7A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335272; cv=none; b=m7vtN4DqWvy72LHIztcQdhFikjaT+Y78fBU9rWLOhGKqKAFOfOKnXWHjkM04F0tMuvu3DSkVeun4XSnjJwxIEAUm8Z3lJBSCJlq+ikE0JnVYWTK7dg5I4NZhGA6OE6spevZZtYij0XMaARNYEemd8zcBFtJyP3wDIYVaTF52Xhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335272; c=relaxed/simple;
	bh=YOj7qQJ+obPRYmkxpEJFzCanP2bYYEunlQ/kZutDfHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OP3CeoghSYzV04Eig5hDxKiwOUw6g00z1cXSs41quc/o5DzTDVkvpQmNwyTmsj1gzQ00htsFXqt4AZIB5E1JuMVGdCr9tME1USEmH+FAPBut3eAleSmNLxq2KGHaj8Piz7RVJtFGX9PS5W+iU82fP8h0Wk0d9H5mdaVLnf3dgGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsdoJHyu; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsdoJHyu"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868cfc5c244so770163b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789335264; x=1789940064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0B8hNNWkyqRTAPtToZa4Ta80Tqs8xdDUvBUMhZpcU9I=;
        b=AsdoJHyukWl6ulqYqSgqw/odM0xZnTOuxT6O6p/3V63dk1XTtCB80UsR1YmJvmBX4B
         aDakwfLtrLrnQkGiYo2blJaCOM1WNYYxHakMI8/AUuGpM0VnycD+utZXD6ZnNw535LWr
         E/1ipiVHoKNz54y/GbuMQOglbF/gvG2Up1Pl4EED3UmQ1fL1BBS5fAeQuXbkODmY0ths
         q++pW6J9SqTTWzDfpA8gt57pKoS1pd8CSNTburiyjhtSzhGJ2wsv1Rt8V23R17E2hSSg
         UIT4mZvilO9ZYMBwQAku9XPgzHrlLUL84JRwFgT6MjL3P7sqMagbvzbWP9OQ6eoqzMOb
         2olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789335264; x=1789940064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0B8hNNWkyqRTAPtToZa4Ta80Tqs8xdDUvBUMhZpcU9I=;
        b=RIKueOskcw3QHKt32KuxjWw5puGSWQfjhXSYQcCAH6PSXTpE9YPOSa66mZhpdkV78E
         XuM2oRzW8mrNPPjv4lz3jgX/jrzINl8m5abdxgGrf1AwC81OyWbqa75kVxJtoYvJCYZt
         OwW4s4/NuSjIk2e2EOMh6JAXQm4Hq2NgT17CwFRuqMrbDPvsZ+DC1+J36u+lwMe743hh
         D8qGY0P5DgOAIqyDg0QnFxCIUDv/YuaIWElY1y4dhUKbKWzHKAtHdK2FEPJ2MOMZ1SJ6
         0ZeCZqkYhlRsNs7vXkowBbabvf2wcoGpBmysF+1ZO4SG1RbXH5fqIVT/GTwLNX1R8Lq2
         ZXFw==
X-Forwarded-Encrypted: i=1; AKwUvByNArAWaLYa0dQOFKAi+IR8KNt1y7Bn9IuqzlsMW435Z8aqe4RhSPdwstHC5IsQZWCBqEfu8o0sb7s6dQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++m7e9UfWWcnG6cw+STIbj3rpDx8Or2xbd7uxdulJwO8LjcuBqeN
	xZH0uDl8+Y7B1TxhGGHZK9KLCtgHWzwnCfmePiANAfhhOTnuThhUeTa2
X-Gm-Gg: AYBFou32eZziCR/RcFT16NlrjuRgEAYdHyF1UWjHa0o7vrf2pqYxMwxOS2iS5m18GhX
	Fv99ggIcyRbxPVbT33XkQ3UGos86IjFrn1NVAtmRqdWn787EUM9/8CmxCAwtu3BdcroY5w8O8mF
	hQnX/xboCySkBOh4cA3BmtURUCEcKaFebvvICsruE8eownjv4BXXcac5UYhrn0mS6KGiQWLhjbJ
	TjpY8vR1VeXQhPrvWGBSecF7plL6F+9QQyXtaqVVJlncKkbMQqc7oJMUUn3ETPxtvYdy8zTA8rD
	LsbA1Nt8lN5TFCXqTMLAOWQATqJf7mHhBo9vKCAPcc9QyJD/sSRmsLFb0bpF75BjFsUkremIwag
	noMOywJw0nYAHF90K9pIV21pPfbVD9C/UoEoeQMYqkI8+c2A+NddwGNZCc8zplqHz5klwJTCte4
	rEq6KZAqwj/KcDixuxGbv6yI8h7v08UuGRM2TnkrXhLvPeH5YKKmDagnLm6XeDEUIMXd7jHeLgJ
	ZSwyELmwnQZOI0yTuIXm/ifSyY3C2ehqVPeVUbe3mv/ipms6yRdA4C9HL6GThrRDxAjl5+SvZMI
	tHI+Y1cvSyE3ad7Fetw8dO7NGWtiGZPf+ZJ+QHSbGJEk
X-Received: by 2002:a05:6a00:21d1:b0:84e:e741:174f with SMTP id d2e1a72fcca58-86b2f70a205mr22719967b3a.7.1789335264423;
        Sun, 13 Sep 2026 14:34:24 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c5e8dsm3477094b3a.32.2026.09.13.14.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:34:24 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: min.ma@amd.com,
	lizhi.hou@amd.com,
	Min Ma <mamin506@gmail.com>
Cc: Eva Crystal <0xiviel@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] accel/amdxdna: bound the firmware-supplied mailbox register offsets
Date: Mon, 14 Sep 2026 09:31:56 +1200
Message-ID: <cddcbf5989cdbf6da94855152a34451ffa07860b.1789334558.git.0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789334558.git.0xiviel@gmail.com>
References: <cover.1789334558.git.0xiviel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware chooses where a mailbox channel's head and tail registers live
and reports them to the driver as device addresses: in the management
mailbox block it writes into the SRAM BAR, read by
aie2_get_mgmt_chann_info(), and in the CREATE_CONTEXT response, read by
aie2_create_context() for every hardware context. AIE2_MBOX_OFF() turns
each one into a raw byte offset into the mailbox mapping, and both
aie2_hw_start() and aie2_create_context() derive the mailbox interrupt
register from one of them by adding 4. On AIE4, aie4_mailbox_start()
takes the same four offsets straight out of the mailbox_info block.

None of them is checked. mailbox_reg_read() and mailbox_reg_write() add
the offset to xdna_mailbox_res::mbox_base and hand the result to
readl()/writel(), so an offset past the end of that mapping is an MMIO
access outside it, at a kernel virtual address the driver has no claim
to. AIE2_MBOX_OFF() is an unsigned 32-bit subtraction: a reported
address below the aperture base does not yield an obviously invalid
small offset but wraps to a very large one, and the + 4 for the
interrupt register can wrap independently of the value it derives from.

The bound is already there. xdna_mailbox_res::mbox_size is the exact
length of the mapping pcim_iomap() produced - the device's mailbox
window size, or the BAR length when the device does not override it -
and it sits in the same struct as mbox_base. The driver stores it and
never reads it.

Check the four register offsets and the interrupt register against
mbox_size in xdna_mailbox_start_channel(). Every mailbox register
access reads mb_chann->res[] or mb_chann->iohub_int_addr, and that
function is the only writer of either, so it is the one point every
firmware-supplied offset passes through, for the management channel,
for a hardware context and for AIE4 alike. It is also where the derived
interrupt register arrives, as a parameter, which a check at the
producing sites would not cover. A zero interrupt register keeps its
existing meaning of "this platform has no such register".

Require 32 bit alignment in the same place. All six users of these
offsets go through mailbox_reg_read() or mailbox_reg_write(), whose
bodies are a bare readl() and writel(); the driver has no narrower or
wider mailbox accessor, so an offset that is not a multiple of four
cannot name a register in this block whatever else is true of it.
mailbox_get_msg() already pairs a range check with IS_ALIGNED(tail, 4)
for the ring tail firmware writes, for the same reason.

Failing there rejects the channel before any offset reaches readl() or
writel(). aie2_hw_start() and aie4_mailbox_start() unwind and fail the
probe or resume; aie2_create_context() frees the channel and destroys
the firmware context, so AMDXDNA_CREATE_HWCTX returns an error to
userspace instead of leaving a channel that accesses outside its
mapping.

This is the firmware-to-driver trust boundary. Whether the part can
report a register outside the mailbox aperture is not established and
there is no reproducer. The offsets are simply the one firmware-supplied
value this driver leaves unbounded, against a limit it already computes
and stores.

Signed-off-by: Eva Crystal <0xiviel@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index cc8865f4e79c..a390836fe797 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -112,6 +112,33 @@ static u32 mailbox_reg_read(struct mailbox_channel *mb_chann, u32 mbox_reg)
 	return readl(ringbuf_addr);
 }
 
+/*
+ * Firmware describes where a channel's head and tail registers live, as raw
+ * offsets into the mailbox mapping: in the management mailbox block it writes
+ * into SRAM for the management channel, and in the CREATE_CONTEXT response for
+ * a hardware context. Both helpers above add such an offset straight to
+ * mbox_base, so check it against the shape of that mapping first.
+ */
+static bool mailbox_reg_in_range(struct mailbox_channel *mb_chann, u32 mbox_reg)
+{
+	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
+
+	/*
+	 * Every access through the two helpers above is a readl() or a
+	 * writel(), so an offset has to be 32 bit aligned, and leave room for
+	 * 32 bits, to name a register in this mapping at all.
+	 */
+	return IS_ALIGNED(mbox_reg, 4) &&
+	       (u64)mbox_reg + sizeof(u32) <= mb_res->mbox_size;
+}
+
+static bool mailbox_chann_res_in_range(struct mailbox_channel *mb_chann,
+				       const struct xdna_mailbox_chann_res *res)
+{
+	return mailbox_reg_in_range(mb_chann, res->mb_head_ptr_reg) &&
+	       mailbox_reg_in_range(mb_chann, res->mb_tail_ptr_reg);
+}
+
 static inline void mailbox_irq_acknowledge(struct mailbox_channel *mb_chann)
 {
 	if (mb_chann->iohub_int_addr)
@@ -518,6 +545,16 @@ xdna_mailbox_start_channel(struct mailbox_channel *mb_chann,
 		return -EINVAL;
 	}
 
+	/* A zero iohub_int_addr means the platform has no such register. */
+	if (!mailbox_chann_res_in_range(mb_chann, x2i) ||
+	    !mailbox_chann_res_in_range(mb_chann, i2x) ||
+	    (iohub_int_addr && !mailbox_reg_in_range(mb_chann, iohub_int_addr))) {
+		dev_err(mb_chann->mb->dev,
+			"Mailbox register offset unaligned or outside the %zu byte mapping\n",
+			mb_chann->mb->res.mbox_size);
+		return -EINVAL;
+	}
+
 	mb_chann->msix_irq = mb_irq;
 	mb_chann->iohub_int_addr = iohub_int_addr;
 	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
-- 
2.53.0

