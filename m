Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141175;
	b=HZbe0mwOmy981NzGo41ShORSO2GrLMzCRLP5FLjg56vAVnCEzvroTel1aHVxDXZDD5je
	 KCpcEchT7JtUht5CLA3o6/x3WectE32QGcqaVhjiTvvMuWSrLqnMp8mJ6e6vC7dG7UEyl
	 K8PHik/emTFaz62E1Z+Cd5A02dnzGJR17V+etw1lrgwO1/6MSlQiw34gIRLMDFkpV4ppO
	 DkGgnipEpRiPFs3TeUpOQw1+dizgj0Q7CuNI9xMzjfOYvCb4hYabYc/zF5q9cJoJ1Md56
	 sgczmPaE/kY9VqKrUF0Z/8+20Mlm6VtPv3tb+IZyYSMJwcF8m6jApHnupP0gWo5Aq/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKKrVaDw8VhN0ThEY1srVBzSbNH24223CDIfI/w1Bw0=;
	b=Pk+pUMSVbGsmf0K+CH/yEFAUGvd5leb2u91vemgtM5HuiaSZcLiwoPLPoIT3UkzG+wjg
	 VEyfdTMiYf7Pvb+cImK5U/lMDwYIF6IqHAgalK8aeteSZiuO3LnOagfILBsdzNqgo0q6A
	 Nq3Gb30WNtABAltBaGezbrZUEKZlbmbFrY1/iDVEu9+XeygVjQRanKIZ1FFx3t3AaSja+
	 fXddvTopesFY3MoQx/h6bf4tOtbOydDN4AbXvsUjrc/4fChn1GL2stVTxwFU1mN8W3BpQ
	 kkSxs7xV8bXpmC4Uh1uW97W7RIXDKoyeJLaV9orh7HHd3H9j643gCx1VCSkg8TgmMaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNSg2lvA;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B899606A33A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B899606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNSg2lvA
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso105129eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794141174; x=1794745974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKKrVaDw8VhN0ThEY1srVBzSbNH24223CDIfI/w1Bw0=;
        b=DNSg2lvA/YwwEds4kUckpEBeQb9JSJZaMJ+7AhOnpdKDZwhkQECjt1S97dHZb0brLO
         JIVeXHMX1RTIk088T0AKg+urcSev4bzUCIKaPTszlcQ+ROeNi83b56okerZdJP0ttVc3
         pB//u4vRcwchCOxuIVqKiREHBMjGFydYlEg8kXVKqqgK4q9S481H5jfNW/DzIrZkXCT7
         hJc9JwaGw0Z3aK2e4MXMvOjgEy8sPZnrs9FvG4ko5KdvLZgIegRFo5+i94aR5OOM144G
         ZIW94yWRYeHTbHfrE8LGqJaeVOfWn4rLlxENx/vKswW0LXJ74C/1HEti5QtMq3H3sED5
         S64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794141174; x=1794745974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKKrVaDw8VhN0ThEY1srVBzSbNH24223CDIfI/w1Bw0=;
        b=qckTZUOnSZC5aYh+IHXSKpPy6d0igd5rk/AeU52rrc85MVPhh8yCKs9r2oIWugpGkj
         Z+e02GEq3QlDpK4oPjqquqTa/puRbGmmLZv92t+bKzmjVT+pM3l+SNnkXxWXwfxsi705
         9ZrXSUQBXiBODfBoHwBed+ifJfq7vnchhMcLTVQHKt6ORhUuYEn8Y/oNINT8ZiF4zghp
         lFPhth5AB4OQYMopbyFEp0JFyeb9s7binx3RbZxgQ6P9RVIpicjBQJkZgilIcSBf/55L
         u3F21V4D1qFakH7c3VjuoQ7ASiBAN3DQrweD3KlpiZqTVy/1y5UkkbVunDgd1NJjAwxK
         sGfQ==
