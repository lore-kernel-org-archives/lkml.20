Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230805;
	b=GGgcj8droq7JBz3bZYRKEH2L+5GQU61Yj62+eABBee2VoMbyV7T/3INYPaTrITe2oxZZ
	 2uXVftYUZOlt0L7EtMGpuvUOIEEcQfexDnag+lQuWot44pFNH7NL+t2L4FV3rgTAabQ89
	 luVuDJqpHeO0xcifAHR2l7ydVktJPgyo6QcOVie+GJiIQs7PHiGNrvj0kbNLsIl/c63OX
	 9X/4iyq011uY2qYUmRrrvHEIoIdAEWyJpWYypopT8HCPVQhVqTEHXWpUAgjvK3sI2hFvk
	 FKlgmnpd7mmpmKrzyzop3kk5M/01hqdT61/8nT+fwoQeG1twZeKM3b+ofAfOuqN8JXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wb36d59tOa1goucfW7M19URtNZys+/DAbWnPAmZ/x54=;
	b=eS11HWV5vqmTERb9mkcVo7+mdZKF6WDOGi+0ZqbgvxHOCqmVbtnAqwys1beMOB45zSYJ
	 wuneI5VfYFVSvwIpviU/8DJs9Ph87Y/9GMMvlrBZ8uEUmranryBrs6cu6j75UYoNZJITQ
	 q8vTuDeBxrgCq6PAoGjkGBQHOeI9ttZ451X0Z2zwmFw8dBsuxAYHoRXFlhbZgSb+qUyMx
	 LGYkn/WQajiW6+DDqQXKGlqRsGXUv34Vyh/ZgouXqRyfwHMQEAmaaMwDwqEQAUrNhhMuK
	 wfdVrrExjZedAkG/pjL0qSNXoFbRdI6CuSTIDMTggupfediGdNQItirxDiwwzcWHdLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQoj7NmX;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89187606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89187606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQoj7NmX
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so360910b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230805; x=1794835605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wb36d59tOa1goucfW7M19URtNZys+/DAbWnPAmZ/x54=;
        b=IQoj7NmXTZ+PlHV42kJdLzgYj7aWszNCpuFVutnju9Pptd9nMwXi/+sNM/fQ6kuaMu
         LeiRDUn8kLwEJ1PzbGr6d2MGUmGoGDWB9y1WdYy/VJonUHVI9l/K1OzJSJ4Ftd8Z7XZZ
         8IkFjuBbeioJYU+IVBMEWRIVGR9tQ3L2DKvKmt4CFzByIaQuvDo6o0Bjh8tuP3SI/QIc
         8ew3Y8oxg4FkW+/zBuEjPpmAKmBpGn7qzIYebco5b4qR9KCgN12b1BbT5lLmFDwxZeWb
         L6SGe1tibHbn/43wi+bfRdCk4TyCQ5zcOLvgw0R+GgnssfTXfIPR1JIFPsFZQ2yztEZB
         F3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230805; x=1794835605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wb36d59tOa1goucfW7M19URtNZys+/DAbWnPAmZ/x54=;
        b=UAngGFZjYOxTCjr7m3lHqGmKc+erxp69qr2OhWmy1fkM3EbUypKtUn/sZ08YbLwA9U
         mHQzrEoQWmG8dOOL+85d3ItwAauysToFBOlV4NHq4gbg68wd4xu9HVw73fU/SHCdBmZO
         UzlvTMZ2LQ2sLyzMaXV0Vpj/EmuTiUNxnAfF8/1fiOWRfDVpT3M0pJdN3/FO1V7lcnw8
         Ac4MU9S8RJkV5XnLXr09QohWiTbGT5cNDWMgQfIkPsfu7GOViDtgcarB83WCIX/kJQZY
         mxEZF95LduGXF1oGFGBKEf4C4wiDakDBsbMIwX34puL3t5lgt2SmP1c9G8Y4K7YvSPln
         vA2A==
