Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009153;
	b=KwP3Amo9Jg6vJJPTg4ttpfyEtu+QFctZuG/ScYnX0IMWyapbf7b5IPI/g4O8qwgqgH+g
	 EnKN+9Lt6Os7YaU1jYm0VDklN6EQvrs++e0wNwOSVuH3p/t3PUxL/4q0/FVoEoytMZ517
	 7cSoWBy0K/pd/3wzgY17Jyq4PretWbM5NKEUaNY9RkyETCJUazMRTUlI8/ebmJNT8X1x6
	 GG0PZfIEDThRretIZ1AAnM7WKad3HJ2LwNmUe15tdF/tKrwlp/YSDMhGrtYVH87e2f8+F
	 mXAkwo68VCpjFtN/nlfqeafUgogfuQHtNEeLINlex9SyJzQT0QyVZfH29bhsMpse+Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gm/vkZ/TPKkcuQ8IJYMQfAw8BN32mGEm+OiB1P+AHxg=;
	b=j+s04SKSIXOk0W9sV3mhH07Ldp4SN6eY/W0UwGqnaQjcEUdYJ9yQHJ53DQFGqqO9VXB3
	 mDunEjF5BvI2/0PB1ykagFz29aX7FIt6aCoyx4iBC9aScWykr7w6uaUxcMkI2Dm9/9UiF
	 hv9lMxUzlO5mvVdD4Yh7wsX4yzPEBNyIGijQCI7FpWCaSi6Yex5aZRT+0vvz2svYmVQlh
	 DB2clQm/cg46LcRnKG3VqmqLYP72NiKUyEeSD0u+XuZse/P8ZQUwHL1E4R37F6YVIEyoT
	 qeRrpqgz3BnSbQtcUvk4Y0ztP/+fbZvrudc+yq/sZuD32GLblqLsBLMHq+2jb9zvc3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oGltNea8;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E9D606A335
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E9D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oGltNea8
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so743167a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009152; x=1793613952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gm/vkZ/TPKkcuQ8IJYMQfAw8BN32mGEm+OiB1P+AHxg=;
        b=oGltNea8Icpks0AKShXXj02HZ9E927nFFfMwJpBRbJKt458wbXwSFBWWA3+ghZw51E
         vAqvMNSIm+aJR5miw5r+rD46K2/d/dLNahVUsw5BatL/CY6yKy/VK3/v7lvIwdYP6Ncv
         2HT6AupXt9ynFYBu9eLulOEkm+OgX1tOE3r2peQ4oxqubYTuOFjWpxRbcTe44ySoxVsq
         Dwa7R+baX9Qj2Gz4dQnI4dqy/BQ392ZtfmWA5pGM61MCheekfpKiVQ4VG4rdGApp3+xr
         1uJESliw7mMLBpst5JWXhkqgGWWWl6wZVtxYFgUGC5oYVY7oMOEffn8aEX/I8WlA+F7W
         /vuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009152; x=1793613952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gm/vkZ/TPKkcuQ8IJYMQfAw8BN32mGEm+OiB1P+AHxg=;
        b=pEuS192aLE1TL6/bjaoL773TBrEJ5Rly2dO2SF9FOR0a7Ix5318wCovdG+pZLHgf5C
         6gRCSRDzv0YIajzbBov/Uunk+ZxSOWl2p49UVJIRD8Dg1js2TkqBLbb5XSSdua1ZGsBS
         UKcObKYSTnflh+rFLj9p2GI/+mpaoRGYFDvvzK6GOr46BR4qqNRIH12nt+NshlsmlIPV
         vfHfhB4KCp2etUaEphW2Dd0d+cYn4aW/JlusIy5QOGJrbtsQ5kHcPRbOHQfuqzjnKf5W
         rHdsPZ419K9K55mlstTQumksBUggJl17g3LaxLBgPGhDPIrx0GE0wqTqqYp8fRitSmLt
         e4eQ==
X-Forwarded-Encrypted: i=1; AKwUvByjTjzw4LLDWt320YLdsfZMCJINByLzhmEd/v5gTiI/32NmQQN3HrJvOJpVOTSopSXN6xIPiY4uvktmsCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYAlT8nALVNXy1P0JhCJEjFoxih9m+0JwGo0zlVBkVoq+2Ceus
	5iyC8xV66dMU+4c1UaCmHyLeo3zFT1jzjlBxNHROVoYcnKw3fJ0Zdiai
