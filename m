Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442030;
	b=rL0AtGLFxHbFDogrCCXyKIiGFHOM45XPFydXpF6anjwznD35VbdG/XfQ/dRS5cigkIz7
	 ysYvGSG1qWwCjFyFIzef7t7zFdTC245DKTO4aXlP8G0PFptzr0Dq15xkMMVD/LNd0cW6h
	 rQTrsZTTywBUldoVNlBW1iJ6Y/GcMzYXAMRd9c4ykmlFKU0MumxMDsGmWZk2RKsb6zIpC
	 xT0bIjpYlKCjyH7IxRptzxn6ZPBoa05aSI/Hb+RuJstvhO/EcGZOGp9FVMu67E+ds+gQk
	 O0oLDtEfA38IhjcVWQsl7B5aJ6N/DoqctOSstizV62nKHA3LqXdXRZwDi8+hqdabN7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KiP4+9EUfnZMvYjmy0GTyuqZwSwHrcUNArwbkHdqfEw=;
	b=ts55qSbRfyvVcZVnhVfxWFKO1RxEjwk3gTdHfAfU7z1NZzxuiNMYTD6DlA4DPqb9Tpgw
	 vw3Wu6MloBqPks0FSeLAnx0xiQTlblN5tP3sOIPTOODGVDBg8OKajglFtYRFYlHoTS40a
	 ak3wBJnJie5JQV0gmBbnujGc80UB59Il2ZqaIdAb9ViQVuYWHptkMcWn/RjylYe/uJhWP
	 yrU3hObY+NH39piS0SocNc8snjun3f59fJhFx2Xay8ijbpnne+3+F0s5HSYCLnnlookgl
	 LgouQKvV3iHR763QMwsqtVoFv17ekRDa0Ac28f+KJHhKoj24j1hB6Rb3673DcrKtwlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4VEQPuy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6DE606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA6DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4VEQPuy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8633135e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442028; x=1794046828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KiP4+9EUfnZMvYjmy0GTyuqZwSwHrcUNArwbkHdqfEw=;
        b=C4VEQPuy8WdrQGNOP/fXwJ58Mf+GyGL7LGD75bURVKa9WX5s+hTiCTMtqbJLSim+y2
         gbWvzXJhNS2Tx7cpK+JBR48O7Gql5X70ewXNWfOJh78mgudMqnh9AG+z5SuH9tXYxP+x
         dqMZJmmgUDejXZJAsD2oDlzs0WALO6faPkJWlgWToHREXyrx/PlDMjNjW7sK0xpDVEf8
         9xrVyvU1TE58fWe6XHYGnRBVg5ZYx9+Mf7BMa7l4nc7WF3cZ4z3Vhx0FAR+v3oBkCEJq
         p2t00TwWsETVbYFhCOT7sLjbvqNyOsIPYx3YleGgSH8AOdDG+3FcI96n1/SQ2ni0cF+2
         phQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442028; x=1794046828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KiP4+9EUfnZMvYjmy0GTyuqZwSwHrcUNArwbkHdqfEw=;
        b=06f+cskHtCZvp6Af0dGSU/42NBkoWfyrrlaCP2REcEVfqREskbsvAA2dxwMjWeaxNC
         fDrR7s0I51BCIfiB/pc4rfnyqm2Zxix29c8cOdoh32CyMmITqfuMaLBwEWyizfiSQQUK
         JrgAMXiv5JDIGUByaz+FlFj1OaFixKo7RdCQR53CWnalOxuekzVR+wvDe84yWNoLhgM5
         ptLEyMp5T2ioHVTGtQuxpbvF+3Y3TlMC4k6tlliOU+AChyzVK8lkctqHl234No2dopZA
         vSVD8O/Dxvthrfb/iAuDRGjpS+Qv3PQzV8zkEcySpHrkTJyBIjlbhNOdd91x7jeoOUdS
         6llg==
X-Forwarded-Encrypted: i=1; AKwUvBwBHufWDy3gZ9a54qUV79jslYsnL+4Tr6vrwJvwYurQtIfqBw/f/eULiBCwr2ZitlefLt/hQDsEYnxgmwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYICVqOblbZbrpdKVa9NUSPKfDLiwmX1XeNzDRKhfD13gryYWiEp
	YznrUlMYyokU6BzNmc1+tw9ggRqI0+e2cnlin+OZmC0nUJKKlTFIsgaM
X-Gm-Gg: AYBFou04qIvoppxAKbXguGwgadAQ26ptRLrtEQltOY0M7y5X6H8J60r4E/lu9G/qG8w
	FD2fVhyjhaJtmK1JWZqyAZUMHdayq4oI+UIQ4fnaY03dBZS+dVuznlZLnhJCaHJrphPonbK5kZM
	9boFpherAu/xc8zBiQW9X36x5W2b95q/EK1lWw+obhonpZ6Cjz42ztVrp4KQaDBIgQ7xMd67phL
	VLtnQcdAIbo7GJihhi+8lNuMgJqK9emESQYM0pzGKWB7t+XhdtQCvWoYX1BhSSuE6SUOyeo2yVc
	r9v+5jhp1TK37O48+V5of7Ncx60VTJXZHhUzFwLTpQCjGbchw/pSPOlOIBJ9o5f3SbJba0Fgzox
	xXfamD1w0+IwM3jxuyaNQmSybMkk3TocmkSCNcvn3NpzZCeuvSHuahvRyr1GW4nEWKe5nKKHKyv
	iqmI5q0AtfbUeEQPFutFu94QCO0wVtmBmxB2k0FcTFZmRQajz6tFjeLtIgjj3n79/Fasr7F4YRQ
	C8OjcTMGUb5j7ehDU/5S7iKY1eC3XEKy9PwX6kRsp4dTwxCHZTtghUHhPhO9SjpKaLrL7UM42nx
	kogCpd8JFlrHJp+RDChB1wPtNtsi7GLpH8BM6PmF14HC
X-Received: by 2002:a05:600c:314a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ac1775316amr104580545e9.12.1793442028100;
        Sat, 31 Oct 2026 03:20:28 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b72715sm7628038f8f.18.2026.10.31.03.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:20:27 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	hch@lst.de,
	mkp@kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] block: report the correct discard alignment in sysfs
Date: Sat, 31 Oct 2026 12:20:24 +0200
Message-ID: <20261031102023.3644494-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

disk_discard_alignment_show() reports the physical I/O alignment offset
instead of the discard alignment. Devices can specify these offsets
independently, so the discard_alignment sysfs attribute can report the
wrong value.

Use bdev_discard_alignment() for the whole-disk attribute, as is already
done for partitions.

Fixes: 4e1462ffe899 ("block: remove queue_discard_alignment")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 block/genhd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/genhd.c b/block/genhd.c
index 10ca8b4d6eea..69204d44adae 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1146,7 +1146,7 @@ static ssize_t disk_discard_alignment_show(struct device *dev,
 {
 	struct gendisk *disk = dev_to_disk(dev);
 
-	return sysfs_emit(buf, "%d\n", bdev_alignment_offset(disk->part0));
+	return sysfs_emit(buf, "%u\n", bdev_discard_alignment(disk->part0));
 }
 
 static ssize_t diskseq_show(struct device *dev,

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

