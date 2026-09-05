Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078A73CDBB1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598741; cv=none; b=t+PAxl8lVYGEnndwuZihpBHgctX6C2uqt/ajwDZiC65mUri4ZJwaGk/TpIpZPdziLRCaBeR/d8ks0Lb/XsLVcLTdZ4URxhjtPvfee49lOv3wiuL9LSQYBOvNglncVJNAFpTY9Fges7s5vjurjKp1eJpM/JLqL3waohhODb4P9Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598741; c=relaxed/simple;
	bh=6zz9Ag85LOmpD6O7B3WH4S6lYKS21tOMt9b0pe3DHRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWmZr8n8ZuitafrJywgSi/D7G1+RnbIFbTrb/KP++xvt9NhjttN5my9+gf6RpmDwD/2xTRtwN+x3lA0iCW6UF6bIboCS6U3VmUnQgQrCjUlwUnVigZaHMLq03/ERQCSN4fElWis12Vq2nwhPKArwd1sIjS4HJM+k/AZYuuPQZaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADidD9x2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADidD9x2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso14349085e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598735; x=1789203535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GUrJMaiglIbT6L941pCJUScecxh9O9MwXfOfsOlfv0Y=;
        b=ADidD9x2/cstVJ/31ydDidK8pdHM7PBb8VDP1eB4gn1ZVwCulPaevTYBkIU9U5iJV6
         cuTDM3ht+gIq3PWdSxEa8/7XnALp38cwZntGSQCGjG3Bnf1tdmP0s0ArFHAJZzAUZazX
         KlvkLvCV5sxnQuro9vddeCuWDa/t+/rgtJS5fa5b0QgByIsWcT/bt++n9QNxxPEkfcTE
         lM9jQwEI6d3scr9FqYbdkogbccpgBqiP8Po+lQBUL38a1YAXd33iJI+iUsqnait71/bZ
         E48CT7UMOHEH4A/8cWskl/v9oXeVh8txjEUD6TOpwVQIVEPEgacba1NN/k02xy66QNNT
         Q6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598735; x=1789203535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUrJMaiglIbT6L941pCJUScecxh9O9MwXfOfsOlfv0Y=;
        b=GD0u9ucFVcMFBpZuuI6rS/I+LSogyBt8qaPMkWIreJCHtbhZEB8RhhrhbudvhOSizu
         M2qxCvWX8wtaMZVZ4Jqdhcvb3gfaIv+Ke1usBMeEkuvlZvmMCaoeI9gi7wNw+tijNEqV
         Ogc+wa0bWAzLnMoN6ofs47HY6buKTXwP42yxuNArdYrIiztjKnjb+rTE9OfX9K0Bn5GV
         qQhtxfREfHzzCBGFqP5mMktAvRch0QhDKie8OPd784OefYR7CeJ0Ys/dXoFdfn+BylZN
         a2nSCZ0hqiDOBAhcNXa7Prvx/PDOHLV/SXlFqH/n4fuI38ybBpBcQttg2m5diJfLWMVR
         UCrA==
X-Forwarded-Encrypted: i=1; AKwUvBxmWwlr/PFs3KKFbrnPnJsPactEtdw95aLkW669DbJRLEd6xw3+H0pGCq+bH0GecZwietd2cFjJUf4m0sE=@vger.kernel.org
X-Gm-Message-State: AFuF++l/ncSF2Xk0bLw7yUwx6i3WOdWRbp3Y8TZzF0QcHG96OTbqUvg8
	3pNtaiu6lUSDarMwP8a757vbOYwr9pVbB0wz58SwKiGgeqge7P4w2dwlo+15
X-Gm-Gg: AYBFou3KbyBCC7ymRl6g0/HIcQu5shCout8HIyMumT0LfJf1g/Hpla0zjC095zOcTDg
	YOSvRZDtivHuLgDuEmYP0C+Cuy2NxFTJ83/3VabuBniDyL/qEu7NEovwEc0ER0q8sFSM7F3mSRo
	fuOr5oWG5uTcDDmK4bKIOv8n2PDfQjScQgwVcROhYIqj+P0aOE8CdtWjBUEfbMKFpnu51XsToTA
	hUhSq1VHwI0IElPud/eb1Ertf1SkEI+DKqY1LZzQ5MoMpUi3pnGUa7rcrUOecbG+rr7sNJuheoU
	g9hbU5DW6TzRsR907rp6zalY2z4hSE9hb5xW0iY0jiaS1hLQMAj7gh6xpsf+irbuxjr7Da/zgYh
	1LiYQefkiiDim4thklr+KR+nobU1nNj1Aanh6jn60l862d1LrFHYKM4XyiW4u3WQaS3rNarY7l8
	zmchQUrn15r2eACB823mNLStxZtfgta9O+8KwHR062BEkJC00EGmKuw2fA1/BcS4vCie4wlTw99
	4HLjT9N7zzbLKo/92H/AXRG4dIYw8gDuiSgMmER2wswaf4VKUccMl3z3sgv2YUZu/AtqKiqqBon
	9eKX
X-Received: by 2002:a05:600c:8b32:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49cf8244878mr121200985e9.11.1788598735193;
        Sat, 05 Sep 2026 01:58:55 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm228306435e9.3.2026.09.05.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:58:54 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Oleksij Rempel <linux@rempel-privat.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] wifi: ath9k_htc: refuse a command that fills whole USB packets
Date: Sat,  5 Sep 2026 11:58:07 +0300
Message-ID: <20260905085807.384488-3-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905085807.384488-1-nerijus.bendziunas@gmail.com>
References: <20260905085807.384488-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The firmware ends a command on the interrupt OUT endpoint only when a
packet is shorter than 64 bytes (usb_reg_out_patch() in
open-ath9k-htc-firmware). The one such command this driver can
produce, 192 bytes, was never delivered: the device stopped answering
WMI and stayed dead through a warm reboot until power was removed.

Nothing in the driver checks for this. Check the length in
hif_usb_send_regout(), where the packet size is known, and refuse the
command with a warning. The command then fails the way any other WMI
command failure does: ath9k_wmi_cmd() frees the buffer and returns
the error.

Assisted-by: LLM
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
New in v3.

 drivers/net/wireless/ath/ath9k/hif_usb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/hif_usb.c b/drivers/net/wireless/ath/ath9k/hif_usb.c
index d3491ff08e6e..49303c7e3fef 100644
--- a/drivers/net/wireless/ath/ath9k/hif_usb.c
+++ b/drivers/net/wireless/ath/ath9k/hif_usb.c
@@ -99,10 +99,17 @@ static void hif_usb_regout_cb(struct urb *urb)
 static int hif_usb_send_regout(struct hif_device_usb *hif_dev,
 			       struct sk_buff *skb)
 {
+	u16 maxpacket = usb_maxpacket(hif_dev->udev,
+				      usb_sndintpipe(hif_dev->udev,
+						     USB_REG_OUT_PIPE));
 	struct urb *urb;
 	struct cmd_buf *cmd;
 	int ret = 0;
 
+	if (WARN_ONCE(maxpacket && skb->len % maxpacket == 0,
+		      "%u-byte command fills whole USB packets\n", skb->len))
+		return -EINVAL;
+
 	urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (urb == NULL)
 		return -ENOMEM;
-- 
2.55.0

