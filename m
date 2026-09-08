Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07335AA668
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905115; cv=none; b=CGSm5Bng/MtNtP804cJoNlg73QX3p4nPya6sGW7XPF3J0PutGruLZhJX0E+6RaKJ3ifVSA34RZEyluBijOzv9sXPYVDT7g/2fP3z1SpDT+HdlqsnogVlG7U1rQbIwjJ+hTcZOwUn+AiZ8SSs3/ujZaS/NQvdndTFAHFUNSPYqBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905115; c=relaxed/simple;
	bh=5cy2w482j7GDHGCDyO1M1GrR4ueMaCSgw5sYMoLH1eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxtzPP/8IuVYVczzHjBqNNMUr1qXY1vIpvbSPqgOg6cFrKbdjdidSfWgg86JF8NR90HBS3ry2HgDHFu232TbyydO16fxxJ35Qon54FhL+7TNTZWYb4PanVybj6lgrD5VE2+KTkaergxRtfOb6PhOi8lPzJ9rc578VluGJo4fYX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSwgjDQo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSwgjDQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F3A1F00A3D;
	Tue,  8 Sep 2026 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905113;
	bh=23Vj12u5uLbYesugUdSCoTd9GIaMsirFDh+buPYQwfY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WSwgjDQoUcNDnpymdNQ8lHmy/aDUEZqJvuJg6XgjfJW0VLmi5L+ecJqoYllmxrCYE
	 HBDIKPcKV6ga/Cr+cYKO/x/bFPI6thhg92SCFE1GaATiBVwBj9PNd97p5vnMgA2p3A
	 taexFKrekUANqXEmw2sMvEpxfQ1ioqo/nETX4e1li0SKeBgARpMosHOJhyNMO1bXRy
	 Ws+4yflhSZm1DXYMh1j+I3vEnWc+IOveFfPPzfxNlGNKS//hNWgXe3smIG9n72/lGb
	 FvWwO++9RH6+LJ4s6cFN426iu1WXHXrJRt4BNDDgK+FLVNKQVq/p3GaPnTeIB5d4s9
	 AvfkGwx6xE8EA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:54 -0500
Subject: [PATCH v3 17/22] accel: ethosu: Reject reserved command encodings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-17-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command stream contains a 10-bit opcode and a two-bit command
control field. Reject reserved opcode and control encodings in the
switch default case so they cannot be interpreted differently by the
validator and hardware.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_device.h |  3 +++
 drivers/accel/ethosu/ethosu_gem.c    | 12 +++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 8e23fdbf7f8a..68e2969b6f79 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -91,6 +91,9 @@ struct gen_pool;
 #define NPU_KERNEL_DILATION_X		BIT(3)
 #define NPU_KERNEL_DILATION_Y		BIT(4)
 
+#define NPU_CMD_CTRL_CMD1		BIT(14)
+#define NPU_CMD_RESERVED_MASK		(BIT(15) | GENMASK(13, 10))
+
 enum ethosu_cmds {
 	NPU_OP_STOP = 0x0,
 	NPU_OP_IRQ = 0x1,
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 578d1b5b955c..f4bd31018e56 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -170,9 +170,9 @@ static void cmd_state_init(struct cmd_state *st)
 
 static void cmd_state_set_reg(struct cmd_state *st, u16 cmd)
 {
-	u16 reg = cmd & ~BIT(14);
+	u16 reg = cmd & ~NPU_CMD_CTRL_CMD1;
 
-	if (cmd & BIT(14)) {
+	if (cmd & NPU_CMD_CTRL_CMD1) {
 		if (reg < NPU_CMD1_REGS)
 			__set_bit(reg, st->cmd1);
 	} else if (reg < NPU_CMD0_REGS) {
@@ -182,9 +182,9 @@ static void cmd_state_set_reg(struct cmd_state *st, u16 cmd)
 
 static bool cmd_state_reg_is_set(struct cmd_state *st, u16 cmd)
 {
-	u16 reg = cmd & ~BIT(14);
+	u16 reg = cmd & ~NPU_CMD_CTRL_CMD1;
 
-	if (cmd & BIT(14))
+	if (cmd & NPU_CMD_CTRL_CMD1)
 		return reg < NPU_CMD1_REGS && test_bit(reg, st->cmd1);
 
 	return reg < NPU_CMD0_REGS && test_bit(reg, st->cmd0);
@@ -733,7 +733,7 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		cmd = cmds[0];
 		param = cmds[0] >> 16;
 
-		if (cmd & 0x4000) {
+		if (cmd & NPU_CMD_CTRL_CMD1) {
 			if (get_user(cmds[1], ucmds++))
 				return -EFAULT;
 
@@ -1054,6 +1054,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 			st.dma.src.len = st.dma.dst.len = addr;
 			break;
 		default:
+			if (cmd & NPU_CMD_RESERVED_MASK)
+				return -EINVAL;
 			break;
 		}
 	}

-- 
2.53.0

