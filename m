Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920463;
	b=ZK769ac18yYjXEbqLjR8AsfAPHx7lsRocmmEnXK2G7LItcVymkyghHHZ8+gk4iCHmatQ
	 RU39NGl7369xiM1cfW232SFxBaZ5KTApnYE9YUwmVcgjl9wjUruzjcpzTZOrzEv58AjJ5
	 WNl5lP91AVtyyNLOx21sstus0+gr7f1InOcJV3LREkKsImP04Gpo3Fh0qugQeyf6ILwmh
	 Tb8oDnDSfOAPyvvXof6FzWhtUgW+oodu7sXrMlxHkq4ssKMn2OwBaCJVtHN1XvLqONVNG
	 izV4EhbfHxTMewN5hULFxzChsUffbMiIzYbVw4sLKawSoUErbYaTpvkWYtiJ+9TDtpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/Jd0PA3ZQtl80LdCM2qOuOMwv75gekRWvfPbCbyLuKQ=;
	b=iXuQ/1pCVEL24tdgNJKb8nbiP2h5jrdICAeyOwOPFsegrdGuvTLJnLRxw3z4cTqq1u4F
	 5BmrbJH+nQrixibR7hyRZU35GZS9QElQ2fmkTs23V0i7GnHpt2ge77OCKKxeDgo9TLVax
	 zk9/9AJHD55M4jLRZdXUvPIGM/K+MyALt2JOEkdQeAZVtp5ElSZr2o4v3ymtzML2URGLP
	 qI5QIFXtSyg3aBNEywPFnRt5aJ6Ag9SEk786x7g4DOSVeq3Td31CLXCD8/SnTQrOR0Nrn
	 yYKlGxqFDEvfWSWK1aZ2EMPzDk35XDRqNGR+DmEHdrUSMhnEZxJc2OcO4Nln7O330Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iW5CLI/H";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC58606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCC58606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iW5CLI/H
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b29049d80dso1224b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793920462; x=1794525262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Jd0PA3ZQtl80LdCM2qOuOMwv75gekRWvfPbCbyLuKQ=;
        b=iW5CLI/HGouFfECuUHv3NqRUkfTa84kur5CJa4/4a/qiDcm1Z3dqdRmihBuk8P3mWr
         V1lbmYBFlYLbgPTlTrtGXLTCyVTeiaejkhgfYHlNJvS8iRkKJjNkQ4CGCsKWH8ChcJEF
         ERlSpDm6bbHL8j3Y6FdSp9TlnLMeV/pqStGat/HAKTAde56kkE3N8RqDr2xKS8CfBdlp
         PtMM5kbrgvGQ1a4qDaFJQYNy+/HDgmWafOy/RWWpYFCHGlR/U8Ou0qYUQY4Gs+a+Q7Et
         dqX1ALEcaYxONAIP9QeKdeM5Z3fWhG10XKhEDTAGHJ62U9yK6nMsMsZ6UePIYugB699h
         B2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920462; x=1794525262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Jd0PA3ZQtl80LdCM2qOuOMwv75gekRWvfPbCbyLuKQ=;
        b=uEk2Lk7RwYeIewYHm1oxNrAwc0CxEUY+8ug3ZTTx3t+gjc+dwzZuQGEw5ljsRV6z7y
         J3Tl8wOdI1taAtdoXIli9kMv42VirB9ioIUDV5e48VHyPlhFdPJk24zUOdrsX/ESfHxr
         SrSmqHmXU84q/pkJr2reWALu1FpsfVuU6s1wRs5ZWoXnpNFLJMr50NVsBPiBf9pDIrGQ
         qg2Ea/LoakcnLykKM3vsS7JnZiuCjCkfjW9qaVHkt04HwP/j140YAVKQgm7eaFTyDJPt
         QTH8NsYZLyhLzk/FJfNOF42wU+5uENTk0/TwgJMfRIz28D42YkKk+WMsfE4pXjfkPnyk
         /v3g==
