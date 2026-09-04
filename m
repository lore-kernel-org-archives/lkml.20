Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346743DB64D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509327; cv=none; b=o6U/UJqNMS//hR4cmp+l6cjPMjXAoAiLrQ/SDKhQgai+EC3B7ya7lKJ3Mpqb+1JBibtp9Jqopcitwv/SplR8WnTItD++dz9YrXssWz1I1JKFkMrxxQYzvC/M9yk+wNg67cNIJVkBXRueGkw1Uh3nZW83RV9/aQW0//4n7/ZCIq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509327; c=relaxed/simple;
	bh=HRG8yaKwBn0GDGeOsnSCOFw5tBJpXDRW61tdBHYRc3g=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Z855e9DcpVuqdx4OOFmXab+4GzkpDL6n08LcQICIccqyPebXvculYoXR/s0BJSI5cEM7RU4RZ2tFG/RKQxrODp1+geGHyyFhhlHxhCDUDRBWFrXdikMiI2QzHQXYh9VHIy/pouoVzrdyi93AKojH8vTnUpwUhNcIGs/2wWQ+Q/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=NPcpNc6N; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="NPcpNc6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788509314; bh=nho8IbnJyG7Kjtav+DITNHXIFmyeqhba4rDNLFMpjrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NPcpNc6NJpisIQvWDohJgfWLybwyzhPvZnqvLFuvTn9GxHNdKDBIMfP3NDYv5gNYM
	 LZJJNNkpf6KwXOf8QNmjZMljlcfLthrOA76HT1ge3Kt06Fvdu2wvUuC3uV7m+FCu0G
	 1UL4WobrM0MgXw3XRku+4d7Ip1BJU9/WMqZ73drk=
Received: from p920-station ([36.112.3.201])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 21F1A6B6; Fri, 04 Sep 2026 16:08:31 +0800
X-QQ-mid: xmsmtpt1788509311tbcre1ssa
Message-ID: <tencent_617A1B9F1DCD78A45A65AB7AFD8AAD84460A@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5WyGVtKkEKjRCNasawgUmwbW5s3s7zoenUrYfJbB7+Ku4T5IZKb
	 zoXUzgfR7Q7lsRnZ36SEcrW2o2JOOmLBmajzwESfqXuU+v3FOgRKlTXADFq5pmMNvFCKRtdt1vZV
	 e09TaNopvm3S+IdI3aL39n1wxnRg9dGQOw/Q8L0k0L7o7ugUqb4QdC8y56f+Ipw7iIDr68tRY4Pj
	 wx4+WaJOm63weEMtRch3fXTgekEOovFY4MuOLqFuk8rcC5/fpaXNdzP4RjfpED/jEdZCPmCHRCFN
	 IXu13eXsYUuu9DW+NY6upSUPxM7kgr4c9d86ekW1WdPAOhkqKH1jjcvolfDgtmP+LZK2RFUcACj/
	 SKqEzvd1O5ZNJqO7hWc/7pZSP54VwtVQp3n8gC53cPRcxc7t1oLAkqX6ep+d49zFe9B1sqfTN3FJ
	 z5qW5SLj/KbB5C6iVF5s2wQ0/2oENNZcY+mUlHrO7NkWmcA6xttUhfSZ3o8zs6YAv/6MgdpglztZ
	 bex4+z/RPIiqjrRYvUneoXaeYcOwovFHkgMq44fdj8+T93hZhSYLZVtGMmejws5dmHNzE7DRyrf5
	 HNzlUjmDjIgCAQ68Z4jZLBUv+AyLL68naAI/mJQdE7MUN0+DzjjSlf+mpkTJbFY5MRR98AwCzdOJ
	 vPTGOXvFUXqusgOjFsxo8jfq/dwP/jin1+rgtjgjOt+Z9IXfVFc2oak4aVG/nrNPil9e3GFtDXui
	 Rogs8HzBrelUybvI0DsOycb0IQB81erjBCgqtLtYQIKBWU4YDsGEb2l8ynRJI1xn0s2NW2+S0nEX
	 byyUGLFwUJNrCZNTbVpX0vYKawJRB6BmYFkWYDHj9yXsgfALvyWfVPhBO6ZhVNdi8g7Hn4KFczH+
	 xI7vn058E87e8TrJMxs2uDpsODRLpygdKJcK5aK34OdMTPObQT3uCE+10+hpzfvIzoOA1KJIvA+t
	 1rT3mUXGmRgnrYKynjuHFmNr5jFqeX3tjHOvYGVI1gBRXntsJDZavhu30f6zm/so8k207Y8eSItk
	 sQIS1sS+IygKea/p3I4Pj6U/6Qyidjt/Cdp8tju0ug+CzTGu1yM7I5k2Ojb/zIFHsWXekaDQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Yang Zi <2959243019@qq.com>
To: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Yang Zi <2959243019@qq.com>
Subject: [PATCH v3] greybus: operation: fix NULL-deref on short request
Date: Fri,  4 Sep 2026 16:08:20 +0800
X-OQ-MSGID: <20260904080820.3815365-1-2959243019@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <tencent_1CB189506DEFA4B38099D654FE6C2A2F2E07@qq.com>
References: <tencent_1CB189506DEFA4B38099D654FE6C2A2F2E07@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_connection_recv() accepts a received message whose advertised size is
smaller than struct gb_operation_msg_hdr.  In particular, a header with a
size of zero passes the incomplete-message check and reaches
gb_operation_create_incoming().

The subtraction used to derive the request payload size then underflows.
When gb_operation_message_alloc() adds the header size, the result wraps
to zero, bypassing the maximum-buffer-size check.  kzalloc(0) returns
ZERO_SIZE_PTR and gb_operation_message_init() subsequently dereferences
it.

Reject advertised sizes smaller than the message header.  Also check the
payload size before adding the header size, so that the size calculation
cannot wrap and bypass the buffer-size limit.

This issue was found using a locally modified syzkaller.  The
analysis and fix were assisted by GPT-5.6.

Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
Assisted-by: Codex:gpt-5.6
Signed-off-by: Yang Zi <2959243019@qq.com>
---
 drivers/greybus/operation.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..47d67c681fc4 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -364,13 +364,14 @@ gb_operation_message_alloc(struct gb_host_device *hd, u8 type,
 {
 	struct gb_message *message;
 	struct gb_operation_msg_hdr *header;
-	size_t message_size = payload_size + sizeof(*header);
+	size_t message_size;
 
-	if (message_size > hd->buffer_size_max) {
-		dev_warn(&hd->dev, "requested message size too big (%zu > %zu)\n",
-			 message_size, hd->buffer_size_max);
+	if (payload_size > hd->buffer_size_max - sizeof(*header)) {
+		dev_warn(&hd->dev, "requested payload size too big (%zu > %zu)\n",
+			 payload_size, hd->buffer_size_max - sizeof(*header));
 		return NULL;
 	}
+	message_size = payload_size + sizeof(*header);
 
 	/* Allocate the message structure and buffer. */
 	message = kmem_cache_zalloc(gb_message_cache, gfp_flags);
@@ -1047,6 +1048,11 @@ void gb_connection_recv(struct gb_connection *connection,
 	/* Use memcpy as data may be unaligned */
 	memcpy(&header, data, sizeof(header));
 	msg_size = le16_to_cpu(header.size);
+	if (msg_size < sizeof(header)) {
+		dev_err_ratelimited(dev, "%s: short message received (%zu < %zu)\n",
+				    connection->name, msg_size, sizeof(header));
+		return;
+	}
 	if (size < msg_size) {
 		dev_err_ratelimited(dev,
 				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
-- 
2.55.0

