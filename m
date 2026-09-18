Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B733515DC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720174; cv=none; b=cF6WwJmKmbpZEu5+Yu6C0X+U0ndAnezqBjeVcmgrEsEao9GbpETCYo4SGC0AhQEOTaRkF8ewhJ9rRqzokjY7iZUiyX3mO98ERND6oUHIAlDVzvDV4u8zng4pjJ2ieGsoPHxrzCnSjzpGVWQ4tsif9WOs0G9TnPbYmdfWLcsKX6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720174; c=relaxed/simple;
	bh=f8H5E/YfBBH82cx965GQK3srFAvkp6XlE1/3CJPT5mQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ME7M9F3WZlUueHnz9xAUgOzSH455Id+/YK07c/Jybo/He8uvUdMIURylfWBkIiw3z3kPc4WWe8cy1NDOuj36LAYmk8NSBJ2aCTKHnLgJPjuWdM065cLPmuRfSPQoY9WvkFCMk1UpxhdrOHQQoCj1Vc2knjaun96K8LAZ6zrvvA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=osYXZErk; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="osYXZErk"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so235778f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789720169; x=1790324969; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=26+NgLjZ67QyyrIUh0oGlFjqG371VHNZMs6LZelIEuE=;
        b=osYXZErk6pwltVeCLBjvweMqp55g8cy0g6NAp/xF1w4LV9QvMGYM0MNIyny1OsqS+m
         67sXBtdcTp5ksedPLzFDlA/6HbZvUcELsmaWHEKWHBpDw/lbSUr8EpHY7Gcv1iSMRWpg
         GxfW/AwmgrB9SqxI3hIrRa4AIkfKSxx9olea31YdtTRNEy6fEsI3YSLwpW901pUHU4du
         8RTx8FN579t6cLjzO2t+UxUDZsvtgDcV1RMswjbQeAf9+x06VoxoOjbhj52ueKwe+Ln+
         BE2OBn6yQnafh7fpW92LU1MVu3B1vefYaXUjzlQDWjIRaCwYyOuDEKjGLiYSYWcegSS8
         qxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720169; x=1790324969;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=26+NgLjZ67QyyrIUh0oGlFjqG371VHNZMs6LZelIEuE=;
        b=tb+Px059QjIe0BkJwubk1xk9pXbm1p8UIFp0fPrnFFotqQoHmzyRanMpIeZrwFwCA1
         zTfgros3fMyP2wYds0nVpaQlRjzhnZ6W6hdansgKLB8ETM/rxG1n77FiY4O2RLROwUvm
         pv1T+AeglN7nEo6ACTvzItVb8hb13EChf/wdKV6sv30xMZa6Z31eBgFPmDegsl3NPj9P
         5XxjkAbIvmvV6UH6ylHe/bgqRhviWep851P7TT9IWbTi5GKQhmniNxPheo7N6iXb5Bn8
         hjxI19RTdIxLXo5y+tTF5ONUO6qEKZRhICucmr+b2+DxCsL6AAIE7Twi8ltzIF5A+IQc
         Pjqw==
X-Forwarded-Encrypted: i=1; AKwUvBzwEmjcbsPa+40lrhVwu8lwaD0iSLSYeSCMYtck8vshoa2it3MGHpuhSPaEwcL6EL43zav79HCTs6GPOZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kNIbNdyXVjK+vdUKLToMFBxM529Ly4jUtTem2q9IqA3mDGUvZm
	DiwpyDDpXqOef5VQdkCcoiHxQXvj7blqBFOhN3+j3VpxwsYFvt4++33EUtpvRKZ/KU8=
X-Gm-Gg: AYBFou0rjMfDfWd1o7PLIiQLNYbtPWe6tUXZDc2P9PI4JW83cWiuGTblTcBTFblKtMz
	pBMF861wXIKTQ4j0QucAJQAEhitM3962xNVRElssRFoAHL0sDp98vx6yvL4zB3N63m2GZ1uURal
	CC2nT3Rt6B56F6LG0QLV1Kj3I9JohVg7JdSHbPC4a4GBW28HEdPiNgnsX6CUqb5iCcX6gFxk168
	JI/fjGn22QmViRzaNKF4WktwCKDhNpvIt5SxST+goGzVP6f0n0T1Uq9Q6InKVdnqyBScnd2MGkE
	aMhpJ+Sh8a9W8aEekD0i76Au1M0ssGyhPhPw+e/7bhPcuypQGEKw1ySVEqv2FrkMzjxiiQtGfTG
	1xMaHA9Hd0zPbEJ8NvAyrzhKJPO3fUf/vtBMBBPwrZBMnx3tHpaR1mKkyAcvDsGL/sfXeN5lCVd
	05JBXtzVQgBTleOq7CRJBRtvDv4l73blxmNUjOCl2Woc49gMUjovaIHUv4jqwCWKQT37g=
