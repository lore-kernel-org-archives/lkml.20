Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFEA5237A2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860470; cv=none; b=b6wUZU1LSq7uNXj0MCHu1A4oPAS4HJRbqiJi0ltOypNIw/WKgcUB3UfZrYjVPvgouVlv/4JuN/W5DqWbLqujgA2qC479bzCrV5V5utRkR155wL/v8MMxuac20kgkNYhd/LWSsMTD8VFOCVelJR0a27Y+hcVZEXjzChfrqsT3cl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860470; c=relaxed/simple;
	bh=ymrWWchYGLjkNxZZNJjEWYLE5L5GJlodkp3U06kQKLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hy/k7es25U/4cB/xgukZjldjHOuhQlFQhGmuPJycOvvDXcGPoW+4Vg6G4Gp1JZabGu2vI8DpM4hn/txEZ0/Pue/q9CdI6S1GF4kMldVRBLSyw4b+6jj6GnGwswpkau7yWNveXDtEpD3DFL8jlFDPlO4uyWtX57q6hGCFBLruIW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1qUDlOc; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1qUDlOc"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so5148513a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860468; x=1789465268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2aAMCf2SpXVpQaOpvFq2x8nEqjxcR4A/9rWT4hksgxQ=;
        b=i1qUDlOc70TxRXfkYvqWSrwX6+K/DjP5pnDdmRyPJ0aX/ZXYFlBBy0+fND2fcLUZwj
         fpfN0l411eO6RwFEDsh1OwNlWApSCT4/Mz2onyX5TeDv5RaYG+QtGZDflEC0Edkc0i7s
         YgjDufWlDOHpxgYhCR9yL+dtVFbK+x0oxH+VPpAvBrs37f2kKv4Gn40N3kpnlb81IpR3
         GAf9CVGdhcBDrfXTtWaGce3Hcxm32ZwFhR4KdCaNZNXssYNUJRrWUhPrYJ2bGP8MXcCl
         45a+oolmfxvwvu33E2y+h1DnkMU1T+Um7Ae+b9u8Z2tuXV6xW5hbAfKucj15621WKkj7
         66Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860468; x=1789465268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2aAMCf2SpXVpQaOpvFq2x8nEqjxcR4A/9rWT4hksgxQ=;
        b=p2bGQBHPH2Zy7sF5NZ1CqoUhZA8ASMUSHBmcg7F9TZCTTmpoKMea5/c0uVOCw9Race
         98cZZp6v1GoYVnxqU9sl35mY0icx5mYfjj7pxk7857e7H3OWT+xpUaRPBsbkHuhjtPnP
         mo8i8MRi3y2ZMH1MH+J9R6wfoSrQp0mNjlnQKK8Iv9O4N9zVPpfOaOhH4ZCnV/7mZ4cj
         BooZXL8euHqgNIXef6eJ9olVgemoLk4e8vieHVHa5U97MspBd2X4hF2LygRGX8IRbIxb
         dzVmgyASI82Mnqc5/RvkJUmjT8g0n3az4t6cPAkej8CXmCFd2Upn/KRDDvZWFMHKonRW
         VsPw==
X-Forwarded-Encrypted: i=1; AKwUvBxRqGwlxfPDJFkA9/8Ah3Os2tCudmczRGwJ6+PLyjhjstP2o34rcMv1kLyKFx/rSnS9u9SwEE+lFn4bFvg=@vger.kernel.org
X-Gm-Message-State: AFuF++l+5tX556fYy1yBbPGJ1gDR7rhVZDR8wcFLpKd8cQ7gjWYdP/Sm
	j6jlLBHlfGrt/mXRkzNu2qU/QSboTSOH5U787MKf0QFtgW7m8jaPRe5i
X-Gm-Gg: AYBFou1SL4oseLaUS+v09jCnPBhtonbQ93qawVrZ99xf9qXGP7kYw6AG6qUx7apHwYH
	fTmgRKx0xsDcZ8/QXzE5BVMx7HaXp50Ar1cOy3stlWkAEktt6t4QzXKOq/5f9a5WtXVwHLNJ6/u
	SMuEqpaAE8hk5SXTSj/D1eQGtwfwHu/hk9tit38iv3nH0WsgibIgYLtx2v352Sz3PnHGLVD+zfc
	Pm/DW65pzzW8IgtbpUBPq2uir0k+1mFpWbYyxlWblk65rzRCGNqKf18sObhD/ry3XsqVpjO/M4X
	TcfJUCx5Qp1rNygoItGon/KnQLXA3lv5d/nRX3ozkVavgo11rkcHJqRvtgE/t4e6CHv8l0fJpkT
	uaLqpQdtL0QWeGswfwDGqLDtnTTY0szq6nCdJS6q0JvZfDdI5KkMEu+e9D6Rsb/hXxHsCpfZ5nW
	jqWQtt8JxHjuPRzEP3U1M1PClW4xZCmwSqZsayKNkuXzglgJgP4MgXgJzDcwtfoWnPCYvFQ8DQg
	FwzS6QUQ67Vj5HzdSN7yko68rk65X08qxq9c8TMbPillewtAjr3Hx9rH9j/lYtCCUDupfJopF9e
X-Received: by 2002:a17:90b:2ccd:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39b260d7297mr49355163a91.8.1788860468117;
        Tue, 08 Sep 2026 02:41:08 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:41:07 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 6/6] m68k: virt: Switch to generic goldfish-pic driver
