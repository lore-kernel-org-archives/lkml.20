Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357833BA244;
	Fri, 16 Oct 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144147; cv=none; b=SdfyEVoXCT1cJap1cbXFkNlzXiq3bmwZ+hOOEibK+bcewx+hUc3vE7/5K+fZlzd8JnwjnfhY/1z3/BGXkGRwwLISyyRMTbgv+vIFMeegzB9Str7fawPjm4FHcCMddVuR2D4T0FfjcNM35E8xVFqU7f0HQNVgQf5CP1zTkjwL5OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144147; c=relaxed/simple;
	bh=8dcHHwy9OlvaOUB5unjLCa6WdicP5fGq5tN0rluGOTs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y5y/4AIPOu2Sdg5H31GFZeVaOnxYROayh+SUWglwK2TBeQtR2x7sRNLakBGxCjHE7WjtseD0i6FkwI8lFJ+jwwUI7n4X0WiYMSGFACQ2ZtRlz5RZ39+05tqCR+VJFq0zkmlSSSd7tzEfFZA/kuQeX9Tpa2qA9Jv24HL7q3R2e4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn; spf=pass smtp.mailfrom=stu.xidian.edu.cn; dkim=fail (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b=RdM8DCmX reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b="RdM8DCmX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=uR8wNjdN3n
	oPpSthKKavTByMn9RY+hXHGyeagzL5rII=; b=RdM8DCmXpxWQ1Sv3qH+AbV7utW
	Wyh0fsPEq9bFXElwwYzuPBXhBFr7MHULpdXjAnMzTJj/pGqyD9MYbJIMKLGbcf2p
	Up0G7vnpX/8RZWoXE6PX0dKmrx/6BFLG3JQxC7OoZyfRc95RVOpOd6qPHwZct8K6
	XtHAEBGdlONOM7cRs=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.90])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkD2HAMB89FqYiGqAA--.46213S2;
	Fri, 16 Oct 2026 17:48:50 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>,
	YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Subject: [PATCH] usb: usbtest: reject transfer lengths the allocator cannot serve
Date: Fri, 16 Oct 2026 17:48:48 +0800
Message-Id: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkD2HAMB89FqYiGqAA--.46213S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4xKryfCryDtr43JFW7XFb_yoW5Gr1kpF
	W7Xryj9398Xr47ur4DJw47Ka4ruws3JFW5GFyIq345ZrsxAayxCa4kKrn0gr97Aw40qF10
	yF90yay5C3yDC37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1v38DUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUID2rQ7FGTdAABsi

usbtest sizes every buffer it allocates from the user supplied
struct usbtest_param::length, but it never bounds that value.  The
scatterlist tests, the queued bulk tests and the unlink tests pass the
length straight to kzalloc() and usb_alloc_coherent(), so a large value
reaches the page allocator as an allocation order above MAX_PAGE_ORDER:

    WARNING: mm/page_alloc.c:5340 at alloc_order_allowed mm/page_alloc.c:5340 [inline]
    WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof+0x4ae/0x1fd0 mm/page_alloc.c:5397
    ...
     alloc_sglist+0x331/0x500
     usbtest_do_ioctl+0x2686/0x5880
     usbtest_ioctl+0x440/0x720

A run of "TEST 7:  write/-7 -2147483648 sglists 3 entries
0..-2147483645 bytes" asks kzalloc() for more than 2 GiB.  The queued
bulk tests reach the same warning through usb_alloc_coherent() and
dma_direct_alloc().  The allocation fails after the warning and the
driver then returns -ENOMEM, but the warning itself is driven by
unvalidated user input.

Reject such lengths where the other parameter limits are already
enforced.  KMALLOC_MAX_SIZE, that is PAGE_SIZE << MAX_PAGE_ORDER, is
the largest contiguous allocation the page allocator is willing to
serve, and the unaligned tests add at most one byte on top of the
requested length.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
 drivers/usb/misc/usbtest.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 8759df49be28..8f2a4752b9c8 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -2192,6 +2192,15 @@ usbtest_do_ioctl(struct usb_interface *intf, struct usbtest_param_32 *param)
 		return -EINVAL;
 	if (param->sglen > MAX_SGLEN)
 		return -EINVAL;
+	/*
+	 * Every test case sizes its transfer buffers from param->length,
+	 * using one contiguous allocation per URB or scatterlist entry.
+	 * The page allocator cannot serve a length of KMALLOC_MAX_SIZE
+	 * or more: the allocation order would exceed MAX_PAGE_ORDER and
+	 * the allocator would warn before failing the allocation.
+	 */
+	if (param->length >= KMALLOC_MAX_SIZE)
+		return -EINVAL;
 	/*
 	 * Just a bunch of test cases that every HCD is expected to handle.
 	 *
-- 
2.34.1

