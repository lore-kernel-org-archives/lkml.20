Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792948574;
	b=hdsEnFA4wKMjx2Oduu8muRZoHnyPUmFDeb8r771lMpHaEr8xrKG3gYyOsLSYDk4I/lFX
	 87xQUL3V+pDGeRFffGaadCuHvgAjaeMH8zY1ijaZUZ1Leot2j/QKK7Z6VUTt6MvtMmoZW
	 MLzxXfRcGQ7vXf7Nak1sC5gr/Ld59gZk9xcSRGEX37l8tyWT9Xc1Qy6T7Kwzm4pEIRN05
	 RStneaSzn0eIAa61H4UQp2ol7Ap2NRgl687qaSq4sIFfHlh9E3Ienxhdz6j6DeugB2+5x
	 TU7i726FErZt6uuXTdw6spSPfcyxk3tfqayUtz83xUbITyGcupdDyV0QDO68MO14+7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792948574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID;
	bh=s0xqJx4FNZZGpD4GSNg7lqsUdPl9TgZ5j+xnD9OspHY=;
	b=c0ZB9xh3zPOKL8sews/18kg0iHd5FMAc0sMUviMGs+c/7SbXhXYTSZltCd1uaF2dgbii
	 jV+gAun3e1/ykrrpNt7LNDWqTRlpCyCDouKALf0wmDY6xWs7G28f4J8LRbkWBrswBY3Ey
	 yz4yRzyuifVUTyLKyQH6zVlXxAzHjHITlV3FxF7f4f6RZjR6DGqjXJopTdiLEqPKfNkB0
	 JYfZjjTnaAWogA5DOMwcUgA1lmuHW0qs6nMbdX6so3g1oAbtTrgTArMnK2+Htsy6kJ3bo
	 Q+LmHiblPtVOED3CIEVCRjdcKFSRnl1nLvRC08jPYsugxAjORQIs65JhnIIIAi9dCnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZmNYajfd;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B76606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZmNYajfd
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-19305bcb72cso1405062c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792948573; x=1793553373; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0xqJx4FNZZGpD4GSNg7lqsUdPl9TgZ5j+xnD9OspHY=;
        b=ZmNYajfdmpCGG3awDq1YR2Eu3GsbL3P45czbREob9AbZ32dVTNg5yiVd/BvjlgsSYc
         pw4TGqNQDTvPCvYbklFqGmwYb50mjjlYKeHSTdx1wtZZbPOuu9ElZPHowQoB6iPSbl5g
         IyNrQ6f5LKeULB59bMjHBNQU5W+1Q4uJgtKErjdSl78LO7uRuB6S39YkRSvMKI7Obmt9
         mLZ5aLyWyC5k2tWJgTNMH3/Z2aKy7EQG4LEJjpi1xBm1cmz5qCXm3kxGVIUK4e2sFvCu
         I4X4RIKrya+5fPa2vcOJbLJwkxRaTrYuFJk4dSox0BrI1da9p4LRId3j7vOgALO4bCC4
         o23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792948573; x=1793553373;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0xqJx4FNZZGpD4GSNg7lqsUdPl9TgZ5j+xnD9OspHY=;
        b=DwtUrtKRMw7mGaTGZcRyfMsYotI4gFmDvlyFpE9J8mmsCFpj/iFQ/nOBMqzrO0aj6o
         Oxd6W3F3Yl0wOTPUA1SKXeSsobaOd0UJiQ1a8VBpFqFXsA4+7C3sQcqA3/qt5hzlGSXf
         WYyPakHweB5Rqk2jnD/3JbDyZ8PLmlFK3y3EU4m3s4smz5BpbTs7nAS9SMfZ9t/G7oQ4
         RQ1gaCeDuO+28LRwUQUWNt8QoXZQoy+Pnu1NhAovNHcO66hP4JH1gUFeB3C2muEAvMjR
         eQcGpP773vUX6Hf11aLTRp3zprzRTPYhRXGImCeTN7Qf2eJ3HXYTLmfhHHOKiNw5GsMD
         s3Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxN+UTiuoJlRHEwqsDbjQvaYIDVJNu3HGio4VDIj85OdBYBtv+t6SlRxubMMvLjkMU+7H37ij9mcF5Ty7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5yWxn7qNYiaRZKPgD4dKd14y0RDGfnJOqkG9MNLa6Oa09UM6Y
	Baq709/8GTzsGhWp8AlcW+3m04uH44nwa4SpC9VpEo5gc4XS4mzTnBoR
