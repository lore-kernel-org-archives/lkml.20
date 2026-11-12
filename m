Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476312;
	b=GfjS0BDXJc/DyuRcjf++XmT5MzqRai//dwE/ZbIAR7EBmQ4KImwBJofogTlnpGjBKI5Y
	 3QdDzk3ZnFVpkWdjqBrmtnvy3MD5AvSSuXzctQ4v2wKJ+pOSyVVmonq/HbadkKyWN1A3M
	 8kL6m8ePsHYUU1Oa1Lz+PnfcJQPtlLVk9sHezptG/x8SRnz22O7cbuPOqxqtk/TNZdPkN
	 b//SoMu0WmIae832pM1ye8PT3/AuOpaMDbm4sxYZ4f6Zt8+lcjNZ90CR1Bx5jm+42AA17
	 d/EvcbaOSJWWDtggAIZ5vhwRnYf4WMnt2JJZkl+WBTpCT+FG5w5bxXrgCfZK18DFYZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476312;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xxPjeJOonREX1Xv47QX7J8EQOUdHx478nuGBDOpBjAE=;
	b=04dwaL+WsO0sgps/gRnlo8KZnnlZ/oNDjXq1brmLzGW5n3BNDPPgtIHtF0qluso+ojOF
	 vJOsD5k9DL7bAEDGFzoeTHo6msrUIA7PkWU1GCgwUClq/VsjKTnBr2mrcXkZ3/v+lnmI+
	 XsUUK09d0nv9GfwRgX6IbGVfHOMxexOgkAHET/uyFCbt0NcDuggN8bMonJbexo29IrP/y
	 iJG/caVoyJ5c4/f57oJT4r32ep1CP3JVnITZggXF/qahDe94lVTEvbRL58Sn7QQ+IGqK/
	 UfaEcUiW+bTEQ/4DxloPUx5ZG1gM6kovOXly5Du5QNDs4w4ahJRfpNhwbw+dIyyex/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HwSm580b;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CA3606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CA3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HwSm580b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=HwSm580bIFqc4Igm7b7dHlWH3Y89Y5jJY1s6WUkQECkI7HPC17vvaz8BgCxmJiJXFWVWOxtf6Pgaa
	 a03GeKMLE/YPY9dchR6FkKk7cVA9aTING0muzUv/nTJYoCPtgydg9y2BVcdow1puYeHjHrQ4E2jpHS
	 cL+GYUPHwWp9/Fkc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af5890b93e-df070;
	Thu, 12 Nov 2026 17:38:26 +0800 (CST)
X-RM-TRANSID:2ee56af5890b93e-df070
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af5890c33c-fb735;
	Thu, 12 Nov 2026 17:38:26 +0800 (CST)
X-RM-TRANSID:2ee46af5890c33c-fb735
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com,
	dan@pereq.eu
Subject: [PATCH v2] greybus: verify the received message size covers the message header
Date: Thu, 12 Nov 2026 09:38:23 +0000
Message-ID: <20261112093823.37567-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112071228.33017-1-shishunbo@cmss.chinamobile.com>
References: <20261112071228.33017-1-shishunbo@cmss.chinamobile.com>
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

In gb_connection_recv(), the size of the received data is checked
against sizeof(struct gb_operation_msg_hdr) and against the message
size encoded in the header (msg_size), but msg_size itself is never
checked against the header size.

If a peer sends a message whose header claims a size smaller than
the header itself (e.g. header.size == 3), the two existing checks
both pass (size >= sizeof(header) and size >= msg_size), and the
message is dispatched with the undersized msg_size.

In gb_operation_create_incoming(), this leads to an unsigned
integer underflow in:

	request_size = size - sizeof(struct gb_operation_msg_hdr);

The underflowed request_size then wraps back around in
gb_operation_message_alloc():

	message_size = payload_size + sizeof(*header);

causing kzalloc() to allocate a buffer that is too small to hold
the message header.  When the response is later prepared in
gb_operation_response_alloc(), reading
request_header->operation_id reads past the end of the undersized
allocation, triggering a KASAN slab-out-of-bounds report.  When
header.size is zero, kzalloc(0) returns ZERO_SIZE_PTR and the
same read dereferences an invalid address.

Combine the two existing checks into one that also verifies
msg_size >= sizeof(header), so that the "Caller has made sure we
at least have a message header" assumption in
gb_operation_create_incoming() actually holds.

Suggested-by: Dan Carpenter <dan@pereq.eu>
Link: https://lore.kernel.org/all/sashiko-outbox-210716@kernel.org/T/
Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/greybus/operation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..dcb38dc29cff 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1047,9 +1047,9 @@ void gb_connection_recv(struct gb_connection *connection,
 	/* Use memcpy as data may be unaligned */
 	memcpy(&header, data, sizeof(header));
 	msg_size = le16_to_cpu(header.size);
-	if (size < msg_size) {
+	if (msg_size < sizeof(header) || msg_size > size) {
 		dev_err_ratelimited(dev,
-				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
+				    "%s: incomplete or invalid message 0x%04x of type 0x%02x received (%zu < %zu)\n",
 				    connection->name,
 				    le16_to_cpu(header.operation_id),
 				    header.type, size, msg_size);
-- 
2.53.0



