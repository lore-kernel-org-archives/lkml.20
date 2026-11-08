Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794124741;
	b=w+GiDIK96AP3CS9VHlPGLctndw/HtD/V2yrYl1hrwQIuPvJIDIO7FXiXLcA/WvDd/Mya
	 X95Ys6XAE1mqrXCLgQaS1Iz2kZJZX6wHxIdYNQ8AskL6FDthClJNgaG+5c4FnZPeSUchY
	 //osUuVWLnj5OLNcHgFUXzufFeQuS83/GB0PrKSn8EKIbCbIBVxX5vW4tw4xTR22uF1CX
	 LfOWqA4HPyhZR7TAGDAxBWm+bsR7mdnX8glTmeijWucQm7bBo7QLv4IXoXrcUNU1VT/dY
	 5b0pwYi0iZqTrItgwvervAKJtqnMrOM2ccs3YuOcK4/qcfAbvxk++4aH4ejg8e49AkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hwIhs2lYepVcUm7QFvUJxPA/hvff1VaV/dOu2IxaRvM=;
	b=A4bz1kELbv67uBwzJBrlI6OJPJRASksdeHPRyLh4d3ITaSVolbDRtb7wrD7eUFiX4Eo7
	 sBM/G/FmG0UnFdf6nmckto4mdeI9ERkKKEjFTjfs8ooec7K3nvTsDT0ZCA+fGCH6puxTc
	 qj+YWqr6y/8VF58EA9DuCIZLceXlV+SO8GHCHqHk1WgkOpHQE8MnJOHDL1pURbeK1xUR9
	 B2u0MD5hngU7Chd2awpjGk/eYmUqx0AWMKQ0n+ukTwoL9jyWqeKOimG5VRj7jENnjhfwH
	 k/fnS7bfFPv2ibdmKa/xfbpnvw9Mv4d1A2PBVnfC/h9N9IbApwusaNv5D7txrENensA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weR81Ncw;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45D2606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weR81Ncw
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so794772eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124740; x=1794729540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwIhs2lYepVcUm7QFvUJxPA/hvff1VaV/dOu2IxaRvM=;
        b=weR81NcweyuBhQaWTFWZGi0vcRkp5kMYOWKhOi4uNjRNhOxGNm4GnkUKoMkOmfC9U7
         VVizkZCDuufxRNyda4QuRywNb2G1xpxgezv+rn5cr3/6hv0IWTEiF7ihY9m8kp9GDam1
         9yH6619OKEKqVpKmvBWEIBG3JMt0ZbvRpeKm8BcIB1o4+4GGPgcESFv01/xEbcxdrRc9
         hCiUJfSeWkxI5kxPY260FaxU+Px/24c9/Upo2CciHRAmXjQwRmBSu/Tk9Zpq6x+rOI+x
         q0Ygf2Soy41A6/ifyYohAxMd0DVynJZukvVIoXHOWWiny+wv7xqx9tsHiX2nlSGSxAjy
         NXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124740; x=1794729540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwIhs2lYepVcUm7QFvUJxPA/hvff1VaV/dOu2IxaRvM=;
        b=rb9u6MuZ37QO4WP8oF4qu9H1an+RJ58GQ3/rXSbLhMYjTokn32uIZ0Z1xQDkfLoXD9
         NbX0q0Sf9aNGGmXznk9FaFKG01fDIp5Ddv/9072YILR3mpNLRKQ5s6E+/UjW7tFgv6vw
         JcUlU08uyX2EOvt/3lU4vLZSI/F/1tbRiAmMiJUQhUOFoth+R52OcXApfmcrSTwYU8kS
         VEU/BFd2tJPQ5Bi2H//Rld6pqYVRCLJhwKt79xGjn9pdcMkO/bOJy1GxFjVw3Fq+cR/W
         9hx5qidHgmquJvwaWTsApz65gmkYd6iwDihPgRyXEH8j9OiQbK9PM7KoVFng4fNLOMMY
         6tpg==
X-Forwarded-Encrypted: i=1; AL+hErFjXcjQM+ivI1gQcETWHtOKGl+Y2xOWbJluG2LPDIjnlnBNTxZ6VJEFUHzQdmFkfXIuu4OdZ/j0GR6KKac=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZaRU5V/WubRGNNXQZRBdEW2x4O4dlCDC+8KyAGUImGQgdYxpm
	4TAGbZw+tG86cgAUCsh9m5NXN95bL2nmYh1+JEh3ob5i2JEERQd8+Zxc
