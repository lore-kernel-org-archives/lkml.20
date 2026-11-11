Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368502;
	b=1epBO5OSAxJzzte9bguVCqZLR4xzzAS521oxF81bEw1wdXU56tgqwwDZg278ELqk3fa6
	 RqMVuyZ4gBx4XVY4IhGRM3fS5Zb4b9+Ot0dLxwAveCEBxQU/wAmYvmz1AgsLB6Nz+QzST
	 btBf1wU6gIpdnp7mstxOxY+SsT9B/6DCjyjGe1NJwwAZYHbMLON/YuUE39TiHlSLLSd6a
	 a526VZGFO0HcvmaTL+QvSc4XOw+vGqt3cBsbg5DcNmJPu531umBDfmauoknbC9p+/xfvS
	 PbyLTB0RdMK3UqhPfuz59/h8sLmZAlatQzjv1HBnosTiCNQCqMmrFBh2xLQsnbI/AKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368502;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gulYJEcmm62CVnL85GlztcKbe8sfBORdQLLpw6fCgY0=;
	b=uBrGEBO8Yz1lYL8a+CmeR8AOOP/T5j1zNgrXHDuzYF++dLW+XpF7+wh78G43DxliMfF8
	 9DAK0ZpnMBVsJqzvXwfVQqS4q59KdrksyySyYj/TjCtb71NbkiB0+F+toLToQfNG3tBvN
	 cMsoV9vWymNQGW1flz5Q2bk6/oPKdBxzuaDAifSXVfmqmOE4IKxiLyd2UL8rFJ4uJsy+t
	 wVnSZrk/1zUaXdiSnt85RRDr/amN2KANroL54c6PevxmozqBVAIboOFxuckXmuMgh7DTr
	 XjdLEttYcjecwJwW4X0P5SVFQinMNY2zbLP7YQgiyuaHJThde5nBtoRxPtTwb+N3AgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZTApaINT;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9C6606A321;
	Wed, 11 Nov 2026 03:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZTApaINT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ZTApaINT0BAyVN+atX0/QXbBfTMFm3Sf+kMj06yn0G60eIADgV+UbaLpbC62nvzKRrPiGEpN+6o9B
	 aM0nhDJyamJp37Eyx+Pkr1fHB/QwXmM/JUJY022oKEtJYDICPAYLFNLFyruSrof9H7RllFZOCZXsXS
	 DqV7KhYXGGfmQfQQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af3e3f3733-9ff5b;
	Wed, 11 Nov 2026 11:41:39 +0800 (CST)
X-RM-TRANSID:2ee36af3e3f3733-9ff5b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af3e3f12b8-cd383;
	Wed, 11 Nov 2026 11:41:39 +0800 (CST)
X-RM-TRANSID:2ee26af3e3f12b8-cd383
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+07e19b8c2cc07b864477@syzkaller.appspotmail.com,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] usbmon: mark concurrent accesses to the monitored flag
Date: Wed, 11 Nov 2026 11:41:38 +0800
Message-ID: <20261111034138.12642-1-zhujun2@cmss.chinamobile.com>
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

USB submission and completion paths read bus->monitored without taking
mon_lock or the monitor bus lock. Adding and removing readers changes the
flag under those locks, so the plain accesses race, as reported by KCSAN.

Use READ_ONCE() for the fast-path checks and WRITE_ONCE() for the updates.
The monitor callbacks still serialize access to their reader lists using
the existing bus locks.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/usb/mon/mon_main.c | 14 +++++++-------
 include/linux/usb/hcd.h    |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/mon/mon_main.c b/drivers/usb/mon/mon_main.c
index 600c9de84c7e..e6fff0396a18 100644
--- a/drivers/usb/mon/mon_main.c
+++ b/drivers/usb/mon/mon_main.c
@@ -44,10 +44,10 @@ void mon_reader_add(struct mon_bus *mbus, struct mon_reader *r)
 			list_for_each (p, &mon_buses) {
 				struct mon_bus *m1;
 				m1 = list_entry(p, struct mon_bus, bus_link);
-				m1->u_bus->monitored = 1;
+				WRITE_ONCE(m1->u_bus->monitored, 1);
 			}
 		} else {
-			mbus->u_bus->monitored = 1;
+			WRITE_ONCE(mbus->u_bus->monitored, 1);
 		}
 	}
 	mbus->nreaders++;
@@ -163,7 +163,7 @@ static void mon_stop(struct mon_bus *mbus)
 			 * We do not change nreaders here, so rely on mon_lock.
 			 */
 			if (mbus->nreaders == 0 && (ubus = mbus->u_bus) != NULL)
-				ubus->monitored = 0;
+				WRITE_ONCE(ubus->monitored, 0);
 		}
 	} else {
 		/*
@@ -171,7 +171,7 @@ static void mon_stop(struct mon_bus *mbus)
 		 * a reader staying across an rmmod foo_hcd, so test ->u_bus.
 		 */
 		if (mon_bus0.nreaders == 0 && (ubus = mbus->u_bus) != NULL) {
-			ubus->monitored = 0;
+			WRITE_ONCE(ubus->monitored, 0);
 			mb();
 		}
 	}
@@ -188,7 +188,7 @@ static void mon_bus_add(struct usb_bus *ubus)
 	mon_bus_init(ubus);
 	mutex_lock(&mon_lock);
 	if (mon_bus0.nreaders != 0)
-		ubus->monitored = 1;
+		WRITE_ONCE(ubus->monitored, 1);
 	mutex_unlock(&mon_lock);
 }
 
@@ -246,8 +246,8 @@ static const struct usb_mon_operations mon_ops_0 = {
 static void mon_dissolve(struct mon_bus *mbus, struct usb_bus *ubus)
 {
 
-	if (ubus->monitored) {
-		ubus->monitored = 0;
+	if (READ_ONCE(ubus->monitored)) {
+		WRITE_ONCE(ubus->monitored, 0);
 		mb();
 	}
 
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 181db044c4d2..ce4525e4289b 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -720,21 +720,21 @@ extern const struct usb_mon_operations *mon_ops;
 
 static inline void usbmon_urb_submit(struct usb_bus *bus, struct urb *urb)
 {
-	if (bus->monitored)
+	if (READ_ONCE(bus->monitored))
 		(*mon_ops->urb_submit)(bus, urb);
 }
 
 static inline void usbmon_urb_submit_error(struct usb_bus *bus, struct urb *urb,
     int error)
 {
-	if (bus->monitored)
+	if (READ_ONCE(bus->monitored))
 		(*mon_ops->urb_submit_error)(bus, urb, error);
 }
 
 static inline void usbmon_urb_complete(struct usb_bus *bus, struct urb *urb,
 		int status)
 {
-	if (bus->monitored)
+	if (READ_ONCE(bus->monitored))
 		(*mon_ops->urb_complete)(bus, urb, status);
 }
 
-- 
2.51.0


