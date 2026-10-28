Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227771;
	b=iSjPX3BGVzCyHxKjBLZahZbo7rjFkQthhZVSVqKJcZ8i8fhEyg9Ftj8SwkoT0EhhQYwn
	 t0Jfn2glPV5cMgqVqB49N0iLR7cNQjiXIifisRBj1nfn8MiH64F8gyRon+9FKz+p/f0f+
	 QFIeyWGSNh8fVtgnxERqL/YFij1vpoW+kHOgcCgJ++JipvI59+kfQT2bABFToyFW0/J4Y
	 KXhVf38N2cSEXSCtpVR4wruIJYS9HSCGHicOy5MZA/yA5PjiaBgjK28GXs9DQnBVAOXpd
	 lmufx+NXWsAKjHWsV9/QNxWPGDL/doOT1mOWiAcK6bwWjMNuRXz0CepPIkFd5QoIo6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227771;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xdi613cw/xFloJy23B/sfPOsV6/BpzP122gtrpKo4nY=;
	b=xIJjFSd+HJz49KVPqcZB4BIsoS8LcbI83lKRxC1yp3jJ+gBVnW+iO6DY8K9Oe0LMRm8g
	 /duIl7qzooSnQ6icA1bmXvqIbK+J9Z4MkMy5aYA6s0IZ3D2khfS94XEG/df0se6dZ20gO
	 D0aGypfUvQ18IsJhSN+Y+wnXJXJpyfuR5Os6bUpEY5h3z0cfPMPD64klt76sQbcTVsVPC
	 hG0JKFrciNqY2bCNYulcI1JwM8Mg8rR480E01Tsg4BY99xhLQDQPDZ1m3mSLXJVVFqFM/
	 +n8BQPWNNh6rPr3+pLRqhV5bH8TL8qXxp3d+msa82QcmB+k+BPDYU8Z3kTdMhFmh/kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=bTHRUcgm;
	arc=none smtp.remote-ip=185.70.43.172
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97003606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97003606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=bTHRUcgm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793227768; x=1793486968;
	bh=xdi613cw/xFloJy23B/sfPOsV6/BpzP122gtrpKo4nY=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bTHRUcgmJIHSpSCu9oE47TJqAYtGLUQrYRXsGp8QhAI1vAhoCEar842owzsOgWbz6
	 /bTrN0VNOGHORwWKiVoUpekk6WlYHPfE8yw+HbKVHSY6BTCDhh79jdy4Te45ij6RwI
	 xqYkPgQEfJf/ZlvbGmrSEhGqgP4xtTjo3kg6fX8u0DwELWd0xaCE0fODWXd5rZ0EBe
	 5S246/hQj8MOUgx2rUefeQbFPY2lUq3Fo/wZpUBuR+vIauJ90vE3tXk6Epfqajhf2Q
	 GZRTiMqTVoeefsB11fLdYnBD+ulT8j+yt2PqVO3LJ4msKZJt5HO2fotEDKQVV4cw2l
	 HV+sKvsOwG6uQ==
X-Pm-Submission-Id: 4jFMxL04NNz2Scmh
From: Michael McAllister <me@michaelmcallister.org>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-bluetooth@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Michael McAllister <me@michaelmcallister.org>
Date: Wed, 28 Oct 2026 22:34:38 +0000
Subject:
 [PATCH 1/4] Bluetooth: qca: Restore flow control after a failed power pulse
Message-ID: <179322687811.94538.3167666394055235284.wcn3950-poweroff-v1-1@michaelmcallister.org>
In-Reply-To: <179322687810.94538.4628148055419456389.wcn3950-poweroff-v1-0@michaelmcallister.org>
References: <179322687810.94538.4628148055419456389.wcn3950-poweroff-v1-0@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

qca_send_power_pulse() disables hardware flow control before writing to
the UART. If the write fails, it returns without restoring flow control.

Restore flow control on the error path as on success.

Fixes: f9558270b85c ("Bluetooth: hci_qca: use wait_until_sent() for power pulses")
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_qca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b63..8705c4543 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1424,6 +1424,7 @@ static int qca_send_power_pulse(struct hci_uart *hu, bool on)
 	ret = serdev_device_write_buf(hu->serdev, &cmd, sizeof(cmd));
 	if (ret < 0) {
 		bt_dev_err(hu->hdev, "failed to send power pulse %02x", cmd);
+		hci_uart_set_flow_control(hu, false);
 		return ret;
 	}
 
