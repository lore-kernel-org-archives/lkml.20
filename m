Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415259;
	b=oZx57l23zc5b6bkXn4aCKcXd6XOOGPqtkI1XqVPQXqCPwR4CYfnYuEmeE2GH09jGzEUm
	 5wOKLuQZ3O6rhocJMPwckuzK+NqnQnzc/LADbv75uNAXieXB/PoUpHzOIkvwePe6j7+t2
	 GxmnH7u9tpCDjMpT+6GDjsncPCZbubCRqNlY4IKaECOAMzp8DEhes7Q4dO6TfEJ+OYYfl
	 AEP4N1/frqSj/1QOVAnuhOGpwP80ngw7u9cY2JaraNRulzlPUv64Jkf/WIFuYNuWN6s1G
	 4s1VML6OWP2cR66V6Q6KAcSaCCuQE4DHXwauMfm588+Cs5j5cNx0YafzseL5bHNdEHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hU66dGPCrYHzM6DvcebvStQj80xp1zTkZ01vqrLFXZA=;
	b=2bY6At7TUYkRGbCJLtnnmm5S6SooYdeDPbVGRtrxXv5n/z92+Vo8zo9amYhRe++QBKrA
	 HQW/V3osvZv4XH4ZK6+uRxoXkt16V9B+JgUDda7LX2S+HUFPqZJO+sCt0R93wZ+jNJngZ
	 dPoeYNJJIKL/QcadNeapGOQAtclz/GcfEn3kTDIHHiffl1O8CEjvmmNPHOX4vZqEgLDOH
	 8nRT8JtBZQ8SWkwWQ9460Pcledfug1WwEjSwIxtDN5f3COR81W9FgzJIqTfKiCVA6HPaJ
	 D9WqcV5OVhSv4Qwu06XaGkojXCHdja/+CmjMlEmCBNSmNwMET8JnKnTeuiL/1gKLypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CEzVdSd0;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB2606A88B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CB2606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CEzVdSd0
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-372bdb942dbso4316779eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415258; x=1795020058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hU66dGPCrYHzM6DvcebvStQj80xp1zTkZ01vqrLFXZA=;
        b=CEzVdSd0515WKw9RZY3/MOQyKCnhatou4SezjMjesDl52x0FbFPjHww9GSOxmLjAvM
         XzJq458IAFRscZCx+jC9XTRyXKc9xB8WlkCI4MZ4eVYLR/6T/DGwet/vcESteVpNX7qk
         yLEURgq486WKKY5jQE1Qz6fOd6GGiwjimeEobcDkvxc9EbYNdOBSZF9yRzZabOKafVgD
         scNCfmhOn9J5hKrEyX8MHDpQrpWZo7z9eiLGzW4QEwueKThii0EFNDHK1LaQk/O5NmvO
         kCHth3mYGRETvvc0TRqjPeZTI1CrCHg7OE2A1pzxBBo3YfG0xznsqx5NJXFMPC7UJhJo
         Atfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415258; x=1795020058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hU66dGPCrYHzM6DvcebvStQj80xp1zTkZ01vqrLFXZA=;
        b=M6BI5FcnyyZCjBt9HgzUaXRRpGAKHWgwKW/mI7eAMUaUZoJiFAa4ozM2ZlZvZqxyoZ
         z80gD4Tzj2uruJiDY63y6+WvlTWsN1tJXVJur3G6YAx04O13otFixFsWUrcyAba8WJbi
         Ds/aXrhTRsSXfsRovKB5gW4zqvJCqpZl8V2+kxKZmz7gwlckartMAkQC0NOTMAWGGEqu
         7wqCdnUY+XUI0FLmAgsyYLgWBkWQRtAJfPzafjhmaOjUkDfVN9SeOf2li35Ts/ZtnFBT
         w0b/f6SSiBYatbJPwigMyC7YkN9hxIh7EEGurhIvdcZfXG7k9QD7VCKdJx6fr36zd//b
         4u7g==
X-Forwarded-Encrypted: i=1; AL+hErF2e+1JMIWGZZLwtn2C8//X71l7eyXq3yMqD0gvBwYtdl0rhjqn7Dys0rJl98Xcj1c/zvn1IhJzeSaR1Hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WRoICi9gwB8zGgDTKPAOhr25pZZzP5qooWeVIIdvoIJjyO/wo
	L0wEYjU8QNb7UfkuDxsdJy4Y3QJMfCroaq1wieuBi4r2Ljzdv7RX9QhZ
