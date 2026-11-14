Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636005;
	b=nV+5LgN+cXBBX0194zBGLtdp2OTOUv+USpZLMnd0e6uhi7hitsOTkAUHrWiUCpnofOpx
	 XHGms99xNjmlebqIazmlPMZ+3N95pFswRnb6OEs9n7W4sGG2RDBrtPUVbhCmWMRKQNylr
	 cFzLNLgjZXbeRbWL4ONsTqaF7lrLS7S2f2SciI2BegYUlafX6XePCArsqnFm/AsDKk6hD
	 Qd9VpmJAEuOu4tCWWyie/0GGpfL0x5ewAsW7qSaLXv78rAEp3/8PrkY5Opf842Bln6fIL
	 g3dn9ZQ3xkPsagNWXfsF8sb/BcFsKAIBctsGLVha4pggj27Avvl3QWEXlOGkJ1Ertig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6dI/LFf00D9l6Dp0VtU5TfEwn+pBwd3ZDZTRVLjXg5I=;
	b=Gp0kSRS/1AhM4xFVsZvx/vR8rTbZx6ztGCzFyVvLSpldNEFV3xwXGiQpCRRmR4BfFDou
	 hveYSrJHu8XZd8MdSpE5BAWrQ2pZiy5Tkyee/j2KH9HjW26lgAqcFjSXST1GhOq9y65Aq
	 joUYs12kCvH6oBJ8D9imRE2Tbbpmip162M5eXdjFfZfXo5lJTwZQ2vbP7fdHbo4TIy0D0
	 cSnM++xPM9icJlfzG6W2sZwI4M6D0wGnoz+7p//Sct2NPuKGK1VC3jy99nhwoRnakNNyf
	 O39VsUX5S8xT2EMdvuUcJdAu9rgW74bA9wQdzwOLAU5Salacn3wS2o/YZf11iRemcNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMRQfv2B;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45E2606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D45E2606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMRQfv2B
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so2189295c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636004; x=1795240804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dI/LFf00D9l6Dp0VtU5TfEwn+pBwd3ZDZTRVLjXg5I=;
        b=sMRQfv2BlgTf8PuNd1+mWdpOAge3QsYlqCEvm1dP627o8z9yBr/frCHPVpf+kaxG5/
         WUbtsn5FG56n2IN98tJ8wUI3ZVmHzJLkjX1lUFUSflSdDWodrhzW/FpuTq71eLTSCRni
         b/4NYVlgrjSBX0zckAevN/mt4RqiBRaK0kAh/QrNm44xIpkKbKmVqBl6l2jhu3BTrTBe
         bdLcIP/jTFDS+F2Qy6E+uplGHN8Vq8DUzK2Iwro2/TAYc+RDgp3n9AdNImEMUhfRjlE5
         IJJnVKA5kSNjuxBKWNo2S25f5WY2mtL5nLalMhtCpGI3qJwPrKGlna7xVgmLMJlCnmY+
         qeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636004; x=1795240804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dI/LFf00D9l6Dp0VtU5TfEwn+pBwd3ZDZTRVLjXg5I=;
        b=pdjW+XS1y5oJc6Vdp2KV48JhF9tIUZvoH7e7efnh0pGjRNsMKPnm7IJ7g5Dl3V6auF
         H5YvdgZoa4tth+xhT6L/lTZS18hsOCImVCUfXgprKtf4FOBRq2a4PeZCSF2kgAOzKv/l
         Bh+clDx+v59AxWKvTuMAAtnikt8g+a7uaV2lFdS9SSqCq8yjlJhoPZSoaHSTtqjbDRI6
         fMukasdfDxkeLKj0+pan4X+0cIL04715R9mVRDSrgYeZUt1wc2RxriO7xp+mUfldr7vw
         pmvkir6l0x+Qt/ZNpFk16pAjZwXDh2QtoOeb1ZX5cA/psCeKIyNV+S/u8oJTeuQYWW4a
         ZHog==
X-Forwarded-Encrypted: i=1; AL+hErHPg4gsakU4fiAHZjMBlR0+V5bU3+tugr1Xws0ZpDfZ3Aqulc1yuBFT5p5+XNQp3iW7AT0goyePNpMbDO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SOVA/vxbpMuYP58pjqgAPA+3+qd3xlWOTwFRwM41N+lf6pf4c
	/fPDIlFKp7N+x7zsAMgyW4ijT0ilPgvxGW48GPWpFumu16iKveRhel3gnf5A1Q==
