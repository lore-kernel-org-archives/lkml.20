Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078807;
	b=N37JMKtEkmmNy0JnP9koluT/M04k6cbfORPh7F7qCBcROIMEQpqlRchktO1uDOzM+4W9
	 xuY/5k9ixJq0tjDHQMtbcsDdRNvHlI2nBSwEIs2u4J37WgpaMJgA1A+LCQuguuaZ4pyHl
	 ecAnAHXu0vuNFFd2Q4hrqsPN8SxS9giKYSwF44U8u9W/UEFspZmE/8DKgGfZOauXmz72a
	 y4HNtpUJKFsG2cHhoZdaaSkUGflFy2BZl4jWyXK6EER3zAXQjdB2OgKQLe7yKI8f7pnxE
	 8rpSxN2W/RSUhdbOX9WghYkBKtazQpSAut7keDHccEduCZ84khIYeBdQPoSGM/SulpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=T6TW1w2jznm3rH8N3w9X8qOCKxQ7D6pil2Ovq4EdpOw=;
	b=a9C+OoTaArvpfhffE3XFa3+QJa547wvc9KOWNYoW9Ja+iFSM+b7S6RmmzAk3kCoj5HCE
	 1ALG7PhjcE5pzzXDHwLbJlJhHTiZ0qUYhEM4BiG4fjMABnqNsv6RJiZ9x2GYIixkpNXfO
	 OcNEDRtA/IzAZY7yJuDIEsopbSfmS+UuVYl07DnjqLyUhdMfffz9JuA2469uRYliX+spa
	 FKoJTPaXkSpeONRcebrjV/uGBCN8SjlrSRJQGCKkAdsMQQKHFLMEYv88YeKQmhjoOICxX
	 fFSgBKgy6lQIkfOQLLwcggLUPdW0mFwrzBznnOZ6WvZx/VgPYx2kf6QWxBE8nop2vCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l7YWkduk;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11148606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11148606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l7YWkduk
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8b20a899fso23385165ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078806; x=1793683606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6TW1w2jznm3rH8N3w9X8qOCKxQ7D6pil2Ovq4EdpOw=;
        b=l7YWkdukGmEONpkg0BtkGWQSy4WllYCXyMIThhAIhTu4ED1/cSGJS5s1knAlHS8ZRo
         gfUwxmkyGTt4ImNVxavYKNF2Mtx0+s1gjwUVvDVAPZpkXf73GqiwBS5qKANmmXwJKQS5
         EEMlVMToU857uf7c5BbibthK6rylk2h5HT8vRc5k9JGxKhlmM9rRcktlW35VSFOjjr0Y
         IPXQ8SLb9FsfwzaoXHUohBXVTmaETd/buHwaL5V4xraKuVA9pxcg12MjsvhvgwWlAchI
         Dt9ntpCfAynJ6dx0DdEGpQeJ5+quw9zRaH8An0sdZveuM1g6Ba0/HUvnDlbFSXu7B/GI
         JJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078806; x=1793683606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T6TW1w2jznm3rH8N3w9X8qOCKxQ7D6pil2Ovq4EdpOw=;
        b=DiTuMkPk4qOoimpaDieYg9uvhNuk8hl5GwaqHzee6V/cspI/rEjjxQV0+HZmNWyxRy
         TQNexhTM3ImNfWtBWbcw+zxhNTjigT39kptwP5QpbAhbUOGLNmzN/WpZ454swdLLCBXb
         wAHhRevNbMlRNGCFXpdXD4NfU3OQn7mC4CbVdE1n9+fLE1X2NzSS3KfiJDgutn/blwKb
         6JYiwUixPkwaw9CcQQBYyr2ePLrCxJb+Rgcn37GmunEnoJXOIwCy4M9CmAn+Rn2g9hPz
         04wmyLgD79FamZYjviZhhNgsumvei8h7HDS/LgD3igh9x+ubFgOBqUm2qnNk2A0drwSy
         K6oA==
X-Forwarded-Encrypted: i=1; AKwUvBytCYvOhUc5mm0s+oKMq6zrRXobX2SZ3davOsZ7oCKMDU3GbhapsQFCU633FOpIt7wO/IuqDLH777JqyEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeTv5UCSTyXOatTFuMN+37scB8McA2N6eL+G22L/bIaao21CJg
	QW3cgnK50zDD0brUICAK6/W/JjUmgZJtXBjR/tvvlXuTbGmidxkIG3rt
X-Gm-Gg: AYBFou1q0WVHPzWNgjwPqKQ5erTfgJoMKRqUntY7gQTyPVMMKF/RbDYeqUgY/yxCovn
	8RIzROss8MA8Xkt/cuMNohuCG+ODYQZ9QelqZ6olsvp6qOCGUNO7XbBY1adi0db4kBikloiBXof
	DiZzWXBjd91pey+TbpDyYfdFwl7y3x92Qm3l7QR9mcfQ5pmV9FYhx7Zp6r34v+Xh+xji+WyVMFB
	eR5suN8SBb/hIok7lgUMo8ByR069Gs68SkG64U5YPJnmBEaWVhhSFCiUe2eoxsSlaufgHMIqhqz
	zYsxqORGz+EcZivSzKM89lg4+Ypg81nxObq+scJ2giXtRrscymRVMnslY5MsMKVoT+HmWjdcAt1
	+F9SMmHDzAiF2lrIRKnZFfOiulhXr7LV5WX6kduHu9Z58LeMrXncIfQfKKyStufLzPtFLtftgkD
	XK/N89pwebWzvLa2MnD6nVzUwJwKlwsj7r0XNVW3kUeMjPsbsXq8vZkDAtZX9wsrpSDyqvt7Y9j
	KjD0RlwuVasJPAUhnnQzNsBVPx/bAofn3xEZOLijSurtlEbTOhq1PRoB0DOqhtx/P5rrF9ySA==
X-Received: by 2002:a17:903:4b4c:b0:2e5:f62e:2eaa with SMTP id d9443c01a7336-2ea9c88872fmr70545755ad.43.1793078806314;
        Mon, 26 Oct 2026 22:26:46 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:45 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 08/23] rust: device: Expose Device from_raw() publically
Date: Tue, 27 Oct 2026 15:25:21 +1000
Message-ID: <20261027052536.1722081-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

We are going to call the from_raw() function later as part of the SPDM
library, so expose it publically.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/device.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 2291d85b6849e..a355ac9803410 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -262,7 +262,7 @@ pub unsafe fn drvdata_borrow<T>(&self) -> Pin<&T> {
 
 impl<Ctx: DeviceContext> Device<Ctx> {
     /// Obtain the raw `struct device *`.
-    pub(crate) fn as_raw(&self) -> *mut bindings::device {
+    pub fn as_raw(&self) -> *mut bindings::device {
         self.0.get()
     }
 
-- 
2.56.0

