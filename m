Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC64B826D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825382; cv=none; b=I5N/Y+WoGwzMduMmtXun+ZhKQy6JHr7bOQH3uEOQcpkTOYMsCw9dIrA/MPKOhkXt5szS/y5s5EwxDmTZf5jueHlCd9+OcKICSkxzBjNJ8k+BQSr6VugxEa91PbJffBPyOIyNh5yJ5w3WJEJimtpHZR4U0whszH9IfDQEpkxpSn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825382; c=relaxed/simple;
	bh=H40N0r6C1OEILBCNLk3itAeNjnm/Po1zfEGjkOl/OUE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mFT3pE4asutfpPv7WMI3WpIesgFRulUqM5NDkPSKrjJPuUQE3KU0NiP73R5vv1UtRxLCcSsY+aZkU9wlvNZxvmjalkMQq2nDhGZ99anmV9bb9B+JKRv8Grx9DjAKWw4TVkwOE/ZPGlXTZ9PgtJmVA4+cVVFdfRLVPIN3O4ggGwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sanglardf.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gi9LxSyr; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sanglardf.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gi9LxSyr"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1478768c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791825375; x=1792430175; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wR+OjSeqwxehKyGZb64WkIJcGP6xZXyCsJaiiPvzYn8=;
        b=Gi9LxSyr6vBDxlzZFLPZkdnlOZwhmHsKb54yBkI1/w9I8/wXVZLC7tydfR2LLQ5R0H
         xrl8j83vEvJG4v31dbYapNiQgBOLtNrJk3ojXaj11goOEfKVZiopqErqxAsgVcJjQQTO
         BSIli9bXIVxP1HTG652f4M5/WfAQV02xLcNTXIt0YdkODTMO3cu29b0VK4SZGgjFfus5
         vbr0mHc93BT/L1qn/+jAxJ1Jaocpv+nX5NiZR63pO2tO6mVev/4zfx+/uDJlVpzo5Gnd
         RItpN3Em/e8T0U+e92GQ3gNwER4yLuL5nRGeffe/I24b7WSkqr0hzmgCoOzoU+JTBmbv
         ZHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825375; x=1792430175;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wR+OjSeqwxehKyGZb64WkIJcGP6xZXyCsJaiiPvzYn8=;
        b=Zhuy7oIt4ur00kf/e2weTEXGrYKx4QF5djOdYNyWFp2mg+GVMcS9HGvtJ2isTrevYK
         L/tXtuA49xI4ifus9QzgwN5uM3PKHNcdCwKHzKIRUQCrboXoNoV5C5vCVn3mGZLdK/fv
         63BKMnzt0C40tvLi55J22KatZrkJk5Hsw3alF1hVT/T9q5eCkelNJPEi7mRfNV60xtuZ
         zaN7BevP1evnppbnuBNMe22m1dyVODGi5+Sf8dL1ml75qeEQAGTG6olQNxLeEF8XvaLm
         YUsHLz+INvoWGbnQOXizUFf86DkFX+gsokyDSOeK5NrNd8oU3Z2cEEyA8qqLsOoMMn0f
         wWGw==
X-Forwarded-Encrypted: i=1; AKwUvByjH/3I1eW0YOt+G/Fpox4bJdzYzBj/oVdzpHiyIhYnnypZXw4GgW+EvgpaYjv49GNaGMyIPs3VHGvxl54=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhIob+gWILGjeVb2Mij0pPJvNYOjA/4IsaI7SUb8iUpv83ztA6
	eNQYY1j4eKatHLKMw1xSI2cAgYfYvdXzoLnPdjeclrxOkxDOB4c9TjPYNmKW5L3g0cVzkG+QFl4
	B9paBJaOcoY3OFObLxg==
X-Received: from dli3-n1.prod.google.com ([2002:a05:7022:283:10b0:14e:8121:6eda])
 (user=sanglardf job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2089:20b0:14a:d8fe:33a4 with SMTP id a92af1059eb24-16a60de40ffmr15751261c88.38.1791825374949;
 Mon, 12 Oct 2026 10:16:14 -0700 (PDT)
Date: Mon, 12 Oct 2026 10:16:09 -0700
In-Reply-To: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012171609.88273-1-sanglardf@google.com>
Subject: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
From: Fabien Sanglard <sanglardf@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabien Sanglard <sanglardf@google.com>
Content-Type: text/plain; charset="UTF-8"

When an interface driver is forcibly unbound before a device reset,
usb_rebind_intf() attempts to re-attach a driver once the reset
completes in-place. Normal kernel drivers rebind and emit UNBIND
followed by BIND. However, usbfs only binds on explicit userspace
requests (e.g., USBDEVFS_CLAIMINTERFACE), so device_attach() returns 0
and no uevent is emitted.

As a result, userspace clients like adb only see UNBIND and must poll
/dev/bus/usb to detect when the interface is ready again. Emit a
KOBJ_CHANGE uevent when device_attach() finds no matching driver so
userspace is notified that the interface can be reclaimed.

Link: https://lore.kernel.org/linux-usb/CAA92w6k-LA4tVXyX1mFNOR3e+_mC43F_BXqhXeWqQyFx2D4_Mg@mail.gmail.com/
Signed-off-by: Fabien Sanglard <sanglardf@google.com>
---
 drivers/usb/core/driver.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 7f33fe5ba03b..25057423fda0 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1182,8 +1182,15 @@ static void usb_rebind_intf(struct usb_interface *intf)
 	if (!intf->dev.power.is_prepared) {
 		intf->needs_binding = 0;
 		rc = device_attach(&intf->dev);
-		if (rc < 0 && rc != -EPROBE_DEFER)
+		if (rc < 0 && rc != -EPROBE_DEFER) {
 			dev_warn(&intf->dev, "rebind failed: %d\n", rc);
+		} else if (rc == 0) {
+			/*
+			 * Emit a KOBJ_CHANGE uevent to notify userspace
+			 * that the interface could not be rebound.
+			 */
+			kobject_uevent(&intf->dev.kobj, KOBJ_CHANGE);
+		}
 	}
 }
 
-- 
2.55.0.1082.g2b9226bbc0-goog

