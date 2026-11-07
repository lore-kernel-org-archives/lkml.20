Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069525;
	b=fqXnJrEZQGgXBTAa4TZXOagjL2J136Rmkpu4mKKiKBx5G4lGV0JIq3dxjsTwgA4Z9ST6
	 /NzbF7iuI+BXDlZ2pfCRZXgl/NrHG0fD28mRyx9JHiNTT4veViM1QhIVOObLT20WS4I8b
	 SyVpu0wIqJ31hLRqgU8g3U5Cbj/8j7HA0rv6fKC6RBKRfkz2pBc6fcqjlLDaXwadqhstn
	 DaabsPQdIMBYwS9ABfrCSOvdR2aQC/7Go0LnLq7x2Pn+T+YuHWUEJJznmm2tod4+2RqTd
	 0MgNCJtlh1LHoG7YyiST5qIBUjNz/WWscKa/ljHbwwX7iYZgXHmg0TCGsBu6XpkdAfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
	b=Qohos8rSA1ba2E+oNBZdQgC01iDzDSpcGEf6b2A5icKlHJW+j+V8a0K7obx3N2Q8WdHb
	 z7oDgeQn0/PyqpRs9fO6TKtqbp6qlmDAhhRdaujg91YN5Gqvf0EM4q/5JrnvZI9gXV+2F
	 KJqULW6hogCYMGla31Ojxc5iLbLiTJrUv0J6j5D2GyJt8PZoec6cfBBq5IYy5bUJ1frWG
	 956URiuF1jZ4RUyHQYpH7B8GV/rgrcdLbdxduW8gd1AvqwD3z+o38JI65q1Ud+GSqdZbj
	 1iOyMUZCYJmlBRvFri5M/LmBfehjvWGCJilTcAwMU1aA0plsAB+cad1nTvcRmV2NkJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rALiL9se;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3926C606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3926C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rALiL9se
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so13819105e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069524; x=1794674324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
        b=rALiL9seAq7PRcv76gNE/1nVD213K7HTe4D5Iy7O4BZ3mCV6pwLjnCe4VML4Q8i3/L
         UQW1TJxTbFUfV10TpkczpOfP4Fa8sb6NdAbLc+m3NFJ6+8tyEecYTK0a7/cnwaXjDqce
         amclpqjniV4doFWJGE0NIOM9EMNnI+imBPpml3P5q2ylmJ9C5FjmMhLEp1wJWcpY6v+Q
         417gYYU0wPCd0z++P10VPlNhVieEH4++dq92ejpy9hLXMBxuPSEMK/TAKxIeADRVsNxw
         2enFx+dApHkgtb6rtkEeGl5nmUg8bXeMVipBxoh2M5be/VkHADc224tdwmHNq5G65Ljz
         tOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069524; x=1794674324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
        b=V4iO3Sh4QIciHDyXIdKRz/dxrha9JGTAVYjq91T9FfnmMRjhtCCFR939dBLir/l8qA
         eJ1I4qDMu1XHlrPwV1yyBP4TVUKm22eLlqDsUYyS24FUw/bdwJiulKQm1TPdTngu/8Kr
         ALegM+r6n1c8MBCZeRzUs421h1MMnKskJTpxbYnqLDP0B6hFf19gI6S+U2cv/wgdIg+r
         HpIHpvA/iS6XrOvHgXb+eXIfZnFRkHTcQ8Dexwjc//69wR5XIH+RvkAM/0PoI49upLkW
         elPNo8ljB9BPZgpOyVCOZ7wAdo35s2XLU/Q2Vr2O13cDSeKH06wK7bwpHGap1z7VEnQh
         AOnw==
X-Forwarded-Encrypted: i=1; AKwUvBwcSimeowvIRl0ZWEhy4siKFOEBrXYMKtgPpcT2l8GxdNiRJV/L4RpNvD3ueZjxA+rn8RnpwecS4YvVXKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KyXJ/QLL6cM4ZQjA8RGfypiGRWXViWBgefQM3+1kPOrXprudH
	QVA7yBI6EBkemVqoLIm+XCiVxUZVIRLv3zcpcyeYl88w/uIuYH92IT17
