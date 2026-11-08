Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166424;
	b=r3VmhC3eUQWL2Wz/RY78zzC5tKEVZvU2o9FGBFqpZ6QhLOJsDaarAtnbhpTtoaNXp/PI
	 YX6xLtsuGyCp2uUtq5BSjDH0cg87deBtgbqEOANECm711Y8p6fdh4hXnandyt389NBxvH
	 YFaGnQ61oVu2qAWbswIX8b5j1LDHUzH3437ZzvIpWWImNBfTIf1LLrkyga4oPWSVSVDqV
	 8oMERmVUY2oqZQcg6HJ5Xu4CWXzk1mGOEHanqqGbJF3J6g9L/FLixFC/w5SZPQQ5n7J8W
	 9BMtjlG0aPvIXFh+9qx1pn26E08TS7WotGBw2A9lJsMVHspdOApPGcqk3JQ2f6PFaRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ULPlCRcRnS9OCU3V953l4VzKGw19SLsXrW05Cs1Xiyc=;
	b=Fim5krZHnCzrLoc/wAvrjF1ToKHxqtXp4r3nUzGbxLSqRkzomFu3fjl23WLRJZRkMs1I
	 tQo6BpfDgTE8pKB1t1pa38VBdYYKy1VQ9ThPBubRU0eYHtinHZJ9vmlEJLRqj96TnCLex
	 2G4XizmQho9yVGRPucQ69ZV3fBf8atXhgVt4odVCAO92ngEEuxcxRvSSNUhrI31v3NOjL
	 /sz1a4+jBr59vvmKYI5SQdBzG6b/tKrj6VqGXoutklgFRQEkZ7CUblyZCCKa/EFv8yanW
	 KFrVpCbnmMVBhH4f71eSm1egaAV/EiMzIlcfGDy3g9IH7adrDMTFxz2zLTinE+jkXOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUs8YBLq;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787E606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3787E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUs8YBLq
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so1822935e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166423; x=1794771223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULPlCRcRnS9OCU3V953l4VzKGw19SLsXrW05Cs1Xiyc=;
        b=zUs8YBLqMKWBvZwxx5owtZ9hiRN5vL0li74cy6S/T/QxA/VOflIwdBRVJjCOhG9qCi
         sPu6y57n+CP3o3NVR+pcIoLx13EXA+FMVFIRjhGk/rqn1IuENMe3j1aiTPKHqoe6ieye
         SYrbCQ5ZmuhO8QsaGhNyMp1UuXzlEJycUfIYMfBObkpaaYCpWNb/hUVBKvPtmtweJoOv
         11X5rIqlfvTnjpRL/z0JQ2LLsG+VVGBgn749xLJov4EeMOo5Kr9t5JCbzg/+rR7GHqBv
         yZ/nRpe00HbMXwic+QVEuT0nvhdZzBvU4p9S5IqdpdiNSP8sgL6R8wnhcMsiFhoTPrMY
         XKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166423; x=1794771223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULPlCRcRnS9OCU3V953l4VzKGw19SLsXrW05Cs1Xiyc=;
        b=mtOa84lV0X4ZO8YAab//zjLblKzxQt/m+YKJJxQsRtRneOuWQ6rGH1Ule6oLLEJTxd
         mT2nnISRervi/FttHEtatNjx1LIQXxORgDQlPY6jyiT5hhbhciRSsNLUzAH3WD510vG+
         ++w4H9OHKGivG2iLpR19f/YDZVH5UoYlyQW9WchFalIWQo8xRvSUxZWsr/m3R30PcWfg
         cCao0hWhMusDC70JGICtZS3pYP5/wC4iilosQMKprHkRB9UpxEOqi8CKLbLW0CQRGG+O
         q5oekrvapiEHuwjWK00e2W45GxJGLhw+stK5w7dI98crVihIX1nYjHTKHENvuuAvT6eX
         edow==
X-Forwarded-Encrypted: i=1; AL+hErFRva7bcEhBAzqA07WOfaOkWLYiLKnuhaVecUDMs06T9+GzMKmptLDX+xn+box462W1MK0Um3izZEKK/UM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zSj28lKglXQf8bADAwtI1WtLibp+fT6D7PCL9TBIafDSuNvNF
	0Pf5WQn6gVGQKhMiDf3nSoL5Ufj7y2iy2a0YgGr/trg7HZmzI0kWVYKl
X-Gm-Gg: AYBFou3upDLLSlahhLWxc2D1NlFzYodvrxu1TcYmfd4zE/qeJ7Tez36al6RH0JK971b
	pdCW5rUEQGJo9WD+rKhr5Bk1hm/86dt+EFvXmK3NV5+1bbWb+19AQbekFwur/w8f4Xi2PwOdbGe
	LCdKmDyxshfVVAwFurWuLRqIAAOV92MMmcyHMnOAq4kb0tHnt/mohaxRVk+IhNA+v0y+eo/hQQQ
	kWfjmkBjKouq7C0nw3J0NOtcdYFVkpiBPz9PpmZnm3OxRxY3ePvs5h9B6aQPowzY2r5ECfgY9r1
	h2WWHuVOL+pjajVV88X45McfextLr+1WOlrO4LHm2rURDM5P941TCIh2guaTywUQyK2GRlPRCsj
	+un6Vab1rZNcsHVMyn1pbV1FpQm0ysp95YtdiVthge0sNBUd2yRfrIOwPvY1firyC22V3flaEeL
	MskEhYHfMO/qdksU4DtwoDQFlCzMN/3zAsY25xLZyG7IDTzFxySBIn2v4XQvwSPoxN9DxgFt3QE
	vubLZqB6+t/PhpkhCJ8/apoMCGNZqyMZyzxEHQHQhVEilVokGw6sLz7akqGHhWw3mSFXCdNQl87
	Mr+YE/Yvzfa3WbyIDbuKuQTY+5zhJZJYmpRHrp/92g==
X-Received: by 2002:a05:600c:8b34:b0:4b4:49d7:bc25 with SMTP id 5b1f17b1804b1-4b963c6d78cmr39472145e9.21.1794166422600;
        Sun, 08 Nov 2026 11:33:42 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbfa121sm105422115e9.1.2026.11.08.11.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:33:41 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sun, 08 Nov 2026 19:33:12 +0000
Subject: [PATCH 4/4] drm/ci: drop the kms_plane pixel-format xfails for
 vkms
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-lut-v1-4-f762d70ae4cd@gmail.com>
References: <20261108-lut-v1-0-f762d70ae4cd@gmail.com>
In-Reply-To: <20261108-lut-v1-0-f762d70ae4cd@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

kms_plane@pixel-format and pixel-format-source-clamping are listed as
Timeout in vkms-none-fails.txt. With the per-pixel interpolation they take
160.1-167.8 s and 78.9-83.8 s locally; with the precomputed LUT tables
they take 9.70-9.84 s and 4.87-4.90 s, so the entries no longer describe
the driver.

This patch depends on patch 2: removing the entries only helps once the
subtests stop timing out, so a job that takes this patch without patch 2
fails.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 029bd4956e85..6ebcc7d89fbd 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -16,8 +16,6 @@ kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
 kms_lease@lease-uevent,Fail
-kms_plane@pixel-format-source-clamping,Timeout
-kms_plane@pixel-format,Timeout
 kms_writeback@writeback-check-output,Fail
 kms_writeback@writeback-check-output-XRGB2101010,Fail
 kms_writeback@writeback-fb-id,Fail

-- 
2.55.0

