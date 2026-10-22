Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708953;
	b=wHwo6fvW4jRvwOiFD/VtRTccYcuoszy6tWVYXhALEGVdI5eCi6k0TNnpAEOBhAHO5gi1
	 AYAbfGAIZSKeODSE4ZSatg7PkcAZ5f3LCv2JZ5kCGgyACxQGONi9JgDBncjMvD0v5OFdx
	 cRxmvI2Dx+XapB0CRcxxGLxwG+3ODnpSkYq5LY/Zasxo87oWXIcApxi2fZm740dF+LRfe
	 6iJnGe/pgTd5jX5Oe8/hdnNPBb5CDS99H3OIcu/l4C0RsUsbUpgZ9kyIrB7jO2euuy4RW
	 wa7kWQwleTYOGZnaJT/o0t9jympduhd72HnybdeYN0j7CX7kbOW0MtD+KccTlh6tz+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pWal3aIKvaNtEP+gdS3sSJm/J89NgtKKu5JBZ599RkI=;
	b=doxUD6e8mA9H0iArizzBPip6DpeEPcmuxGV0moSdw7jmmboagAfvtPuBS70q11SRWQNR
	 1N4hm/qBJkh8ysLVhJOxw3C6fnwhf3PSeC9RRYNLjpJ2QrA0WIwx+tYsj8eEsz63/hUu8
	 9VDjz0EKiTYZlYP1vEyEN/gUOG4hSCh+ZTwI2hkopwZhmzZLVwyYUlrzWGiMqJH9jyRjR
	 xr0WsPvwNrPwBBchDwG+mDlPVem9nmFPOo5RDRMwHXHRhwhzV7VrfLAx1+MtPLlJrpGgR
	 nC3Pxxyg7k0X0d5xEMaOcxApeB6GyY2eTPsO+abTJ+KRClLKbJLAj94Bhl0Gux3zEEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aS0WBtWa;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A44606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A44606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aS0WBtWa
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso3020525e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792708950; x=1793313750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWal3aIKvaNtEP+gdS3sSJm/J89NgtKKu5JBZ599RkI=;
        b=aS0WBtWagYtNCQk3JnHJx3yDjGwUJ9V3oVeMcEVnw8J25C+S01e+6qTDDQheUEuwo/
         82CP+2SJCpnA9vkwtjouL7qUnsovViLUXsMcRkGcM+exsnzESHnRPZQ2uj1q1UBoifQI
         KBpowB7AUpZLk/gBUqSmVx/zv82IIBiK/MnyxKcpO5qOIr+aDBr5TA/6XHuvVGnYkKQ4
         ksNhw5NCAsQ13J5yO6vS2KwdQpnCu6vw6D2uEyRV2cHZyVEIUClvp/vrKcr8v7bxT+4R
         7ZKKzm00r9Rxm4z2xW+LfUNllXXlBOVx022ZZY+w5Q89zGa3WwcJIhOwTfbOCXiLhonq
         EoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708950; x=1793313750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWal3aIKvaNtEP+gdS3sSJm/J89NgtKKu5JBZ599RkI=;
        b=BcTMQhsf+OXj1L1CmnVFuDgFmt8BvZr4S0VuK3wIyM3K1mw1IS40HA1oWMYl+Yh4bM
         +vPFHswvQbcl4wUVVDROBKF6FfjwHRfYZD+nxAOQ1aQPsjr+inAbasz+YfEuy1fE1H5f
         FbosHfxNE5zOR6QKxGKnlGAISgon/frXZW6gfewtQfvAenfGJ8nzIDxNyf0MbDFFNK3t
         t5FHylwcp1F46PuEE4TFSs6f8a7qlx+TS57/pO6l5Ad6bz6Y14QPUx+IRloEFO107R53
         63GVBwQNnGmiLfmPIYYViGf7Ltjn6IE2nG7icVLu+FNMUv8X30kZX8po5rx9Dfq+Bsy2
         MlQw==
X-Forwarded-Encrypted: i=1; AKwUvBzy2/uzGxTSssACLftigKfVJcUmn03UyrVnHxkCWHruaa2ielgjKlD0/Ivp2e4kTySX0XmwzkNh7KgRl7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3ZabWb/+xT0fnKYyDN/6Zo14GSePy6hhcww/HBHCYcx/2uIvX
	O4Wj4CDDCTLAOuHxMHIDY9y54UrKG1REwYS2m3vNI/uPjdqN31YaZXgKZfmfjuM/AD8=
