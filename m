Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97065358387
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791436295; cv=none; b=bq2SaTGzwxdy2M/ie0StAfj/I/dgNQVTdXIc3NKiDahGJ1ZsEyVCwMS8p3mP0DS+SDYJ9H7Di4GAKsRqbSsC7BQxuR8mnSdi+thuLIYDw0GkHJ6SQoB6+1aIoU611EFvXkSDVB08RaRbhUX6qkwHIwalTjF15rKu38DdH3M8Zbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791436295; c=relaxed/simple;
	bh=gEkHXfRr76P2h8G3BI1+VQ6pxmufVkopuDC5xCXBgyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cc2dPPhe5hXaDmVJmar2i4anKTbCYJq8pXUrvtQAI56SWrFQFEWG3GK3M+flKPiYjdAnRz7KgFDEDtbMstj0mr7scQ+LbsO9Z6DHaV32LLEXuLJWE7XJYswSLFUHzJ6r3tAPqO4H4lQ69VIqwkWXfi+Cr5q32uI+qJBC8Ey1/j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClCuu4kQ; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClCuu4kQ"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1227814a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791436294; x=1792041094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=elAPkWnEdIb/cze47rnLz0VBXJ5OrbhEX1cUa7QEjhQ=;
        b=ClCuu4kQv+qI5GVHbQrRH4g7swgmlUDruAlo+YrCgLxccAwBi7noFH4hwMQ0d8vyI7
         0B7vhOcLZhs84ovBaB3UDAxqrnzCxB39/BPG8mT9KNsSMVnwqe9U8gi5eGEVvGefH358
         TeeV4sNZkOP+8qP/m2M9blBVtYjET5eiyFHwAEryy/tAvsEKdaZ3Fg2opar7d0dDy1JM
         ls4wr4oh5GdJJQPVEaync+6noFTXerCBFGDDORmamruzbSUtqGpvi2/NLBPY5bMXjVTl
         7R5CxGBxPDbVHkNCv6ftCF77ARAS2Hwi2k+1KBy5oIduWBjINXm5auVDlMuGZq5TBTMw
         3S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791436294; x=1792041094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=elAPkWnEdIb/cze47rnLz0VBXJ5OrbhEX1cUa7QEjhQ=;
        b=w2E2Pq5LCn3RUFosdnh2Zr0xPWs2im4JHjOP07hJEUrpcIi4up0oWIWhaWGIL4SFnY
         mSi70rsjKOb0ocytCYCF6+0F5HXJso1579GJ06Es/8evUZj/Kju/Sdxuzqt4rCkyImsv
         Mpdl+tatcQF57FVa7e54aFUxUpWpVBEZFyBRpWdZ0e3luWmiPZ7HfCTbHPulJieHbTYS
         j55gP+793QupxIpT/yAjqaF15fiF88RIU3VP1W+MRtufwfxeBk+ExzeJTpDT+j0CVRlJ
         te3Q8yTULkW1sWg1zzDAAa2/f8vEUHm2I+SAKmkouLcIPGnkgKVAUnVyidyEFB5OFmSH
         WLnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx5Mkk3l4vygQRaZl+vmk6zZ0uwS2OdkkLj52N1xBhQD5J5Qo74dRmkvHtURdRRIO2Ahr9pShHyHVcZic=@vger.kernel.org
X-Gm-Message-State: AFuF++kWLPpDgD8+j+JC5r4zizcGkAk/9baQhmw/VpNGDIEKnvapSByx
	jBLWS5jQu+P15DhvS4vhJ7RJNup6QP+OkUaSq7tXM8qvy278Jex4SASs
X-Gm-Gg: AYBFou01LJDJs3PN61RWeEXIXXHXuhuyHBTOYAFQXh3WsL4PX1rLyM+lOZ6l6eLQxAr
	ZSMlekV0Q0r0ehjRmR+g5fkvXwm3wg2h2NhT31ZdmFbwyMPBnpB6AC0cA05zMW1a/As9cWPVsAD
	KQTEW32v2RepbHIDXbkkaphS/xmjx7b1pNB7XVm2egdaoCOqv+gyQ3MSc6Iur/73Ij6g2gcFR0/
	8+bWP/yNzJmfUfXZS5JtR1a3gQ6XKN1ZbLJYnLQvqQvcQkyKzB7Xoa00t05HF8YE2InJQHaoxvZ
	H8FUbszJJzW0pfSFTtCdGPoo8v1XcnebsC4vGzS9JPP9DrsLkEVWYUzLcmtL/m/3/dHKVkb6BTq
	FXnSUSnorzpz0JOtV7fNWqxrV98+QbEWj35AGWrfJCy6A77VgMUsH+aURr1RkMjiLEQ5hmphvXT
	flNQSWjpYseMSvKjefUQgPqrrgKoH9/nja8V5DD+9F0gfVVyYjGjnFuL4I5J1GmGTYL2M=
X-Received: by 2002:a05:6a21:9190:b0:3e0:d33a:fd75 with SMTP id adf61e73a8af0-3e1340db79emr4497431637.53.1791436293946;
        Wed, 07 Oct 2026 22:11:33 -0700 (PDT)
Received: from dungbv.. ([116.98.134.138])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0aa370364sm2399656a12.31.2026.10.07.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:11:33 -0700 (PDT)
From: Bui Viet Dung <dungvn2345@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bui Viet Dung <dungvn2345@gmail.com>
Subject: [PATCH] Bluetooth: 6lowpan: Pin module for 6lowpan_control debugfs file
Date: Thu,  8 Oct 2026 12:11:29 +0700
Message-ID: <20261008051129.508322-1-dungvn2345@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An open debugfs file retains lowpan_control_fops in the debugfs proxy
state. However, lowpan_control_fops has no .owner set to THIS_MODULE.
As a result, full_proxy_open_regular() calls fops_get() which succeeds
without taking a reference to the bluetooth_6lowpan module.

With CONFIG_BT_6LOWPAN=m, a userspace process can keep the debugfs file
descriptor for 6lowpan_control open across module unload
(delete_module / rmmod bluetooth_6lowpan). When the process subsequently
closes the file descriptor, full_proxy_release() accesses the already
freed and unmapped lowpan_control_fops table, causing a kernel page fault
or oops.

The issue was discovered via manual code audit of
net/bluetooth/6lowpan.c.

Set .owner = THIS_MODULE on lowpan_control_fops so that debugfs pins
the module until all open file descriptors have finished.

Fixes: 6b8d4a6a0314 ("Bluetooth: 6LoWPAN: Use connected oriented channel instead of fixed one")
Cc: stable@vger.kernel.org
Signed-off-by: Bui Viet Dung <dungvn2345@gmail.com>
---
 net/bluetooth/6lowpan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
index 30f4afa18bc8..20fb20eea8e7 100644
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@ -1209,6 +1209,7 @@ static int lowpan_control_open(struct inode *inode, struct file *file)
 }
 
 static const struct file_operations lowpan_control_fops = {
+	.owner		= THIS_MODULE,
 	.open		= lowpan_control_open,
 	.read		= seq_read,
 	.write		= lowpan_control_write,
-- 
2.43.0

