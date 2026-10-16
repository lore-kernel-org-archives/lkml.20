Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A9F190462;
	Fri, 16 Oct 2026 04:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124370; cv=none; b=MYzNjXhSOI4qDOtdHTEfh09eLs6fjO+a6/Z/d31MndsE4BPnW06I8NIzBoDQTwqJ3aMnUCrJ9E1p2Epi5zhoUPVa+2e3NkmIQ6cFEPMOYHHGE3FOexrwYsTwiBjImYG4sIZ76c+o5gWygrI5uE8k+Me7iBq+dcgub4VuNx+n3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124370; c=relaxed/simple;
	bh=ud4dQtHFpgXuyNo9S00LGgxOiB+OCMTNCxzGGug0ksY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cRqUSzRo26MNpkBjfGjnDI3tGhd2LO2p41k1U3EeFx+H9tqxXEn9yXozxTz10hv8MNQ+a9EGiAgihTCDdgKew0SrPL3WyLuVTLDM/ql/GA7+r32TNhJpx9WzPWARPFYZucpizSbk8n3r5Bc5obDJxq1of8DeJiBg9PttrP6Je18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn; spf=none smtp.mailfrom=stu.shzu.edu.cn; dkim=fail (0-bit key) header.d=stu.shzu.edu.cn header.i=@stu.shzu.edu.cn header.b=CwvyF1VZ reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.shzu.edu.cn header.i=@stu.shzu.edu.cn header.b="CwvyF1VZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.shzu.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=fZG6Nfwsxb
	de25zjdhgOFCiqR6M3rkKMFlBHs5eRj/s=; b=CwvyF1VZmaVzQfTokwtvWw7YNH
	XgEJXGtCPhXbgmK3QLEtmQ/nRmg4hl7T6kbO0CBhhz1P9HSL626BfMOaJnYyNe04
	wKlfn3URnx+O4EadoAKongnPj+EGKI2qHbEqzCMUQFyMimX8rOd5AE1NdnPu7xlx
	BeJAh443uuKAr1r/k=
Received: from localhost.localdomain (unknown [2409:8a50:9417:df90:2d38:f26c:c355:d0a2])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkDmDAPJpdFqYGyoAA--.46313S2;
	Fri, 16 Oct 2026 12:19:22 +0800 (CST)
From: Wang Xiong <20221010117@stu.shzu.edu.cn>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: [RFC PATCH] media: gspca: destroy input URB after failed stream start
Date: Fri, 16 Oct 2026 12:19:06 +0800
Message-ID: <20261016041906.1272-1-20221010117@stu.shzu.edu.cn>
X-Mailer: git-send-email 2.51.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkDmDAPJpdFqYGyoAA--.46313S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1UZw4kCFW5XrWkXF4fZrb_yoW5GFW3pF
	Z3Wa48J398JF1UCrWqv3ykW3Waka93AFW3JrW5W3y3Ars8Was2yrZYkr1jkF42krs5Aw4I
	vr4UJryUGwnF9FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r
	15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK6Ix8MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IUYgNVJUUUUU==
X-CM-SenderInfo: qsqsjiyqrqiiux6v33wovk63oohg3hdfq/1tbiAgUICWrQ7rxwqgABs1

When a video URB submission fails, gspca_init_transfer() calls
gspca_stream_off(). That helper can recreate an input URB after switching
to alternate setting zero. The retry or error exit then creates another
input URB and overwrites the sole int_urb pointer.

The earlier URB can remain active and resubmit itself from int_irq(),
although normal input teardown only cancels the stored URB. Its callback
can then access device state after that state has been released.

Destroy the input URB recreated by gspca_stream_off() before retrying or
taking the error exit. The final input creation then owns the only input
URB. The destroy helper synchronously waits for the callback before
freeing its resources. Normal stream shutdown keeps its input behavior.

Signed-off-by: Wang Xiong <20221010117@stu.shzu.edu.cn>
---

Notes (mail-human-signoff-20261016):
    Selected diagnostic lines from the archived report (excerpts):
      gspca_main: usb_submit_urb alt 1 err -2
      BUG: KASAN: slab-use-after-free in int_irq
      Read of size 8
    
    This RFC addresses failed-start input-URB ownership. It does not claim
    to repair every saved gspca fault. The precise sequence leading to the
    archived crash has not been reproduced.
    
    This candidate concerns input-URB ownership on failed start. The stop0
    path can drop usb_lock, so disconnect and power-management interactions
    still need review.
    
    No introducing commit is attributed by a Fixes tag in this RFC.
    
    Build-tested with GCC 14.2.0 and binutils 2.44 on x86_64, against
    base 03e2778d1f11de9260543f969e9e888a1c2bf830 (Linux 7.1.2).
    The baseline and candidate bzImage/modules builds passed. The
    candidate driver was enabled as a module in a minimal configuration.
    The original crash configuration and runtime repair were not tested.

 drivers/media/usb/gspca/gspca.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index f3d3f441c8510f391008bf2b54c1ee344ee85653..cd3dc70586a079e5240eab6413c0c384625852a5 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -866,6 +866,8 @@ static int gspca_init_transfer(struct gspca_dev *gspca_dev)
 		/* something when wrong
 		 * stop the webcam and free the transfer resources */
 		gspca_stream_off(gspca_dev);
+		/* The retry or exit path creates its own input URB. */
+		gspca_input_destroy_urb(gspca_dev);
 		if (ret != -ENOSPC) {
 			pr_err("usb_submit_urb alt %d err %d\n",
 			       gspca_dev->alt, ret);

base-commit: 03e2778d1f11de9260543f969e9e888a1c2bf830
-- 
2.47.3

