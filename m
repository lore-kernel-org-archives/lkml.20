Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470985;
	b=cp3gqYBQDlj3h2tmLkDJtxSCuw1c4LTVJ4K3yLiQBDB51YyKhLj0mZt9rKctpFMhZ9Ds
	 7ZXqveYTR8UZK3DuoJaouWsmgj2kUewk+mVZhCrnit/eDhv6sVgoLL2FhS3jouXcZhBZY
	 KqgEABzgaUVa4ZxDPyLGsWVudoOVi3sVcR3m/6ZuysbFi4PZwdTeS9i84KPk8glaAZgFz
	 OqtWT8ZCJOu0xFTyJPf71HBYAfunCIwQZ6p1w2Ysk1ljCApSVs3fMZn/sO7fo0YgL+jdR
	 GB71nfwkjv+PAWNu3SzIuFDBCaFKYc+NBrpqMJ+6muywEqlc7rkZ5/eub7qRT+wjQLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470985;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BDpJwbTGNyEZBddgupUtTkbcG64c1MCzi1j9+WCer18=;
	b=WwDpGQjcvvkCf5i6y8/0xSKGTh7FYQ3L09oP1i3fMfW01VRSw6CkKvSXBUsQ1GCZlM2/
	 DDmOpIVBN+3D9gM+H3y45V1wpQjB2QGHPoFIkQPqCiwaD1WYBA7UTlrVAHELu8jpI+dBK
	 qYpIFLrQvdmjdPcE5f0hnUYboRYz+e2Fct88cOicanRgWVcz0htvtqikLN2yl9Ilnv10g
	 aBQwa2gTV9LC4QNVs3cvd872wrzcqi/TyB4JLL9Md1EP2vYXKXHUK7gAmrKsPX9Onlew0
	 PrDMzvfz8mfoxkn62nnou+mOuWiql5JP4JIxKAaIMLdHGg3ylBIexpdpSNwBDSZJDFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=hafZY+Fv;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB38606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB38606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=hafZY+Fv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=hafZY+FvAosdM8POEOzVNBnFIyide7+WcFpBt8+LF5wxY338Q9IgkWHPocT4ac1hDVsPeUdreRA8V
	 hgWrkNVCd+W0NfCowEs2j8jUo4IVjT8yA4axBkG+lQdcKadnEHHjmqIIrf5TU2ddX3uyW37jQAsnuh
	 n6lycU4i7x23taqU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af57444d65-7ffe8;
	Thu, 12 Nov 2026 16:09:42 +0800 (CST)
X-RM-TRANSID:2ee86af57444d65-7ffe8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af57423fdb-f841b;
	Thu, 12 Nov 2026 16:09:42 +0800 (CST)
X-RM-TRANSID:2ee86af57423fdb-f841b
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
Subject: [PATCH] greybus: verify the received message size covers the message header
Date: Thu, 12 Nov 2026 08:09:06 +0000
Message-ID: <20261112080906.33502-1-shishunbo@cmss.chinamobile.com>
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

Verify msg_size >= sizeof(header) in gb_connection_recv() so that
the "Caller has made sure we at least have a message header"
assumption in gb_operation_create_incoming() actually holds.

Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/greybus/operation.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..da53c0e026f0 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1047,6 +1047,13 @@ void gb_connection_recv(struct gb_connection *connection,
 	/* Use memcpy as data may be unaligned */
 	memcpy(&header, data, sizeof(header));
 	msg_size = le16_to_cpu(header.size);
+	if (msg_size < sizeof(header)) {
+		dev_err_ratelimited(dev,
+				    "%s: invalid message header size (%zu < %zu)\n",
+				    connection->name, msg_size,
+				    sizeof(header));
+		return;
+	}
 	if (size < msg_size) {
 		dev_err_ratelimited(dev,
 				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
-- 
2.53.0