X-Gm-Gg: AYBFou0IjXqNP53sDkEj2d6FCYID6AbUf+8EChuWKIkEcV2mYP2nCVW8yhRyb8WkkEg
	lkRtbyAM94VDBPLjzCmsvKRoeC9OZwCF9Rc5zSiBhr+eXqMSr7ppf3CKDsjVqOabjS/zQ+Fr7+Q
	XvPOKJ1J7OtCR3BMfvChhbX7j5bZIFRM3/YVAs/kqQ58GVkLH/RzeqZ43cD2ypuaz2Jz+kGPwT7
	FyQUvXFX0qT1flwy3Ke58/apMuc4QsTvRG641D3cbCZ0sHRaLYAE+Teyr15wkSVf82lEBwWBW/3
	2omsar2xyj9aWli/YKpvvnrz1MLDQwduRzkY7DiKKofVvbLWXoweMrPvjPnoGI6R1ZxrKe0TK/+
	euIrQLYwDBHxbeAHTveZueGOEkZCvNEGvgYx6V/D4m1io2CoepmQvusW0N0y+NtiafgoM0dvyKY
	OvNGl5+g7KZ6DW+1frZqce1iu7oW/LStDyihdO55auPFroOGmeAQU2wIgdYhRVZbwyq9UeJNiOJ
	xyLnJW0eTbp9e1IR5anIdrS82z9MUhkSVlbLqxSKQN+KUtIMzh5+5qNdjJaLlDpcnKelQiU070P
	7YClEDKopylIdOEyUDqpRusD5BZRgu5hd1aGg1l45ekr6Y59
X-Received: by 2002:a05:7300:d211:b0:36a:1709:458 with SMTP id 5a478bee46e88-37256df1551mr2243835eec.27.1794124739956;
        Sat, 07 Nov 2026 23:58:59 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d48bdsm5966379eec.28.2026.11.07.23.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:58:58 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Tadeusz Struk <tadeusz.struk@intel.com>,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] tpm: flush timeout work outside buffer_mutex to avoid deadlock
Date: Sun,  8 Nov 2026 16:58:48 +0900
Message-ID: <20261108075848.257145-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

tpm_common_read() flushes priv->timeout_work while holding
priv->buffer_mutex:

	mutex_lock(&priv->buffer_mutex);
	...
	if (!priv->response_length) {
		*off = 0;
		timer_delete_sync(&priv->user_read_timer);
		flush_work(&priv->timeout_work);
	}
	mutex_unlock(&priv->buffer_mutex);

The flushed handler, tpm_timeout_work(), takes the same buffer_mutex at
its start. user_reader_timeout() schedules timeout_work from the
user_read_timer, which is armed while a response is pending. If that
timer fires and timeout_work starts running while a reader holds
buffer_mutex, flush_work() waits for timeout_work to finish while the
reader holds the mutex, and timeout_work blocks acquiring that same
mutex -> deadlock. lockdep would report this as a circular locking
dependency between buffer_mutex and the work.

Before commit 9488585b21be ("tpm: add support for partial reads") the
timer deletion and the work flush ran before buffer_mutex was taken;
that commit moved them into the mutex-held section, introducing the
flush-under-lock cycle.

Flush timeout_work after dropping buffer_mutex. The timer is still
deleted under the lock, so no new timeout work can be queued once the
mutex is released, and the flush no longer runs under the lock the work
needs.

Found by static analysis (a checker for cancel/flush-sync of a work
performed under a lock that the work's handler also takes) and confirmed
by code inspection. Not reproduced at runtime: it requires the
deprecated user-space read timeout to fire while a read holds
buffer_mutex, so the deadlock is established by inspection rather than an
observed lockdep splat.

Fixes: 9488585b21be ("tpm: add support for partial reads")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/char/tpm/tpm-dev-common.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index 6569212..f9b18ef 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -132,6 +132,7 @@ ssize_t tpm_common_read(struct file *file, char __user *buf,
 {
 	struct file_priv *priv = file->private_data;
 	ssize_t ret_size = 0;
+	bool flush_timeout = false;
 	int rc;
 
 	if (!size)
@@ -164,9 +165,19 @@ out:
 	if (!priv->response_length) {
 		*off = 0;
 		timer_delete_sync(&priv->user_read_timer);
-		flush_work(&priv->timeout_work);
+		flush_timeout = true;
 	}
 	mutex_unlock(&priv->buffer_mutex);
+
+	/*
+	 * tpm_timeout_work() acquires buffer_mutex, so flushing it while that
+	 * mutex is held deadlocks if the timeout work is already running and
+	 * waiting for the lock. Flush after dropping the mutex; the timer is
+	 * deleted above under the lock, so no new timeout work can be queued.
+	 */
+	if (flush_timeout)
+		flush_work(&priv->timeout_work);
+
 	return ret_size;
 }
 
-- 
2.43.0

