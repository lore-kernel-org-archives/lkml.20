Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627093;
	b=aT4PPoperfga+Q3RJB/3mc++hn/RGSk0XjWVeJ/Kg+6iOy6Z/VDyZg7jxMy5/rYFJWit
	 jlsnzT/q7LR5rn7Q+Xtm+7IPTdZs3fVac0hLtYkPNTF3AObA7lEUPTBwQdDg61MFn/rkj
	 E/pE+++tEGY0/r5H5iUc+rxUBGskPcpqzsJ/UtnIY0w5NPUp58PLtO3BYcM1bTpSaWH5h
	 YMtfbtOa9dxKIJ9yXyrDyBeKnXwYelFuLHyZSxNf4/rsdFr2NIFhCqYzWnmRBEq3rsg6y
	 wyKjXgk8sdony1Dgv8phWEqyP+d8kVXLHU9TbYD764Y0jx8zsGpQ4/q94tzNk4NuN8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wwm6qbsytzzkGHZsfhcGJGTxS4KImsLSiizWaejTwbo=;
	b=erXtBIYlMjfAjSte8ytq2e3t5LhFsGcqep1kSTQ95A6xf7fVYBqypQvWDOBP8SKlrFeg
	 07Uq6LarMdu+thrlHLStJ/FsxsfCXBGThmm/DDyxQt4Hbv2oCPW7Ff6IRRzlAYZgJrPdM
	 aye5EPheQL5HGfBUwYxpo8BJ5qcw1d46ORJX7yJCJ+C0pLMZLgakKKbF3ICVaRUOSj9KA
	 qlx0QV81v3jpFNOavHHwrIE89IvN8izi3rnreh7poz07oPAyLkigc6RxFpkFLoAXlKTM7
	 kn9c2HrsvHoS2TrTdz2DZNFifFXyk8dyBLb46dBJJrm7StyB0DDeU0OVly23WHaPa4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ySDrHNNG;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61694606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61694606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ySDrHNNG
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1643593f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793627091; x=1794231891; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wwm6qbsytzzkGHZsfhcGJGTxS4KImsLSiizWaejTwbo=;
        b=ySDrHNNGfa/gVugKJIu7Hz6xF7Ugln572O/DREbdJHglOvl/mfbwrkyNd9uWb3UdA6
         qfMyUZX8/Q09TlAa5dlhFCpLcI/+wE9BFTG5VyfpboZgOQH5kiwGUnrKaG5KM/2Z1JsC
         qwACbCSXOaPqgD7vKc5hPWWF2ftbxGZdUS9BQAkXL7Y2pyNo7ST08XTOJVJwaett4Y/n
         haEhBegNGsUYri2qnrQvVy02g0KU0IJcrEgVr1EDpEwYKzKVBQlR5nf7vMDJaoK60Ydu
         VGXTzneD7vvNRZ8MLmY75kpLlKRZv5UMtWGcewxxqT0L7IbVL14Zbsh8KI72Vsl+CbKQ
         q+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627091; x=1794231891;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wwm6qbsytzzkGHZsfhcGJGTxS4KImsLSiizWaejTwbo=;
        b=fDt8NGCDmZ107XcE5y1675NItCo2HH/Rxq+KbJj7MXQcuLAgdNNAqWtjX8WkbKK4Ow
         cNpNNIYImzZK4IzsI7smydat6ZcshihuA60VVeiOkojgkbod1UGGTuEHbxZ4hk1HRH1N
         bvVs1ZmTO5GbWo3c8gVWm7paIla8aNZn/9sMXDcBT8nZT5d1ESvk8t0GxXbX8NXqhks7
         FDBtcfhXpTA2cdmYFcDdvHdeDYC+qiGUXYLcTIF8q8oN7aK8Hez1m/Lfea0Y9yf0zYqu
         0bcI4z1s02CnQSsBZ5fMrUUUivIqlapetHMrhp52BBX0r+8JHrMEFzuX9NICTh99dHxx
         X3Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzo+ujEYHuJeCtLOTfqtAfpgoi83VEPSgAmoGsmZQS9syGpbdkZeuAxcvD3Zi0nkEO5oCa6QkDxeS6pUMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sJXM8S0M6qsMx0GbcMWpZyxKseLQ0lucI+4ka3DEP0WXC92Rs
	wJkOig2U4CnyPh1JvDlophiWX31unckSUF8iO2uuowtQ26OyuujzzjbnF3KJ1gV/x+GiWdEUP2Q
	s9vCsj6dJzQ==
