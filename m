Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536368;
	b=t48NkAem015Rwd7xcI25S2HdSgl4yXzqI2wULOc+YF2mmZd5PaIdXBFaxm0McHT80EyO
	 umrOByuz7LazxhsQfdc4Ie7b6NkXxFo9Uv9C6AY5A2qc04nf/Xzu2U2BM2mPlB6VBEp2Z
	 sdC32f5m2O8OnZY7/XiR9l9xXMYgZkrrnXyaIoOSLfmM/bnbonso5DKIwryuB+lHGuddb
	 zlEGycRiHiGtOH/c2pYXxagtOsy9XD9qLoB1zcOLiF0tNDBnPAdplGsICtfF8pLB0Rjst
	 m5THDuKcwkoL/yWSRM+tjtFKzqjmUtMC5T0o51008Jxvy7oQ25W5Io6mvu0zySJEr/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5JVpliFF/zW0d5ciE3yPTBWFRjXmBG6cV2z1o1LVjBc=;
	b=yWGj4r2u0P88BQSFidhqmnfwesdhp4vDmWxupJ2hZNf/+YrlFRdEZEcXVvDfm78yK0fT
	 293EUHf5a8BHFSNZ2YQvXIgTvOw4hUte3b0jvHKlSYhOX6AIjyQbfQGvQ91VIXuCgUE7Y
	 jMpG4JwXIwJLVTfohFM2+2W6tBqJJka7iGowwnwVCzCRfhwxrKhVYxoTcdO474xPlb0WH
	 3JlDhMDAnJQtM2j90kj3HAK0JA94WMTnV7gs6LlE08c/+qEa4tJjS67rBa5X8Wtjx67ec
	 8y9Qs0N6qVItbJfaZWgha9zWSWvOGqLEUkRhiRlGP+194I3ynSrUzJTQP5jxC8lZ98A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pmxg1TNT;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1D3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pmxg1TNT
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ea993271f2so1671935ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536367; x=1795141167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JVpliFF/zW0d5ciE3yPTBWFRjXmBG6cV2z1o1LVjBc=;
        b=pmxg1TNTKgX1wUemc9tbaD27EonEgHNpKfEsDQ5SaB41fOZywvGTQtP74jfqCviQfr
         Mvv0XuNXAGBjTwTliCmhiNunqtPG5mH00rafcGKX6Erb6676bic3G6K8pc9CqwK897+X
         96UAIKY/qdBdU71mTacTx39q0lEaQpgRAOHVylk5CglQ5rqF1j6xT8zl59XPIF6aFmKr
         q/Tq3B0O1dpvSI9d6C+mCoHQPpSNDI/0Z6HV/zsZ4z10GATb+6eIKpx+0fkKpzUxpXN+
         M3aQPsxbUiVqxxQao4KS0gzjmijot2xvp9vry198v+BnZ4ag4taHG9YWgD/55Knp8l7e
         cCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536367; x=1795141167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JVpliFF/zW0d5ciE3yPTBWFRjXmBG6cV2z1o1LVjBc=;
        b=Kti/0WZHmZQvsIwUkhlYu5FCIhNsbyQaTY1LFaQtReBk7y7+9SdVM2dLgDUHHS5Ply
         mV1Kp29mT8exJPLE8m0j6FcKpXooBg29oJWnVq7cu514sUehrE029TTONpBh2jG+U6gu
         /Ufw04hekLcVtvY7ulOcpp3YQLMYKECNCRvin/MmLONpJMj7pq1j9qRytWGgiWav+rKZ
         GnESb84kL7+KJGXqo5GHaPrhnDMorTOwiXAXYcj1UIagq1vocTfQLAipUnQKtB43TBjQ
         /9D33zPWYIBS7kBVWvEBq5DWUJkNJxsDkNWoDi4aPemOsYq5EFYQ3FOhhQTAoOVwUJ6C
         7VJA==
