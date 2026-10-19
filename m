Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431986;
	b=pfCzNS3LD0Jr4DXMtqc+JSKKZUdNXjoPD9VVVQEDeVGb6n750gG4PBBDQ3eoaHgFWXx2
	 QkzEBFYtn/RGtm81e3M6N+/rnSFbtUH+rCgONgVfCFrHsAqaeHmJFfpIzxUgrUAJPfNr7
	 I2P7ASXLfBf3wGzr8sihZlBtw5mo/Tf7P2dh8L2MZZxK7Q+9Y+U7sAt5t47NrAV6B4jlQ
	 6k7kxO2FYpd3WJtjUIJ+IGHt9czE+awBRz1EPFqXreJiegAKWOeuTOQRGaVi3iPMELl8s
	 qALkdK9vQAIagzGfAoualX7l4C6jKdfT5doljTiaU8wTobm9abkA6p7o9YnXO1KtuRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rUn5zgLXzXgYU1XM2F2Di+NsA75AJE+txiiuJMlrB6o=;
	b=xpf4Z/Qr/pRQRzFDvIEJ2HohSH54BRRjY/z5GpYX2XSHW9NRtwd0NgrfwxnlTrSBnYYR
	 ODZU0gxukuqZyVR73FhMoH3Oh4iChPlNCddsQcij68zRLHON6R50O9ntoSuesnuTnQfR+
	 DEgotwcvBfzMUSsZm8xwHWA6oipoGwXNizgVvp+4KF0wdxRhtxghAEJeGX/M55wXvJ+0a
	 VDJHTRPzb7/L2vItHnFvLVsD01mhoZeBlRxXzOI2PAMUusin+24AJMURTGUIJO77Jlrad
	 feEtvjEHvHlnM3WVshbod9zRkzNaFhxSMuSYpqDEAtjF46bOUSiByNWl3UU86GYpivQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K0fY0zjv;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F3606A337
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A50F3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K0fY0zjv
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7c420c2c4faso1310818137.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431984; x=1793036784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUn5zgLXzXgYU1XM2F2Di+NsA75AJE+txiiuJMlrB6o=;
        b=K0fY0zjv75L6boTLJPgaLTaUAl9vhH6E3F/wvseIaw4gATYW3c+NPFhVhi0VVVRsig
         gYV6bmxEKCMQMIQ++RCEoK9WQctqPw+d6Xkv8ViD4iS94D2ddVa8/E7E9+mKw97j6T0w
         9hlOTm2TtHiuEDkz0CyOxhYrB79n+Kt9hpjMY2Px/Yq439PfNiqD1coLpzI6DD6nyOVG
         1howVBB+pKrRlhPoxdGp85XsOFufY8YsiNqE6ie4NMlhfpdbm/B/cZBM3jwgrHrswd2V
         yrA3XJAdcKjVRh6/PU+qFkDnJ4Bz1L4WT4CHca2RB6KKXsSf28ndcYPnp/AAV5HNN5YT
         yyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431984; x=1793036784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rUn5zgLXzXgYU1XM2F2Di+NsA75AJE+txiiuJMlrB6o=;
        b=UpoNy8yehfnkWZ+4LfYzw7w1fKUIdooqUHQRq712GiTBtIZ7Ra1UvgcAkQS0EGpPdK
         1fi4v1isZVBy86XQ5vchYw+KmHUg5LSyJUidUaTEDzu9y7vlNkxgXmPe/5JB4mmoY6do
         XXZUsoNQjD8ApVn26nS7DgKClrLrvWWHEqlYFyxsGi0Zgq1qs+vdwIZAjRfLVbZsHLUp
         9B0O7KkytGmEzWW3VwG66fvdAdqrO3EbWb0jF3ahr8V8ptOAIzkM9AyyKqM5NRp1fq0K
         +Ak20OKzWL29fvumRpxyU4sZnAIOo+mzqNnYtIhQjrxru3tcw6jEozWQSggd2gc/fYNk
         gcrA==
X-Forwarded-Encrypted: i=1; AKwUvBztP0orz5llw54TR4D3jULpGjLiTHDiMTMoUPG6+FMGtL3jaGnXH8+aIqpzFuc1XE/xAbijlMxRBGhtvTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1j8twGnuQ5Sw5ktbkEHJ/mQ1kPdMMjhE0iefHM70HbKXbWlxB
	mG7OreJFhfK+xDr6AG+gXKSHO34O9wJpfleCfhQNu4Of2JJQjJMU9HMS
X-Gm-Gg: AYBFou2dYgQ+rQOACdZ3piQSOw5RGWcTvzOdHtaec50Wue97TEuKGp+M4jY0eEzE6zM
	jp0043jpH8mwSikV6QFTR+WA9gHlMgAD6lkO3q1R+SI75e6KDegGfAbwzYcMppDkwKggJzG6q4f
	uT7MX3ju1dk+WaJ2wwPnmuIrje6rn/M4wFQpW0962Ug+Bkef8vWhjfeXxdw13jmrcw1IiD4aOIV
	Fjlai51vUjtVh2u7EF3G1k0VN2gruI7BTyffkSjyzVem8cGAZyMDyshMmA6OJdXC1AUn+lNuUtR
	H2YF9z2hi5+m3UA92vb6DIbmjxDwAiEmiRLbW5l6DVImcZ00P4YxF1DW0CYAFPRh6Mzv4Of4Cw8
	2QlGAVABzrCinxgQ+II2sLMqs0PTUvZ/SpxUF9Bk0B0TkfrWeDWJ8SnUv/T763hp2R5xgI7esF0
	PxCy2Ryb8h0Q1hn6CQ3ND/Divaq1j+/jrvPXJw6EnVMT2CwTOzo0jDGc9H7/IzQI3XCkOIyxSSj
	kn6bkob+S8UeS7AE3205NDhDS7pZ+ZYJg9ALitr1lMeiI504p5VUvCm3n8lbUXmn8UwS9jzQOmB
	JQWLSoS2I6TTF4Mhq6JBZ06Oiptv7Ng=
