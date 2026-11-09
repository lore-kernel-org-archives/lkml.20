Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265238;
	b=N9qPgafihmTgDRUgA9jzvedqMPOInffWzJpCmoKUZl8SBsTexzdquBmyZNhpiVVQOP60
	 K8iqvM9+Up5dsuw2qQIk7pVtjGwdILpbSqhqRN0l7+NmrtA2c+At+ySE9TQMQWSgM7rrQ
	 IkIEtO4wK+hUT5bdKVBLolinlZGgV7eo56NKiIJlTVv1LrehtfntEJE/ba6kO9lAQxo/C
	 xXXSqotXYkJaVJOdH7+uN0j1DtnedKpr7GAE+y0ngTMrkQH1wCiNgQBcYjjn9Hhft0oAR
	 CwjPbeaHceCthcecc4CHxLdP+QG8Ap5ahBmGpgOFH7K4PerXJdJOcatxDZnOxjvGSZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q/L8G+eYF1W07A363h374vBZx+sG92miBJ5CImiRZyk=;
	b=xs69w86Kjhi1u+Vmi68McCswBv5RuYtMFt2hnuNmSCsXVtten33iPpHbq+ISI0NiofyS
	 yRQ28RJNUAkldGGG68ZoCfCmJ9ycpnq4ox0GGI0Fj9WA5HJ2+2SOmxGjVvYoOrdoe0hn/
	 trScXDRcV88hWOj1PLfJXlCNSd2FroiQZB9D+PHprMGOe37vo+lR0C7tpoDvPyzkTwjzz
	 45S0TcSPIxy9TaVjW2u3PjhB64dWKShUF7EVIomxzfsYXnsn9yEuz2dm1H9iatVeQLo4L
	 8hQYzEtd+fSW7iDcDIZAb5kla4hxpQ8wUy8hbirZnUxGM1I75CNXwAbF9PIU7bvGBWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTP9NfKS;
	arc=none smtp.remote-ip=74.125.82.67
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61CB606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61CB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTP9NfKS
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1204822c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794265237; x=1794870037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/L8G+eYF1W07A363h374vBZx+sG92miBJ5CImiRZyk=;
        b=yTP9NfKS1OzVB4Wrk70HXAplMUaWBXG+TghqhxF/BIJjHjvPxml3jtpO6FXj5hS3K2
         cdv3Up4B+TmZKVyWDWlmhmoel+DRQNZObbOlYVdOaW50mJ2fBGlBsac57fSqQpLq2Sxp
         PvuTNIY0J6qZTRyVmsHoXCilPr1hYS4hCWtb48/mWeB137ZbWKjOS1M8QxiWuy/E1B07
         f8uKkzBuvFwFnX1ny7YaFbOeHD0POGSPVTY0SJdyl432Uxh4TCTLOs5Wtq5a1euWS9NA
         MzSUoGfSQU10WDgaaYQBrISXQ8w1ahnnQwWOLguqkitg+4xu2gl8QS2zL0DrJ1JBffDQ
         rSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794265237; x=1794870037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/L8G+eYF1W07A363h374vBZx+sG92miBJ5CImiRZyk=;
        b=vdGiYdn23Upq8XDartES5kOwBUKgmNWEbx5mPr5kNiGF/ekOTMyNzvp7teaqeLCpzo
         JesTvIOXlyy0EeHQ3orbBNsnRJp+WDOcBYDVZWXlDqZNcHAE6D+SCDU8ng99In27shi6
         10mhfb6y/XysmZ9yp8y/rrnxwsmMSJrRcq+BnyZAWq0bvb8FhahoGBLN0sG+PRb62zDq
         FX8d5hbDg9TZbyWMPj2cLzkrxHvGkntilOARI2J/rNrs+xIl/dP2OmZnkEjwWKPSYTwt
         kJyR/qtQv55uC5KQlCS6VeFCq9grlZXpf4nmKsvaWjqa4/GUkhQT3UplnuOZWmQtgXSI
         DQKQ==
X-Forwarded-Encrypted: i=1; AL+hErGgDj4gGqoodUTOnENTcaySFlOavOU727mtld90ZMtAtWSlHJvvVXmCmMF8AlurMD68EGwxWmYoGsOZtXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O3S+KfJUrpzlgfSAGaZa8WDu/uX+cN0X6uFaVD9viRbkLCc16
	EuJEplCHxH0ywcWeoBNb0YktKqxsX25Joi4O5wV6ga2vO0HAJd3d7VkI
