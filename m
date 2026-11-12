Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467555;
	b=eCxsj97EyKgaPATosz72YFcjvmFMHenYPu/xsaeNHVzYVaoesSTL3BwuqRyHUflcvH0A
	 uLDIU149lQiBlU75yJtXh5m/SdbQ4Rwm6Wa/MeGAFQQDJMJx3mbJ72i+zUGQa2We1aQSO
	 G0CzAd1839jLrrf7+LO/uZfhg17nLhdhkmhWQmkTDrZc8GaZ5lONkfYBNwURlkv3wQOrp
	 vufl7SOn/LD6/boHgN4ATYFaskwY+oSuqo2ZMbIeOF+8XVF8eizCgJ0FEdPdMdiPixe85
	 tkGQZ+wMU+DNjkFJwVpH+YBRhpC+zJll3L+xniyMK9crhf0JPVZRZuqy6RB5IDiUZUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467555;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BDpJwbTGNyEZBddgupUtTkbcG64c1MCzi1j9+WCer18=;
	b=hMbrPlcPW/We1zaNF5rVFq06vmcUQ1Z39OKUT3tzSCM3vW6DUkPKuNI3povOPAz16x9X
	 9U6TL8knZ5soz8Dn1ctMMPEf2nWIsAv/YviTXqQLMrmzLVfGtQH8GwZBMyQEhUn4nEUGz
	 wrorzr/BIokVOwEgmdUai8SpzOTSwFPGYCgirTMvYGvRIRcawasdvrRGfgdAtQcdLwDh0
	 lRlvY6WKMRFYHOQLMtzpGderGtA5WO83dyHkUMg9NDuILYVZ5FMmniuLlIx5GAPN7Q6XH
	 WOZzpqA42yv1qpaU0vcvYsEthfNJNUqPUBDu4XaKexlo4fr+L/7KAC3b0h/ApnyKiOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=v35jfiA3;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BD7606A323;
	Thu, 12 Nov 2026 07:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57BD7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=v35jfiA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=v35jfiA3K7Barhu8YaUKyPBQ3IGtmumoNQWPTjok9dzcH/PihpJxbG4iy4ddhiUVIybk1YiUHJbuU
	 3BoUVr19rZMPag9wXkIARdklxAy7gikD+/F/Hfe0B4FGOIkOguj8uP7VRCsz38bZNF9gTFWzH2haWO
	 KW8iU5ZeJdnMgp6U=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af566de23e-dc962;
	Thu, 12 Nov 2026 15:12:30 +0800 (CST)
X-RM-TRANSID:2ee56af566de23e-dc962
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af566db076-f65d7;
	Thu, 12 Nov 2026 15:12:30 +0800 (CST)
X-RM-TRANSID:2eea6af566db076-f65d7
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	greybus-dev@linuxgreybus.org,
	syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
Subject: [PATCH] greybus: verify the received message size covers the message header
Date: Thu, 12 Nov 2026 07:12:28 +0000
Message-ID: <20261112071228.33017-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
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