X-Gm-Gg: AYBFou3yjTGHgP4U0ktkV/vJAxHOW8MjumDh4IVnuBDg7rXpG14d+LLJDSLqsw+Es8W
	+hyMuplTh2Q4QagHAjy8WE9voEsAGwdcvLgQLgYO0Kr8L3Ok4T4Kn0elS5lqhDtVSXfiR2QGUGa
	LTFpkMUIp4Xf+kJj5XrDnAJ3dMW60lzpxIXl8CL0WcWrNVAI4EEX8Gzm+PL5eIIiEbpotdogsWt
	L7bqp1nyRwvIq27oCPCAlsV3To5E6Hq8SewRecbbYnWU9uYKseh84XW1K+6sJAwGGsAjKyaNDPw
	9AEWEhbWe7M1agf0mixI4cCJVn2oq/aePEEAviCh8Hqb3RAbtTV0lDPuGufEIOVgAODgYwZldTv
	voEhC2+ZzpULuf2J5AtOJ3SVnhSAFGVLKNoBMM2VPrbOV7d+Tiszi3A/2fvxWXVGeeO0aVKn23R
	OWjvLrPik77GfBZhCAm8rKOKehMEhbyRHoJIU73OofS3OwNAvtzLMjb+fJ1v/29IX6/yRZ1zpnv
	JNkOsvCgGWLKGU5PEEhxDeyVewioGMMA+uRR5K0j5CBab0Ar3hk5DFSWlBLrouIr4oN45VccOn1
	kp/Sde4dQ8X2/5vkddkJH9sHzQtWTmHlDdwrg7EfwLlWK3XoYHV4zX1E2WGQoS8XHtq/qv+6HGT
	tlv+g5gtgYBuNNARZS35txWqL2qiDLwS+ZGUIpa8+SXsT0psPkWfpl8akAHDoQbxg5DyKc1vMk9
	mzIzioKi/3DqH4dmmSULxmx6O8R5zq8GIL8Z3HB2Jlfg==
X-Received: by 2002:a05:693c:8004:b0:36c:dbac:705d with SMTP id 5a478bee46e88-3768617335dmr3164693eec.15.1794415258050;
        Wed, 11 Nov 2026 08:40:58 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm19158013eec.24.2026.11.11.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:40:57 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 1/2] iio: proximity: sx9310: reject out-of-range hardware gain values
Date: Wed, 11 Nov 2026 22:10:36 +0530
Message-ID: <20261111164041.341776-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111164041.341776-1-kapoorarnav43@gmail.com>
References: <20261111164041.341776-1-kapoorarnav43@gmail.com>
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

sx9310_write_gain() passes the value from userspace to ilog2() and then
FIELD_PREP() into a 2-bit gain field without checking it, so some
values silently program a gain unrelated to the one requested, and the
write still reports success:

  - 16 and larger wrap around in the 2-bit field, e.g. 16 sets a gain
    of 1 and 32 a gain of 2;
  - 0 and negative values set the maximum gain of 8, because ilog2(0)
    is -1 and a negative int becomes a large unsigned value.

Return -ERANGE for values <= 0 and for values whose ilog2() does not
fit in the gain field. Values between the supported gains of 1, 2, 4
and 8 are still rounded down, as before, and the gain read back
reflects what was applied.

Fixes: 227c83faa2f8 ("iio: sx9310: Support hardware gain factor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9310.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 2585b9c6fb69..f0280b79b56f 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -665,16 +665,23 @@ static int sx9310_write_gain(struct sx_common_data *data,
 {
 	unsigned int gain, mask;
 
+	if (val <= 0)
+		return -ERANGE;
+
 	gain = ilog2(val);
 
 	switch (chan->channel) {
 	case 0:
 	case 3:
+		if (!FIELD_FIT(SX9310_REG_PROX_CTRL3_GAIN0_MASK, gain))
+			return -ERANGE;
 		mask = SX9310_REG_PROX_CTRL3_GAIN0_MASK;
 		gain = FIELD_PREP(SX9310_REG_PROX_CTRL3_GAIN0_MASK, gain);
 		break;
 	case 1:
 	case 2:
+		if (!FIELD_FIT(SX9310_REG_PROX_CTRL3_GAIN12_MASK, gain))
+			return -ERANGE;
 		mask = SX9310_REG_PROX_CTRL3_GAIN12_MASK;
 		gain = FIELD_PREP(SX9310_REG_PROX_CTRL3_GAIN12_MASK, gain);
 		break;
-- 
2.53.0

