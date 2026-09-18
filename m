Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03734C753C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727670; cv=none; b=EPnAMGsOF3s4vUkNxvTe3IelC3TFY0ZShBfxhXEd8rt0SwbtyAJk+f3OzttQK5ETWtJy/HLHShRkFOrOiTbVHBGeAlnozuJQvZm7N//fMNEvsYf4qP+bttGevodDIqJbus/UbsIzeI0B7sKLg3jgSHJ1yfRoWDr/ltjh123t+dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727670; c=relaxed/simple;
	bh=7UKXu6Xq8urxgrZsJMuj2mAIxSvB6FQ4+ac3IUP+8sY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hQQ8FFr71xuPBvijISJrGWtpExzf/LTGyeuI92MAYR6MC6HUpErKJTBTMsWevfHMIT0S1Aj1k8E48KomkzQa72ymlGA47KM5vngzXvfzHWfeUYmzzuyjhP8pj8YOBA9rugixZHW29lilLVrX9W4wvlBO5d4qYTYGCVQ+Ept9hvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bix5clzu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bix5clzu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccff31419so5007255e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789727667; x=1790332467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nrrLnTIbrTZ60I7yC8/lMcC7nvRzjdXpmgKGXHHN28k=;
        b=Bix5clzuUwSHgCppRpLVcmLi+vJ0IjKiGj/7n/CrsxJNc4q5dwHD/W09noLp4SDqqO
         ql4R9+zwd46fPp6N3ngLYh8BDsDVp2ieLtkYYOaV+aT1l8HV8G+qtkKUFy844wkuYMhF
         YlvPpQuxzjDU7HbnOgseVEtFV8PXQHQMKbcdOLfYZFDw4sTtZ7NsfJBBel5HWZrJ6TuE
         zVqXk04Y5uMCDIILgYEEkbBzaEgGnj9LLzWx5tHJ+9J8qebVxbSEg1RJvQ5K3Xy2jRFu
         qpNxOsW4reB+SBqH920MkGqi3usy8vXgWuoG8aoPpSj0ohVVSkLu2qTXUvVdj8G8m2xw
         BR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789727667; x=1790332467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nrrLnTIbrTZ60I7yC8/lMcC7nvRzjdXpmgKGXHHN28k=;
        b=Cx8KTQgJjnVjQF1F22UnEqU6nzBCpkrPMNl3L/WECbh+eYdxm4dQivu1Z4nWWi+jrr
         oAHoS/MY/mzpnbQoYi7efh7uwABREahJIlnP2iB/zSz152A90UABYGrCh2qL3/4sNl5f
         rU+GwiIq9wtV0/cObPRElvwSC++asbQaTqGciY5U/SdGt/ydmV7WT6ws602vBEEbHlB8
         Q3qmwKolAam4EXFVEl6JuH+X9kA18ejIsg+NM6NEtrCdjeArufYziICSvK8y+sYW03My
         5b7JDtOkggspo5B8G3lhS1SntL8O8Wq+eNU3txZcOPkRt3gbxy4Gu1p1eJlrnqy88oKa
         cWWA==
X-Forwarded-Encrypted: i=1; AKwUvBxH5GG4KMjzsjtsakO7hQUYb2Shpl+h0POfzODG3gAV6SqjVRSzTgq7wjvDjNvaxAo7qBrcyVgTO1KAmkE=@vger.kernel.org
X-Gm-Message-State: AFuF++lOsx3EVbZwSdrGkIcD6px6nAyZ+e7qP/XmKEo+VYLGDGEREz7U
	5nv+f2pdf57F5v5K0H8fVRTn7ZQ/Pn7vIiJyhLWR19eHG36pghm9MhiMJ2uOC/Xz
