Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535203A5453
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681307; cv=none; b=feGln6pQ9cuQsh3qptYZJ1YOM+g5s0SVqoWhTCkbNkSVisiuywHQrKyYfLRMMdr+PlTU8JkHImoLphsFKv3BwvyZEFhF0eUpk35bSiasg3+DMWsfikHB3iH3WGQiZ4Z02f9Tc2RHl8VM1mBBO+L842Pmx725uDojCNZtMcqk0tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681307; c=relaxed/simple;
	bh=7x9j/mQkz+9LqO2zN4yz7ILszVlzJ5BNxaCgRcCzcXs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lv4z3lSzIl9LTUKk7JxmRta9ceFjIwH6L+HsZgBE3Ww1QH+wxGdD5bzxsqKa3TQrj55ty/SDnZ4YHTYuV8pxmZY6KOPh9DDqa+5lPzx2UZ8JWl6rEW6l5i3enG2rqWFZJcCCrBb9/NGOiVRN8JVqPdmXWXiVIxsX+yqeZli30xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZUbOOzg; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZUbOOzg"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso3172795a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790681306; x=1791286106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uJK2jAccBhhhLsB7fWlTzcOgHsYndkPD1RuUGHrRxs=;
        b=LZUbOOzgsSPvc5YlY72gVXwGlZCyETCXSaZxJYP7Om3RW5V+diDU21vXPPzFqWi7/c
         dLlrahJ+5qGHaGqt2mbE8DZpqBZpZy/3ain4IJOMljspy4AGYI+txrMDnQcfmyPQMBWR
         Wf00lHrAaEKNbhZwNpfj+2W0iOn2xP+jrQBbI37IYsNrLEeh9ls1HVOK0cS0svAyGhMX
         uYsXBY67dsI2mBLfAK1FRArj6aEv9Ooip8IgjTxbJc7ryZrgLA7G7bkKhv6jCvDF31t1
         GK+y0g0CGcf2amGLlPpugmBHImpRrgab0lZSbuj6MBoywxZRRGKtoTIwHECM4HwOnnYX
         b6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681306; x=1791286106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uJK2jAccBhhhLsB7fWlTzcOgHsYndkPD1RuUGHrRxs=;
        b=2a9sRNM2O/fc38uzG3KSbOKCxyGxrfzaELAqggNh96c/+yMHpB1HNJqQuLGGsqTHA4
         dIIRr6PYu5Ow9tVV09dthT7AgE44M3cDkmkgvSS+IL2Dv097rSlUSG0tLXIJWvnd/BgM
         bLI912CToC/ilJsE6L5PH9NmmB8LT2LlzF9DjAoHIDIo3tPQxurW2PFNtuDxHK8PcdkR
         0kQIkxi24dvrkg0a8tBteqoQGFU2argk+t1hQvn++qxauq7zsDt7r7QanUswBPuxgfl3
         /8dKI20u45Hhss1v6izm0IyuqMG6cSjp1fG0M1/PQmVr7VV52ZCifdQQH3htj7xkBZri
         FnGA==
X-Forwarded-Encrypted: i=1; AKwUvByRmSHYyFEoIQxQYq604VdoxQJYDb3LuBALoMz1+t27dR8jDMDYjx5fgDe8aXjqtKYeQdqQIMMsQFN1hEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYID+dzSr5k7VXxc6e4wO2YOq5UWT44r8OH6UXx8oVhWPjZeyL+Y
	FpESb73LDEKKNNFSd3sukYNoOldWbyPxpdGXl4bn4PesnSrqvqd16HfS
X-Gm-Gg: AYBFou2VcCnJh/LXCKHWrWee7VSVNfM8gbCW3Ax1ZSDnE8QcyjBjw0bgaBohqEXCqdW
	SRT4O0ODoI6+1SxmVUgYRihKb60wV1YYoROwfh6uMx2GnD32sgBy4buLOJpv2UW/NEkr+U/VNNw
	1H3VZjR/RZbZVgeFc31hbLBj6HNXXcaB3cZgN8U14iKOxQmpoTmcdRLBmzJXo3gwV2cG4ITo/Ou
	5G18KYPgaYR/2+5dzwwToCxgj+eHeuTpOb9pwhAozxzDzZw8QhR4sAiiDV3VhBkSN/CRtUkXjLq
	pnkPoUuJjEZT8+iGwMCnbfURhVyhZxLNiWbFRRhyOse4w0VGJs6KQsEdF+e2xIcHaN8w6CR7qhX
	Z0h3/wystfgmf/TNq/gBIlf78WysTapZYbPRUjmP2jgG9OK3MldlSSnFQoPimRf0TKfrNJucp2X
	Krsec49aVdDdmBb/KLeM8wMnL8DmIINk7mayWx4hMpV+pNWp/rSZql7sj1H4vqEZGnCYTOdu7r3
	IOmbtKeb5mTmMFuHsfFzpk=
