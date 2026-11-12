Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464745;
	b=e8q1CeuiSa5T2x60P7xoEPPcmyndKDDLnAf7yBg3T65OSs5//3CkNu7KfVoBnJZ3b3X7
	 hfLyc/iL+mXuCinOzjr7+q+mCWRiBoLObKSAK1Vn9YODK1hv+GNf7laByloDr7gHmmZ/9
	 kR5ZByPzA56gM/kEggPXvQm700AmFhxTOJJ8SbiZzVrLi5TpbS9A9dKZyg2p6OCKqmmMH
	 Vrj6elpzC1gHMtWXG/gabFjfnu3UxdiImIuaEgFU0yvh7VbcvMGKXyY5r8em6bSVQcGuX
	 GSXG267AB32l42X1SpiXlldYVuNhd3e3o3/gLLijNFGqgg6NqNhKmSxvS0w21uToang==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
	b=Lzsmke+sLKhw6TCv1VxJ8KWxdQnNYAeZWVZy3nuARM3Pv4IRx2fmaif0hVQB4fJyzagC
	 Fr24w0s4mwg9iSB2u/rCFis7OsaRF+9itKFTDQ/O1moxxx3Pf13bXjD2k2U2hPIbgrQN3
	 en6jGW5B/r0s3rkPn0QyxcTUt/dk/din1q4twNskq7tAZXZdOsh1PYEQWsWtL3P5HIA0v
	 9XSyREVyibCuB845VmlS7kGqTmLDA1i1kxnnbhlnYIXNBEQ5R9TasqnG+efpVSRzc4Iv7
	 lS8HoP3Ci8PlIRyjvoqLZx+cmTcO9Rtb+LkgH7YGYIHFEQD5tEXpz1esyLnC803/fTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0i9dAnR;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2F606A8BF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A2F606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0i9dAnR
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed39646f04so14941315ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464745; x=1795069545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=L0i9dAnRgazDCgzsUw3wag7LfQajhuRXi1oSRHF6TrgV+FgKun7WTS3uleT3Mwbgk3
         vEU6aJmTrJrJFOl5jg+xoY9M2oXNlUWFV7G9t2opD539Uva3l7O3MJxHFDy378ymuwG0
         bYBEBB4lzUMwoH19l0fr/EN0pwT0v5r5p0dt9l8+Yjw2tyY4iJ7ZruJde0nKpEDa76kr
         CR9njefMrzpC2pu7w21vHt7wloPeiPtMtkJaxRYWM9LeDy8Vdteswf5ZZADm0+7ugZJG
         G1SVv0qatkf0Mj/MUZWLqcp7HsLrCqJDjUiu1wO9Ldu49rEOirx7thp5L13BJ3zc3YeA
         nxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464745; x=1795069545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=CNgaC4xkCkQCJ1XQAAlMAkNFOarX8Env26N0GAiTlfWLnNNNSdbyEq12hPyfRpcruO
         BsVcTttRKnhMmZomzszSsTGuD9urUz40kodbJNzdOTr0MxV2sAo1lwEM8elssCydgtF2
         kdr9irLdVdtSR8k2ojvftas1NVQHX7C5/23EiEhAol5tcoSPyTXne94Fggfg6GRC6CKF
         EFCiXw/iXY9DhSA+twkrm7ypIHuJbON2JgAgBY4nBFWc2VV3Ik/IOQ0gs7RacszgUQAs
         n+BRFgpxXpG+ogZGSriAHg2ZX8I67a9IvpXcQBrEQ3uRmhFH0ephuNUTBPiQSYbgwBGL
         GEAA==
X-Forwarded-Encrypted: i=1; AL+hErHKesMg11g4jpd3zqsTFkkxC4KBz3KEtmNpfCelg7hiuOYjqUXjyQKWtC+G4xwpb7IQAT7vVpIqc0h/BpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lkzZiaS7d5C5+tjZC62jXWTW0Xz1hNIdItvaRvvqwjmqP3sq9
	JtstdJWsdnAtzzZgmGQH3tXvUPv5Kk0o4CAqM06m6AoKueiFgXvT3JLx
