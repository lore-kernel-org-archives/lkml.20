Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794207056;
	b=k1yzGGNtdJXOQ6aKfCAanwCqiECw+10Ozj36w6yc+lHRgT70ot5IID7q+nTHdw1JwUrz
	 S6CGbQN9RyGic74lrUkspp4V/nyq1iW4joWZbURdwhLGDkF5veydAtyB+KGIhVcgPeACW
	 AIQH7ecJd5pBHQ+Fw2GF7OYZWW799qjorN2pjmn2ldNpfKUlJDMDwjbMBm3ZIJFJ1EhYt
	 wkiuNnxwqvGoGWLj0Vp+0BKjc+4iBwnbqqipdRRaGGrBPKXs4TSNNFGsj9T6CXCu3QTgM
	 itQ2RMaxsfaps07/ItjNRhKcqrcQ9BuvP1yuf3gw3o1Phim4iPRupkdU1YcuCXJNh7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207056;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=o378P/ldgCBp2r5uhYjYvPzMem2BGcYBaKmVD5/xZmc=;
	b=OmaLUptUHuhj2V3WLiTnadHt0z5KlL+zV4gPhWUsGJUbSIWVcEwYeUiim7WBwxjgf/5/
	 bdMm+JL4KfvgS8/cinNLZ6HJlU69Gmr1ibUF5SinB8Lx16BG+b5SWZrKKgIAQ59GYSGIm
	 lGBGqd3X3QRcU5FK2GXHhImeEDtYqI8P0BqfnNyiW/tUS0gj8wytcFqMJb7wuS8/jbGg9
	 tkyFi9ansxWGA0R9M/8JtETjM5/SVhwl3Kjg9WznEADc1IFxEDIVu/ix76zsoVsrcdvW/
	 DpHlIOmCXzes4bhnuZzY6Hqk4cgPOa3jYfrMk5NHx6nanPRDUwfnpSl56k2kjunw5GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ai98bcJq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B38A606A321;
	Mon,  9 Nov 2026 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ai98bcJq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794207056;
	b=IyCYb/KwOo4MASqWsi7ptyh/PyMdv+rdjUo5dumL4zGSjBAFWfQ7j2cyrX+TlyLnBlrm
	 sLglah9UYUtuFOTm4Q8bsaYOyVqtt1yEpryswJsp29H6i63sCbeo0iCjfiMfEOkf8tRyA
	 xNSbWySuaNRKQXcD5U0c76OtkZd8/tbv5/Cvvn2g4uLp2FFQ3AvgQnpGbszbcgAc4vowC
	 0gozZPzrV1gXraa0E+IzZYMXpYbQDxnod6TK88I9LhCCyDZfMjRZY4Wmbk1Tmnpp4UkA0
	 4XMSf//ZIeP3pYi2NPJEAH86/LgMm/cwTzqyYSnD+EdU8iBsAN445HvEepARDn75y3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794207056;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=o378P/ldgCBp2r5uhYjYvPzMem2BGcYBaKmVD5/xZmc=;
	b=EGYs10pm4yfa/U/ReAkWws4WLbSlJ8RXFHAVQYYSMaBRW1GJkRsgLzD4mRwOmFy3oyw6
	 1bVEVAH2kM3hCJatScby/0Bh83Xm/elHMrUnmFZxU+vYusdwUmmTJfRqFkdyd1+JGazCS
	 5YSUCDuhoiwQKh+NWs1vtWLKD+ivFOS9jH+Pm2DgdTPzwdFcMCUr12oC4j6dumKlhiORh
	 gIqU6LIinG7pN6Xrv1aGJvp9ec0KiscyF9409o+aFcUj+/IiTrTgHWhq/LblY3xGF/FN4
	 ovAXXD1IZmac+uC8wvgiirYUdiNKZ0Juo/hsV5kB4jBjC2sSOxUSN4iss03GMnNYAuA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 123081F008A3;
	Mon,  9 Nov 2026 06:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794207056;
	bh=o378P/ldgCBp2r5uhYjYvPzMem2BGcYBaKmVD5/xZmc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ai98bcJq9IjDLisUrIwwa6hjz6hjOGyI1u86VhTdyaTETmujTEZhW8n3nN7Zt4tBZ
	 oG7tNR3fpZLta5VcoiysYNN8zUe3LyW6sriuVEEl7sc5AmGIHtNXOs0sLMEkIK6whY
	 qKODIYSCdHuJU9IaBWyoBgbRAzmfGh+4ppmT+jM0FgCUgOVeDWJQHD464TI8J2aSAY
	 CKHgiegW0Xx3qR52vV/xKJVT2417XzeP46jM9uvIvmpw9fQUBK0if4Fe/rP8nPIh64
	 sS8RNf1UodhmRPlNw1FKSUKr+qcYqr7SKksTWQh0YQR8pYQ0c9tqAnvoWAFKT9B3QI
	 O+PP4RpFojgqw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9739A4830E;
	Mon,  9 Nov 2026 06:50:54 +0000 (UTC)
