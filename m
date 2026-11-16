Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831617;
	b=FQLUFuHHXWQ0wFs8x/59RdzPFP0S1PkLSVEafRBJbTLH9upfG4Bu2m4lxY5lsWJeUDaq
	 tvQGjo/kbJ1YBTFZxDpvR3aozKqWd/64dgKsjODfzNhBdQk2a42DjDMSimCkuRso3+R0x
	 tIqVvOyhSZrUCraESXqI4CDleOdy4hOsVq5fmq6+HLdspkWKMCcqkisctVA5LRSVNxO/R
	 U9zC9ol4gc2nGPpPSDExAmbcIC74VWw3LDBGAV34WUdYUwlBBkSGI8KKBLL44QjHNdeYy
	 VJKouxzIDzWBemu0/O4YO7AIYk0f8CQ9qH0Zl6Stb3fSnFNu6gANEvrQVJCTAZ/KcJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9l8aY4duwod5oh83bsEItxoT9PT8GG4ui0y9GtWOeCM=;
	b=hDL00eBDNCjrx3celHWqKOdL7/xdZTdd2IAcM+iN67UqefriFTVZPwpPZtE8eLklHj7C
	 rfYB9lSdvGmtQ2Y9ZJa7NW0aIuMn26p6mNy7I+npZYO7ZpHy8BF9pD/bl5XhXih5LkH8W
	 EwKX8WaoObhqH199rkuFfufjztknOhW4zhnTULakxrMrzu7TT3Q57WouAnsni5/cwFSK5
	 oSSirikx8mwuZyA4O81KsuBXu8ElHv33J7hIyZN/ke4OSd3/FToUUUTW5lKYE27TJ/o5t
	 uFFUUXq/KWA8t1Lz5JjLQOK61y9LV+95/qMd5Qza2wcQmtGob3xWsPHIHib8doAdNNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lneGMFV+;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29890606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29890606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lneGMFV+
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1505820a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831615; x=1795436415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9l8aY4duwod5oh83bsEItxoT9PT8GG4ui0y9GtWOeCM=;
        b=lneGMFV+wKAhDHuklL7r7rmuDU1G+ohCB4sjR4HTq97HsrFQKSL142I0WnDGcBQ5Jz
         94EuFbYp2+s4LFmZACzhLbPYf+qukzpoCka8VjJgJt8m8HC2jnpWNEpO/X0GkgA6nSzM
         MyFWQKlhyLyJqaOlVooBax+FFG/fDHiwrfSESdWtwE6LbEZGRwHcBfep6TSro8LNuq/S
         hhK1t8VTuafpoaG/SDyUysnkeqF3hMhKckXdh3PczdZwskyhB4IYd7gyiMJV4UL481lC
         rPoOfeIRm9aj5jqgfambREQeMskvrfeHLlYf4g5yEhLuZZkJz1cuX27JSji/MJwyHQ/+
         a3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831615; x=1795436415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l8aY4duwod5oh83bsEItxoT9PT8GG4ui0y9GtWOeCM=;
        b=gmyCdNqkwjjowTf6sjGgCa7AAUvkD6RTKN4RRY4lUb3Rk6cSt4P67+Qnvn1HOFauDx
         eORzjeV1yh4RDgsO6a+czo3IbAs4V/fNi+ENbsaVKsR4INXgCZ7gxqTDsNgBy566OdM8
         +45W2Gx42e3mRRn9Gmt4x3w5pAEBkvK6H47mPkSyHf/zgkFn7Gam2u6ij3ca+te0IqZK
         y8pIUKFZMmXfQwxrQcnwqczFCzEVr8i29EU90oOpD4sYxi61aBgDWSaoK9KecYO4nI+P
         YeaOuEhbGJAvWLhkbnKCaNrDTRqOfoEu1XA6oa1E3/QlvvDLrvJa4KM8FNY5KVVbPk/Z
         q1dg==
X-Forwarded-Encrypted: i=1; AL+hErGB2no7AY4EXG5NeS/jm7p5MFA8EO9rXXGQ1gGy3WBxEVO9m28XZXsKEGhl1l1NVSpFU1sghZlh547aHqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lwzv0fDTZL9Jy+StEnvnDpWM1yWmPkuTgb/q8C80/oYtsaQ/l
	AroApKFtTXx6+L3YznPzDUq985Mr7rxv4+k6gZ1tyjs9DAmGcK0uWLwv
