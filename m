Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624960;
	b=vhy6zCPK6/TfUTCffd0iV8ULuo0d/eykPt1nuMSDU32c6NJsDpY8FezgvLVY+wngo4Ia
	 QV5Ew0S1qCkrVXjqniFwk5dhz0Rd0K2pHAtZMq91o1tFqJL26vNo1ie40fCv7h+GoOxnJ
	 ag4b0QqMOAUmkaTvaFWIxlCKEfK1lGUjMp8MbXaLLkB7wv/o+DVJRvaRE23HwtRCueTr+
	 IocypdRkEXVHEICe56EfXrFPcdolfrkyssvCLnEr/EjGArxBPWQ/1Te4rs3cVEaW6Rv0r
	 9qoRhJgRHHmAYaWZZ2N6s62x8M3dMPtdUVCktFWT2StSXabodsB0A+q4gIt/bnY+7lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yRxvXKtdENZrT5ZRlgClS+vF6Rur1KNJc6XxfZ08fMo=;
	b=0PaMBpz7DX5z4wC308q931jMZx/Gbd+JfePv6ryHGAckiOc7lE+mGBvWIlF6jMxWEKMq
	 BrrbCpf2rBHp8kQYUi9sVQcF+rwbUbtI/Usmengz10RvC8p4bXEPNi/wIeQ8RdJ/TYrtX
	 OCAUCt0a2iefoSI/vz7Ir4cF32KQ+sR4L6gKSghf7uvyqAkL8kubCNHkLw7w1mSp3XDdI
	 6ccijlR2sQTY3qYAZmN5ASA1+h78hA/ZqGAHTR8udo4nK18taxq6b7kcYhdfNtdxX2S3O
	 2kzjLLB/dtx9/civEH59XtFz4Uj1EVgPDepWwlpcdzmTBA01qCH+lmmG2xmQVEFRCEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=6+FWIuNV;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D7606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 748D7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=6+FWIuNV
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so19886045e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793624959; x=1794229759; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yRxvXKtdENZrT5ZRlgClS+vF6Rur1KNJc6XxfZ08fMo=;
        b=6+FWIuNVyTFdJ7aJhGYkpX32QTveys6sOEcbU3g3eynEfqCg2g+TqSL9M+/rGJJth/
         81V+rjaKSxzeHRrRsBfONAj4Ua9ItATefk3SYUhyQvrpbw6f0KlFYmNBLclG7ON8AYrX
         RlLqdp3dejqrE76MEFyFeNGbXTG4UhE1Vs/Orl6VLraYEGPe/m/0MnCc/6Vfdcl8UN7t
         ghufsy36VMlXpTWMHvBz2ggj9aXwQSLHUo2WQdEZysWcYf0wuXaBO46zFjQBWkG2Llyf
         UkS6bhGDT7oS9dMMX7QvoLARQnIY6c9/wItWWis25KxymsdFZseSYiDg7NFTOtuW+p/z
         hqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624959; x=1794229759;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yRxvXKtdENZrT5ZRlgClS+vF6Rur1KNJc6XxfZ08fMo=;
        b=cDESffAQaaIdTu/95bEzm9uQWqXo6F+qpL0tLUFmeb5F4cNXq/5pq9+U0XyYX+T/7F
         4Yz6UCWhLMMILbnmNgA81PT3WqMfizMmyQy7e5AhtILObF1XFXR8HVkk4ztI8MU4ba1I
         rO0KrqmsMj4P7iOGZkZ9ZFMnH0kCtgEKbqpnl2SLc14/urigyl6rJ+1FtYJNz+NutB10
         RUDWLAMkCyUNxmGKGiTGlAfkUttbAZJS3RcsPZlshfkXn7U+T8+R7Mf+kmUuDl1PuGKB
         55jsG4pACtE7RQSpW7BEHL9bXM7ykpor7HbyN11aU1FroBKtPqYNsuysMZabBaiTxBSv
         8haA==
X-Forwarded-Encrypted: i=1; AKwUvBxPfzRJ6e9NpTgCXfRyCfgudw1A5zGUI96eINaOblpCHRv9bFrFYK71WJWlX7dkGy5UgrvwKAEQcuDaSyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW2D0ALe1Jnd7nRdyiE3S/LAtTfTq2Km1Z7ptjBPIIIzDU+nwA
	/EM2AeIZhQ12aqHGREgcQGHrfF5jII1kuZxzlUcNxi7kNZQjzV+wgGynSzKg5QboqFI=
