Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC9F43DEBE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976531; cv=none; b=NEEOD3ynEYvEPNHg0RNMQfL0Ep5chkpAZvnCQxEBE1Ftu16OKlujNwkKD6bLWL90tEaImKnIyk9tPoUJyljxhv/iAeGf1ck9glJiL8Q2iJUKYMvZjMFDcnnOMFAS9ECr2wOO7z4a+xkGQoKHymmWTq8joH+rb+PIRDsfYR8KybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976531; c=relaxed/simple;
	bh=BbXoi92UlkhlGdeK8JNIhIfmhwJqCOsh6YgHaTnViyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQ9a4fsULk3134quQnC8zxbzONs2RExiAcDX/hNlWhv53dLeFVnxAiznKGQJZDSRGxC4k9tgabSiL+/ll48brSb4bGfWoSFzYtAwZFfIZBOs46dKlDpntK4pjzjHxb4wJLBHjBqSvyoZp6MbWFmOyfkxYr2N7RKxvA7NJI4h6/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moi0raPl; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moi0raPl"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so1853343b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789976528; x=1790581328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lDJohtZHVUp613SJYT+/whB9vC5M06ltf1T0TWT1oQ=;
        b=moi0raPlQxbFAgSXNf0zQg2PmrJSI1ukF70ufvDo4vFwCYSDkmC/5lRutxILzuk4nf
         cyXdw6SIT1llOrMsBs9lI3TGDr6XceWtPUdQ/Tbg6Q88I/O5mEXqJ1cuXw2neOZcSrwo
         l1qoSO1NgEkktM9VQs+tY9i62dy8Vcm9OOM7PTPzciRzLIyoIsKxhV4dDSL/mnlD86x5
         NrBZARmz3nYuK7jsBsKlKk0HwVlkugL7xzPd5fE/f/j+QC4DXhLevGZiwY1N3yoBWHcA
         mjyajiBH8A7BknKlNm3s7jc7CmXxPA3mcuWPNAq6ZlvsYKA0BWg+6pasSzbrqdrsl2yk
         qtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976528; x=1790581328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lDJohtZHVUp613SJYT+/whB9vC5M06ltf1T0TWT1oQ=;
        b=bSw+fup2SM7GkzpkXfDRfVIdavnCqtv8mXKu/pSL9dQRFEkk4a93n+7g6d/9KksgZc
         UMs+4UeeLsUQeP1VBZIawBNHiHUUQniVOgWCjRKBNCt7m4h4Ct8gm4MfG45VcAlNwXZK
         z2oC65CvEhoBOCYiB7Zu7u7zTmNDtD2Xdgy7LZBhFLTq8zx08nmLCKWeh1yiAu5SizSV
         YqER9ROC76c3WnWQSyTW1jle7ITiis1B7O6M4qEZkQ5nPWzSc3Ixpwe0z4NDw0QEogZ9
         L9zBCmQpQ301CMXFEzZ1khZldLwxTE9HTQIUijdJ3DGGgnbZsgmr3K+qo9Py2TTJspjF
         k8kQ==
X-Forwarded-Encrypted: i=1; AKwUvByuGHP4bQtUqqTWgTpD1tJms4E1XGp4WH84JWOyQX8HbZCDvHCTtQV6enDnNHSK1vNXIZ2HnyH1gzmfUY0=@vger.kernel.org
X-Gm-Message-State: AFuF++mg1g3krdUtIMfXJGVKcAFm0290RCC5Q1ce6MnR3vD28wQh5SgS
	sHPszVmI00/F9xPYuhbw3dk+ZdO7yuq/e3LYVO11hQuIcrNMtW87v4fo
