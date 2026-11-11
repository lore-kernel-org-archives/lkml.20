Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378505;
	b=wKzeBPHwVPUcXOPV4aecypL+MHLiTWN63A89QWaQQr/CQ987VnRN3LlcjltgrnzpaFcj
	 /4LWQlA9IYIa1RyZ96sHMl6T3mgfgAPu2b5qD6Qdd3jyQtC9H+7YA2StVs8bPeSA4g0Mz
	 jTN8/kFMnwA0LC3N5pFCd+Gli1qc9wQYwzes4HY3I6V8r7flOjf0eHLbGfhR5L8sTUHRE
	 gFuun+S3eGsHPBikrBM7zpQVGnImF73rCBKQFHIbKx/eYxIoa5bFlBgfCMvkkc71joK61
	 M5NBfLeM6dOIFOx37S+qg+0Ib/A2PYeA768VPCwgKBLn7Cg0Pfg03ertQ+Lii/ylYmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378505;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cU/O2FFxpaXw44sYdV0PRaEcPgZHOtMFMkcpzuRa/Gc=;
	b=2vxpy0XeTc3YIoVgX3Qvd5LxVXejVeEfaLu4d+DKBw7IMCVHSFakdnzKUaaFnQPkEQnA
	 HYMY8/6PV0B3W3Afb/ce13m2B2uHsdaRV/KZIdGCCx2mkOoiHxi/mi5OVb8f9coWVa23n
	 zLIUFmRGqJFzSVIwrVRMjgL5iTUU9YCN8po0J/Y884G5I+IYj0fq7NAu0ka6YT6ZWPphe
	 AOhH85gIDmmvp5fLZyWkv20hrDngzggac4Mp2WosGDXJE2ytUS/OKdnxLzFMhck1fj49V
	 PWHpH8ik2OO5+PPPxTfJt19LFjmWmi75GCa1j6QNiIztk3wbUU8EY6OhtSTRYwJ6RjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vgokg4Fe;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC324606A31C;
	Wed, 11 Nov 2026 06:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC324606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vgokg4Fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vgokg4Fe9AcwcbMm2vKQBwOKt4OpNzV6g5G2Mqb3Z6Oj73B0CZTBlOAbVgeXGL229BSuNUND0ZJX5
	 p1McNGjT2+toQCq0q8eXqdtjDdKav+VwDmHEoEFt8M28Fi60j4rH/AuuQ6wlj/t5U1tu7zBJfCD9hO
	 gPoGoAR706Gw79jc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af40aeae5b-74cf6;
	Wed, 11 Nov 2026 14:27:54 +0800 (CST)
X-RM-TRANSID:2ee46af40aeae5b-74cf6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af40ae84a1-d1470;
	Wed, 11 Nov 2026 14:27:54 +0800 (CST)
X-RM-TRANSID:2ee66af40ae84a1-d1470
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+07e19b8c2cc07b864477@syzkaller.appspotmail.com,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH v2] usbmon: mark concurrent accesses to the monitored flag
Date: Wed, 11 Nov 2026 14:27:52 +0800
Message-ID: <20261111062752.16802-1-zhujun2@cmss.chinamobile.com>
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

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
Changes in v2:
- Extend the Fixes commit ID to 13 characters to avoid ambiguity.

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