X-Gm-Gg: AYBFou2/au/j147tL3kvhWs4gaX+6XjoW+Ys+EKaK/zdex2Jw2CJzvyc1RbwXmxcKf4
	uCQYBU1uB1j2xDEluxagtMNQJ6we45psK1/4B6KVXx7wN1GHixL1RK3ihTkwWTTzx1N4IEwtTgH
	pSjaWi6+nAJEG1uQfv9xo//OvRclqhQRn01O9AmHbq0sFfsh00yJ+uM6FyLAfDUTjsJC/IwxQkj
	vc01cdBKjA8OfUdXIrdu0e3ILUf0WgxC4ol3Tv1wqFCmba3HKXxpgb21yQn61dZQ6FnZHgEXSnJ
	+M4W0GwWzG9CIWFkwNxsf1kSBYVEr+XKICcegVdo3qH+l+PGnk+wcinaZu/TRypsOLQj/oRldwY
	jFkaE2kY8JpQvTDzDGonQQxIdIckpyeccNz9YMWMFZb2E+IJi5oF6NfESy1sr0UGDBeR0MXvvZs
	1PqqsuWjtgfAFCEpoCYfLbOHLGqZba0OnHNavWhY51muDGcJ0xTogMbby+LLb8bX4xxObGsYQ3f
	MWNy3CFXIYpYg11O6/T15r/fVnKHQD9HikUWkVICr2sCm8QZL5Ps+YeEzFW8cQX9ukQ0qRiqnT9
	70S6zp4=
X-Received: by 2002:a05:600c:4fc9:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a211eff23dmr6821245e9.27.1792708950345;
        Thu, 22 Oct 2026 15:42:30 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edfb3fsm1067895f8f.8.2026.10.22.15.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:42:30 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during system suspend
Date: Fri, 23 Oct 2026 01:42:20 +0300
Message-ID: <20261022224220.480-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
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

dwc3_qcom_set_role_notifier() updates the VBUS override in QSCRATCH
synchronously, from the context of the usb_role_switch_set_role()
caller. The glue assumes that role switches only happen from a
freezable workqueue, but that holds for the dwc3 core's mode switch,
not for this notifier: the UCSI connector work, for one, runs on the
non-freezable system workqueue.

On SM8750, when the USB cable is unplugged while the system is in
s2idle, the UCSI connector work for the change runs before the devices
have resumed. It switches the role to USB_ROLE_NONE, and the notifier
accesses QSCRATCH while the glue clocks are still off, before
dwc3_qcom_pm_resume() turns them back on. The access does not complete
and the SoC resets. pm_runtime_resume_and_get() does not prevent this:
runtime PM is disabled at that point and the device is still marked
active, so it returns success without resuming anything.

While the glue is suspended for system sleep, only record the VBUS
override update and apply it from dwc3_qcom_pm_resume() once the
clocks are on. Apply it after the core has resumed, since resuming the
gadget enables the override and the role switch is the more recent
event. Serialize the notifier against the system suspend and resume
callbacks with a mutex, so that a role switch can't run while the
core or the glue is being suspended or resumed.

Fixes: 21188e8d6d75 ("usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend")
Cc: stable@vger.kernel.org
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Changes in v2:
- Hold role_lock across the whole of dwc3_qcom_pm_suspend() and
  dwc3_qcom_pm_resume(). In v1 a role switch could still run during
  dwc3_pm_suspend() or dwc3_pm_resume() and bypass the deferral, as
  the Sashiko review pointed out [4].
- Link to v1: https://lore.kernel.org/all/20261018143126.3978-1-tvlad744@gmail.com/

The review also asked about the direct_complete path, which skips
these callbacks. It is not taken for this driver: every
qcom,snps-dwc3 node in the tree has a power domain, and
genpd_prepare() never returns 1. Where it is taken, the role switch
is dropped as it is without this patch, and the hardware is not
touched.

Tested on SM8750 (OnePlus Pad 3; the board DT is not upstream yet),
v7.3-rc5 plus board patches, with the UCSI connector work still on
system_wq and without the pmic_glink RFC [5]. The test kernel also has
local ucsi_glink and qcom_battmgr changes that make a cable plug or
unplug wake the system from s2idle, similar to Jishnu Prakash's
ucsi_glink patch [3]:
- cable unplugged during s2idle: resumed in 2 of 2 runs; without this
  patch the SoC reset in all 6 earlier runs. The switch to
  USB_ROLE_NONE came 15 ms after the start of the resume, during the
  noirq phase, and was only recorded; dwc3_qcom_pm_resume() cleared
  the override about a second later.
- cable plugged in during s2idle, s2idle with the cable connected,
  and unplug/replug while awake: no change in behaviour.
- with a test-only msleep() under role_lock, so that a role switch
  comes in while the lock is held:
  - 3 s in dwc3_qcom_pm_resume() after dwc3_pm_resume(): the switch
    from a cable plug during s2idle waited for the lock and then set
    the override directly;
  - 20 s in dwc3_qcom_pm_suspend() before dwc3_pm_suspend(): the
    switch from an unplug waited for the lock and was deferred. The
    unplug aborted the suspend, and dwc3_qcom_pm_resume() applied the
    update. No reset.

