Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201427;
	b=0ltY2ct3Rs0hCnSehrrm/rFo1NlSmOO5V6TLoxElktvInkhytQTdf98TsqqZKCrixhHq
	 ugl7tvrK25RiRp5saW2selh6p8oNbfL2t+t2ckLHWjgUAKzS9Xa3s2KlZs8urizjUVPba
	 CECW79CQJjxr6RLpyN1X/4brmND//LdBh5VO6lnvORINq1hkkhqlg2JviCqMnWYwczzYe
	 w5be2jIuB6w2XTJDNAZUpC/9M+kWRqOSk/JcVmBQ0hJ0+AarDqutfHCJ4ks1YCtLKZYp5
	 62MR7rp0QEP++UcFLQMgkOO79ohpGdk17CY17LmIwiDbfByqScLMquCMLre2QExFfmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
	b=IGTkNl33I6UgDrmWjUGzUU3tQrcBtqwczBXfx6Wt4oOw2c13p2j/Y2WQu8dGksWLnkiQ
	 QqTLb2GMp0tEJNzG+6DD3TmVEsezfSyFqRVESRm0IbRluf+vVEvgQWCkIu8Hm6Qd1VsfH
	 +ny6xfdSB0Muq2T99lZfVu8SqMO8+90GRsyI7YJ9qLkc8JPUtxMg+9VzXEhEQT6a7A3QF
	 JM+JK6PjekCPPjazCqh5aPshwO0b+EYwjUfXZscrhBOqHj9c8UmkJZgBDqx40eVCZxhBb
	 MsGA1xEZHlHvbs0h+P4LXE8ydRBBtwq5dUgqkIrowl1MFu1n5khKSwB4WUXgvkuBhHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3mJ4x6C;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B5606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB8B5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3mJ4x6C
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b244fb7fffso504835c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201426; x=1794806226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=Q3mJ4x6CjdPXUqcwGtNivubyVSmg0gI6mNHS61Xaf+FJtWlwyOR1mF8ViLoNIn2fHG
         gI+u4EJvkIQkEKewtbLLRN4bm0TvXNVGfyeMN6KknSXPFiJLSjjxXKcsJgm3K6jD3FkW
         Q0kdtQgqdSLOZYH9L2Vm/P3oALgDvR9Nu2eBjd7J/BC4rEH/kEqngubWPvt+KP9ZaaSr
         ck3lYR9SSgO3VRTBxXBZGO4ZItghIDgI3zpwjuGb3K7TIompqNWa1thbgdduyBvFOhjO
         OOdFAVZrwUCRhtC3JrGfcIQAnB3/CaimeRfL8bbNxIhOBZFrLRKSU7TNkYxhh7mWFhTz
         sE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201426; x=1794806226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=POBe1TWwbAzezT6/hXieywONTXFecFJ6CF/zx4eGUiqAlqU6XRoBdPMp9IGmpvlhYm
         4USlk+5mkCe8p0dzxFh60L2YXqFZd8Km2cAbR9TJSZhkN+Gs5+HWqTLVnSwg6/q6lLti
         XW4A1MjdTH+8b68+awUXjJQY44ixRNtTQEJwQ4WU68tEW0kH6VXngLmMjqjikkJnDZKp
         nnA5uNjG5McWfNwZfUd8nSpKHpMMUz8+coieuVLdVMreLCBaLO4GvlJlcnBQwlZzy38c
         4hZglNUqPKe37oeqAmqBl625yR2jfjTFQvUQuPMrnlpjaTeH256lmg2oQCVKR8OKsW/4
         vVJA==
X-Forwarded-Encrypted: i=1; AL+hErHmZT1yTvVlqwDXj6c9Heo4EuPcbf9jip/0ptBTxNDQm2E9NmBFWYmPSvxBpXqv6IyI1HAdmUydZkWtARo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z8V628qnFvjqunZB8ft3vRGTs6OEp9LKqkRJunuQLy7Z7aO+H
	WNsaM5MHgtMJTNonGYO4xqDLIdmKXk4JNeQwbo08RooFOfqPhP2dnYof
X-Gm-Gg: AYBFou0Z4fh2fPylsGCFFJZxQkfnMb3Ke1I0ZggmOX5aaeANhSpuYm0D5/lC1wEW/7T
	62bVS103GTTCMs0XYWYagKAxdN6XXuOmHRV2DAaqmuZZvzmsNeg9sEjIiFKn+tqF3pEuYzuhd+o
	GqxBSyNXJ/1ZqKBjKn0dVE7Cg0TGNO9ogNzTakJdNbbDILZrPHc5Kih/laqqA4yD27CGWVqHU7G
	nIN5fzbgzijRkr6zewRjiPHoz+1GieB0ERdE5IwtMTtUSZSiwzuvZBxErC7/ifnWy1lFJljWFgK
	821aQannY0It8rX3jz+ahmflawCQmfzZw8bYPsNpG9xWLCAFW0r1Hj1Vd4UUzZFlqzF0ts3rneF
	6thrhjAm07NqUPzkeYBvirWnxR2N1K6sF/yADOm0nR92hzZUxOv/uayDeZcCiCm0+P6gBdmQOC5
	7xKnrJqX1TxEjNPv3Mk0cjVyluyfninONnSapJ9iKLlNLg4dZNmOID1T3LtnzZ7HDYruLtHPye8
	JqFnI9YU5XWq2AYzeEwOze9cDKkvIp9xCnKQ5K+ePP9swPyztzAOtAHAui50rZf3hfrqlZOJhzu
	mxpGIHLYcO/WzjEPDTHldKqEP38NoGp1mL3krZuH4weV+os63B9TJTeeRLmwJ9frIc5j9xGjU6b
	U+KZbRi/jsrA8Uch6zjF1yjcxdeH7keI5DhIBzezWAv34B6Xc
X-Received: by 2002:a05:701b:2905:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b39fe88736mr4979051c88.11.1794201426111;
        Sun, 08 Nov 2026 21:17:06 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.17.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:17:05 -0800 (PST)
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
Subject: [PATCH v22 13/13] docs: describe virtio-sound capture options
Date: Mon,  9 Nov 2026 14:16:18 +0900
Message-ID: <20261109051618.22506-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
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