X-Received: by 2002:a17:90b:574d:b0:3a0:2900:f584 with SMTP id 98e67ed59e1d1-3a099230a7fmr14962078a91.46.1790681305497;
        Tue, 29 Sep 2026 04:28:25 -0700 (PDT)
Received: from localhost.localdomain ([216.236.36.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm5162218a91.13.2026.09.29.04.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:28:25 -0700 (PDT)
From: xy521521@gmail.com
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH] xhci: check device notification type before forwarding wake event
Date: Tue, 29 Sep 2026 19:28:21 +0800
Message-Id: <20260929112821.60641-1-xy521521@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

The xHCI driver programs the Device Notification Control register to
only enable the Function Wake device notification (N1), so any Device
Notification Event TRB received is expected to be a function wake
notification. handle_device_notification() does however not check the
Notification Type field of the event (xHCI 1.2 section 6.4.2.7, DW0
bits 7:4), and forwards every device notification event as a function
wake.

A host controller that delivers an unexpected notification type (e.g.
due to broken firmware or emulation) would trigger a spurious wake
notification on the parent hub.

Parse the notification type and drop events other than Function Wake
with a warning, mirroring the slot ID validation in the same function.

DEV_NOTE_FWAKE is the DNCTRL register bit for notification type 1
(N1), while the event TRB carries the notification type value itself,
so add a separate DEV_NOTE_TYPE_FWAKE constant for the comparison.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/host/xhci-ring.c | 9 +++++++++
 drivers/usb/host/xhci.h      | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9f9540..af5d93a4e586 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1952,6 +1952,7 @@ static void handle_device_notification(struct xhci_hcd *xhci,
 		union xhci_trb *event)
 {
 	u32 slot_id;
+	u32 type;
 	struct usb_device *udev;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->generic.field[3]));
@@ -1961,6 +1962,14 @@ static void handle_device_notification(struct xhci_hcd *xhci,
 		return;
 	}
 
+	/* xHCI 1.2 6.4.2.7: Notification Type is DW0 bits 7:4 */
+	type = TRB_TO_DEV_NOTE_TYPE(le32_to_cpu(event->generic.field[0]));
+	if (type != DEV_NOTE_TYPE_FWAKE) {
+		xhci_warn(xhci, "Unsupported device notification type %u for slot ID %u\n",
+				type, slot_id);
+		return;
+	}
+
 	xhci_dbg(xhci, "Device Wake Notification event for slot ID %u\n",
 			slot_id);
 	udev = xhci->devs[slot_id]->udev;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..ec4bfeb4887c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -187,6 +187,8 @@ struct xhci_op_regs {
  * SW does need to pay attention to function wake notifications.
  */
 #define	DEV_NOTE_FWAKE		BIT(1)
+/* Notification Type value carried by a Device Notification Event TRB (6.4.2.7) */
+#define	DEV_NOTE_TYPE_FWAKE	1
 
 /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
 /* bit 0 - Cycle bit indicates the ownership of the command ring */
@@ -996,6 +998,9 @@ enum xhci_ep_reset_type {
 #define TRB_TO_PACKET_TYPE(p)		((p) & 0x1f)
 #define TRB_TO_ROOTHUB_PORT(p)		(((p) & (0xff << 24)) >> 24)
 
+/* Device Notification Event TRB fields, 6.4.2.7 */
+#define TRB_TO_DEV_NOTE_TYPE(p)		(((p) & (0xf << 4)) >> 4)
+
 enum xhci_setup_dev {
 	SETUP_CONTEXT_ONLY,
 	SETUP_CONTEXT_ADDRESS,
-- 
2.32.0