X-Gm-Gg: AYBFou1Ku6QDhrIX/6iOJnYte2LXA/n4T51HnPDRckVElD4hlfytLufR63QwGpq6XhA
	eWgKr/uSGRU7LShCtXoutC3NqaGfRbQ50iQd44mRCpgLHsVZXrUmLz4zcRKob6eQ0d8qLo+NltT
	JjslMwqhew8T+RXUp7Jc5Ow71TRsTCkiXcvO4pcSz6f9RpDhVGwIfwVjqPUvV7BI/M/uPwZhMHE
	S/w12K3EvUOqPd+9VBTDQ9gOn3lds3VT1BC1tsSaMPUqsEl2Z3sCRW9UBbmz+bxbDk0a7EvcNlC
	sWcgNzgRInl2j/LWuZJ11NG1HKzxCt2mcfA01CANeTxFpfsBgEhW9hYIwbn4oKSdaUI53DxZMi2
	xGEgTgazx5ZJ2cc9DfK/KTuGmySsMB4IkV0nOAE0s05Fzm/bNALvFp5V64HdhTqIPX7w27jeMpV
	eNV/6/R2GvpYDCYxbRGCkCqRpVUS7PkW1hl9FtcAUo/kl9wbI0eCIvRiTxJnwa/h5FYBydfxepU
	ZpdNAy+KSCk1lc1YKnGyWI/f4uKuMrpjQlEHvBnsZdmYfxGHbdyXgd7rJ7MAN19DDdpKAMA9wGI
	bW/dPrPrEhagp5vcrwvW
X-Received: by 2002:a05:6a20:4393:b0:3dd:a00a:7ac6 with SMTP id adf61e73a8af0-3dda00a9e68mr10764183637.51.1789976528200;
        Mon, 21 Sep 2026 00:42:08 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae70637sm3048650a12.6.2026.09.21.00.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:42:07 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/4] ieee802154: cc2520: ensure tailroom before skb_put() in promiscuous TX
Date: Mon, 21 Sep 2026 07:42:04 +0000
Message-ID: <20260921074207.2289391-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919213639.3316625-1-benquike@gmail.com>
References: <20260919213639.3316625-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cc2520_tx(), when priv->promiscuous is enabled, skb_put(skb, 2) is
called unconditionally to append the 2-byte software CRC without checking
whether the skb has at least 2 bytes of tailroom, triggering
skb_over_panic when skb_tailroom(skb) < 2:

  skbuff: skb_over_panic: text:ffffffffc080071a len:386 put:2
  kernel BUG at net/core/skbuff.c:214!
  Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
  RIP: 0010:skb_panic+0x170/0x172
  Call Trace:
   <TASK>
   skb_put.cold+0x23/0x23
   cc2520_tx.constprop.0.isra.0+0x8a/0x1d0

Ensure at least 2 bytes of tailroom via pskb_expand_head() before calling
skb_put(skb, 2).

Tested in QEMU with KASAN enabled by passing a zero-tailroom skb to
cc2520_tx() with promiscuous mode enabled.

Fixes: 59869ebfe7a7 ("ieee802154: cc2520: Check CRC & add promiscuous")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split the cc2520 and mcr20a fixes into four single-issue patches
  (1/4..4/4) and documented each change in its own commit message as
  requested by Miquel Raynal.

 drivers/net/ieee802154/cc2520.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/cc2520.c b/drivers/net/ieee802154/cc2520.c
index abfcfe0..5454872 100644
--- a/drivers/net/ieee802154/cc2520.c
+++ b/drivers/net/ieee802154/cc2520.c
@@ -482,8 +482,14 @@ cc2520_tx(struct ieee802154_hw *hw, struct sk_buff *skb)
 	 * values on RX. This means we need to manually add the CRC on TX.
 	 */
 	if (priv->promiscuous) {
-		u16 crc = crc_ccitt(0, skb->data, skb->len);
+		u16 crc;
 
+		if (skb_tailroom(skb) < 2 &&
+		    pskb_expand_head(skb, 0, 2, GFP_KERNEL)) {
+			rc = -ENOMEM;
+			goto err_tx;
+		}
+		crc = crc_ccitt(0, skb->data, skb->len);
 		put_unaligned_le16(crc, skb_put(skb, 2));
 		pkt_len = skb->len;
 	} else {
-- 
2.47.3