X-Gm-Gg: AYBFou1TRr2KM1i1rCri4CvDEvDwrw+0hRBedUK3sPpoEibphvblsPUBDRxTURfHHtU
	Y6YsWUxgcMGV9SHreIOqYiRssaA2pjsjTf/sBmsqS2sV4vhPtqjC+4Zhvy33mltRQ1N5f6ifaP+
	wxtkf+1ZVY51nJEvOrd8m1Is2s+AnBw0ySx8fZPV+pQZRnVNn5Gjjkha6J+C1PH/+j0BcWgA+Tu
	eiJ5hwdS5WHe2KR7wLo3gSrM2Y3H9jW5GCphs83rIO1OlAWLBvY8do4eqVCr0kMKDv7EN/XHojv
	f8BZ4Qh8nhRIL8LcAf0a3aQ7RUQMFLBXgUEIFzYIoosswijEYhZClqNPry9uAYCG5oRcrSB1/V2
	y8q8PollGvtcJSdz386CEzjOi7eKN/DLu7IPlhpo8WG+mkTTKYa2vAOPKbsUnp1EKniylSpTx67
	3eoer7QtxwQr1udKwF12WgTGyOlcP59TVN958RjNHXLoNO22FzjlP6en0BJlpTx8C/VKY7gUEyE
	OgVrLVe8iynuKdFtu6MkCzVxxmOKsXFsn+rR2UG5MdUa6BqGisTXqtW1bV3GlrzvezMVsJhpjE9
	lHj73QlrDtuZME9zSdBoh3TW0DLPFWWhCh+80t1IBLkFN2eWEIak72WCssIDl6BPpND8banFIam
	nfAQLS043oYAuKZ/amThWsDEiAS8KsQz9XtveAg==
X-Received: by 2002:a05:701b:2810:b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b503124f1amr3878829c88.33.1794636003896;
        Fri, 13 Nov 2026 22:00:03 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:02 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 21:59:52 -0800
Subject: [PATCH 02/12] HID: rmi: only strip trailing 0xff bytes from
 attention reports
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
Message-Id: <20261113-hid-rmi-v1-2-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

rmi_check_sanity() strips trailing 0xff bytes from incoming HID reports
to work around bus corruption where attention reports are occasionally
filled with 0xff sentinel values. Running this filter on all raw
reports also truncates register read responses that legitimately end
with 0xff bytes, leaving stale data at the end of the read buffer.

Move the sanity check into rmi_input_event() so that only attention
reports are filtered.

Fixes: 5b65c2a02966 ("HID: rmi: check sanity of the incoming report")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index cacf81ed56a7..41676685ce28 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -343,6 +343,22 @@ static void rmi_reset_work(struct work_struct *work)
 	rmi_reset_attn_mode(hdata->hdev);
 }
 
+static int rmi_check_sanity(struct hid_device *hdev, u8 *data, int size)
+{
+	int valid_size = size;
+	/*
+	 * On the Dell XPS 13 9333, the bus sometimes get confused and fills
+	 * the report with a sentinel value "ff". Synaptics told us that such
+	 * behavior does not comes from the touchpad itself, so we filter out
+	 * such reports here.
+	 */
+
+	while (valid_size > 0 && data[valid_size - 1] == 0xff)
+		valid_size--;
+
+	return valid_size;
+}
+
 static int rmi_input_event(struct hid_device *hdev, u8 *data, int size)
 {
 	struct rmi_data *hdata = hid_get_drvdata(hdev);
@@ -352,6 +368,10 @@ static int rmi_input_event(struct hid_device *hdev, u8 *data, int size)
 	if (!(test_bit(RMI_STARTED, &hdata->flags)))
 		return 0;
 
+	size = rmi_check_sanity(hdev, data, size);
+	if (size < 2)
+		return 0;
+
 	pm_wakeup_event(hdev->dev.parent, 0);
 
 	local_irq_save(flags);
@@ -381,22 +401,6 @@ static int rmi_read_data_event(struct hid_device *hdev, u8 *data, int size)
 	return 1;
 }
 
-static int rmi_check_sanity(struct hid_device *hdev, u8 *data, int size)
-{
-	int valid_size = size;
-	/*
-	 * On the Dell XPS 13 9333, the bus sometimes get confused and fills
-	 * the report with a sentinel value "ff". Synaptics told us that such
-	 * behavior does not comes from the touchpad itself, so we filter out
-	 * such reports here.
-	 */
-
-	while (valid_size > 0 && data[valid_size - 1] == 0xff)
-		valid_size--;
-
-	return valid_size;
-}
-
 static int rmi_raw_event(struct hid_device *hdev,
 		struct hid_report *report, u8 *data, int size)
 {
@@ -405,7 +409,6 @@ static int rmi_raw_event(struct hid_device *hdev,
 	if (!(hdata->device_flags & RMI_DEVICE))
 		return 0;
 
-	size = rmi_check_sanity(hdev, data, size);
 	if (size < 2)
 		return 0;
 

-- 
2.56.0.679.gc527c65306-goog

