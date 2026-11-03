Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695213;
	b=d88C4kjqXWzrFh1gehfbqMdNK/2xam+8b/oFGxHpzXHIAA3iETTwxmW46ME2urTWXKz2
	 IVxgGgjEiAzjCVOKnh3DY0G/oRC2t9UdVU0xxrpzxl5ZMZBGcmq9bzWtqK79j9Ne5Ud3p
	 q80a26SsZZAPv7e5skpD+ACDv4PmsmsPjxSe+f3Oke986ycoJwB9XfcZtaLUpxsWPrzCp
	 sBz0rNsKaPVCvImN1+lxWxESWlTnfLvqynX3ciqhDmEeURwC3/xgy6YWzd0yogIPVwCHh
	 G7VFkvf8uzNOjw2Fd+esM9GApHx9eF5TOGDalQADKbYuNiU9lfZrwjkso5f5JHp8SPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a9yCqBKnWEF+1G5GJ+rwV3M7Y3WdLHInlO9rhMJ5y4c=;
	b=MdLA3JpgcYbfbmyPxTFk6HwXqpXMA/UTfFNgD0fiBWddrK5cTE+zzitByI8v8gXx7ion
	 wwQSD1tXoS4a9emf/rmLYoRAWol8lcO/YAKaP/qJwW6TbDHYhCak9JpvenH1xZyRlPOrJ
	 Xc2Hqs1f4fMNFOmks+RsuvUtJCQxCdwQxsYmNflfqCbf67J7jP4gIKwgC7R/hwBX3o8rP
	 IlMJFxXO6iZq/4YkGYjfLJDMMej6smkODqbyZHu5u9red1P8TLw64IUIoxFn/2xKGxPnG
	 Ku0MAHj0yH/dvu1ip3pPnSzvaPqvbxXsR7AWXVYejHqEY/DNCbKFIryJsdgIPYvj8uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emnUrVjb;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D70606A945
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D70606A945
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emnUrVjb
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd69ca84740so1886579a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695212; x=1794300012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9yCqBKnWEF+1G5GJ+rwV3M7Y3WdLHInlO9rhMJ5y4c=;
        b=emnUrVjbx+yqVPl8qY0qZedVuqj89xR/f3P2zuxfZyEuk8ohfEMNptICm68/DDqL4j
         SAU1Y0xTV1/1bHY8BTP3Na0vo2NqHkTuaac303hFPN9rN1OqR/WsYukgsvODjYTcjfx5
         1y/+x0IgoOuKztkGTgcKZcC4uV8006pHDdVZRF0oluZrSDzYHMxX0vJpyDtXO0c2ntqN
         DKSWggRJ4cxYY1jkiWW6UdVVghKuaRGyCxKZhaqMbLZr8U7hoSgzWopEIntChbOrBzE2
         zBRH0OxwF6y7iZtuSf7bk9gQEY/13BtRJAu20Vne4JAjHpqvctD9Pc+G8SeE2q1K8qhC
         5FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695212; x=1794300012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9yCqBKnWEF+1G5GJ+rwV3M7Y3WdLHInlO9rhMJ5y4c=;
        b=ZhPOOrv1kyfrhnKOECQTjdOTVGTSpt4ul6nNyt4bMoUUafwdexCVLfnbUt2P4ClCed
         cpRPIkl7BTygEXqS+sJmqvC/La3lPEhdSkgINhw7RY/qjy/8TET2aFx4aYTLJDTaJWoB
         cc3hzZ3hlTbwzwbK8fj6kOIIn7t84mRtdJwGAQZ6fqSwWT/krFIslmuJ83iFJCb1EzvC
         Qd1yVijJDVbRnINguTB4jbovUf0UX1qlfjX2FL34LR0rPl8Mh0MoSZ2VG6SpjOXCEfyH
         3mS/jDWvPGq9bzOT11ovF1jQZe4PdZ1Q5VMn13q9a9UjETr18V9NLBt2/yyWh/eamJav
         yCFg==
