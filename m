Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622236;
	b=jshfBsioK6NUiEQigQ1DFoLixXlC2A9PdZamQk4F2MV+w9z7SL4N3RCBQZifZSP/zgPT
	 Y1dK6HxARavnyyagtN8FmsICF3+/WPl/cZBSFzpEj8DZOORQixH34h58QHCGtpLwo/GMn
	 To6qHIV+KHcrNEkg3c60WZB/IQMIDH0FjIShvVb6BHoJuiCDaoUEQaDCzcHA0IULN1hi9
	 V8svXWou2rIunK+6hiShR8P9lkESIvl4ym9gZdiJOWtAC7/aotKZwrSunbZIhhqRBvpnX
	 PEzHFr3FxGcFh+6QxQ4h77c2aibhdmZgvDqb72QavDILOTlFFjTQ9GK4L5qCtjj2xhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2QoSKh2R8YzTVuDYsIBEYhU9o8xQeiipmodiv0jofHA=;
	b=31Sh2vNwUPeZSzJQyXJdJEASx/ud0achbgsaTaJxABqXMaxDXwbKXV2M71lr5NxL6NBw
	 AEQ5QypdCKeXD94pmpTs9/WiIo/UsJlemi8NpvrBN9Fh+o8bWxmNpl6XjHAWQHFT4NPxE
	 /eyX+nsvqtZCNgc217f7JRY9rjG9mXXtU9WwRVxkz0LR02tbLZM1cPFs2HbRMFCxea1gy
	 zLbqLLsUxRTK13wS+yVXXp3PLehCEcOvhFFCwe3hKKeq7BMWtCQDy+2omEvk1y/FEBOI1
	 ZFrqLRbIQyEK6fQ62iwZbYRDiZocfAO2phavoOt3QDSqBruVxqJFFgBFC/HDw3suVMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="q7ESpj/6";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42682606A793
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42682606A793
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7ESpj/6
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so30028265e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622234; x=1794227034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QoSKh2R8YzTVuDYsIBEYhU9o8xQeiipmodiv0jofHA=;
        b=q7ESpj/6KsDzr7j6XAkPlgRK2hofnMaxPPC2GiXQ7ITo175PoIJfr9ADgdo47qiWYi
         TvdfGWmfAEpLNmZwsf0QL74yGDboM7evObCV4bhUSvvhihGrzxYVME5MgOViKEbFdRjw
         4bZiTugSkcSJ0CLzRIrzL8Iwt+1ut4DhmSs58Yc2329wrSRSr29ea+cC4KFcfbFATCJN
         AjZ1TNct8upx8WTi6vWRPZb88s3WR4Rg7Lmtq4BA+2vQnNc7O8Q9VwY2DfIcXK6bKjYx
         PnXY+qlU+DFLs/wGZ44UHgFcpUwD6sYwl39JHuUZET/pS7sYvQcFFRZLRgeNfWcWPf9d
         WDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622234; x=1794227034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QoSKh2R8YzTVuDYsIBEYhU9o8xQeiipmodiv0jofHA=;
        b=zugjGLDHfv1Dt3H5zmLMO8Dmxopz/etKra5BlL7jhh3XZCEwPXNQnC8wQZUpdBxQrs
         cwvEL3N2sHxjeIcmJ3jU2Mldr9BqcTFslEAJvguRoR69l0/WIeIqAw2v9jmoSwJh5l1x
         iJfayaW/ylKQNzqbpF3gR06AJJmrPAPakqYL5h+Xg/kwbx1FSthOtmDVX9+WF8HGsM0+
         zzR8imLnGiDGN/gxERnFZZgQKqHjso4MS2MSca3tQWo7MqgROVpI1ueVut5rGKUck1b6
         hU9llhdUIBEMVBuOmdRZ+1+zDCielNgQuaiNI4PaGDWZCOLesMXw9987F00K7+ACMczc
         +LLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7rCAYdMBr0BVy0fj2Jae3cLus9Ckfhlg1bp3YzIuukuIZIz3h+ooy2a/SVCM359yC5qLWyLRf3RInq1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/8vSfqUYSWA8QO8DNBc13E9Fo24aBKBQtEZheBDFfBpAcXBj9
	6wFWosbzCGiqML3kDYm0IQ8JCYq6oT/E5r5tDivBd8/3NtDb9SZBQnpY