I have not tested this patch without the wakeup changes.

The UCSI side is discussed in Abel Vesa's RFC to queue the connector
work on system_freezable_wq [1]. Since v1, I have also sent an RFC
that holds back the PMIC GLINK notifications over system sleep [5].
With it, an unplug during s2idle on SM8750 no longer reaches this
notifier. This patch is needed either way: the RFC does not hold back
a role switch that is already in flight when the system suspend
starts, and callers of usb_role_switch_set_role() outside pmic_glink,
TCPM's kthread worker for one, are not frozen.

Faisal Hassan's SA8255P series [2] also changes dwc3_qcom_pm_suspend()
and dwc3_qcom_pm_resume() (the wakeup argument becomes a pm_message_t);
whichever goes in second needs a small rebase.

I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result and ran the tests on
my device.

[1] https://lore.kernel.org/all/20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org/
[2] https://lore.kernel.org/all/20261010053246.2991984-3-faisal.hassan@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20260722-ucsi_glink_wakeup-v2-1-b43dee56df24@oss.qualcomm.com/
[4] https://lore.kernel.org/all/sashiko-outbox-176222@kernel.org/
[5] https://lore.kernel.org/all/20261022164151.592-1-tvlad744@gmail.com/

 drivers/usb/dwc3/dwc3-qcom.c | 61 +++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..b22a72e3c1b9 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -10,6 +10,7 @@
 #include <linux/irq.h>
 #include <linux/of_clk.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
@@ -85,6 +86,11 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+
+	/* Serializes the role notifier against system suspend and resume */
+	struct mutex		role_lock;
+	bool			vbus_override_pending;
+	bool			vbus_override;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -561,27 +567,40 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
 {
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+	bool enable;
+
+	guard(mutex)(&qcom->role_lock);
 
 	if (qcom->current_role == next_role)
 		return;
 
+	enable = qcom->current_role != USB_ROLE_DEVICE;
+
+	/*
+	 * Not every caller of usb_role_switch_set_role() is frozen during
+	 * system sleep, e.g. the UCSI connector work can run in the noirq
+	 * resume phase. The glue clocks are off then and runtime PM can't
+	 * turn them on, so leave QSCRATCH alone and let
+	 * dwc3_qcom_pm_resume() apply the update.
+	 */
+	if (qcom->pm_suspended) {
+		qcom->vbus_override_pending = true;
+		qcom->vbus_override = enable;
+		qcom->current_role = next_role;
+		return;
+	}
+
 	if (pm_runtime_resume_and_get(qcom->dev)) {
 		dev_dbg(qcom->dev, "Failed to resume device\n");
 		return;
 	}
 
-	if (qcom->current_role == USB_ROLE_DEVICE)
-		dwc3_qcom_vbus_override_enable(qcom, false);
-	else if (qcom->current_role != USB_ROLE_DEVICE)
-		dwc3_qcom_vbus_override_enable(qcom, true);
+	qcom->vbus_override_pending = false;
+	dwc3_qcom_vbus_override_enable(qcom, enable);
 
 	pm_runtime_mark_last_busy(qcom->dev);
 	pm_runtime_put_sync(qcom->dev);
 
-	/*
-	 * Current role changes via usb_role_switch_set_role callback protected
-	 * internally by mutex lock.
-	 */
 	qcom->current_role = next_role;
 }
 
@@ -624,6 +643,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	ret = devm_mutex_init(dev, &qcom->role_lock);
+	if (ret)
+		return ret;
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
@@ -752,6 +775,12 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
+	/*
+	 * A role switch that comes in now waits until the glue is suspended
+	 * and is then deferred, see dwc3_qcom_set_role_notifier().
+	 */
+	guard(mutex)(&qcom->role_lock);
+
 	ret = dwc3_pm_suspend(&qcom->dwc);
 	if (ret)
 		return ret;
@@ -772,6 +801,8 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
+	guard(mutex)(&qcom->role_lock);
+
 	ret = dwc3_qcom_resume(qcom, wakeup);
 	if (ret)
 		return ret;
@@ -779,10 +810,18 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 	qcom->pm_suspended = false;
 
 	ret = dwc3_pm_resume(&qcom->dwc);
-	if (ret)
-		return ret;
 
-	return 0;
+	/*
+	 * Apply a VBUS override update from a role switch that came in while
+	 * suspended. Do it after the core has resumed, as resuming the gadget
+	 * enables the override and the role switch is the more recent event.
+	 */
+	if (qcom->vbus_override_pending) {
+		dwc3_qcom_vbus_override_enable(qcom, qcom->vbus_override);
+		qcom->vbus_override_pending = false;
+	}
+
+	return ret;
 }
 
 static void dwc3_qcom_complete(struct device *dev)

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

