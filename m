Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338034;
	b=ExXEodHGlJ5ceIM7jyQ3eIUhdFR11We2RF6PQueVSWdsJkAUkN8hQZUrFkTnpU1jm9wC
	 Roe3VauyPOmv7ko7aw20/dEK97o+Bcb0h0rhhAm3OrRENYjYZOi9Eb5wfBCB0dkGMRGry
	 xRXTtsnkfwXGFySwwYhbZU1xpmXVWnd4UcqhRH6h0WsyaypQqCInb9h2NUPrwD93W1qIk
	 iY2OvR4yqDejhkKFPwsks7+lxKcfL45abBfLs8U8YNVgH/gqASCxA7cLMmBLvhQrEwQ14
	 jQRgpl0A9PEM+tD1a6LBjH13GCT3x8Qf3wOtO6WfUDbo9MACEGEk8B0+Sf/x491iQVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=O2jBlRvOzjT/vFznN434WXFkDT7ej4H4lG5VxOkmTuY0f0hjW0TDfyNawNEOuYr939mK
	 RpiiOQoKxrm3CmZlGlAOtYnTWP4ZTVJPGvQ74/NAaz/jO/quqC6bRG/Cj9RvVi8Gs/FXC
	 zfbVDq22zlU89//SKTn+T8/UHYdExsxaUvSy/4muULZQozQR5TpQMqNZqkIGOR+p+B6Uh
	 flCI8vBoT3Oq2N4K0ItJwfH4i9svZubXSnknRPMb/3O5j5kdOfVOUK+5F3Xfk3LDFhJSj
	 JbtII8uJ3oCGDlpQT3q1Hqn3tparhKO7/7evG64kLlvorWQA1ph+rK5LYBGGkbGmR+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGotmsAW;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDAE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBDAE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGotmsAW
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so115850a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338033; x=1793942833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=ZGotmsAWKG1IRKJ7iry05CPnTDzh6s6EUXB/V9yWJESULpVmt0jHwIcAq8WV02hP0I
         Hf4WXTmx3/bs7MF/dH1KIaQVDcIE2CdZtvN+PiBhcWSTAIpCxl6RZpHQRTExoQ8qrWJC
         caIqPx8cHNZwxfjGk+XrpoNQfXEQA/wfiWhMezPcnbhsD/Lq2/s2akb88zmZKo3IywlA
         IxILp0CQY/hF6hUWFw0YlRWD+24vofJZ+wXU3FQz0wZENjrVSFt/XaWFK+CclJxR2PwA
         7D/KNMc4MzniRSzIy7SARifJGxQuSR3apsy3uAlIljZYHA5BL3UE18Xy33ppaCHAE0Zq
         gQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338033; x=1793942833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=VsZtYP5Hj1XeTFdW7Imp6hVMuYK0pDSFbY8uos/xW38jAerDk3zfghU0fUnqRvdBOz
         /0G4ZxR99j9jsD7KhRtq0kC3bVJ32Jevhksfolq4y8NWvYXxrLOpqSWpDAipRvWdZHNf
         hKAbwgSptdJr6nghhcBXhNEfJArHu2BkdHsrBv/CjawL/0cdxjTqu4B+2ggrdpCdYgFt
         uBj2KErhKSLzBPv1Xh9RM8fSMnn+EU9oYIfwV8vhoD60CskPqIgdC/tImQmVh5JYqxLk
         C5sNJCtnnvSwS90AI3HYPnkSYuJxO5Dktlw0L11rut/6u8MJ2tcYi1lvFO+JuSeXy07u
         SLmA==
X-Forwarded-Encrypted: i=1; AKwUvBw87+3Ny/vDzzRxfiBn1LJIS5gWHgpWjvAUoTA6ykxaqw/7aG4UBwBCbprRySKVDn9dkkD1kZThZ8uZ3D8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIV8HD/ojh5nUPmS2czaLNJ/qLqydNQHWGP/neUtXSs7gxdjLQ
	G0aZRSNwhnwViYRNuWg5ggFIMXFKQOMtuxD9pmrqBRFB8KSnKfhPuOS4
X-Gm-Gg: AYBFou0C3x229Kjq3t5Y4fMm5Zh68pMpInprOi2K2R+kGB434bw3YQEg7ic3srYSIOn
	yvLGya8kEwpqfxEhINHGhV9+HIEkmLUa3TCtWX0kvAZmIJDhVfJYPqwWaa8lDithxPTUCz/+/YN
	xrcdyKOYX0eeq3j4gvh9+UOHtK6pQKscYLnUoskLCKGI9Mx7muoXkhcfsonODNzwEtAFUydj6hM
	ZuaFOkP22rcnWhyUXKp7Lmp1m1+1P5CB+PBEzjtunodOwTETr840GLPZwSm3CqlCyibdB9t/aSn
	mo/bJIYWAMux/MjGhmPbHUtxH2GMXIh0LDUqNlhfTQ1onk54OCX3trz5+uGchhTseoTOgwEDdCc
	ecHYOjO8Y+oJm68luMvErvYyXqgtUSeNP7lgM/4KQjl6BAq0FHcXuMXaBtcEm06f/hXBYdnYUmD
	weXC041MtHzFZQF/WElmBQYY3YItW+KSCXsJg6cn5vA/Xh8KLnxtuVxDm1HYDIG3nWAovs0T7qT
	AOQQkTUbdE6umDPaUOUl0siuWGVBr1JHXyGIn9mP3PDC+HWvtJvP1xJx7Uxom+umULQg88AO0Md
	1jo3ehS8R8M0tnkJDKDF2VsvftqkSBLT+agX+687NiWx2xgyR6EvLQlWdpxB9mtfVwlXp1i/2Bw
	mTECEI0tVZhm91zxyHoQX4XbN3kxWKpXxMM2xEgi9gXFdlv0=
X-Received: by 2002:a17:90b:3b4f:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ae8957a24dmr981624a91.6.1793338032263;
        Thu, 29 Oct 2026 22:27:12 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:11 -0700 (PDT)
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
Subject: [PATCH v10 11/14] docs: describe virtio-sound capture options
Date: Fri, 30 Oct 2026 14:26:26 +0900
Message-ID: <20261030052629.27742-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@
 			brightness level.
 			default: 1
 
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
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 