X-Forwarded-Encrypted: i=1; AL+hErH1MR/w0faLOiI4xoMyzABYcRJ+YaXzDteDYsD9WIVnxslVfbioEV/lKJN50vaSCabRS1z/+cKLDueW6Es=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3nEcqLW+yuATqfEUrwaj7utp+Y/iU/td9TYjW+euCEMZ7Zrn+
	S1+OjzjGoRHoPre0Iy5DfOrKAmuHUVz6TflVZUUwVtzSA63YT51Nr8Pc
X-Gm-Gg: AYBFou2S1wMxoWKNckvE7V90TQoVp1x3eE/lkjyNdDjm7kAyOGmN9Mw0n4xqsFmCyb2
	yqxJn61rzwUFB2FCRr2098TsguQvjl4BN34X/s8sga9FF2q4Zii2gRXJV6H81I2+dCK9dmC8NTD
	SsQCAgAP5z9awVUEd4r6Re+b8sgMMJSyDaGwXYVry5jVHoXfsvvucRQZBQkmC8wlg9BtkzUF57k
	RjFfCnxKJuAILobBU2LxSdldlI25x49PL3tlbPrg6B3FLckn08cA3LLUgAxS50OnbjE52DJjZBH
	C8wAnC9eltKAQ99jYtYf9uJqH5VWM5OGCURyOt2ztsmvrB6Q9PTfKrTMyeNXCvqzCrIk3UiG2Pj
	mubE8J3ajjWoWO7Am8hu6BXTWHt3nDW9sWMkkcdqzTaOgJoEKP/cu/8aAbpOHHRBJ+vnMwt6dYb
	plX6jgxWimSWXM5DR1XWzzHFoZ7EF+prTK5sBShJxvnUl9kUcAXbXaFLH4HCHwCQvhV4AAtJdzF
	ls77M8DmU3+wL0xTmsUggAU2zY31ZOOk8ZLfQE20bT4EF4+Ju3vZq7lfFY3Tw2SCYgMny2Gq1kN
	vHiX7nwNFnViH7QwO2dcr+DzNQ==
X-Received: by 2002:a17:902:f70b:b0:2ed:537d:f00 with SMTP id d9443c01a7336-2ee0dc95988mr9962055ad.56.1794536366822;
        Thu, 12 Nov 2026 18:19:26 -0800 (PST)
Received: from world ([2409:8a28:ae4:7f20:114b:916a:a0f2:66e5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f9f0408sm2895255ad.65.2026.11.12.18.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:19:25 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH v2] media: media-entity: make media_entity_cleanup() a no-op macro without MC
Date: Fri, 13 Nov 2026 10:18:45 +0800
Message-ID: <20261113021845.1697485-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Without CONFIG_MEDIA_CONTROLLER, struct v4l2_subdev has no entity member.
Calls such as media_entity_cleanup(&sd->entity) therefore fail to
compile even though the function does nothing:

  drivers/media/i2c/cx25840/cx25840-core.c:3964:41: error:
  'struct v4l2_subdev' has no member named 'entity'

Turn media_entity_cleanup() into a macro that discards its argument when
CONFIG_MEDIA_CONTROLLER is disabled.  This fixes the cx25840 build and
any other caller passing a member that only exists with the media
controller API enabled.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Fixes: 634be628b5cc ("media: i2c: cx25840-core: Add missing media_entity_cleanup()")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=222245
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---

Notes:
    Hi Sakari, thanks for the review and the suggestion.
    
    v2:
    - Make media_entity_cleanup() a no-op macro without
      CONFIG_MEDIA_CONTROLLER instead of guarding each caller (suggested by
      Sakari).
    
    AI assistance: the change and this changelog were drafted with the Qoder
    coding assistant; the sender reviewed it and ran the builds with
    CONFIG_MEDIA_CONTROLLER=n and =y.

 include/media/media-entity.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index fa393e840669..400e08598dd6 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -729,9 +729,13 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
  * zeroed but that has not been initialized with media_entity_pads_init() is
  * valid and is a no-op.
  */
+#ifdef CONFIG_MEDIA_CONTROLLER
 static inline void media_entity_cleanup(struct media_entity *entity)
 {
 }
+#else
+#define media_entity_cleanup(...)	do { } while (0)
+#endif
 
 /**
  * media_get_pad_index() - retrieves a pad index from an entity
-- 
2.56.1