X-Gm-Gg: AYBFou3qFqYkmQkWHXX0ZxG7Y/LLEeGFB3GKaELXq74r1ImySKQipLonrtD/I7xYKjr
	T90YiFFmVlnG+jher7rXEqyd+o8lx3/02IFrh8biCxpB5AzXmTz5viPjUss1GYXKeVM+QZolIuU
	FkIDGcNpB6awwW7njAH0VVYnCFhKqnoOQ9Rbk7JlamU4/khfxdmg0UWHVgTX3Z3TDKydSbbcdui
	uW/nHYASeCtOcUEaxgzoZSkyseEXc/LImNZDwEXadYatgVP9HO1BonTKAghFzH8nSgMDJ5AI9J0
	m9e0glvfVgHkvltjDCT60JUTfFhzj3OECP0AYiZUKP/7gGQn5PIsOlKExGqIH6vsJZqycZfn0Zi
	dzGusMwDf+3yaJnlQr9lRG3XowtBnhKGuGUJBselWNTGBqhf8AE6kkgp/A9X3INCFcFkLNihrUM
	OOv+/CnpRM9Se342WPYWyWGy09gJocsVX2+1zWFztD5EDglkq8qt3hhJnAn4pdJ0TVIZ2rQtXL/
	Z6KjkfqcLgK+vUTYFdU/qF/a51HoZU/5iTPXHUAoI0J7wmq8uCYmlyy/BN8zGUUsh0OeHJMI7ge
	vLKuCckj3Z8D9n3LsRKHU/nP/amDkbbi0nA42Dwtu6FFx1b48DH7obdOi7dfhZAuS9Au6JWA0KQ
	uyhOXNrr/Ddc=
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr240844575e9.2.1793624958759;
        Mon, 02 Nov 2026 05:09:18 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7246fsm20324069f8f.19.2026.11.02.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:09:17 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 17:09:05 +0400
Subject: [PATCH] usb: typec: fusb302: Drop unacknowledged
 Get_Source_Cap_Extended
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
Message-Id: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOwqAMBBF0a3I1AbyARG3IhZmHHUsVDJGhODej
 Vo9TvFuAqHAJNAUCQKdLLytGaYsAOd+nUjxkA1W28oYbdUYxbu8Ex2yxYCE/a60QVcPiN46Dfm
 6Bxr5+rJt91uiXwiPtwX3/QA1eD0deAAAAA==
X-Change-ID: 20261102-fusb302-getsourcecap-01c38dccb230
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628; i=alchark@flipper.net;
 h=from:subject:message-id; bh=VuG0QHFfqb3prMOvkI+Bm8+aE20g3JwMuISbVYq90Ug=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS96C7PfFRwo35R7FuDrevihIvmfpicv2LWk3tcp9hWy
 61rY1H265jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqWWYx/JWeHfn2TFvhlUtt2UI2zydGxey307vCEXlwedPG+e1P7RkZfrN4t/b
 vVlGYezb25teqgsksmeq6JxQEVwqp8jUtzt0zlx0A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The chip mistakes Get_Source_Cap_Extended for a GoodCRC, as it apparently
decodes only the low four bits of the message type. As a result, it sends
no GoodCRC for it, but still queues it in the RX FIFO. The partner never
sees the message as delivered due to no GoodCRC, so it retries and then
sends a Soft_Reset. When FUSB302 receives the Soft_Reset, it finally
raises its interrupt, at which point TCPM sees Get_Source_Cap_Extended in
the RX FIFO instead of the Soft_Reset it just received, and answers it
Not_Supported, which is not a valid reply to Soft_Reset, so the partner
escalates to a hard reset instead of getting a chance to gracefully handle
a lost Get_Source_Cap_Extended.

Discard Get_Source_Cap_Extended, which FUSB302 can never properly receive
due to its inability to automatically GoodCRC it, and answering it from
the host within the protocol specified 250us window without so much as an
interrupt cannot be made to work.

This way the TCPM view of the PD exchange at least matches what the
partner saw on the wire. This lets the TCPM complete a PD negotiation over
the FUSB302 with e.g. an Apple Studio Display, which otherwise always ends
in hard resets.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..96dc48250d6a 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1463,6 +1463,19 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip,
 	fusb302_log(chip, "PD message header: %x", msg->header);
 	fusb302_log(chip, "PD message len: %d", len);
 
+	/*
+	 * The chip only decodes the low four bits of the message type, so it
+	 * mistakes Get_Source_Cap_Extended (17) for a GoodCRC (1): it neither
+	 * acknowledges it nor raises GCRCSENT, yet still queues it in the RX
+	 * FIFO. Without a GoodCRC the partner never considers it delivered and
+	 * will retry and then soft reset, so it must not be answered.
+	 */
+	if ((!len) &&
+	    (pd_header_type_le(msg->header) == PD_CTRL_GET_SOURCE_CAP_EXT)) {
+		fusb302_log(chip, "dropping unacknowledged PD message");
+		return ret;
+	}
+
 	/*
 	 * Check if we've read off a GoodCRC message. If so then indicate to
 	 * TCPM that the previous transmission has completed. Otherwise we pass

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-fusb302-getsourcecap-01c38dccb230

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

