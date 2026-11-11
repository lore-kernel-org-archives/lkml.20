Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386472;
	b=5IMghvAG7eLkCf4mNUWKkdryTqsX6ql5NdEbHMYSzx37vS14WPBe8USrvqk16x3sZS6Z
	 1mh9vcMYWD7fWMbrcLSC86Ou5m6giGOCU8jKU4wM3LmjeMRdpg1IbfpAVzrf4T8RI9xLB
	 Lirl0nJZhN4iq1F+rSOui+kxXSIX7AzIO+zjHC/vcarfi2KON3XILaUGpaaX3SUieEPsf
	 Wrb7FvY364g380WHsgN+VCOy6h9r7yPsPT45BS1/3mveJ48wXVKASUz55gzR+18iijnOk
	 sBDRUhefHhhpLwQ7YQ3tcEnApHvWagUWNL0lo2RMZ8avbDDFb7oc47WNqNycGghlQZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386472;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=swPiF6htnL+2dH9xeaFftbCr5b2e/UQbCzmsRYhDYuY=;
	b=xI5DzTIib0an9VCOsPwE98sczC3pbL2AtZ8wMW/aqJIDIMD8RH8RLw3bqihNkYbPpImY
	 C28zJMoG2hNHD6jo0Ql5SNDUyEhJpyeU/HLS3KeOLqmkzWKueqvIZ4/Gpla6vlMEQ7cxs
	 oXnUuEdUkGVj3Ks6dlnqQT8ZspSSm/QqVrHLI7oEYJ+Wfr0DRkS+NKp/JI7sisE7XQUl6
	 BE1VUAYRYT/d9L0ep9xyTnd+s2WiOv1twTiwpvhqvU0R072xkUOf4NXeoXMmwewq8ReXe
	 OQ3Yo7Ah0nAc7ChNMG069bn5SOgqbr7rRU8/Wil4nHmbZG6TA4BdK9D5ZtxyHJdRVTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=fNtYylUI;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8499B606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8499B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=fNtYylUI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=fNtYylUID7CC+exWCShu3TTB7wRBjmW58SfC1KsioXVWq8I8tAKxzWx7/6/OP4tT75n+fGqmwF1EG
	 IonPxHBZo9NprQIo+fZqw8jwQ6OT0bJ/nBOH8aGzWbmezl1aTqkdH2CUE0i6zn8ZntTz3x6DRaynvx
	 1zyBAlKbV91WVjsw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af42a2596c-76af3;
	Wed, 11 Nov 2026 16:41:09 +0800 (CST)
X-RM-TRANSID:2ee86af42a2596c-76af3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36af42a24aa2-d4c7d;
	Wed, 11 Nov 2026 16:41:09 +0800 (CST)
X-RM-TRANSID:2ee36af42a24aa2-d4c7d
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: tglx@kernel.org
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+0b91948d3c6b28c0d4c7@syzkaller.appspotmail.com,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] timer_list: Annotate the clock event deadline snapshot
Date: Wed, 11 Nov 2026 16:41:08 +0800
Message-ID: <20261111084108.80870-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

print_tickdevice() reads next_event while the remote CPU can update it
from its timer interrupt. The value is only printed to /proc/timer_list,
so synchronizing the clock event device is unnecessary.

Use a single diagnostic snapshot and mark the intentional race, as is
already done for the tick scheduler statistics in print_cpu().

Fixes: 289f480af87e ("[PATCH] Add debugging feature /proc/timer_list")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 kernel/time/timer_list.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index 0406bf4488e9..5f80af00729e 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -177,6 +177,7 @@ static void
 print_tickdevice(struct seq_file *m, struct tick_device *td, int cpu)
 {
 	struct clock_event_device *dev = td->evtdev;
+	ktime_t next_event;
 
 	touch_nmi_watchdog();
 
@@ -199,7 +200,9 @@ print_tickdevice(struct seq_file *m, struct tick_device *td, int cpu)
 	SEQ_printf(m, " mult:           %u\n", dev->mult);
 	SEQ_printf(m, " shift:          %u\n", dev->shift);
 	SEQ_printf(m, " mode:           %d\n", clockevent_get_state(dev));
-	SEQ_printf(m, " next_event:     %lld nsecs\n", (long long)dev->next_event);
+	/* Take a diagnostic snapshot without locking the clock event device. */
+	next_event = data_race(READ_ONCE(dev->next_event));
+	SEQ_printf(m, " next_event:     %lld nsecs\n", (long long)next_event);
 
 	SEQ_printf(m, " set_next_event: %ps\n", dev->set_next_event);
 
-- 
2.51.0