X-Gm-Gg: AYBFou3LM4jyAbGaXUEE8oG46FZ0GMefmxwUoE9JFLBNDeKs6QDga0jRrCXzqgJtBbK
	Ex1ogtXHSRBCeuUIyTZZiEmVc72vVHo9CDEzvKU6I8n9MF66d/w9R1IIDNH72tda5gOHr40/uUv
	7tSB8qZVetcwLvR41dJJK8KThGWSS3txFe6Dxq9vwX91jsm3g6AJweYcSTmiBZPh8qwoUL1cZ4/
	KsbcyRr+LSDXLvL8HRNibgqbH0u87pdyWwTlrpk8LZrQ0pgknmrASTk04w6hUHONBYYmbr6sAPt
	vSJE6UNU6Ui4Kpjl+niKZrjbgjZitcWMqPH1m6q8XvSaLA8O9kKEnvORTvB4lsqtU4jyLruS33f
	yy4mBmQXk3vzO0f6/oIk604cHsj1sDTorsqMA+OIRpuXZwFg+C9qdn3QSKaeAAXZzSMoteQvhpg
	610BvsjPqZ4X02OP6MXAKTfONUgnuoo4gvuMumWzwdCGCMtMIkPiWftX1FdfVF2xIldhCdXaj5Q
	PepUARAhvJzfJDlzsTRkX/7+Q4A2ti0OyDUNF5z8RHL7Ao8K22EhLz7yOP3JTDWAY5XNzKeXTft
	IxKzm6F9vwfB+/Ka6sSzSWJb67m+IzjfoQ==
X-Received: by 2002:a05:600c:8183:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4ac180f2ba7mr215223755e9.12.1793622233480;
        Mon, 02 Nov 2026 04:23:53 -0800 (PST)
Received: from thinkpad.lan ([2a06:c701:4773:6f00:e7fd:cb78:efe4:a8de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf723b5dcsm271952215e9.14.2026.11.02.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:23:53 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] ptp: Report clock removal to poll waiters
Date: Mon,  2 Nov 2026 14:23:40 +0200
Message-ID: <20261102122340.1160733-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ptp_clock_unregister() marks the clock defunct and wake
timestamp waiters before posix_clock_unregister() marks
it inactive. A poll waiter can consume the removal wakeup
while the event queue is empty, return no events, and remain
blocked until timeout after device removal.

Identified while reviewing the PTP polling and removal paths.
Using netdevsim's mock PTP clock in an x86_64 QEMU/KVM guest,
the unpatched kernel missed 8 of 12 removal notifications,
while the patched kernel reported all 12. No kernel
instrumentation or forced fault injection was required.

W=1, ptp_chardev.o compiled under allyesconfig and
allmodconfig on net/main.

Check the defunct state after registering the poll wait
queue and return EPOLLERR when the clock is being removed.

Fixes: d94ba80ebbea ("ptp: Added a brand new class driver for ptp clocks.")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/ptp/ptp_chardev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
index f63b45f5ee6a..01adc70ad97b 100644
--- a/drivers/ptp/ptp_chardev.c
+++ b/drivers/ptp/ptp_chardev.c
@@ -593,6 +593,9 @@ __poll_t ptp_poll(struct posix_clock_context *pccontext, struct file *fp,
 
 	poll_wait(fp, &ptp->tsev_wq, wait);
 
+	if (READ_ONCE(ptp->defunct))
+		return EPOLLERR;
+
 	return queue_cnt(queue) ? EPOLLIN : 0;
 }
 

base-commit: cb284914e749388eef402938bdb3115fe1f6d337
-- 
2.53.0

