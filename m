Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794160338;
	b=Vtl4diyiwpPTvYYyzLMO2DLt1JuFUr1fF6wFhaZRThsMEN37ztCOE+X2KbHRiPDv2zvv
	 1z/h6kq3TiJ6R1cjCRsAv2j7jLIfbLdMaUC5gquf71o+qsou7cIRJ7TlJxKU/InvS1Why
	 hkiuW0OrfVR07X6j1YZBuQm01R2/XdnZtWc6ml5wm9CcEg7BxGIBP1TFIBcKatWxs5o0k
	 +SiSK7jYpckaWOa/GKnT+6YA4LUO/1SECYmtZl0g1E75PuoClvoeaBlEyaknqwoiPYmpI
	 NxVTOEGsyzl+IjrzuaW6B7tp9sE9nrF/EVfrdhwDn5cHud9WO2v9F1KLqcKFLENj9rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794160338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZbsGt/Yaewv8ArPLycAYYXmDqJHO01ChanNYScKiO+c=;
	b=3jYuZYz471W50P0ph/9Z+0nn/pPSfzt3NtCcsm8fptutvPwW+GLkjZLZQHfizf6DSM8Z
	 uEPoprH/USTnSoPb1b/7IJgx00reg7inQgJsdzRfv3fU7wnpCrAgCvxb/dB6j79/g4RNC
	 f2yLMaVdr5OBuzfVhpJN29kyQhZAe03dgm9ng0/e/OakRZqM4DVcdmzGllxPfOcVM3xHs
	 arm3J2uAL8+ZQCvH7d7Lyjc08itZYRBHOiM1RbWjmrdTzYWm0Tg8jByjZkxukEr2hF6OA
	 H48L2m/kBx8BPqXX5WsTA33YiqsIa6TKSF9amtSurQMbbM/lBdL5fEv5/lT7M7LNkMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nolknHvS;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CBF606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11CBF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nolknHvS
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48ed188ee81so80911fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794160337; x=1794765137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZbsGt/Yaewv8ArPLycAYYXmDqJHO01ChanNYScKiO+c=;
        b=nolknHvSLtnEw0mNYq1xDNKKwNZ80yOhtr4P6+0Cly55+qNwwJ0aLUpghOW397MonE
         arPaf4+fjBCN7cj6gVPvczwqp/iQwZk7JFvP/O32pG1miypIAXCxNbZuClZulIsjmKtx
         MC7mIWP4eVReH5yy1ggGYsEl5lRDNXM6zqiE4chPSAqFV/t55pzBECUIdRmvDnX29IMQ
         S4EfhVU5QKlReigkhwALskWeIREbV+1XnrTllMuG/9OkOBzkCmyyv8VKrkUUtsFteeAM
         AKRPgCFSrGvn9b0wXV1AQekQdPWe4/Qu0K0eSFxHdzTnDQSiMq7ZFuZKCeZ+hqzJDrqK
         U6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794160337; x=1794765137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbsGt/Yaewv8ArPLycAYYXmDqJHO01ChanNYScKiO+c=;
        b=lB97UeCFMMwYfLFIqj2xZ0SJjqe+aRhbqv+apAm4xr3nPkNsWsx5qG0fszrsjg9+6N
         qYSrBFIpEZT64MnNFsZVaZwb/25Z333jDSi++9IYSXK7DcIdhSIH9uj9yCI7N9gSgH5c
         Hm7KSLi508ut0RORDpL40COHbeUwNF70NstNlix4VPs8bNYb7E+D6By/mpaTgi19jX5Z
         FIhHJcBVyqhd0/7pwQHOSU8tNdXBYbLVCq8ggON3SMM7mKjDHmMpc67IuZDMhPFNAsPT
         jBWKBVRncRFU5lSDydYXmzaDOQ8mYtF/7IaFmuijr4/kbLgo4r1rGvWeGtN3FHj/8JPC
         mbzw==
X-Forwarded-Encrypted: i=1; AL+hErGajcIvyMrxF84+2HodXiZngc0MrJfIg/9e9qr0Lj4bvjk9twKXlIeXiFxlg4HzdSktIeRPyTEceNePwOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ehBN1cB8yXeCooX+ttOcE67aOSKTwey/ky8xH+BG/OtJTneVb
	YMruOWXSWMUFCObcM6910adKM2Zhs+fEv0ZNfATtZahvGS3z1/VGeziU
X-Gm-Gg: AYBFou3p2nsvthbsb2vF4hvIP4i65zw+1jHTmM4K/1Fmvtq8BeFxi6fDqLopc0R1lLQ
	IiGk0tnCImkLZtYzPXzp1Ty6+lutj/jxKuw5rO6etDw+RaghqSLwcEjlYtUUvSDK/qQfEGnl+RW
	0ZXkPdkVR//4lu7J6elqpMDJcwq9VaFWXu0Wrt7tFGm1UWCBG/CwNx05XzLeJBWc3icr9t90l+q
	F5EXVxflNEvxgksg/ZkfFnYQ2XquCpCI3uM4/AnKFyDEUJ+i138tTvF05k4vMGFNsu8VsR/LFhW
	oQrbuohhRWd40dQDO9dgFvgBLDpmgSD9dkXXhXFloXE6otusncLEQ5tEeS+oMyeRVDsfSp9qJ+3
	m33POvIG5gQrY7BNlRs1iQZHY2+HpXrllX6ltSXZYt3zQianwY8IS4hcIpy0RQokswkAltMCAol
	efLUvgFuX9Cb7WHpnxIFCCygnD1WLmUHp1fgHPq3OouOLTo4cnf87GZ8m+UkdNfyx5RVym3yBdX
	/pKwOtamWTTk/+yFJPmSOMwEaB60aS3kvb1xG2S3JAhPOhFECURgJ913xP8y4Yvs04WI+9smz4m
	ZpAz8n61o3meEtSpk4cHNRTz/1Mnojq/o/L+/S5Q+cdIODje
