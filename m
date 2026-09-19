Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9283859CB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850118; cv=none; b=AgTb/W5ToIO6L0W2ijTZHxnmFroVArG70PfMZKE5GJI6O0WyEUBDkYkKvmFUpY/gIg8+uWYlFNbDacQPbi7gPdOQur2/rrKZFYeaAJASMJW+EdRQVmYmPh//WzbAGZQNqfOI/OOZABkJslEiPRoQ5cip89uSlt9+gtQQa7Wz/Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850118; c=relaxed/simple;
	bh=4U2P804sZcijoXcknu4ntG4FcC6i3kS0ayJS3FV8BFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xmomgj7V9oXZUhIv5Ts1vBrWr2GiXyWYlqzo2Ge9+OkIWB4UrKXBM8SnveddGzhppgQGzWoPOggd9Btyckr0sOUjXpt0AcO7hH2HHkXf1OI8cb4lWNCTAwWpINe9YRc/pbZL5MsAAbMfDXJ5vkUPDuorU4w4ABvoNDnuWfEOXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNlGNgnk; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNlGNgnk"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1687051a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850116; x=1790454916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+VJhDb9WBMsGK/qp6cN0DtSaYXExcz6zqNI8kS+qh/I=;
        b=bNlGNgnkiySaiLJElNyldLMHjI1gkRtXYBx0RdURK0AuxEvHot6a+kRBJZeardenjn
         /YCfOYeTMn4TTYnBfP63NAQlBbTe3M9HPOrPIb4HzacSSzQslnenKAoXMjDVC8jj5tK1
         7hj2Vma/5D0K2v2O6NKJQRM3nXiTo+Y45ZQzUSrEn6ZK6fsaNYPg1CakJOywK7CwSyOm
         0ZkMDBI9FMDIFLyEi9AkQ6FuFsv2eZSa0x9yBXCJuLwyiZhe1RO/+LiSiG3Fdy4qldma
         XhWGmMdpVMfo2bRvCfyq8Z+SJfL+5kJAexiaHs2NrTeeEnDBt8ZBjHRyC/pIlDzj3I7P
         YtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850116; x=1790454916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VJhDb9WBMsGK/qp6cN0DtSaYXExcz6zqNI8kS+qh/I=;
        b=u2O0d5Liqalea5WAj9OX9GO0i13R7PgDwvPJiKACbb7/Cguh4rfQv7h5Cz+7YDR/0h
         ZsBdlq6+7yQr5uDyNpnTn/JVppjoaCKzO/j0e6lcfV1JW+eu9liikxyjwyLpvARbfwOn
         oAyAtiW74ZD1gKP8HMaPvZOlHSYTZiR1g94HdKXIfeI1Q+opyZuBGo5WhxQRt5x/OkNs
         ++RD+bDjs/AElcic3ynBO/wSi8CYQjoKl9tsZcLK6P5IDn4Z8JtSE1o0DlKdteHKxRxP
         LeOk4NyEo9nsXTKDFTv4OOtiZyntvPZVVEuw8fGdc0a44AnpqvwPlnxBsvs+QBQZeakm
         3uBw==
X-Gm-Message-State: AFuF++k+o7O/QbUH0bSS4oarPTip8aL3StHGiqk4gE6LolANVJVZ+h1e
	HS8feJjYv4MbMlY9/EKC14+LU+HL9QTYuUcdiZsVUV0p6IJHI8mESdm8vXfJZJ7R
X-Gm-Gg: AYBFou1fYcQm/r6N6d1GVOfRrGHqTD/1QtUzb1aOq6OtTNGA2uAaPl9qd4c2WNwtMla
	UKdkbvIwI98xsbtcpepLCQWcGN8BYa8ZQhCBGHJu1cN3lpLXfT0rf9KXVfC8qcnDQdH0QbYJ+Nk
	4TJ1xunPP/ON7OEYrr1d16afQFcihRgQwwqq0SmPlnTL/Rm1SYVNMBhmh/UNSzqYU0D2lzDS8Zr
	VQ1o59MS2L/u21djExr6kbXI13cpSXQa5WQ5nVhC8YdNQbw18ugAphaycXB7c/+WDK37nokauou
	7dHMSG3j2I/QFaXuvkGmhL7VA56HAOaGkwB+NO1L2C99439j1WeFoJp73/r72TYJfZQ+uR8cphh
	Ut2qhGvZC2gwMx5dmhnE20fQEk9AcnoGs8AXcfiyY0QA78ozEEHXnnCMTRwsop2AjSwQa0h/zhm
	JN3m56Yi0xTDeNKJVFcMgorDcT1pcr01RHThtsV5MW/nyaB+zbxhsLiMb7HbOEbKJDbY6d7NJce
	9XgzCX9AR9a/rSzkzdi3ipWFQ26wrmUmydGawgvB1FEZSLwLRkJo1hVTtUVJ0LN9DElj8AkKV6Q
	et5oAPlu/g==
X-Received: by 2002:a17:90b:384d:b0:39e:6c68:1558 with SMTP id 98e67ed59e1d1-39e6c6832f3mr5365687a91.32.1789850116404;
        Sat, 19 Sep 2026 13:35:16 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55c9cabdsm3749995a91.0.2026.09.19.13.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:35:16 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] char: hpet: prevent hard-IRQ divide-by-zero in hpet_interrupt() via HPET_IRQFREQ
Date: Sat, 19 Sep 2026 20:35:15 +0000
Message-ID: <20260919203515.2581203-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In hpet_ioctl_common(), HPET_IRQFREQ sets:

        devp->hd_ireqfreq = hpet_time_div(hpetp, arg);

where hpet_time_div() computes (hpetp->hp_tick_freq + (arg >> 1)) / arg.
Whenever arg > 2 * hpetp->hp_tick_freq, integer division yields 0 and
sets devp->hd_ireqfreq = 0. In addition, HPET_IRQFREQ allows updating
devp->hd_ireqfreq while timer interrupts (HPET_IE) are already enabled.

When the armed HPET timer interrupt fires, hpet_interrupt() executes:

        base = mc % devp->hd_ireqfreq;

in hard-IRQ context with devp->hd_ireqfreq == 0, triggering an immediate
divide error (#DE) kernel Oops.

Reject HPET_IRQFREQ with -EBUSY when HPET_IE is already enabled, and
reject arg values where hpet_time_div(hpetp, arg) == 0 with -EINVAL.

Fixes: ba3f213f8a31 ("[PATCH] HPET: make frequency calculations 32 bit safe")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -625,13 +625,18 @@ hpet_ioctl_common(struct hpet_dev *devp, unsigned int cmd, unsigned long arg,
 		devp->hd_flags &= ~HPET_PERIODIC;
 		break;
 	case HPET_IRQFREQ:
+		if (devp->hd_flags & HPET_IE) {
+			err = -EBUSY;
+			break;
+		}
+
 		if ((arg > hpet_max_freq) &&
 		    !capable(CAP_SYS_RESOURCE)) {
 			err = -EACCES;
 			break;
 		}
 
-		if (!arg) {
+		if (!arg || !hpet_time_div(hpetp, arg)) {
 			err = -EINVAL;
 			break;
 		}
-- 
2.43.0
