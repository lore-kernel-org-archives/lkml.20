Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C97360EDE;
	Fri, 16 Oct 2026 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165646; cv=none; b=Y56D7titM0ufTg2X5aXd+WAk0x83O7wWctnT1Bu4sGRYXBsu419ITAJTifluCl4x4+gUmraj+thHrss5sQ5YlPy6zb6ZNKqw2+6M2Ti5nTxid1uyO0rS4M0LcaR6rmgcOt+b5okHwcxL90elvkfMTbiajojV+EllLMgmdqRUGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165646; c=relaxed/simple;
	bh=NHg/VEyqp8bK3FF/HJQ3/6HZwj1a0ZBUrcCg4tpqmf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E7vhk4wjk/v2VFV/HWEx7rFEP80Cqyl0BEHNF/+sfjxLT3/nR9SQDpLpzz0Ym0jEuxbq1WM86fCFQyYpSRYxkWsYWxfU8H/CkauTJLgjZQrDiq4Nxl44NkCYB5m+rT0sS/pu30kabtJFC6GtQYtYdMIPNgGm+Ui/tUbRvAcHU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn; spf=pass smtp.mailfrom=stu.xidian.edu.cn; dkim=fail (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b=6bkwdvij reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b="6bkwdvij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=Kfvc3ZXLCqk4HERV0fqcTzTu7wxHeNM6ff
	eGSZzryY4=; b=6bkwdvijyL49c0oxCMXvhTAwJZtdVfDcmWq7uLWeI7kkCZ0+6v
	/iA/gJdYlsvSSYFcsG60NEJI0Iuef/QRZWFSOL99yN+HZTCc1RJC4xWVT1GXJEab
	o/izReAZXicE4dipwhtkeTSacIqC0r9odBkyDzBUQvlf7gRk1lxYWg/Mg=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.96])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkCGifz8RtJqgsmrAA--.61943S2;
	Fri, 16 Oct 2026 23:47:09 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>,
	YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Subject: [PATCH v2] usb: usbtest: reject transfer lengths the allocator cannot serve
Date: Fri, 16 Oct 2026 23:47:07 +0800
Message-Id: <20261016154707.13098-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>
References: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkCGifz8RtJqgsmrAA--.61943S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ary5Cw18tFWDWw1fGFW8tFb_yoW5JrykpF
	W3XryY9398Xrsrur4DJw42kFyrCwsxJFWUGFyIvw15Zr43AayxCas5Krn0grnrA3y0vF10
	yFn0kay5Cw4UC37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbsYFJUUUUU==
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUID2rSQD0EbAAAst

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
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

---
v2:
 - Shortened the comment above the length check, as suggested by Alan Stern.
 - Added the Acked-by from Alan Stern.
---
 drivers/usb/misc/usbtest.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 8759df49be28..6a3394800fd8 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -2192,6 +2192,9 @@ usbtest_do_ioctl(struct usb_interface *intf, struct usbtest_param_32 *param)
 		return -EINVAL;
 	if (param->sglen > MAX_SGLEN)
 		return -EINVAL;
+	/* Don't allow unreasonably large transfer-buffer allocations */
+	if (param->length >= KMALLOC_MAX_SIZE)
+		return -EINVAL;
 	/*
 	 * Just a bunch of test cases that every HCD is expected to handle.
 	 *
-- 
2.34.1

