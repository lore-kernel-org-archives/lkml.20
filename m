Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113088;
	b=CmBQPFEJwALgrOisk3WAT2ScBYzyq4Do3tYy9aJXNw0pbIckedOuGeWAMxSd0qU740KU
	 QQDhQpe4IVn5r5OIv7uygh46CUoMXiV1HzU+ITGAKrpLu2TV3rubwN7ixqCE7Y92qGmNO
	 U64oCUuOQkfL0Fr7Xsaw5AePb+kpCMOSHqccekhHrSiII8+ldZeoAjfoZKbMVpm66uNvh
	 zateBC4TcyE7iTuCfJGPavmcxO3G2LX4aR5eRcIZ79kj8+9sJJtvce+mqKNlG8caOI5IF
	 Eu7qU6l9W9CzBV1pWCR2XRfzw1NjNqJlRnnbmycbkewbg8qj/ejHpqXMYjkS5zlUiEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113088;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hbVDAqAH5BIfkt3XmVUNw9u3eWOVL5cRWPUBvL5vb54=;
	b=G8/Mrnt2l6JYUsAh+taUn7uznWDSIW2FuNW9tIQN1abtCK1JwxZK4WDau91yiDyW6H3K
	 e5JngDYn1vM9aG5RptS8n2nVnJrL7zzCss1gMSe5JBRzimXkPq7y2MR9b7IArgQ7dZf3Z
	 qE7lL3F/UvpmrHeX+kY8W/q0eI1VGY3knUz1I+IzyCRPwdNtZzS21nprp0vHrzehR3vnV
	 j5H9P9uarmgV0VA16f39UOnQkVLP5HWTFQPGq5Wy4QE4DovGuTgdgYZn24i0oc1w5LpUH
	 ARRHFPVpUn7jmnrZ6kjObWU5/+l7tSma/ojfqnBcIQN9DjlTxR5H2h4KDHwnuE4TzlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="s/jknA07";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC0606A326;
	Tue, 27 Oct 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=s/jknA07
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7F01F01828;
	Tue, 27 Oct 2026 14:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113087;
	bh=hbVDAqAH5BIfkt3XmVUNw9u3eWOVL5cRWPUBvL5vb54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=s/jknA07pmKlHwYjHMVSEDPgCcTQbvm+50jNgmwQypLS5kvQhSpUeHZESB0MwdPoO
	 zZMK7aKkAg/CwatnxYtPgbqj9/0ut1UMJhuFQB/SBJ5szsHwyan4Lq9Zx65Ube4oy9
	 itkcSlmCdmyQyDw6rEIduzKxJ2QNdjQ9SbhWXa9w=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:45 +0100
Subject: [PATCH 05/19] usb: cdns3: switch the role unlocked on resume
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
Message-Id: <20261027-llm-usb-v1-5-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=5590;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=JYups8GYFEQxWoi3FJTuayxHWMk1rqu1mgUEBsWcPEE=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr+T2xiamHiqa6Lx3L9PHz/PEf0W3lmZLy3CEPzk+
 7pVWzR5O2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiJ9QY5nDW+RqdPGlktDUj
 696J69ez7/mtD2FYsP6GX8W5r7Pn/vz0zlAq37K8waotHwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

cdns3_controller_resume() calls cdns_resume() with cdns->lock held and
interrupts off.  If the controller has lost its power during suspend and
the role which the ID and VBUS inputs ask for is not the current one any
more, cdns_resume() calls cdns_hw_role_switch().  That stops one role
and starts another, which takes a mutex, allocates memory with
GFP_KERNEL, requests interrupts and registers or unregisters the xHCI
platform device or the UDC:

  BUG: sleeping function called from invalid context

To get there, change the cable of a dual role port without a role switch
device while the system is asleep, on a SoC which powers the controller
down.

Move the switch to a function of its own, cdns_resume_role(), which is
called before the lock is taken.  What remains of cdns_resume() is still
called with the lock held, and skipped if the role has been switched or
the switch has failed, as before.

cdns_hw_role_switch() also calls pm_runtime_get_sync() for the
controller.  That cannot work from its own runtime resume callback, where
it would wait for itself, so the role is only switched on system resume
now.  After a runtime resume the old role is resumed, like after a
suspend without loss of power.