Date: Tue,  8 Sep 2026 09:40:16 +0000
Message-ID: <20260908094016.1997918-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The m68k virt platform implements a custom irq_chip and chained handler
in arch/m68k/virt/ints.c to handle its 6 goldfish PIC instances.

Replace this custom implementation with calls to goldfish_pic_init() to
use the generic goldfish-pic driver, and select CONFIG_GOLDFISH_PIC for
CONFIG_VIRT.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/m68k/Kconfig.machine |  1 +
 arch/m68k/virt/ints.c     | 89 ++++-----------------------------------
 2 files changed, 10 insertions(+), 80 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index cff990c319cb..7b15012ffb28 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -130,6 +130,7 @@ config VIRT
 	depends on MMU
 	select GENERIC_CLOCKEVENTS
 	select GOLDFISH
+	select GOLDFISH_PIC
 	select GOLDFISH_TIMER
 	select GOLDFISH_TTY
 	select M68040
diff --git a/arch/m68k/virt/ints.c b/arch/m68k/virt/ints.c
index 896aa6eb8bcc..54da6b1f5ce7 100644
--- a/arch/m68k/virt/ints.c
+++ b/arch/m68k/virt/ints.c
@@ -1,25 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/sched/debug.h>
-#include <linux/types.h>
 #include <linux/ioport.h>
+#include <linux/irqchip/irq-goldfish-pic.h>
 
-#include <asm/hwtest.h>
 #include <asm/irq.h>
 #include <asm/irq_regs.h>
 #include <asm/processor.h>
 #include <asm/virt.h>
 
-#define GFPIC_REG_IRQ_PENDING           0x04
-#define GFPIC_REG_IRQ_DISABLE_ALL       0x08
-#define GFPIC_REG_IRQ_DISABLE           0x0c
-#define GFPIC_REG_IRQ_ENABLE            0x10
-
 static struct resource picres[6];
 static const char *picname[6] = {
 	"goldfish_pic.0",
@@ -50,43 +39,6 @@ static const char *picname[6] = {
  * CPU IRQ #7 -> NMI
  */
 
-static u32 gfpic_read(int pic, int reg)
-{
-	void __iomem *base = (void __iomem *)(virt_bi_data.pic.mmio +
-					      pic * 0x1000);
-
-	return ioread32be(base + reg);
-}
-
-static void gfpic_write(u32 value, int pic, int reg)
-{
-	void __iomem *base = (void __iomem *)(virt_bi_data.pic.mmio +
-					      pic * 0x1000);
-
-	iowrite32be(value, base + reg);
-}
-
-#define GF_PIC(irq) ((irq - IRQ_USER) / 32)
-#define GF_IRQ(irq) ((irq - IRQ_USER) % 32)
-
-static void virt_irq_enable(struct irq_data *data)
-{
-	gfpic_write(BIT(GF_IRQ(data->irq)), GF_PIC(data->irq),
-		    GFPIC_REG_IRQ_ENABLE);
-}
-
-static void virt_irq_disable(struct irq_data *data)
-{
-	gfpic_write(BIT(GF_IRQ(data->irq)), GF_PIC(data->irq),
-		    GFPIC_REG_IRQ_DISABLE);
-}
-
-static unsigned int virt_irq_startup(struct irq_data *data)
-{
-	virt_irq_enable(data);
-	return 0;
-}
-
 static irqreturn_t virt_nmi_handler(int irq, void *dev_id)
 {
 	static int in_nmi;
@@ -102,40 +54,12 @@ static irqreturn_t virt_nmi_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irq_chip virt_irq_chip = {
-	.name		= "virt",
-	.irq_enable	= virt_irq_enable,
-	.irq_disable	= virt_irq_disable,
-	.irq_startup	= virt_irq_startup,
-	.irq_shutdown	= virt_irq_disable,
-};
-
-static void goldfish_pic_irq(struct irq_desc *desc)
-{
-	u32 irq_pending;
-	unsigned int irq_num;
-	unsigned int pic = desc->irq_data.irq - 1;
-
-	irq_pending = gfpic_read(pic, GFPIC_REG_IRQ_PENDING);
-	irq_num = IRQ_USER + pic * 32;
-
-	do {
-		if (irq_pending & 1)
-			generic_handle_irq(irq_num);
-		++irq_num;
-		irq_pending >>= 1;
-	} while (irq_pending);
-}
-
 void __init virt_init_IRQ(void)
 {
 	unsigned int i;
-
-	m68k_setup_irq_controller(&virt_irq_chip, handle_simple_irq, IRQ_USER,
-				  NUM_VIRT_SOURCES - IRQ_USER);
+	int ret;
 
 	for (i = 0; i < 6; i++) {
-
 		picres[i] = (struct resource)
 		    DEFINE_RES_MEM_NAMED(virt_bi_data.pic.mmio + i * 0x1000,
 					 0x1000, picname[i]);
@@ -144,8 +68,13 @@ void __init virt_init_IRQ(void)
 			return;
 		}
 
-		irq_set_chained_handler(virt_bi_data.pic.irq + i,
-					goldfish_pic_irq);
+		ret = goldfish_pic_init((void __iomem *)(virt_bi_data.pic.mmio + i * 0x1000),
+					virt_bi_data.pic.irq + i,
+					IRQ_USER + i * 32, NULL);
+		if (ret) {
+			pr_err("Failed to initialize %s\n", picname[i]);
+			return;
+		}
 	}
 
 	if (request_irq(IRQ_AUTO_7, virt_nmi_handler, 0, "NMI",
-- 
2.55.0.979.g7e5102b832-goog

