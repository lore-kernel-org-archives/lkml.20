Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254013;
	b=QEKPLtjOK1iBhLgfPrxJN/4OzFfac4DiyzeoUDnp/ePod+jAE5pTEqaoG7ekNlxgr310
	 GccNF5Ez3uqBM4c6Ok6YbWcgj9I7dCZg1y9h/Uf/FyO2LYL92HP31ZmusPuoGPdWsyq7s
	 wQ/giF6X141stYZGKNmR5W1WH6UCYrvWwHkrpzQ40S6ZALETsE+f0oNkJMkZ06y2ZGToT
	 TlqkciOeGwGWKYuqujbJEVdIocvgRSkrQTTCT4jLiixFFFCJc35r3Oa07ssicJXr4N9K2
	 QjLolWBcgmIJaukZEZuDSNKmGgT9LQCsAYyx6A7EP4b7EOFkAijmfPlGUtU389dZL2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254013;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=FF6uOf0aVJmPjoQTb6FJ3PAD6ZetwMUTh7p4CwaakmE=;
	b=4x5xZa1spsGl6ZyX9Qo1Wl1KjGRvUJYxsbon8DhxSoOHaEhI8nI56GLKPWtWGsOASbER
	 AclA6NUYkmWb7NnMyHdGB8VvLwlPNE4GpCrbtOBA3Kw/M5ML88+mFGFexSi4Dl+ec637q
	 dygqgW7rNvimFVvJNWnqCxpdashAcVm1tup5llsIZdAv+LVCJGUYy+tBc17vgR6YWuhSu
	 s6MZ6m+9BHokpRSO+uTgJyzR0U4KDKI9LuxDXiJhsUqKTAo7htNgPX5+t+28YJCJmGxMu
	 PDNHMqqc+Urr0AgrxTDscWelzPACrJZfFTsYcD51wzJT+1d4wBVjHHEjoPyHUZzUyWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tPwWWAVc;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BK5O5szu;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADDB60A3826;
	Mon,  9 Nov 2026 19:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADDB60A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tPwWWAVc;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BK5O5szu
Date: Mon, 09 Nov 2026 19:53:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254011;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FF6uOf0aVJmPjoQTb6FJ3PAD6ZetwMUTh7p4CwaakmE=;
	b=tPwWWAVclzP3M7Ov2gm1oSzTM3kCyy0GxWZvSDvCdE/FHvfcReppIiqOSJdvybc1H9Y+kB
	xwlCCo895/wOV+NyigKjg26liThIPcsy/aP31mUoaOAiMWHyGDhBQEYya2zMN1oN38xMtP
	a4EDfx89nnF+gGh7HQzdmrtN6uIMBwAcP8s0j1fB4pMNLehKAGsPVMH0bjo0GIUuDGTy9o
	y3/NGx9bpxzkLlm9Uxdgz8P45vZOwuJQo3QarHhx/QVhsuG2muPJrYjrtQ3YCZaqmUJd3D
	oD+0LZJCYg2imBcAI58A3Kn0AR8Zjx0YC1PWCB6SpeRG48BHFeq8Vgnnz1K5tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254011;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FF6uOf0aVJmPjoQTb6FJ3PAD6ZetwMUTh7p4CwaakmE=;
	b=BK5O5szu3lquoMfsWD1nOXXpReJT7DhGL0YBGZMFCRvv4wSg/4kL//plMCw2mvlkR3/xel
	nKylF5x1jG3+D4Aw==
From: "tip-bot2 for Avi Weiss" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] clockevents: Match the CPU when unbinding devices
 via sysfs
Cc: Avi Weiss <thnkslprpt@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261101141120.367124-1-thnkslprpt@gmail.com>
References: <20261101141120.367124-1-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425401011.2093942.9976529933986944120.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     6b1f622e0a725e0b9a3dc36c24276d24b5b6e295
Gitweb:        https://git.kernel.org/tip/6b1f622e0a725e0b9a3dc36c24276d24b5b=
6e295
Author:        Avi Weiss <thnkslprpt@gmail.com>
AuthorDate:    Sun, 01 Nov 2026 16:11:20 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:25:25 +01:00

clockevents: Match the CPU when unbinding devices via sysfs

Clockevent devices belonging to different CPUs can share the same
name. The sysfs unbind handler selects the first matching name from
the global device list, which can cause a request for one CPU to
unbind another CPU's device or incorrectly return -EBUSY.

Check the device's CPU mask when selecting the clockevent to unbind
so that the request targets a device eligible for the specified CPU.

Fixes: 03e13cf5ee60 ("clockevents: Implement unbind functionality")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20261101141120.367124-1-thnkslprpt@gmail.com
---
 kernel/time/clockevents.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
index 62ad7c0..05e9d96 100644
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -756,7 +756,8 @@ static ssize_t unbind_device_store(struct device *dev,
 	mutex_lock(&clockevents_mutex);
 	raw_spin_lock_irq(&clockevents_lock);
 	list_for_each_entry(iter, &clockevent_devices, list) {
-		if (!strcmp(iter->name, name)) {
+		if (!strcmp(iter->name, name) &&
+		    cpumask_test_cpu(dev->id, iter->cpumask)) {
 			ret =3D __clockevents_try_unbind(iter, dev->id);
 			ce =3D iter;
 			break;