X-Gm-Gg: AZFdTZeNSgomWmr+tBF7LqWN28rZNXnVP/cgX3G5OMZ5iGHimjU2rqGsCNVu32NzOrb
	5IWaU2R7d0svOY1Brk7OL35gOmIBx1eKnP0G2zfYKqy1puwrd+lxBPJzOlQyOmAQXoAIzoBaFIK
	/PqEffAVkFpeJ07+O6Fbbhyw5RDk+LTL16qsLbMGxMgJLeMkdnvTGzg6uUf1UEpsTQXwQHh3wYz
	wsskodiN6BWd+27EoyPVaHgEAAca0FL+POS9L8tf6omuq4QceCaletUa0mimx+J7j92HoqKasOj
	BNL5/fokAHiyIVORzuC/q7Mf0rux8xvPPwg/4LNMxAe9aOCsiXFpPP5UODCXSfVvw9BdOWjDiRr
	bnBWR5Sf1ERnJr5ZtL6d5083Rxjq7IQ7TbFPZvkFuCz7xOxmGIxza0FJFPwWbL45mg+mIvgxiws
	Iz/cFUJ/8UxPs9Ma7n/XZWeH53VXIKxzb5UKtkqfVKQ2zQe6DyHSKB4Y207w6VsgJqYu8xZuhNp
	IZeuMn3aMt8Eu4vfrhVf2epMFy5OL7ioV4omgyHL/zafbEyeZmZTVW3j/AK1nbbJ+LU7Fq5ztqz
	zfJIh0pL9AehAlpEUL5cPJUfnXgQ7Lu7N4tro5r1JW53aNYP
X-Received: by 2002:a17:90b:1d03:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b1b0b4cdf7mr9314366a91.42.1794831615263;
        Mon, 16 Nov 2026 04:20:15 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm21783990a91.16.2026.11.16.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:20:14 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: cancel work on teardown
Date: Mon, 16 Nov 2026 21:20:01 +0900
Message-ID: <20261116122001.3096223-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

fc->work is scheduled from the extcon notifier callback
yt2_1380_fc_extcon_evt() (and once from probe), but it is never cancelled.
The containing struct yt2_1380_fc and the extcon notifier are both
device-managed on the serdev device, and the serdev driver has no
->remove callback, so teardown happens entirely via devres unwinding
when yt2_1380_fc_pdev_remove() calls serdev_device_remove().

devm_extcon_register_notifier_all() unregistering on teardown only stops
future notifications; it does not drain a work item that the notifier has
already queued. A fast-charger extcon event that races device unbind can
therefore queue fc->work just before teardown; the work then runs after
devres has torn the device down. yt2_1380_fc_worker() dereferences not
only fc itself but also fc->pinctrl (pinctrl_select_state()) and the
serdev (serdev_device_write_buf()), so it must be drained before those
device-managed resources are released, not merely before fc is freed.

Initialize the work with devm_work_autocancel(), placed after the serdev
is opened and pinctrl is acquired but before
devm_extcon_register_notifier_all(). Because devres runs cleanup in
reverse order, teardown then unregisters the notifier first (so it can no
longer queue the work), next cancels the work while fc->pinctrl and the
serdev are still valid, and only then closes the serdev, releases pinctrl
and frees fc. This closes both the re-arm window and the use-after-free
of fc and of its sub-resources in the worker.

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires the Lenovo Yoga Tablet 2 1380 charger).

Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v3:
 - Use devm_work_autocancel() instead of a hand-rolled
   devm_add_action_or_reset(cancel_work_sync) (suggested by Ilpo Jarvinen).
   It is placed at the same point in probe (after devm_serdev_device_open()/
   devm_pinctrl_get(), before devm_extcon_register_notifier_all()) so the
   reverse-order devres teardown still drains the work after the notifier is
   unregistered but while fc->pinctrl and the serdev are still live. Moving
   INIT_WORK() down into devm_work_autocancel() is safe: fc->work is only
   scheduled from the extcon notifier and from the probe-tail schedule_work(),
   both after this point.
 - Add Cc: stable (this is a use-after-free fix).
v2:
 - Move the work-cancel registration from right after INIT_WORK to after
   devm_serdev_device_open()/devm_pinctrl_get() and before the extcon
   notifier, so devres (LIFO) drains the work while fc->pinctrl / serdev are
   still valid rather than after they are released.
 .../x86/lenovo/yoga-tab2-pro-1380-fastcharger.c    | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 8551ab4d2c7d..c2fe919a3ce9 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/extcon.h>
@@ -160,7 +161,6 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 
 	fc->dev = dev;
 	fc->nb.notifier_call = yt2_1380_fc_extcon_evt;
-	INIT_WORK(&fc->work, yt2_1380_fc_worker);
 
 	/*
 	 * Do this first since it may return -EPROBE_DEFER.
@@ -209,6 +209,18 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 	serdev_device_set_baudrate(serdev, 600);
 	serdev_device_set_flow_control(serdev, false);
 
+	/*
+	 * Initialize fc->work with automatic cancellation on teardown.  This is
+	 * registered after the serdev is opened and pinctrl is acquired, but
+	 * before the extcon notifier: devres unwinds in reverse, so teardown
+	 * unregisters the notifier first (no new work can be queued), then
+	 * cancels the work while fc->pinctrl and the serdev are still valid, and
+	 * only then closes the serdev and releases pinctrl.
+	 */
+	ret = devm_work_autocancel(dev, &fc->work, yt2_1380_fc_worker);
+	if (ret)
+		return ret;
+
 	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
 	if (ret)
 		return dev_err_probe(dev, ret, "registering extcon notifier\n");
-- 
2.43.0