X-Received: by 2002:a05:6871:3321:b0:4a6:fa51:3c89 with SMTP id 586e51a60fabf-4adecbadfb9mr1009105fac.51.1794160336736;
        Sun, 08 Nov 2026 09:52:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a26d74sm2682674fac.15.2026.11.08.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 09:52:15 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] HID: microsoft: fix use-after-free of ff_worker on teardown
Date: Mon,  9 Nov 2026 02:52:05 +0900
Message-ID: <20261108175205.722820-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

ms_play_effect() schedules ms->ff_worker to send the force-feedback
report; ms (and ms->output_report_dmabuf) is devm-allocated, so it is
freed by devres after ms_remove() returns. The work was never cancelled
on teardown, so ms_ff_worker() could run against freed memory.

Draining the work is not quite enough on its own:

 - hid_hw_stop() in ms_remove() unregisters the input device, whose
   teardown (input_ff_flush() -> ms_play_effect()) can re-queue ff_worker,
   so the work must be cancelled *after* hid_hw_stop(), not before;
 - ff_worker was only INIT_WORK()'d in ms_input_configured() for devices
   with force-feedback, so cancelling it unconditionally would hit the
   WARN_ON(!work->func) in __flush_work() for the other MS devices; and
 - if hid_hw_start() fails in ms_probe() after force-feedback was
   registered, its unwind can likewise schedule ff_worker, which was then
   left pending when ms_probe() returned.

Initialise ff_worker unconditionally in ms_probe() (so it is always valid
to cancel), cancel it on the hid_hw_start() error path, and cancel it in
ms_remove() after hid_hw_stop().

Not runtime-tested (requires MS force-feedback hardware).

Fixes: 73c5b254c365 ("HID: microsoft: Add rumble support for Xbox One S controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: Address the review of v1 (which just added cancel_work_sync before
    hid_hw_stop):
    - Cancel ff_worker AFTER hid_hw_stop(), since the input-device teardown
      in hid_hw_stop() can re-queue it via input_ff_flush() ->
      ms_play_effect().
    - Initialise ff_worker unconditionally in ms_probe() so cancelling it
      does not hit WARN_ON(!work->func) for non-FF MS devices (it was only
      INIT_WORK()'d for FF devices in ms_input_configured()).
    - Also cancel it on the ms_probe() hid_hw_start() error path, where a
      failed start can likewise leave the work queued.

    v1: https://lore.kernel.org/linux-input/20261108133821.535139-1-hj351016@gmail.com/
 drivers/hid/hid-microsoft.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index a7d3493..1042a52 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -334,9 +334,6 @@ static int ms_input_configured(struct hid_device *hdev, struct hid_input *hidinp
 	if (!list_is_first(&hidinput->list, &hdev->inputs))
 		return 0;
 
-	ms->hdev = hdev;
-	INIT_WORK(&ms->ff_worker, ms_ff_worker);
-
 	ms->output_report_dmabuf = devm_kzalloc(&hdev->dev,
 						sizeof(struct xb1s_ff_report),
 						GFP_KERNEL);
@@ -361,6 +358,14 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	hid_set_drvdata(hdev, ms);
 
+	/*
+	 * Initialise ff_worker unconditionally so it is always valid to
+	 * cancel on the probe-error and remove paths, even for devices
+	 * without force-feedback (where it is never scheduled).
+	 */
+	ms->hdev = hdev;
+	INIT_WORK(&ms->ff_worker, ms_ff_worker);
+
 	if (quirks & MS_NOGET)
 		hdev->quirks |= HID_QUIRK_NOGET;
 
@@ -377,6 +382,7 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 				HID_CONNECT_HIDINPUT_FORCE : 0));
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
+		cancel_work_sync(&ms->ff_worker);
 		return ret;
 	}
 
@@ -384,7 +390,16 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 }
 static void ms_remove(struct hid_device *hdev)
 {
+	struct ms_data *ms = hid_get_drvdata(hdev);
+
+	/*
+	 * hid_hw_stop() unregisters the input device, whose teardown can
+	 * re-queue ff_worker via input_ff_flush() -> ms_play_effect(). Drain
+	 * the work after hid_hw_stop() so it cannot run against the
+	 * devm-freed ms once ms_remove() returns.
+	 */
 	hid_hw_stop(hdev);
+	cancel_work_sync(&ms->ff_worker);
 }
 
 static const struct hid_device_id ms_devices[] = {
-- 
2.43.0

