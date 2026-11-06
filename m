Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945583;
	b=NcKh9Ncr6pBQfDgDB073byDMr9Cw40QyHA6nrrh0XjMI983w1Vge5msrgrJGWsYb39xG
	 kq/4LS9LevM42h4EaT4ZmYNPcZbxXQZFJKpD5maRGR8R73t5dfVNOs1G+sz9bUINjmGK4
	 lCbwtJ9dfuUWUUgbm4fHrZ8Pl/Kf7lJF285V4BNN83wBNfXQV2wE4G+P2nOhEsvyu8sl6
	 GwCZel+zxEkG2TEda090LxQmByjKcUm0Ir8LIQh2jdRj14wKgueftRp56lmy4MBLjpMwx
	 adR1ApcP8PeJs5fbvsui5Q2G0WOKgy29i+elvDVa4z0gsVNeAJjSNy5RVJrtf7FPfTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ixE6SotrlCj+oDgasCoAB/OsW59/eL+DSGQ9hySEbio=;
	b=QYHVLJGSJvCEgSrRSsraP/uxLP8nTQyUFP6+tBLITHFHOB58WBl/Qejk1UPVTVAgkJjJ
	 6Or+8l0HK45xbyrZHz7D9eYq9hkOakPV8sgFYPVVGYRBX9IeTUZf+srHIH7uvm5aM+RBD
	 RIO/r9n5LkxLFXRe1vEvvBNWqjbrbKXcpOgAa6THfwLwCTs/M5+dP8YGsUymIixXGQ8IB
	 Ff8SaT2wkXqMDkEnSg+Y4PlHNEkDLlyQn0qwwSKAbwJpKzb2/uMxNFTFv76MhphhzUj5/
	 VLfcbvqqKwzO7Rzbcyu5XXY5kPW8httokaxlX2pUYG8BSuJA2bInGxQYF6mJGIG5O1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NDcQAxpD;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359F606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D359F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NDcQAxpD
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a315ed211so363223eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945582; x=1794550382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixE6SotrlCj+oDgasCoAB/OsW59/eL+DSGQ9hySEbio=;
        b=NDcQAxpDHtqiClYL5Yxpb8OZoo7pc1I64JrMaN9PF6tkSe7/dJPcN5HdhhHLnIyNf8
         ZrRJSas6v2M0JHEyiT5y24yMWIHrYoh+kJSIhbJOWdkPrkG9iSbcgb2xvXOebJiJyGSm
         fFv/wrtVcJ3GnrT2uAr23mqkTYRMqGc4fHtdQ2ONQ6oQ+t3wvZdDwKJXMh5D5Rqvvu4F
         V88c3K7w8Ywe4IuhaKVC+aS67PRlYLQiHjQ46igGyaLa5kEO7JRE7bXrgNV2ni1uq/DB
         GBh8hvR9fFj72TcOYXN830Ozv6mEtnymTh4ltV0bwFFcYQEjx0Iyly+38mf+utNqmqym
         EpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945582; x=1794550382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixE6SotrlCj+oDgasCoAB/OsW59/eL+DSGQ9hySEbio=;
        b=gaeZhc1+UaqbvPvFGY4OAgThtq48jtscz4K/8WWX7EpRa6f2Pzeq7bDlWpkF0gQ/pL
         xKt7STPNL7EqDWLyL85qboFF9LhtGbOTAAlXfRMB7LGjrBchaHLP3Kowbcll0kAhEHP5
         pZpBSGF5dFGY3XB1WJeP6dnT3j/SuM8ecUwp6UHNNufZH8Lvwd9Emg6sv9jNlcGBkB73
         1CdEGNsdMQnEI+JaP9W72hJEpsgegDlhTYY9Es8tyAbfrr7OtiIeYjk2TteTD0ubxMc+
         2uyoyj7UdeNBytGpzvsoG9/2HLaHtWKPO1t8/vHAOU15OHyQ0+sXM1ql8GrRlNOfepx1
         QzPQ==
X-Forwarded-Encrypted: i=1; AL+hErFj1mqYjUescgsJ1iXvN9C4oFs2t3nxwqTn6pHYZ9QZ++JCpfM1le4/xZh7PKezKe1CelfmnGT5K2kjgQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UrJUpaOJvb9cQneEd7tUnHUr7qFXmBgDePjRSZ8zDz8IWzMTI
	wUSl0XGAMwVnRNBEyBPeaZ8eU4Jp+28J8SS5pf5rka9sV9liCKNv9TtbEggnmyiagA==