From: Jing Lin via B4 Relay <devnull+kayano050408.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 14:50:53 +0800
Subject: [PATCH v6 3/3] usb: gadget: gadgetfs: avoid writing through the
 const setup pointer
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-b4-gadgetfs-ep0-v6-3-b410e3dced89@gmail.com>
References: <20261109-b4-gadgetfs-ep0-v6-0-b410e3dced89@gmail.com>
In-Reply-To: <20261109-b4-gadgetfs-ep0-v6-0-b410e3dced89@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neill Kapron <nkapron@google.com>
Cc: Jing Lin <kayano050408@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794207052; l=1801;
 i=kayano050408@gmail.com; s=default; h=from:subject:message-id;
 bh=9gntn5pJSxQT5e2Y/4zkYZFLdwaAw07YatIbT0ly3no=;
 b=L35vU2atDiVedsXt7QL6s/PalmX3AvXYJCrkKDxMmffspgzYvGtndAP2HSJNSekHzgGEy3RZM
 XpJnzFELSpkDVzctHAHU6oD4qUIhDG8UU62wDMBzketYY5tH1cyokbX
X-Developer-Key: i=kayano050408@gmail.com; a=ed25519;
 pk=pr6i8RN1WEON1jbXPdghSglxaBSzfuJjXNGFknX//+A=
X-Endpoint-Received: by B4 Relay for kayano050408@gmail.com/default with
 auth_id=1441
X-Original-From: Jing Lin <kayano050408@gmail.com>
Reply-To: kayano050408@gmail.com
Content-Transfer-Encoding: 7bit

From: Jing Lin <kayano050408@gmail.com>

gadgetfs_setup() receives the setup packet as const, but clamps an
oversized control IN request by casting away the constness and writing
the truncated length back into the caller's wLength field.

The setup() callback has no business modifying the setup packet.  Use a
local copy of the request for the clamped length instead.  Userspace
still observes the truncated wLength in the GADGETFS_SETUP event, and
the queued request length is unchanged.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Jing Lin <kayano050408@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d8dfc1897..7c48214ba 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1543,6 +1543,7 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 	struct usb_request		*req = dev->req;
 	int				value = -EOPNOTSUPP;
 	struct usb_gadgetfs_event	*event;
+	struct usb_ctrlrequest		ctrl_buf;
 	u16				w_value = le16_to_cpu(ctrl->wValue);
 	u16				w_length = le16_to_cpu(ctrl->wLength);
 
@@ -1552,10 +1553,10 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 
 	if (w_length > RBUF_SIZE) {
 		if (ctrl->bRequestType & USB_DIR_IN) {
-			/* Cast away the const, we are going to overwrite on purpose. */
-			__le16 *temp = (__le16 *)&ctrl->wLength;
-
-			*temp = cpu_to_le16(RBUF_SIZE);
+			/* Report the length we can actually handle to userspace. */
+			ctrl_buf = *ctrl;
+			ctrl_buf.wLength = cpu_to_le16(RBUF_SIZE);
+			ctrl = &ctrl_buf;
 			w_length = RBUF_SIZE;
 		} else {
 			spin_unlock(&dev->lock);

-- 
Git-155)


