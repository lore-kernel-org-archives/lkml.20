Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636009;
	b=y4c0dN+GxNuYODZAJRnNQAmhw0/iW8o1ygunfqYNe7BT+rHNQHob7CGNA6x3QIBznqRp
	 e5XdJk73ONO4ppEIAn7N9F2bpCTdxgz6yQeRJIx5HJ6+VcKjOdszW50Qwx8HA9BZlLC5Q
	 3FsIjOlOjIyYylBahlhOpKUPmAwCWKLvuJp2i96ZRr23cI+vH27RyHxTm7nKKcTYnBm0K
	 8lsm4Xedg+WHs9/DlPAo7JjhEbgOwVvWjh4YTr+HiGM1DMURx7IzDpc5xcrUohjX5WLG6
	 ERQneKPR7gk0PRmi1OtryYx/Iq5fCeuXAqDcLr9Ga0elPNSmUnYWe6aA304ugPGSR8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mKtZVVnVdYNwaU/trNKiWVHOkmKtGkSe73ghcg3XOGQ=;
	b=xCosd0pzLbdiFz6yRmWkHA2eSuh6vlTkUyq/2GiEU4u33eE/K2oaCwJmsUJk2HuzDGDu
	 9yddfdkgHayq4L07TCBw1GZs1znIHEzVHB+IpYhJ33VtmRw+iFBXJ0vX7Q9h5FxrIcar0
	 vzdXJxHrv2JeQQ1jKoDsi9oIPrxxYdsBsw33/SuZ8Z3j9tmzH90EVSsYQIcyJV0xsHk6m
	 YQrjAnjsg10OtkhYDeyPvha07pUnSbKX+0mrpohCveZsFCfcZIDW8cW4Yp7yOCH/B8Z88
	 BgUefFCzbF52t5kg7nFJwtlvCyoJZjyo+7/ej+ev+FFwLAPS4AmRXxCp9Krkx3N2yaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaQsH2zM;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A788D606A898
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A788D606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaQsH2zM
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2107894c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636007; x=1795240807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKtZVVnVdYNwaU/trNKiWVHOkmKtGkSe73ghcg3XOGQ=;
        b=ZaQsH2zMCA7J8MgFBELmIC5gfUWbd4E4i1x97KHtv3tRj3Drf8UxcMTP/Sepu+ypWd
         VBYzwmdrAsi6p4IVv/Lv7n+HxmBF7qyk+yYwA0qoEoMPpmIDxh5ht8rwyde6+03J9B7V
         Ex6pTuLAW6BPWrcxfuL/m3a+proerp+ewwiAqiBueMtcNU2xm9zOXhnR4ZwYJh3OGb50
         bgY2XMUttGcIEOvG6DcQvX4lM0QbF1/WZ2OIoQeYAA+ggOTXDWTRkgqnX0mnrtndopMW
         7F6N4uLq5TUZnQzJvWveRRrJit7QIRig5/G6JcskiZLgxqdiTmsdRb1pm2eAYfi39fOu
         mPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636007; x=1795240807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKtZVVnVdYNwaU/trNKiWVHOkmKtGkSe73ghcg3XOGQ=;
        b=AdfseHsqyip5W12xkFFkA1rQJM1YMEboKny9GEsyNRIH5HiSbO/y+aNxEtmMj6REK5
         eDjM9475hqPpIoEDROCv3qn6gCzPqJ8V3hPHHwQGa58EwgCrnDWw2pm7KIbGccfuvJo0
         uFeOMRwxYLGC2PygUhGzI9UTZczUh+YA1BjcMndqqcppFrExU0mKC8a3vPPhql7Pn4V/
         hNpEQHizNVgK9hrwvI4fSnDYV6o1uGfaC/WrXPcrhtCYab1tO+EbJxo8jHfVlQ6l8O2U
         1597YLB7047VF+7xDKKd40hdtGAu7MG2RdkQgg390vdxSRKsc3kZzuB5urPzNeXVsFkA
         wQYQ==
X-Forwarded-Encrypted: i=1; AL+hErG11W7IeUEIbtGpU8nz+l/CGulSI9+piWpLfJQdnGEIUJml11spoYN/SWM1s3lzpVp1d3UQETilV+w0rRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4S0KWVcGQTYJKsFXHGrVXETN5+VNNwYww67JFesY6naeD6XU2
	k5r6Us1FNGtrI3gC9RS/AHuBpeF9h4Ju7wWXpJMpCBuOkjuu8L2lXXrN
X-Gm-Gg: AYBFou1E9jXw5xWt52NFPZ1IVbGyzX9G2A4ypBHiShVhze+biUD552Xpg7R9Y2bFtFL
	oJlu5J8ZLo2VR3ATqJPQlvVljdzv+BFBF76umA0bHcOINrNAsn4jrQf89JGaZ+7/lG/em17y3gA
	ZJa25oJTvLObyju3f/C8VozjKr9uE0Pr/4nkrms1Abef+k9WwOkVQolUUhzF9tlx4xcs/MFkQdp
	xL2cpTDdod4fRHpstzi6s2OHfMncgYGT/D5jtMusAimbakAWqU5kJdIF2YVCaI96mJ4p0VwEI8k
	mCIlwOZNjEmXWTwmJAgbdqFeat8JGchYyCFugYcaMMSJLmbMZETt3eBSdF0ieP4opkmwX06H8dc
	V5epO8/Pz1dwoMmXEZptbBcit+ARVqSXuaDy/jIY0bqy6Vprls8sGux4E5XVvklKFftLvuP45po
	xt345NXgH/BHo9uZ0R7gjDTsHmLo2ILrKYfUZ+6fGlPf35QjqHs52lnZhVfUAEAGkfabsFBZflv
	rd5+SS8knHU7a7we8/qBBsofdd83IffAAiMm78ImmSc56m9DYRrQ5YAV2JdIWmkuBXX3bpmzYuZ
	e4rAlsJuVe61EcpSIDthpElx7mku1OQxOYq4OolnZVtw1Ez6D55RMAUc1/wJSodGwnzR3MUpyrB
	TPW+MOUWf1Qsze+TW
