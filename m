Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434493;
	b=F9t3Dndn26roDWajSXZv3S8MEb7GQlfhtwt0FPZVWbP4kWnDPFH73d+PuPSZQ/MKHoMn
	 3EzWj7niK6HqX15XSWGUsq88Km0XPCpE23A1zZO2dM4uO/d7Q2F9ddlAhyt9sU7Xnj7fd
	 6Wuv/kgqYbyyvyMjN9724phZOl44H4UR7yxO0h37UL691FC86J2DUwy+g0KDFtBh75ps5
	 Re6Sm+z69xGvxYP0OY8wvKKMuzgnkoVOYcuk/vtQPSuBugpmh7w76nIIGv1IqIbqBasbP
	 Rd+nwXdoQtsIMQdXjvR6iCqwXeIdxh8ofI72iAB7zkrfdYNMnE4jojG2JIz4zvunScg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8qP2bK3GbwJQduHJIewrlWs9VNQJnAZ8VpGGRTyoXN4=;
	b=Ee59D8oqmu2OpsRlPaYepQbHOh4cQaRFPSy+J8DRddryvw5t5v8dCsXZiqJ+JO74o4gd
	 fhGYwV4QRG2lX4rAmtWMiEe3P0mIz8yRVSq7hO+64F1pTMvCIs/aR8PrU1LBLzBkN6xk9
	 QnAv6srEK8ispeWNBwmhzG2rHKHeHGOqS8Bc8IEnukmGYW88nUPbvblqwGJWxRx0e4YU4
	 a2/EIMiqz0AZAzgK+ASPTMFXs6Qa742qkYd6PqPcj80FBU6ON5RN0I5rZhIWUR4Am18bO
	 35Sq7kWuAJ2ZkS1zftDI//GYicC7omHsJ553CC9JMvFIqzmSVhINpjalbXL0edCtBUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nqKGOAVW;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B10F60A2611
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B10F60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nqKGOAVW
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so1755636241.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434492; x=1795039292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qP2bK3GbwJQduHJIewrlWs9VNQJnAZ8VpGGRTyoXN4=;
        b=nqKGOAVWt/myjDKGoj1Da/idlljIDawXIfbtDS6uOnQFe1p99qk7eIVc2/57rsYIrQ
         9KdXan6GkBY8We+aLPDRrzAYsJkZ0Hn4VAJB4bBSxUkFsP2YKx8sb32Vua6uOEoWm4Ea
         6OT1Y8CGIZGJ0ZQ2hf8OCdN6Wcl2bKb9psa3yZ/jeoRSpfafW9fJ+NrWiL9ueSx2+6QT
         FoqP+JwlHpPYmCcnqb5VfKkumTE46Ce8aLkd7MfRYqOCiXfSTYCwmb4gIKL+TBC54mgQ
         CwXUp0zeDq4uT12DubmRye3vThR3vba6UhGWMSkaNzHO6tjXeYc51KB7gzm1l3XrU+J9
         GLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434492; x=1795039292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qP2bK3GbwJQduHJIewrlWs9VNQJnAZ8VpGGRTyoXN4=;
        b=JXw/rtGFcdUPWNktgfUBHYqCDvEDpzeuttJQC8fL2xDjsiRdM8OsBtnpNTH7J5ZPmc
         Z3sPzD5KJ3jTptxyiqYRc4JyCEyz1Nfy04GTUqTZ7503ucBI28UsdJkMMcp72EudBBPG
         r/3vMP3a2nGDrNTeJ4VDboIuw1e3B3+RdC6UaoForNMy/EnzR3w5T6frDFOrMT96zrvo
         0LNMONFWfltFLr2WX3qXsa+OkKLKTncfwjg7m2aDbb+VSPd+uJlY3nhpqZJCDhIYaHFP
         7H9fpdPOrRH4LnbMFVeZsXMZ43GyRWptOXulCHw3xt9Uq4cDRg4esfN1ylDNoVJcgcbX
         E36g==
X-Forwarded-Encrypted: i=1; AL+hErENDPgUxdDRnzwbGGXOv6PHSV71gzDgAr6kQ/f3zPB7WIQ616LMQmLrI6QBhSzXKlrT8xpB5081PuHCkoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z81fvtXFDu1Ca54jbR3J4ju5m5gqjH9rhOwZRUFxzfLETIU4LV8
	287xpgu6r0nXyx8Cu0O8QMwVBN4z9WiJVsgYyhfExmkBK5R+/XQykXE=