X-Gm-Gg: AYBFou0+NnsGLrsnux0nTITsfSnXcyRmIY2+pg6RzdMPdjSAYbb8LXQvmQLr0YnjC00
	mxnh/mQe1HCMjrQFNFa7L2oKH+MjiApacVya6AkJ68DooUOoFIP/vhY+LGlQHc24aQI025R4ebP
	bY47obo6eu/wmM2kDphhu+3xIxlkaRFYDieMrZ5oVPcCeoGmU83yJ0RGlHPdLxO+X+zsoiVRff+
	7wkiy6bOga6UVAOFMBo4GLUlVk+JmDgR8BGeX/ir3RyPb/+Mj8vzJ5dbxuJnqektkwxb+0ikPfH
	t4wI3wWexk8F/xwmeUtuZcEOT7wRQaggB7syhawxFTL4dMACduFoArBVwNPZZIKL0gl2VXlMZgs
	ecEIaKX4oKIotEFhBBlhhJyFmeDY/u3xfVcRA6/m4hfb2FNt6ik6IMUciuToNi1+QQLa2j+B1Mt
	K+e52gr21ZAZJ2ditCzZspMdWGFGTyoa5m4956JJYykiGGJDxKdtLIifCRS9zfYwUIbOI94208C
	faNWzSorp2ivakTAeN3t9ph1CG5RVLQURzxdEbiyDZQkAoWNc41v616ZlVm4k9ifkiWu+lqzA3N
	2tb2aZ3JUThYxJNgrfM3k0NarSOU6AZHuToycV4ELIz9MhpwgxR2kiJEh3mVT4jW2KLWGAKCEjz
	8mDNKajeNrkU0M2/BSIJtqaAbh0q8fiU91hZFAa/Wgtfoxso=
X-Received: by 2002:a17:903:acf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2edd770a9e5mr49212615ad.19.1794464744712;
        Wed, 11 Nov 2026 22:25:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:44 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v30 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 15:24:43 +0900
Message-ID: <20261112062446.159-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

Document request-owned capture in the ALSA configuration guide. Describe
`capture_packed_status` as default-off, reading a packed trailer after
returned data while the fixed status scatterlist remains the default.
Describe default-off `capture_pause_restart`: pause uses STOP and
RELEASE, then resume uses PREPARE and START; disabled mode uses STOP and
START while retaining the prepared stream.

Note that on MMU systems request buffers are vmalloc-backed and
page-rounded individually. They remain allocated from hw_params through
hw_free, and capture data is copied into the ALSA ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   14 +++++++++++++
 Documentation/sound/alsa-configuration.rst      |   25 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,20 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send PREPARE and START. If disabled, pause uses
+			STOP and START while retaining the prepared stream.
+			Format: <bool>
+			Default: false.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2537,6 +2537,31 @@
 
 This module supports multiple cards.
 
+Module virtio-snd
+-----------------
+
+Virtio-sound capture receives data into a separate request buffer for each
+PCM period. The driver validates the responses and appends frame-aligned audio
+to the ALSA ring in request order. Valid short responses are retained. Empty
+responses are accepted only during bounded startup or for requests already in
+flight at STOP or PAUSE.
+
+capture_packed_status
+    Read an explicitly enabled packed status trailer after returned capture
+    data. The fixed status scatterlist is used by default.
+    (default = false)
+
+capture_pause_restart
+    Stop and release capture on pause. Resume with PREPARE and START. When
+    disabled, pause uses STOP and START while retaining the prepared stream.
+    (default = false)
+
+On MMU systems, the request buffers are vmalloc-backed and page-rounded
+individually. Allocator rounding can make total additional memory exceed the
+ALSA ring size, especially with small periods. The request buffers remain
+allocated from hw_params until hw_free.
+Captured audio is copied from each request buffer into the ALSA ring.
+
 Module snd-virtuoso
 -------------------
 