X-Gm-Gg: AYBFou0JJ3lbbFR1vkFH4dfWWXZDoCX3MCS/QWPDTQUFEMN5kunxpf9OszLpU8fiou8
	Ghjcmf+ERaBpSefHCk9fvtMx9xjpmGC9/xbzEw2BV5yUff7FpJE2GEIVeYxlIGGejz4d3gTDL+b
	UGaJaQaPxA+I7C4jo++f3ABFIm3tRCmluJ4b1x8pr5gpBqxMFTtMauZo4ej1RsGUbj+59O/kkPP
	57YByALMO6vu4z2DHEf71XIf+BJIFzbmPNj3To8/L2GXTY4FEY6L45TNM3Y7qVXUzB7Ly4bkiTN
	9LX+KYSyKKuO65XTJbGvAyNUWn5k/IKJ23HZvsxNUzTvnzbgS1h+8PZJJ47r9FEU9lw9xr5HPn7
	Xa/ZL1YPDRvx1q21CIsUsutGBSFHn1cl7bOZhi+v0hv5ZQMgLlC7UGMN+PLuEJbjh/IsaNmStQ/
	ujPRTJS9BaagBdMKE2ED/+EL9W2nB/ZkSNT+D0POoi8iC9H8NDaAlno4/i7FzGiLgIYIVlZGdN5
	Rv8URVnCVahDw==
X-Received: by 2002:a05:600c:3494:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-49fc573faa4mr23849825e9.26.1789727666921;
        Fri, 18 Sep 2026 03:34:26 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ec1e63sm30267795e9.0.2026.09.18.03.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:34:26 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] gpib: tnt4882: Clean up mite code
Date: Fri, 18 Sep 2026 12:33:44 +0200
Message-ID: <20260918103344.17034-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mite driver was adapted from COMEDI and contains a lot of code
that is not relevant for the gpib tnt4882 driver.

Remove useless code.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/gpib/tnt4882/mite.c |   6 --
 drivers/gpib/tnt4882/mite.h | 166 ------------------------------------
 2 files changed, 172 deletions(-)

diff --git a/drivers/gpib/tnt4882/mite.c b/drivers/gpib/tnt4882/mite.c
index c75c45cdf03f..56afad7a9cc1 100644
--- a/drivers/gpib/tnt4882/mite.c
+++ b/drivers/gpib/tnt4882/mite.c
@@ -35,20 +35,14 @@
 #include <linux/ioport.h>
 #include <linux/delay.h>
 #include <linux/mm.h>
-#include <linux/interrupt.h>
 #include <linux/pci.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 
 #include "mite.h"
 
-#define PCI_MITE_SIZE		4096
-#define PCI_DAQ_SIZE		4096
-
 struct mite_struct *mite_devices;
 