X-Gm-Gg: AYBFou2LUPGNZHR+viwzDBiw9H4GJTvCu3hPfoZ3VXz2ZiYZlk9u3n8DfSbKa7Lmu2j
	O3PmCU25uoj8l3pkamrxBb/lwyVo7FmwM6zvUL4UepFJaLTUe/sYykMc6PwZGxVH1GwgIQ7jP5N
	hys63S9BMVph/jwqr7TyzvfLzhBJj9Hv9RESoB7khqfoCtg7FNAJqlKnLiiUQybDLOoYPAdwJmz
	lDhh1RPdQtN7P4aqW4xoNPCmI592yczIbvBvzsaXO9+vgmXXkh/51axIfCLqagcLsBP/PkWwtM/
	9HZydoZOHebkD7D2VqTpCTAKlyn4kYITGrdXAAv+guE6jiuDLhG672qV86vX6e5Fiui8wrc1/dr
	9ThqmBTjcPxEXHN55iGihby6vK/PltxTnnkcR4Ywq/8kW50iNCQjW1+Pgxf7H4fdZcXNyCLzeY7
	MQdJVtuIhOS392xpiS/MKEJq+r6JsvJZeKu6M68bHnPH42b1+6n24/TD+MmcraANAkiLJ130foc
	E8h2cVBTAE3x7LZngOY7QpzvDZWgZj0D9Qyu2WUpDNdd9eMYla+pujVQNyKTDXpGIV+N4v0B3PI
	Ox9dsSfxtkVadvdDkXB2PYUB0hzFqeX4Yy2ph4TOyjJcfYtIGma4N+8/Yv4x0lnN5HvO2aLB/oH
	tBovcmfZ59OYrB/I=
X-Received: by 2002:a05:600c:3b02:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4b6ded49a38mr111142035e9.28.1794069523638;
        Sat, 07 Nov 2026 08:38:43 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:43 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:05 +0100
Subject: [PATCH 1/6] firmware: raspberrypi: Add blank line after
 declaration in response_callback
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
Message-Id: <20261107-fix-raspberrypi-firmware-v1-1-707362c710cd@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=641;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=oT/JQjeja8ZJ/ptNbh5as5O7phAoJf3oIOYYqQOmlq0=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRSwl3dPT7z3GewKlQZwX836+udoUYb1MYG
 2lOV+cpxsyJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 ZyizD/4tgdMiaKw7eo815OU4Bg94SHIg6on//lvweQFfXg/MAaDe8Q4h7IKQSUuKIlIWK8xeQZj
 RjAd/lvLrxfNNP6eDPbYjfmX9UNmxlApdkpM8aqog/QYAOyCCQedgj04EJTvTCX1XL/Nb4vC7NU
 cRxhZVTqqKogGrre5jJNCe1xmeqeZnpNcNNsvXhik4RasxxaYzXPGCzAK06Bdwod+QkyIIbOOhh
 fxlBCScPNPu/X+S3bHgBZ0qKXeNTvhvWjcK3vmdLBjNF4De8zAdDuztRFt0jWGXFnpb/HMStAC0
 CvO5bQxqsrP+qLBHKCa4ZgB7n3Rou9QM+njTsB8Wqi0iArxW9ZXZwRnL210r7M2FEorUvWutKHe
 aklv2Ix0+jNKSiY3A0tx3liZzvhzv0cH6zHtrAjC2MzEM4VAT+v6z/5X+Cf66Ut0VS+ccq4HDr6
 n/P0dH4utW4m7uWd0iTQDuEBzz9Ove4XBSh2DP2nNb+wNE5kOyLQBqPit7BK6Wck5RJzBDNPWr1
 nxXTOnqbWXgEwvDpHKYMn8sHKUDILwUsxbqn1pp7qUwg6+gBLsQQBYm5UON49xEG431NrWJtLAs
 AU9y9KBPrVEwcQ9ywSH3lEslFs5JTXzhM3yx1sxK3a1eRGWeCujJ76tQ/DW8vRstH22Ak/W4obH
 vjwNne2SbDgMDoA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add a blank line after the local variable declaration.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90f..8f3653c4a669 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -40,6 +40,7 @@ static DEFINE_MUTEX(transaction_lock);
 static void response_callback(struct mbox_client *cl, void *msg)
 {
 	struct rpi_firmware *fw = container_of(cl, struct rpi_firmware, cl);
+
 	complete(&fw->c);
 }
 

-- 
2.56.0

