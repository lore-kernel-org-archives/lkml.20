Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693349;
	b=KNMAE4L9dO5ln/JKDh18hdsy15exORYq5k6uW9lmsMRP/2vMpZOnf1SKv7ZBURafbBnA
	 sDvK/k+7OCuG7BvKmp+cKDJzJ54seHiTb0kHoCfMSYWN4rJnpICagRVCrRGK+W2gVY246
	 L6BsTYBeiJhn/YKfJh3AgWROwRngmKeADsvGqY1XXNiGZjwLbERz3c+AD5V3esOgnfeOp
	 WLg/walGMEl5or2PHHbPibedp4/9oQajAPWgwv07kAnHntZimaD1kWAurs1QEWZqToGfn
	 4ycKzePoJhpEyQ6J47dzSluS9UcyoObY6zMk0m2ceVTWnhB89v5qInK8+F4y3QJFhqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vOwlBcev1S8HKV7nx+URCpkHr4Kt/un4+8T7BIrH814=;
	b=g0Xyms1+g7lY8PYUDjT9PXbS7nN0joNGL3vjom59pxyoRCZpoGp5TBY/JdytIZQrQ17O
	 qfqU0zeIPyUf45e2gQR/+mb/a4w6iT6ganyXG56+9xt8/lB2WbyLiyi0q4QNXnzax/YTv
	 zvWe8MspCppR0HE8RmCRZN06lDY2GVJIwtrOFGYmGfWjsAspPGzYq+vhBk5TcV+2Krbtz
	 IQZ3KmHImKgrULxKK6xR/tz9T0SCE2BgkWOe9jw5e7F2hH/2VXX+U/R6rTRfQ+p3jYzcU
	 n9thrB3wc+N8PeSQubCZAU46dWkK1wEy2pE+8XpKbDuiF4rLV/btShU4jErVb98csOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLAOPlZV;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E508606D803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E508606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLAOPlZV
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5499477eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693348; x=1794298148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOwlBcev1S8HKV7nx+URCpkHr4Kt/un4+8T7BIrH814=;
        b=LLAOPlZV7KPzNmDYlzDokDkrmFSdi2KAjN1Ua8m1mfIGID1L0l7glCXrdPkRLfmK17
         +Enh7KuaBEptKFeoIsmBzqslqMTte/7pdXJKFIo3QmmkwWPrmVBpQ7xxlJmq8NpkJ9fG
         ybuD76d1YsNxzD+bSmLFksuH9hR59zljUaVZk4Mwf3nlQVyCimPSUnecEqQ1a6mJzc6d
         9hYVk9jjVVgcWLCTDjM2z1ty11jjURy45k3SbalYMFPbEyk/Lg+u6pXmWEfF/ZoyEFgY
         A7pnbenVnSvcgvGldM0rtNfyerhDlf1fMP6/5WelSGG8TKAd+zecMXIDVzCFyOrFkWtw
         vQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693348; x=1794298148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOwlBcev1S8HKV7nx+URCpkHr4Kt/un4+8T7BIrH814=;
        b=x4VqaGiQ4Aj/DDlww/sThLL9OO5EJz8lD92zzU1Vl0LxyBdp3NYcXOCvgKIeRkUWJz
         WG6pnBmxi3bVhv0zw98+97xwpBZ+JctGynEK2+sFFnjyFlbldJJ6oH/8P9fKSwwDcAZe
         fJ4KdQwUM5AnuKtcl671Bx0h6RBqWTgAoROBZs/pWoe4iA/kjDIb8m9kkSTyKoC0lfRh
         PTMu+cYSzG0eaxE0alev/HI2fsQNG7VFNgMrLTOqHVXC6N4Rfa1dSTDACrv3pwvNaNd9
         zOZMEcgZ5lR0KsPVbuuUd0bsxcgSH0guAyYwfRxGbGU8vm/QF65hbOvkHE4fw/1PYGk1
         ermg==
X-Forwarded-Encrypted: i=1; AKwUvByxyDqkBduCH4noCYHdLSZ8qe+ktBZXdq2PT8IIr6C2u4kEaV+9zEfuTosSs5zL3hUlvDJwLIDs5jMCYtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ohhIOq5BGZo1aa2U/op+NdUYb9hwDHQcjUgWdTa1r4Uu6JzeE
	/lSR72TRPOZ8/A5z7+DIwHt7e2ay+SjEoIV2qo9v7AzbwuMzGcExeSxD
X-Gm-Gg: AYBFou1yuePEMlA5t2RgbQMvXX2+U7x4tFbtfzF0SXzpKiFAVCg1uNa2zZAcXnPngW2
	C+irdnsCeq/RI76g3AaHdITt/gxHqxvm6S3HA0CEc298alXb7K6WTxBKdM6KgDa6IfQe+dR18k6
	ibsQV8YvQdFKYCgHZHoqkYEI/E263Vz38X/gvWzHS3PdV8FZZkv6FQGLrMdM7zhnSzrsQGUF4cl
	duLRYqVLA60eVq1Skpipepec4RJLWGTrEJL7IjsMb2X4mSJ2fCkoLxjjfdbKQP797RXOKBjgGwM
	pX2DIpGxopkIQ/RE4lcPkTgrdfDClAw0c5RY7Jftro2Bt6hgy/CAv9QXWCxyKM9Ww2DD6ZY+G5D
	L205t3WVqOT8TkeFTJoJyoNCwpZqzrBS+IodUBYOR0CX31+4Zshnda0WcYQdHrZyvy5z2RvSyxw
	3ZJRPSY80ZknB3GisH/osfluGekJQMBUxzPk6FgXtCGeUO8X8l2jquKBB+ulf8ZMteqzFdSmoai
	4hrr1gspfChgWQVCm+ah5D+ozbYuojA6qrfweTJZthYqBpK30YsV539AgQkJR/iT/96R9HHjpYg
	iVb4vBzf7csHfWe28t8byIUQYun02Oh7RNX3Uy66BxZRu6OVBIzWIh8QeNJYLRrAdcacLxjFYhW
	5eUebMecH8M7UvYbFDa0zDKbH702LKYdvjJdi1KbchWPp7eI=
X-Received: by 2002:a05:693c:638e:20b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36a423624c8mr18389092eec.6.1793693348178;
        Tue, 03 Nov 2026 00:09:08 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.09.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:09:07 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v13 12/12] docs: describe virtio-sound capture options
Date: Tue,  3 Nov 2026 17:08:21 +0900
Message-ID: <20261103080821.16983-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Keep the virtio_snd entries after virtio_mmio in alphabetical order.
Include a diffstat in every mail patch.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 Documentation/admin-guide/kernel-parameters.txt |   30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,36 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