X-Forwarded-Encrypted: i=1; AL+hErFwKz4GGc4HifrTz3phV4krzZTNxFFklkhMnEvDyivb0L5dxYsU3GRJoyxQCs+cyVxSE8v1GPwPdYCzB4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PTmFwNkGbV9ngXfGpNln+HeFBQbnpgFErOKcSzld1Zn8k/0HJ
	7qT0zWNK8G1fUZstggPXYJO3NzwTTVtXjdy1U3kjIvxTLFj9zeaTdWxO
X-Gm-Gg: AYBFou1a5cp5UagF3/iHyhngspiYsSikOSI929X/KYzQig5wQltz2XUhxlqIbkGTKEy
	2+PFIjdfUhuX+Ay7HUSqGNao4z+C4wH3jIIhTHcJOz3rNWEPeBokCGknAhgAK7Yt7sSbB2audMr
	yO1pz2EbGcMUM5FwhX8nDhl0ZbJ/FIhN9N+jhY6MnFUrHDUgc0CBHCKTIL54rWgfROWw+W0PLqW
	S8e6fvi69CUbG6IXU4KCYCONHwuU6M96DwTq1FDP+FGUVKMZLspKSqspMtTod44B/C68Avlgf8h
	Lgii4PwdhkXMUdX9gMKTTzo0Ci4DOA60lPGyh9n3Qq/e5VrBHQKlEIkMDzzusQzc1t+zMBzrTuu
	3NMYtsDMhahurrCMfT5zm7X3XdSy10gka7Xp4fi6eNFRWbp1iGWYw3AWPwzJw+yP84K897USv5a
	E7/F5WHZ5Bh1PEIqW7FD13poZ3jnTxLN6+dEaYvcOKWLcKaRdJmeNYvA4WVAT7FLQ6RFUIWR1FY
	LFP1B0pxgy6PpU/mnMoSLAyVv/tLcfKwsb8o88BRDUqw9AmkD4nqNnZTN+B7Cbh5/AcBXksG276
	cEnW+yw8E/m+wXeuAbark7Li1JFxeHff5ukrmlhIm1jEEpki
X-Received: by 2002:a05:693c:69d9:b0:36a:270:ce76 with SMTP id 5a478bee46e88-3725603960bmr2921302eec.33.1794141174312;
        Sun, 08 Nov 2026 04:32:54 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db733sm4767363eec.23.2026.11.08.04.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:32:53 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>,
	Peter Huewe <peterhuewe@gmx.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] tpm: flush timeout work outside buffer_mutex to avoid deadlock
Date: Sun,  8 Nov 2026 21:32:46 +0900
Message-ID: <20261108123247.426040-1-hj351016@gmail.com>
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
v2: Rename the local bool flush_timeout -> flush, per Jarkko's review.
    No functional change.
 drivers/char/tpm/tpm-dev-common.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index 6569212..97c1b7c 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -132,6 +132,7 @@ ssize_t tpm_common_read(struct file *file, char __user *buf,
 {
 	struct file_priv *priv = file->private_data;
 	ssize_t ret_size = 0;
+	bool flush = false;
 	int rc;
 
 	if (!size)
@@ -164,9 +165,19 @@ out:
 	if (!priv->response_length) {
 		*off = 0;
 		timer_delete_sync(&priv->user_read_timer);
-		flush_work(&priv->timeout_work);
+		flush = true;
 	}
 	mutex_unlock(&priv->buffer_mutex);
+
+	/*
+	 * tpm_timeout_work() acquires buffer_mutex, so flushing it while that
+	 * mutex is held deadlocks if the timeout work is already running and
+	 * waiting for the lock. Flush after dropping the mutex; the timer is
+	 * deleted above under the lock, so no new timeout work can be queued.
+	 */
+	if (flush)
+		flush_work(&priv->timeout_work);
+
 	return ret_size;
 }
 
-- 
2.43.0