Fixes: 2cf2581cd229 ("usb: cdns3: add power lost support for system resume")
Cc: stable <stable@kernel.org>
Cc: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/cdns3/cdns3-plat.c |  8 ++++--
 drivers/usb/cdns3/core.c       | 55 ++++++++++++++++++++++++++----------------
 drivers/usb/cdns3/core.h       |  3 +++
 3 files changed, 43 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index e3f32c3e9535..674625cdd4d4 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -268,7 +268,7 @@ static int cdns3_controller_suspend(struct device *dev, pm_message_t msg)
 static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
 {
 	struct cdns *cdns = dev_get_drvdata(dev);
-	int ret;
+	int ret, role_changed;
 	unsigned long flags;
 
 	if (!cdns->in_lpm)
@@ -292,8 +292,12 @@ static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
 
 	cdns3_set_platform_suspend(cdns->dev, false, false);
 
+	/* It resumes the device, which cannot be done from runtime resume */
+	role_changed = PMSG_IS_AUTO(msg) ? 0 : cdns_resume_role(cdns);
+
 	spin_lock_irqsave(&cdns->lock, flags);
-	cdns_resume(cdns);
+	if (!role_changed)
+		cdns_resume(cdns);
 	cdns->in_lpm = false;
 	spin_unlock_irqrestore(&cdns->lock, flags);
 	cdns_set_active(cdns, !PMSG_IS_AUTO(msg));
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 87122fb5bdb8..3b2b8f231a92 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -504,36 +504,49 @@ int cdns_suspend(struct cdns *cdns)
 }
 EXPORT_SYMBOL_GPL(cdns_suspend);
 
+/**
+ * cdns_resume_role - switch the role if it has changed while the power was off
+ * @cdns: controller
+ *
+ * Stopping and starting a role sleeps, so this has to be called before
+ * cdns->lock is taken for cdns_resume().
+ *
+ * Returns 1 if the role has been switched: it has been started from scratch
+ * and must not be resumed. 0 if there was nothing to do, negative errno if the
+ * switch has failed.
+ */
+int cdns_resume_role(struct cdns *cdns)
+{
+	int ret;
+
+	if (cdns->role_sw || !cdns_power_is_lost(cdns))
+		return 0;
+
+	if (cdns_hw_role_state_machine(cdns) == cdns->role)
+		return 0;
+
+	ret = cdns_hw_role_switch(cdns);
+
+	return ret ? ret : 1;
+}
+EXPORT_SYMBOL_GPL(cdns_resume_role);
+
 int cdns_resume(struct cdns *cdns)
 {
 	bool power_lost = cdns_power_is_lost(cdns);
-	enum usb_role real_role;
-	bool role_changed = false;
 	int ret = 0;
 
 	if (power_lost) {
-		if (!cdns->role_sw) {
-			real_role = cdns_hw_role_state_machine(cdns);
-			if (real_role != cdns->role) {
-				ret = cdns_hw_role_switch(cdns);
-				if (ret)
-					return ret;
-				role_changed = true;
-			}
-		}
+		if (cdns->role == USB_ROLE_HOST)
+			ret = cdns_drd_host_on(cdns);
+		else if (cdns->role == USB_ROLE_DEVICE)
+			ret = cdns_drd_gadget_on(cdns);
 
-		if (!role_changed) {
-			if (cdns->role == USB_ROLE_HOST)
-				ret = cdns_drd_host_on(cdns);
-			else if (cdns->role == USB_ROLE_DEVICE)
-				ret = cdns_drd_gadget_on(cdns);
-
-			if (ret)
-				return ret;
-		}
+		if (ret)
+			return ret;
 	}
 
-	if (!role_changed && cdns->roles[cdns->role]->resume)
+	if (cdns->roles[cdns->role]->resume)
 		cdns->roles[cdns->role]->resume(cdns, power_lost);
 
 	return 0;
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index 8c492fda924c..cfc3be9ddf9e 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -136,10 +136,13 @@ int cdns_remove(struct cdns *cdns);
 int cdns_core_init_role(struct cdns *cdns);
 
 #ifdef CONFIG_PM_SLEEP
+int cdns_resume_role(struct cdns *cdns);
 int cdns_resume(struct cdns *cdns);
 int cdns_suspend(struct cdns *cdns);
 void cdns_set_active(struct cdns *cdns, u8 set_active);
 #else /* CONFIG_PM_SLEEP */
+static inline int cdns_resume_role(struct cdns *cdns)
+{ return 0; }
 static inline int cdns_resume(struct cdns *cdns)
 { return 0; }
 static inline void cdns_set_active(struct cdns *cdns, u8 set_active) { }

-- 
2.56.0

