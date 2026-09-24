Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178DF30DECB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221373; cv=none; b=cQhKYjjk8QsvH9MJgGi8fd62fq9ya4XFHDBmrCpuodOsYfedvVIwD2bUpOPjyFV+K3VIrlFiQ6v1TmyG1lmLhC3JOWAPtwMSpmETWw9LXXh6YHPYoyFtROnyAa1Q/6iYdugeW48soZW0usWWMAMKIsbfmxoISLAPEFGho5FX1ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221373; c=relaxed/simple;
	bh=L7Qj0R81FVetP/4gVv5QkY4ivQKBZys/aLRQObP1Z/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdUfoa6vT9IMu/WBtbECwwaRiVVH67WpjH90Vd4IjQ7Bi5aiqiKv2bPB+ajvg+7YM6Mr/x3BRV0aLyEGaOHYP0CYeooYKg1tgWzlF6T/ris0IMljCLbg9IH/TxpfH42HJzmv24WwBbESJcGu9FNdS3JsX5l3vcTdSGN5JLfnDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/U9HuQM; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/U9HuQM"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91400f92ae8so11017066d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790221367; x=1790826167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yFANMoCUp7JOoOigAwUOA4gmgxzBSM9RgfKkSVfdaA=;
        b=i/U9HuQMuFeimXCIazXolokMFgaDQBJRwNBVJfgOa2zxMRNeh/D4moi++3s3gvdKBE
         4fUI4uJE3i56Jj4pGNZq0dhw3HNJxIC1YaPem9yZASOGbW2HWsetFQUbvuz5h7JjUMfo
         hnYlg7GtULycFTSVmDYdEiEoXP35W1NKMl8iC4J4BZqkcnVmFUzYgUilwIP5+vQb+uR0
         PArP11Hm+dVzs2na91uVH32oypqf7ssTT8bD7Xa66YsN/36HklG7ZbVR2aAcSds4IxBq
         MeNHLeG1xmtxmGNK0A8nYApE/giapcITbABmjLqIPcRqiSmh1RGfsTxw6MNJ38+upTxv
         Elfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790221367; x=1790826167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yFANMoCUp7JOoOigAwUOA4gmgxzBSM9RgfKkSVfdaA=;
        b=Yzp8CTrRPqUbnoqFQ+WD+DSQz/zGMNGH7qK7eTXkyjQw75yUEtquKijGFz9lghrY1b
         oLSeK5zHZaA+uvx1Y9t47bzd/ChJWIFvmEg+tgOo+em5Fz9tpwjl0jnLovtJRWXl0HRA
         AsU4iV5dqKA9rUCbiG3+1LCpmR5uIwe+40+46DA/5GVbbw0prusVrMzYZKRaIbOGL3/F
         aEtpL0iOdHDjno/8M8yDzEzLR1Zi945PDoC96muj3z+vQb92yyiFjvWdU1rD+eNxd2PC
         ZFAS6oXJPUdbS6R4NS/arNAnvQTv6gWaURtei6ePlzSJLTDGkANmB2I/9PBDsh184H3C
         4TJQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3yJ3NOvMxlsO2zqII5D2JeYwwsQQJ5ktOZtf2L42PmT8s0UHz4Mid15xVJWWUztqTuEt79g/sr10TopY=@vger.kernel.org
X-Gm-Message-State: AFuF++nWSumKLrA33b7Ofj5LKjJv9h4BswrbtrCWQ9tzMU3pRawvLfB/
	VlfLS6BtzQ6yNwv9soA9MgftYx6ZNecAlArahRD06tc7g5xyoL2MGhF1
X-Gm-Gg: AYBFou0h7OkJPaLI3bN1+k393GRHEYdkcw0bMuwvRdGB5djJP4oKvB6Z2ejdA47uWcF
	umbn8sIJC9Zu6XRgnk7FKUWWzgg6G9Z1tc99yTAFZ9aiZWKqLrJN6Sqn0W0pPqrOtEJizycNf+r
	MT7U6FzZrKlr43tdiM9XUZ9hokUcpDsK3PuxwQ3Ubm8uKmpqPEofMzpoBZsoIVUSm6uIbELrXPf
	HzF4M9nPSgYFLq4MY1SuFnXXmXp6gBhbCHxbJZHovE3tYcka9qL7sJ5qsSHUeU8rUeuR8oUg5si
	RcTqVjVtLhHq11DM6N/c32uAWbXCoF7Iq+V2Ylv2ihXHWPvIjc/V7UQ1DiH8wtlRxnIICD3lCoK
	HA8wOxz3CyeJOd2dCrKHWzP0covr5hDVOwwjtoK4yTQ4TkRqpJ8VUTujC7BZDrXq7thOYleTV1O
	AzAmwW2oZhmNn26aOSTv/zpNhwnh72UqATKjnrVBrfi4TQWd4cEa+4ETyH7Shb/SB6dnf6Ch3tK
	tp7mi6FNbbxCImArShVjy4M9+oskCyzVSZmOw==
X-Received: by 2002:a05:6214:4b03:b0:912:517b:974c with SMTP id 6a1803df08f44-91421eefa65mr5437166d6.38.1790221367421;
        Wed, 23 Sep 2026 20:42:47 -0700 (PDT)
Received: from dhoja.local (S01067483c248479d.wp.shawcable.net. [50.72.244.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e2177f0sm8229836d6.14.2026.09.23.20.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:42:46 -0700 (PDT)
From: Curtis Vogt <curtis.vogt@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Curtis Vogt <curtis.vogt@gmail.com>
Subject: [PATCH] USB: quirks: Ignore wakeup from the Valve Index HMD hub
Date: Wed, 23 Sep 2026 22:41:19 -0500
Message-ID: <20260924034200.421686-1-curtis.vogt@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Valve Index HMD's onboard USB hub (28de:2613) asserts remote wakeup a
few seconds after the host enters S3, so a system with the headset
attached does not stay suspended. Observed on 7.3-rc2: every suspend
attempt returned after ~6 seconds with wakeup events recorded from the
hub. Disabling wakeup on the hub through sysfs allows the host to stay
asleep until woken from the front panel. The headset most likely reacts to
the DisplayPort link being taken down as the host suspends.

Nothing behind this hub is a device that should be able to wake the host.
The headset includes a radio, microphone, and a downstream Microchip
USB2744 hub.

Link: https://lore.kernel.org/all/20260910170254.833871-1-mario.limonciello@amd.com
Signed-off-by: Curtis Vogt <curtis.vogt@gmail.com>
---
 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f0b931..7ededf8d9cfd 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -596,6 +596,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* ShanWan Wireless Gamepad */
 	{ USB_DEVICE(0x2563, 0x0575), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
 
+	/* Valve Index HMD hub */
+	{ USB_DEVICE(0x28de, 0x2613), .driver_info =
+			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
+
 	/* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
 	{ USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },
 
-- 
2.55.0

