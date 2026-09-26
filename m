Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92E3BE179
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434188; cv=none; b=HS0P6oIZ720J/+WwSou/drmWMvA8wWUTXAI79BCgaf2G0ZmkVQirLbqM0Y0ob6ApGI+mJ3OqTWBv3Pu9lMUwLjz6UCSjnBL8WrOPileMmh1WX3sSjdJ0gTsji6woVuFV6fYFR6xqeucbQ7Z7t2yHUsUdkP+0boUw3hnfKCIYtEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434188; c=relaxed/simple;
	bh=O4ei2s9gZuecLamrTdJFFCxcBL+em9k63fiNXCLXqzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cz+m6ugnDNB1f5qTVKEo3rO5J33LJHnidmID8mpE+7v96daXQFZoRDKdocn3v2DwW/kbRbFrBss0376TiOPy7IfwGR3qEMNazxuK+0Vun98jHVsZ7CfWWFb7a6hMjmM7RSJsyUcRo9+VaodftIj5YMc/g1m2emckZNGUBY+dsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qp2Ww90z; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qp2Ww90z"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d90ba1d807so14044825ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790434185; x=1791038985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxnEwlfneT94G2UrKcochh8UCTOdTS8Fzu8EtUevf3s=;
        b=qp2Ww90zkqywzHPDhgrZqLYZkkjgVFTs+7wMumtGuxSvnBFuqfPm720+/gaLeoUafx
         HyWcc21HV02Wzl1EgDsXLDuGYvmK2GPqtAsjZF+iZuZNlLr83yiWoUDtIpVrzSHPgYAv
         qP7LlLOxtl7Ax0rWyw10zj10FYEdtDCs+QRFm7CxrcHWAofs4ydb64b5O9IQG38FPeMo
         h3Sq2sXVHxncoEsy4AngWZx7s/O4AyRvMkp013z39bZkXx8Ib7Qh51Cf/ztWpPR7eGHN
         5AXo4ripakkqKWH6F8zKWj+3Q5U4MMErlObyMnmFtjP8i8JA7MU4ARTb2IWXRjw7yVL3
         ehTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790434185; x=1791038985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxnEwlfneT94G2UrKcochh8UCTOdTS8Fzu8EtUevf3s=;
        b=xCbwNeVTAYAn52HKwQZCu+wPamMBoJjlsQhFHN+SW/LM4ko6DYdD0AHvDt93cMNt+i
         toC4Y1Y6XgCUtLCXDuxtsaAcaDGq5vedgd+amMRCf1MYgwcPMetl7zM9x0xtSdlBARXP
         POz9RQJ4jW2c5nTWnDDy6OcWj2VpuDWv/n7uo+WDnVH3KNBZ6hr0VLmcPC9ND3CKdPJx
         hLcHvQZBHsuqa/TAC6SpX2xsJgp/9Djk7mynKSNQZVqJGuh+I34Zv+7Y3AfV3JbCEeN0
         Xptdc/SrlZIIN0xhGb1UKlsBbnOxHzaUNsaFpGmyHMkUW6dYudotUTM5YbmbpRQ37Pn6
         JVFA==
X-Forwarded-Encrypted: i=1; AKwUvByfYsvOFlvpOzHxVanSelWbuMn0gkM378ARIfBtYLkhMLFV9+gJsdZxRsxdb2fGID0gkvsLXbWdkBqyRNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGE4ZAafDdhXpmSQWm8VvckzruKOY8ajMDL0Q4FlTrdyItucDS
	eAPWkfZZwYMwxdWcSYY8a+s8YxTD76PywFAcLHU5tHLrkUBfa1lnG/Q2
X-Gm-Gg: AYBFou1Xdnq5aQZ11RpB+tK3sGmhL/cWeonUN90FlTuyKySTnM3a+ah+Se4dHQ+z7Fb
	5svHPa3CwfR+svzCtvAOfprgc4m4ga87h6FQ3Hv+1cErt2LWMXkn1fK1kU5JZofaGdgVvgL8yDa
	O3CIkUBQ+L+kAvGbAWZHKBimaj2FfUhkJUecCIDDMV+Uu0lyHiEp9TwRXtl6LL1Z4owexdo30wD
	cTwXta0lnnMmXOw3B/cVsPm0eaQsmKGuVZFiSGb7SedFABoFUEA6fb15jB9jZDxGk5nCfkAhW1v
	hXiBnIXmPwJECjtGMM9aafAlEeFs4JfQa8lIzbCQ9iHQ46xjC4eSSTTCHDk+Fy/tTDl8H6R4HWY
	kvocgq4Iy2xjd7DByaJ2sBQ6t5hoZ9E/5nrSK8pnDEmAng7/ksuwPzZwPpJZle6nYnqjdNC76Ie
	5y4i3AqJyA6bC3pTtXYcFcKwOuasJuM80zFLUFVWkBD/gXRZ/p9cnvVKRb91ay+sqW4E+i/Mmn7
	+HEoogDLJZlQBL3
X-Received: by 2002:a17:90b:3d92:b0:3a0:f0a1:b460 with SMTP id 98e67ed59e1d1-3a0f0a1b954mr748138a91.66.1790434185508;
        Sat, 26 Sep 2026 07:49:45 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:a00e:c90a:972a:c5a2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9589f7esm10105011a91.10.2026.09.26.07.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:49:45 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+89f5f8143d8e62af2b61@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] nfc: port100: cancel a stale out URB before sending a command
Date: Sat, 26 Sep 2026 21:49:40 +0700
Message-ID: <20260926144940.14412-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

port100_send_frame_async() reuses dev->out_urb for every command. It
assumes that once the device has ACKed and answered a command, the out
URB of that command has completed. A device can answer without ever
consuming the OUT transfer, leaving the URB queued. The next command
then resubmits an active URB and trips the "URB submitted while active"
warning in usb_submit_urb(), e.g. from port100_probe() when it sends
SET_COMMAND_TYPE right after GET_COMMAND_TYPE.

Kill the out URB before submitting it again, as port100_send_ack()
already does.

Reported-by: syzbot+89f5f8143d8e62af2b61@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=89f5f8143d8e62af2b61
Fixes: 0347a6ab300a ("NFC: port100: Commands mechanism implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/nfc/port100.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index b613f5e2fd57..5fad6444fe3a 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -780,6 +780,9 @@ static int port100_send_frame_async(struct port100 *dev,
 	print_hex_dump_debug("PORT100 TX: ", DUMP_PREFIX_NONE, 16, 1,
 			     out->data, out->len, false);
 
+	/* The device may answer without consuming the previous frame. */
+	usb_kill_urb(dev->out_urb);
+
 	rc = usb_submit_urb(dev->out_urb, GFP_KERNEL);
 	if (rc)
 		goto exit;
-- 
2.43.0