X-Gm-Gg: AYBFou2aYbEK+Zp1jYed5evkv0ltPAaTenNAcq+fIUteSP/uvs+0kPF+j9AJEq3Z4qp
	LNYHdB+Ct64ZKs3qXaja6SUFwaRSrUqT0wvNFeTZn1mFUOFRQ6VToXbiJyfD+gKTj068kLfvThO
	v/VEgEu1mYyDQ9+soIoZUpOv7Jq92dJkgGnQFwP1Kfu8Tl9hix1+SdCAd9VkzyGiYMKU2qJjDYE
	l+oaTkV9v/e8xDywKN8+++7exhZ8MW7UxxiMMH1sfASZCWqqMnAekwIbdhOWBY/rhwpNf4osDRV
	YXHqqNMeyW658wXhToydIcXTOqz5G0RiovlI4u9svakh7EXAqEguYcUWxPb7Xs3yiw0pS/eNi8a
	UpZvUip73eibKhOelhkRzfB4+w/77kt8sqzJ2CtyHVGLfinw6fvGXru3iL8g8ZwdQ1tMRdVrfL7
	pOYsVPCek9SUVDFJe+zV+3JU2VTLs/mozCzFi9O4DOSz2TbKhIRUNE++5zQL2lsNVl+zAeqMpWQ
	ZxpemC/k5AEcpvTySBUSoZHLtj9u4U5DW4F5aPst2k/wY7HJ0cf0+RZeNCK+CNAJGPeowQIAwMm
	pEGC5ugU+8VIZuKSWEXVj3URbh1D
X-Received: by 2002:a05:6102:14a3:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d5061cf252mr1699656137.26.1794434492280;
        Wed, 11 Nov 2026 14:01:32 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe63asm4557992241.4.2026.11.11.14.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:01:32 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: netdev@vger.kernel.org
Cc: hkallweit1@gmail.com,
	javen_xu@realsil.com.cn,
	nic_swsd@realtek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next 1/5] r8169: recheck the TX descriptor after a vector-map interrupt
Date: Wed, 11 Nov 2026 17:01:10 -0500
Message-ID: <20261111220114.3863505-2-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111220114.3863505-1-montrealtango@gmail.com>
References: <20261111220114.3863505-1-montrealtango@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the vector-map interrupt model the TX interrupt can arrive before
the descriptor write-back is visible. rtl_tx() then stops at a
descriptor that still looks owned, and the end of a burst stays
unreaped. Once the BQL limit drops below the stranded bytes, the queue
stops and the watchdog resets the chip.

The legacy handler reads the interrupt status register before the poll
runs; the vector-map handler only writes registers. Do as Realtek's
driver does: if the first pending descriptor still looks owned, read a
register and look again.

Fixes: 677f8f8c4c5f ("r8169: add support for new interrupt mapping")
Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---
 drivers/net/ethernet/realtek/r8169_main.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index cd4ebc654dd0..6bd137358d1f 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -5228,6 +5228,7 @@ static void rtl_tx(struct net_device *dev, struct rtl8169_private *tp,
 		   int budget)
 {
 	unsigned int dirty_tx, bytes_compl = 0, pkts_compl = 0;
+	bool recheck = tp->irq_nvecs > 1;
 	struct sk_buff *skb;
 
 	dirty_tx = tp->dirty_tx;
@@ -5237,8 +5238,19 @@ static void rtl_tx(struct net_device *dev, struct rtl8169_private *tp,
 		u32 status;
 
 		status = le32_to_cpu(READ_ONCE(tp->TxDescArray[entry].opts1));
-		if (status & DescOwn)
-			break;
+		if (status & DescOwn) {
+			/* The vector-map TX interrupt can arrive before the
+			 * descriptor write-back is visible. Read a register and
+			 * look again, as Realtek's driver does.
+			 */
+			if (!recheck)
+				break;
+			recheck = false;
+			RTL_R8(tp, IMR_CLEAR_VEC_MAP_REG);
+			status = le32_to_cpu(READ_ONCE(tp->TxDescArray[entry].opts1));
+			if (status & DescOwn)
+				break;
+		}
 
 		skb = tp->tx_skb[entry].skb;
 		rtl8169_unmap_tx_skb(tp, entry);
-- 
2.53.0

