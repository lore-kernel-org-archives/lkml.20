Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193555;
	b=c4ljjOWJF0cC4GEiNHTkxKrV9HopQOKkwFq/zPXrdi+60otadJ4mpCKQ3QYVfHppAT/H
	 pw1nFB1McFF/OZHHW9u5EK20BtEgja1vHpSs6/L5QbHmZ/zXpMMz5LrGbfnYigqChsSI2
	 VCgAnWVqdvwMyPISSZ4tb7tp5yF1nLHZWzqxxvlw6s2qH84Z2RFzU2EFLeudLbqAIgH8g
	 aYzYYEgMETMs6/Bwx+apulMQ0ra8dW1b1LVc+TLYJf3JgzAswYwIse7P/CVRfRc/TvFNS
	 TO0M/VFulN50A1gHqUQygO2cPjOSTG1HtpUta/GVcF8Ky7oox9zcviXRsglMiiIGnzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
	b=Zzxu9GJ+R1ofw2Xl3Xz2HoShfAUr7bFROeHi8IQ3yeFVTRhFpDwi6W0/d8bpQ8MSwd/k
	 /HRVh1OkO4QPi0RnhODK/kjOMaRXrBtYh9KnCDHkBhI3YWKzZ4Y8egLJBu378x43xe9gW
	 nFf2rouy0pIqF0d+eM7zPGi8a9d7kHdKf0ljY9G+xUxMl4FqE+hknuPbqE6Bvi61EH9oL
	 EUoC0pVA8gKR9yYvNlVydGq8xX7OzzOuR5+oZyxQ6+60JjQ2fIRgIvg5VHRaM20mfKz1M
	 wbp6f8kLtFufGBOBZLz/4JuNLewe6773n5bbld0jqpM4S8SmLLfCmbyxwQCzjmUi/Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iMXd1g2t;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A713B60A2609
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A713B60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iMXd1g2t
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8526685e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793193553; x=1793798353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
        b=iMXd1g2tBYkihoc5u1/R6QT7SOmDZvI4CPOEn7qtT40TDcm13pH4/Pqg0nJ21lcYMN
         gHz/cTy1n+cpf6zzGsmzUoPogBB8yDicYGgqgPh7uMeWP9l8uQSDqycV5BLDnXCJLg1+
         I0d8K5BFFAgAx1QJp+E6GKeQMSCGfz8VxXILv5cYyOxpxmupe9jT1OY71A/0RQqHzG4x
         CRJr7brk0pe2OwMXd/97r675ix8hGQ8rY4mkMWKXEmnur8BiURLbsvskC5+PWfHGYXKt
         E0st/FZrILS+bsFXETdskOqMVnF/6/Dt5FYD5FcG45/PA8GV9Z0syqf8DDhZFXkMZZ1F
         r+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193553; x=1793798353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
        b=YbZ7DRwiYgLvKtPAl8DjYG+KcA7qHD4EbpIrW0Kr5Bb6CT+1HLEhUG1pwzvUSOcWqP
         kCA5UGTmswPhLWqohbG5xdhWQqmUBGSPZXDhEHMi/RUGYmjWC3NMg35Eo0P7N0w2utXy
         CLWqKFkucAAqRaBIvOb9lv13NQqugp71wLKZOwpsIbOaFGALkHR3hhxD/22Qw27dnx1s
         YSCofZ32YCX2TxY1PDpetTMs6P+UUYA/kxnuZCkn9M8nMQxHGfSJtozdp1BFWRrUDMqT
         Ed8ML1Z3zqNtSMHz8a0k/2Q6dB3qCwPu7INj1Nhi2qXD3p6C4XdnjECBWWnZny9hhKeT
         jp9g==
X-Forwarded-Encrypted: i=1; AKwUvBzpm6jFwZPkREmP/gYcvFy0U22ctGZ1Y7o72ku49B2ztcObce9GQtpF1tEc0Ox0aPRENJY2LvOXhgllIig=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCZckdKkkCbS8Ec2/MhD0nvqsP5e6+Y0X1ziiuem8dbezSac0/
	IjfTu+ncCMdhFj2A/4iZpZDIBDcc4LUXOu7v1P0Gv60EiQzijDcnN04yt2C23O3c5Yw=
X-Gm-Gg: AYBFou1BAdeiwsqAXYlHQFBYjHuhvXLnlu8EOwkYMn9oLshaPQYnt7GX8h7I0XEKS7Q
	wbweLFWhbwY5I/wQyNBsYjBJ2A2Xy+skdJ1kEDAmKJvAAN2w7FeWz0RWnMPME+CPhtDp9rBQA+A
	FOBi5u9fJSdj6kMYxOD1KTOtSTB0IRpLSPOw69rvidoTqj5OrsJfp/dRfLTgEoceEFJS+XxcCMr
	gdwyMQLNqiLmlhCBEyHCQ3CkSMqX4jjXuDwoMJ50gFMqoC/QJ9EWvAL/VH7NP/9deq0ro+eQnB4
	RI6kcRPAT/wD3e568DUYmGJ6pDDMamXfQAX/69v8SIozIPFH84YLeO1ktkyNML0LMCn7BOGVOvC
	mm+xOwavmgK65L9F7IEHSpPhwqcuOryW0gZmkJoPUaNzzlSSy+FXLfne+j2pLdcPfKoKCA9zL3i
	wGq/wsCd4QO5Cctofwtc6wt/V9BGzb4e+OOQxWI6CQ1vZsI0RtVcjQh9HlpWoH9TTqJEbTWRssw
	UEP9bU0iXKQNEHftFB8+WDb01Y1isxaiNFIpbub9t7rraT/I5t4ge9dlvh5gGSzlG7ifRWoIGAE
	Ndmqmff1NvTnnc7wlNIKzv+sRtfC1DzCSk8somBL2e8=
