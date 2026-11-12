Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466582;
	b=ImD1A9d1iVCtx79Cc1HslDQnYcl/6xCdwEWdvUQZzogNIe89AnabCnYmQsYCV0HlH7gS
	 YArThouagFq3oDovxPmfAnuhDLBvCElscQiBGfe3Q1zwa8H98KSc8w5brx/SagBKITWra
	 ARRMUA5UC49RNKuC312BvK5eOAuk9ZkqfF2vqjeDTKfFHKmB9mOu75OQkFsRYkTQZXhDY
	 F+Csq8EInvAuE5UFZZeSDpSjehrwKhV7wqtyK+ZlyJBVc00mlZ/7EFCdfD/aqXyubjmPU
	 f1CcsKoFXV9bwSKxwbSdMLWYAoTVTf6WwLGhCytGq1Bq7Gkv/i59DALgrax/DmqaNLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZG6VhCuHtrCJJzccAUt7IJkMQXU/fhnJBTGZBLb7Mhg=;
	b=LMsyurtNYjUZlbA2VUeXmLS2jgMZScYgAVp6U4OeXq3oQ6JIpRzP5XzbjLZsDUB0dT0k
	 DJ6mfVN2jUfEJVWZteQSqBFdkdzftW2T25d70+lzb6n5GVSbN91IfNUTA00FKuZ0xWkQm
	 9MNQm0VR/caUW6+IASN8u1n42v4ojCa4M2F9P8wYUK2wYaXsR8sz76K3AA2bz6B9BxnmC
	 Fy2Z3flcE1YFg2rR6+RFyXs8ZU/SBCqBFF8O7+RRXn+msKdotonRqxHPv2Qr++G11aGg7
	 565vlzFhSckymU/zfLIttXgBKgDkWNImbcJ+VIRDOiW9mtAcf8cDdPxLFZ+M73YP6NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfrR1tH4;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FE5606A898
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5FE5606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfrR1tH4
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ebec7d5dcso28138006d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466581; x=1795071381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZG6VhCuHtrCJJzccAUt7IJkMQXU/fhnJBTGZBLb7Mhg=;
        b=tfrR1tH4wMon/iJLwE71zZ5ygcvlIRUqDsKCDxPD8+nXPK+7SbGjbpUgB4ux08bFwR
         kAedk4D1uytudKaOMM6K9vzrVi6TLbJ5GhyrXQeYI2kr4NcdaR/5c25OG+YH24qo4fUr
         CJ9dmIBr2gUuhlrPGg/3BUkOwNKoiVO4NHlC+Znl74NmN8uKi88uQ3w8HXwgrGyZD5vD
         jvIMF6xlzSNGLH8Z8sb8gNdNVzlC3rYRQ6QlbK5iUxajt0f9WYdv2I0zkzNtgxtovI0x
         4RznnMrCmGIK+8Jx/YEru48Hpp9cV5P+05YC6Pe0Ks3xVgudX2sabAVlzHwPYGEsCv1p
         MQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466581; x=1795071381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZG6VhCuHtrCJJzccAUt7IJkMQXU/fhnJBTGZBLb7Mhg=;
        b=DnJLfknqKmcAYlYFfqyaVc/F5D1YNiLILiNnaDky+nHPMXbDCTOd5gIcULjUwTNdD4
         JlfHk3oI9HSmIdKHm+KiDy+qAYnje7lJoVppcRbuFwsI0mZr6/A29/lsS0y+l2njOzSu
         h5eJfXpukkSzz/4vMGU2zc+LIU24TJE8wKPd9mTpcWSOsFmAvbfyB/fEFnR2WTSN6NyX
         Ygv5nyV0YRIxtyMoCVAVZ213oXKXfSnbf66TaidXI6CBfBncX522G8+zpdy0ncW/POiz
         f/9SwDKOX1P14yMQn4f+B+6FM1cVeGjOEhEUep6wXm2ppj/fKKWLCBAnNRbUO68NizdP
         7gMg==
