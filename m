Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313694;
	b=hD7bgSKuPLWeuhJw5lE8GKuagtYsbuCSBUa7LMMBlHG5GBT9ZvM08dNDRWSntNjNua8z
	 +YPmh2FVS+LuUxtUSc2/FpnY7JZ1549Bz31we/RtBN0q4cIrsnVlULdkZBZtHy5NDzCjz
	 xOabs3i2GygxlD0jEo2+BabzLnyT966ktrd7/MSmE/pnktD6JveK1FvRS162fscGL9rgF
	 Ijh2tnGao92RVgFry+QXPx/iLXjEYCeZG1HFXlo9O1hVurC5vdUYQ4yxQSQL/KIL5ozO9
	 Hn05Jf17GVyyE6670VqJOGLQhbc91ofY6aXaLwYelGlcAAFlhCi79qMJEKuSOUbbhrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p/lNXcmee9ZNuCiy3sE8z9e8aCfdm1832qnUnHax1I0=;
	b=JN426dVB/CWjvPg7PICTrgZvVM8MswBoDrHQrHl6mW6HXTndMoyde5WtvH/uPsdhz2ss
	 0kANHDK2gFM410wQLEej2D6HXgo2MTTUZmxlU+pyvKpecY3q0xDY8Y09v5MnBy3qRFFhD
	 qGZzBA86iRswTARnvSemC2ki5E9E1vtdS+egbR551yyqaB7UDvEH3IBD3R/QaAlOxMi7J
	 Y0NgD72W2BV6IZ6nn2fOfv+TuHPPZNkAeOhKcHEB+8uSpGL6Qn9kqNX3OTloPCu2ywVj3
	 CfTQDoPxJVv2MlIaBJ1L23CF3zlRG6yJIItQEWAdXVehIS+ACAmNvG6jwjyF7huhXeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRnDXfc1;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEDD606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AEDD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRnDXfc1
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso249915e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793313692; x=1793918492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/lNXcmee9ZNuCiy3sE8z9e8aCfdm1832qnUnHax1I0=;
        b=NRnDXfc1L8HQiAoUUSzdXBA4/kU4JeA9BUmhutMluOoEVVN0mQ5ivfmXdTE0ciz/Kn
         eY2juSG1NXxDge0BX+ORHnccDpFU0uHSxRwmEUGCOoqxn9tUIA0QQo0AHSEgvvpmfD3o
         RBFUtfQb6ZDcKxdiRJVFMSI4O7lpsit0zjtJdJmOsCXcNhc6luJA3csWO3yF7cweFhqK
         AKWlRWGBMn3CXeDiIewZbpRohp7JLpLvwD4a1DpMAaL9Ug40uxzQ8YLtapZSC2D21bR7
         jZOaG5Vc0tfotegSFdGg72LDCxIY0PXHKIVfMFp3BRbwAMyDHCNrxhlyY3YDTt6/2LYQ
         PQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313692; x=1793918492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/lNXcmee9ZNuCiy3sE8z9e8aCfdm1832qnUnHax1I0=;
        b=jBngd1RvSlAgMV4lEJ1+l/UL5hIieHLRNu8Z9/QoUDU7OLfF38/yljRMwYdOAOUWKT
         SQ5El4ijkMasiEnce7hNHqQtj0+HuzF1NHt6QQxTTgw4EzJrRMzzoKhhtxKGPn7ZcPZR
         LMrAd53HqpVIA10yDOPI1S9EfF3of58j/wA1wdhhjsisrs9tAYKFsyIls7CKGksqcdX8
         zbqR2rMe+oIvEfMegIcjyJElPmqa+ws/5B6N9JcRak4+ajEqBYlW2G+JwETLWb1cGss6
         ImUZQF96O1+p4a3eYhdtqRtWXVlG2GBz9ewnR5kbQ0q534HMzl5aU5uINNFcG4wAGJ/Y
         +/Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwenbAXBQpr78tYj/RqXu4dLfvXkw9ml75e3OIz879zYYDgAGuVnuW2KLle24jRWG6TyUCQ+DPJTh4foUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKSWzFcU7VC1s52I4pVyFBs3i3Qitn0/PM/wVhPCsyPhKXcqp9
	DoOHSuZ4ghdr1QNGDqtEO16oeWIX0gZBFr7pWgDoPilXEbZ3B582oswosjBxOuX5MxI=
