Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614E3AC0E6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857322; cv=none; b=B0iXFUmGMSVAfIWv1HlcxYea8bBV+AR2JIHUmogOBE0Ti++iVgtF0xrH3XU6a9+nXit19531oWRSa4xN/0goyv1taogIchQ7gfigfT3uge2cCjHusN3j91W0Hvrv9/4s1JpFQF5Oce4cUBO9CrDJf2E4y+2ovphUicpuc/UDcQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857322; c=relaxed/simple;
	bh=cS8iDhlFDsCfdLI2+2GVi8GfbEugUndHRep9h0Xdjxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=agjBKUUCoyMDtXBJxyYU7KwFQaIiO/SesmldA2AsK8ZF8YnH21cXpKOEp2J5NuqiQQs5TvzShyt+8zKVBiVrMeWzxgtt9E2dFhnE+dqshU1VELhJz1cGeI/S1+5loFfXYgqwQ/C8qHlV6v164ME4dUDiAIgfua2zHV6Oi3Via/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCmW/0Js; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCmW/0Js"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so1980712b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857321; x=1790462121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNNmBC5JGyAoAwI5upAxEEGlhFHFY8AchPlTKIODuq4=;
        b=eCmW/0JsKfBaGpPadFF/IZm+H8TI5xOm2rlmCUDexF93Xc8h04oI1835yz1x0HcAy0
         K1kNzpziOC6e3V8b6J+53ktPlBS7ppjrel3ZuOdLM2qNXuTklLcSIVf2ELE0qdyyn09U
         r0QDQUHDmRlK7oFsV3bEGXKqFNObTp+UGwkDNKMCyde1CqrTt8izUbGP0lX4R32N2n88
         O8yHa0Cqsd5kcNR41fTxAJmQVyvJgYPDuEo6U3jx5KUMuWTv6G6TcmyvV0T75dqmYRS7
         0Ol6bJe/VyBvaEug7vspIR4wAR/RZFmzm7FjudvC0tldInThcZKtogtTCOe/uI1xcf4A
         Wvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857321; x=1790462121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNNmBC5JGyAoAwI5upAxEEGlhFHFY8AchPlTKIODuq4=;
        b=YvQ9+e6jgKUdHBS4Ga9FRKnyx0ifdxk3ZXiu3lrwnuW5ClBqaZMnURUo8MQIUEZRJS
         iUuFGi5G0sg8EwfYqdPUTH9MWlXrWSPJ414kjGqxMM5PNQZFkp5Ux8wLRMzXf/DYgcVe
         VBUZiId/vvQXKcCDw8WypqWIONbkaUhhwa6suJpz9knzWgsLMLI84uVnu7vFh7iGxyi5
         FvMrKYTyAp+Y9LR04hqpnfeyp4VwGruWzazNzQxH83UD8OOCD4GAgrFlq5iMmC0B1x7h
         iu2Zo4vDM5If2UaRXsZuXa/ZjFJZ4WuFP7fhTKmztFfcQNGkw7oePBPbN99P15U2POkM
         dfRQ==
X-Forwarded-Encrypted: i=1; AKwUvBztWDpWVL2LjcYINCkxU5MhaRZY1+h2qZW7RsnbU7afRZtyBO7n1pfC86w8Z8LwDNkgI7MrIAtdo3rbGks=@vger.kernel.org
X-Gm-Message-State: AFuF++lpkPCPqyIBjsbLkiVZEs/+YHQ2s3n4XB2wh62EHxH9m/Xs4c+n
	J2RNuIahq+ymIGjPLmjYokFe+Etd50XSACd1kaZTgxNM35xXBNz/NSOyQ4IPesTw
