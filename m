Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365556;
	b=zYvkP8SRlGYsxwBgWiNpg8lSjPBoY1WvL5PLOmN/+paFPID4f0JIaX+zZkMLl0lGfrzH
	 863ATNRYFxoUpt2Qkn+SuiQg18YBk7hqHQfdzIvaDM1ynEYPhflJIotJRCVc/DR5kvhsi
	 JTnAZZyaYCwXstPc8/1SpbXhxvzosAjUmRICDJcNRQue4FnDjmJzg0RbLTBVZTguVAtdM
	 kF6PoedxRyZsz4x5m/bLcWDrdvFthi6a6BohKaqSjDXT1/is8+vZZkCZJGU64qNpudspZ
	 ulLd3qg/rasBCwT7dUP6+M9mh6r09+w5CqYMJ3P7zzpv9xzh3TwxA35iHkXyig2a3pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365556;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=UTx52JTaNLihAvuaFwu6EdyQhcOp4tcp7+Zh6xi+HS8=;
	b=LF9lsCtL4ZOGgx/HbXsiT9VqAmdmcz5uGMrHWo/em1Fi+GNEILEYZBmSiHzanTRtKIzD
	 SDsRg9FnQ99OP4YY9+T426l+9SJgyWAZ3cEMxJUCws0HmCiZU1paYakp3aQata96IYuDF
	 ewezKZtxH/ZyPpumrliw3frXMnUkc9CJ3TA7jctHPQLcK0Z1cUCF+cQUDC1s6tioVQ4Tx
	 I8XpWlSfZZnm4CKESy+YicofUcrxseZiAMpgJ1tvS2DLvK5+kLegRB5vmh3/YzFdG6d5H
	 J0AhaLK9/ig7O/WW4LbH1hzMUKSyhxgRrQZA5yk9huK1eqwV2tmZUgT1ap/JBT6/ypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA30606A31C;
	Fri, 30 Oct 2026 13:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=UTx52JTaNLihAvuaFwu6EdyQhcOp4tcp7+
	Zh6xi+HS8=; b=cymqIvohehS50JDj0kO4gmvdgDC2BBy3b7P08RDo1bA99S80Eb
	qf+LOFFO5dogWG1Oc+C19USOBfa6Bva+cGMO+2kmmIYig6MilgHqhWOB4M9z165B
	Nu5ktt83Q2C35OXj4xMlhxUq/AOl3XeEGjM9k0W+0u5ecevggBtH7cF+c=
Received: from user-virtual-machine.localdomain (unknown [223.160.172.89])
	by hzbj-edu-front-2.icoremail.net (Coremail) with UTF8SMTPA id BLQMCkDmKwEgluRq1XcKAQ--.39307S2;
	Fri, 30 Oct 2026 21:05:37 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v2] media: rc: fix use-after-free of rc_map.name on register error path
Date: Fri, 30 Oct 2026 21:05:35 +0800
Message-Id: <20261030130535.2921-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <auRsPM9YO4aXd8qL@extorris.mess.org>
References: <20261027014144.9144-1-25031212351@stu.xidian.edu.cn> <20261027021718.14264-1-25031212351@stu.xidian.edu.cn> <20261030.pref-04.ec83d43911ee476d@stu.xidian.edu.cn> <auRsPM9YO4aXd8qL@extorris.mess.org>
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
X-CM-TRANSID:BLQMCkDmKwEgluRq1XcKAQ--.39307S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWDXrWrtFykWr1UXrW7XFb_yoW5GF1rpa
	yrKas8K3yqkr4jqwsIqF4UZa429w4fAw4rAry5Gryjk3y5uryftFZ5AFyUWa4UAr97CFyU
	trZ8tw48Z398CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr
	4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxG
	rwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUyDPiUUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUCD2rjY8GjNQADs0

Hi Sean,

You are right, and thanks - that is a good point. Once rc_dev_uevent()
returns -ENODEV, dev_uevent() fails and kobject_uevent_env() bails out,
so the KOBJ_REMOVE event is never sent at all. udev has seen the
KOBJ_ADD, so suppressing the remove leaves it with a stale device. That
is the wrong direction.

The strings themselves are not the problem at the point the remove
uevent is generated: rc_map.name, driver_name and device_name are all
still valid until the driver frees the rc_dev after rc_register_device()
returns, which is well after device_del(). What we need is that nothing
is freed before the uevent is sent, not that the uevent is suppressed.

So the error path should keep the device registered until device_del()
has sent the remove uevent: at out_rx only unregister the input device
(it is a child of dev->dev), keep the keymap for the uevent, and move
both the clearing of registered and the freeing of the keymap after
device_del(). device_del() drains the sysfs readers, so rc_dev_uevent()
cannot run afterwards and rc_map.name can be freed at that point.

Something like this against next-20261026:

 out_rx:
-	rc_free_rx_device(dev);
+	/* Keep the keymap until the remove uevent has been sent. */
+	if (dev->input_dev) {
+		input_unregister_device(dev->input_dev);
+		dev->input_dev = NULL;
+	}
 out_lirc:
-	scoped_guard(mutex, &dev->lock)
-		dev->registered = false;
-
 	lirc_unregister(dev);
 	device_del(&dev->dev);
-	/* registered already cleared above */
+
+	/*
+	 * The remove uevent has been sent and the sysfs readers have
+	 * been drained; lirc file descriptors that are still open must
+	 * not reach the driver any more.
+	 */
+	scoped_guard(mutex, &dev->lock)
+		dev->registered = false;
 	goto out_free_table;

out_free_table already frees the keymap after device_del(), so the
out_rx path gets the deferred free without a new label. rc_dev_uevent()
keeps its registered check: it is still what keeps open lirc descriptors
away from the driver, and it now runs only after the uevent has been
delivered.

The same ordering exists in rc_unregister_device() since 4f0835d6677d:
it clears registered and frees the input device and the keymap before
device_del(), so the remove uevent is suppressed there as well. I am
happy to send the error path patch only, or to extend it to
rc_unregister_device() as well - let me know which you prefer, and I
will rebase it on linux-next.

If you fold this into your series, a Reported-by: YuanZhe Liu
<25031212351@stu.xidian.edu.cn> for the analysis would be appreciated.

Thanks,
YuanZhe

