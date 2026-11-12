Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444480;
	b=0UwqwdjxsqLilh6ZScINNOSu7zvWmMtLuMZVAByz6b/m42wLkde9oG8oWVDJTU9Oh8ft
	 +z3xNNHOOTR6MEz3jEeuvv0I4ZuPZ1bl7t/IhMZHredXbbak5xakUlAHq5+UGLyHXBH+I
	 xQTTNJyhRjAaCnUY9LpR8AlJLXMhswv6aO4O2mQBa58cpdoO2B6q5pQdty95f1l5bvDac
	 t3JCEOoWRR2mifEMNUHRBiqGt7QS2tz85Wr90LT9HvLH335NOEqZw/UY6v2d5ppxIvndR
	 KKaaCMDWM5516z3ZaAoDA/hZ3Di32s8XcqLY/LQ8MUQ4xh9Mie5EKHObL8e3DQHogpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
	b=SEXvsSzcQPi1kSSf+K+cevrGN3ywpbVx/2/7sFvNV7jaknN0Yy8vL2g7KHhj3+WP8CxS
	 Foee4RWnohTAz0zcJREmm+ITxaU0P5+ZCDN9i15C1CcacYSPMoudmuJ6BjRZ+7zHgcd+3
	 oew+fOqa7iphhdBbDs+7xVg1v69gWtxZF7pmRMJ5rSi/yjJfbs/oBjkd45hib0ZRtuaPS
	 BwAvsQLhIi8umPr2fUbhcH+WMGlcSf+XUMWg5SgucWGBxIjgg4JyOEG6Elo7RhtK4aQld
	 n7a2pm0+eXeDJ9etR3UtMmzKYQz4SpvmJmLNoAcpY/2xxYNnxPhy1CP/e+p1nh7f7/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+VXBbty;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022DA606C751
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 022DA606C751
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+VXBbty
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3ada81853so3432720c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444479; x=1795049279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=Y+VXBbtyba/o8p17YNdkkSV9mEM1J75oGmZwRUmbkNWoxRQ7YByN/2aYFI+8jR+xQR
         IMdXfrShXu3ta3fyVguDAHQWC+9mWfmvmQvSWYTedf4cy3p5755K/2Gg8p7k16Ny7IB4
         axrZWUbiPfIGcg/wF8SHM1QkzwYapNYjLF4CQZO7d0lYZk+M474XHT0cnmXB55VTTKOb
         KRFtrUUYVRpMswA04/Mm9rAyJiVnMf7Jktl517EZNwixDFEi4frZ6sS+QK8ny77NaU+1
         YM6hK6f8zeYcvXiN95UZGd0+6QCG2ady1rkfuUdjaZGvOKbZU0CNQPV6tEPNA4gtXkiq
         obHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444479; x=1795049279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=CFm/cJnrTlmf+qL86ILEvMgjVnX899hjw21BRbsAVwGGurO4tMTOwO90tFgV5x2vaV
         gQMLPgY+2gQxKegv4kDMaXb8grdzjaGVITtto0SQkUTvEoMtWIAgEE3uUUfchLV79uYe
         ltkvaY8kRYDtWrOjHDfEhMNhj8G4vPn0wnxyXpgJkM/sBy2Vu132JcTYtyWyCnqxGi0a
         Sv2O/91K/3cayG6BWh0Rn4rBxrhRmuTDKzgRsNc0v6kF0athQrKHDxmbXR5THTbW6f03
         eMMPsv7dFSkA89Cjiop8K/NaUUq1aybbu0bNdRs3phfjv7WPJHr+TEDSWKYLdcvpqvvD
         eu3w==
X-Forwarded-Encrypted: i=1; AL+hErEeydpgL4mrdBogL4cYLHqGgPY4lsz4lXEOAxfkPg7wqN2R8Ytdh9sUAYaaW+yBJh5ZqOjNmiwlaDv9wXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ojlpK7JzjwJ4W017VzxmZ7XczaOrqB7xBrU4d9qPzoE45TU9s
	DbK2zrVtqidyHylZTtYUc7zdSJs1C1Ke4eNdiZ/hkLGJisi3jhhE3o7q
X-Gm-Gg: AYBFou23k9IwhQNweWrKQRMnC4DT6cY8RmvfsKzz0E7Nn7wW/o7DJo4ihrSU04TtYyh
	wl99h3hfJnVGOgR3DCz/O5pEvansTPikCYZa7LhoGNodhi1SSf0M+ZAFoBSApCHAu5u6BXJcFYZ
	VuSWO76ALIdeFKe00N1cks+0GT3/O5+OIK2TD2Z7Wi1+RQCb8UN9yQS3ibVM0TgeGGiUiibQu+B
	etLx7jnsKnQxgT7V/WmeAa+t4vDxFTSnYSb2I0pXTRC52ISgM85v46WmYQb5bNZfumU2XcaS96F
	gH7pxLtYD+rC9dFnJSXk2pw154NAHEJuaYC+XpZMhR9YUK1rn4ULszi1B4uVQ8Yj2wSYfZ0+omC
	s7hr0Wd6vYWAMja/UcnHaIW9x/IkkvDrwci5LzmLLAC1kkWnPLw19xuxqbu2yeUb1c7yeCLYXCI
	J7W0XLD/5h8kJ7DLFdOD6k+2D0NFEs7mc3hQwHkom20lu9A3woTfI2kpDdRVA6dmnBO+H+8ufOu
	J3eHUE0W98pBUe6od/kQEq4fh/ASwzbGdCgY2e8/B7Dk0bSRnXrFnTI+GKxo8DdHUvkUezbunj/
	kUnHcN2YMhapJHRf7o9538P0CXFfyg/XJ3qrIgU1H/RJqRaTfMO/xKKDo6aSbI9Z7U58bW0ZB22
	+aEt+Szt2SrBXnxV1jld0LJKavQegjPBqerjPf2yfyw32QWQ=
X-Received: by 2002:a05:701b:2906:b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1b3c02f039amr3321754c88.10.1794444479106;
        Wed, 11 Nov 2026 16:47:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:58 -0800 (PST)
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
Subject: [PATCH v27 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 09:47:01 +0900
Message-ID: <20261112004704.49758-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
 
