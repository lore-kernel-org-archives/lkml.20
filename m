Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758716;
	b=j/XyjkStjNucsScgriT1AQpSo1c3KIXBEzayyP7OHlXkmzAv2ntM2A4CzTnj1HQ27Nrj
	 RfQTdxSHcCO8UxMMlEFYjRIIqTpyMfWVZnjWxC99RjMtQ9lVq6m/vHwxFjeqBnH1VLhna
	 mqTclujAQwTyT/7SHw4HC+pla5WDyzy6MrRVH4bR8BXjegWf6IZtJBOGVCew5VMbbq6Se
	 +tpjBUzLxpAHeqd2LOdAP0To+Z4VgIiMNR8BIbNwfYqzQKEAGzA5iZbbmUuF9q+C3PME3
	 eKq/7QNPhtiRutrws2NCnCxw8+PHW0UgaYwF6KsFjdoipGip+w3PsOG9FRHz4kaRgCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
	b=GNpdXkFm3a0iSTHOXGuUiagn5zwRmXVtCDRtBQhMJZzRavAYNHz6khyYi+LFKFUvZcLT
	 0XMJnizhLifFpMv+zLljwGrX5D1xlno6YGdINan5yiNYLcRJG422JIz/04j/40vA3VUGB
	 b2dTVMglggs5uy18WjR7DODSXlB9zhsKE89k18Dh0iiGMogFd0vz0Cl14Ek5IYvB5pX5y
	 Yy3biRr8pXTaX86pRKw4yjA0kryXXhfYQmkuQfml2u6/HPUSv983ejMzw446GHJpDqdeq
	 YxMm2MDMOlT7KMz6MLt5ZJT6SuVxjt9eDlwFQrZ/xWT4JOlye/wFnlNta6p9l7Tou3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKwJHKFU;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4CF606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A4CF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKwJHKFU
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso143152a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758715; x=1794363515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=yKwJHKFU2D2DhPMYMCgCzYmIt4/34+y+HODW5waB91q+93S3cWU9u7MBfBFVa0PteX
         6urz8fIXfBJ21XmZArDNWZrvvcph1C/Vp+4/3JU67wwKWpThQrH1qz/iArCXcUSsU59o
         dGi02BuGhVfROnsDKgtQOOlw10MyjPD3xM702XttGNZeEklm1/+TwH4hUvh8Xsy49Nna
         lJmHkFpWT34THeTt+trsVvf8twhyKktNGlP7cWVE933LCqxALK+65nuY7eF6jQOlqjl6
         RmctE8Cz7xVEOqiwExJULFeFVAtxJb8CpE7ocLyFsWf392b+27z+sS6Z6hjFBEksz6AM
         toFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758715; x=1794363515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=dZNfwmRRBaKiqWnisxc1ad2mT1bBsD9UQeii+zxpIZdu9DobdWgUnfc+VjzIslE+m4
         ppiHVtKBQK3Wxnk1ZlO8Nl9S8VBd1rpD213SrEdo1h648U5VV7sBHTkSpKFfTLUey530
         kb8qPFNdZbe3xflwUFjIS81UEOAPWt0TSoNeAdx++w0kXKsKJxyUFYNvwHXMRTtDpUVV
         ukbxbtlVysm86mqnC8UX1O6k/0kvBNa7lGNtAnxzh8Zfd72fEfHfsg5SrHj+Z7KJYBOn
         eKWHYniNGZ6XfPX/rwa16EjALKZ8/bXlC+4Aj/+vBLKgNubiSknKxesXGZxB7X6xSTx3
         eC1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx0ohPD+4I/Jb4yjxuiPzhG2l53miMQPW9eon7xuFLwU9zIduwI25D8ZP81bcETU2LFZwcuzmGs8Izn8sc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F/X3W/dMlcc+XgQ1m5oxtmAKvU158TBPYvxHv8VrQRr4Mo96Z
	NIFseMxP4/EhI6TvG511g35juab1hJvivL0t6WAhb3/rqtEFcl26van/
X-Gm-Gg: AYBFou1+t9btNUIcughG/FeVo+KQiMKFELzK2PnsjpUNkje/fSInQyeWcsJLHmTNB1B
	CbeohTq8UTUwPlGw1eE5BXOtUpmfkj3PuewbZeeDVDnJrGBBydt5VVCbG/qwYbQSzIQBomU5Aap
	WmDVcf+uDov97iiSiNEe1q4EEglFmm9neI47pAM18KPkVbUYEBRL9b4pBgGmC8fZfevTsMk9iTE
	Xxx9/xjRtn6gLMsmQ4yK9Y6LZLLJZz/lSTFA/SlhJQKNXztijM91cYp/ml7Ip4sZqcJBkBUECuE
	eydnC6Zilpb/LGJkus4s1wekcGEVYQFp+gxb1bv9IJw3GwaObT91or/Rm0Suwj/rSEwurGwGsWO
	wbaOutvHvekgnCfzRl7/T5h+AHfPSCq/w3PuTIZZg3/rWtrYEl/OGOEqQfpYcQy/EW9u+6S1MYh
	ky4jMiRxQMqVd9dKANRDXBpxuA/DkxHk/JlD8KGBnVzHqR41qJmTKn2xSd5TPQih6CsoWTz56/S
	8zCNEGZd3YJaQ9P/9r+s6+8aiWAvUQSmtUVNdQ9O+uYZjC+tplFjjwopmmlqjyP0Oq9sTueOjks
	mkyTot83PX0QAR+AwNirNk/BzaZF53p0rz3dtG+SWb2p9BGZIdB+6XRRQQ6i0rWCKBWDnA/Hl4q
	XNvOZ/+beZUbrXhJHgOVD+NEiptrQN6tzbeCd4h4Bzr9ziii2qLrS1M4haJdlfKJijijI
X-Received: by 2002:a17:90b:4b8c:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ae897c853cmr12970769a91.10.1793758714583;
        Tue, 03 Nov 2026 18:18:34 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:34 -0800 (PST)
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
Subject: [PATCH v14 12/12] docs: describe virtio-sound capture options
Date: Wed,  4 Nov 2026 11:17:45 +0900
Message-ID: <20261104021745.57733-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State that
capture_allow_empty, capture_allow_short, capture_packed_status and
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
