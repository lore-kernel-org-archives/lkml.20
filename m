Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204420;
	b=c26Ib/t7q91Ss5rtmDVliGiJeTu4lMt+S5NxDi6QBpYwun1ZFOvFGcuiz86RWgjHsD/k
	 1rcTLvKyfvePhLA0+OZNSkI5vPJkQDPHCJIx9q4Obx9P3zC3YWj7MVawsSzVAUkjWKFNb
	 pZlKmGBXTKijRg8xPBo1ZdrPUPMFotybVlHlOO3+fwRM5S4/MDHNuaAGG/V7gpcr9TG0O
	 AIqZFG13EpUI3zr3q4AZY2jc4tmrlhWVykYcFuyH2UTNms+LgAh6fN1SVaPlon7YJTblr
	 jE1PPIixkZSaBgTHtZuv95qpmpK7o7GBJ4NX+8aVRayUide4nar3dOjX90GeOyII8sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RDa0JQRpSFd64FcDNqu+A8RXC4M3Gvi3sCFSGQLCqvI=;
	b=NeIAdbIYrR0dlUrcj6jLdGDgxl30lAf3jW5PuBL/PBYS/UIzNZpz5hTQGCOjqF4QDjAX
	 5OrHqURCWIpzaLVmGDh7j5rSH9yX71kRcHTV2BIzZ0HRXNQdLERQZC80OBspi0pFGjuhr
	 sDiaO/7XwAltIEqzxTkObW4EPGpj6+FV6LfPC/uNsWiAxjnZgyckGr1CjldSfC7Xpweam
	 gZn64bkIJGsHZ2vYVrJyPVaIkVs33Em4mulWAfeOTPrTw6Xx6TdwQP8xFJpg+yG0p/T3Q
	 3fDhV8zKdomGTxqbpVAZh7sVfwDsknbQky+wNgCwDhy11TEqwL5jn+iyxA+4lXQNh8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDeq9vm0;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF9606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAEF9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDeq9vm0
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1225738eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204419; x=1794809219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDa0JQRpSFd64FcDNqu+A8RXC4M3Gvi3sCFSGQLCqvI=;
        b=PDeq9vm01rgqhK9bmX/OE7GH1VuLm23QvDHZcZASR1CG5FzPfl69ejROO6OSHTh5Av
         +146DoFfzA/7XNgUDpLF/6NUKyTahSnPOykgCDIqcxGxt8mcJiZ0LPp2rpeZGlY9o1ay
         nSw1hL+32akar+tBTnv/C45ZN20l50zUOa0W5s4DIAGmRjlMAFUGJ519y1/FobQY1lIS
         OMZt32c9RwhrUG22nzMvhoGWT0mHGpfTyb2dnxNM3L1AL/qRTNDMNxPHo7EhLcGC0MAZ
         5aqyvWG8UhY+58BvW8FbrGKqJepydJpUrq7yoYvR8i9KSGbKtbJU6QHsTn6JEsci+zdG
         0iYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204419; x=1794809219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDa0JQRpSFd64FcDNqu+A8RXC4M3Gvi3sCFSGQLCqvI=;
        b=QPMJ5prmpdD2ZKuthKyWTMRbsmtKCWHCXuT8Q2bI7+K5Bc03UKQgdgjXUWCeHwOKlP
         RTp6ASlh5+1lJVR7SSoUN0N4K0Jbf5sVuHoZpAH71dwKM33E8STMvmFBOR0MXZVVfznK
         xh7oDw9BXbD2LtNgFvBh7AMdKsAEghHsykq2100igCopwXvP/19eZ2xiEP7KfggILRzv
         PAWd6lN2RGEFGrRTNP5J1PzaaiPywHJpwYk/8EuxzuLzli0rpZzI3D4V2bGQV2/anSpd
         QvXdArRPR0pnlD2+18lNe4i7XvTYF+sodST1KgpudRO8vJDcoxrx+Q5v/mtP87pCnCAk
         vXRg==
X-Forwarded-Encrypted: i=1; AL+hErGYh8S+lsXxemputeUd5YT2fdYaR4ryJEXMQuAGbnyGV1RIC7e1ykLErjNYQMM5456bKhowUAutxdskCxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yg564/rG5LRrV9XZXweNkwmrhVLkb8aAhT5TJlNatbf2arPRH
	BvWboXSGbAfdnFUDa6bu2EwDPMJtgm7EPcmYr+KB9JQJsHrqtTN3Lr4x
