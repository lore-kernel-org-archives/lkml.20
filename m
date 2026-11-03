Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726327;
	b=hAN8UiFMNzBAMDIk11q3KxiSTHkMPBVSy77kXSCiSKa4LAmoA6/yjuc5Z+K8Ce/IxtqO
	 v/8sK9Q/4RGcoJZIeC2uKDdbJhrJwnnNW77tTvYAMZS4jNtgkaqokra+n0lpDdYaR3StN
	 DImInst/fEFTOBuU5lJW95rvFha6h4loeTcKjS8pUTvWUzp7yYpUWyMb+mAAEDUAsArzG
	 lCMJqB0aLJFlwV0Ub4HHAwl4ZDALi6EdWZc2xm3C/+fB6334bWiToP3L2nT+33Fa4f39g
	 YZGOzAUDs8NQHjOZ/rbYPo03lshvDCpmuwbwPje2I+krPfQBg81e1HiU5pfzGoIiNNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726327;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=TUFX3tU1E3wKbYbjTX9p4dL95Bk3btuFKM+PqEwbEl0=;
	b=SIC8T45qzgp/F+VqVMOVRx4kmj77/I/fHwmUyPcAACNAA5Qw1Nl6DowHljvcfVXlRj2z
	 jH1EOfv4QRqwYq6OcQsw2B6kjyka36JGojSFVJZot0zL9K/hKE/GpL54KyjeUaVjqxEdX
	 3aJGCZ6ZceVkddzujsQT7W37WA4rZXuh6h7bbesuxX55kZker5648bmux9rcOnjVKR4bW
	 FvpZDA6y39enWMpHVnbs9B5A/r0prgst074pwnLy1jnnesk/4CAK8OPlUWaeimv8maFP3
	 3kfNkQewuwWlIv+fjnKlcRV5Jsn6AifgZ4Ld/p3lqwy+wwoNczTigWvnM2mCAOczbWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stu.shzu.edu.cn;
	spf=none smtp.mailfrom=stu.shzu.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1909D606D804;
	Tue,  3 Nov 2026 17:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1909D606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.shzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.shzu.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=TUFX3tU1E3wKbYbjTX9p4dL95Bk3btuFKM
	+PqEwbEl0=; b=EY2gmZ0C2N+xHTQlPjr178lf3pEi2anaGGZOjBvaCl1NuQhpQe
	04Og6QTygIXsgbIJjWsoyMaIiTU5ftWdVh++YEhIjSM5mlHol1cJGm3I+kU7zM6M
	C9sAKfr4MuhT6yrBLYHQryl+iSm9LmshmmzC+zaoYaWWcn7pTQzSY3Fzw=
Received: from kernel-build.. (unknown [124.119.50.14])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkD2+fxpF+pqV5MfAQ--.29090S4;
	Wed, 04 Nov 2026 01:18:40 +0800 (CST)
From: Wang Xiong <20221010117@stu.shzu.edu.cn>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: gspca: konica: clear the cached data URB on stream start
Date: Tue,  3 Nov 2026 17:18:32 +0000
Message-ID: <20261103171833.6136-3-20221010117@stu.shzu.edu.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103171833.6136-1-20221010117@stu.shzu.edu.cn>
References: <20261103171833.6136-1-20221010117@stu.shzu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkD2+fxpF+pqV5MfAQ--.29090S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1ktr13Ww1fAr15Kr1rJFb_yoW8ArWUpF
	WDWrWUAFWYq3Wv93WUJ3WvgF95WayfJFWUC3yYgws3Ar15GF9FgFyFya4FyF17CrW7Zw4S
	qrn8J3y5WwsFyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPYb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY
	1x0267AKxVW8JVW8Jr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2
	xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4
	vE14v_GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVSoXU
	UUUU=
X-CM-SenderInfo: qsqsjiyqrqiiux6v33wovk63oohg3hdfq/1tbiAgUGCWrp+0MWhQAAsg

sd_isoc_irq() keeps a completed data URB in last_data_urb until a
status URB arrives.  Stopping a stream kills and frees all transfer
URBs, but does not clear this cached pointer.

When streaming starts again, a status completion can therefore use
the old pointer before any new data completion has replaced it.
The start_frame comparison then reads a freed URB.  Archived KASAN
reports identify sd_start() as the allocator, destroy_urbs() as the
free path, and this comparison as the invalid access.

Clear last_data_urb at the beginning of sd_start(), before allocating
or submitting the new stream's URBs.  All completions from the
previous stream have been drained by destroy_urbs(), so the cached
pointer cannot be reintroduced by an old completion at this point.

Tool disclosure: OpenAI Codex assisted with static analysis, the code
change and this message.  It was asked to compare archived URB
allocation, release and callback stacks and prepare a minimal fix.

Signed-off-by: Wang Xiong <20221010117@stu.shzu.edu.cn>
---
 drivers/media/usb/gspca/konica.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/gspca/konica.c b/drivers/media/usb/gspca/konica.c
index 017266d73..f43a47c77 100644
--- a/drivers/media/usb/gspca/konica.c
+++ b/drivers/media/usb/gspca/konica.c
@@ -173,6 +173,9 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	struct usb_host_interface *alt;
 	struct usb_interface *intf;
 
+	/* The previous stream's URBs have been destroyed. */
+	sd->last_data_urb = NULL;
+
 	intf = usb_ifnum_to_if(sd->gspca_dev.dev, sd->gspca_dev.iface);
 	alt = usb_altnum_to_altsetting(intf, sd->gspca_dev.alt);
 	if (!alt) {
-- 
2.47.3