X-Received: by 2002:a05:600c:b8a:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a96667c848mr47048085e9.10.1793193552104;
        Wed, 28 Oct 2026 06:19:12 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a996aa0ff3sm19869395e9.1.2026.10.28.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:19:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Oct 2026 14:19:05 +0100
Subject: [PATCH v4 2/3] unaligned: introduce be56 unaligned accessors
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
Message-Id: <20261028-topic-sm8x50-iio-max34417-adc-v4-2-d4baaf3ee903@linaro.org>
References: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
In-Reply-To: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Marius Cristea <marius.cristea@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qfQWKiFOPYNKQaFmvtbGsS16Zvd0DPHnTyBZWWyunTE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq4fZLttrDpTiI9a7fF3u6Vq/mkfoNhMhsaRUKeks4
 cPp7zECJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauH2SwAKCRB33NvayMhJ0Z6+EA
 CKtHVa7jGBl285caxNm9xQSN4MTl330vhBNWXGFu5yC82S4NBo/cW0AGmnjb0hfLCbcQmTv14Qop90
 Erqm6Sern9H7ljNz8gHZXmipoIlYUE3U5aAB3KSCJBau5tNqWrBrrI9FAaB6kX71wEFTiQNpubSz3A
 ioNyLm6FRaoUTIdqQhuosHkJdM+inqv0Qtw7fwVESL7VjZGTSK5rSFE3WVyHPMW7HJYAVRZPY6ys3A
 qRjQjGf8XCJxLTqAJ8vBAIkX3Ztc1m+7ry0unPW0MkPkTjY5ceJFo6XqRtufZRs+igf7B6BW7Vxfrl
 qQBdJJkcCOixBr3gJqgm2iJM9oUvx7MIX2H8otzdtuowO2soismpKaLCzOV+QEd3P0joa538sKaOWd
 QXeY1Kw/+qDruF3fCi2APWxGME/ksnylZ8+kwN05i5bPn1L831P6rx4GLDcdp+qHSUXGwpZ2cmqZj2
 cyLqlu+TwNptFZbhj5eJS0bU+eQ3HarEwiH+y1s6eO0Gh3hr9XzL0iuDMT5yNizrlUOKZ6oPRnJ+R2
 GlNxzjGsVUraP5xTi39msbI0AwN9+xl7TeW7rA6PN8CypMvq6Cw5u+Gb5EpTxqIt04ltktxPpK7ZdH
 hO6qIAMtABkT3ACIed64a3INU5dZnqtgyfN15/EREM+0p31qcL/KrNppdoHw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Marius Cristea <marius.cristea@microchip.com>

The MAX34417, IIO driver, is using some unaligned 56 bit registers.
Provide some helper accessors in preparation for the new driver.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
[narmstrong: update commit message and move to include/linux/unaligned.h]
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/linux/unaligned.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/unaligned.h b/include/linux/unaligned.h
index 4a9651017e3c..2105743b1800 100644
--- a/include/linux/unaligned.h
+++ b/include/linux/unaligned.h
@@ -143,4 +143,31 @@ static inline u64 get_unaligned_be48(const void *p)
 	return __get_unaligned_be48(p);
 }
 
+static inline void __put_unaligned_be56(const u64 val, u8 *p)
+{
+	*p++ = (val >> 48) & 0xff;
+	*p++ = (val >> 40) & 0xff;
+	*p++ = (val >> 32) & 0xff;
+	*p++ = (val >> 24) & 0xff;
+	*p++ = (val >> 16) & 0xff;
+	*p++ = (val >> 8) & 0xff;
+	*p++ = val & 0xff;
+}
+
+static inline void put_unaligned_be56(const u64 val, void *p)
+{
+	__put_unaligned_be56(val, p);
+}
+
+static inline u64 __get_unaligned_be56(const u8 *p)
+{
+	return (u64)p[0] << 48 | (u64)p[1] << 40 | (u64)p[2] << 32 |
+		(u64)p[3] << 24 | p[4] << 16 | p[5] << 8 | p[6];
+}
+
+static inline u64 get_unaligned_be56(const void *p)
+{
+	return __get_unaligned_be56(p);
+}
+
 #endif /* __LINUX_UNALIGNED_H */

-- 
2.34.1