X-Gm-Gg: AYBFou0Q0mgmHhoJNYJ0anw0jltqcKFlUbj2CxiQAjpp1qMACCVJscZ6nn0yY9T72ig
	abXRRk6dY7jDK2Gb+YP+a/dxvwdXpZrFGQk08vbYfmxtzZmuhE9w27TS8KsAw0DNDnIg7qAyk7A
	mrlorhEwaMSfZGBzFD4x4r6JIwf1O6Xe4+ekUf08Bnoa//UY2k32Fc+nANxmQtWgorTRtAB5Fiu
	sJyUyD6cf9wQZi6u1r3EvqvU735pzUfwbgVhlUOES7FJXqmB1552FqUcFuqbDgFY7H1Vik7pMyp
	M0UFOYq5NW6fzR+X4GNnTscdgoKcnliwOOIPAbZsZEujmmxwPaXnxxsVjfLX0dd8I+oyDiPW4HV
	Tdb1Ag4WqEcxUKTjWWa40Y6qd0GkdRxsM1r4pKG3Gr+2U7p1ryZNdU9eSwnI9iZ20UM7lyXSdse
	vOskHNNJK0ifpDM7hVU70xqVKk0ylx6b6f4zW8K7UyjDNNFu37vN7nHewKiGZSAHj5MZOEppaKB
	6HIo7G4tlptGfWRoiEmoD0Axh8/n1WayE2+2r2vfFlWkIxHiwN0tdriV1go5w0Vr/Woi7ALtZ15
	WqZxtsFvA41Xf0G32c+A0U4OnkqAYJkNdmHoYsZCn8Zr7bXwRMxKsfHukCRwKHEsWZM006Crgk8
	qI4wO5vxNntneIlxv6YPxj4HqKfHGAjuxlmZCG9+WegvfQAgh6k4DGusLiGRFcSbGCTDfzeiwnd
	LtcSiWJJyx1g3c
X-Received: by 2002:a05:600c:811a:b0:4a3:5d5d:48d9 with SMTP id 5b1f17b1804b1-4ac187a80a7mr6995185e9.35.1793313691567;
        Thu, 29 Oct 2026 15:41:31 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([185.19.153.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm89557405e9.2.2026.10.29.15.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:41:31 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Chris Lu <chris.lu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtk: fix error handling in btmtk_usb_isointf_init()
Date: Fri, 30 Oct 2026 01:40:15 +0300
Message-ID: <20261029224022.1233751-1-ismailtarim7@gmail.com>
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

btmtk_usb_isointf_init() submits the ISO interrupt IN URB and then
sends the vendor command 0xfd98. If that command fails, the function
returns an error without killing the URB it has just submitted. The
caller then leaves BTMTK_ISOPKT_RUNNING clear, so the driver treats the
ISO path as inactive while its RX URB is still in flight, and
btmtk_usb_suspend() skips killing it. Kill the anchored URBs on this
path, as the URB submission failure path already does.

The return value of __set_mtk_intr_interface() is also ignored: a
failure to select the ISO alternate setting or to find its endpoints
is logged, but the function goes on to submit the URB. Return the
error instead.

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Signed-off-by: Ismail Tarim <ismailtarim7@gmail.com>
---
Tested on an MT7902 (USB 13d3:3579) with 7.2.11 by forcing the 0xfd98
command to fail once with -ENOMEM through a local test-only module
parameter. Right before the function returns, usb_anchor_empty() on the
ISO anchor reads 0 without this patch and 1 with it; the rest of the
controller setup completes in both cases.

 drivers/bluetooth/btmtk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 6a48ff0192cf..1b3dab0d10bb 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1741,7 +1741,9 @@ static int btmtk_usb_isointf_init(struct hci_dev *hdev)
 
 	spin_lock_init(&btmtk_data->isorxlock);
 
-	__set_mtk_intr_interface(hdev);
+	err = __set_mtk_intr_interface(hdev);
+	if (err < 0)
+		return err;
 
 	err = btmtk_submit_intr_urb(hdev, GFP_KERNEL);
 	if (err < 0) {
@@ -1753,6 +1755,7 @@ static int btmtk_usb_isointf_init(struct hci_dev *hdev)
 	skb = __hci_cmd_sync(hdev, 0xfd98, sizeof(iso_param), &iso_param,
 			     HCI_INIT_TIMEOUT);
 	if (IS_ERR(skb)) {
+		usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
 		bt_dev_err(hdev, "Failed to apply iso setting (%ld)", PTR_ERR(skb));
 		return PTR_ERR(skb);
 	}
-- 
2.56.0