X-Received: by 2002:a05:6102:38ca:b0:7cc:3246:3095 with SMTP id ada2fe7eead31-7cc36b3d24emr2846661137.34.1792431984285;
        Mon, 19 Oct 2026 10:46:24 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:23 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/13] ALSA: jockey3: Add optimized codec variants
Date: Mon, 19 Oct 2026 13:44:38 -0400
Message-ID: <20261019174445.1931263-7-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019174445.1931263-1-fvdpol@gmail.com>
References: <20261019174445.1931263-1-fvdpol@gmail.com>
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

Add 64-bit and 32-bit implementations of the Ploytec encoder and
decoder, and make them the default.

The portable implementation moves one bit at a time. The new variants
spread and gather the bits a word at a time, with lookup tables for the
encoder and multiplications for the decoder. The comment in
ploytec_codec.c derives the constants. A build compiles exactly one
implementation: the 64-bit or the 32-bit one by word size, or the
portable one when SND_USB_JOCKEY3_REFERENCE_CODEC is set.

The lookup tables are built once at module load, so the driver gets an
explicit module_init() in place of module_usb_driver().

The KUnit suite from the previous patch validates whichever
implementation the build selected. This patch adds one test to it, which
checks that the preprocessor chain selected the implementation the
configuration asks for.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/Kconfig               |  23 +-
 sound/usb/jockey3/jockey3.c             |  32 +-
 sound/usb/jockey3/ploytec_codec.c       | 508 +++++++++++++++++++++++-
 sound/usb/jockey3/ploytec_codec.h       |  13 +
 sound/usb/jockey3/ploytec_codec_kunit.c |  64 ++-
 5 files changed, 620 insertions(+), 20 deletions(-)

diff --git a/sound/usb/jockey3/Kconfig b/sound/usb/jockey3/Kconfig
index 09939ec9691e8..b61a11738e9bf 100644
--- a/sound/usb/jockey3/Kconfig
+++ b/sound/usb/jockey3/Kconfig
@@ -15,6 +15,23 @@ config SND_USB_JOCKEY3
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-reloop-jockey3.
 
+config SND_USB_JOCKEY3_REFERENCE_CODEC
+	bool "Use portable reference codec implementation"
+	depends on SND_USB_JOCKEY3
+	depends on EXPERT
+	help
+	  The Jockey 3 driver normally uses an architecture-optimized
+	  bit-packing codec (separate 32-bit and 64-bit variants) to convert
+	  between ALSA's S24_3LE sample format and the Ploytec wire format.
+	  This is the default on all architectures.
+
+	  Say Y to build the driver with the portable reference
+	  implementation instead. It is much slower, and is intended as a
+	  readable definition of the wire format and as a fallback on
+	  architectures where the optimized codec has not been exercised.
+
+	  If unsure, say N.
+
 config SND_USB_JOCKEY3_CODEC_KUNIT_TEST
 	bool "KUnit tests for the Ploytec codec" if !KUNIT_ALL_TESTS
 	depends on SND_USB_JOCKEY3
@@ -23,9 +40,9 @@ config SND_USB_JOCKEY3_CODEC_KUNIT_TEST
 	default KUNIT_ALL_TESTS
 	help
 	  Enable KUnit tests for the Ploytec bit-plane encoder and decoder.
-	  The tests validate the codec against a declarative description
-	  of the wire format, and prove the mapping is a complete bit
-	  permutation.
+	  The tests validate whichever codec variant the build selected
+	  against a declarative description of the wire format, and prove
+	  the mapping is a complete bit permutation.
 
 	  Because the codec functions are internal to the driver, the tests
 	  are linked into the snd-reloop-jockey3 module itself rather than
diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index a24674e078a6b..d2f4714dbd8b9 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -5,6 +5,8 @@
  *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/types.h>
 #include <linux/atomic.h>
 #include <linux/module.h>
@@ -1856,7 +1858,35 @@ static struct usb_driver jockey3_driver = {
 	.id_table = jockey3_ids
 };
 
-module_usb_driver(jockey3_driver);
+/*
+ * The codec's bit-spread lookup tables are module-global and unlocked, so they
+ * are built once per module rather than per device.
+ */
+static int __init jockey3_module_init(void)
+{
+	enum ploytec_codec_variant codec_variant = ploytec_initialize_codec();
+
+	switch (codec_variant) {
+	case PLOYTEC_CODEC_PORTABLE:
+		pr_debug("using portable codec\n");
+		break;
+	case PLOYTEC_CODEC_OPTIMIZED_64BIT:
+		pr_debug("using 64-bit optimized codec\n");
+		break;
+	case PLOYTEC_CODEC_OPTIMIZED_32BIT:
+		pr_debug("using 32-bit optimized codec\n");
+		break;
+	}
+
+	return usb_register(&jockey3_driver);
+}
+module_init(jockey3_module_init);
+
+static void __exit jockey3_module_exit(void)
+{
+	usb_deregister(&jockey3_driver);
+}
+module_exit(jockey3_module_exit);
 
 MODULE_AUTHOR("Frank van de Pol <fvdpol@gmail.com>");
 MODULE_DESCRIPTION(CARD_NAME " ALSA Driver");
diff --git a/sound/usb/jockey3/ploytec_codec.c b/sound/usb/jockey3/ploytec_codec.c
index 6cbbc26ac5cac..09e645a6c6d2b 100644
--- a/sound/usb/jockey3/ploytec_codec.c
+++ b/sound/usb/jockey3/ploytec_codec.c
@@ -6,6 +6,7 @@
  *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
  */
 
