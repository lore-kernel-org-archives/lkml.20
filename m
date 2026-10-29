Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250389;
	b=i2mKx1DONKNnKhfsAXzN8kkc/kpCtKVflKurz7DOO5qKI/WLOAbr81MjnYoBq6h3HabQ
	 oekO1673f4xS4oxrFPlOMZQylRAjVq/Uuy07h3mMEGV3NRpPaQxuMl7MT5zJygykCUOll
	 hF7Rhgc7Ecrdds6iFeuJ2EgAjaNZQlVb88lkmdbKe2mrZceOcJd23VJTyKDTe4PekI5kd
	 NWX3gbjy9Nnv5M7nd1J9Dbpdc2A52yY/sH091FRKVHiCaVMcJDyLTEbP5KG4IqrQsDO9W
	 WcqXJndrr/4RoEdzCZd0rDNHm0DvOuFA9Xxpm171xm9tFUaVwosZmrlc31yiD6wRzUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
	b=a2vsolCL7UOPQJy+sTjhHxX1zCsNX10W8w++QlkQpkBO4iAqLdiBtqHqPxCZfLsroaYJ
	 E6lm+uOC1yCU4v7/QkcjaRY9CIU/AHiGpz0gEkaFWDXBZdAir2hlGr+VpPwQM7qqIot0j
	 0ha/SXL4Hqh2TfGsnLKoiWJvxIS1mWldDinX3RTF0g3O1GuipUGYPoK2zggbfPUqopGr3
	 Li7C0oCgU+e/TiTordXJgIYUrmY+2zV2MWMmpRVhleyv+0OTAGx0ACrN+zYhx5qvra6tV
	 rFs4FHjNDylNuoqEZw0T0m3gw+3DsqDW3Rr2/ObYvyJkQQBYxM3eOZV9gdvlgW4ra7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwxsLAlm;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471DF606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 471DF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwxsLAlm
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2e7c8213b09so5359335ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250389; x=1793855189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
        b=iwxsLAlminzYvBptDnBRm5gwKSr6xNCJXMFvGuDNq0B6sxOcBReZ34X15VYNkogTLq
         BCsstjXwc94FjXK/lY/5Fw2+rM0edRohKTYo8s9Trd3WGF0eMK0GFUxCrw5yDELYHMk9
         hwMJIh1iNO2j0n3YzTWCHRizeFEpMoCD8Tqoa2k0BXdriokc3guSNz9e9UYwqB5oGwLH
         L/DcmDcwMTXWm50BtOe+zbUtX4f0y0yP8mNAEveiEDaL0xuzoP/IAhmvy6/u2tDm98mH
         10LnEZGfAFpQaU9stluVmRqJQvLJMZAnbUf3c8x9DWNqYQbq/R35LQVUnFG4XQoTvmlo
         +2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250389; x=1793855189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
        b=kDvkZlTxuEYQ88lZNePhDcySdl1TKOGG22+rVClSCq0jS8OuKvfXokNXFphGjqDZzQ
         r3IfYUrVRMyWzMPqT1h3lB7Cpl3icCD/Pzm7afr2fIZZ1Ta8NMa38Ex6KOo3eNzQhhEK
         GKPtO5VA6XzKnTjK8HzeBu1rxuojpqMvvqOV4rUSTfxwAFgqzXm2mNpvQg0Rw5y+zi4A
         76MIyPBAOHc2fdfnAteoJEHwfN4i7+iDOGQGXAE7cEvbyZQubGhxIv4AlqMvyPQsHq8u
         BrI931jrw9ayX72m+5EAKAdxujMKLh8V2ysrwKbkgYUPhTs6ypxDDReKep2oHcT3b1V8
         pyCA==
X-Forwarded-Encrypted: i=1; AKwUvBzr/V77IgqpIadsZFGN0/ZNxIs5etoicmWIIvUvNuQj6RnCO4fL7udNGgaC/RiDSHbwedNoX51Jp0Auins=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCVRLi/ojlR2zBr5V06YC+y/bi3e0FztyeznBsGKrfwkV9j4NV
	q1H7SeJ/F7RejcboKjWiUXg5+uPB780dDGFODuk3fDC8HsHLaXjn38Jg
X-Gm-Gg: AYBFou3IScAbG5nXNtHlMfkoW0qO6sOQSfd8zqj/6fzsgYbABxkypRGWhh+TNYUPOx9
	Q/6rgmLB2TNVQcbz5tdoCZca5xrQG+zKMzoV33uZZTREPRrVguM+XJ1xLPXJ30g1qJ9+Y5+5vNU
	ct6TgtJ4N9j13QkxsuYxi51jlsE+p3wKVZujNjR1Lt1kGYXSPBvfgIE/b5YTOrG+BHNZ02Jzwfh
	eTdEF1cQu2il08CMf3WRj5KiK8dun8kUddujMJoZnrsknNSr6Ia9AuU3/JsuA0AheD9JeZ5XKpk
	CKDDTEHpvU9NMVF8NkUCCcgSmO/l7QgtYnnankKNY6ULpW1s0tTXAFJHT7wpXnkgA9vmLGefU52
	8B4LfS++gPFTkptGqVJdn/g32eaRVgVTARIasixwB3EiQH1p+XTjMg/E5xXradkpMGPM9rlw2/o
	lYCFf6LtXr6t4aQ7lHCLMqinwzuX3QQ3RWBTT2kZ5//jy08Ra9Q9g5dOFqq+5iUwxZ6mxBrntDF
	8g76xX8eE4p+cfby5tIxqkEhb8+UHyVbz5O24ljD6aUBQtQ2vRe/zSayW0D/CKLu3i+7gy0wMX3
	2MwaQ9Zo3Z3iOgqwSnfUfj+63Uqf
X-Received: by 2002:a17:902:cf4c:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2eb004f2a79mr39853755ad.10.1793250388648;
        Wed, 28 Oct 2026 22:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:28 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:45 -0400
Subject: [PATCH RFC 04/12] dt-bindings: riscv: Add Bouffalo Lab BL808
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
Message-Id: <20261029-rust-bl808-console-v1-4-b736ee920078@gmail.com>
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

Describe the Sipeed M1s Dock carrier, M1s system-on-module and BL808 SoC
compatible chain. Initial Linux support targets the 64-bit D0 processor.

Use the bflb vendor prefix shared with Zephyr.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/riscv/bflb.yaml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/bflb.yaml b/Documentation/devicetree/bindings/riscv/bflb.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a3c14fcc6c2e9fd6297cc2556c1525f4bf8e90c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/bflb.yaml
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/bflb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab RISC-V boards
+
+maintainers:
+  - Kwanghoon Son <asdfkwang@gmail.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - const: sipeed,m1s-dock
+      - const: sipeed,m1s
+      - const: bflb,bl808
+
+additionalProperties: true

-- 
2.47.3