-#define TOP_OF_PAGE(x) ((x) | (~(PAGE_MASK)))
-
 void mite_init(void)
 {
 	struct pci_dev *pcidev;
diff --git a/drivers/gpib/tnt4882/mite.h b/drivers/gpib/tnt4882/mite.h
index dd251afa90e3..d334ab50fc40 100644
--- a/drivers/gpib/tnt4882/mite.h
+++ b/drivers/gpib/tnt4882/mite.h
@@ -13,14 +13,6 @@
 
 #define PCI_VENDOR_ID_NATINST		0x1093
 
-//#define DEBUG_MITE
-
-#ifdef DEBUG_MITE
-#define MDPRINTK(format, args...) pr_debug(format, ## args)
-#else
-#define MDPRINTK(args...)
-#endif
-
 #define MITE_RING_SIZE 3000
 struct mite_dma_chain {
 	u32 count;
@@ -59,164 +51,6 @@ void mite_init(void);
 void mite_cleanup(void);
 int mite_setup(struct mite_struct *mite);
 void mite_unsetup(struct mite_struct *mite);
-void mite_list_devices(void);
-
-#define CHAN_OFFSET(x)			(0x100 * (x))
-
-/* DMA base for chan 0 is 0x500, chan 1 is 0x600 */
-
-#define MITE_CHOR		0x500
-#define CHOR_DMARESET			BIT(31)
-#define CHOR_SET_SEND_TC		BIT(11)
-#define CHOR_CLR_SEND_TC		BIT(10)
-#define CHOR_SET_LPAUSE			BIT(9)
-#define CHOR_CLR_LPAUSE			BIT(8)
-#define CHOR_CLRDONE			BIT(7)
-#define CHOR_CLRRB			BIT(6)
-#define CHOR_CLRLC			BIT(5)
-#define CHOR_FRESET			BIT(4)
-#define CHOR_ABORT			BIT(3)
-#define CHOR_STOP			BIT(2)
-#define CHOR_CONT			BIT(1)
-#define CHOR_START			BIT(0)
-#define CHOR_PON			(CHOR_CLR_SEND_TC | CHOR_CLR_LPAUSE)
-
-#define MITE_CHCR		0x504
-#define CHCR_SET_DMA_IE			BIT(31)
-#define CHCR_CLR_DMA_IE			BIT(30)
-#define CHCR_SET_LINKP_IE		BIT(29)
-#define CHCR_CLR_LINKP_IE		BIT(28)
-#define CHCR_SET_SAR_IE			BIT(27)
-#define CHCR_CLR_SAR_IE			BIT(26)
-#define CHCR_SET_DONE_IE		BIT(25)
-#define CHCR_CLR_DONE_IE		BIT(24)
-#define CHCR_SET_MRDY_IE		BIT(23)
-#define CHCR_CLR_MRDY_IE		BIT(22)
-#define CHCR_SET_DRDY_IE		BIT(21)
-#define CHCR_CLR_DRDY_IE		BIT(20)
-#define CHCR_SET_LC_IE			BIT(19)
-#define CHCR_CLR_LC_IE			BIT(18)
-#define CHCR_SET_CONT_RB_IE		BIT(17)
-#define CHCR_CLR_CONT_RB_IE		BIT(16)
-#define CHCR_FIFODIS			BIT(15)
-#define CHCR_FIFO_ON			0
-#define CHCR_BURSTEN			BIT(14)
-#define CHCR_NO_BURSTEN			0
-#define CHCR_NFTP(x)			((x) << 11)
-#define CHCR_NFTP0			CHCR_NFTP(0)
-#define CHCR_NFTP1			CHCR_NFTP(1)
-#define CHCR_NFTP2			CHCR_NFTP(2)
-#define CHCR_NFTP4			CHCR_NFTP(3)
-#define CHCR_NFTP8			CHCR_NFTP(4)
-#define CHCR_NFTP16			CHCR_NFTP(5)
-#define CHCR_NETP(x)			((x) << 11)
-#define CHCR_NETP0			CHCR_NETP(0)
-#define CHCR_NETP1			CHCR_NETP(1)
-#define CHCR_NETP2			CHCR_NETP(2)
-#define CHCR_NETP4			CHCR_NETP(3)
-#define CHCR_NETP8			CHCR_NETP(4)
-#define CHCR_CHEND1			BIT(5)
-#define CHCR_CHEND0			BIT(4)
-#define CHCR_DIR			BIT(3)
-#define CHCR_DEV_TO_MEM			CHCR_DIR
-#define CHCR_MEM_TO_DEV			0
-#define CHCR_NORMAL			((0) << 0)
-#define CHCR_CONTINUE			((1) << 0)
-#define CHCR_RINGBUFF			((2) << 0)
-#define CHCR_LINKSHORT			((4) << 0)
-#define CHCR_LINKLONG			((5) << 0)
-#define CHCRPON				(CHCR_CLR_DMA_IE | CHCR_CLR_LINKP_IE | CHCR_CLR_SAR_IE | \
-					 CHCR_CLR_DONE_IE | CHCR_CLR_MRDY_IE | CHCR_CLR_DRDY_IE | \
-					 CHCR_CLR_LC_IE | CHCR_CLR_CONT_IE)
-
-#define MITE_TCR		0x508
-
-/* CR bits */
-#define CR_RL(x)			((x) << 21)
-#define CR_RL0				CR_RL(0)
-#define CR_RL1				CR_RL(1)
-#define CR_RL2				CR_RL(2)
-#define CR_RL4				CR_RL(3)
-#define CR_RL8				CR_RL(4)
-#define CR_RL16				CR_RL(5)
-#define CR_RL32				CR_RL(6)
-#define CR_RL64				CR_RL(7)
-#define CR_RD(x)			((x) << 19)
-#define CR_RD0				CR_RD(0)
-#define CR_RD32				CR_RD(1)
-#define CR_RD512			CR_RD(2)
-#define CR_RD8192			CR_RD(3)
-#define CR_REQS(x)			((x) << 16)
-#define CR_REQSDRQ0			CR_REQS(4)
-#define CR_REQSDRQ1			CR_REQS(5)
-#define CR_REQSDRQ2			CR_REQS(6)
-#define CR_REQSDRQ3			CR_REQS(7)
-#define CR_ASEQX(x)			((x) << 10)
-#define CR_ASEQX0			CR_ASEQX(0)
-#define	CR_ASEQDONT			CR_ASEQX0
-#define CR_ASEQXP1			CR_ASEQX(1)
-#define CR_ASEQUP			CR_ASEQXP1
-#define CR_ASEQXP2			CR_ASEQX(2)
-#define CR_ASEQDOWN			CR_ASEQXP2
-#define CR_ASEQXP4			CR_ASEQX(3)
-#define CR_ASEQXP8			CR_ASEQX(4)
-#define CR_ASEQXP16			CR_ASEQX(5)
-#define CR_ASEQXP32			CR_ASEQX(6)
-#define CR_ASEQXP64			CR_ASEQX(7)
-#define CR_ASEQXM1			CR_ASEQX(9)
-#define CR_ASEQXM2			CR_ASEQX(10)
-#define CR_ASEQXM4			CR_ASEQX(11)
-#define CR_ASEQXM8			CR_ASEQX(12)
-#define CR_ASEQXM16			CR_ASEQX(13)
-#define CR_ASEQXM32			CR_ASEQX(14)
-#define CR_ASEQXM64			CR_ASEQX(15)
-#define CR_PSIZEBYTE			BIT(8)
-#define CR_PSIZEHALF			(2 << 8)
-#define CR_PSIZEWORD			(3 << 8)
-#define CR_PORTCPU			(0 << 6)
-#define CR_PORTIO			BIT(6)
-#define CR_PORTVXI			(2 << 6)
-#define CR_PORTMXI			(3 << 6)
-#define CR_AMDEVICE			BIT(0)
-
-#define CHSR_INT			0x80000000
-#define CHSR_DONE			0x02000000
-#define CHSR_LINKC			0x00080000
-
-#define MITE_MCR		0x50c
-#define	MCRPON				0
-
-#define MITE_MAR		0x510
-
-#define MITE_DCR		0x514
-#define DCR_NORMAL			BIT(29)
-#define DCRPON				0
-
-#define MITE_DAR		0x518
-
-#define MITE_LKCR		0x51c
-
-#define MITE_LKAR		0x520
-#define MITE_LLKAR		0x524
-#define MITE_BAR		0x528
-#define MITE_BCR		0x52c
-#define MITE_SAR		0x530
-#define MITE_WSCR		0x534
-#define MITE_WSER		0x538
-#define MITE_CHSR		0x53c
-#define MITE_FCR		0x540
-
-#define MITE_FIFO		0x80
-#define MITE_FIFOEND		0xff
-
-#define MITE_AMRAM		        0x00
-#define MITE_AMDEVICE		        0x01
-#define MITE_AMHOST_A32_SINGLE	        0x09
-#define MITE_AMHOST_A24_SINGLE	        0x39
-#define MITE_AMHOST_A16_SINGLE	        0x29
-#define MITE_AMHOST_A32_BLOCK	        0x0b
-#define MITE_AMHOST_A32D64_BLOCK	0x08
-#define MITE_AMHOST_A24_BLOCK	        0x3b
 
 enum mite_registers {
 	MITE_IODWBSR = 0xc0,	// IO Device Window Base Size Register
-- 
2.55.0

