Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B634363C79
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329922; cv=none; b=kWJMJ5OEF59DTzrNGeOFUZ9D8SZKcsTdbSedqDMpbTgUUmUB7PDHOGr2E5l7R3PKmK0ZVY3+gZQfFX8gP5ZWL7wcGsl2p7A3osE+h/cY6I6cgTzPkFymxAIhLzJyZ+5t5vdB+yLhZlhlzEHVZuFJURiFN4DaQAoKTS90Dc746LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329922; c=relaxed/simple;
	bh=+U5ShjQvYDQVEoG8JT88P7lNV4Yx62vjXbnIMqziJwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taZtsq1KsmocZtm27k2pkhcrlP15iGEVQICsYdKuizXqkVeIqmykkw/4lSBkbECWiXPaGIXWm14ZOX3wBGwPmDp/8D2y+L1pzpfn3DQcXv1bXnYFg0wLrQz6mdP+ysjbvvTq/ja9PbOryP2A30E3Th0zNiPcfrmT/r9AU2f/4Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/pDszzy; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/pDszzy"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedf433a99so2904239a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789329920; x=1789934720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsxyHcXIO8kCg+BbasfKONF82xj3AL3NR/R2G4eOqwY=;
        b=U/pDszzydu/AktJt3wzCHQayAzoIJI6ftBDcBqRj97HGn597YrMs4z0hmSwvbsaGWu
         e4gofv6Pq+SI+MPfhsRvynejhZOVVf9+AiCDmL0gAv3KS55VOxYpS54IBByuY4t20qXb
         Zfg0PqwoGtC+slwcFLFcO/pXMz0IK7Ts6/nM9GGh1mPHnZAXqM8I4Nsy+72XhOXwFwI6
         JtDEA6y7EeTRi0Ahj/kb1HVhU5yHSwmzZbSal8EIORAO582bzRRpIkJPzQziQRgLjDfq
         zVyNks4xyyR2uiqogaX86Put88CP3++61zB/thh5R1po796i3XmKRJYbKYdWNDGNFivr
         1YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789329920; x=1789934720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsxyHcXIO8kCg+BbasfKONF82xj3AL3NR/R2G4eOqwY=;
        b=SymvvDk3i96h837xhLtnrLztZrLD4c1/x93WLMlSBgGIMQckZ7RHkOScEqMmoyzWg8
         SaXQRiGanqRUkErRS6+qnDSoc/eSPYGaBvnvTYtAoLlJf70yWPSlgyeop4qy/0SGDJpw
         dSEsD1gGsXUDJtbpy51UwsZi5wLp4IKd+WlLr4nXSbSyiRLIiEhmKaOpi40tnc8MChU+
         vwyJnveBvtL6b4DF/Jtw7TeX+Gko12zK9sUNxVgyNlPl8kpk+fjubsZgz+vEzA3xrqBx
         +Fg2TLuurHE107dDGDMqgj+KYImYQyT/C7jnUKwWBIpDBElOmQJOhR6bZWJLpq/iR7Gw
         oyUA==
X-Forwarded-Encrypted: i=1; AKwUvBzbh/Ps/5x6t2E04QHYQfzGOc+TSKdgDhehocTEwjMuKUXPiv2JVUinrRWrnD7soAKPpacotZRMAZLPWjM=@vger.kernel.org
X-Gm-Message-State: AFuF++lha5plILTbI5Jh2ps8Ql4BUdZ3y+S2Lt/HrszvwNwAurRbUycS
	J/JcxmgW32BUKHE+AD4/Os8350rtZtDSbsfddtF5NscaEGm48t2Z49EM
X-Gm-Gg: AYBFou3bJLRs4yLgBQaUpIpVPFmnZdAzC264vDKPxdxh1KKZ1+Zthg/FD91nqZWPHBJ
	jZ0M+nW8Phu+wrBbZ8wE/Xc6zWmUkvFbSkK/I5CwYTjRu1V01Rahx8JKzeuZ1UHF6HyXEiEJuz2
	+b1vmA0RBrvGrbL6Cc9uKXUBNOh+eVmyFYwGB3XZwVHk3aiVzymOf2fl68o3ybCejHX5XLXBR4I
	ppqZewX6Su/fcdsrnRJWjKqR72R66nllbBg9Kk3RJtfOM5+VFVg5rFIQQYqGgT9jNIH08g4uJLa
	zDo9+S7S9NUqzvb0MP718ZZdxueyLL3Yb/owKdMBDsUcv4lj3fwrNttyMxz7omGJi/ZhOqRMRxG
	lwtrSzVSPr7srbrVWKptr+gNWdFM/BGTDVtlX+sW0WAo/9RATah8Cz2QW3xElpR8FVTE/im9js8
	3p1mZ3lsVqM5V9ZOjg589bZtfI7zeKJxya5iA1LnoOzN/HUGTE/kiw/Vx3VVxCfBmnvcl7OW4Qg
	Yqk92xmOEDcF1tN70c416rPkTrI0vV+KEPNO0cjNiRCsGcMCxmYWQDvf7zX3CWXPEtYKUgBoDtj
	RH/TwZHWEZbrOZDY626hjHx6YhCfUFRlM/8lkPHX1+eg
X-Received: by 2002:a17:90b:5823:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39d9c0aad8dmr27136272a91.16.1789329920331;
        Sun, 13 Sep 2026 13:05:20 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm3676635a91.0.2026.09.13.13.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:05:19 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Eva Crystal <0xiviel@gmail.com>
Subject: [PATCH 1/1] accel/amdxdna: bound the firmware-supplied mailbox register offsets
Date: Mon, 14 Sep 2026 08:02:12 +1200
Message-ID: <20260913200212.133126-2-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913200212.133126-1-0xiviel@gmail.com>
References: <20260913200212.133126-1-0xiviel@gmail.com>
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
 drivers/accel/amdxdna/amdxdna_mailbox.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index cc8865f4e79c..0c4cb8beb26e 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -112,6 +112,28 @@ static u32 mailbox_reg_read(struct mailbox_channel *mb_chann, u32 mbox_reg)
 	return readl(ringbuf_addr);
 }
 
+/*
+ * Firmware describes where a channel's head and tail registers live, as raw
+ * offsets into the mailbox mapping: in the management mailbox block it writes
+ * into SRAM for the management channel, and in the CREATE_CONTEXT response for
+ * a hardware context. Both helpers above add such an offset straight to
+ * mbox_base, so bound it against the size of that mapping first.
+ */
+static bool mailbox_reg_in_range(struct mailbox_channel *mb_chann, u32 mbox_reg)
+{
+	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
+
+	/* Every access through the two helpers above is 32 bits wide. */
+	return (u64)mbox_reg + sizeof(u32) <= mb_res->mbox_size;
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
@@ -518,6 +540,16 @@ xdna_mailbox_start_channel(struct mailbox_channel *mb_chann,
 		return -EINVAL;
 	}
 
+	/* A zero iohub_int_addr means the platform has no such register. */
+	if (!mailbox_chann_res_in_range(mb_chann, x2i) ||
+	    !mailbox_chann_res_in_range(mb_chann, i2x) ||
+	    (iohub_int_addr && !mailbox_reg_in_range(mb_chann, iohub_int_addr))) {
+		dev_err(mb_chann->mb->dev,
+			"Mailbox register offset outside the %zu byte mailbox mapping\n",
+			mb_chann->mb->res.mbox_size);
+		return -EINVAL;
+	}
+
 	mb_chann->msix_irq = mb_irq;
 	mb_chann->iohub_int_addr = iohub_int_addr;
 	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
-- 
2.53.0

