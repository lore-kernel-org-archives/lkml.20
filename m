Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613681;
	b=gmxwpMVzVnKnN8NSuUR5EYvAt1FJFzXRDMRI2VEFcN2RC7D9Tr5GPvZXbc1vbpnBtino
	 TdHwfT2MNQI9TmyVSwJhBNnA/dqAl9LTe5yF8dg40d5l5Nb0sIlLPAcsiuuc2e6NuLGeI
	 6PbTmxOiuTIS5VYEyKPN26HtKJLnTgp2kIrKgjIEe3qGBzIOc9BDAy/DJgSSCN68Fukfp
	 ohURMcFThWGnr+wZK9cVpQIn5zorS8gGBkIhe2gpE9IaefDbMTkjKUyJ4JXSPKHNFTHy6
	 gMFenAVlMj9KhX97QA2AdFQK/u4v6wHDitP/giOhKDw+gwXJaSbQtMYPb1s7+6LflQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613681;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XAsSJNfTx4xhfOoXkTkpm3mX3Z/RpG+PiPXGvL3JZzs=;
	b=fi2jnJMfOMyy3WZqauwnWTB6qqgrtQEltS73amUphIM/reRmCegWO+CWGVLOGEKloa5V
	 uB/pLNUIc2QbfFe8AVJQnMLTvuqK+BVbrEhnAhdmfxiKFyGojtOqbrph1hWvul5iNn4xm
	 d6XZu9gN2X64XbyVKLVrRWuZE8IpSbIos+siEEawkeBWcIFCrqAm4KFMVjSEsxN863Z5q
	 3L+pYmRY0gGyWvl0nN2rnrh7L8o49xtyikD3LEMxNoFbC4Ji37ku5sGQRh4Iho3KjvBXg
	 3iFb+w9+LcZWkWmV7KGCrudhZE60hpEDG+/AfK0wxBFfZSE3nNzMM8Gjp1J78XPckhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=imeECTd5;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0537606A334;
	Fri, 13 Nov 2026 23:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0537606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=imeECTd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=imeECTd58AxEo9BWsUiwkbbdek7fBVIPutb742Y5F7i47S2xSl9lklGoLXERF5v8hgJ48bakuUonH
	 6f2OCqiez55Rb2wKk8BrXtWqt8x6mt5MoTx0p9GrfrYHx0QPiH3pEcoaARQ52vMpT3LjlKg4bU4D4x
	 DAMF2ylxXUKHjdGw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af7a1a1864-2a8ad;
	Sat, 14 Nov 2026 07:47:56 +0800 (CST)
X-RM-TRANSID:2ee26af7a1a1864-2a8ad
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[112.23.72.224])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af7a19cd45-3375b;
	Sat, 14 Nov 2026 07:47:56 +0800 (CST)
X-RM-TRANSID:2ee16af7a19cd45-3375b
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: dan@pereq.eu
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v3] greybus: verify the received message size covers the message header
Date: Fri, 13 Nov 2026 23:47:39 +0000
Message-ID: <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avV8I97uZJgX8Osk@stanley.mountain>
References: <avV8I97uZJgX8Osk@stanley.mountain>
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
allocation, triggering a KASAN slab-out-of-bounds report.

Link: https://lore.kernel.org/all/sashiko-outbox-210716@kernel.org/T/
Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
Changes in v3:
- combine the two separate conditions and unify the error message
 as suggested by dan. Thanks!

 drivers/greybus/operation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..74429f3745bb 100644
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
+				    "%s: invalid message 0x%04x of type 0x%02x received (%zu < %zu)\n",
 				    connection->name,
 				    le16_to_cpu(header.operation_id),
 				    header.type, size, msg_size);
-- 
2.53.0



