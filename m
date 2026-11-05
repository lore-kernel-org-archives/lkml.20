Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862576;
	b=34dHi3esbS9s9w4kgxyrJppZ4Y0TPzXqkrXIoAKpBQilPBVNHP9WWRbZ6kXj/dNi/B4E
	 7sl8ImMeGqWx7Q2snxv0gVQu09kt8N+p7ASGdUnTALHw8NX0n3dVcmx0XFPMl4oYwkVVp
	 YeWrlWIuM2bWx1YHChG0omX8/Q2CUbFO9vauCYpdMNU3sd6WtJHPADbXMgsC+ynzccf28
	 WrkHdi/HAjdW6KdXoXa+8SJYkqKNWehgTbPSM+49bpa1Nmk1Pd4kyy+WJmhBHA7Bz5l3X
	 O+iBCm5MjfbjGisaEc+y5HHHHPOVXEO5CAtN7hDBi9aaAeluinQlE/uK0a9t4d2ME8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=2ulipRLf3t4MA0lOUqc0Rsv0/X4jkCd1iFjxrWn1fcPcnFdjNEZo2VObIexgohHCrP37
	 fqJK9O7DmZzd53zSEeo0vaLq9R3mviUUruHZa3PEvRMfNdY7w11rcD4uHIVN7VkXJ1VBt
	 bvZoeeeajsiZphckDxZuhW1owLbxukWxK0t/dduQIGiejnPwSbFCiUb5g5lkUdsGPPyxX
	 h31cyW524eusjf7ZZeZ3EXyyAFeS+N0N4kZGPl2hlwkHLfUA1CjXOoWBTdn6QkH+QAlbO
	 FdO1ead65iOzxbYKrf0yQyeBfV8kZ/Au7mIMffwrrxcYMHDlJdn1i6YfH/+O75C3ijA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiLL7rug;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACEB606EE9B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACEB606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiLL7rug
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so2050103eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862575; x=1794467375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=oiLL7rugBCu6/0+7veAcixdoVtJ8+dAaB0jZJzRuCWtcEAPPSjYnfxnEzQ8gsNHgmB
         LPMSs3udVmjZERUq/VzByNWXLljwOB1vQrmh2xLniv9yIVdZAebzRizSfgRVUJ46XqYV
         6aeo+d1hXqwCi0LruTYRGL32tLAoCQJqpZNv3jFPAsFXGjA7pJq9YFxfS3m0fk2yTRpx
         hamAOQxmK5H8FaKrMjR06/FHvZbYyN3cZz2hd5XBSYHlwWRMxHOXiwoHzsNDa1AOP6Yr
         xlPqMHdqcPnvohGQEhaqFr6YmBpEm50z+LOyYoPk080MbW9bhWbmnLSjG7hv4HHmWPXk
         QvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862575; x=1794467375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=e/G4XzTRxJXVTeKWvu9Cz0W4hUin/tWbHvAyCFhGoCzT1DiNt+vc464cL7emskykG9
         bNjZDWrMfN4KXoJQFCa1cD1rE9HcnRFYLP7YkjGgPdcX3rojSy4idsvGYG7ZSqIyfXDY
         4YbP+MLYFZIu5cxwWOeYiu5giqXfmepumMPeR26dP2OigNejTGOAwJtBBZYzg2CWO+1E
         hcqvpZ4/7BcgCM0+k29Ba04Y8VuJZmgFNUwP1F7nJW7FKcZH09uIo55EBUgBvWBC7g11
         RyuDa93nV5fDGSnEzcscLJijRMuEYGP4r7Q6I/rnf+cjbmX6RfMNrupj7FBZ4pKgZQFV
         gfUQ==
X-Forwarded-Encrypted: i=1; AKwUvByekFQLZYPtevxEbEPkJCRRlO/ZwGAgoVNfU4B/UDt8C6e0bqpxQSeDQnCFnpbkZOwHRSSbZqFIRWZ1mhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4qYjk2qVfFlTo8qZ2c8q15DcbNL+TvbO0wuDxt6C4pgk0o/gw
	EwGV7wAwKGZ7uGFMvRsvnNT1Yh1fIqgxrdb3fI7ff9ntx+pyuXk79xH77/KjdQ==
X-Gm-Gg: AYBFou2V1PtE4+6hqVTAZNs6yZDa9D4vBPiXaQImNP161FYdweqSZPj9YjDGaVZw9kC
	4UofEg3Kv7g6MS4Q9DEbMGoJGwWdXsZkMs2ks4bRb7/DaScGVdIvfkPpEjdfj5e17peUgog6VRm
	fMIvvevYgXU5OhFR6a3HZFQcSPUQxBu6GG/7DXXvHeqFBlhBrmz7l48XzNuZnq6pxYy+jt9jhYl
	CNp07jPsxlgoS03A90ltx+YB0ou3frxWbOSgkLQvdnqf/zlzxL7blBb4CDRmBG07XsSFzwwd/wa
	XZ0IzWebMmsnLtg5UxYT9HwIietOpi1KbEl3zsOJM0oVzlgg4yw1uPIVvfwHEjBt7myZkW2NOVv
	N9reL7YPV5W5pcpx0nCwLGwykSwNW0e6QBfgK7fD2ZRiXGmq3JTw/81pcF8kZ3cXigfv2HtzBH4
	jzCZwipCODnbX2kS4PcLPZ8MX6xQytIQuXjcL8N/PEL24u6SDM7eo8jlM/KopDpVCfVtkwWFrsx
	TFcgiAMCBRmK3X4PRfc3nAkvLfgp78nGcSV0lwiBZzewhYm/9NRPfy9MZlRgFILO8eFteFBNf6M
	3SqIi8G1RdT6dCc+YosIhb1lA79/CTUpWTN0xdL9fQkUfZzpQfZm0+UbBGsri7Fc1HcGKtF3e/w
	b+sTTUHwfNwC+csxXBEol3lcLIGyaZr20zOr8dUC0+kdob8M=
X-Received: by 2002:a05:7300:d80c:b0:36b:c491:93dd with SMTP id 5a478bee46e88-36bc491a788mr11101969eec.18.1793862574798;
        Wed, 04 Nov 2026 23:09:34 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:34 -0800 (PST)
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
Subject: [PATCH v17 12/12] docs: describe virtio-sound capture options
Date: Thu,  5 Nov 2026 16:08:45 +0900
Message-ID: <20261105070845.6449-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State
that capture_allow_empty, capture_allow_short, capture_packed_status and
capture_pause_restart require capture_staging, and use the ALSA kernel
parameter restriction tag for each entry.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,35 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,ALSA]
+			Retry a bounded number of empty startup capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,ALSA]
+			Accept non-empty, frame-aligned short capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read status immediately after the returned capture data
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Release and reprepare capture streams across pause when
+			virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_staging= [HW,ALSA]
+			Enable staged capture using request-owned buffers.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
