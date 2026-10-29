Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250363;
	b=1ene3bhHnClzprtj3T4HxdD1QOkDVuqWvT+RWHjlld2pp+P7dif68bnPLntexrPnDptu
	 EtusN7G9ZPsXJLHd7JLvdvcjAHRNrCiG5dB0XyRt0AiFhrR0yqBRsqJlFtIPexKn3bH8N
	 O618xA79JKJG+EAwjQPAPHIkT/t+pV3qFl+QTD/uOD1OGGZKTAroL5psuC3fWiz+M10kO
	 oWOVYjE54kFv2XmvTi2zQarebYAy3oCOFmwj8GYRAbo0zV03RAU16UqbNhiya6pfLJGrL
	 2yN+OqSd8dbV6Abblu5AFUY0knI1oIY60D9YWGOZHJixOqdbtotnzVZeNTvC6C63gIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
	b=b+LnObnybazwYthmPM6zxEQWa274xf/cCjd+XDvEVUJOqckhFAzJxG4ogES3XJugYoPR
	 9JA7w1hJgtTNVg9LknJoIM3cHYZuKU23giPN57xLgpEA/iXSMNe3PgxkY1c479QlCD72x
	 z8CW8EM6C41WDmxRrVDCzGa30rlS+H++lT4ZqG+5/ut4C2PhfblP28uG1hNE7LLtUfPn1
	 CxANH4KH89tmQdAJ4p1qz2Am2GiEyP1Xkxgygz/HXuGYqN2KyN+8a5eCsVVsnzGGrq7qD
	 DuBzbAy7akqy4ZXnMrRd8EjkRYqtIOM9wXVY5Mv2Ud4klsAPa9eTll593lMP5bHYx2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gl8ey3GB;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E631606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E631606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gl8ey3GB
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e93d9c7973so13760645ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250362; x=1793855162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
        b=Gl8ey3GBmfht7cSiQpmGNQR7xbwxpuuCKBlHrmofBx3tYVS09O2r0+HnIp4+gY7eQb
         wVQTGz8djp2TKsDRr7wy8f938wlJDT0gNIDUcgLF0g7YkAixOl1Y0bJJhi82SYVnn8/M
         TsTd34RjtjMt8hACDdnaHMbxL8GCwep6ZN5HmMiMPTXMqKj/HMx6BDQ9NvDp6qcuiFZ1
         kS3Zd1977XVul4kACm4u0F0kGNRhBP+YsnyhWmWDNlEyhNLn4phCpAWx/hn+7Qxta/6x
         uNMlNzL5Ppj1aNieFMykIoMPwGCx1qS2CNO5TldnIcnGVEWizAOyryoFETmlD+L20m9o
         SYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250362; x=1793855162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
        b=XGfNjKnw3EDhqAZ8qquhuO/9r3BUsbm2RWhWtdCgqsZKgfKqL4FKdtMmzwKyVj+9kc
         rKvyr029WkGUSNIFTnKjWOSYdaIbiDxn7T59ZB23Hph6dsMIkg56w1TfUqhaQhBDzlxK
         FrNGDgUZ5402GuWwf7JlGb+edNb4vHdrEShi/87tpksTbNzysPBFJ0OAY7OCJEvx3uCF
         3fQtNmQLB1mzc3WOu2cnbHGPvnmBvAFJ32y1ukexWNPWKSWMzyPSnprnHh09bawBTqsI
         9E1fpQknqxjeTjvMeoRAs2wnwYnRTuAhzOmyiA+9TxruZEqyCJzU+5gokMTngOquQwJs
         8jgA==
X-Forwarded-Encrypted: i=1; AKwUvBxmzXM3j60DsLErxt58NuZSEeWz/jhQ1dMU5eMaWIX4O0ve2U8R8ZQMBt+IWVJ5c/l9Rw9YS7CpXmPCXhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5AvbraBOUbLA20aBHU07xLD+G0jIbmcxx8yUxxwPUX3kZciq7
	ciUS5LL21uQwf8iwH0ZkRco22nYgn+g0Nf9+F4+H9HhjT4B/GxqFkVV9
X-Gm-Gg: AYBFou1RgnTlAuhNuHWqQ5NljPjGayWf7rO1b7pNJRxia04FArNhzGNHKG1virox/XI
	ca23FfHgQw3kas1uRvdOyXpZsaq8+mS+8m1EV/DsBq7ZfZ86RB7ZkscFGv6xYEYjgnXRLrB+9Y2
	kYBi8uEBpDBlUG8V+9sqvJ+BGG9uCIiGjSSaLUtS1wIAbNXy0Xiidk2wp/IgSDU/YQ8wwmp7WSy
	AjZfH23fDfABLKL85fOFxqawqvHssEwW7BSjh6Tore5HZih5iTcEYVG6ke333Ato6py1nFY4dq1
	Tjfz+Pd+6gLe905YYlqoh19nlAXa25V3FmVyCbt27yppUkXL9ePhByuFDfH+mgVNaDllXDQfteD
	dep6bHvPHVXgir3D7u8shm+g3iW3zdK22Y3lJeYpInmOKnSu4acOKZ/ifmbUvrcKSNODknBCLOf
	NSa39+GEHFbqE2Z6YK9R5otxqmoFBgiZGNpOWuaeCNrOtxxDrCuHzaLv3bAlrEdWgLTINWLJMuf
	QAfFZsAmZa46zRUlD8EDQnV3AhVJNrkz+Jk24WveFd1MDEh65yzLQcVdJuUEPO0N0hshbegpH/+
	36GhtFkFHCKXSw+4rhKqO8bpgXQ+
X-Received: by 2002:a17:902:e88d:b0:2e9:5714:6081 with SMTP id d9443c01a7336-2eaffcc020bmr39772385ad.0.1793250362514;
        Wed, 28 Oct 2026 22:06:02 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:02 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:42 -0400
Subject: [PATCH RFC 01/12] dt-bindings: vendor-prefixes: Add Bouffalo Lab
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
Message-Id: <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Register bflb for Bouffalo Lab Technology (Nanjing) Co., Ltd. Reuse the
prefix already deployed by Zephyr, including its bflb,uart binding.

Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1012f08e26f7f105ad846ab3629ac..24c670ff75b6f482ede1bda3b59c70ed9116042f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -249,6 +249,8 @@ patternProperties:
     description: Shanghai Belling Co., Ltd.
   "^bestar,.*":
     description: Shenzhen Bestar Electronic Technology Co., Ltd.
+  "^bflb,.*":
+    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
   "^bhf,.*":
     description: Beckhoff Automation GmbH & Co. KG
   "^bigtreetech,.*":

-- 
2.47.3

