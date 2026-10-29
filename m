Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793233265;
	b=RUayeuLwtMy42AV9cBgoJPCub5U9QwhBFHjzgVWVJhKhKvnL/9uCSLJqnZBOADt9m09V
	 tlSY7M43l+iE8zbTmEw4Fdj7KcdTMobs8d9YfQFjw1I3Slgyjs4uA87MzHUJZO4I7estz
	 k9NzSESkwTii09mXmk46DIsAJqWNzBdgG4OM6uzuqJ4NnEzmP9RT3HaJQcan4w3TwRCcY
	 hcES7Ib9SEfGYqtKHXb5bp/WaB9wCW7gMzvu7f38UwGLxzDfUgO+dNGOHUMYOv3xHk5Yz
	 wXbT9KiJ0xQg+rQ1Qbtu3OARqNB8Vpo0WYbUkMKImDsfUa6cq36ZuBCSF+lQqcoWPFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793233265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vIq9wiAZmB+1KmS/yZYktHfXkQOvd/D+bv9o1qwC8Og=;
	b=LkN6ChKFphDHLGAcEmg9mmEUjYv3SyWFqzzfQLzVBdOPvdxEP0n8FVGOWAW8YCBBCZBV
	 KdhxukKfCH3AfjZ9NEUomH4YhLXldW4hiMg15CBuZe40DgBoGADjZgAH+THGqDwiDKP01
	 AztzPIEgNEwN7mSkuFaRBAd/g6LrtwSHCM0TAQD1pQmLOo31IQ2UIp3nHHuncoiMkzgEx
	 Xbkp0ZhpOnMDQnX2BUqL9KhELiQIMY6CYrMAsBLswx6XZ3gqilvnBXfaEr4geibWp8mnE
	 nlSdLPUWIefDgHovGOoS4AkCmG2891uvNhnNLM290mUNOBZ+/C9gIXGhSQt9Q1DPIOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BU67W5xi;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BC4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BU67W5xi
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-34cbc588a31so770301eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793233264; x=1793838064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIq9wiAZmB+1KmS/yZYktHfXkQOvd/D+bv9o1qwC8Og=;
        b=BU67W5xi9WiPfZIoOW1HWWnGmpeWpYPpZggpKZfHCTykN1g782C8BjhTQMVA3K6zHa
         4DwIy9vU8jzHTrw8Un9xwJ+iqTZUCrEJFw3U/V3wjXUA75VYAqP4IzzNM5iZdxWvNMSN
         8kuYeWIjYXGVrVQfRKUf1iuPy4D+/GgsprAc6LvxCZ06Wqp9DfdVHNxtxGSDtikG9khB
         K5YpbZEaT/+TaizkUa/SJmBAav8ydqUPNTESboVpTgkLg1ksdYAio+d6eEo759vbqNhy
         eBq6o+8pljY66j59LVMf0otTeswh5VLedbMOQ0WKrnQzm4BK7gaN5hXShIZynOj8T/dC
         zZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793233264; x=1793838064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIq9wiAZmB+1KmS/yZYktHfXkQOvd/D+bv9o1qwC8Og=;
        b=QtSyL1p7uphHIq63bJM0I/vW3T3EwWuGCVQxkqC1suH5NNqs/wMjz3q+aRnudOFepZ
         wN6av3o90qqE8JQIYV3SnDHFvV4oZcu0v3HN1qaZfNVCcn6RRRXGkFB8sbsAJScoGtEi
         So74rwvzyhHMou6txGpmxWjf9fhfeIhUimqor1hC76nJDLi27DX5BmohwY8Nejp/8Cyi
         MmzrQHqdyn91/Jh+Ps1JJUJ5QVyUIikv2ObnO/9q6XPNPy63dUt9PQGZJHbkNz7SRvtQ
         5OD7e3Xt7lZgrqL/yQ82eVcbdMfS4VfzugI2ohkhb4KpB0ZLvR+kfEkjUP7DpKmYi68L
         8kwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIS9T0cQwbNd/JbY07QeD7oDBScZ2FyUjT/HWEvHWyrJ2nfMpm1wCWZ48GDq++xXWrzsHUyJfIamEjq4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYImPVTutONnIAn0tHT5Et9vtLVXiWoRrlJHtpO8omyLM+2l8qRi
	+5hsEN8+DpFyZ4OvQ2y1ET6f/2IFK8x9FEzKD4ExdmY0Sein6XxZUN/DxQoTe18I
