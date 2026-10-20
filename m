Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503455;
	b=vLdTcXJimoDKk2wtHcVhN5cvEDbR04RUE3emPmIVSnxdXRDbnPUKiskMB3tRNAiaRBGl
	 OBrXmiE5aSpCB7culRw5TmwXFVxNqwQ7hfXzQ1C/X+I+mEsRNIAMROVCjAzv62RRT/TTM
	 DC6sKWVoP4t5L0EgOSDwOlHDB9EXZUFh5qEhyGAgsOzqpZa6S7nhXFtO/IEOuvT3ffEdb
	 95vZfy3dFsD3ZF5J5WsLNtmvAWiET6gcpZxdNbUJMELl8ycCWzxjxPsvVMRuCpArImyV4
	 GnX6CGuoERhkeJpJI41h6y7a8rsao7yXwnC6m2c/JXvhxOIg9JgGGZ9vwVvfF3T7x+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503455;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=KP8+Rg92qaiNXtTZwizo1xFliBBNfvKPtvWSZnigpZk=;
	b=LJ9N8K57cXCYwovA7yCTRiLrJhRkqvTan9bTPNkyuJDROn5JVRz9JeFqfOYjLqK34G8b
	 EMl6/XpT2KDJdk0cgHK1DE5MjZNQy45cOSkL3YVMyr/sQJKXqjEbS9KpRVxkF0DofaQ7V
	 W8AUYUNQhlXlvM8DQQo2l5LcZssYeuQgg0u4kuhUn0z9bmsO4y3uFPy89H3gPpm7/wRNF
	 nOG9w67ZmedjOCSBRjT/xfw4OghRXW+RjUuJ/MXZgLu0+cQIrf3BHgzJQrvqmnqz5B/K1
	 E6s70eqXU22dElT2wpNULBiuYSC/oiCjzZA1IbQQf9lIQI3u3+CbYErcb6eNiOsNjBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Dl8jAd9H;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LK7gFmux;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90625606A33A;
	Tue, 20 Oct 2026 13:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90625606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Dl8jAd9H;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LK7gFmux
Date: Tue, 20 Oct 2026 13:37:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792503452;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KP8+Rg92qaiNXtTZwizo1xFliBBNfvKPtvWSZnigpZk=;
	b=Dl8jAd9HlghR6CPkD0xYEV8gG+eI7xd53zD0ZaHqJRZfl+zHGRGxGWMTVOH+Ks7gEH6Pm4
	C1dJVp7/X4TzBK/wPCGa4oGMVmvzakJw61YtbyKZ7+oR24/LN8UjJqxiEh86RCd0J4GLkG
	wCJXTlW61BPHXonZW9fwI3Zyw1dvgGW3gA5xDoPR3JvKqAD66iBWyBTsg7KoEqygUl9UYQ
	jyyFlfz2bQIe/04LRCvZ4H4/WwSK+LSO5hnEEp3z8BE1nevN6IxRPoqrTOFV7g19G4zjZG
	QzL2HBwmT8DXB3QhF9BLVWI2SIwBLzz1IvKC6g1nI4+kugYBMHVM+Ja5DMuLBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792503452;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KP8+Rg92qaiNXtTZwizo1xFliBBNfvKPtvWSZnigpZk=;
	b=LK7gFmuxTZbgAjI9vJcsECBFRcGUl93uuf+ccZN7IjyS2RY5rFQGt/MaULFl4eZjtmzX/1
	yyct1XWUkcxlWMCQ==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/mmcid: Fix affinity-triggered switch back
 to per-task mode
Cc: Hui Su <sh_def@163.com>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260915155953.2856524-1-sh_def@163.com>
References: <20260915155953.2856524-1-sh_def@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179250345063.3012171.17206615076303624704.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     7dbc307b6c72a5412e3f4e9fa2e0e926925fc5d6
Gitweb:        https://git.kernel.org/tip/7dbc307b6c72a5412e3f4e9fa2e0e926925=
fc5d6
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Wed, 16 Sep 2026 00:59:53 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 20 Oct 2026 15:31:33 +02:00

sched/mmcid: Fix affinity-triggered switch back to per-task mode

MM CID switches to per-CPU ownership when the number of users of an mm
exceeds the maximum number of CIDs. When the affinity union grows, the
per-CPU threshold is recalculated and the MM can switch back to per-task
ownership through deferred work.

mm_cid_calc_pcpu_thrs() incorrectly uses min(nr_cpus_allowed, users) to
calculate that switch-back threshold.  This makes pcpu_thrs no larger than
users, so the users < pcpu_thrs check in mm_update_cpus_allowed() can never
succeed.

For example, with three users restricted to two CPUs, the MM enters per-CPU
mode. On an eight-CPU system, widening the affinity union to all eight CPUs
should produce a threshold of four, but the old calculation produces three
and returns early. The MM therefore remains in per-CPU mode even though the
widened CPU set makes per-task ownership preferable.

Calculate pcpu_thrs from nr_cpus_allowed directly. The users bound in
__mm_update_max_cids() still controls when per-CPU mode is entered, so this
does not change the threshold calculated when switching from per-task to
per-CPU ownership.

Tested with an x86_64 QEMU reproducer using three users, an initial two-CPU
affinity, and an eight-CPU affinity expansion. The baseline does not invoke
mm_cid_work_fn() after the affinity expansion. The fixed kernel invokes the
deferred work once and completes the switch back to per-task mode.

Fixes: fbd0e71dc370 ("sched/mmcid: Provide CID ownership mode fixup functions=
")
Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260915155953.2856524-1-sh_def@163.com
---
 kernel/sched/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1754d9f..76c6499 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10852,11 +10852,10 @@ static void __mm_update_max_cids(struct mm_mm_cid *=
mc)
=20
 static inline unsigned int mm_cid_calc_pcpu_thrs(struct mm_mm_cid *mc)
 {
-	unsigned int opt_cids;
+	unsigned int nr_cpus =3D mc->nr_cpus_allowed;
=20
-	opt_cids =3D min(mc->nr_cpus_allowed, mc->users);
 	/* Has to be at least 1 because 0 indicates PCPU mode off */
-	return max(min(opt_cids - opt_cids / 4, num_possible_cpus() / 2), 1);
+	return max(min(nr_cpus - nr_cpus / 4, num_possible_cpus() / 2), 1);
 }
=20
 static bool mm_update_max_cids(struct mm_struct *mm)