+#include <linux/unaligned.h>
 #include <linux/string.h>
 #include "ploytec_codec.h"
 
@@ -43,10 +44,15 @@
  * format the functions below implement.
  */
 
+#if IS_ENABLED(CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC)
+
 /*
- * This implementation of the Ploytec codec performs a bit gather/scatter
- * operation with minimal optimization. It mainly serves as a readable
- * definition of the wire format.
+ * The reference implementation of the Ploytec codec performs a bit
+ * gather/scatter operation with minimal optimization. It mainly serves as a
+ * readable definition of the wire format, and as the oracle the optimized
+ * variants below are validated against.
+ *
+ * Selected by CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC.
  */
 
 /**
@@ -133,6 +139,498 @@ static inline void ploytec_decode_s24_3le(u8 *dest, const u8 *src)
 		dest[0x11] |= (((src[0x20 + i] & 0x04) >> 2) << (7 - i));
 	}
 }
+#elif defined(CONFIG_64BIT)
+/**
+ * DOC: Ploytec bit-plane interleaving optimization
+ *
+ * CORE PERFORMANCE PROBLEM:
+ * The Ploytec firmware uses a non-standard "bit-plane" format where bits
+ * from different channels are interleaved into the same byte. The naive
+ * implementation processes data bit-by-bit using heavily nested loops,
+ * causing massive CPU overhead due to serial bit-shifting operations,
+ * branch mispredictions, and an inability to utilize hardware pipelines.
+ *
+ * THE SOLUTION: SWAR (SIMD Within A Register) & INT-MULTIPLIERS
+ * Instead of bit-by-bit iteration, we treat entire 32-bit or 64-bit blocks
+ * of memory as parallel vector lanes inside standard CPU registers. This
+ * completely eliminates loops and branches, reducing operations to a small,
+ * deterministic chain of native processor instructions.
+ *
+ * -------------------------------------------------------------------------
+ * 1. ENCODING MATH: BIT-SPREAD LOOKUP TABLES (LUT)
+ * -------------------------------------------------------------------------
+ * To encode, we must take a single 8-bit channel byte (e.g., b7 b6 b5 ... b0)
+ * and "spread" its bits across an 8-byte destination block so that each bit
+ * lands on bit 0 of 8 separate bytes.
+ *
+ * 64-Bit Implementation:
+ * We use a precomputed 256-entry 64-bit LUT (ploytec_bit_spread). For any
+ * byte value, the table returns a u64 where the bits are perfectly spaced out:
+ * Input Byte:  0b11000000
+ * u64 Return:  0x0000000000000101 (Bit 7 and 6 mapped to byte 0 and 1)
+ *
+ * By loading the spread values of two channels simultaneously, we shift the
+ * second channel by 1 (<< 1) to align its bits to bit position 1, and bitwise
+ * OR them together. This encodes two full channels into an 8-byte frame using
+ * just one lookup and a single 64-bit store.
+ *
+ * 32-Bit Implementation:
+ * A 32-bit register cannot hold 8 spread bytes at once. Thus, the 32-bit
+ * variant splits the input byte into two 4-bit nibbles using two distinct
+ * 32-bit LUTs (high nibble and low nibble). Each lookup fills 4 bytes of
+ * destination memory natively using 32-bit registers, maintaining low
+ * register pressure and avoiding 64-bit arithmetic emulation penalties on
+ * 32-bit architectures (like ARM32/armhf).
+ *
+ * -------------------------------------------------------------------------
+ * 2. DECODING MATH: PARALLEL BIT GATHER VIA MAGIC MULTIPLIERS
+ * -------------------------------------------------------------------------
+ * To decode, we must perform the inverse: extract a specific bit position
+ * from 8 consecutive bytes in memory and pack them back into a single byte.
+ *
+ * 64-Bit Implementation (`pack_bit_plane64`):
+ * 1. Load 8 bytes into a u64 register.
+ * 2. Shift right by the desired bit index and mask with 0x0101010101010101ULL.
+ * This leaves the target bit isolated as bit 0 of every single byte.
+ * 3. Multiply the masked u64 by the magic constant: 0x8040201008040201ULL.
+ *
+ * This multiplication acts as a parallel shift-and-add engine:
+ * Byte 7 is multiplied by 0x01 (shifted << 0)
+ * Byte 6 is multiplied by 0x02 (shifted << 1)
+ * ...
+ * Byte 0 is multiplied by 0x80 (shifted << 7)
+ *
+ * The mathematical properties of this multiplication collapse all 8 isolated
+ * bits perfectly into the most significant byte (the highest 8 bits) of the
+ * u64 register. A final logical shift right (>> 56) extracts the completed
+ * audio byte in a single operation.
+ *
+ * 32-Bit Implementation (`pack_bit_plane32`):
+ * To avoid emulating 64-bit multiplication on a 32-bit CPU, we read two
+ * separate 4-byte halves into native u32 registers. We apply the 32-bit
+ * magic multiplier (0x08040201U) to both halves independently. This collapses
+ * each half into a 4-bit nibble at the top of each register. We then combine
+ * the two resulting nibbles `(high << 4) | low` to form the final byte.
+ *
+ * -------------------------------------------------------------------------
+ * 3. ENDIANNESS & ALIGNMENT MITIGATION
+ * -------------------------------------------------------------------------
+ * All bitwise shifting (`<<`, `>>`) and multiplier math inside CPU registers
+ * is inherently endian-agnostic. However, reading and writing these multi-byte
+ * integers (u32/u64) directly to physical RAM introduces two system hazards:
+ * - Byte Inversion on Big Endian architectures (e.g., MIPS, PowerPC).
+ * - Kernel Alignment Faults (SIGBUS) on alignment-strict processors.
+ *
+ * To ensure safe, architecture-independent execution, all memory interfaces
+ * utilize the kernel's `get_unaligned_le32/64` and `put_unaligned_le32/64`
+ * macros (or user-space memcpy/bswap equivalents).
+ *
+ * On little-endian architectures with unaligned support (x86_64, arm64, armhf),
+ * the compiler optimizes these macros completely out, compiling down to standard,
+ * zero-overhead native instruction loads and stores. On big-endian or strict-
+ * alignment architectures, the macros safely handle arbitrary memory addresses
+ * and emit hardware byte-swaps (`rev`) automatically.
+ *
+ * -------------------------------------------------------------------------
+ * 4. EMPIRICAL PERFORMANCE TESTING
+ * -------------------------------------------------------------------------
+ * Compared to the reference implementation, testing of these optimized
+ * versions showed a significant improvement, justifying the added complexity
+ * from these optimizations. Table shows the relative speed-up and the time
+ * for encoding (4ch) or decoding (6ch) a sample frame on the validation
+ * hardware, measured through the batch API at the batch sizes the driver
+ * actually uses (10 frames per encode call, 8 per decode):
+ *
+ * Architecture	Bit	Encode	Decode		Encode Time	Decode Time
+ *   i386	32	 6.2x	 5.4x		  8.3 ns	 20.7 ns
+ *   x86_64	64	11.0x	 7.8x		  3.7 ns	 11.9 ns
+ *   armhf	32	 3.3x	 4.8x		358.2 ns	762.7 ns
+ *   arm64	64	 6.9x	 6.1x		 13.6 ns	 35.5 ns
+ *
+ * i386 and x86_64 on a Core i5-6500, arm64 on a Raspberry Pi 4B, armhf on a
+ * Raspberry Pi 1B+ (ARMv6). Speed-up is against this same build's portable
+ * reference codec on the same machine, so it is comparable across rows; the
+ * absolute times are not.
+ *
+ * The 64-bit variants gain more than the 32-bit ones because the transpose
+ * works in register-width chunks: a 64-bit word carries twice the bit-plane
+ * of a 32-bit one, so the same frame needs half the operations.
+ */
+
+static u64 ploytec_bit_spread_64[256];
+
+/**
+ * init_ploytec_bit_spread_lut64() - Build the 64-bit bit-spread lookup table
+ *
+ * Precomputes ploytec_bit_spread_64[], mapping each possible input byte to
+ * the 8-byte bit-plane pattern used by ploytec_encode_s24_3le_lut64(). See
+ * the optimization note above for details of the algorithm.
+ */
+static void init_ploytec_bit_spread_lut64(void)
+{
+	for (int b = 0; b < 256; b++) {
+		u64 spread = 0;
+
+		// Extract bit (7 - i) and place it into bit 0 of byte i
+		for (int i = 0; i < 8; i++)
+			spread |= (u64)((b >> (7 - i)) & 1) << (i * 8);
+
+		ploytec_bit_spread_64[b] = spread;
+	}
+}
+
+/**
+ * ploytec_encode_s24_3le_lut64() - Encode 4-channel S24_3LE using the 64-bit LUT bit-spread method
+ * @dest: 48-byte destination buffer
+ * @src: 12-byte source buffer (4 channels * 3 bytes)
+ *
+ * Optimized, CONFIG_64BIT equivalent of ploytec_encode_s24_3le(); produces
+ * identical output. See the bit-plane layout on ploytec_encode_s24_3le()
+ * and the optimization note above for the LUT technique used here.
+ */
+static inline void ploytec_encode_s24_3le_lut64(u8 *dest, const u8 *src)
+{
+	/*
+	 * put_unaligned_le64 safely writes a 64-bit value in Little Endian
+	 * order, even if the target CPU is Big Endian or alignment-strict.
+	 */
+
+	// First 24 bytes: odd channels (ALSA Ch 1 & 3)
+	put_unaligned_le64(ploytec_bit_spread_64[src[2]] |
+			   (ploytec_bit_spread_64[src[8]] << 1), dest + 0);
+	put_unaligned_le64(ploytec_bit_spread_64[src[1]] |
+			   (ploytec_bit_spread_64[src[7]] << 1), dest + 8);
+	put_unaligned_le64(ploytec_bit_spread_64[src[0]] |
+			   (ploytec_bit_spread_64[src[6]] << 1), dest + 16);
+
+	// Second 24 bytes: even channels (ALSA Ch 2 & 4)
+	put_unaligned_le64(ploytec_bit_spread_64[src[5]] |
+			   (ploytec_bit_spread_64[src[11]] << 1), dest + 24);
+	put_unaligned_le64(ploytec_bit_spread_64[src[4]] |
+			   (ploytec_bit_spread_64[src[10]] << 1), dest + 32);
+	put_unaligned_le64(ploytec_bit_spread_64[src[3]] |
+			   (ploytec_bit_spread_64[src[9]] << 1), dest + 40);
+}
+
+/**
+ * pack_bit_plane64() - Gather bit @bit_index of 8 consecutive bytes into one byte
+ * @val: 8 source bytes loaded as a little-endian u64
+ * @bit_index: bit position (0-7) to extract from each source byte
+ *
+ * Return: the gathered byte, using the magic-multiplier technique described
+ * in the optimization note above.
+ */
+static inline u8 pack_bit_plane64(u64 val, int bit_index)
+{
+	// Shift target bit to bit 0 of each byte, then mask it
+	u64 masked = (val >> bit_index) & 0x0101010101010101ULL;
+
+	/*
+	 * Multiplier acts as a parallel shift-and-add, collecting the bits
+	 * into the highest byte of the u64.
+	 */
+	return (u8)((masked * 0x8040201008040201ULL) >> 56);
+}
+
+/**
+ * ploytec_decode_s24_3le_pack64() - Decode a Ploytec frame using the 64-bit magic-multiplier method
+ * @dest: 18-byte destination buffer (6 channels * 3 bytes)
+ * @src: 64-byte source buffer
+ *
+ * Optimized, CONFIG_64BIT equivalent of ploytec_decode_s24_3le(); produces
+ * identical output. See the bit-plane layout on ploytec_decode_s24_3le()
+ * and the optimization note above for the gather technique used here.
+ */
+static inline void ploytec_decode_s24_3le_pack64(u8 *dest, const u8 *src)
+{
+	u64 blocks_0_17_low  = get_unaligned_le64(src + 0x00);
+	u64 blocks_0_17_mid  = get_unaligned_le64(src + 0x08);
+	u64 blocks_0_17_high = get_unaligned_le64(src + 0x10);
+
+	u64 blocks_20_37_low  = get_unaligned_le64(src + 0x20);
+	u64 blocks_20_37_mid  = get_unaligned_le64(src + 0x28);
+	u64 blocks_20_37_high = get_unaligned_le64(src + 0x30);
+
+	// Channel 1 (Bit 0 of bytes 0x00-0x17)
+	dest[0x00] = pack_bit_plane64(blocks_0_17_high, 0);
+	dest[0x01] = pack_bit_plane64(blocks_0_17_mid,  0);
+	dest[0x02] = pack_bit_plane64(blocks_0_17_low,  0);
+
+	// Channel 2 (Bit 0 of bytes 0x20-0x37)
+	dest[0x03] = pack_bit_plane64(blocks_20_37_high, 0);
+	dest[0x04] = pack_bit_plane64(blocks_20_37_mid,  0);
+	dest[0x05] = pack_bit_plane64(blocks_20_37_low,  0);
+
+	// Channel 3 (Bit 1 of bytes 0x00-0x17)
+	dest[0x06] = pack_bit_plane64(blocks_0_17_high, 1);
+	dest[0x07] = pack_bit_plane64(blocks_0_17_mid,  1);
+	dest[0x08] = pack_bit_plane64(blocks_0_17_low,  1);
+
+	// Channel 4 (Bit 1 of bytes 0x20-0x37)
+	dest[0x09] = pack_bit_plane64(blocks_20_37_high, 1);
+	dest[0x0A] = pack_bit_plane64(blocks_20_37_mid,  1);
+	dest[0x0B] = pack_bit_plane64(blocks_20_37_low,  1);
+
+	// Channel 5 (Bit 2 of bytes 0x00-0x17)
+	dest[0x0C] = pack_bit_plane64(blocks_0_17_high, 2);
+	dest[0x0D] = pack_bit_plane64(blocks_0_17_mid,  2);
+	dest[0x0E] = pack_bit_plane64(blocks_0_17_low,  2);
+
+	// Channel 6 (Bit 2 of bytes 0x20-0x37)
+	dest[0x0F] = pack_bit_plane64(blocks_20_37_high, 2);
+	dest[0x10] = pack_bit_plane64(blocks_20_37_mid,  2);
+	dest[0x11] = pack_bit_plane64(blocks_20_37_low,  2);
+}
+
+#else /* optimized codec, 32-bit build */
+static u32 ploytec_bit_spread_32_high[256];
+static u32 ploytec_bit_spread_32_low[256];
+
+/**
+ * init_ploytec_bit_spread_lut32() - Build the 32-bit bit-spread lookup tables
+ *
+ * Precomputes ploytec_bit_spread_32_high[] and ploytec_bit_spread_32_low[],
+ * the 32-bit nibble-split equivalent of init_ploytec_bit_spread_lut64() for
+ * architectures without efficient native 64-bit arithmetic. See the
+ * optimization note above for details.
+ */
+static void init_ploytec_bit_spread_lut32(void)
+{
+	for (int b = 0; b < 256; b++) {
+		u32 high_spread = 0;
+		u32 low_spread  = 0;
+
+		// Process high nibble (bits 7 down to 4) -> maps to bytes 0 to 3
+		for (int i = 0; i < 4; i++)
+			high_spread |= (u32)((b >> (7 - i)) & 1) << (i * 8);
+
+		// Process low nibble (bits 3 down to 0) -> maps to bytes 0 to 3
+		for (int i = 0; i < 4; i++)
+			low_spread  |= (u32)((b >> (3 - i)) & 1) << (i * 8);
+
+		ploytec_bit_spread_32_high[b] = high_spread;
+		ploytec_bit_spread_32_low[b]  = low_spread;
+	}
+}
+
+/**
+ * ploytec_encode_s24_3le_lut32() - Encode 4-channel S24_3LE using the 32-bit LUT bit-spread method
+ * @dest: 48-byte destination buffer
+ * @src: 12-byte source buffer (4 channels * 3 bytes)
+ *
+ * 32-bit equivalent of ploytec_encode_s24_3le_lut64() for architectures
+ * without efficient native 64-bit arithmetic; produces identical output.
+ */
+static inline void ploytec_encode_s24_3le_lut32(u8 *dest, const u8 *src)
+{
+	/*
+	 * put_unaligned_le32 safely writes a 32-bit value in Little Endian
+	 * order, even if the target CPU is Big Endian or alignment-strict.
+	 */
+
+	// First 24 bytes: Odd channels (ALSA Ch 1 [src 0,1,2] & Ch 3 [src 6,7,8])
+	// Block 1: Most Significant Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[2]] |
+			   (ploytec_bit_spread_32_high[src[8]] << 1), dest + 0);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[2]]  |
+			   (ploytec_bit_spread_32_low[src[8]]  << 1), dest + 4);
+
+	// Block 2: Middle Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[1]] |
+			   (ploytec_bit_spread_32_high[src[7]] << 1), dest + 8);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[1]]  |
+			   (ploytec_bit_spread_32_low[src[7]]  << 1), dest + 12);
+
+	// Block 3: Least Significant Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[0]] |
+			   (ploytec_bit_spread_32_high[src[6]] << 1), dest + 16);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[0]]  |
+			   (ploytec_bit_spread_32_low[src[6]]  << 1), dest + 20);
+
+	// Second 24 bytes: Even channels (ALSA Ch 2 [src 3,4,5] & Ch 4 [src 9,10,11])
+	// Block 1: Most Significant Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[5]] |
+			   (ploytec_bit_spread_32_high[src[11]] << 1), dest + 24);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[5]]  |
+			   (ploytec_bit_spread_32_low[src[11]]  << 1), dest + 28);
+
+	// Block 2: Middle Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[4]] |
+			   (ploytec_bit_spread_32_high[src[10]] << 1), dest + 32);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[4]]  |
+			   (ploytec_bit_spread_32_low[src[10]]  << 1), dest + 36);
+
+	// Block 3: Least Significant Bytes
+	put_unaligned_le32(ploytec_bit_spread_32_high[src[3]] |
+			   (ploytec_bit_spread_32_high[src[9]] << 1), dest + 40);
+	put_unaligned_le32(ploytec_bit_spread_32_low[src[3]]  |
+			   (ploytec_bit_spread_32_low[src[9]]  << 1), dest + 44);
+}
+
+/**
+ * pack_bit_plane32() - Gather bit @bit_index of 8 consecutive bytes into one byte
+ * @high_4_bytes: first 4 source bytes of the block, holding the high nibble (bits 7-4)
+ * @low_4_bytes: last 4 source bytes of the block, holding the low nibble (bits 3-0)
+ * @bit_index: bit position (0-7) to extract from each source byte
+ *
+ * Return: the gathered byte, using the magic-multiplier technique described
+ * in the optimization note above.
+ */
+static inline u8 pack_bit_plane32(u32 high_4_bytes, u32 low_4_bytes, int bit_index)
+{
+	// Isolate the targeted bit index across all 4 bytes simultaneously
+	u32 high_masked = (high_4_bytes >> bit_index) & 0x01010101U;
+	u32 low_masked  = (low_4_bytes  >> bit_index) & 0x01010101U;
+
+	// Use 32-bit multiplier to gather bits 0,1,2,3 into the highest byte
+	u8 high_bits = (u8)((high_masked * 0x08040201U) >> 24);
+	u8 low_bits  = (u8)((low_masked  * 0x08040201U) >> 24);
+
+	// Combine the upper 4 bits and lower 4 bits into the single output audio byte
+	return (high_bits << 4) | low_bits;
+}
+
+/**
+ * ploytec_decode_s24_3le_pack32() - Decode a Ploytec frame using the 32-bit magic-multiplier method
+ * @dest: 18-byte destination buffer (6 channels * 3 bytes)
+ * @src: 64-byte source buffer
+ *
+ * 32-bit equivalent of ploytec_decode_s24_3le_pack64() for architectures
+ * without efficient native 64-bit arithmetic; produces identical output.
+ */
+static inline void ploytec_decode_s24_3le_pack32(u8 *dest, const u8 *src)
+{
+	// Pre-load all required 4-byte chunks into native 32-bit registers
+	u32 src_00_high = get_unaligned_le32(src + 0x00);
+	u32 src_04_low  = get_unaligned_le32(src + 0x04);
+	u32 src_08_high = get_unaligned_le32(src + 0x08);
+	u32 src_0C_low  = get_unaligned_le32(src + 0x0C);
+	u32 src_10_high = get_unaligned_le32(src + 0x10);
+	u32 src_14_low  = get_unaligned_le32(src + 0x14);
+
+	u32 src_20_high = get_unaligned_le32(src + 0x20);
+	u32 src_24_low  = get_unaligned_le32(src + 0x24);
+	u32 src_28_high = get_unaligned_le32(src + 0x28);
+	u32 src_2C_low  = get_unaligned_le32(src + 0x2C);
+	u32 src_30_high = get_unaligned_le32(src + 0x30);
+	u32 src_34_low  = get_unaligned_le32(src + 0x34);
+
+	// --- Channel 1: Bit 0 of bytes 0x00-0x17 ---
+	dest[0x00] = pack_bit_plane32(src_10_high, src_14_low, 0);
+	dest[0x01] = pack_bit_plane32(src_08_high, src_0C_low, 0);
+	dest[0x02] = pack_bit_plane32(src_00_high, src_04_low, 0);
+
+	// --- Channel 2: Bit 0 of bytes 0x20-0x37 ---
+	dest[0x03] = pack_bit_plane32(src_30_high, src_34_low, 0);
+	dest[0x04] = pack_bit_plane32(src_28_high, src_2C_low, 0);
+	dest[0x05] = pack_bit_plane32(src_20_high, src_24_low, 0);
+
+	// --- Channel 3: Bit 1 of bytes 0x00-0x17 ---
+	dest[0x06] = pack_bit_plane32(src_10_high, src_14_low, 1);
+	dest[0x07] = pack_bit_plane32(src_08_high, src_0C_low, 1);
+	dest[0x08] = pack_bit_plane32(src_00_high, src_04_low, 1);
+
+	// --- Channel 4: Bit 1 of bytes 0x20-0x37 ---
+	dest[0x09] = pack_bit_plane32(src_30_high, src_34_low, 1);
+	dest[0x0A] = pack_bit_plane32(src_28_high, src_2C_low, 1);
+	dest[0x0B] = pack_bit_plane32(src_20_high, src_24_low, 1);
+
+	// --- Channel 5: Bit 2 of bytes 0x00-0x17 ---
+	dest[0x0C] = pack_bit_plane32(src_10_high, src_14_low, 2);
+	dest[0x0D] = pack_bit_plane32(src_08_high, src_0C_low, 2);
+	dest[0x0E] = pack_bit_plane32(src_00_high, src_04_low, 2);
+
+	// --- Channel 6: Bit 2 of bytes 0x20-0x37 ---
+	dest[0x0F] = pack_bit_plane32(src_30_high, src_34_low, 2);
+	dest[0x10] = pack_bit_plane32(src_28_high, src_2C_low, 2);
+	dest[0x11] = pack_bit_plane32(src_20_high, src_24_low, 2);
+}
+#endif
+
+/*
+ * Bind the build's chosen implementation to a single pair of names, so that
+ * everything below is free of conditional compilation.
+ */
+#if IS_ENABLED(CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC)
+
+static const enum ploytec_codec_variant ploytec_codec_selected =
+	PLOYTEC_CODEC_PORTABLE;
+
+static void ploytec_codec_init_tables(void) { }
+
+static inline void ploytec_encode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_encode_s24_3le(dest, src);
+}
+
+static inline void ploytec_decode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_decode_s24_3le(dest, src);
+}
+
+#elif defined(CONFIG_64BIT)
+
+static const enum ploytec_codec_variant ploytec_codec_selected =
+	PLOYTEC_CODEC_OPTIMIZED_64BIT;
+
+static void ploytec_codec_init_tables(void)
+{
+	init_ploytec_bit_spread_lut64();
+}
+
+static inline void ploytec_encode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_encode_s24_3le_lut64(dest, src);
+}
+
+static inline void ploytec_decode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_decode_s24_3le_pack64(dest, src);
+}
+
+#else
+
+static const enum ploytec_codec_variant ploytec_codec_selected =
+	PLOYTEC_CODEC_OPTIMIZED_32BIT;
+
+static void ploytec_codec_init_tables(void)
+{
+	init_ploytec_bit_spread_lut32();
+}
+
+static inline void ploytec_encode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_encode_s24_3le_lut32(dest, src);
+}
+
+static inline void ploytec_decode_frame(u8 *dest, const u8 *src)
+{
+	ploytec_decode_s24_3le_pack32(dest, src);
+}
+
+#endif
+
+/**
+ * ploytec_initialize_codec() - Initialize the codec's pre-computed lookup tables
+ *
+ * Builds the bit-spread lookup table(s) used by the optimized encoder/decoder.
+ * Must be called before any call to ploytec_encode_batch() or
+ * ploytec_decode_batch(). Only the first call builds them: a later one may run
+ * while URB completions are reading the tables, as the KUnit suite linked into
+ * the module does.
+ *
+ * Return: which codec variant this build selected, for the caller to log.
+ */
+enum ploytec_codec_variant ploytec_initialize_codec(void)
+{
+	static bool initialized;
+
+	if (!initialized) {
+		ploytec_codec_init_tables();
+		initialized = true;
+	}
+	return ploytec_codec_selected;
+}
 
 /**
  * ploytec_encode_batch() - Encode a number of 4-channel S24_3LE to 48-byte Ploytec frames
@@ -143,7 +641,7 @@ static inline void ploytec_decode_s24_3le(u8 *dest, const u8 *src)
 void ploytec_encode_batch(u8 *dest, const u8 *src, const int n_frames)
 {
 	for (int f = 0; f < n_frames; f++) {
-		ploytec_encode_s24_3le(dest, src);
+		ploytec_encode_frame(dest, src);
 		dest += PLOYTEC_PLAYBACK_FRAME_SIZE;
 		src += PLOYTEC_PLAYBACK_PCM_FRAME_SIZE;
 	}
@@ -158,7 +656,7 @@ void ploytec_encode_batch(u8 *dest, const u8 *src, const int n_frames)
 void ploytec_decode_batch(u8 *dest, const u8 *src, const int n_frames)
 {
 	for (int f = 0; f < n_frames; f++) {
-		ploytec_decode_s24_3le(dest, src);
+		ploytec_decode_frame(dest, src);
 		dest += PLOYTEC_CAPTURE_PCM_FRAME_SIZE;
 		src += PLOYTEC_CAPTURE_FRAME_SIZE;
 	}
diff --git a/sound/usb/jockey3/ploytec_codec.h b/sound/usb/jockey3/ploytec_codec.h
index 0ee0d38099bf2..40917f49eae75 100644
--- a/sound/usb/jockey3/ploytec_codec.h
+++ b/sound/usb/jockey3/ploytec_codec.h
@@ -24,7 +24,20 @@
 #define PLOYTEC_CAPTURE_FRAME_SIZE	64
 #define PLOYTEC_CAPTURE_PCM_FRAME_SIZE	18	// 6 channels * 3 bytes
 
+/**
+ * enum ploytec_codec_variant - which encode/decode implementation got selected
+ * @PLOYTEC_CODEC_PORTABLE: portable reference implementation
+ * @PLOYTEC_CODEC_OPTIMIZED_64BIT: lookup-table/bit-packing codec, 64-bit build
+ * @PLOYTEC_CODEC_OPTIMIZED_32BIT: lookup-table/bit-packing codec, 32-bit build
+ */
+enum ploytec_codec_variant {
+	PLOYTEC_CODEC_PORTABLE,
+	PLOYTEC_CODEC_OPTIMIZED_64BIT,
+	PLOYTEC_CODEC_OPTIMIZED_32BIT,
+};
+
 /* batching of the sample processing */