X-Forwarded-Encrypted: i=1; AL+hErHJvWme0q6I/ugOfclaWMqBhPoOo/D99qkfFG8bgM40liFN4F0cvyXUofvQBJejss61apB4BErHlCA7rWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DsX8uurfafYbTHn+pKXNlt1cjqZ/IlaO3sxsuwNZDjBj25z7D
	g58LSR653C8LbCZtIJ/2Y+hfYvLbpjfPVtp2T2dvtyjRf+dmyqPW0CQ=
X-Gm-Gg: AYBFou0rezOpRltDSIbN8IYjDf5R53BlEkmQMs7WLc8yfiJWCT6b1EUT4qrpVCrdvJR
	ENmVrAPDkQXNdr7nXxYRDl/YpvlKi1lIBgAEykhvg2qHfsIRP9dXHXBk5U+FbeVgYsqItE1oyh7
	oxS8Pu7MwuEFsJzqDQvoJMEb0oj+vb/rM5p7phrAhC3rw8bR19cBCbpNgpBTWSZxEv/6wL6IACI
	zAdjsdvd6jLYHTW+qBngtZ3X2aGTvIl/JuBGu1LlGxR4H4vq0hYDp4bq4aIB0A5UOapIMCihev+
	6uf07WRTL3W0HUEWYVi4X5YrUvdZPHFv5vUSsKhGZR4/Zony/7/xzkkvyr6gpLSZ/YL/rNqcwuD
	Bg/cXSSGwNPiGsLC8XpZPM/mlgWI+bvu2KlZ2+IT7Zydan4wBbZwf/pnMleyD6qVw1Gi15vwtHQ
	1Yo49RIjhb0vQ/DT2AtylHXxrDYlSvxbyqQzfGdzdtiLCw3rNT8qFqsuiGdBIs9NDkrRu96g9Ef
	dxu5QtvPiDzrUTxltU4Gc8VVSIudI2dzalSsDiVMtZhC30NQlffjgvj+k+ank2PVhjlEkdeEOac
	t4O26FU8V2g0WYHukQkzzdRjPhgps94xaCWiM5dR0rrNtIVJTxuKQrCcMOdS8Y+8O6EPy2kPZk7
	/Kqzm6Q44fCFa8buEbp6hsBN3looJUEEOQFzKaoqgIA16gskce24cqiqTx//6BnxirL9MTni9Ak
	6PpHg1SRSK7xgkmdwhfD0q/u/7aPwrp+WL
X-Received: by 2002:a05:622a:34b:b0:537:8400:ab71 with SMTP id d75a77b69052e-556c04f78bamr79867681cf.39.1794466580744;
        Wed, 11 Nov 2026 22:56:20 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0318890sm63824076d6.4.2026.11.11.22.56.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:20 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: ir-hix5hd2: Disable the interrupt before freeing the rc device
Date: Thu, 12 Nov 2026 01:56:18 -0500
Message-ID: <20261112065618.34238-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

The devm-managed IRQ remains active while hix5hd2_ir_remove() disables
the clock and frees the rc device. The receiver may still be running
after open() or resume(), allowing the handler to access unclocked
registers or pass a freed rc device to the raw event code.

Call disable_irq() first to stop and synchronize the handler before
clock shutdown and rc device teardown. This must also precede
rc_unregister_device(), whose close callback can disable the clock or
reset the hardware.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: a84fcdaa9058 ("[media] rc: Introduce hix5hd2 IR transmitter driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/media/rc/ir-hix5hd2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index f74deb408218..e6770588399b 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -344,6 +344,7 @@ static void hix5hd2_ir_remove(struct platform_device *pdev)
 {
 	struct hix5hd2_ir_priv *priv = platform_get_drvdata(pdev);
 
+	disable_irq(priv->irq);
 	clk_disable_unprepare(priv->clock);
 	rc_unregister_device(priv->rdev);
 	rc_free_device(priv->rdev);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

