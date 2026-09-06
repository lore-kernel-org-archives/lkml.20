Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE63C8731
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 23:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788737823; cv=none; b=VPlkKshsiFPV7zHXinfFWjukBLzeoTOe6Pjr5KuM+5DpiAkAjuRW6b24+9ucEWFv1NKJdjM8po1nEKBF+rJZdnSrzjYzbFpbqHvyUTaSe68XynMetrdoBwlbJNqPXb8PWq62nW5GKn02nbrdW1DqDJRU293dttS29n3eq8QA498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788737823; c=relaxed/simple;
	bh=VwdjkhJUERDbpTJXG5pYZi5h6l+l4qUJaG2B8hCrLIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TopaBbF/jz7E9tEREC0hMLqxeQQJNrtlmPZ8uv1rw4JU7lRtNBQJC2GruY1uQews68Bbo8yaUzoBQ6MPbpugKSiz/BHduwhUYoZ6OBoJqMY5niOxy5ki7qAt0ucQZb+Ku1uirOs1j5JTtB8LyuRJep9Zt7HwgdsrzUq13c7iUtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMAlwXH8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMAlwXH8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so22178675e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 16:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788737820; x=1789342620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QH268fKTutlZ+SEZl6dKiMb3/rt7eZwRApzVk64JhiM=;
        b=aMAlwXH8EF8ZEKoGZ4V8NYyYksnG0LFTb7zJklWCaFQKOU3mUueKf5eYji/GUGSA52
         RwGZVS3IsSoPyEsnkXjFs1kGIeS8NT/PIO3meIwGb8gkPyTEp0TAIkT42K15Mem+yjyY
         47frq8Ic7u0H/oyac+6luT/vuD6jgkZTpfv1KNwLUDrOa9d4uj1A1IgRJ+0rxjr/640U
         c1HaS686c9sYZ6r92ZFQiT7V9lusSssI2xUtw8hh0+4Ct28A0aYSF0llyNw2UFzmRU3r
         zwnl+nB/JO5iQA4yUMTOEg/FdavbDX5E0lMmh3xIeXOsDzQbbnHWayKo7JypC/oRKGC4
         FZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788737820; x=1789342620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QH268fKTutlZ+SEZl6dKiMb3/rt7eZwRApzVk64JhiM=;
        b=HtWCs2gRlcwtPeZKUI0Wjq6/PBVxsduHfqYImEpcBvfHU9Ix3lO1X77Q7F7KDDbesS
         xdnBEBilYWT6cQK1av4dp9rvEwsSpidoiM/baDUXcEyZjAoJ1v6EpLOkT9Rn+EpmyT2K
         ySJVD5EKRqDMhNvCTX/2WiraWsPigPSYJyDyCgxrMrM/n+bqA5FUfTCK76QSn9jGsRcS
         NytnlghBxlLfFf1075Jh7r0DW3aiTLseqexNHOvhCagtViYOsakLZJnHVzk8wCtoqrC7
         /X7Ht6m75fiK6Gjuyfe0tPztzfBghMJaoKvJGmzXDvFRLY/UWUfgZ6g8iPMruAQpXq5P
         nU+A==
X-Forwarded-Encrypted: i=1; AKwUvBwNa5Mq0YiQ7LKkTeQy67FwpqQXsq+W6UhhHBuyKiIP75zlZuaOsS9JTFlZt0ZhdUGJxjHm+Pi2Qzj9wPg=@vger.kernel.org
X-Gm-Message-State: AFuF++l9rO+yQAyvarMZrjBQxYvnUYVnKVvROzZ7lHtgXSiUyQoGRAVn
	OgbweG2M1boRTEhMi4byKitKBMJYOGiFMBh3CyUMK7GMNf5opmMXwoYK
X-Gm-Gg: AYBFou1HyjEH2vADvTBlLCpRxNn8G113zv14IDqdF8ke36yXZoSjTdGkvVIQP23o/wJ
	f9ps2BI23vBfb5rQKOUf72ypDe+j9TOTqtrbQssLCaB+3eESL0yoR8VwKbGsAw356nLWM5+nFiR
	D+k5yAZ4ibmt7Vjv1tJjWBa1gfCm3/g4mB7msqQjl48665pTttD1h/X7F7fmb5M/4raCGMyFejV
	Pzv8W480z1eypVc7V+4zjsiFQxTZdhq052L6oNNR9V48obxwIjFnCMgbjXIsnYWY+83FRfPY2e2
	8YzX8gf98BsZ1kF/s3BCeQEzrRioWO/FfJCvNVj2fSfGspw+FxRCEdDYfGlF0ISuR9HpXgbTvwQ
	obtpidQtcj8TLWB1mwWLzGGKubySrAJog/x9mUJkS25BFJNG4qP4wNv9OhxjNzhl5eL8Kq/YMjD
	im87nn8Z53ATrXjpm2ITSI9zd/KQCQzH+zPPPheBZgCpSC7XTKt7AHwl7Vka2m1SoTnFA0h32xo
	uqc7oyXSWIebxJv49xR4rhUkkJppLAL2/F2npHRbcZh
X-Received: by 2002:a05:600c:4713:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49cfa20cd4dmr179163195e9.23.1788737820043;
        Sun, 06 Sep 2026 16:37:00 -0700 (PDT)
Received: from arch.home ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm463602345e9.1.2026.09.06.16.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 16:36:59 -0700 (PDT)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unneeded else after return in enqueue_reorder_recvframe()
Date: Mon,  7 Sep 2026 01:35:43 +0200
Message-ID: <20260906233552.971860-1-gawindlin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In enqueue_reorder_recvframe(), checkpatch warns that 'else is not
generally useful after a break or return'. The duplicate packet check
returns false, making the following else on break redundant.

Simplify the loop control flow by using continue when advancing the
list and eliminating the unneeded else statement.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7568fc514d7c..498c7273f273 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1782,14 +1782,15 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 		pnextrframe = (union recv_frame *)plist;
 		pnextattrib = &pnextrframe->u.hdr.attrib;
 
-		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
+		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num)) {
 			plist = get_next(plist);
-		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
-			/* Duplicate entry is found!! Do not insert current entry. */
-			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
+			continue;
+		}
+
+		if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
 			return false;
-		else
-			break;
+
+		break;
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */

base-commit: df2908090cda368b01ff43709f51890076c56157
prerequisite-patch-id: c05d9c90e8d4b20dfed666f3512e0d5bc54e2f2c
-- 
2.55.0