X-Forwarded-Encrypted: i=1; AL+hErGTkF8WTCwKyWSly78n6v0/2N/JyBsoEMfKdtIv5Hq3z/E3RcM8160dM7qbECwkUm6zngldccTWJImyJEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8++EdUrcN7vTQR74ld1WgdjL0KngHVR9MpQAwpW1cnritvAae0
	clHz5nesM1pP1QNPDNdftzEqjw+xGlFpdYbaURINsWTysH6icHjrhQx0
X-Gm-Gg: AYBFou12E4VjKxcIFnGKmQIKB/0UfQ5FDs7hOf7iOLGcM6/cb/OeGo10zlXB5ruc+Dh
	L+mq0Epb1CoDnpC/mfAve+zsDI9D0uLg+gdlD6i2PbsOzUUJIx/kEwktLSZmEVH4/mpV04ltuEq
	ZTYwtlaQRHpU/QUk+ymGPtTEpa+t9t+QPFeFJAPpIjSzWtHUlmgklYEXHJQi7WNvNTuLAkH8iBd
	o0sHc9QfK+BBouCPtarGhJ073RN2FE3xZhu0NAiCVMusAcooX2KbqjVGGDcLIC9O6wZmrwVOjbN
	81/gAItr3Gs12GVEJ5XziyAbh6v8VT+4SQ/tNnIeY9a8SvU/E/Wg7X6qpoKBX5o86z95CX7bSe3
	dwzln5CiNezdiEyiR421kw2ClwmjnkVcEj2FcCb7g1dn1OSRVJxo9vrDywug42Rbqui4HYTuCyn
	NusyNhwxHr6OF7CD2KxlnsSexmGnRrsqKGRFmqnDOBXGz25oxWCZYgMqFJdan7ih4hlDoE0b3hE
	tPyBYIa3BqsA3ZT/060Shgr9CDtG40KePQQH7F9HO3woz0lP5qEYQ+pi9sjSmgpkjLfPc53HdV+
	vq4VgXOl6//OPfIrMogB/N19eKK5wq291g1iq/x7/FFk5dzCEQjA9OSSsNr7MeRkEE9wWQnOzhd
	alhB8a2lO
X-Received: by 2002:a05:6a21:8217:b0:3e1:c716:3a00 with SMTP id adf61e73a8af0-3eed3013545mr4660990637.53.1794230804815;
        Mon, 09 Nov 2026 05:26:44 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:44 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 2/6] fs/resctrl: Do not update bandwidth from a failed counter read
Date: Mon,  9 Nov 2026 21:26:17 +0800
Message-ID: <20261109132621.3862497-3-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

mbm_update_one_event() reads a monitoring group's counter once per
second and updates the bandwidth used by the MBA software controller
through mbm_bw_count().

When the read fails, rmid_read::err is set and the accumulated counter
value stays zero, but mbm_bw_count() runs anyway. Subtracting the
previous sample from zero wraps to a huge value, which becomes the
group's bandwidth; the controller then moves the control the wrong
way. The failure is reachable with assignable counters, where a group
has no counter for the event once the shared pool is exhausted.

Update the bandwidth only when the read succeeded. A failed read keeps
the previous bandwidth; the counter keeps accumulating, so the next
successful sample spans the failed interval and is larger. The
controller steps down once and recovers on the next round.

Fixes: 2c272fadb58b ("x86/resctrl: Compute memory bandwidth for all supported events")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # v6.14+
---
 fs/resctrl/monitor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index dbc6770508e6..2319e8e619bd 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -788,10 +788,11 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 	__mon_event_count(rdtgrp, &rr);
 
 	/*
-	 * If the software controller is enabled, compute the
-	 * bandwidth for this event id.
+	 * If the software controller is enabled, compute the bandwidth for
+	 * this event id. Do not update it when the counter could not be read:
+	 * that would store a bogus zero sample as the previous bandwidth.
 	 */
-	if (is_mba_sc(NULL))
+	if (is_mba_sc(NULL) && !rr.err)
 		mbm_bw_count(rdtgrp, &rr);
 
 	if (rr.arch_mon_ctx)
-- 
2.43.0

