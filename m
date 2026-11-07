Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075740;
	b=BqdVuTN6CEcSqpQz9i/EmrY9wzLzH3U1fs6fmlRAdY8wW0zObNdrGdI0iEcPVZcrD/SN
	 u6vT46agvu0M8DRhW7a4WnawklU8vNm8trqF+ZM+Fyr1Wyp/e5HYpsvi5CfvQFZ5T2Hrh
	 +SIH2q1ddAHU4jxb1EENJNFgm2Inbb6eWtIwHfj1cZ7YnEbGsTwbyq525YkDvNYJydkFo
	 KtXRz4Wv/Ln2b8IYVjUHObeT/s2eeF3gxzETPGdVs4lcNhcVuYJgQDZh0yU69WNvC+VAz
	 gXWoMWphNdDEO0L5FYmhNNGh2x9pq58dcwYJKM9US/VDzUcRh0oeYgJ3qYqrmVryrrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
	b=nJB9fq3DYgTbpbD7tQHVQaw59H26B8eKW/74uv5JBxV6EZPPWL+jW/EX33JVHeHvC3a9
	 7pKX9nSdB194pqGShJBMw49Lm/pUBsVtx8I73YIAoax96MxNyK2UiZP/wCS+Sm5CbuxJU
	 hZvGz1corvnFYruBaETFrvFUQODIIn5nNXMdyu4bkPDvR/qwgVcxPWhGToZrWZgULkKZ8
	 Q2LXl5hP7IB6hU829OT0bE1Dr7Xd7bTymYToJE9+JCjGYY9a7HUvltwadYb/dolaAYxSV
	 l7fMwddIb2jNEeeQkET2eLgxZucREIDUmyZ+lRD3RYXrRybDJb5CL7F5AIG/A1UADXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=himYNpLz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E43606D81B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E43606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=himYNpLz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so16932295e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075738; x=1794680538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
        b=himYNpLzZcNXXAmhKRKSZU9yH05YDEjwm1NbCITImA4cc4vmA9CMcVfnCY4APWUtYx
         b0NipC8HeY+hXJK6g4Z4UwENA3xFcf8Ep5M2NQk5UCLRPTRymtPsxdijtmkfkEO86L/r
         YCCgSQeycbbsuD9/IZDSPjA1Z1yUKRKNITQL4a//EcEDJZis06wPGS92auOVsBxZAKy2
         v0iNZSJi3GQRtavcyuF5yiyYeJrm8/rOcN3hHebjxatLCRcUGvProkblZKFDyOTM+Bkr
         bjR3E7kj0sg8Q0vD2kpWnaX5QRLCXH9Wq+HzsZ6mhAsBYIxQ7Tf3+GBtstV/y3w73G9k
         lQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075738; x=1794680538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
        b=Swvlb9VM/3O0qChGgNPdOTVQBmue496NwrFhM+KMw1TiE54uwnjWun1lJOfuXanopB
         XVOignhLdZ/062ZMcLOzx8Zw93VE0G6sPMagpNhHKaRsuvo57N3kKiZVAAkdX7JFVcYP
         g0v/3Xr8TJSE+hEPgLC2j17Ks01kBSB3CgfqdDSJx7ZjfMu9ai/KIHwkwhAOzQ+f10OF
         hzIx9xe6RT8abhTZemJtWVMmwjrFaaK+YQSk317kcpXwNmRgYN8j5grxVbjrMirNfrtq
         YF/IhZIkKiJxGB4i3VQQ+8X5s8FdjgbYiIOdX2LzVE8GA8AncDw9QIXoU3wjuuRymbpH
         /+iA==
X-Forwarded-Encrypted: i=1; AKwUvBztCoLpvmF5jvJxrk0ATzU2hfZ9In1J5vv0nr5sf7/PVdfpN6IX0fWWomuo+GbsfzCgIXuE5402A7mfwgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HD+t7nSoKnF8eZrfRhURXD4fFpaNWRaRHqhnLMl780ORZLlGM
	m3ngPC8FmZYQ+WegFVNQXuQmwJzYhBv8JwBKgO6CP3CZv2TOPmmE5pbO
