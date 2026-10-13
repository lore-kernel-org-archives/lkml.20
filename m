Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C0E1DDA18
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892903; cv=none; b=b3gZapP81yuvoAgoQxEX1iZWoG3UF6rBa+9iSn/jmADmCvIv4lsNIvUEId3WfKz6Mit6Om1/LiggScXiCE+51LO5VInKHaNkKdevpFQ4SxgrcJ0ZW9cK/ats0n2QZCmQmJOF6AJvNPdosrPyYDKE4G2JCMRTPAVuVs+j4+je0LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892903; c=relaxed/simple;
	bh=9fNKK5NKiv2nn0dtE2A5M/DAYjaQjd5RShBMcb+4KD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTnCw5xucTZKjop/FXluz+XCXhR8OO5d12ZOglBChB/nDtfC4MJP1m2DEaJcHcHNKVC5cRth8MMzA/5nYCjiCYCNbbANmzgSpQhr3Q9EiRa1sLSvN5A8YlPVJ0bslXnC2j4r1rM7KOXZZM3YkycOI0RYBFhNyOuQcwG2aQGFBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=nLeOKe7C; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="nLeOKe7C"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1544536a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1791892901; x=1792497701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trznEr0Nt0TB/Qrg8stsVas/sJ8/4AQEkEZTd9Nm4Yw=;
        b=nLeOKe7CToCzCxiRKQosfBj4hEfJ0CX8qedIYepbF2uaQbdm9f0DD65nKT2+uXyBDJ
         UA/Aq68jq/ltSkExzFzdfUpkhvd0E6OxHRTOlDiFygYFz6tQlDBB3lk26w7HBknTvWIs
         k0lhdh2Porvq2/gbtlOkrc9Yka7dMiqfpHMJUo57ZqHObXoDqgHzq7YfF754+K9+gMQX
         Vv15bLVpTEfTwOn/EBPdz/VKNPo1ixJ3ejz+ltdMhm3pDPfxQOOL9zBQht1kmomglNtA
         nOcYRmBoKVsFx/UShgukX0W8nSoBXvH5+euDC+ApG2OAtdQmJSnr+bcCGAvd0aQiEXSx
         IyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892901; x=1792497701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trznEr0Nt0TB/Qrg8stsVas/sJ8/4AQEkEZTd9Nm4Yw=;
        b=BzS405eHEQRjN2/t+8KpC5WHDW3OlfKYR11rZuILH2RWh1bvEJoQfk0w1SX5RadmRR
         a9QCARWdLH/Vx84/yPk2nd5xY2W1yaQDkpUCG0VGTt9OqIqloTMnLkh+8+0dPuwQ5hBX
         qLJwXMbgycLHWbSPKO5pLK7lf/Qcps1Z9YoK33SQnrxaA8BRcidCP3HYju4WONVI7w5o
         Ewa+LO/wgpEJ32qGLJMFmDlSBLgquakE3FNKlvxM7bH6VUxqsbgJQbziNE7LW/RnlxD6
         rO5X12Bka55uXsYD/8m0YTXRweCLhv6z5yP0qaDb6KQSddDdXczWetTUxstt1n4ksj6s
         ObAg==
X-Forwarded-Encrypted: i=1; AKwUvBw9iRnrr80C0kFbSTEQ3Q22gRkV2JxmjP8OwmUrn0wZ4ewUytLXVX8q9QcZjqNy+uq558Gq0DX3Xm8bxpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKstal9+EJxksVR02s7JFZwpDxIWAVj1KzRKN4VyfxKBfadmqxr
	vGRljUibxRXIke23okLPHv7Ql/18lXRoOdNJeLagXJXjZYlltwUcEfmjwrXlA1lPww==
X-Gm-Gg: AYBFou3lQEk29qZDb8M7tl4h1gI18/XSxeznzxfSs89luTElSPFLGIi9yZ36wNc8d1J
	ERJCTsETtxH6nESRPA2b3Yj8wOhN3BtPq2MtcsvlMNMrWrhqQA4w3qKOjYf46EoVpT9oZUKMUmy
	S2mBeWl2NMzz16O5yl0vC9eEUnHnBl14IeZRr6ufxd1vk6ccL+uRfG7vW3RpkftdHxViHQt+jrf
	rYRW0W9phcbpYTryjOnPUx5uWgxT6q5IwHPzip36eKcrv9Dd+NSCaUwz1OgQsgCLH5D3c/E9ztZ
	cAIU7kwUpvOrrCrZOI51qAfaZxCog4PXfQIHXfS2giWkLqTG4GyyiP5HRwbW1YUuNyWQf+ytUpa
	edFrWsukRAzxxSj/+WZP0pLSHbUR5WLF6bzRkiWoZKUPXQg2+7tQcprfJKwtmvx1UcQtNMHFNzo
	cz8GhZ7827A0ZMgwSnHdK3InZ7mVb4s//YKClfwc4CY8rHdTaKBEwMBMgfySOmp/ZRzSE8zJiG0
	rO/DzYdrw==
