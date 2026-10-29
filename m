Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250456;
	b=z0kQBUaQO43O13cN1gi213NJRIhSf4M7N6m2+H6iI+mzvZLojv57cPM+ZK7d9vJKz/zU
	 Xs3Wf9HZ8JLzCyxrizgicMxLyblrds0LmoQFcLpbiRmxwu3l9CpSVNI8zHqB1Y/PeTv2C
	 JznM8wCVhvNHrNSlD1BolRHmnuIsrJmu5araArBUty3ArHSdL+hgmtnPLFZ3ppy0pf8la
	 gZLsYriTt1/bhln19nRa3Kv6MnE4z9YTP4a7bRgc8CItfch36gfB9Lnb+fUFHjdZ5Ulx3
	 WhI3vkNyAtFr/rl6RJBulqKIIoEBzBKX/BmLYJjyZWItwdbqessUEHtp5yELCHXfxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
	b=mccZ7uLergxsbuAxfUTq4SZt3z66NtwCiogtqgWUijMMcupZl0ORZ9Ft/3bt9kZE5KXV
	 3Sj2lYwPzYL+PyEtGd2IEVmBDl7q/WfSXartVj9RGz4BiA3d3F7e6OmW1H7Sl3+YBpHku
	 r0Tu+zIGJw0jvm2kD78OUUxMav3L7M9/4Puw86Edq8knUw6YOsxGjJ5fVzTaEfqQDyhYt
	 jbBmiKShzmSOEiUFzyXO9am2rhLyyJRXCOXRe+wSPdMqFUmAbp36ZiFUkuTkutcH+Sva/
	 GZSSZGnUbWkSZHxjFMinUoTgICdSj4A8vOoq9nsNlNuVM+MFqCe33laCmDCpT65EK/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3BbByNv;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2EF606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D2EF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3BbByNv
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c20aso11858715ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250456; x=1793855256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
        b=m3BbByNvwVTB61CMHLiYJL8DEUQo3qdr97nQ+INggGQWNXYxuBhs6564SGou9mckbf
         8rMZ6mAEPe8pnfrrQDQvfoTRvLcbLdErwvhuvdZ6fHAj5OtYZaU22cn/PdKdnt6BbpNe
         XDodhGEIuY1dL6zQy5GTOyiA8zlLyZmN0KeofYJzI+GnLqLaPSJj//bcdLzSUsJGAw/L
         JKgR4xGuvprCIbFeUgmWsfX8a8oCH3GchhBPHoqA4aYG7FNiiJSxW7GmwR5+3Pm7SjHF
         eDWtTVoKG42ubA8r5DEbt80e813z+LbUxlbgs5y+DyZwQA/cV/40EsNXmladHSMSfkcx
         kXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250456; x=1793855256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
        b=Scz0D2xO2f6MyW4LHXyFqZxOBMmj5Jwo5p8d1QhYvmn+9ngUH7BYXajd8361AUVoeY
         8Honx7fvrj/3331fDuog3HjgQQuSahTWiDjL1pjHIDpR8gR8IzZlHIIkq2LT4aawoNBS
         T/6zuV6XNZsnskqsVD363SVm6zn7TagRwoV15DliDHwYtW3LWBt9tqSz/tiFmVf9lEaf
         GeAJviHdL0uhsayGw0Gy83hoxVmcT/kO+1AlUTRoosvW7W56K8DlVLeK5VOxmq8URzHs
         hdcMCV0cAi8n9MaXhhqenKC36Rge9flHHv+y8tVO8EtYJ2g8n2O8AOcalFU2LWldh+E6
         aJIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxa9Fc1ieDFT+RLN0GNMHM5EVKfp7i2YnCkwjLfRogePPJzSHZbpsTrReyY4WQyjEqICMP0+u3m75ZNOjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDxsS+U77nMH1Lo4Ca/8XssmvLj2BTZDek31uPjZCFtlwm9AOG
	TSQ+tWOvE1C6K5CbD6vJAqgV377qlbJyIxj5aEPX6/cCrh3g37OSvQ7d
X-Gm-Gg: AYBFou248Hq9fBpLLbxo4tjHVOwvIpaubJfGfXvd5bNIUK7BUEwbLEyK2vmGnjpRhrT
	ebQteRmAi8FNIeZZ+FlImtlWcy/CkpgnkPw1dt+72HtOW0+WCFOjdiDgA0fmO8Xcoak7z/CAVTe
	db4GRwMzTP4Thyj9E9A+WeBYK7s6UMDkpHtAxqves8JZmeMEdjfJ0Ph/Zn6B+i5UKio79b998KU
	oNgONMdXJ2Unqovm9l9E1oFcmyZfN7/Fafs7QLJz9pEWyGm/UKLXYjCNaF7Hx4rLc1RC6qNSPfY
	1dNG/i9VopKaBiSRrHqKv9KbJ2r4+ttIJnB4AtO7ONqFTUqLKCfAQVLa9M0fy53u5CKyZJbzqCr
	qfO3GVTSAdP3krmdBY+OFbcNBdhzteyDbZ6JelIdEcNcAW2hGqT4+8v+JuSY695t9rsRXPkKdLp
	2H2cXXgBA6TWThwC/ox3v8mmgLmLyA0wjhXR6hQ93gELY0YKaody86VXzFZwJeIMMq7o+qd3DMd
	PgkXuPhFWTopQMjDUaXxZIQxwtG5mtelsP+ittJBSMCnnhii0u+hv2y0hpK7qxeULhzUp9v+Uet
	+tW1ZDUaAZ4ksl3//14Yy1jayEB3
X-Received: by 2002:a17:903:38c4:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2eb005025a8mr38954575ad.31.1793250455691;
        Wed, 28 Oct 2026 22:07:35 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:35 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:53 -0400
Subject: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
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
Message-Id: <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
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

Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device trees
and Rust serial driver and abstractions.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c958a81b626c73b422c0d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4926,6 +4926,19 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
 F:	drivers/iio/imu/bmi323/
 
+BOUFFALO LAB BL808 SUPPORT
+M:	Kwanghoon Son <asdfkwang@gmail.com>
+L:	linux-riscv@lists.infradead.org
+L:	linux-serial@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/bflb.yaml
+F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
+F:	arch/riscv/boot/dts/bouffalolab/
+F:	drivers/tty/serial/bflb_uart.rs
+F:	rust/helpers/serial.c
+F:	rust/kernel/serial.rs
+F:	rust/kernel/serial/
+
 BPF JIT for ARC
 M:	Shahab Vahedi <list+bpf@vahedi.org>
 L:	bpf@vger.kernel.org

-- 
2.47.3