X-Gm-Gg: AYBFou2FB2CCat8qvwEd4JEgYlBJrGBgTNsGScLZAAoTY95unLPHX/HcVw28HOoBR9D
	w4I2wbMuxnlN5TkWI9qvJkcsfPFJ31CltTrOQHfmdjjKIyI1biN3odTcpR0HkxPetbaWPztRuAj
	NJWTPQt7kOTF76K5BrsRWiime/r95KZvTz1wJsWcFdHKUoTrjHc7BKUSL1nG5d9tD/bHtXFvAvE
	STW451EStRGFfrJFY3FiepSApkbXHAuya+cr/7BFGmfi6TMq9ZdU6Cc7PB0R4gIHiAxt8ZvsK5Q
	hUm2aFuUheh/mbKJ0fj92rVnTG5+/j/nCv7hntutKl47fXcrCWvIINgKysIWkEumrSsuHBzQvJ8
	1HlQFrwS4qW/iEDIYuaEt/G0atVwACoJI62ZoEc8dLwh9oxrT+HYPO3uSTsfIitWxRg/Zh8ApIe
	OwwMQvqtQ6cgxFDQU0wQs+KO27/WXXxNjNj44H1w2re76Ee/I5LCey2fhP4O3bVjyi7xLcU5uMH
	OLyCE6hRi4kem6QkV1zIA5j/QyBcyG0DVCzFhvapCUI1PZmfkXSM8aqYqBVBEG6v3UihtBpoQlM
	WkZj3hfJKjbJW9TUP9wzINxNiJO9h3t2nCNlpRFuQe8nbQcNuY//F8gUeYX5Jedvb1FOe/nWJ+1
	pkhCNWC9AF0amW9U=
X-Received: by 2002:a05:600c:6288:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4b6e063f189mr100513395e9.35.1794075738073;
        Sat, 07 Nov 2026 10:22:18 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:17 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:35 +0100
Subject: [PATCH v2 5/6] firmware: raspberrypi: Document memory barriers in
 property list path
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=P9wmJ6Smi8MVD/GA5S6rtkoUUYTGbgyj85KQ4DXkfhY=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVj2xkyPVT5nXwKtxjSn3VGbitptwgZjFMG
 flgoMHF3+mJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z8ckD/9/14C3WyvvP5/nFvlvavHAesDmGwgScVhZPxVwkTIbluUS86Yfcgvxe6e7LwCFBZdihey
 I6Avezu5N0XeO7niGu+YE0T8ciIn5KMas2xS+3jPjezE5aRZC6z9KNhTvQTK/y7jZTYOBcJ1IsG
 40iS7x3HiUKf68mLXn/q6iE78wc5QJsMvkMtlY4AY2XdtEMtVRwHE6bu5O9yxPWRQayDtPb2aIj
 sW8lOnzdzEF1D5TdMNgF9tWn2cK0JN/6i1RTmHBCAg/bVsqSkF43vJ7lO9VtQDRTnXwBWcJLzvB
 /PMsuc4wZvz/QT5CiDdN+VW7SxVHk2L7QMPxrIvl4+V3tYwsx1L7ifnJUemdBl+AcE91CSmG0Ks
 /l7XFCebwzC+A5noVmk5Cxeyos4iuTiS87gRWxPeoaefhCNlhv3G/BIempfih8pdhUYg4QJpHfR
 shk/G7kOijA4ZzPd7vCRjWdL8rwAkVBb3S4gtp5eYoCdhYDBYIGn3JP2Dxmj+iRL5WevBdXrx9T
 YPJafQgmGaIhPdS8fkbWPRP0gFOukJsKC/8/JcgNv3AsqPniL9upuugB5zdpgn2gkSzgpM14XEU
 ZnJv1dDzBzrTLfto/OFKf2uq1rLHf9t74YFfG/P8L6RrzTwMjE2z1S9RQbGvGBP01KN9Je9PHn/
 N3AK3uQijVtHijQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add comments explaining the wmb() before the firmware transaction and
the rmb() before reading the response, as required by coding style.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index d9a569a6dae7..57f21e4e65d6 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -110,10 +110,12 @@ int rpi_firmware_property_list(struct rpi_firmware *fw,
 	buf[1] = RPI_FIRMWARE_STATUS_REQUEST;
 	memcpy(&buf[2], data, tag_size);
 	buf[size / 4 - 1] = RPI_FIRMWARE_PROPERTY_END;
+	/* Make sure the writes to the buffer are visible to the firmware. */
 	wmb();
 
 	ret = rpi_firmware_transaction(fw, MBOX_CHAN_PROPERTY, bus_addr);
 
+	/* Make sure we see the firmware's response before reading it. */
 	rmb();
 	memcpy(data, &buf[2], tag_size);
 	if (ret == 0 && buf[1] != RPI_FIRMWARE_STATUS_SUCCESS) {

-- 
2.56.0

