Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E849F136
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791045639; cv=none; b=A6CNz8mKyHgAfwdwuhx9dxL1lSsWYOzyxB4q3OKRkZM6tQdQPCowQ2ivlKMDoi0n4NosfjiEnTiu5BFx0JaXJXB5la9lIYiBTUBhst587WIJ1kJMGKlGwBMmtaXslzK8rIeGIYy/Gbk2skb/E10mSXMOewVDD3gA3dLjOpTC+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791045639; c=relaxed/simple;
	bh=XCtwfy+HsyCBzUEJZQGsfEPf1/p+pFFaeKMa/muG3zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A8CjMiF+C19SAvK3ZM/pac8PB48Kzye/IEgkRRe83EWzGKgS7dHqrLxTA5O2awRIasfRoXeIoj6xtzoH9+9lW7X2/iW4lUQSFjaKgAnO/l/39gOSC6TE4u3Hd9uSISsEEa7qN2I5vbEvFGyrhRX9nCb85tL8XQoxU2+7/Kpr6fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZGysHo+; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZGysHo+"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15354aa70e8so1060031c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791045636; x=1791650436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1SycGCsAYEA1OfPrGG/qg1fDqfdjLPEyIDB48vQpa8=;
        b=LZGysHo+pajBaNfnXd3MFHIJcpVszuZHaiCkXV9OnKtKnyqBpF6ajRuc5IEZFuTElE
         BtAxS47pSCNoTaCffXqBDHtRFM67d5S9Ek23XaDMaA3WnX9X7kml7/aucylb0+c59sD3
         EuKE9Nkllo7UsnIoYrVKIGqX+acQRvDquVCPlyHNmBnz1A7bpTJBN1RAdHIOIwwMnmH0
         DBxVnbjemVS6yXls0H+N9NHCw6BZzc4uiAQxHS7qV2yk0uj71PVgk62r/4VIQj3/Lg3J
         8Fyb9a2WtwO1Ynz5VMlVXmBigswClUIeifkI2m0NNiSXXVmcIoJmWjvJ32Bq06Xdi5av
         KaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791045636; x=1791650436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1SycGCsAYEA1OfPrGG/qg1fDqfdjLPEyIDB48vQpa8=;
        b=xQ8ZtW6MO1srw/1O1wo9kqwYBE1i3yKu11deVjcHh4pbijoAHW69yrPMaZYmFgbLF9
         EIA435NARY8+bjD+MIWJDiG6f9nbOFqL+Oq8XcDm7FjDWok932RTspyPEpTq8713+wyl
         kWreKHHPUGQQJ5e/jpQL7msVIrROhetmn73f89rlSxvqI04VBzs/enN40ak5Kg+wIseq
         oq6vI7Kh2cS7kyzojo/caygiM3imEkDHAjrXObFp3Nj5oqMjxr/StTbxY8yYIuMillEb
         4SeUPm6EXO8mD08+wrAW3bSZvvam2em3Nim2QhgLayQMdYilbLCCIgd5VmYZB4j8AMKT
         exuQ==
X-Forwarded-Encrypted: i=1; AKwUvBydmEfKEwCPsou109aguUFoT3dlvLl6wUNo9otjLuRjouWrFL6j79tJ1coAYxSrDNrNrUt9M+/oReCMIUA=@vger.kernel.org
X-Gm-Message-State: AFuF++m5Gl8t4ZB0HS0WtsByg2tR47eT4SNfClM15aISvbyKhsVWrT4O
	a30spCVDz3ckz+iCrYX5JV7eQ6ZJ83A0Gvh24PvGXo1O9t1TiKyPDBbs
