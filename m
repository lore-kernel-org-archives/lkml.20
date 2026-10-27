Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067456;
	b=NUAMA1JtcovCqgH/cqiTUBAxf0fC0IhFjy/yJDI51S7erMoS4hXrfQyWjJ0+2kkXdKCU
	 1Ucf2HfGEp8akr2r6zPlVwQx7io7IVyRQmIZ8FwdyGz9KgGHzf41GuN1X+yqwMwZxh7UA
	 B/OcxhO2oy4z5fOhNDxUkXCgqssFEAE6C1oCOvYWVHxGou14SWnLe2hynRYU0DeMnZyBY
	 /fOiLx5C33avrIbPVTsYFv0lLOdCV3cI3fl0QuC245mxbCph+u4Jy9tK3TYrV2ZaGeR+C
	 mBODu71pVPGU1lIMzZsME55VIkk2HgSiwKZ47nW2d08tkEY+hzQW+P14xixnpvtOBSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067456;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Z+78x8Sds6faPgLtpH+RiZhgHTBSFQl1dM4NHGQ6pLM=;
	b=y+6RVjYJqtbjGfl6046QwezatNsjaqgFWaR9EyVBXZycoDj+4p9c9rCRU1Nmm/HFn8/t
	 3Jbr7v1FhkzBx2Z6rBktTJ+ShRopGpQ+Iw4AOZIlY9WeziCcwsg86UoiIWRFKGX28shH2
	 L+uU2kMVnGleFmGykz8O/yLXNpyXAwsq8DDA3O8WVAArEFP0n9b64pU8TSjafyTb6CLX/
	 qdmNPkRikZganOuJAQmy2nQmHfPWW3+LhhLUGSxhoaci+Tj7VVxLqnRDnXH/ze0fy0JPQ
	 PSjlu15PArza0gqkJmVVFujq7M5hcBedB13KxAmAGWLvcs/jb+ir+G68xfPmv6yMgEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F1E606A31A;
	Tue, 27 Oct 2026 02:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=Z+78x8Sds6faPgLtpH+RiZhgHTBSFQl1dM
	4NHGQ6pLM=; b=ysu0jrb/RyfRQvljwiEvv2or7chdYs4WZuSMzOhsMDYDYijQmt
	UOCaztIVlIWoXNTb5uDyL64LMr3wfIDXPCR22En9tcyWoghDJv1dbexV8mXDBTXC
	n5nL+Fte4XIq8r33nECGiqiKxqAL2BigLhsjJJE7IRhaFs/8r8jrHr8rg=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.115])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkBmjQOvCeBqqsjsAA--.46970S2;
	Tue, 27 Oct 2026 10:17:20 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v2] media: rc: fix use-after-free of rc_map.name on register error path
Date: Tue, 27 Oct 2026 10:17:18 +0800
Message-Id: <20261027021718.14264-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027014144.9144-1-25031212351@stu.xidian.edu.cn>
References: <20261027014144.9144-1-25031212351@stu.xidian.edu.cn>
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
X-CM-TRANSID:BrQMCkBmjQOvCeBqqsjsAA--.46970S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFy8Cr15AF1xZw4Duw1UGFg_yoW8trWfpa
	yrKFyrArWqqrWkursrZw4Iva4vvw4xJFs5uryrGayDuw45Cry7tFWSqFy5ua4q9rykC3Zr
	tFnxX3y8u3yUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l
	c7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU8dwI3UUUUU==
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUTD2rfb0FLigAAsB

Hi Sean,

The v2 below does not apply to linux-next/next-20261026 (f1ac44c32cba):
rc-main.c has been reworked by your series in the media tree, in
particular ec7cb49871e5 ("Fix race condition during rc_register_device()")
and 37efd09ba2c6 ("Ensure registered is cleared in error path").

37efd09ba2c6 already covers the lirc side of the problem, so the
out_lirc part of my patch is redundant.  However, the original uevent
use-after-free still looks possible in the current code:

	out_rx:
		rc_free_rx_device(dev);
	out_lirc:
		scoped_guard(mutex, &dev->lock)
			dev->registered = false;

rc_free_rx_device() calls ir_free_table(), which sets rc_map.name to
NULL under rc_map->lock and then kfree()s it.  rc_dev_uevent() takes
dev->lock, checks dev->registered (still true at this point) and reads
rc_map.name at rc-main.c:1660 without taking rc_map->lock.  A reader can
therefore take the pointer before it is cleared and dereference it after
the kfree(), which is the slab-use-after-free originally reported:

  BUG: KASAN: slab-use-after-free in string+0x483/0x4c0
  lib/vsprintf.c:737
  Read of size 1 at addr ffff888007ca9d80
   rc_dev_uevent+0xd7/0x1d0 drivers/media/rc/rc-main.c:1628
   dev_uevent+0x28d/0x570 drivers/base/core.c:2709
   uevent_show+0x1af/0x380 drivers/base/core.c:2756

This path is taken when ir_raw_event_register() fails, i.e. when
kthread_run() fails, which is the reported case.

Would it work to clear registered before freeing the keymap in out_rx?
Something like:

 out_rx:
+	scoped_guard(mutex, &dev->lock)
+		dev->registered = false;
+
 	rc_free_rx_device(dev);
 out_lirc:
 	scoped_guard(mutex, &dev->lock)
 		dev->registered = false;

The second clear is then redundant on the out_rx path, but it is still
needed for the failures that jump straight to out_lirc (lirc_register()
and rc_setup_rx_device()).  A separate label could avoid the duplicate
if you prefer.

I am happy to send a rebased patch against linux-next if that is easier
for you; otherwise feel free to fold this into your series.  If you do,
a Reported-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn> for the
analysis would be appreciated.

Thanks,
YuanZhe

