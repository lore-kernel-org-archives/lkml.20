Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182171;
	b=fL7pfRacDXB4E7VdmJiiYI2f61aK8Fxd3mQ7xYvLHnGPut/WdNWzdBPksxDXBfSTw8SQ
	 yHyjuHlEhlpqaGjoak0VAqK69DWwBlcGGrcZFSwF4tMaCVoV9tKAFT0ZmHO2MHHPHIgje
	 l+PySgw5i2RmuV3HLKiKtZcvrZmoCqxEw0DJRk/pwRV6jwc79V2igMZd8OY+ozWAJZVFH
	 qxTBuoRxGLPFkaawJxuwJuXQH6bFFXmCgfTi4Wli5bZvwIog+62lPb+wU6D73EMGgppL2
	 zrYJv0o6KiliLY2XVxbNaFgkOCaYYGbcFENcT+6R6c+7JOigKHwwtAq+/6mnjDGmRFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=Xd0sE+HY6O3MUltqcTdrkbOWPp1Zsb5dSzzmrNhPa1SgFy6s5IAmkwNZMiouSIC9+kPA
	 cuc/bl1HX7fzLH5VKOg72Pk95ok4sN0BKQQHrjJ2AnBJTaVF6gw1ZKKHvoMuQqY61wfJh
	 XnnExbvqRjZICkx1WrD/VaDN8dx4DLyVpqpWCCbwUZYAPWPl0cbSBbM40VJArgIRPW1/V
	 weUlHXRcNpykIb88R76cIdPhubGeycdHx1a9vruhpJ+DtWqj4m8lohgk4J1jOf7dnNbHJ
	 kcluMNXvoxTKW3qgn2erA+aez2NhSNXuF4XCDmQS+DroMQAs6G+GDOsAMZgpZZ/0k1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMkHdWEu;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A45606A32A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A45606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMkHdWEu
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea7987517aso1697355ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182170; x=1794786970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=ZMkHdWEuaOVff3lB/WiPWnY9Rl/jGA3RO8cUj9WLl/Bix+oSHdqLM6mzP4OMh+1JGl
         janLnElRIlHsvTtY573kfxrbUhz/IN5/3+1Ph77bV10kKfkQXWGWBuxnoOsWxkIv95gy
         3eol1f/Z3YMqFOeXPhbKdGUdjj8y7EeNKLeRT17mgyPLT6cPBVidhnM83oU7W+XWMid3
         vQJmsr3+JV1DKHgz//mScLY8yPmLVdOtmu7iMlz63GT8lqR+iT6dPFFT2yUiQyrwYSlH
         Rd0oyMxs11yC7g8QprNxbemiyk9OLHl45cxKrGAkH034GzD5rYRERFWT0zcWmWmf1JwR
         LNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182170; x=1794786970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=P/xE8pHVXASPebl5au193H6nPpmeJHFMcLyPBns9oBlJsiV8EdmjWWfxGkuNRnf8GN
         0MCCHtj99ygbo5GUWnivQJwsd15QMu0aUK/g/JwPlcPG+Ar44L3RHyTqU8BiCEkgh69Y
         9V0REUKMtbsPeH2cOXy4kzRD3TuD7YSNwbLODYVSK6MsUKwMWwkiVwQf14C98CMRkDpR
         Nk3eqSN14b7JemkHFwtIVEWB925LWj5V0gDVnlY/IAc8aQtb5QZ8UrodElNC/vmSLt1+
         cM2Y7m3CAd/afs6dLdPEnp6qrR7OFaD37sx6d6yKIH6cxRUcPjQQpEYRZpIa5tw439Ky
         AZrQ==
X-Forwarded-Encrypted: i=1; AL+hErGDZhBtQS/7nOmeKF+E/Zf5lkt0jw59eNs+vaGpAzeSTbMxVybvOJrwO/HXrpX+4ZkEnYPXy/VuxsNJLMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6cYGguJNxL4tmA8WeNO2vXsbypArBhzYFLOSLPiX2tftVdN7A
	fY6Be+Vgmpfg9xOJsDUtd3xxZLD6KIuq51VdJ/X7pkz9hRdofsDBoCh8
X-Gm-Gg: AYBFou0yW4+qYYnc0AlgUj+a96yYI/E2XJqQK9OLIVmnUP1nsKcfWoACWVXiDIlyOwi
	9F5IZFFvODWA2xqHoiXYDJwcF+ysEZLcGsoYI3Ih6qax0ZfzNHntEQndEP8WI70XsNt/oVl1XNd
	BO33k+FND1/RkbV3RuqyFDS4Sz/EPOhyBSagu8uLh1zr75TwW4RIhrxj9t8efWC0CEw/BMXdV0V
	Al3gKYSUviRsEMoBOcS2qeEMqvIzaJdzN8KnJPxXlSAHQDL5r3JZkbqx5zFCwTeGr562S7/6O6J
	fdmj5zB46joV9RmfPciaLPqicKODe/FKjmHuvRoI9ai/VR51t+gURuYEt6Gpan6paTrA1eX4npM
	rTcrMX7dk7X3XbStxGyZAzgIPgziUgZLpxSm+1kmjjcwnGGw+tklklymDqLyMzCQrG0x5uVCKtv
	CO2xhw7yQrVk9vCLtCvTATN1zgPoTwtvWd0HTDYvjSZB4KpMBiPVDT5NVup9//8a+8BgZzD7Tim
	W768ymcUCwFTouKxf7emYjxWrW7x7TTx/Vgt3PHur38ZsipgnLX5lmSJO1/7Ksc9iP31NFleWvr
	GGs+QkY0dJDgHZPP9D+zvNfq+J+MyPiwS7AgmG8XU0+oOe9QbLqie2sOz2rJgsPts4q8XgwVpbN
	Lj3tn1kt6ebIH/JGMwAR5gSWJuq2yU8lgs0KtReCF7xUYNTDn
X-Received: by 2002:a17:903:3810:b0:2ed:123b:97e4 with SMTP id d9443c01a7336-2ed8375be01mr25102705ad.15.1794182170303;
        Sun, 08 Nov 2026 15:56:10 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.56.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:56:08 -0800 (PST)
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
Subject: [PATCH v21 12/12] docs: describe virtio-sound capture options
Date: Mon,  9 Nov 2026 08:54:57 +0900
Message-ID: <20261108235457.12688-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