X-Gm-Gg: AYBFou2yGr7bKTaSYvfvS0B22BMuvesS9kgTxfT79Y01zMmPpOipP4Z0fc076XKkRNV
	SP7Oxb6uLEvVRN3XV17LewMrGyKRVWWRVVUjaIuFJCX2Nz5mqS/Dk2/esUbfVzs1UINGb1fzry7
	BWq7X8xuZ5RcqkMHURmfC5eYwSRxFH2itqg3jLSAJXbUc5hafQlMIc/2uhSIRvpU01hNjdcSp5s
	XR5z7gnK1C4C1VMZkyAz+6rcKEDo0or+JA9PeYMeQY7gjeC6ZBUiq7TzYKAPg3CZHc362TgfdSy
	fxropGY2+gknl99tnBVp1CO/nuatV69ox3vr2ooHilTpHMOCCpEpjmwe0O+P0lfHnqnw4Hddbop
	dM9CTly1jGZxi+TVLSYvAcjBy4vfDeN/U+M3l8ReakdSFmrT9go/ZemsyL5Om4+pgjzesbt5fLb
	TIe5g6z7sw6IlRXq/xpz9l8hsL6wzyDCyYQqaKlOUTpuVLr6axL8AiBfRhL7grKwg/K0YI5mkuQ
	Nao4RrT
X-Received: by 2002:a05:701b:4253:10b0:148:306c:971 with SMTP id a92af1059eb24-151c3aa07dbmr4520821c88.22.1791045636270;
        Sat, 03 Oct 2026 09:40:36 -0700 (PDT)
Received: from Vibhor-ThinkPad ([2401:4900:8833:f3a7:6702:207d:bfc:f0f6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa751693sm18483744c88.2.2026.10.03.09.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:40:35 -0700 (PDT)
From: Vibhor Goel <vibhor1102@gmail.com>
To: rafael@kernel.org
Cc: lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ACPI: dock: Retry probing battery docks after hotplug
Date: Sat,  3 Oct 2026 22:10:19 +0530
Message-ID: <20261003164019.11195-1-vibhor1102@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a ThinkPad T480 booted with the removable battery absent, reinserting
that battery can leave BAT1 missing from /sys/class/power_supply even
after firmware sends an ACPI add notification.

The battery dock platform device already exists, but its driver did not
bind while the battery was absent. During hotplug, acpi_bus_scan()
updates the ACPI device and attempts to attach it on the ACPI bus.
acpi_create_platform_device() does not create another platform device
because the existing physical node is still associated with the ACPI
device. Consequently, the existing platform device remains unbound.

Retry probing the battery dock platform device after hotplug_dock_devices()
has refreshed the ACPI state. Restrict this to battery docks. If the
platform device is already bound, device_initial_probe() leaves that
binding in place.

Signed-off-by: Vibhor Goel <vibhor1102@gmail.com>
---
Tested on a dual-battery ThinkPad T480 with an aftermarket external pack.

On Fedora 7.2.8-200.fc44.x86_64, tracing showed the firmware add
notification, a successful ACPI rescan, and no attachment attempt for the
existing dock.0 platform device. A subsequent manual bind registered BAT1.

On patched upstream v7.2.8, booting with BAT1 absent and then triggering a
firmware add notification automatically called device_initial_probe(),
bound acpi-battery and registered BAT1. UPower detected the battery too.
Removal and reinsertion after binding also worked, without a second driver
probe. Both captures completed without trace-buffer loss.

Physical reinsertion initially produced no add notification on this pack;
toggling charger mains while leaving the battery untouched triggered one.
This patch addresses Linux handling after that notification. The initial
notification behavior is outside its scope.

The baseline and patched kernels differ in configuration and Fedora
patches. The traces identify the missing attachment operation and show the
new call resolving it; this was not a same-source unpatched comparison.

Built the kernel and all 221 configured modules, booted with Secure Boot
enabled, and tested on the physical laptop. The patch was developed with
AI assistance and reviewed and tested by me.

 drivers/acpi/dock.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/acpi/dock.c b/drivers/acpi/dock.c
index d7f3a8912..748df19d9 100644
--- a/drivers/acpi/dock.c
+++ b/drivers/acpi/dock.c
@@ -445,6 +445,14 @@ int dock_notify(struct acpi_device *adev, u32 event)
 				break;
 			}
 			hotplug_dock_devices(ds, event);
+			/*
+			 * The dock platform device already exists when an empty battery
+			 * bay becomes occupied, but its driver may not have bound while
+			 * the battery was absent.  Retry after the ACPI scan updates its
+			 * status, since the scan only attaches the ACPI device.
+			 */
+			if (ds->flags & DOCK_IS_BAT)
+				device_initial_probe(&ds->dock_device->dev);
 			complete_dock(ds);
 			dock_event(ds, event, DOCK_EVENT);
 			acpi_evaluate_lck(ds->handle, 1);
-- 
2.55.0