X-Gm-Gg: AYBFou1wfTCRjz3nHUvTJtXKl1ck2Hf8zIR+WTWYfXyfLZPykGrSfvGjFk7wrwJ5Gwy
	gkWEdVK+a+xzIoHjewfuF1MTUeV86gKjNmZfcjQCIpa0862hPuYMLJjbw1lRdf8zZYmW1AWveOA
	V0TZrsk8KKLCoSgS/q58atREFjaiG6NxIDHDKxdvpf4TcYdboNp9futXm8trxFC06K+aLQ4EE0b
	4uU0ZcLnTKKcwPMls1RATmLDb5Oi5Iv2Sjaqkqcq+oaEeFO2h/2iVcPcODu2xz6eMLfXVO2Jbph
	Eyr+vXIyBb2B76MbKwmfpZdCmhs7uEVmwcXhGtQc4jS7OOhDoTQ+np/DS/8YTUrcf6J4hEVOOvU
	wgTytwdFPWCpWab4nY8KU0/Cu43aLv3r+HbPcovosnwnRh9gwPBaauHjeFyCYA/I4LxS5paKCg7
	pCMNGf292uYAe7R0n98EqYvUC/jsKppMpFYHFV+qAsyoCjqQZnMMvQa9HfPWwuCdKpMQNF3jHSF
	pXwWXCasV5NJ5tK3O0BKsmxLceyCqk8HLgflX06JwmvxoJxndaNe0SXuc/+bHI1IWwUsdR7AJ85
	useOX/fB2A==
X-Received: by 2002:a05:6a00:1702:b0:874:705d:f65b with SMTP id d2e1a72fcca58-874df609d88mr9194535b3a.41.1789857320876;
        Sat, 19 Sep 2026 15:35:20 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa4fd913sm1355998b3a.55.2026.09.19.15.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:20 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usbip: validate ISO packet descriptors and URB lengths in vhci, vudc, and usbip_common
Date: Sat, 19 Sep 2026 22:35:19 +0000
Message-ID: <20260919223519.3890269-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/usb/usbip/ (usbip_common.c, vhci_rx.c, vudc_dev.c), validate
actual_length, number_of_packets, and isochronous packet descriptor
offsets against the transfer buffer capacity before copying payload
data.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index 100f8920624b..8bd9af7ebfc8 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -482,7 +482,6 @@ static void usbip_pack_ret_submit(struct usbip_header *pdu, struct urb *urb,
 		if (rpdu->number_of_packets < 0 ||
 		    rpdu->number_of_packets > urb->number_of_packets)
 			rpdu->number_of_packets = 0;
-		urb->number_of_packets = rpdu->number_of_packets;
 		urb->error_count	= rpdu->error_count;
 	}
 }
@@ -702,8 +701,9 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 
 	ret = usbip_recv(ud->tcp_socket, buff, size);
 	if (ret != size) {
-		dev_err(&urb->dev->dev, "recv iso_frame_descriptor, %d\n",
-			ret);
+		if (urb->dev)
+			dev_err(&urb->dev->dev,
+				"recv iso_frame_descriptor, %d\n", ret);
 		kfree(buff);
 
 		if (ud->side == USBIP_STUB || ud->side == USBIP_VUDC)
@@ -781,6 +781,8 @@ void usbip_pad_iso(struct usbip_device *ud, struct urb *urb)
 	 * memory when padding) and move them into the proper place
 	 */
 	for (i = np-1; i > 0; i--) {
+		if (actualoffset < urb->iso_frame_desc[i].actual_length)
+			return;
 		actualoffset -= urb->iso_frame_desc[i].actual_length;
 
 		/*
diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c89837..7ef646095408 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -73,6 +73,13 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 		return;
 	}
 
+	if (usb_pipeisoc(urb->pipe) &&
+	    pdu->u.ret_submit.number_of_packets != urb->number_of_packets) {
+		usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
+		urb->status = -EPROTO;
+		goto error;
+	}
+
 	/* unpack the pdu to a urb */
 	usbip_pack_pdu(pdu, urb, USBIP_RET_SUBMIT, 0);
 
