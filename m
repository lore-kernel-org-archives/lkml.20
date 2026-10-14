Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27E137F005
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948266; cv=none; b=mJUc345GsiYE23vqfg9XASStPcw8wX7fhJaDCw/1cHnO/7YFKwFQR1Gao73b8ju+PvdaoTnVd6QLCRw+hWxVyT1WIHwFN+64TG0+9+2gVd0QVzIRJxigukeq9qHpWtmYbpbHaluGsh4XN8dZdwG4yt6964SoQfLDMAPHSb9+3ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948266; c=relaxed/simple;
	bh=6iTz7VpiLZLSAVqOeCRO35pCkxOjw9Jd91Pbj9XD8Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLEUar6auTvAJ88DPMarxIaxn9feN8qdQUZvbMshFDdf/FtCNKm6sA49A7UQjPsqxti1UjGnDbP3IAXmBm82IQVeslHHV9D6rO/ftEDiK5M+wqskNwVo2ct6t9X0R1gH+7JRZAMkkSzZa5GhA6dJeIkpgXxDIELe84wXO4qlnAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5hLlgwZ; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5hLlgwZ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so3386654eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948264; x=1792553064; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOvCtYCKadNEkaISc+QEKXNYLWgmraWIzzzO7LCq0ZI=;
        b=Q5hLlgwZuR0kmEHOH20LwYfQi0z0bT96hTX6ZLcRwM0LFx74AnyjNy6PTJpwd0HvYz
         5d6aEN/0+esLyM73YP/37d8YBXVgJI7Pw2xFsqEug4evdAmAiqn5ViI07CHc8b75xK0j
         Ae1hvhD/xkPm0zxUP5Eez9mFsdJ/oexZvFuFoCxY28PvUbmlt9wSnAlsPkk2k5Vo4FPf
         3x7VTfpBpDKYYnW2zwp2UpgQVNUXxtcbdWX3yM+qjFZczWRbETS9Vtpubr9Memxhr240
         /L2Y92Yepaizl1cwuST2vApkpszNy1o4wEOZkLMLasgFE/c7J7TqWtZbBSwB8/HMv+/P
         mpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948264; x=1792553064;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOvCtYCKadNEkaISc+QEKXNYLWgmraWIzzzO7LCq0ZI=;
        b=xMmCwipWH/4Rx6QDsTplS3r0LRygAY/Uv8abmh2M8DKqXY9+T9by4pNhw31xI2Ylgn
         i+I/nxFqpaCyag7dbis+QkqidT5DYHN06CAENJRDM8XK3OjKh3SqHtZ5hiFIg/N9kQoc
         In3XgkQKyMJm5IwE0qojIV+cxYrYYLlkZwrvzf6vd1cOSleb6rkYc/c3/mmjqpj0nIU4
         aCYdta5l6RFwuceF3VgTpDkcA1on6K0/PIffswCDxnjLQpv9V0GgzoBMFA5DvLTkr9jT
         dsOaZcX8k1x9QRAKG9H/onyEWvJkXO350vbtNfNnVqsy3OCM/OpUb1iSXqfI6atxvlZl
         K1DA==
X-Forwarded-Encrypted: i=1; AKwUvBwpEjLnFnmEc/k8F0RftTghBFOQAnYWmrjBDHKt5QDX/V/y/ZjrVtwXt3q02laHKLV47ABAhKoLMDOHBPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKldJOQo+poLFWGMauM6h9ArOf71mhkB1plMOexuMZakhdO4Po
	MZHhuSixwzOv+5d7/a4f0dRugCXHipriF2Xr6ujTurzl1RiUCvFmYFQh
X-Gm-Gg: AYBFou2d9G+7frCrVgMCsVSpwDka4htWn7nBr9Ul9cTOn0skTbbTG1eoAP+YSRHN5Z6
	w5ujpa6v3V+r5Ae55Vz0WiBVPF+QkfnvDRrLo0QZmU+Nhifs+f44OC/uIMnbGVfnbc45/nNJChu
	Pn+Z042m8RqXoqxVVcuMIIcskXIDgCzRblKMyF5isVnuSTB6FeSGkvOBEM87FFfThYOvAoNXXxR
	wDlAXPSZtbEuj92FVkvdA1RFHln05pJdDAvrhYbpD780MKFPXs0VYv+Crs/gqFyDit6FLozFdq5
	miGo7hncNqZwLP3nim3aR9jerKX7cUzzfujL0+s1G9wxUyWU9Um8ApmZPQrFnX7qX0/PXQ14VTA
	RqNMIuF0Se8RzEyVgtKwi5VYdrQk9i/LmQW6DaEDIXHrjkUg6Wkz8nWvxsTKdS6XN4nW5Z9v9fl
	rI4e707P2Wn/G1UwnUbiY8nOXuCaOQyQttUMPSatNNxbsMG7ZHkNNPR4JJsIgBWLfya6wpf6izu
	3t1zAcmEEmOVjlm7mCUEFOehzgwhso+w+DaBbxy
X-Received: by 2002:a05:7301:e0cb:b0:351:1e3f:812d with SMTP id 5a478bee46e88-3537e0caeb8mr18111087eec.36.1791948263787;
        Tue, 13 Oct 2026 20:24:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm53415105eec.17.2026.10.13.20.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:24:23 -0700 (PDT)
Date: Tue, 13 Oct 2026 20:24:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: fix race between bus_remove_driver() and
 dev_driver_uevent()
Message-ID: <as71DkwHeLGNDsPv@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When a device driver is being removed, bus_remove_driver() removes the
driver from the bus klist before detaching it from bound devices. If
dev_driver_uevent() runs concurrently on another CPU, it may acquire the
bus klist lock after the driver has been removed from the list, read the
still-valid driver pointer from the device, and access the driver's name
while bus_remove_driver() proceeds to free the driver structure.

To close this race window, acquire and immediately release the bus
drivers klist lock after all devices have been detached. This ensures
that any in-flight uevent generation that observed the driver pointer
before device detachment completed finishes reading the driver name
before the driver structure is destroyed.

Fixes: 18daa52418e7 ("driver core: fix potential NULL pointer dereference in dev_uevent()")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Extremely unlikely to hit so I would not worry about backporting to
stable.

 drivers/base/bus.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index d17bd91490ee..8b3aaf451e4f 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -830,6 +830,15 @@ void bus_remove_driver(struct device_driver *drv)
 	driver_remove_file(drv, &driver_attr_uevent);
 	klist_remove(&drv->p->knode_bus);
 	driver_detach(drv);
+
+	/*
+	 * Ensure that any concurrent dev_driver_uevent() that observed
+	 * dev->driver before driver_detach() cleared it, finishes
+	 * accessing drv->name.
+	 */
+	scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
+	}
+
 	module_remove_driver(drv);
 	kobject_put(&drv->p->kobj);
 
-- 
2.56.0.385.gd3acb90ef8-goog


-- 
Dmitry