X-Gm-Gg: AYBFou2PmTGkRhMy9FpeosEEJ1sBrxCOIchboZluTSRSdaFnzFIhmoQuNQ43YV6fWs4
	E6p6wb3N3NnZFFZ6XNRq4m1jwpcR50EdpHHIPr5d1i5ipalJpQP9ReBWRo1kKaPkN5hVAw2P0Yq
	zi2Z2qgyv7yddidhu/JwDWKRlh7xFDP7VVDk4lTSugQjSIWbzch0xM1rm7ZvB8q9lXCO5+GYxIS
	igMhQ8/B+0NTEBpQsyzeQh01Zk/X9nDRjeEopq5lzhzUWY1ewxmcsQVOY6JcBPX8w7z0zeE1GDu
	p272p9xjENiTGHU9tKug+rVRw6itgev1W5TiVwMzC3p+7rddBBz0XDaz9Is3QZT2FJQHDQKaEPQ
	cxbccaPMW+34Wu2Mump2/Ptyjza9IXuN0vdOyeqNM3lBHZGQ7WOfs/g5tBSupXt2cxJq6JRFdk0
	kWDAOKGEvcgSFfXgW33s/UmKNTCfmdgx3lM0cfg879t7YY2iy4rEIoplUWwYOeJRUGv7xgd+jFA
	46AqgEDwsl4Trxjn5XYsA5iJutzmV1wvRjF7nSlSvnpiuuOIWZtuW/0JoYko7h5HjNlTI4g9c84
	o6I/mozUx6hMHUyEmPx4ViZEHWDxA3ZD7ShmyGETFgd2CMVeIipJ3ORX3Azy2NXeuZ07SDPsoTb
	yrOF13fR9D4CLXw/CTfXrZa5iGi9lC6t3OhjynA==
X-Received: by 2002:a05:7022:211:b0:1b2:581d:5dc7 with SMTP id a92af1059eb24-1b3b5e6084bmr1512349c88.25.1794265236538;
        Mon, 09 Nov 2026 15:00:36 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b79649sm2177332c88.21.2026.11.09.15.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:00:35 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] dql: Reset the adjusted limit when resetting the queue
Date: Mon,  9 Nov 2026 23:00:22 +0000
Message-ID: <20261109230022.10729-1-dennylin0707@gmail.com>
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

dql_reset() restores limit to min_limit and clears the cumulative queue
and completion counts, but retains adj_limit from the previous queue
lifetime. dql_avail() therefore uses stale credit until the next nonzero
TX completion.

Reset adj_limit to limit as well so that adj_limit = limit +
num_completed also holds immediately after a reset.

Found by code inspection and reproduced with QEMU virtio-net TX ring
resizes, using identical reset/completion tracing in both test kernels.

Fixes: 75957ba36c05 ("dql: Dynamic queue limits")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Target net-next and drop the stable Cc, as requested by Eric Dumazet.
- Add validation results; code unchanged from v1.

v1: https://lore.kernel.org/netdev/20261020230358.6649-1-dennylin0707@gmail.com/

Testing on Linux 7.4-rc1 (6628e7d4c6b):
QEMU virtio-net, TX ring resize 256 -> 128, and real UDP/TCP traffic.
With a low-priority UDP burst followed by a high-priority probe and
QEMU tx=timer,x-txtimer=5000000,x-txburst=1, median probe RTT was
349.15 ms before and 12.09 ms after the change (12 trials per version).
No consistent TCP throughput gain was observed, including 64 MiB
transfers with normal TX service.

Rebased onto net-next fa5196392691; the ARM64 W=1 DQL object build
and strict checkpatch passed.

 lib/dynamic_queue_limits.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/dynamic_queue_limits.c b/lib/dynamic_queue_limits.c
index f97a752e900a..acef6a35ba3d 100644
--- a/lib/dynamic_queue_limits.c
+++ b/lib/dynamic_queue_limits.c
@@ -191,6 +191,7 @@ void dql_reset(struct dql *dql)
 {
 	/* Reset all dynamic values */
 	dql->limit = dql->min_limit;
+	dql->adj_limit = dql->limit;
 	dql->num_queued = 0;
 	dql->num_completed = 0;
 	dql->last_obj_cnt = 0;
-- 
2.43.0