X-Received: by 2002:a17:90b:3912:b0:3a4:e735:b3a3 with SMTP id 98e67ed59e1d1-3ab3aceb920mr7051807a91.40.1791892900645;
        Tue, 13 Oct 2026 05:01:40 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab8a393666sm16566838a91.15.2026.10.13.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:01:40 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 13 Oct 2026 17:30:40 +0530
Subject: [PATCH v3 2/7] greybus: connection: Add
 gb_connection_hd_find_by_intf()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gb-uart-transport-v3-2-81d0a8a1acf7@beagleboard.org>
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
In-Reply-To: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=9fNKK5NKiv2nn0dtE2A5M/DAYjaQjd5RShBMcb+4KD8=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqzh2COazwEApIdoAXazEy3OPqyJ98JI87Gxgyt
 87Tg9z3GgKJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCas4dggAKCRAFzvXHieVa
 dMJ8D/9PjSo9pY9ouFKOh7j9voCHxrIgO0YC263yDlI0I9Y+bfqRBvtGmZp2HfaSc1JMw/G827q
 daIcbiETaeXskGrThy4jNxv8l7W4rnPcBE+vTAKkgVH+JxcHyhEXFQZxlRfvUpLUgq3uJwixT4x
 pVda1ntIOY60Ux68fV04O+xrSf1G02m+frYo7dpJguX7cCWN/ujJr/XIO7ExU0lp2HhGSpXXlQJ
 6COqc19ZneZgCP5DuykoSqoPZMzGndsZ0sBZUg4q7TTySG7dKnYN4zPzcOQ232u8VdNDPpDlLf2
 TxBS6r2sD/SkeJtlQy8TcrLygdwmdFlHvpeA+rayMaym+jazTn+hkHcg1wY/SKqCrqWwcjOY8Vo
 zcS37HURhTp7WpM/4mHcaHYqdoHuf01r0u16mSG003cJ9gpTeOk59kP+dpCYTqvkvjpMF5dDBtZ
 e9icsBzJrna4RBQgawSW2DYo5KWB1aXgW8GaLyCM3TOvjrbE4DIeBB+ki//sRBRZmNFVTfaD1z1
 U4eDRhSx7bTmr8XygRjQhJ3DGznyQvS9wGbznFeCcGuRjDjD4B/Wz0U83PfT1XX+bZSEHKn9hRC
 QbOzA6WouuHByilKMb3H/MKVrS6FOeQ1By3Xu1Y5LZgK3h2EopE60H/eplaQw6Ph5caggLkkHii
 HGktG3sXCsTaRrA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

gb_connection_hd_find() looks up a connection on a host device by its
host-side CPort id. Callers that only know the remote end of a
connection (the interface id and the CPort id) have no way to find it.

Add gb_connection_hd_find_by_intf(), which walks the host device's
connection list and returns a reference-counted pointer to the matching
connection, or NULL if there is none. The caller is responsible for
dropping the reference with gb_connection_put(). The first user is
gb-softsvc driver, added later in this series.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/connection.c       | 23 +++++++++++++++++++++++
 include/linux/greybus/connection.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
index f8fda22bc466..dc9eb49a69bc 100644
--- a/drivers/greybus/connection.c
+++ b/drivers/greybus/connection.c
@@ -71,6 +71,29 @@ gb_connection_hd_find(struct gb_host_device *hd, u16 cport_id)
 	return connection;
 }
 
+struct gb_connection *gb_connection_hd_find_by_intf(struct gb_host_device *hd,
+						    u8 intf_id, u16 intf_cport)
+{
+	struct gb_connection *connection;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gb_connections_lock, flags);
+	list_for_each_entry(connection, &hd->connections, hd_links) {
+		if (connection->intf &&
+		    connection->intf->interface_id == intf_id &&
+		    connection->intf_cport_id == intf_cport) {
+			gb_connection_get(connection);
+			goto found;
+		}
+	}
+	connection = NULL;
+found:
+	spin_unlock_irqrestore(&gb_connections_lock, flags);
+
+	return connection;
+}
+EXPORT_SYMBOL_GPL(gb_connection_hd_find_by_intf);
+
 /*
  * Callback from the host driver to let us know that data has been
  * received on the bundle.
diff --git a/include/linux/greybus/connection.h b/include/linux/greybus/connection.h
index b53aad2270d6..589721d46015 100644
--- a/include/linux/greybus/connection.h
+++ b/include/linux/greybus/connection.h
@@ -131,4 +131,7 @@ static inline void gb_connection_set_data(struct gb_connection *connection,
 void gb_connection_get(struct gb_connection *connection);
 void gb_connection_put(struct gb_connection *connection);
 
+struct gb_connection *gb_connection_hd_find_by_intf(struct gb_host_device *hd,
+						    u8 intf_id, u16 intf_cport);
+
 #endif /* __CONNECTION_H */

-- 
2.56.0