+enum ploytec_codec_variant ploytec_initialize_codec(void);
 void ploytec_encode_batch(u8 *dest, const u8 *src, const int n_frames);
 void ploytec_decode_batch(u8 *dest, const u8 *src, const int n_frames);
 
diff --git a/sound/usb/jockey3/ploytec_codec_kunit.c b/sound/usb/jockey3/ploytec_codec_kunit.c
index 2b7eeb3a1b11b..5ff5daaa3d553 100644
--- a/sound/usb/jockey3/ploytec_codec_kunit.c
+++ b/sound/usb/jockey3/ploytec_codec_kunit.c
@@ -9,13 +9,18 @@
 /**
  * DOC: Proving the Ploytec codec correct
  *
- * ploytec_codec.c implements a bit-scatter/gather algorithm: the conversion
- * between ALSA's S24_3LE frames and the Ploytec bit-plane wire format.
+ * ploytec_codec.c carries three implementations of one bit-scatter/gather
+ * algorithm - a portable reference plus 32-bit and 64-bit SWAR variants that
+ * use magic-multiplier tricks and 256-entry lookup tables. Exactly one is
+ * compiled into any given build, chosen by CONFIG_64BIT and
+ * CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC. The optimized paths are 4-10x
+ * faster and are what every user actually runs, but they are not obviously
+ * correct by inspection.
  *
- * These tests validate it through the public ploytec_encode_batch() /
- * ploytec_decode_batch() entry points. No symbols are exported and the codec
- * is not modified to be testable; the test object is simply linked into the
- * same module.
+ * These tests validate whichever variant the build selected, through the
+ * public ploytec_encode_batch() / ploytec_decode_batch() entry points. No
+ * symbols are exported and the codec is not modified to be testable; the
+ * test object is simply linked into the same module.
  *
  * The strategy is stronger than sampling random inputs:
  *
@@ -36,8 +41,8 @@
  *    checks.
  *
  * 3. Golden vectors generated by an independent Python model of the format
- *    (tests/codec/ploytec_model.py) guard against the codec and the oracle
- *    drifting away from the wire format together.
+ *    (tests/codec/ploytec_model.py) guard against the whole family drifting
+ *    away from the wire format together.
  *
  * Randomized cases use a small seeded xorshift generator rather than the
  * kernel RNG, so every architecture exercises identical data and any failure
@@ -657,9 +662,10 @@ static void ploytec_test_decode_batch_no_overrun(struct kunit *test)
 /* --- Alignment ------------------------------------------------------------ */
 
 /*
- * In the driver the wire buffer happens to be 8-byte aligned, so a codec that
- * assumed alignment would go unnoticed on x86 and only surface as a fault on
- * a strict-alignment architecture. Run every byte offset explicitly.
+ * The optimized codecs reach for 32- and 64-bit words through the unaligned
+ * accessors. In the driver the wire buffer happens to be 8-byte aligned, so a
+ * misuse of those accessors would go unnoticed on x86 and only surface as a
+ * fault on a strict-alignment architecture. Run every byte offset explicitly.
  */
 static void ploytec_test_encode_unaligned_buffers(struct kunit *test)
 {
@@ -819,8 +825,42 @@ static void ploytec_test_decode_ignores_unused_bits(struct kunit *test)
 	}
 }
 
