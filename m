Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180552;
	b=Yzsn+sZrzDbvlszXPxsFgkPFjuWgeYWeohEdZVMuk2GGpL/mc50sOXGb7lTLfTi8h03q
	 0CUfWcjD21WAgmIBwXZNPl3bSk70G2m4JgLAnFs4g7W3DTa9Sr1HZC//ydc/3K7/ym270
	 QDohlOA/kzXAib0lBS8tb1MeUCeSwdE52HrjMVB9696dCA8V5Ur6Fx3QmvhTPOqMcXuZR
	 1Mju/mopNRENbmWNyOPIAZt0RT+FxiaIuCou0gSzynrM7FU0jiUWUvLjC3aOe5NAxb4K7
	 8WQL2XNvjC9mUBaAC80nQQ05F7mXlq1BRmWKEE2Nl15ZZF7cDIDoFaOM/G0aXHlqv5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
	b=QX/UtGjRzuqBDS1UYIPiPPJq0zjpUzC4+3FWj7AwhSwMEHRpHCUzCWbDur5y6QDfpXGU
	 o5809b9+vVUMBTICyM090VT0FUFPV5VFycdmMM98UfjRPDJS39B5k7FR4uIt3yf3+MlO/
	 MHJ028hf/aIrE7MTaZI4Kn4FsUM8QLw99SqlpAE+Z5rLMZYFRmgt+J0rw3lsyc5Z1fvG3
	 PriI5jMKBJb3pga/U7h3qzMnvXhBWvgC5oHFkg9ivcCBiEtM+FAu9jfmRi65eVQ08hFke
	 Va+hI5wkYyILCkVZRTls4lbfm+f8n4PMOrO339amKbyqMxQvdDp8jJ62fE4GWbMcycA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8NlGIXO;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE41B60A3831
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE41B60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8NlGIXO
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so369235a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180551; x=1793785351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=g8NlGIXOA/gCtXZ/AwBmUMha/hD7dvU5ooqyd/MdITohXhlfRxEsrhBFq8QJQu6ucH
         Jlnw2MPPDDx/qxsdsdAC73zBeSKnCl4jiodalliTsMBjvFOYDMjdt3uh2fUXinicZQIJ
         L3fhmrzm9hX3m55XD8d44zNoarcI5aBZS75o+7OyjUIdXYxmti+PpJ88kyeUMgpsHePK
         5sfFgkmrdPtNPNKWfru7lIvpcbNLdHeIpH1BN8n9MmmvGKEeg5N6TCPE86mMKV9yvul6
         A3h7A+nmYena3VTMeniz7YvwwA1bnu/dCSBehkPeGR+2zxQBbmPwjUlr2qJ1e9xtCofR
         jqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180551; x=1793785351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=qlpk+9JPC5iaQGzPqQp2t5kXFakwr/uPTFyXnnoWh15+3hwO8Svf5ByrvK93+gWnBL
         DrbOmyBA2DCe/HhboaOSxKwqUK5yCh3iiMi+beyRnjjslsj4Zc18ldWEEEeb/4iXAaQ2
         1avgjEBaBfW2vqlV0Uo/ForxHbk+56ifPlDQXmU5IHanBBLlfHqN7d9nbAnJoS5AFDkk
         Wp8Iehrkd+3roruEm+uQhV9GJIKuR3XfiKmW3gapTAhg7QzpxTo3edm9EsC9buQG74vk
         IrwRvWQ4XY4DDCoL6iiDP2+Ft2oi9zxmcr7MkXzGNeXixJlMu9pJD2wtwRJZzKBDxxxI
         jK1g==
X-Forwarded-Encrypted: i=1; AKwUvBw0Kyl5g3HE198FQVQf+gHxuohNIPEiRqM+fmW6CHZuis/zvql6x3G22gZ2e5cdTzwzvPntbeGWQEOBEME=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3XORox4N9obGIeQWrWiYmd6PHkuJhh721WJ+9gssNmUzwmrr7
	dMMEoDmSInbVkmoHqjzTJicY486eRTDevj4bVYlTA0VS6BpqQEJIsyA2
X-Gm-Gg: AYBFou15gpAnIh7xjiawApbKPXA3LAOeqoir/jYKhm0bl4mOnLRp0txPBrBS+0LYAJk
	c+11Cx59DXQ2O0Kr4UHNzXmOmb6U9358PPG1yj0vevizgSH7GC2ZLtHzWQvNH9LszPOb8BKeUj0
	tLnO/u8lvIVlNDbdF6bR7rSvUb/wgAwvlsKYJlqzwnMrOWIhb2+WMpCzL8A0Hdgne4q7LTxb1Sk
	8JrzZ03OMvqpjr3AKBdb7MF4gJYNYolublxyoean1Rtc19Pvqv292mDJHo+XcICV8+9YM/7P3ff
	EGSd2FT4uYroLJPpWiIIzv+xvaK3tuJdWp15ObuKvkYmAv+pWvBMBdzVTsbsM9IP793AJf0OGTh
	6sinkjhwX7JhHhkNTuenKMJ9gosJJdz0rqc/3qkF13CWMyumk2hwmYrfR5EfmOxaB8+Xpf1eNpR
	l4e0dvSdwFvC0uC1snJir9k5Wv3mxA3AtfgLa0cFdPXA9X6Xj/29DZ0EMDguduI2k2F02pciD1x
	qW+hpoqM22BMAjOl3tNu34fJLIMdPFNJhRC+sHIljtiRaV2zpftIBXjWZV8M2cq2ZCOk4BoKhhE
	QJbdHU/oZbQmyVu815sjxn8b3Ip836cNZ8nMELY2QLUhJUkdez3qFaBaspsn4fynuL/n/gM+WEZ
	bxRuPj3BsfN8kJ4Mveu0Tcw6Pv58gQY7E1wAsPG60jGiNOEJ0DRXyyxEGUPkBFbuoxiH9
X-Received: by 2002:a17:90b:4a4f:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae5822102cmr1339726a91.56.1793180551322;
        Wed, 28 Oct 2026 02:42:31 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:30 -0700 (PDT)
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
Subject: [PATCH v7 14/16] docs: describe virtio-sound capture options
Date: Wed, 28 Oct 2026 18:41:30 +0900
Message-ID: <20261028094132.20364-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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
 Documentation/admin-guide/kernel-parameters.txt | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f..6c7b1b3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@ Kernel parameters
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
 