X-Gm-Gg: AYBFou3tJhx6WcpLY7g7vYcGj2msd8e7J9IEaeAT5daUtAVkdOLg8BBzKRlblXB0mC4
	0JT5oRi7V69gpZdd7lAZFeqO9yyyeLUWEQ8WxAqN1nIoEv5BxsWN385JWTsoYHwD6uJHZspQ1cv
	oJxm0hemO2TK5LTIH2FUiDOC1KhzsPJIqhZx1krt0VZ6fcdzuVKEbc2mZ9ywgAmvpZgu42GCcBn
	zSO3VPq1z5qJb88uEmCldPKeC+2KcbCKIcn4hk6IHl6bQ/9HJcgdW6f3v2EBI0eN9gTnzrvviCE
	sYfgXPAI+vKGVKvJDWr83Wsx7RJhfqFY+aylV6mHI08diq8Z5GctyKvoncCbyD6SxzwCkJCOqjn
	g7bh1kJzZaqvVRSZhChde30aIR1tM36NC7Qve45UExDOr1cLU0WfBS+M1PBkmfvattqjFfvzOPc
	8Y0zYUcgdC7ChvozkfZ0FXz4qSUMbOgSGrW8HTth0+x0aYHnATnIAdRwr0AzqOvQjfXfQIv5+pw
	gWpfKtnxOR2qd5Z1ySJ00wHnQjultyi4sG3eHgQpnqVzTMzBW8V69HiVyCxljaAifPierioLxgl
	fktl/yThnqJ8r9KDHTRqLldz+OxMJw/hZwd+iWD/Gka9a4dLkuPb13CrdNaPZxmCVcVK8txyhPc
	QGSq2xl4p
X-Received: by 2002:a05:6000:1785:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-48e6e2e7536mr24565799f8f.20.1793627090652;
        Mon, 02 Nov 2026 05:44:50 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm21458046f8f.34.2026.11.02.05.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:44:50 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 17:44:38 +0400
Subject: [PATCH] usb: typec: fusb302: Send PD messages longer than one
 SMBus block
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
Message-Id: <20261102-fusb302-long-tx-v1-1-0d2719488c3b@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVppwnhKmKBDkakpINIxN0Vq
 5dv8f4LhAKTQJlcEOhg4cVHmDSBbmz8QIpdNKDGzBiNqt+ltXHnxQ9qO5VDpzNy2BQ2h/haA/V
 8fsWq/i17O1G3vRm47wfaKhPqcwAAAA==
X-Change-ID: 20261102-fusb302-long-tx-d2d06ed2a937
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Av9g8CIrddhOQAEZgePh6PHOdNGh8X1Rd13f1J40/s8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9mHzmP+NMh3e6PVtfXxM4+9xoFc+N68LOeb6NKT3f1
 7Myn3II6pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqoyYw/PfljIzYNFfo169Yxhuyf41tbTeITNoUzp2dtmJ3plvJ4teMDKfd/aY
 c2Cb81vTi852v3tu+rns/T1DpTqm45yOuCZz6urwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The whole message, tokens included, goes to the FIFO in a single SMBus
block write, which carries at most 32 bytes and silently drops the rest.
A message with six or seven data objects needs up to 39, so it loses its
closing tokens including TXON: the chip never sends it, the transmission
times out, and the truncated bytes stay in the TX FIFO ahead of the next
message. A Discover Identity ACK carrying a full set of sink-vdos is one
such message, as is a Source_Capabilities with six or seven PDOs.

Write the message in chunks of at most one SMBus block. The FIFOS
register has no address auto-increment and queues every byte written to
it, so consecutive writes append to the 48-byte TX FIFO. TXON is the
one token that is not queued but starts the transmitter as soon as it is
written. It still comes last, so transmission begins only once the whole
message is in the FIFO, as the datasheet recommends.

Flush the TX FIFO if a write fails, so that a partial message cannot
stay queued and go out together with the next one as a garbled frame.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..e10b7a4b679f 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -967,6 +967,7 @@ static int fusb302_pd_send_message(struct fusb302_chip *chip,
 	int ret = 0;
 	u8 buf[40];
 	u8 pos = 0;
+	u8 i;
 	int len;
 
 	/* SOP tokens */
@@ -1001,9 +1002,23 @@ static int fusb302_pd_send_message(struct fusb302_chip *chip,
 	/* start transmission */
 	buf[pos++] = FUSB302_TKN_TXON;
 
-	ret = fusb302_i2c_block_write(chip, FUSB_REG_FIFOS, pos, buf);
-	if (ret < 0)
-		return ret;
+	/*
+	 * An SMBus block write carries at most I2C_SMBUS_BLOCK_MAX bytes, and
+	 * a message with more than five data objects needs more. The FIFO
+	 * register queues every byte written to it except TXON, which starts
+	 * the transmitter instead. TXON comes last, so the message can go out
+	 * in several writes.
+	 */
+	for (i = 0; i < pos; i += I2C_SMBUS_BLOCK_MAX) {
+		ret = fusb302_i2c_block_write(chip, FUSB_REG_FIFOS,
+					      min_t(u8, pos - i, I2C_SMBUS_BLOCK_MAX),
+					      &buf[i]);
+		if (ret < 0) {
+			/* don't leave a partial message ahead of the next one */
+			fusb302_pd_tx_flush(chip);
+			return ret;
+		}
+	}
 	fusb302_log(chip, "sending PD message header: %x", msg->header);
 	fusb302_log(chip, "sending PD message len: %d", len);
 

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-fusb302-long-tx-d2d06ed2a937

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

