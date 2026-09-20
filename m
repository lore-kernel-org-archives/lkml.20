Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9788B3C7692
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924180; cv=none; b=nfR0IHa3GY9BsdISuYBYPhGJueOmzZ1TCXqK+z4i6g13vX3sjGd8bZWJqXZ8VvXOfS3J0r7f9sXZk+YEXleiiK22LOhn/NDscoCMY3t5HlUu/7C69VTNqW9O9u7+QmVYzAx+g5bO54iIFub8B+EbaYx8J/NS6hqrfxtxl3ct6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924180; c=relaxed/simple;
	bh=3jDi5SqicaQDr/q+xtWz6hyHKp9Lb3qeMrWM9Ne+FyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F58i6hTwzK1drz+jCLsuGKXYhPjcpBhniCiwM6fA9Z5pOSGagmVpxB/5/OB4Ef5R96TGiBJfKiIkG0TC+vl7wYgDSavBux54Q7s9UDaqYFBVtbQUi+mKBzEhCEzE3an6ckvSDZBztjSXBwCB6orwHnipmjV+ws9rBZoOXpCoovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyfoIbQb; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyfoIbQb"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caced6038eso19377885ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789924179; x=1790528979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9MS2QQz7WOWtVtAEmjB/fcwAovWl61kZVH7rm4ugI64=;
        b=jyfoIbQbk4C1UQXgNirez/xwnyzVuDa3YaDX+DP7+8j0IKFtIW41OPkjVUQq/Q+lJd
         /P+Lzsi7KCx14Ui2cgjcCMtMJYielYVq4mTtnFP6HdahFpUZQT+t0MgJECy3O4Wph5wS
         SW785vXSfbThwYwNg/600mIozcYAUUgXjnuRwFWpK7Y7R82fU9hFDV4Aj1cIHzbsoXL4
         7iNiPLLy1AV2QeDXOWhN23tYVUuaFdo8X9AQqDb5O3x6Sjqu/a3BuOamw0jSQPK5qDeA
         dXDDHJDGWZeBlbKLxhRbMkqVB26Fua5B4CyKwXSYtDiaZmxSNQIMwqbTg8VugDcP54ex
         NLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789924179; x=1790528979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MS2QQz7WOWtVtAEmjB/fcwAovWl61kZVH7rm4ugI64=;
        b=WmuD81JplETAcGudu3YCTscztGQ3f4nMgSX6CrfmMXarUUOPXYAK+15W5v/jxFu/iT
         oNG7z2ddyBEsxf7yZLhz3p59rbvUk7FW+t0tNB79k1Tlym9DSd1x7o/5NT8QZD1vPugZ
         /eVSFp41HE0GpNUI3LyE8p0fhiw0wNiJXPkvSQ0JVLCtEOWSNKFTuwnPbnqfDy0kZf6m
         YjqVrItzAJaDt4XCt5xlWKTyvu8npWdmkiIW/+l7gqqTAeYbHHLbXDHyFNQ5Mvkr2GWp
         RyDg4nVnyHxGj+Z9WwRCthbsEDXuQRrfTaDSto9pMf77/5Gvtu4pxk7P6uAGp0dTjU/q
         XCXA==
X-Forwarded-Encrypted: i=1; AKwUvBz+VwMo9IOkOPhsC99g+7bCXimIFQY45tClWRHbYlzZXMcZuOakQ0TiJh59OqjQ79RaIrSboXqL/gvzKYM=@vger.kernel.org
X-Gm-Message-State: AFuF++nztc8bqdkoYvpU9YtHFRQq0zwLRFO3zq2B1nwlr+EsMOLoZAcQ
	ikJ4vIfqyRjAvMGra/JVYbyQWpv5J253IdyTXGQ+N47cRboacPLZUYUT