X-Received: by 2002:a05:6000:1885:b0:487:c4b:7bd7 with SMTP id ffacd0b85a97d-4871e261f7bmr2008031f8f.34.1789720169186;
        Fri, 18 Sep 2026 01:29:29 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff5605dsm2337466f8f.19.2026.09.18.01.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:29:28 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 10:29:14 +0200
Subject: [PATCH] can: m_can: Fix suspend deinit() error path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-v7-3-topic-mcan-suspend-fix-fix-v1-1-e24fa70c754e@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAFn2rGoC/yWNQQqDMBBFryKzdkCjaNOriAtNJjqFxpBRKYh3b
 9TFX7y/eO8Aocgk8M4OiLSz8OITlHkGZh78RMg2MahCNYUua9xbrHBdAhv8msGjbBLIW3T8uzf
 qutJK25cjB8kSIqX7LnT9w7KNHzLrpYXz/AME4GW0gwAAAA==
X-Change-ID: 20260914-v7-3-topic-mcan-suspend-fix-fix-b943929d8fef
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Sean Nyekjaer <sean@geanix.com>
Cc: Kendall Willis <k-willis@ti.com>, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018; i=msp@baylibre.com;
 h=from:subject:message-id; bh=f8H5E/YfBBH82cx965GQK3srFAvkp6XlE1/3CJPT5mQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqw132KMn09Z2pwSXZN067hyp0W0tEXOtD1M+6Rux6g4c
 L4o5kzvKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgInMrGFkWLWA66jiNiVHr3UO
 R3L5WOZePqt3M/XZnHwHxrplDlMFdzAy7FnE+sLrU3Pso4AclWCeq3IWa+IMzhjYf2O/cOW3vJ0
 +MwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

When suspending mcan, deinit is called and its return value is returned,
but nothing is restored. Returning an error in the suspend function will
stop suspending and resume the system immediately. So on error the
device should be restored to its previous state.

Fixes: ad1ddb3bfb0c ("can: m_can: call deinit/init callback when going into suspend/resume")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/net/can/m_can/m_can.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index 16f80607e150..91a0c5eca260 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2612,8 +2612,14 @@ int m_can_class_suspend(struct device *dev)
 			hrtimer_cancel(&cdev->hrtimer);
 			m_can_write(cdev, M_CAN_IE, IR_RF0N);
 
-			if (cdev->ops->deinit)
+			if (cdev->ops->deinit) {
 				ret = cdev->ops->deinit(cdev);
+				if (ret) {
+					netdev_err(cdev->net, "failed to deinit device while suspending %pe\n",
+						   ERR_PTR(ret));
+					goto err_restore_interface;
+				}
+			}
 		} else {
 			m_can_stop(ndev);
 		}
@@ -2625,6 +2631,21 @@ int m_can_class_suspend(struct device *dev)
 	if (!m_can_class_wakeup_pinctrl_enabled(cdev))
 		pinctrl_pm_select_sleep_state(dev);
 
+	return 0;
+
+err_restore_interface:
+	if (netif_running(ndev)) {
+		if (cdev->pm_wake_source) {
+			/* Enable interrupts that trigger immediately if
+			 * something is there and keep the hrtimer off
+			 */
+			cdev->active_interrupts |= IR_RF0N | IR_TEFN;
+			m_can_write(cdev, M_CAN_IE, cdev->active_interrupts);
+		}
+		netif_device_attach(ndev);
+		netif_start_queue(ndev);
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(m_can_class_suspend);

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260914-v7-3-topic-mcan-suspend-fix-fix-b943929d8fef

Best regards,
--  
Markus Schneider-Pargmann <msp@baylibre.com>

