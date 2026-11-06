Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988280;
	b=3qEEmW6lMFpijczJnokksglvQvbeZPeWsTJh9PNZSiHoYfLVFpemAkigo6TRtJWOyWLX
	 YIuaPy+LzqRCkXqP259dvEczTcwkRHlnV91sREohRWOdq9Jhr63TEbatRWsT1M5dTp8bp
	 w/RZJJJDiawks8LWRWLAY7zyZBgdRQ++tofv7JepPjQX/VUH76adbdBFvuwn65pgyqznF
	 ChX/oNggaxgXY7gG0Dq48z74ofoX49X0w2n8BtfXTHRJh+MjEa9ZnOOsbrJ33urgBZIeS
	 Y0S1sNRHUJZTD4S7PWNdEUBindIRby/iFJMWuFLkVnawy6450nzwXqVAUaR7SM7yGLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ol4HWN1JMq7gbwHCjCL17fLj4wvViav0TAizd9NAY/o=;
	b=O6XDgotcbYUULo7tKFThpaqTB3TzJ6k5UMsJ8w9h9RS37v1ETbhnir9QjcxM8kqcNzQd
	 dTsomuZ72srZzK7JiqftByu7SU5iLuRUp42j9ls1QDHS3lIm5fN56TE12rvdkXP+pBIgt
	 /Idba3Om0lRr3ifNSzjFtWemEGj/Fa4fpBWrqseRVOSese8JsAgobKQAPtwj75G17JkUI
	 MtJclhfTLdCV2p+T2Fkcf+xnFBSK9Ho7xQIM1NJ3+Zq5ukT6qqDKlonhzppKO9j+Kv4Z0
	 NNiGyRjnGVyXyNx6kgijfD7NrsOl7vup1nCAdDM9uRgiT1rLHDfvkmzWbuxV1BIZVGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="goFTCv/D";
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9014B606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9014B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goFTCv/D
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f2b8cf037so81553485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988278; x=1794593078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ol4HWN1JMq7gbwHCjCL17fLj4wvViav0TAizd9NAY/o=;
        b=goFTCv/Di5F9M3h4vRpM1KegaKPyd4PS+ip4ABx34kYWVW1PSZf1uHnCkrx/lS9l5o
         DXbDFMxYt0avQ+b3NgdcBy6R+Du3wSfutCe7CnS8lroTC5qb1uQRXko4A+1CxYG8dFlv
         JKlpmu1Nlf/I8dsE/daYFLhJAyIoeKF3LCjLPBqjnwLAyXvIgz+szPFBiNP7/lG5fQdF
         572LUrinPBDRBrW4MLhASm1WdabFLdao4BRLNhBQZdMZxa7ZK67m2/RTZkFyB3DJMwBK
         9bzmexc0bz1R4JTV32arsKjWimswFC98IYnqMBsyf1hw8rINPKw0BWT13MxUh84qCsFR
         JcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988278; x=1794593078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ol4HWN1JMq7gbwHCjCL17fLj4wvViav0TAizd9NAY/o=;
        b=Bo3GaqRviTz8u29A07n2fBj9W+D/r35fsqokMOEIQ+dQMhxLamykbvi3LJTW4fBRpU
         YRsDxnT8CXcJ6u96aFZGav38RlNuUCdwH5I4ihsAUybln+nNEkhK+1fQ8nv4cJF9OG85
         Gdd8ig/d4bbT9629iUctLh8l9B6ETlH/uNJkf57utEjBPzFWgTEcLDSCrOK0jenjCSwk
         modBFkoCbpnRcIvGi/aCjPhgoXQ5L1CnIr17O8jN4OD9Mk9iH4yY4MGWwN6BYvFBrLkG
         xm9h9tbvhwZNoPomhxtZcHrsqN9WJy/fzuCHnkkcPwIhBZLp9+x6N6oO9pbhkotm5VV5
         uSEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH+MNBQFaVecyqzZzjfC4Z1k9tuSE0GpAX0vdzqtKWh4lL624sVXKecIoK3BaQmhydtKozoqzsiuZE8Jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ppjs2Y+zfl4ra+zt8kGcR4GnXBYReMJzL1ML/123nnJBRRzjK
	oZq1Dm65RZZeiguuTEydnp888fOcVAE2pSdj4XCvyuwI4e4WjpNxOtbH
X-Gm-Gg: AYBFou3qtDdXrzE5jIxRuNh2Q+VJktJQ48j+sxP3fjMgsoetrAEfs9SOVjNfkYSExtP
	hhXjksFfCWS3t8KfULo3nUBeCG4FdjKukFKeiT4s5DoZZjzPbOhhFb4PhRQ3Lrq2xpd28O6kNXG
	ewXtPAK3+PbXEKlXrVZ6buZmXVjQlx+L7KhM2Pt4R1q4klphZhbrIlFIFFnKtcAJYTUvXYd8eDu
	1JA4AjSUD8dTbEBSJZZo+qX5Y2N8LOSFWW6FuRUkTYaFrbVKNhMItbn/aBqMu3vrrX4pcd53/oX
	L6yCPE/GTrqb8kOIav4xrOCygk7x2vspJawwEzOmyFTc15Zbi+1UMcv7ANsaaly22bFRAYG7kdV
	T0RrqtAt8aBl9+WYVkDDKoXxc/Il2yiEu8v0fdjQWsP0prZuYgI6RluQeur/29Ljp5oia+A4mPj
	Jjn8MlQ6ajfcfXyQCrv1F2yu96Exi90e8Oe953ett0OoFb0ojvHSDFj1f/uitOEv4MmR6gomE8w
	JSXqPADB3y01KeEmBVfXhOlt0iRQwKpI2ojxsYjLmjB8AqOzXMwdRpWAIz5EXfTQWkEQHl3C8S1
	HXM5A0rUoV+44FK3L1M=