X-Gm-Gg: AYBFou2H0OEjhh7Y46B1Sn7ecJaiTcg1MRzWF/o02+mC5IDNdp8xdiAYaIfVwrPVmRW
	10e/ulRtgfNsLQ96aeHLHDOtp6NoRzFHMwtbYctndKx8ygM/BJWPFTrV6Aiz+uCIw7vA0S/GrBi
	/vGSPEjL6E7R1A2Cgg/Yr4w1GJmDwnXwi0/YyX9DjR4aghkdHBEG+Q7LKDUxvY4ez2AFecjJx7W
	ZRBCVqxJBHrfcSx840wMEby6HBfU4k2FYNTyE41gWgoBdpWBBvfPj2eUKfxdFlXPWkcQ40ZWy3M
	UDsza6Bhxr4ahRjWnoKUl9Kh3yG+ioI7T46uWyihzJsYc2+7Kob97ysH0RsRDvhL+ZFIdKSNPlg
	aaYWtslBd0hpM7bjyLhQhLwyo0UMigGV7Mo9xI4KjYeBylFsKmh9oXI+zK9sxoFKTzJsr1gDeub
	XRg24DK/EFUT+DZtTXWaZ8zws3czexDYGxwW8v/iiQwMcSE4vl+Gx7pggYmkT/Jlo=
X-Received: by 2002:a17:903:3bc7:b0:2dd:ad7d:72e4 with SMTP id d9443c01a7336-2ddad7d74f2mr119017265ad.27.1789924178887;
        Sun, 20 Sep 2026 10:09:38 -0700 (PDT)
Received: from adi.. ([122.171.21.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a12bsm13146327eec.9.2026.09.20.10.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:09:38 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com
Cc: linux-wpan@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adi <itsadi2409@gmail.com>,
	syzbot+adb0bf16414b8bb2d799@syzkaller.appspotmail.com
Subject: [PATCH] mac802154: synchronize pending transmissions before stopping the hardware
Date: Sun, 20 Sep 2026 17:06:55 +0000
Message-ID: <20260920170655.608419-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adi <itsadi2409@gmail.com>

syzbot reports a WARN_ON(current_phy->suspended) splat in
mac80211_hwsim's mac802154 counterpart, hwsim_hw_xmit():

  WARNING: CPU: 0 PID: 6038 at drivers/net/ieee802154/mac802154_hwsim.c:266
  hwsim_hw_xmit+0xcbf/0x1540
  Call Trace:
   drv_xmit_async
   ieee802154_tx
   ieee802154_subif_start_xmit
   __netdev_start_xmit
   ...
   packet_sendmsg

mac802154_slave_close() only calls netif_stop_queue() on the closing
netdev before tearing the hardware down via ieee802154_stop_device(),
which calls straight into drv_stop(). netif_stop_queue() merely marks
the queue as stopped; it does not wait for a transmission that a
different CPU already passed the "is the queue stopped" check for and
is currently executing inside ndo_start_xmit(). That thread can still
be inside drv_xmit_async() -> hwsim_hw_xmit() by the time drv_stop()
runs and marks the phy suspended, which trips the WARN_ON() (and, on
real hardware, could still start a transmission after ->stop() has
torn down the transceiver).

ieee802154_suspend() already knows about this and synchronizes with
any in-flight transmission via ieee802154_sync_and_hold_queue() plus
synchronize_net() before calling ieee802154_stop_device(), releasing
the queue again afterwards. mac802154_slave_close() is missing the
same synchronization when the last open interface on a phy is closed.

Do the same hold/sync/release dance in mac802154_slave_close() so
drv_stop() cannot race with a transmission that is already in flight.

Reported-by: syzbot+adb0bf16414b8bb2d799@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=adb0bf16414b8bb2d799
Signed-off-by: Adi <itsadi2409@gmail.com>
---
 net/mac802154/iface.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/mac802154/iface.c b/net/mac802154/iface.c
index 31353795fa24..e29f225c0dd1 100644
--- a/net/mac802154/iface.c
+++ b/net/mac802154/iface.c
@@ -313,8 +313,19 @@ static int mac802154_slave_close(struct net_device *dev)
 
 	clear_bit(SDATA_STATE_RUNNING, &sdata->state);
 
-	if (!local->open_count)
+	if (!local->open_count) {
+		/* Ensure any asynchronous transmission already accepted by
+		 * the driver (i.e. past the netif_stop_queue() above) has
+		 * fully completed before calling into ->stop(). Otherwise
+		 * drv_xmit_async() can race with drv_stop(), which some
+		 * drivers (e.g. mac802154_hwsim) do not expect. This mirrors
+		 * the synchronization already done in ieee802154_suspend().
+		 */
+		ieee802154_sync_and_hold_queue(local);
+		synchronize_net();
 		ieee802154_stop_device(local);
+		ieee802154_release_queue(local);
+	}
 
 	return 0;
 }
-- 
2.43.0