X-Gm-Gg: AYBFou1OT8289H6MrOt0v/cikVQt9IPwEU//yG74087bHJl7CfjIVy8bf3L4RcC3QWC
	/NrcMmHrN8r/gI1SFATecyVE7t9LEVytgrjcnDcGhzPUPBudYJ1zGdy323mAG5VAqljGejDbrQ8
	RolrPkaTQNECndLb4cjRV3j7rJzPGOskjGCDLjPOaq7bh1wzC8ykR0EP5P81euERA06duV7Up3T
	nQ0l2LGPvL9mW7M3JOx9/ggfssSrahhqM46GgPLdfHLnqL2PUHuToStx3iFS7O4PyIxoc09AELX
	MQ5OnvKEho2tT3b2iwtzCPePGPbN9n6DkT6ZPsy+CeyKqtLa/UgMsKOH9+wte1R8vgCqppuSR8C
	2++8Tp8MXzLCdSuQH89P246WYWannAjweS+ykN/8mDPF1peWt0Yxsb4CNdQwY68P0QHqOyXYz4N
	OzZ0gD50pRtGE9AkxY2pMCpyxwd9a6f1pi/gj80/IH0x5HJ5Jfv4+DDqxMRR301khjYv4eENBBr
	nJDNevzQgPbqiJWfEYtPwFf5wKjXuenU6pjio6yi0GxeG1qF+kxs9Ux/UE4GeJVVFNIrGUmyAPf
	QKTvxhdovDh4L3yTPcj3q0vTMQKyPj61QJKe55P4NsEHSHjQ
X-Received: by 2002:a05:7300:6a9c:b0:358:3426:d601 with SMTP id 5a478bee46e88-3725b461998mr5714163eec.2.1794204418800;
        Sun, 08 Nov 2026 22:06:58 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10754270eec.4.2026.11.08.22.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:06:58 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v3] HID: microsoft: fix use-after-free of ff_worker on teardown
Date: Mon,  9 Nov 2026 15:06:33 +0900
Message-ID: <20261109060633.1231417-1-hj351016@gmail.com>
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
report; ms (and ms->output_report_dmabuf) is devm-allocated and freed
after ms_remove() returns, and the work was never cancelled on teardown,
so ms_ff_worker() could run against freed memory.

hid_hw_stop() in ms_remove() unregisters the input device, whose teardown
(input_ff_flush() -> ms_play_effect()) re-queues ff_worker, and a work
left running after ll_driver->stop() would also issue an output report on
an already-stopped transport. Disable the work with disable_work_sync()
*before* hid_hw_stop(), so it is drained while the transport is still live
and cannot be re-queued during teardown.

ff_worker was only INIT_WORK()'d in ms_input_configured() for
force-feedback devices, so initialise it unconditionally in ms_probe()
(making disable_work_sync() always valid) and also disable it on the
hid_hw_start() error path, whose unwind can likewise schedule it.

Not runtime-tested (requires MS force-feedback hardware).

Fixes: 1cfc77a64b71 ("HID: microsoft: move FF initialization to .input_configured()")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index a7d3493a6141..5e4218beec92 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -335,7 +335,6 @@ static int ms_input_configured(struct hid_device *hdev, struct hid_input *hidinp
 		return 0;
 
 	ms->hdev = hdev;
-	INIT_WORK(&ms->ff_worker, ms_ff_worker);
 
 	ms->output_report_dmabuf = devm_kzalloc(&hdev->dev,
 						sizeof(struct xb1s_ff_report),
@@ -361,6 +360,13 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	hid_set_drvdata(hdev, ms);
 
+	/* ff_worker can be scheduled from input_ff_flush() during a failed
+	 * hid_hw_start() unwind and on removal, so initialise it
+	 * unconditionally before hid_hw_start() rather than only for
+	 * force-feedback devices in ms_input_configured().
+	 */
+	INIT_WORK(&ms->ff_worker, ms_ff_worker);
+
 	if (quirks & MS_NOGET)
 		hdev->quirks |= HID_QUIRK_NOGET;
 
@@ -377,6 +383,7 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 				HID_CONNECT_HIDINPUT_FORCE : 0));
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
+		disable_work_sync(&ms->ff_worker);
 		return ret;
 	}
 
@@ -384,6 +391,16 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 }
 static void ms_remove(struct hid_device *hdev)
 {
+	struct ms_data *ms = hid_get_drvdata(hdev);
+
+	/*
+	 * hid_hw_stop() tears down the input device, whose input_ff_flush()
+	 * -> ms_play_effect() path re-queues ff_worker, and a work still
+	 * running after ll_driver->stop() would issue an output report on a
+	 * stopped transport.  Disable the work first so it is drained while
+	 * the transport is live and cannot be re-queued during teardown.
+	 */
+	disable_work_sync(&ms->ff_worker);
 	hid_hw_stop(hdev);
 }
 
-- 
2.43.0