X-Received: by 2002:a05:620a:1b84:b0:93f:1af1:7952 with SMTP id af79cd13be357-945f32d0201mr435212585a.4.1793988278234;
        Fri, 06 Nov 2026 10:04:38 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f599bcccsm195308285a.13.2026.11.06.10.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:04:37 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] iio: trigger: free hrtimer and loop triggers on configfs release
Date: Fri,  6 Nov 2026 13:04:35 -0500
Message-ID: <20261106180435.2638701-1-lcy8047@gmail.com>
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

Removing an hrtimer or loop trigger through configfs causes a
use-after-free:

  BUG: KASAN: slab-use-after-free in config_item_put+0x1f/0x60
  Write of size 4 at addr ffff888001bf322c by task rmdir/71
  Call Trace:
   config_item_put+0x1f/0x60
   configfs_rmdir+0x7b7/0x9f0
   vfs_rmdir+0x291/0x7b0
   ...
  Allocated by task 70:
   iio_trig_hrtimer_probe+0x46/0x2b0
   iio_sw_trigger_create+0x11b/0x210
   trigger_make_group+0x2f/0x70
   configfs_mkdir+0x477/0xf00
   ...
  Freed by task 71:
   kfree+0x121/0x390
   iio_trig_hrtimer_remove+0x86/0xb0
   trigger_drop_group+0x78/0xd0
   configfs_rmdir+0x7b7/0x9f0
   ...

On rmdir, trigger_drop_group() calls iio_sw_trigger_destroy(), and the
->remove() callback of the trigger frees the structure that embeds the
config_item. The config_item_put() in trigger_drop_group() and the
final config_item_put() in configfs_rmdir() then access freed memory.

Free the structure from the ->release() callback of the
config_item_type instead, which configfs calls when the last reference
is dropped. Documentation/filesystems/configfs.rst requires this
callback for dynamically allocated items.

Fixes: ac5006a2a558 ("iio: trigger: Introduce IIO hrtimer based trigger")
Fixes: bc2e1126eccb ("iio:trigger: Experimental kthread tight loop trigger (thread only)")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with KASAN.

Reproduced in QEMU (x86_64, KASAN) by running mkdir and then rmdir on
an hrtimer trigger and a loop trigger in configfs. Without this patch,
KASAN reports the use-after-free on the first rmdir of each. With it,
1000 rounds of mkdir and rmdir on both trigger types give no KASAN
report.

 drivers/iio/trigger/iio-trig-hrtimer.c | 13 ++++++++++++-
 drivers/iio/trigger/iio-trig-loop.c    | 17 ++++++++++++-----
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/trigger/iio-trig-hrtimer.c b/drivers/iio/trigger/iio-trig-hrtimer.c
index 57550b581593..469bd83331b2 100644
--- a/drivers/iio/trigger/iio-trig-hrtimer.c
+++ b/drivers/iio/trigger/iio-trig-hrtimer.c
@@ -29,7 +29,19 @@ struct iio_hrtimer_info {
 	ktime_t period;
 };
 
+static void iio_hrtimer_release(struct config_item *item)
+{
+	struct iio_sw_trigger *swt = to_iio_sw_trigger(item);
+
+	kfree(container_of(swt, struct iio_hrtimer_info, swt));
+}
+
+static const struct configfs_item_operations iio_hrtimer_item_ops = {
+	.release = iio_hrtimer_release,
+};
+
 static const struct config_item_type iio_hrtimer_type = {
+	.ct_item_ops = &iio_hrtimer_item_ops,
 	.ct_owner = THIS_MODULE,
 };
 
@@ -176,7 +188,6 @@ static int iio_trig_hrtimer_remove(struct iio_sw_trigger *swt)
 	/* cancel the timer after unreg to make sure no one rearms it */
 	hrtimer_cancel(&trig_info->timer);
 	iio_trigger_free(swt->trigger);
-	kfree(trig_info);
 
 	return 0;
 }
diff --git a/drivers/iio/trigger/iio-trig-loop.c b/drivers/iio/trigger/iio-trig-loop.c
index 580a465035d1..e6bea96cc565 100644
--- a/drivers/iio/trigger/iio-trig-loop.c
+++ b/drivers/iio/trigger/iio-trig-loop.c
@@ -35,7 +35,19 @@ struct iio_loop_info {
 	struct task_struct *task;
 };
 
+static void iio_loop_release(struct config_item *item)
+{
+	struct iio_sw_trigger *swt = to_iio_sw_trigger(item);
+
+	kfree(container_of(swt, struct iio_loop_info, swt));
+}
+
+static const struct configfs_item_operations iio_loop_item_ops = {
+	.release = iio_loop_release,
+};
+
 static const struct config_item_type iio_loop_type = {
+	.ct_item_ops = &iio_loop_item_ops,
 	.ct_owner = THIS_MODULE,
 };
 
@@ -111,13 +123,8 @@ static struct iio_sw_trigger *iio_trig_loop_probe(const char *name)
 
 static int iio_trig_loop_remove(struct iio_sw_trigger *swt)
 {
-	struct iio_loop_info *trig_info;
-
-	trig_info = iio_trigger_get_drvdata(swt->trigger);
-
 	iio_trigger_unregister(swt->trigger);
 	iio_trigger_free(swt->trigger);
-	kfree(trig_info);
 
 	return 0;
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