X-Gm-Gg: AYBFou2p6xCPDS+DOQfN5AcUg/N/ysT0uJRoG972ysGe8CiMGno/0WtpAFoX+mTIxNL
	T8CI8xcnfcxrJTXxk8+3DhbjPOj+Ft+ObeIQwS0wZ6f209fqJld2RiTjbgUWiz5X2wh6+aocQbo
	Z+WAEK/PjdDwI0tk5NBfAbGTeKKjleOG66Mw/oAgnu36N8N4MkKbHipRSwc5v1Db+VmkboXKCW1
	QRqfudQ0FNQ2Fndq8JzMEKzzNWAVOuK4oD1f9BeSwsuUDp3iRzue5B5Rfwx/fBF0pW0lGDfy4zl
	C9itfgP4s4JNG3m10p2jXNA2kGOZun8puSkaXa6rSnzSdVTOS67qoy+kxaWCQJHgKhD6kYqtcRX
	PK66MrgY01CxzhJKiGhuDPuoHjp8swM7M1PSvQedSUqFrOaAnVi1c2cLfOT4MEMz1unLsLY0sOq
	+lv0Jp5RdLAdRCkpZoxM9K8JGzm6J+1Nd9kUpm6JYjtfrFNaHWB3L2jaKFjsrULkXlTIvnGZubF
	p0UqNHiG/5VGxGFFC4M5j/iXr/QnCAB+Hyv4W/o1yTJZhPa89sEUUPN8ZSa2g==
X-Received: by 2002:a05:7022:7f14:b0:150:c9c5:1ce4 with SMTP id a92af1059eb24-19928f1541dmr6475921c88.6.1792948572672;
        Sun, 25 Oct 2026 10:16:12 -0700 (PDT)
Received: from [192.168.45.62] ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19886f790e4sm17125652c88.0.2026.10.25.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:16:12 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: Alasdair Kergon <agk@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dm-stats: Avoid cumulative rounding in time conversion
Date: Mon, 26 Oct 2026 02:16:09 +0900
Message-ID: <179294856968.68681.9038736644973708510.c14-dm-stats@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

dm_jiffies_to_msec64() converts a 22-bit chunk to milliseconds, rounds
it up, then multiplies that rounded value by the number of chunks. At
HZ=300, the chunk length is not an integral number of milliseconds, so
the rounding error grows with the accumulated time. For 4,194,305
jiffies, a stats print reports 13,981,018 ms instead of 13,981,017 ms.

Divide the full jiffies value by HZ and convert the remainder to
milliseconds once. This gives a single rounding of the total while
avoiding an overflowing multiplication of the full input. Preserve the
precise timestamp path, which already returns nanoseconds unchanged.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU/KVM with HZ=300 through the DM stats ioctl
path on a zero target, using injected time values. At 4,194,305
jiffies, the baseline printed 13,981,018 ms in all six time fields and
the patched kernel printed 13,981,017 ms. Precise timestamps and
stats_print_clear also passed.

 drivers/md/dm-stats.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-stats.c b/drivers/md/dm-stats.c
index beabbe3b39f3..9ec568d120a4 100644
--- a/drivers/md/dm-stats.c
+++ b/drivers/md/dm-stats.c
@@ -9,6 +9,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/math64.h>
 #include <linux/device-mapper.h>
 
 #include "dm-core.h"
@@ -831,23 +832,15 @@ static int dm_stats_clear(struct dm_stats *stats, int id)
  */
 static unsigned long long dm_jiffies_to_msec64(struct dm_stat *s, unsigned long long j)
 {
-	unsigned long long result;
-	unsigned int mult;
+	u64 result;
+	u32 remainder;
 
 	if (s->stat_flags & STAT_PRECISE_TIMESTAMPS)
 		return j;
 
-	result = 0;
-	if (j)
-		result = jiffies_to_msecs(j & 0x3fffff);
-	if (j >= 1 << 22) {
-		mult = jiffies_to_msecs(1 << 22);
-		result += (unsigned long long)mult * ((j >> 22) & 0x3fffff);
-	}
-	if (j >= 1ULL << 44)
-		result += (unsigned long long)mult * (unsigned long long)(1 << 22) * (j >> 44);
-
-	return result;
+	result = div_u64_rem(j, HZ, &remainder);
+	return result * MSEC_PER_SEC +
+		DIV_ROUND_UP_ULL((u64)remainder * MSEC_PER_SEC, HZ);
 }
 
 static int dm_stats_print(struct dm_stats *stats, int id,
