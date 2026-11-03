Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664290;
	b=t6VH1drWPVlSU4h04kgecN4kk3IlPM639UEhG/JZ3DVcuI9Q138fixu0hJG+3GIJbmtd
	 puBC5PNnQT6EAxJ7UynsN1/JMYmPMWF9B7EWyKAK9v3UhuAqD3cWkPSeQXSvUwwj5Uaay
	 hInAb2azpoYWbyyKAzvwtZ806AXQK33AmN7Dm9zpUkDTQhVEWaUBfV0F28sMTUCKarb3t
	 pKT1UI5wjhtU6TkRYBhPN6isqqOoze49cOD3S8eUGXQSsIA3mrdNaphNZjjQDbmWGlJl4
	 Ey6Ekp8CEGsqiUhjiAaPwrHAm+6m0y5KWjVE9bmnDsEiCmyo93B2o3mWv2J+xAwxMpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=OzBxxah+vXpdPs/6HUERB0kjeqWA0/9DGqrzIuLFpaVOofc6D0+2ai6PpRTbPhWf6GKh
	 2nr/pkgVq8hVlvtkwN2JaubwXyX4OiQM/Qm+f5+XlFLgT3A65BYW0iuYnrkkgExbY4JJy
	 DU5UoLjn/elSsAHzDF9FEWUy1roNrgCl76P+fletzHX1u10HmLTNw3W6YVHLG+cmlZm4O
	 CiAUw49YIo+fDT/NDkyBtDFOfbbmcgig6Dc2iS6Oiys8eGo7kW+tzUHX+ovX1wXGGPzDI
	 UJcuWAgw6MdxdbiGle1d2S1WStBeJHOpARlPzjhL3d0vf+Ip7u6ipA9+hGA/GbV4+fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrnDsFY+;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89143606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89143606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrnDsFY+
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso22038615ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664290; x=1794269090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=mrnDsFY+eebB89xZ+DTIafFd39MdDkOLEYtamDNq83jCQfH7RMjlPLE2anoUohaLr8
         oTwh53Zbi5SzKKY+nR+3fBGfl1xBauWGkT3Kq2E2hg35H2tnRevGfJYnjygVezf5M/nu
         BaU8nkfqxQgYA6GiVXCBgeLyM0FHPbiKy1eweNxWcznMkFRk7ob9zF3wfDDLdS8zhKKt
         dj0KBRSRbTctb+hkNWansuprjxYlK7kBAefQQJtmiWTn1vTQ9ebxi+RxUAlfVAkLRYLe
         gir6pb43XjiYHjPMrveNT6qMsojM2Gn+2PcZ0ctGQJeEveTSJ5KIDqOuw7+92rJLUFKk
         EFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664290; x=1794269090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=aP0YA8xSmrCjRupd6pYX9/n230iQwiiS6vOv20b6Ic+pEhUmK9wxOo7RxZbZYhBmQu
         G0V2tU2yleMgSSNdm6bK/BGI5OmgVM+m4iABPisIxlYzhYSqXecVuA0cD9fIYMgrzDiz
         /Ot5F0YcAGo+JQCF/eHALECFChPAmhmCAOBVRV0sMwmoLttRvLftngi9/ss6EScz6Mh4
         KbsdQdPZGRUr43K+bS34eeYHd5UtNVkxvsvRZLwFnePlruzVpGa4pI1K2O1jr9wzqXAA
         ZPJDN5UmzwKQP4TGfGBcRxoI2YYxImC1YHtambFpZSgbxbxey1lxxvhAF5sXUPvvTEbq
         o4sg==
X-Forwarded-Encrypted: i=1; AKwUvBzkIcA2W1GjiANvCd5YjTW7Rq2DMP9Aio4F1eg7KSZ30XtErZbLwZxJ9uNh5ivUW+htiv/gUvICz36UUNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s/zQkFiBHGx2iPc1N/3nKqCJ/SCOqH7YPpMPr51KbM9tgIpCy
	JnawdwnWrSbHA32kkPDdb++nr2nAEoaHhmCyas7Q1MDGgP96q98UCIer
X-Gm-Gg: AYBFou2xB9bOrcU15kjGcHa7L3g4OE40UC7VBgoAUw2jlpWHPBbk/LyQVLLaXWVdR51
	Y7sWx7ahPFsAwBM/DMNVt3vW84ZfH1g5BKipmrOi3lBAwjssVF2vQEKDtGXPs7eGpDesAMHg6C2
	YXe9oAMJhqtaBv+eT5IYyzPaj282r0ZwHvOxCZD3l2bWbc10RZQQBOmn93skZJ+zxG98XuG+PK5
	hnPbGHAricjTMPr11D91W3EPXQHsB0eXuNCuE2LXZW/rNzFzfz8jbktNUEshudr/Hwhx7K+tzgO
	AT+mEUQ+EmgMPtfuDvU75mwMi0yATzvs702JxQDedUgGivcuM+0/XmfzHLw52f5PSYxXOv462Vq
	qIT4rpRJ67NcHRZgzMHGU71yau9nL6zYUMznBWHSYT4JuySQPyxix6Fq4g7NtAi1/zwxhbhUKmD
	beTnDDGSwctzajQD+1HcWy2Fe4sfBfjz9Z8/cEvWKqKVPuG0FLvLxs2s9+ITZ20qjQyMP5qr00Z
	37Ai08i6ftWI3mPoqVXEXXW3+TYlBSWOvFaywZzusbiOwQlkYpBgskwpzf2LOymla+AkBkwIVvO
	CfghNajZePQXVY9oGwLG4jPbdkKl296g2I95OUimW9kJWQ1muY7p6biKT1mmHFRDdTO6GDQZEnC
	xmu8eIoE4k540hEuhZneB0qwZ2+QyP3KUr2u1K7pE/M3HApo=
X-Received: by 2002:a17:90b:380c:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae896f8315mr9974105a91.11.1793664289956;
        Mon, 02 Nov 2026 16:04:49 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:49 -0800 (PST)
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
Subject: [PATCH v12 12/12] docs: describe virtio-sound capture options
Date: Tue,  3 Nov 2026 09:04:03 +0900
Message-ID: <20261103000403.67106-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
 
