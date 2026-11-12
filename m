Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452475;
	b=ef3qrmxXY9FrPrl+kATPg5hmYrr+E36S9kLYblxd1q6ulpc8t+iwqWhVI8ckccrd6wxo
	 AjalzR6dJz3nLW9WBORcqh2Biylf+98j4OXKUSi2y2x+vZqB/Vw9/WL1CcheHBhbJLVJa
	 DY8UDwKcI2ehG7/Ft12Xa5Ouo58vJp05dsS5yAftHtfz+vpVM+ZDNedqIatgoKZ57oWVa
	 hzriaOZ7PiQbRBBPHnG8GdudBhBr+0XlI8bYoyBVkOnEAr6+FaJ7QNZD3fM2NNmo7ukQ2
	 ydLTnl6xPL5WMPyGPBULbjHhnvtysaNC42JstMcZYumVYoAGYSlZBL55/nGm3JIhSPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452475;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=qiCsHl4aLfuM0HggHI6enKIcXyGtgtMSfDyKWC1ANDc=;
	b=dq0MN+cOKZhngSb1Mj9qM18GfSMLS8Wu+dPcxMcYCx51pOYqRqAsb3o7SADftuEdvMHp
	 fbNCZoaQhcn1MMrVIV05fC8UUiS62RSEv6/6k0kRrmGkuThAjt/B9+5y+l1ngmQsrzwfW
	 cJvwXnK0AsyKkSzPsaA6NRZzmCy/1ilYSHbMz3pvgAADmAy43nO3uYXVd7AQPM7zNuFvx
	 qQCUB5IfrITFcmWyVKaNJq1em1p2xLYWMgaRUpoBbavxUGep3oqXnysr8vRDYB9LaScBF
	 0l0O4rTz+ZF+2zFgOmONOGhTcib0l1th23HqUH95WnrjetgTzB5MrCpBm37oc2S864w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mySbquPV;
	arc=none smtp.remote-ip=91.218.175.217
Received: from mta0.migadu.com (out-217.mta0.migadu.com [91.218.175.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A05606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A05606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mySbquPV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1Gh4AgZD5hyucitfPZ/zkzEskQ30XUa8BCrwjOqRbDw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794452472; v=1; x=1795057272;
 b=mySbquPVo5B7rVX6O+PRKzapEWfTeRvnnrxEvo0QNp4KxuZnnuVy6ckr535EQHY0iXreJz7f
 vlPY/radVvE7qmdX1Asd6/P0WlTpp+AyYR0H9lzn+jswzsrACHto1dsfTBcF03RQpQqx9fbH5M4
 dyEl74IK3OL3UICrzI+P1gUs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 354a4d904e250d13;
	Thu, 12 Nov 2026 03:01:12 +0000
X-Mizu-Trace-ID: 354a4d904e250d13
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 11 Nov 2026 22:00:58 -0500
Subject: [PATCH 1/2] block: don't request a module for the none elevator
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-bug-block-elevator-unchanged-v1-1-583198bd4e21@linux.dev>
References: <20261111-bug-block-elevator-unchanged-v1-0-583198bd4e21@linux.dev>
In-Reply-To: <20261111-bug-block-elevator-unchanged-v1-0-583198bd4e21@linux.dev>
To: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>, 
 Ming Lei <tom.leiming@gmail.com>, Nilay Shroff <nilay@linux.ibm.com>, 
 Hannes Reinecke <hare@suse.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

elv_iosched_store() calls elv_iosched_load_module() for the requested
name before anything else, and loads "<name>-iosched" if no elevator
type of that name is registered. "none" never is, so every write of
"none" to queue/scheduler ends up in request_module("none-iosched").

That runs a modprobe helper which can never find the module, and adds
several milliseconds to every switch to "none", including rewrites of
it by udev rules or tuning tools that set the scheduler on each disk.

Return early for "none", like elevator_change() did before the module
loading moved into elv_iosched_load_module().

Writing queue/scheduler of a null_blk disk 20 times takes (median):

  operation             before (ms)  after (ms)  change
  none -> none                13.09        9.06    -31%
  mq-deadline -> none         11.99        7.96    -34%

Fixes: 734e1a8603128 ("block: Prevent deadlocks when switching elevators")
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 block/elevator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/elevator.c b/block/elevator.c
index 66edf1a5768a8..9d9b2e84a1288 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -775,6 +775,9 @@ static void elv_iosched_load_module(const char *elevator_name)
 {
 	struct elevator_type *found;
 
+	if (!strncmp(elevator_name, "none", 4))
+		return;
+
 	spin_lock(&elv_list_lock);
 	found = __elevator_find(elevator_name);
 	spin_unlock(&elv_list_lock);

-- 
2.43.0

