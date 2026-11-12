Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461744;
	b=OU0WIAwG8DUPbT1vzgMdQyOgrwC0ip2IsS1ak9jcb1oovmR27yycIuDxz4Bd7TVrYHXJ
	 HNOTUv7loMpLxuJMe6mXf2W4OslWJ62ICq8SAEjKB1UndzMpZs24Zvi+cZSBULVuAsIG+
	 hzMsAQJsPvQv79eKntIVcoKDLvNP36SUvs5ZHomguUzgqKx4SXSpWqyeSOK2wvgAVO0aQ
	 HDjIwSdkopDx5mAob8KC2xCnsgfqVxrBVQ0+HhK306qgcMKHtNpCi24t0F38qqoazCbbR
	 3ItLwpnB5H0QsMZDfwn4TkAQvCOApkf+bWd9mdFbTtAuTEbJ6mrztN6uLwDHtWKcwGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
	b=AItFE5qR5JnpFbu30uuJtJIWxpolbrlUTIlRE5ljnJiiXMGLsaNnibt08YYJAq9nR5he
	 nfKheXdTidJsBmi77H8WXGUHXZEW9m4vWhBMqjQZuUiRtaDDiPfccFJFRDJVi/YKY536B
	 9pMFxL+NTqdsXcwiO3BJ3Z2L0W3xTpX4qSpSoF4tG3Vgi/doJRG/9P/44ywwCadYhRfJ8
	 mN7OSwZjw7U8UBA8g2DAEb0wJcwFIsJy1NSgd6vQT+Z3kGXKdl2Uey0MozG6Tq4oQqNAj
	 n1FebhX1t9TGAuHnUAF5UkMwx6TkBUH1NfYG18+5T+X3f37lbEwlX/XMni251BozSKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI71k+eM;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE760A5BDF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71AE760A5BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI71k+eM
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37600b0db49so464426eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461744; x=1795066544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=MI71k+eM3ppResq9Xo0lTysQlbFLkiHjd0MdFs9jwrlpXvl4AMVageRhU03PWDXUbk
         KVPqQ1yb/ZQc0tZww+dJ7COBA+mH5uJDHwTBlNkQun5NJ0CjzkvwFrhBaflMJmTT67WO
         F93cLN1yoz0fbWiQ3ifCi3GxLI9dm+fewPaG0lgy4UHLPFtI6CaQwP70+5tDuEqt2lKr
         hQOPIegB0KT956+QNCOyim+cc5vN5jUwzEsJRNv02VcCF2ohqZEpG5cnFy0YDC/eGCSl
         Gy6EINR8rWjUyesEuFXesBa734+TYLrSVsBi80/4Z7vxwhqpcbqr3kASKu8VaNuWDJZl
         8k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461744; x=1795066544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=Xw8Vw5udiEFpOjJeP/PqtPKDkadTX/8b0WMS4TSlTHqv90CI4d5cidhk7HJlofGtpl
         dph8h4aQRCa6lpcaRMTHfa5R3bbI4UnAg9mMZUHD4iWmFaDDiicHAnWjoD5fxBcizJPr
         XS9Uffnvrl54a10apOkqnaY0qiLyZK4ydgYh0l9dWosXzjw6Xr4Omgoq1DgRc8FMdC+u
         O5nkUlGIe1LC/gQ6NOQPXu5QRyKXoQyrz8DkzmCS0IucwGqruxuHCvmj+4F7pYJUEfkG
         SMpqU8Y2RuVX9SQRUIO8CcR1R3U/v2iGqYDb5MqB7BCtqaEs/zr/PD/9WwtmEaVTDYJg
         nX/g==
X-Forwarded-Encrypted: i=1; AL+hErHrCBlCVbSqTrt4U0KVmTcUklZiCWA6nnuytJThY77AnXNkBZBcSyxfODtxXNWtHWIIL0k38166wOb70hA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HZtSi8LIl1GHePK+HajKfUz2Q709RAD0lS2ljUVgWPaWs432v
	uNNxSQFG1KozQtsKzZaxL0NdlV40fxSfyFsLow1Us47oUTUtmSB/yBUn
X-Gm-Gg: AYBFou30YNnHgnpPgHlY5GgO3yIF924tSmwFjarZfPaPHeg6MKnntX2ACAsnxKwQCq5
	mcTcCSsUpqXIcLZAcpQGIJXOm+W54uK2OQOJbuzGGUWeniAuvktmTx+nLu5jR6t1IfbfkhP3TGs
	Hy401rDejmvCeeXvywYXJ5p9sdW+Ox36u1sDUKl1yEOf0RE7ynGtKyRTSyhoC5cSVgAWT2CoUC+
	TnSZowy+qHNXOPuoFo0sCwfZJs2Nkw1eZWY5qnMl5I9MW8St/cZlinmrKUkbWC2TwKJNRftAYcx
	j5w84HZIPE8K/sHxK1RZXFSiPULBK4xf6/ywvhfGBL8FvmzipotGGyP1uSWybf0PqGvxMRftaEF
	h7cgOPljjGGlfoKLztkhBwvTvsoDWfeGp5TyHvITLueFzirB5+hlwiTCAhmiawFQWoz2G3D2nZa
	FSsEvyIqY+/DsDkNMbgNqu3bReJ1aPr0i1P9lp0A37LgpII4a5lzcyC4g8Knjwx4sMsKkUT7fqG
	dhA4tlYG8fAxbQanI1gRA1B/RKawFCl9atnR39ZfI2RG1sUAifirwSloIDAmD3d7k1GK64x0FMa
	Ajlqtp3UbEJ+MqCG4L66LrJhxUdNSC3eCd3bfVCUkM0Jaeij2St71GbS91SJ54KrqS5Jz6SSXZA
	ChxqF1DfE8nQHmPTQs4bpaajLyDrybXmQBA/ZAtD1uCP7yPAF
X-Received: by 2002:a05:701b:4594:10b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b4f5f1f344mr1354843c88.4.1794461743623;
        Wed, 11 Nov 2026 21:35:43 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:43 -0800 (PST)
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
Subject: [PATCH v29 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 14:34:43 +0900
Message-ID: <20261112053446.73504-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
 