X-Gm-Gg: AYBFou2f+kcZkH3V/DycY5P4Ek0QOZ4W2TVW+ZeoKf/3jUaA8BE8YTQgiGiDE1q7vEb
	8172/w64NpQ65sQw/n1ZgDBSbPa+b1SHbbkYiRfuv3fNE7FhXrXn8oGmhD/DhHLzRxGiS5A6DGQ
	3qtsgTiYNbqtRD1vxbeLvcWRArVQ7s4mSptU0tXBOs4in29UiljRZUp8jd9Kf1WB70Zl+nbMX0u
	3cg07uySLoKdoaQEvT8yNTAjjv+QuLZ64yREzMRuPb25210U2CKmaMSlc02rnXiJZB2/jG4/Pe4
	FHD8sJylOEPcYBcZyqlxfxvf6su3XuJLeBuK49dTVZEki1ZgVUv9lKt7lfqaqJdp2H/MO91vAKf
	6hDFJypZe1DQpPAu5R/+444ZcUs+2DCHs7TIJUl93L8RQ4h236Enboqn9hYGOHQ43mnTI+Rsv2X
	yt55R/CAeMpSx9P+aIpauGk+ZeQjJr4u9izmFS38H96nUnLgmVj6UZne7gD56poNyND82JqToUM
	H6zZVvqEJTkTbP5LO6HeWJ6/OW6UpHxfwIMOBNprqnOsaV1kxakd/AYNiaaDxzAQqUp1D+6Y4dT
	NVeU1D5k1E/RKhfQhk7ljmUdtkde7VOmU0JkakyNudSqDwWi/wXJlQR6G3Y45xP8roiYfuqM2nC
	IRacsDkRJRbfFnaIydvjg9LsLKdQZ6FaXmDSsmng=
X-Received: by 2002:a05:693c:8082:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-36de6065831mr7087382eec.4.1793945581467;
        Thu, 05 Nov 2026 22:13:01 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:13:00 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v4 1/2] usb: core: export the generic device driver's operations
Date: Fri,  6 Nov 2026 13:12:50 +0700
Message-ID: <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793941292.git.jjc@jclark.com>
References: <cover.1793941292.git.jjc@jclark.com>
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

Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
their declarations to include/linux/usb.h. This lets a driver whose
probe may return -EPROBE_DEFER leave generic_subclass unset and call
them itself, so that it can defer before the device is configured.

Say in the generic_subclass kerneldoc not to set it in that case.

Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/core/generic.c |  4 ++++
 drivers/usb/core/usb.h     |  6 ------
 include/linux/usb.h        | 10 +++++++++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index a48994e11ef3..53675d9fdb03 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -261,6 +261,7 @@ int usb_generic_driver_probe(struct usb_device *udev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_probe);
 
 void usb_generic_driver_disconnect(struct usb_device *udev)
 {
@@ -271,6 +272,7 @@ void usb_generic_driver_disconnect(struct usb_device *udev)
 	if (udev->actconfig)
 		usb_set_configuration(udev, -1);
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_disconnect);
 
 #ifdef	CONFIG_PM
 
@@ -301,6 +303,7 @@ int usb_generic_driver_suspend(struct usb_device *udev, pm_message_t msg)
 		usbfs_notify_suspend(udev);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_suspend);
 
 int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 {
@@ -320,6 +323,7 @@ int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 		usbfs_notify_resume(udev);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_resume);
 
 #endif	/* CONFIG_PM */
 
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..9f1e4d197695 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -50,12 +50,6 @@ extern int usb_get_bos_descriptor(struct usb_device *dev);
 extern void usb_release_bos_descriptor(struct usb_device *dev);
 extern int usb_set_configuration(struct usb_device *dev, int configuration);
 extern int usb_choose_configuration(struct usb_device *udev);
-extern int usb_generic_driver_probe(struct usb_device *udev);
-extern void usb_generic_driver_disconnect(struct usb_device *udev);
-extern int usb_generic_driver_suspend(struct usb_device *udev,
-		pm_message_t msg);
-extern int usb_generic_driver_resume(struct usb_device *udev,
-		pm_message_t msg);
 
 static inline unsigned usb_get_max_power(struct usb_device *udev,
 		struct usb_host_config *c)
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 825f03b29067..4844f53e2fa8 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1301,7 +1301,8 @@ struct usb_driver {
  *	for devices bound to this driver.
  * @generic_subclass: if set to 1, the generic USB driver's probe, disconnect,
  *	resume and suspend functions will be called in addition to the driver's
- *	own, so this part of the setup does not need to be replicated.
+ *	own, so this part of the setup does not need to be replicated. Do not set
+ *	this if @probe may return -EPROBE_DEFER.
  *
  * USB device drivers must provide a name, other driver fields are optional.
  */
@@ -1375,6 +1376,13 @@ extern int __usb_register_device_driver(struct usb_device_driver *,
 			struct module *, const char *);
 extern void usb_deregister_device_driver(struct usb_device_driver *);
 
+extern int usb_generic_driver_probe(struct usb_device *udev);
+extern void usb_generic_driver_disconnect(struct usb_device *udev);
+extern int usb_generic_driver_suspend(struct usb_device *udev,
+		pm_message_t msg);
+extern int usb_generic_driver_resume(struct usb_device *udev,
+		pm_message_t msg);
+
 extern int usb_register_dev(struct usb_interface *intf,
 			    struct usb_class_driver *class_driver);
 extern void usb_deregister_dev(struct usb_interface *intf,
-- 
2.56.0

