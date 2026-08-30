Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7C3B058F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788113539; cv=none; b=XH8vNBF3doa8cKi7XXK0WRgirsmInMi15uX48pDsU0ZoKUV3on5GkPqgJcqT1fYYP1FUh9C5xh4oQU3KUKVb8BJNIkt2tdZNPydHNO/jmpLXm0stBYqoEWMAoMvwDhKm5uqkF9MdDhxNKtFG2YZkI9d4+yodl0t1/mjDz5/GztY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788113539; c=relaxed/simple;
	bh=5k7W/rnOy/1h0oXD3pb7JlgUJgi+5ScccSZ1omyxYhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fb76SjQFSaf09aqF4DSQg9vCbjrtpBVxPWWu4+4tVvlplQzecRaT3WGkPGr20ymxvaZfEvO+VIX6PZ+orqeK7H1mX0mYW9g4+Gf5rWiHChKEuOxetNuq//EMh8YJXWaK05DKeXZpNLTD36jk53e0j7wMIuD06Td1d4qnWMPN6HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdQY943q; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdQY943q"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so1893897b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788113538; x=1788718338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1wVtq/AxOLm16oJhbIvzXCIHYiUcLBOkeaHt9nYFpA=;
        b=YdQY943qbtJytL0gke89GXxHsVyu2qX+nxtB5hMEUsqIKS+T7BOtVkusqYD23xLlD1
         Ffie9PqjxXcZDo9zZV6afxeznE1rCQNuccvDRj6ACzejTYkVv2xd283HJvgzkofHC/EA
         dwbOV3/B2aZ+krbtCjIMI4gJcQY32SxhOc2eho0yrytNGBidNYk/J+InUqV84joVSF2k
         Zo3z2L/1SiX85OTaSP3DggeGJE65C5W//qMbY7PN4GihOZn4EpNomeJ38Az/ui3TmpcW
         PMzNrT3ug5XBqUhVpbToiHDLNPdKRXY59a6M2ttY2TIn2xFQV/TpwGkHdYvR3HJScGZ3
         BgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788113538; x=1788718338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1wVtq/AxOLm16oJhbIvzXCIHYiUcLBOkeaHt9nYFpA=;
        b=M3uycfkY/KJcr06rtPH261CifdiEKvVlzREFxBjqz3OVuiNHrtMbcF3Zi6NiQr6tdL
         rYx4eVoasY66Mf6wwo2gU4m/Z/pxzlm7cDAtZd6w+hO/cnkS9oBMwxf+FZF4szeBjMrm
         6GbthO+aGLwtGOCTRN8JplM9+Mxlpidy+G1qp7pp+AdOGfLIdJm9aZRHrLF6840ICZiv
         zYsglJi0TI0IqzaFGsPRSb/rKESdlPBaLUArwhDjIWbQw1pKncC326eIHT7idDkM+Xkv
         MrcWXLmcnLYtOFMNgmCALOORqhfinR6d+8WWYnzJs7YQ/mqT4dA5DvnrAzu+AFlZ51tg
         Wv5w==
X-Gm-Message-State: AFuF++n/ASPEYUqi9FoO6RZn2qFxOWxPJSLBTdtEpQbrKEJ7m5ZpU2jX
	Bug+vL+nAmVkVbjbGfx/kQG5vbiQkT9hbgJYbZrR6Q6dGEAqiNnM9os/
X-Gm-Gg: AR+sD12vjoYosXODaIJn6h43+qTW2d5hQZDWSZ/itT3QOKbC744D+xUGmz3b5mxmHHd
	aPhzgYNF/YAEH0zfJTOX66RxOoCFBzLoB585hur3X4JUG9kKqRIJUKVET1jCuB1oMl4yGVlWTje
	31j4mOclwWH07kabbjFywCy4DEO0mCk+w6eKtZkuNLJYr6BojIwYYHqye5LOeYmQqgU8Hc5Cm6N
	sU61cAuYgJSjYzdTUoXvTBwDD51SdIn2h5EujT2gJHh60yshAi8niBcQuCj4+dV4qHqZoRpZewC
	dzR+nz6KDqYugnWUlg9E7i5hSrzz1Sr32rF6XWVHUeZXPhWahqGzDSKRSD7KJK8RPMAfd7bjt2J
	I3ca1eE4B9ixc8BPJxnKuKMnW3OPFGMu72H+JaLCW8XI18V524wF8BIE8HsDTBrY8dpmox4cPBT
	6yczPYZ95KR171IXAZsB+gqZyFAl4AzVPJCsjwbx2CDxfhjz3pUjpKkwnGuAYZXSIjkkA=
X-Received: by 2002:a05:6a00:9512:b0:857:727c:a1f2 with SMTP id d2e1a72fcca58-857727ca3damr18291726b3a.20.1788113537655;
        Sun, 30 Aug 2026 11:12:17 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:fcb:65b0:addd:e3f8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa79c1dsm2697723b3a.16.2026.08.30.11.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:12:17 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: oe-linux-nfc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	david@ixit.cz,
	johan@kernel.org,
	pavankumaryalagada@gmail.com,
	xujialu@vimux.org,
	bartosz.golaszewski@oss.qualcomm.com,
	kuba@kernel.org,
	u.kleine-koenig@baylibre.com,
	skhan@linuxfoundation.org,
	syzkaller-bugs@googlegroups.com,
	bzhao@marvell.com,
	syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Subject: [PATCH] nfc: nfcmrvl: fix memory leak in nfcmrvl_usb_nci_send()
Date: Sun, 30 Aug 2026 23:41:36 +0530
Message-ID: <20260830181136.165395-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

nfcmrvl_usb_nci_send() gets an skb from the NCI core and sends it
over USB. If the URB allocation or submission fails, the skb is
left allocated and leaks.

Free the skb when URB allocation or submission fails.

Fixes: f26e30cc6b50 ("NFC: nfcmrvl: Initial commit for Marvell NFC driver")
Reported-by: syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b197a0fb4e741cc5030e
Tested-by: syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/nfc/nfcmrvl/usb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index c7f2afe00b93..7a4094797ba4 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -224,12 +224,16 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
 	unsigned int pipe;
 	int err;
 
-	if (!drv_data->bulk_tx_ep)
+	if (!drv_data->bulk_tx_ep) {
+		kfree_skb(skb);
 		return -ENODEV;
+	}
 
 	urb = usb_alloc_urb(0, GFP_ATOMIC);
-	if (!urb)
+	if (!urb) {
+		kfree_skb(skb);
 		return -ENOMEM;
+	}
 
 	pipe = usb_sndbulkpipe(drv_data->udev,
 				drv_data->bulk_tx_ep->bEndpointAddress);
@@ -254,6 +258,7 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
 				"urb %p submission failed (%d)\n", urb, -err);
 		kfree(urb->setup_packet);
 		usb_unanchor_urb(urb);
+		kfree_skb(skb);
 	} else {
 		usb_mark_last_busy(drv_data->udev);
 	}
-- 
2.43.0