X-Gm-Gg: AYBFou3/SBbWjDCKKQWHyGOMv0JjJrylcoPyl2EeuiDp9JTTglZV6St3Esg2SSuDug7
	8b0xI83tFwMZSVVSFzU3LMdugYTQMht2t/EVjG3Y2Cz8EDYqhO4gxCvnqFOFM/t3CbVQjT28TyM
	iDtad0c1e9lxgB8iDbntAuj3TPGhjNYILD074lOFpHVqo0ZWnmftCPyx+i5UhCqy6t6UahzGePC
	fcqOSyQF7tv6SAqErC+wDRAdT3UUgkD70H+TXrT0pyXoFpsc7Y7enbvMqvMZsxQXpQZ8GWBxYVU
	4U67JsElf6mq4fMPCzT6a8CeQNxScwrgKM6n+I+mFZSlrl6yfqdVgpcyE0EcDFtM1OzXamBw7Yd
	C4iFWxKuVW+hh0uNYMbUbl7ESDLG86+o6PrRgWn6aW+pPW0zRZqQ+dnClJda4YlrYF1uvVI4Kuz
	yfEKazFOYarGslYuHMo8KlIu8eRLxEmyZX7f08WG8zXJbKcHrlU1PD/qymDbfx3GHrFXmsa/2F/
	zOP9FT4RvnA0RUrHJcfHqDSYz8GFv4cRdp3Zk9aQQ7El1wQfUfP/AVYUvWEQOmyhhr1QWq3rust
	7HT0Nce5aNQEV/3nvcdTS/4BFEBnNY7CnHOb8orzuL95T4N0uBEsuYsW
X-Received: by 2002:a05:701a:c945:b0:144:eaa7:2763 with SMTP id a92af1059eb24-1a6ce01d2c1mr4046362c88.16.1793233263061;
        Wed, 28 Oct 2026 17:21:03 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm8845495c88.0.2026.10.28.17.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:21:02 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jirislaby@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] tty: n_tty: convert the full VTIME interval to jiffies
Date: Thu, 29 Oct 2026 00:20:52 +0000
Message-ID: <20261029002052.54117-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

VTIME specifies a timeout in tenths of a second, but n_tty_read() divides
HZ by 10 before multiplying by VTIME. For supported HZ values that are
not divisible by 10, this truncates each decisecond and shortens the
requested interval. For example, HZ=128 and VTIME=40 produce 480 ticks
instead of 512 ticks for four seconds.

Convert the full interval to milliseconds before calling
msecs_to_jiffies(), for both the read and inter-byte timeouts. This
preserves zero VTIME and avoids accumulating the initial division's
rounding loss.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/tty/n_tty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/n_tty.c b/drivers/tty/n_tty.c
index e6a0f5b40d0a..e485cf36dfa1 100644
--- a/drivers/tty/n_tty.c
+++ b/drivers/tty/n_tty.c
@@ -2219,9 +2219,9 @@ static ssize_t n_tty_read(struct tty_struct *tty, struct file *file, u8 *kbuf,
 	if (!ldata->icanon) {
 		minimum = MIN_CHAR(tty);
 		if (minimum) {
-			time = (HZ / 10) * TIME_CHAR(tty);
+			time = msecs_to_jiffies(100 * TIME_CHAR(tty));
 		} else {
-			timeout = (HZ / 10) * TIME_CHAR(tty);
+			timeout = msecs_to_jiffies(100 * TIME_CHAR(tty));
 			minimum = 1;
 		}
 	}
-- 
2.43.0

