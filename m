Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2592B414429
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243440; cv=none; b=jRJ9Y+EfdkMzpAS/+HZuIu0f3SfaBfl30ouCp1IjvE8dbSGy4K/FmDiEX31xyx/K0R+0xgBJFi6spN8u6ckdvpTz/oKf9+kKZv7Ar/ekopgYnJEGlmLHjABu7VM3HZedCc8iphmoRGK+a9Akkem/b3SjiFBKjJyQci+mIefF7XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243440; c=relaxed/simple;
	bh=5k7W/rnOy/1h0oXD3pb7JlgUJgi+5ScccSZ1omyxYhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrJ0ec1JJP7Mpb1kflemL0bpvNiYaUkdtPmQMmyTp/ZeYdcCbtwBOTSLbfkMtwUz0KnopNDdv6k5R9fY2cR5qoi4m/MjVPMnLMRdi2yzWivdAgK4ajncVkteKrvnAAe0eXo9WhvBuowLBZ3TDgxXWkvnqEvvWTuKSxL+Cml97Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyiQucHx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyiQucHx"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so1390334a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790243426; x=1790848226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1wVtq/AxOLm16oJhbIvzXCIHYiUcLBOkeaHt9nYFpA=;
        b=LyiQucHxyLhxnAFou8bw+qqicpGpnCI7L7A4N0o1nmogigTzspiyK2IZH/CwE65OBA
         EtW6+kwG0syF40JXxJCQsiywxTbyH1bzmBdvx+LKMkFZupPlKmyaEtIqKSxvHtAHpA1X
         P0srxRsaujXW12lzSrycay/hd2OAxo+Vq4Uq6ZRWyfHuipDP5hT3uH1+sarwA+hI+Thq
         3Zr1caqdx+3adDEFL01AA7xeAaoDzNYl1y8PPnddp6rIvKqrRenEaaK/Dixzb87RQNB9
         ZMtu+7Ln5tf+Ao5stRxQQZJGckRxE7O+j83yK/PCsh0EaXH5boUzCo1g3K2MzH0c2qUc
         1szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243426; x=1790848226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1wVtq/AxOLm16oJhbIvzXCIHYiUcLBOkeaHt9nYFpA=;
        b=wMwU1eUFIho3g3EHe1m02LLw8or0VIWAfhGQB2apDALCGW+EHbMDTKC561IWPVP48e
         T21ssWr5iHnpIDX1pqxv3kArkPJZ9EfqKRvkNrxAZFIukLqdnDB7QqpFs4o8NU1k+dFS
         5fm0t1tFJkYhZsogZrpXtm0UVokEoLGPFtJgAj+hAOMpl3/ZuqTE23DCeS6uFCUoIaob
         x2uWDRj+lNZENE0Y1YXjfrl9WQtr6lqcHuxK5udurBSJ7334V1iLQ3irUka4FddjrLS1
         rOV+vjzYH/dudLXZLLfIVsmQ18RV89tfzb9d5OYaZPpa4Py+hB3ckOTbtjhtod+ZFloL
         46UA==
X-Forwarded-Encrypted: i=1; AKwUvBxSxhTNNOoafcyLnyCFG7s0kIUCqqp3/yUcPK5lGlhueNxur0GNR74hZXo7pXjO1agTTyQ5gWzBttdjtiA=@vger.kernel.org
X-Gm-Message-State: AFuF++kmcE/IPRpYiKtEh9cAXbx94uWkSD7xIMXYZ8RmDd/0lT8wTH1i
	YKuClVtPP1P8WuQ+55dQnFgNNCqZs7jIqAnl499s+SBGOXP4s5zzsu4W
X-Gm-Gg: AYBFou03OAC0M9Vsf+zK/D3YBtJ4VWDICDERfPwR4mHPb6ttnI3/0pSFQw07GHMo3kC
	HSQbE6cd7RXTneR9fjT/gY/gKXTWPViRgnerB4akROzcNYyzTViNQ3gdqNNXsl7PPOvSHEwoewl
	Rq2Q6GZPPoxmfoDXJobLj+JxyYGAyB4fIbp2IArXOPuhqFJFWth7+/g6xTuEBFLhLpT20HSlo3w
	636CuCmsghwJ0zZCV455wb6A+QdFT76TljDiuCVAUivCXBa4HzE8Ytj3Ohm/Afnh0bDoF4kvr7R
	/rtDuD5Q59PRfQtCj1Fhr1pZOmGJaABV1ATu3Ooliw5Or6eMA7W4yMomXQnUSyLFyhw6Yn6ue3o
	vpopYXWiFT/5p3S28IcrumQt1VUO6HAbtsTsIn4i5bqlQt9GJJ4bzj/0pdrzsP3I+0fsdX3u/Rj
	kz4hFPe8QklrX5Ddj3lbanRXSi5JqO26ulgtyMx16En1EuhZNond7qE+V5UERyV1YI3sDHdw+4l
	Fr/Zms=
X-Received: by 2002:a17:90b:4e8c:b0:3a0:7d5b:8d56 with SMTP id 98e67ed59e1d1-3a0986075e7mr1540851a91.28.1790243425925;
        Thu, 24 Sep 2026 02:50:25 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:10be:b866:ebcb:a009])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm3916906a91.13.2026.09.24.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:50:24 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: david@ixit.cz
Cc: u.kleine-koenig@baylibre.com,
	linusw@kernel.org,
	kuba@kernel.org,
	pavankumaryalagada@gmail.com,
	xujialu@vimux.org,
	johan@kernel.org,
	sameo@linux.intel.com,
	bzhao@marvell.com,
	akarwar@marvell.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Subject: [PATCH RESEND] nfc: nfcmrvl: fix memory leak in nfcmrvl_usb_nci_send()
Date: Thu, 24 Sep 2026 15:20:07 +0530
Message-ID: <20260924095008.8227-1-pavankumaryalagada@gmail.com>
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