+/* --- Build wiring --------------------------------------------------------- */
+
+/*
+ * The three implementations are chosen by a preprocessor chain, and getting
+ * that chain wrong silently selects the wrong codec. That is not theoretical:
+ * the out-of-tree user-space harness built the 32-bit variant on x86_64 for
+ * months because CONFIG_64BIT was not defined in its build.
+ */
+static void ploytec_test_codec_variant_matches_build(struct kunit *test)
+{
+	enum ploytec_codec_variant variant = ploytec_initialize_codec();
+
+	if (IS_ENABLED(CONFIG_SND_USB_JOCKEY3_REFERENCE_CODEC))
+		KUNIT_EXPECT_EQ_MSG(test, variant, PLOYTEC_CODEC_PORTABLE,
+				    "REFERENCE_CODEC is set but the portable codec was not selected");
+	else if (IS_ENABLED(CONFIG_64BIT))
+		KUNIT_EXPECT_EQ_MSG(test, variant, PLOYTEC_CODEC_OPTIMIZED_64BIT,
+				    "64-bit build did not select the 64-bit codec");
+	else
+		KUNIT_EXPECT_EQ_MSG(test, variant, PLOYTEC_CODEC_OPTIMIZED_32BIT,
+				    "32-bit build did not select the 32-bit codec");
+}
+
 /* --- Suite ---------------------------------------------------------------- */
 
+static int ploytec_codec_suite_init(struct kunit_suite *suite)
+{
+	/*
+	 * The lookup tables the optimized codecs need. module_init() has
+	 * normally built them already, and then this does nothing.
+	 */
+	ploytec_initialize_codec();
+
+	return 0;
+}
+
 static struct kunit_case ploytec_codec_test_cases[] = {
 	KUNIT_CASE_PARAM(ploytec_test_encode_known_vectors,
 			 ploytec_encode_vector_gen_params),
@@ -844,11 +884,13 @@ static struct kunit_case ploytec_codec_test_cases[] = {
 	KUNIT_CASE(ploytec_test_encode_reserved_bits_clear),
 	KUNIT_CASE(ploytec_test_decode_ignores_unused_bytes),
 	KUNIT_CASE(ploytec_test_decode_ignores_unused_bits),
+	KUNIT_CASE(ploytec_test_codec_variant_matches_build),
 	{},
 };
 
 static struct kunit_suite ploytec_codec_suite = {
 	.name = "ploytec-codec",
+	.suite_init = ploytec_codec_suite_init,
 	.test_cases = ploytec_codec_test_cases,
 };
 
-- 
2.47.3

