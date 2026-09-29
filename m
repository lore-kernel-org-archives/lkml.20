Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB86351AFFF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686191; cv=none; b=TyCc/zIMc3i35/rA75MTHRH0fidiDq/Jh5XT8oS8tFexcBJysfRQ7ZVoMY/aiibPKjzw3BUJA4nBwnI5Y5QPFcBf9vT5uCNE7rr2HfOsvH7frEZhPvejYQU2QIhYhFAlvFH8A2iX5OZayFDVmLouJ6ZaifZP0HxAY7AEyb81Auw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686191; c=relaxed/simple;
	bh=ddPjAgqOAexQn6SiMZ0/vDyDZI//jACyAkgt0yNWJQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IswlmGttA0f5nHhgVg4o3bWtMPckzg5O79+Q0WRHL7jYr3BRpFXlKTYG8CJGhZO7KuRcDywxDaEVOXSMBk4BrZq7NRHLXnroGM8daQlvjTdl3S1XO1jTPj+ibWevJWeUG6vea70lX9gIUZZzIusqQKHPpLmWsBPOU+DINiYKsD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ/Bqa+d; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ/Bqa+d"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d8709e0de8so1153072eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686189; x=1791290989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biINQt2l096Gb8cXBkH2MIBuz9s+X7G+Hedzf/dVVx0=;
        b=XQ/Bqa+dMsqbiSot+Qri0c5WYlPHDHB8o5zt/TGGZjFDxStpAeVGEIiosygDWUAiV3
         1JMzA3+6ty68L9GVsHcXxoQlA9/LcFrEm/rliq9cfOHMizgfuXaiQrQteOXRR2B7kGtX
         N45niRZvpOIzeDBUuSnilUcOGNwSUKVty669YeN6h4KrJQhcVzFT+Jy0nf2CHIVolzIE
         DABwL32NFM7C9C9FK2Lp28G6W2x2XzG0Cp1TSZxqoZwJRJEAcQ+2TSaQHMennTeBT4zN
         wUZp6lRI00FrEKj8ascz2O5Tsf8l1abe84xq0uJzboowd8OrNnjwtUJWq2S6y2Abn1K/
         uh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686189; x=1791290989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=biINQt2l096Gb8cXBkH2MIBuz9s+X7G+Hedzf/dVVx0=;
        b=fCHaoOB9+bG61qINgoaN/Kj8gXai4B66mpj2rUt1ZK31HTB3OX6VQWLeIz5tVcDMCY
         VDEN9vkWV5iiuKpHFeuZuvrB6I6d6tXEP7JU8MG9P0bNfm+oOFZ5yGIIzwikRY8NyKCF
         HYYHiA5wCXS7P3frchbKopepIIXkts2OT8oROuR9n+pH1btnjNLk9tzU1U1uwCla3xno
         e4az3SVxYr/n8bGfCfZOTgXg7a18gZWByJD4wi9RgZjywkOnq6/XxlSAqtq8fbLzLxeI
         y1oDroeFphvf1Uq6CJjIUUHIp8ji2DoBkbpIlSOZpwb7Kpr359BtRqWAXR3OZlIkTs9y
         10Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwY4GIJczLM5VnKeqwFlEvBZJGIWiu3XEzWp0y3R7+uCdURhqt4jH0/HCfo5sp7lvvdhJjvY7lDaOaHfaE=@vger.kernel.org
X-Gm-Message-State: AFuF++mRXppY/ti+YBblg7yPeqX8xcYwHObKMEo7TKxjSw/fr5yN8osG
	T8GSAxjtetVEZzaw4341GXzfYZRBKD+Ge+xwS/R6atXyF/6OW1/bgQPV
X-Gm-Gg: AYBFou1zdXNhTiSUP/5ybWydTDPcUh5J1W9ggrlm9daGSpU4KVJCYm/INpCW35C9VG5
	GJzOSk0DKJ3Ewl3ltR5XZ9GYUNfUN5skTrlse1V42C4uN4v83kWL/I2tdHJ2zpHYVPSV5PpDdtA
	uSY5C77SLhekhrgK8hwHv4RvgghwxhAxZ3Y4fCavYpm+TslaPiiRE/CmFq0UTp4K/TfikTLtHUj
	6vC+WD9Ypg+3W7u5uPRe2T66kk8NaBPCSRl9YTy2nmU1/orYbhNF51/TkAfgvzcZFnawyJkdLjr
	hhAbWFmM1/usLpxme1y4JS0oHSgF0013RN47hA6rnZn3AQx8R1wbwMqzmEMi+IBRODjoFh+o/N1
	HoC2L31m3gYvsxAochRXrCCFvxNMQnwv5Ps7AcR8lRcjcoCv2ac0ePD4mG6fyoX2BLN3RNH4jRA
	fpRzG7BlByr436e12r7ni/OdB5oBDVeP+ocCsqT/+ng745O0M0dFPwlRrxO1HDrQX0inMjuicMM
	MZfZzEynoiqL2EtBUJ+rVi3sb4EL0VtsoI+J5tz