X-Forwarded-Encrypted: i=1; AKwUvBx3bGpXgdeT9iJGotWtpoyfqNHt9BlY2UtL435QIuL88xDJDN2fXh88MbpoKIEi5BLw90IJ03wiWgSvnoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o/D7DwfED82SMTdFLk+HeN3zbAQdLf6pgoBd9hx8f2cbkPZ1u
	iLcDhZy55cAF/lUmI50B0KsAlNXmvCGm+2nHCFbB0eztly+iQY9lcvxB
X-Gm-Gg: AYBFou2CqXKgSQE/7YlY5BOq8bJ/2WefcgnYo5L/F6P4AyFVjcQzT6yH5v8J234Y7pK
	XAkOJ2hrbq1iisaytM4YbdNb34GCGpzKO4gDjwmp8sKl7cJqiKiUw2MkFBMZm69WkFeuAEXaVw0
	FGkFoKT/wP9lWbfvS6l2HtUCCJ91Kw/Lj7VvqivfC6HNLMzWnIBuZ7U56dQlPE1nOE39IxWqfv1
	9mmPRClsGgRc6pfM7dae1lpIYudXV5UlrZsorrOocBNlcnyPIHsi8yTYoEyQrXaY/gqtHoseLFW
	+QsvuJtynJAFiUWm9dOGYdHtx+xoFlzOPqZAZ9k3HvbACb40tIFC4ctugVh4kaBSwZmaoGDe9AQ
	xn/t2SwM5OfkYLWYUYa2lBJi7tawhzsbMLXiX/5mDeXjgW6rLbDu0a+AWD1Or7j9Lx/o8b8jKqp
	qNfKQZiyB4ARShQaGGEUm5/0qeWKwcSnZ0l7tEztJKs7GgIcl/Th3J9VYBrtZjBUlte3ZgBnaks
	cXqvqYEg24B9WYnF7GGCfuJorHLy/TQ2WcX8WLeN4IsZsRvwpp9eYzTwbxh7rMMbE+YDHhLp6pl
	szM79iSCuNfQ82GOkziHGJ+pIPy+8ZvSaQaHnQhp3A3bsASl7IriAzr6MDVWyQmrjhQmE2hY1ZD
	uzfB3Tylokrz3JV6t8xZGUFc6Fq/zdImaP968c2QkxvmHA2t528787495opEEQE9gKFKa/NAXml
	WXLA==
X-Received: by 2002:a05:6a21:644c:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3ebb275c5b6mr1016971637.10.1793920462121;
        Thu, 05 Nov 2026 15:14:22 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a73c99sm14382a12.20.2026.11.05.15.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:14:20 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeff Garzik <jeff@garzik.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ibm: emac: fix MR0 write in emac_rx_enable()
Date: Thu,  5 Nov 2026 15:14:17 -0800
Message-ID: <20261105231417.119930-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When an asynchronous RX disable is still in progress, emac_rx_enable()
waits for MR0[RXI] with

	while (!(r = in_be32(&p->mr0) & EMAC_MR0_RXI) && n)

which assigns only the RXI bit to r, as & binds tighter than =. The
following write of r | EMAC_MR0_RXE then clears every other MR0 bit,
including TXE, and TX stays stopped until the watchdog resets the EMAC.

This path is taken when RX is restarted after an RX descriptor error.

Tested on a Cisco Meraki MX60.

Fixes: 1d3bb996481e ("Device tree aware EMAC driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/emac/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 640618c0a09e..b676b286e339 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -249,7 +249,7 @@ static void emac_rx_enable(struct emac_instance *dev)
 		if (unlikely(!(r & EMAC_MR0_RXI))) {
 			/* Wait if previous async disable is still in progress */
 			int n = dev->stop_timeout;
-			while (!(r = in_be32(&p->mr0) & EMAC_MR0_RXI) && n) {
+			while (!((r = in_be32(&p->mr0)) & EMAC_MR0_RXI) && n) {
 				udelay(1);
 				--n;
 			}
-- 
2.56.0

