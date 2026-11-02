Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599988;
	b=DRe/8I73gtaPUiI9MXTh8R4QP5CTs+Rv+VHTKhwG9fL/fstkS+GWj9czZLwgHd0HxLpV
	 3vxP28Kbt8IB3TSamD34lmEzqJ3j6S7TDad+d+Tb05sTo6wTaMd4fqcKTwnRW7gU4GJLd
	 4eWnQw0z/tJQadn85FkJY9LQfdALvPw/CYlA4+LqVkBBGy3NcwTee3OtW1mqNCVogt4MM
	 +9kVoy6KVLQzJf/QH1ZTdDkShtA8O2E8KJzf7Y7MidX+AJJQi+JSoNzB3g+vH0qI/bfJs
	 YiE6zupZc5OGiWUNASgjbcC2jcf+pMqzSVWwSFIO39CEKBM/n+tWbnsi5FndYJFPFdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599988;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UI86I4ViKDjRfn2G9B+l7oNEwC7Jmg/CYNMbgdtdbxg=;
	b=5SEIqIwYgZxqlQBCNAtNEoE5iS9Jis/1J49PB6HERxpChfhruvU+2pAR0ti14Jmchfu+
	 cBHqH8h/LDhDzh+eCtpsLmL7G7wlrsKl0rVod8MMjCP/XJP+DzhpRNWFXMLQWjommZch5
	 8EwLKBT8hTQQujZS/rH/z3bpT7BUgp59rvlCHIkaHKkhB1RSbIjWRTi5MXTQtr6RsuuDr
	 Q2cZTw6CChY7CxN+zZIubxjyG05XAWHEqO5NBQL+O7LEWDKdE4cisdZC2XImwvLh/JD2g
	 ALeMIb2P22GuXKbIxgRdG+aCmTteeXdGuFvADerKT/AyCAzE3nMGctXRMdpPQcGWw+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=NlF4dG93;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABF606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56ABF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=NlF4dG93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793599986;
	bh=PNl1dCmzAXdDp9sWDN46jEZNvjmHp75YUYNHJM8SCYg=;
	h=From:Subject:Date:To:Cc:From;
	b=NlF4dG93uSgTAkIFxR5Hf2Y7FAy3/WCWPh+VcxbEDwOGjj1UclHeeLcPQqYLKgZED
	 MSr33Qh6c5/IQzZxm/hpE0MNiKXr6PTDAODlVh3vk7RY8yThNp6KO8//MxmXUTK7Cu
	 wG0SWflIehhy93JC9XBH104235AIJdmOy1UIecCI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] alarmtimer: Drop the spinlock around the rtcdev
 variable
Date: Mon, 02 Nov 2026 06:11:53 +0000
Message-Id: <20261102-alarmtimer-locking-v1-0-3c79a698aeae@weissschuh.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWduEDgESr2JcDPUXBqGYKRoTw
 t2puvwW722UYIpE52Ijw1uTLjHDnwoKg8QeTm/ZxCU3vvS1k0lsXnWGuWkJD429Y7TSoWLhSii
 HT8NdP7/p5fp3enUjwvo90b4fMvzjQnYAAAA=
X-Change-ID: 20261015-alarmtimer-locking-2e7abe32a23a
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793599974; l=1128;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=PNl1dCmzAXdDp9sWDN46jEZNvjmHp75YUYNHJM8SCYg=;
 b=5Z1iGecz0Bhx/LBlPJoqOtKavedKqsUT8kVg+bu4G2AezEIFiyvuBzS2mu/yiNUDD0XE4AlUl
 bqzI2PjGcdKBhpW38stYO3eackEaVeLtqZMCEfjPbEmpovmrO6sIZeJ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The spinlock serves multiple purposes. It serializes calls to
alarmtimer_rtc_add_device(), making sure the 'rtcdev' variable is
written only once. It also makes the variables values is read in a
consistent state in alarmtimer_get_rtcdev().
But alarmtimer_rtc_add_device() is already synchronized externally
through the driver core's subsystem lock. So additional spinlock can be
dropped at replaced with WRITE_ONCE()/READ_ONCE() for consistent access.

This removes lock/unlock operations from the alarmtimer's clock
callbacks.
    

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (3):
      alarmtimer: Drop the spinlock around the rtcdev variable
      alarmtimer: Return early if platform_device_register_data() fails
      alarmtimer: Return early if try_module_get() fails

 kernel/time/alarmtimer.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-alarmtimer-locking-2e7abe32a23a

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