X-Gm-Gg: AYBFou2RgHada7G7yrdHBkmef6PrKVCiKP1eEgAZfOzVR4jr/m76RSwo8qdc4wDTvS6
	yVP6FzqNWv2fR3OZF2Tq02/5uBjauSuoS393Cf9FFbYjHoElwRLQsw5z2cFKg2LxXxc+r+87NkN
	oJLtow+xcUEnl0+KUdOQhTMFUkq75ZGU00lEg8PHLYE0k8jFZ++zCdhbAqImwXYzOeTO57T5ATf
	gCMa/KwoeG4vfOHZ1ALiraJUrijuBLnG9/emfPFbz+sWZlKqE8tV+TL8+sgM4FbV0YZ3CnZSmwI
	MhkLVNnGf5LLfYGjtWiJLh88PXttf/qhLN4uvJ5UcJUe+RFCXobWRX8oEeLHv51dB9sShy/3k6O
	xWCZYDXaHPNaXHxsRYtH1OrJl5w1wFlSFd7rD9BN8GL/ddD+GPxFglcKMG+RSb/M9d/es4magwG
	6BljZIzzvaOFSwOdvh+vSLec4Ss/f2K03OeJocqRDNE5fV0nOjU6rCDC/FY9JHzdbZtGnEz5sTO
	O/Og+ye5Lwfqi71fc4hSHB/Ie0qUsoUIeahd4J+jMdsA/r/P3h/4DJpNfSV1VFQpfKXiWAY73Bm
	5Eb1mO5Or/HoH1c2WUam+MeUFl6Uhe42Pk4MbrxDnoCppr+uDzjWpINL7zsMml3tSxth1es70t+
	xiOFa0ewBYowM3g17HXT9X+1bmwyT
X-Received: by 2002:a17:90b:224b:b0:3ac:d19e:85f1 with SMTP id 98e67ed59e1d1-3adeafd6bc7mr4882037a91.53.1793009152103;
        Mon, 26 Oct 2026 03:05:52 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb83b35esm4837686a91.0.2026.10.26.03.05.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 03:05:51 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] ptp: fix use-after-free in extts_fifo_show() reading tsevqs unlocked
Date: Mon, 26 Oct 2026 20:05:35 +1000
Message-ID: <20261026100535.68114-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

extts_fifo_show() walks ptp->tsevqs with list_count_nodes() and then
list_first_entry() without holding ptp->tsevqs_lock, the spinlock that
"protects tsevqs from concurrent access". Every other accessor of the
list honours it: ptp_open() (list_add_tail), ptp_release() (list_del
followed by kfree of the per-fd queue), ptp_clock_release() and
ptp_clock_event() all take tsevqs_lock. extts_fifo_show() is the only
one that does not.

A per-fd timestamp queue is appended to tsevqs on open("/dev/ptpN") and
removed and freed on close(), both under tsevqs_lock:

	scoped_guard(spinlock_irq, &ptp->tsevqs_lock)
		list_del(&queue->qlist);
	bitmap_free(queue->mask);
	kfree(queue);

So a read of /sys/class/ptp/ptpN/fifo running concurrently with a
close() of a /dev/ptpN fd can have list_count_nodes() walk into the
queue that close() is removing and freeing, dereferencing freed memory
(use-after-free) or a poisoned list pointer.

Take tsevqs_lock around the list walk. The fifo only ever draws from the
first queue, which is the registration-time queue created in
ptp_clock_register() and freed only in ptp_clock_release(); that cannot
run while the sysfs attribute is being read, so the dequeue from
queue->buf under queue->lock may stay outside tsevqs_lock and the lock
order is unchanged.

Fixes: d26ab5a35ad9 ("ptp: Replace timestamp event queue with linked list")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/ptp/ptp_sysfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index dc398c6..7d09256 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -80,13 +80,17 @@ static ssize_t extts_fifo_show(struct device *dev,
 	size_t qcnt;
 	int cnt = 0;
 
+	spin_lock_irqsave(&ptp->tsevqs_lock, flags);
 	cnt = list_count_nodes(&ptp->tsevqs);
-	if (cnt <= 0)
+	if (cnt <= 0) {
+		spin_unlock_irqrestore(&ptp->tsevqs_lock, flags);
 		goto out;
+	}
 
 	/* The sysfs fifo will always draw from the fist queue */
 	queue = list_first_entry(&ptp->tsevqs, struct timestamp_event_queue,
 				 qlist);
+	spin_unlock_irqrestore(&ptp->tsevqs_lock, flags);
 
 	memset(&event, 0, sizeof(event));
 	spin_lock_irqsave(&queue->lock, flags);
-- 
2.43.0

