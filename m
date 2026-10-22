Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697713;
	b=odS8zkVtJ7ziThlC70naIstGoWi+XLIuJAWqobWIoRN0Lmk7uNju23kpvj7m4XC3w4oU
	 9MKzm6dHWbNFd81t7PIGe01tYlIuzMBj/6E6l+0ts7ZeT8V4ROHRrZuj0eSWTJ48DClQJ
	 xzeK1Hq8n8ZHOplCt/DLXqaAQwYsAh+fj8KX22AA9k0f71IDnIBoGvJtzJvAuAWv/X4Ng
	 1tlwxOzP80uR2ssUgQpIEk8uhV65okYzyXF/RPuFiVL+Xq14s/6QIqcS63uHJoCzfXpd5
	 yRyPg17jIYWRacjEZsgJk8Muwz6V+LjIrdTRQj4BZuXXW/5dNIFlJHF4/+uRvVstxdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z1EfijeQewP3c+Gff9BU9n49Kow6R0+JcO0yHhp/Z0k=;
	b=saqozqGoI4tZOV1PwHjnQV0YCLP2apwq0GV+QgiC11qc4M74ymD/xHMfQsUMrfPqACpf
	 nESNKNFWOwxPzTEVLNIO34rIV40v77wL52lV+x9kw90KIh+2iiRQGqQ5RFywxuj7YQNfk
	 DrK6y7XWWzUiol3iUYcjX1Hb2j0ubjzZrN6GoUkB7d1FzpxffRKBC1DxOTeHGO1phVjuG
	 IgBrwo6kmvGNUZKkqwRCWzTv/icEGMtaTP9hCRl24hfEpqcDSkmSWfHumoFdNA815rrPy
	 xC6TwEDTPXmYhpBeIhQlqIm5fBjTVSDiywVLFN2KSIl8Nmtv4FZdXyhcDyKxZbGhWtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vyf3PV+X;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7422606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7422606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vyf3PV+X
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8b20a899fso548295ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697712; x=1793302512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1EfijeQewP3c+Gff9BU9n49Kow6R0+JcO0yHhp/Z0k=;
        b=Vyf3PV+XJiyxIimnYGsEiYt3bfjf/ylwjahvC4TRFbN4GYfKn9prPeVJmzL5av1YD9
         KdB5viImCmVz234HVeBnHg+p6JRYfIuGhhlEjFADPvE52COdURf7r1m8QzDYi8mNcxDQ
         AJIaHclX2LxgQw4XZ7kla3nZ6U/AAMlSoIxCaZJtv3qgAzMXLuAYEVAtjUMURK9xgF6w
         ztguhxExvgBzDkniSXt1+AHR/rvf4aGsFQXkYRMtNFgV1VffGPBw5o3kwGIIZphAjLp8
         YIS/Cz0xvrANkcvsJloYjEA4O6UTTtoVSN0fvR56xG1/KZ10PRFyyZr+miDYjhC/nEN4
         ISPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697712; x=1793302512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1EfijeQewP3c+Gff9BU9n49Kow6R0+JcO0yHhp/Z0k=;
        b=Ca5wEexrzMSzN3sX7z/TyEne1YyD4PbJ5YPkq1yV0bqVwkI2CY65TBWrWNM1gsUa91
         iwVpZUQgJslGNNmqODOHPrxVefZhTff4LcM4RxCEvNCXu1yFqEnMsaB0Q6NAK5YOkBIR
         f8R63+e5yscVbA+q4X4AcXYqbbtZsz873y16/XaV0a2/gbVBwkcKwMlabS7qaMmc9l4j
         CgRUrld55zMwB6TxuzImnoqqFYvCQDXI/cn0oL3UL7RHgecMBeL/tVCl0dMvcgPRT+qC
         axzQVEb1c4fJS58+erO3dYiFtqHVf1cHmuZeiiPK/3MvsQ5gU0qw1Ko8EY7zMEET5U5b
         9hcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOII0JEklRBGBacZITBx8P2RNDlDdDi9pCvY/wU/AIaQw+1FUHbTEATRNzECtVJ96KW0/Z27GuPDTC3DU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIZ91DnH53K3pHcTO1L61/jMaNaafRT6Mz6HUTftswt5BTmhFH
	avVCk+g1sd0YgkpM31qSa16ZAMVnej5yUeWkX3ms5tob0kBgweNMTHXFeaX3dTd2
X-Gm-Gg: AYBFou0qPv6udgDBz4xcokuHvSuIC6+5NdWYdrVMsRS83QpGz5hBppKzrlqou8eF0iL
	E3fnOSmkw42ZyTlespJnr3RoIh10uvPb2E2jdjFiMzjgCxziB70nkT+y54ocRN8s5egOO7aoeUZ
	N+QkqM8R+ssc2fjkYVC+xwv28oZOpIBYiCXJzIVYAQHx3a3PNaIKAR0JKB2stZPSdH1wql+xtfu
	42upxPJdiRXHmaLMiPmdIbEGfRk7SaODLJREPOKvdEQl7QBiW7ojkMBhfu0NIMzazE4VLWwBXhD
	DL/fD2AhG/hkCKRA3oSt/c4dcIBOXNvFlHLcOnrns3IBq/LvWYVG813ZeE9SlzeqpqRHINnTqbo
	fqx56fYIwoLabbRZQC6A/qDCxP4cuayEOlUfoTPgDi3a475ZtZS2tTaIcAPXFdn+DK1r00oMvGX
	EkPNpLZt0Gea7ZZBlvXsSMVCShiY0CI5s7rdjQgSrdIfmvN4dCmEUgSvJ0rdfIfMWZQ1cn+3p8J
	7e1BWEY9q/W6ORyzwHSqyS66TiCJJ+s/INnCk9BN7SsW7G/mVs0SG0fVx5Mix8wDgNsTNvnpPrD
	tjCPRknvN0EhHPUPzunoxNJ8y2Fbl/dH
X-Received: by 2002:a17:902:f791:b0:2e9:9c51:7b8d with SMTP id d9443c01a7336-2ea7c320747mr3397375ad.36.1792697712275;
        Thu, 22 Oct 2026 12:35:12 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6eec4sm2564435ad.6.2026.10.22.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:35:11 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: llinux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Subject: [PATCH 2/3] media: em28xx: clear v4l2_dev.mdev on media device unregister
Date: Fri, 23 Oct 2026 02:34:51 +0700
Message-ID: <20261022193452.12966-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022193159.12713-1-neganhat@gmail.com>
References: <20261022193159.12713-1-neganhat@gmail.com>
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

em28xx_unregister_media_device() frees dev->media_dev, but leaves
v4l2_dev.mdev holding a dangling pointer to the freed allocation.

When a process closes a video node after disconnect, v4l2_release() calls
v4l2_device_supports_requests(), dereferencing v4l2_dev.mdev and causing a
KASAN slab-use-after-free read.

Fix this by setting v4l2_dev.mdev to NULL in em28xx_unregister_media_device()
prior to calling kfree(dev->media_dev).

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 8440eafad44e..40fec8b025e8 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3776,6 +3776,8 @@ static void em28xx_unregister_media_device(struct em28xx *dev)
 	if (dev->media_dev) {
 		media_device_unregister(dev->media_dev);
 		media_device_cleanup(dev->media_dev);
+		if (dev->v4l2)
+			dev->v4l2->v4l2_dev.mdev = NULL;
 		kfree(dev->media_dev);
 		dev->media_dev = NULL;
 	}
-- 
2.55.0