X-Received: by 2002:a05:7022:1583:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b50dc32734mr2517153c88.22.1794636007187;
        Fri, 13 Nov 2026 22:00:07 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:06 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 21:59:54 -0800
Subject: [PATCH 04/12] HID: rmi: fix device lifecycle, suspend, and reset
 work handling
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
Message-Id: <20261113-hid-rmi-v1-4-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Incoming events can schedule reset work before transport initialization
completes or re-queue it during suspend and removal, power management
callbacks can dereference uninitialized device structures on failure,
and failed resume steps can leave transport interrupts disabled.

Gate reset work scheduling and power management callbacks on device
state, track suspended state to prevent work execution, ensure resume
re-enables transport interrupts, and permanently disable reset work on
removal.

Fixes: 0b2c7a897378 ("HID: rmi: Make hid-rmi a transport driver for synaptics-rmi4")
Fixes: 8725aa4fa7de ("HID: rmi: Check that the RMI_STARTED bit is set before unregistering the RMI transport device")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index d9181fd66c5c..8783edb7fd6a 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -31,6 +31,7 @@
 #define RMI_READ_REQUEST_PENDING	0
 #define RMI_READ_DATA_PENDING		1
 #define RMI_STARTED			2
+#define RMI_SUSPENDED			3
 
 /* device flags */
 #define RMI_DEVICE			BIT(0)
@@ -428,6 +429,8 @@ static int rmi_event(struct hid_device *hdev, struct hid_field *field,
 	struct rmi_data *data = hid_get_drvdata(hdev);
 
 	if ((data->device_flags & RMI_DEVICE) &&
+	    test_bit(RMI_STARTED, &data->flags) &&
+	    !test_bit(RMI_SUSPENDED, &data->flags) &&
 	    (field->application == HID_GD_POINTER ||
 	    field->application == HID_GD_MOUSE)) {
 		if (data->device_flags & RMI_DEVICE_HAS_PHYS_BUTTONS) {
@@ -469,12 +472,16 @@ static int rmi_suspend(struct hid_device *hdev, pm_message_t message)
 	struct rmi_device *rmi_dev = data->xport.rmi_dev;
 	int ret;
 
-	if (!(data->device_flags & RMI_DEVICE))
+	if (!test_bit(RMI_STARTED, &data->flags))
 		return 0;
 
+	set_bit(RMI_SUSPENDED, &data->flags);
+	cancel_work_sync(&data->reset_work);
+
 	ret = rmi_driver_suspend(rmi_dev, false);
 	if (ret) {
 		hid_warn(hdev, "Failed to suspend device: %d\n", ret);
+		clear_bit(RMI_SUSPENDED, &data->flags);
 		return ret;
 	}
 
@@ -486,27 +493,31 @@ static int rmi_post_resume(struct hid_device *hdev)
 	struct rmi_data *data = hid_get_drvdata(hdev);
 	struct rmi_device *rmi_dev = data->xport.rmi_dev;
 	int ret;
+	int err;
 
-	if (!(data->device_flags & RMI_DEVICE))
+	if (!test_bit(RMI_STARTED, &data->flags))
 		return 0;
 
 	/* Make sure the HID device is ready to receive events */
 	ret = hid_hw_open(hdev);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = rmi_reset_attn_mode(hdev);
 	if (ret)
-		goto out;
+		hid_warn(hdev, "Failed to reset attention mode: %d\n", ret);
 
-	ret = rmi_driver_resume(rmi_dev, false);
-	if (ret) {
-		hid_warn(hdev, "Failed to resume device: %d\n", ret);
-		goto out;
+	err = rmi_driver_resume(rmi_dev, false);
+	if (err) {
+		hid_warn(hdev, "Failed to resume device: %d\n", err);
+		if (!ret)
+			ret = err;
 	}
 
-out:
 	hid_hw_close(hdev);
+
+out:
+	clear_bit(RMI_SUSPENDED, &data->flags);
 	return ret;
 }
 
@@ -787,10 +798,8 @@ static void rmi_remove(struct hid_device *hdev)
 {
 	struct rmi_data *hdata = hid_get_drvdata(hdev);
 
-	if ((hdata->device_flags & RMI_DEVICE)
-	    && test_bit(RMI_STARTED, &hdata->flags)) {
-		clear_bit(RMI_STARTED, &hdata->flags);
-		cancel_work_sync(&hdata->reset_work);
+	if (test_and_clear_bit(RMI_STARTED, &hdata->flags)) {
+		disable_work_sync(&hdata->reset_work);
 		rmi_unregister_transport_device(&hdata->xport);
 	}
 

-- 
2.56.0.679.gc527c65306-goog