X-Forwarded-Encrypted: i=1; AKwUvBw9WylNyV4tWMZBy7GlT0h9eo/c974VzW2WxLZx9s4XIsr7e1OyYom6frN70PXnXaXksuDWY0VadA3acyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JwI692Dkp/Dpuzc7oUhKr+b9tsD843X38yn4pey20rJ2ShEmy
	mXcUrrjW8trDNMRXxTrv424HG03Y6hUHXUfLasV3Xrh5NIGkBt6JU9oT
X-Gm-Gg: AYBFou3qlFGhjc+b04GMEveNB/xQ8kvsNFYa7t3KzR2aw3P9S7UmDZSpnW9hhQwHIXy
	Hs4X1egGE68CPjsq+Car/Ctol0zfPwSRhCG1wJLaHERTzNCYpnRyQNZjTXwlR15ULVurdOmkxEx
	fyaB2+JtQqw4G9oXzoxuyRYouuLK4xpKHilW+HK/1wtyVnxgphk3vK1Vx/iEbL9Ug1Ock5JMfCj
	LoPQYXxiPRNxIgOoqP7HJEf1+iqfQZ8NG10xhtit0i5X7xdUK/ZqsXTH+zhfloTXN+lZTSSry+b
	vcJ2CjusxrZZ9biSOKbwDiWETQ/2Y+4zFaHLP6csYqyux/HRSXJvulLiBS0nLnMpoxu5r6kcsE4
	szOKvFi6faahvlsI2H70ekjtlH2v4ps1RBZWlkBUutb2yx/SMfZvgiD/f63sil4f0r++Lze6t20
	ZCTSy5yiJkM4z7T+WroNVN/uzUJWOP39fzmaodfJu9sjDN8EnJXf8LKJJ+rWulcIg/WdbiCQBGR
	oB1KoIlK/XhnbeVbGaLS+7+C8baW8Qe3r3FlnlYPA+eCLSw4upNqDpp0mR+Eck4DxFEe3sWElx1
	gh+UPdcQiTFIPzNgSpHreeq+f+OhdmwSRQBdtglBj4dZI3aJ+0B2R2aj
X-Received: by 2002:a05:6a00:a0c:b0:89e:724d:1ae3 with SMTP id d2e1a72fcca58-8a9ba2299e9mr10800761b3a.2.1793695211896;
        Tue, 03 Nov 2026 00:40:11 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfccsm2998833b3a.9.2026.11.03.00.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:11 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joannelkoong@gmail.com,
	jamz@amazon.com,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fuse: clear the old EOF tail before writeback-cache writes
Date: Tue,  3 Nov 2026 08:34:25 +0000
Message-ID: <20261103083425.55695-1-dennylin0707@gmail.com>
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

Buffered writeback-cache writes go through iomap_file_buffered_write(),
but do not clear cached data between the old EOF and the write position.
If a shared mapping dirtied the tail of the old EOF page, an extending
write can expose those bytes as file contents instead of zeros. A later
writeback can also send them to the server.

Clear the gap under the existing inode lock before the buffered write.
Use the same page-cache cleanup as fuse_perform_write() does for
write-through writes, leaving the write range itself untouched.

Fixes: 4d99ff8f12eb ("fuse: Turn writeback cache on")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/fuse/file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index d5e1cb53d86a6b35e63ca31b1065068ea5bdb6be..1c43c2f58e0a127004d74f3a28548b20d3d8a013 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1565,6 +1565,11 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		written = direct_write_fallback(iocb, from, written,
 				fuse_perform_write(iocb, from));
 	} else if (writeback) {
+		loff_t old_size = i_size_read(inode);
+
+		if (iocb->ki_pos > old_size)
+			truncate_pagecache_range(inode, old_size, iocb->ki_pos - 1);
+
 		/*
 		 * Use iomap so that we can do granular uptodate reads
 		 * and granular dirty tracking for large folios.

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0
