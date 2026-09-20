Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57614439F91
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923789; cv=none; b=k/6mo+weEgSM7/YltXqDsECTn8RMVJ7LGnokCvS5M5ZymetOMASZvV1aLCKHlrCsViL6ZD8tIAg4BPnNjlupT0ILALTwEjsWDAKUASzTrrfF11qYPgR7VgP4Rgw2com0Zy8Wh0Y28NobhdYBDGznNjhSPJCUlQ5ZvvQXZPj0W/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923789; c=relaxed/simple;
	bh=Wwevkf5DUfiguQcqz45cNIarZY+kKkzMsrAhcgJhLv0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iLEUVIVcHWrFaTUMnGIMJjn57cyCV8gTO0MWo+r66sSNrbB/UnzsG2lKR1xVBZu64+1Mv8gd45ILguUSUFiKdWFTmlvul5ZIP2YxCwPNFsh41UyCpotVr6OyHUvldJBy7SyevfdmOmp770L8EK/SU4hoYGqBCMwEn26rsd3nfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H5td2DEo; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H5td2DEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yx
	AHDbeF+LzRcf5LyqKowm1z/2QePZLCrB5jekOSyWQ=; b=H5td2DEoqQ1DOUQ2e2
	m0+UmzD4SMSWV/MC77hGby6Pr8Hlbu3ku4ZNQTdG06tci0WElMKyN1808+m3Y299
	MvsswfzB4NXZCckmYyUcDzis94lW9SElH0mI5kDlY3mA/1D7QCrXDRrv0aSqvauA
	WCzUXR9Te4ODK2inFFuuRbv9U=
Received: from pc.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD33WqhEbBqlH_YAQ--.24563S2;
	Mon, 21 Sep 2026 01:02:26 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] staging: vme_user: kill fake VIRQ tasklet on exit
Date: Mon, 21 Sep 2026 01:02:21 +0800
Message-Id: <20260920170223.2068463-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgD33WqhEbBqlH_YAQ--.24563S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1Uur43AFWUGw43ur1xXwb_yoW8Zw4Upr
	WFkw48CryrtrW0gr4UJw4UJFy0q39xJF4UWrZ7Kw4Svr4ruFyxCr4kKasrtF4vyF1kZa9F
	yFZ8WrWfua98GFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRDl1gUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQIzbWqwEaJrzwAA3c

fake_irq_generate() schedules int_tasklet, which is embedded in struct
fake_driver and receives fake_bridge as its data argument. fake_exit()
frees both objects without waiting for a pending tasklet to complete.

This was reproduced on v6.18.52 under QEMU with the following sequence:

  1. Load vme_fake and vme_user to create /dev/bus/vme/ctl.
  2. Issue VME_IRQ_GEN ioctls so fake_irq_generate() queues int_tasklet.
  3. Concurrently unload vme_fake before ksoftirqd runs the tasklet.
  4. fake_exit() frees the embedded tasklet and fake_bridge, after which
     tasklet_action_common() accesses the freed tasklet.

KASAN reported:

  BUG: KASAN: slab-use-after-free in tasklet_action_common+0xee/0x6f0
  Read of size 8 by task ksoftirqd/3/36

  Call Trace:
   <TASK>
   dump_stack_lvl+0x48/0x120
   print_report+0x191/0x580
   kasan_report+0x139/0x170
   tasklet_action_common+0xee/0x6f0
   handle_softirqs+0x159/0x4c0
   run_ksoftirqd+0x1c/0x30
   smpboot_thread_fn+0x385/0x700
   kthread+0x5c6/0x730
   ret_from_fork+0x15a/0x380
   ret_from_fork_asm+0x1a/0x30
   </TASK>

Unregister the bridge to remove the userspace entry point, then kill the
tasklet before tearing down the bridge resources. This ensures any pending
callback has completed before its storage and data argument are freed.

Fixes: 658bcdae9c67 ("vme: Adding Fake VME driver")
Assisted-by: Codex:gpt-5.6-terra
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/staging/vme_user/vme_fake.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index d0e7ba204c3e..451415a7ce1c 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1267,6 +1267,7 @@ static void __exit fake_exit(void)
 	bridge->lm_enabled = 0;
 
 	vme_unregister_bridge(fake_bridge);
+	tasklet_kill(&bridge->int_tasklet);
 
 	fake_crcsr_exit(fake_bridge);
 	/* resources are stored in link list */
-- 
2.34.1

