Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C894DEC23
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606234; cv=none; b=EgBKTFYSOeincW/FQR+Fz3zxmXSBah013pny8Uja0xXMjb+1SvpXzJZeds20ql0nXXCmjn8PRBkooqXJaFRSOpjezZoZMLxSOChaAvbXTRowveyQcXcePTukjCbf0rzY9b+v27SEhkq+u5c+GE2sJSD9lrmbKZKu0T8mgZTXQDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606234; c=relaxed/simple;
	bh=2Qd5CT8EGmqw+IvpSGJ6nA9lZT17Gh6gUR/rr3D48Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c25BYWZqbj9kMhUAJx7HvhBBhUczPMmRODys1xqAIBkmF3PJiFfpR7uc0S15D9ZBxzRDFKMetsGdH84EWbsohz67SqIdKMjfHqt6O6drBiVsdBqFaylcCO+NQBs9wVh60k/ww0hIjuYobS/NqrounPk9f8wHUokrVbyR0v00Tsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYNaCeFD; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYNaCeFD"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so291813766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790606218; x=1791211018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c9sPjx5tB+sxVesvbOzF1i1jKAKg5eL5TDc0IJC/Flw=;
        b=VYNaCeFDJrPwDaZr1UFMZjbaIS4pdSkAjud2rIpiy4pfIu4X5MyPf2ukh+rQQWuUrK
         w1ZPAKHtWGsTsdRhSAFUvyornvS4knTXX0PWyTG+4kWq46xbUasmQwkV6dnT6X+WdsPd
         ZnqBHVIdmWMtf6ndpyj5uLwk6uDHKUAsgxa7jDXxHlOPLyT1UHkBhiAMUafRiWkJRPD9
         HfLXXWbtNvtSrP0G/DV2g8VnjGjjfGZD2gU7c+XplPSbWSvDno66wnEmiCJX8Soui8hW
         oXIbYHmM5XL6W53y3y0Lzjz34cLYr5YvS+JrsNhRE3hKTs/wWLA7R5HSTOI9NRc6dZus
         dvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606218; x=1791211018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c9sPjx5tB+sxVesvbOzF1i1jKAKg5eL5TDc0IJC/Flw=;
        b=TzyyoJWptnUpDLvBcoztauUWfXvGdXWBRByszOyuL1uyLM4PmxkvqHU7R4MKHSUYyC
         YqnOsAPXDdGvMOq3x2HXhA5H2smiWrExzgbbm5Kwp1tydpaHS66s+HViuDREtcXxIAMn
         PWPUXEFLjiGr6CaCCdChjrNnH0Q028IZxkMQmg+AQJyN5M81/MFALYntT3bzmr2+M/kj
         NYakC9x0pAnAhLApCg8Ddhp92dQ00AEQVo9E5yn3GrfKFSkV4DoQNNMy7W/6U9taWMEP
         PQ1Q1THi8sPPtqrlVjdxFG0s+seNKdPdnBEZ3U0D+lWX+Vg/Op8dpk4HJGLSrpwp/GzQ
         ck4A==
X-Forwarded-Encrypted: i=1; AKwUvBxJki7t2iGgSZYeTWb+oKEqWY8OPB49YsfnoXYHo/n9VZngVhVNZ9lzD2wSeMnvKoCiQuZtuImfmuPhhWU=@vger.kernel.org
X-Gm-Message-State: AFuF++kGP92nLANVTQzhxdi5EeV5nqM3puBAATGHUS+vW6vvEpIssgzG
	8Kwug5NLgBWMbnpqRzmdBEyUx3QyFh8kEvqYvl9uVqGjljEHEcmza5cdbbEXDDfX
X-Gm-Gg: AYBFou2FU4dcy5B9m1CxoSzjUemXzwGGUPUsqyIa6YoPqco2DTVXcu68zGnMb2AFCYy
	77OAVIa1H3ZF7ySXvwOd+kCspPAgm3hDyeKuJtlAL0xhEp/SlKh+1pKEJZSoSlaTRYz9A/3nV1m
	gQqG5K7+mkSpEeNcu6aGWH+Jse0VMR8pice+xmZkJARcYb3CUF0n0eUcQ8841Mko2/gtAUpx5wW
	6c6Ed0rX9L4uHDoBry8RHFUv6HbeRTyT/4SSgMnqg8Usyjt9oufj0GbPHVEfp04Jlu7lSQ9JPO5
	nJZFrwv0dENYerbNn9hrob7NE04nf2eZszqdGOJklDYtlbpn4OSlg1t/bNx12b6TsVFl2JSrZKM
	VdVbYTb/vOd+Sj466jlnfDTWaD78PFCiRkVKYNKuKsuUT2Zm0X6Bd1gl+RHInExAt3vbw0U2oNT
	tmHEYY8G+u8QQLtFiicLxrUaB6KH3LymQ2lj1rj6NSIhS8Cd8dU3WfrYLwlNzN6UPY044KjkKS3
	Qs=
X-Received: by 2002:a17:907:e84a:b0:c29:5021:f6f8 with SMTP id a640c23a62f3a-c2ac252bf84mr1111252466b.36.1790606218344;
        Mon, 28 Sep 2026 07:36:58 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:1484:7a01:a8cc:a863:c2a1:d5cd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc7b6f438sm260908666b.2.2026.09.28.07.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:36:57 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Quentin Strydom <qstrydom0@gmail.com>
Subject: [PATCH] Bluetooth: btusb: add ASUS 0b05:1868 to QCA Rome quirks
Date: Mon, 28 Sep 2026 15:36:55 +0100
Message-ID: <20260928143655.22223-1-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Bluetooth controller with USB ID 0b05:1868 found on ASUS
systems uses a Qualcomm QCA Rome chipset, but is currently matched
only by the generic Bluetooth USB entry.

Without BTUSB_QCA_ROME, the driver does not load the QCA rampatch and
NVM firmware. BLE scanning also repeatedly reports:

    Bluetooth: hci0: unexpected event for opcode 0x2005

Mark the device as BTUSB_QCA_ROME with wideband speech support, in
line with the other QCA Rome USB IDs.

With the quirk applied, btusb loads:

    qca/rampatch_usb_00000302.bin
    qca/nvm_usb_00000302.bin

and the unexpected LE Set Random Address completion events are no
longer observed.

Tested-on: ASUS USB 0b05:1868, QCA Rome 0x302

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
 drivers/bluetooth/btusb_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_main.c
index be47ac894b6c..1ede12515bcc 100644
--- a/drivers/bluetooth/btusb_main.c
+++ b/drivers/bluetooth/btusb_main.c
@@ -273,6 +273,8 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x0489, 0xe03c), .driver_info = BTUSB_ATH3012 },
 
 	/* QCA ROME chipset */
+	{ USB_DEVICE(0x0b05, 0x1868), .driver_info = BTUSB_QCA_ROME |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0cf3, 0x535b), .driver_info = BTUSB_QCA_ROME |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0cf3, 0xe007), .driver_info = BTUSB_QCA_ROME |
-- 
2.43.0