X-Received: by 2002:a05:6820:c8e:b0:6b3:50e5:c625 with SMTP id 006d021491bc7-6d43f7a70ffmr11792413eaf.32.1790686188675;
        Tue, 29 Sep 2026 05:49:48 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8830ab0d7sm6781572eaf.11.2026.09.29.05.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:49:47 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvin Owens <calvin@wbinvd.org>,
	Yibo Tan <lhfff@tju.edu.cn>,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] pps: generators: stop the generator on unregister
Date: Tue, 29 Sep 2026 07:49:36 -0500
Message-ID: <20260929124937.51114-4-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124937.51114-1-danishkhateeb03@gmail.com>
References: <20260929124937.51114-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both generator drivers stop their timer and then call
pps_gen_unregister_source(): pps_gen_tio_remove() cancels its hrtimer
and disables the TIO, and pps_gen_dummy_exit() deletes its timer. But
/dev/pps-genN and the sysfs "enable" attribute are still there until
the unregister, and a PPS_GEN_SETENABLE or a write to "enable" in
between starts the timer again. Nothing stops it after that: TIO's
hrtimer keeps running in the devm memory freed by the unbind, and the
dummy's timer is left in the unloaded module.

The drivers can't avoid this by unregistering first, as TIO's timer
callback uses pps_gen, which the unregister may free.

Stop the generator in pps_gen_unregister_cdev() instead, under
info_lock after the device and its sysfs files are gone, when nothing
can enable it again. pps_gen_unregister_source() then also does what
its kernel-doc says: "it disables the generator so no pulses are
generated anymore".

Fixes: 86b525bed275 ("drivers pps: add PPS generators support")
Cc: stable@vger.kernel.org
Suggested-by: Rodolfo Giometti <giometti@enneenne.com>
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested in the same setup, with patches 1/4 and 2/4 applied. The test
    driver got a periodic hrtimer in its devm memory, like TIO's, and a
    remove() that cancels it and then enables the generator again before
    unregistering, as a PPS_GEN_SETENABLE landing there would. Without this
    patch the timer keeps running after the unbind:
    
      BUG: KASAN: slab-use-after-free in rb_erase+0x174d/0x1a70
       __remove_hrtimer+0x138/0x450
       __hrtimer_run_queues+0x2c5/0x7f0
       hrtimer_interrupt+0x3db/0x910
      ...
      Freed by task 175:
       kfree+0x25a/0x6d0
       release_nodes+0xd1/0x140
       devres_release_all+0x10e/0x1a0
       device_unbind_cleanup+0x71/0x250
       device_release_driver_internal+0x41b/0x570
       unbind_store+0xd9/0x100
    
    With it, unregister calls enable(false), the timer is stopped, and
    there are no reports. Unbinding the test driver while enabled, and
    unloading pps_gen-dummy while its file is open and enabled, are clean
    too.

 drivers/pps/generators/pps_gen.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pps/generators/pps_gen.c b/drivers/pps/generators/pps_gen.c
index d80e28dc31dc..452cc12a96f2 100644
--- a/drivers/pps/generators/pps_gen.c
+++ b/drivers/pps/generators/pps_gen.c
@@ -228,9 +228,18 @@ static void pps_gen_unregister_cdev(struct pps_gen_device *pps_gen)
 	 * An open file keeps pps_gen around, but the driver may free info as
 	 * soon as we return. The sysfs files are gone now, so wait for the
 	 * ioctls using info and make later ones fail.
+	 *
+	 * The driver may have stopped the generator before calling us, but
+	 * userspace could have enabled it again since. Nothing can enable it
+	 * after this point, so stop it here for good.
 	 */
-	scoped_guard(mutex, &pps_gen->info_lock)
+	scoped_guard(mutex, &pps_gen->info_lock) {
+		if (pps_gen->enabled) {
+			pps_gen->info->enable(pps_gen, false);
+			pps_gen->enabled = false;
+		}
 		pps_gen->info = NULL;
+	}
 
 	put_device(&pps_gen->dev);
 }
-- 
2.55.0

