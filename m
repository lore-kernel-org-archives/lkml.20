Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793076189;
	b=y/w6onDL2oL2S89jefQn3ERrGlbz6wlfn6C8GPXp97/89YJasmm1ZA+cadSyO+5iEETA
	 8RmW0P7Ns0GadhmHzSi2B+5IcSSj+LkTCKr5BZBPRcQGuMe7h+XQGYNqOWNVC6UhBP5Dw
	 IcMu65tvXM/I/QktbR0s4gUv5CY335BRPYnVGilmTu1Yig9/cmYyQWZF2i7n/UNi3w7jj
	 /Li+ChMiYom9owN4xMVkQld+1ioCPDUj2yf+XxMw64vnJj8jHe9ws5s/CJlY5KIFWlUgK
	 9/oDv6Q1Kt1LIbVVG6yqiycPthTkrlfLYTRojCBn9o1P8xY/UlllvCmEuNFUx+We0mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l493/u62eOFn/ZLxJ8nu4m5zc4vn7EZElFZnKX4PUGE=;
	b=zKkYgYDvwyRSGOIk5tB+DtFaElaRlP1iQdkYiPXrH+uTHLw8WT3mu6EyEsLRPbcOaLc2
	 HokfYZOKQZ7ptZY2hK3wCbnvq89GTjzXl/RmygQ2Z4yO7t1L9EtkcC+uFAhqi0WYamIS+
	 USsIOZUG27P243ELRkB6GJH+6VfHAWv6jDETnv29JrWAxfDZ6YczkW/EUdG/DMwphMXok
	 KqfzyTu84zVsn6XCMZDgDU327duBMwnzeyeqsxsgGnKQdPkA6cSnf6XZPsj+5cwm2b+Ja
	 4voCMuDMwENsfHEy22Eh4qvauJ+TRZKddNenRZYELenNW2sia5+pcyaiT1yI7qbQBbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JeHGCwrF;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369B606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3369B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JeHGCwrF
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35cd538de29so1837048eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793076187; x=1793680987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l493/u62eOFn/ZLxJ8nu4m5zc4vn7EZElFZnKX4PUGE=;
        b=JeHGCwrF+fP/PQPoKowlvInB8EI4BT5PYNSRTpXw3tQu3GOsjanJivxZABz3p++Xgy
         ccw5B/LxT/BKW8ngD/AjqXkUFsW82yNgTjw9b2oKmSTQpbVEFDtuBoT5NFOyzrYdZR+j
         JEWNW8XFAoh+jDX1BAm3/vFeneUF72zmmvT2/YX3EONJTJtDidPLeXtrUuQJl8dobOvh
         j/wWBb6see7HEUiCXtZU5J3Rx+uMPQoHn5imgoDCuDjs19HcGH5tMt8dOGmK2PN5vVlk
         P9c5kNaw2A5un93/FDYPgHFKfcdPyH8N6onmLrQBwQDs9s/SzQaAuE4qLtogg3QvCm+5
         Uu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793076187; x=1793680987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l493/u62eOFn/ZLxJ8nu4m5zc4vn7EZElFZnKX4PUGE=;
        b=swakHdARJy3Z2HT5AgEbLyvyzSvOHID8Y8c0NDqa7Cb5XPNFtjrHLuF0+eSR7hhOFo
         1Mf2fMkt8aKFbo71OYM5V1QkqCtZ+X63d8g6SbKTsAdd+XPwiQsMxxqjJFXpikIyNzHa
         w+Ag9ESmz6Hdv//WEys/5sCsdZKtzvrxltU5FKWSTTUrNEOHY/VEz4r1sP+XCkEbEcad
         B/oRw3RGwHvzl7WJYN9LXMfCvKo03ZoLQGyIEHq7l9hdo3UAiFrCjPMlk52TOO5VK8/G
         Qdcc/s0/aBKC7pjuxxDKv0E7dbAnac7AMlvTJMK/EB92QsvgmBBVF37Spkp3w8QajGSR
         hTcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeM1eb6mSGIFK8jHQOJwig+zJ9iMhkxQkR0icpuK8pFVe3Nj4ksV7h94YzRkePPrOMoB2wbsD0aeWx3eA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYwSWlHAGjvywyqlxZgxLDQASyNzawe74Vl82Qk8IHdbswplGI
	XzJ43rJSfJMngJ1Kh/7qYnLc/coGzkcsqMx4BKWsErJdvLOa6rogOMHv
X-Gm-Gg: AYBFou2oDNic13r0U6d4NANvosdZFOf17nMo8sy9EgjPaM5BWRfwfR+C5T7kszf2gw4
	0dgE5iiXUMFlOpKgPk+QVFjiLCZfIR4hKBvFBUFqGNDWcZB8viazcmgaNQCGiFaDMGutcAqG7JU
	RB7fh9dFQmT/NG/nYIqB+YySUC/O51pHq8ZVdGEx1OKWgZp9TNnSEHNJdZk0tlfYcR+Ik6ynwK7
	qNoEARM1vk9MN93tXiQEgiafnhbX+3CZlDEO79MiBe7VP+mAFOi2WB44J4tOVFxpLFuYSIPBifX
	M277OEB9ExXqiEMYz6p63NA73cPjYzhDYIeeBfHpnBx20CrEsqeLPMhTpRWY1P+XhJHNWtF57a4
	pDgdAqP5IeMb1R6i075f6jAWtKc0ucNDrwK5/R7BWTK6FA4v0CEvv783r+GFk04oQs4Tok/8MIZ
	0lzC1nSL3p8vo0mNJ2AWG3/XFnsRVuzcdhJpAJgb/gIudYyGzybgOMu0s+B0LomnredFZMnS9ot
	8eBfdMZn6FXK+RzppijGIaLVCuK6HjHjCOhk6/xech806aYC244FqdU7J7R0UaEoO4m8bpQp6Nx
	48vIqko=
X-Received: by 2002:a05:693c:408b:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-369e86749a5mr15571826eec.36.1793076187002;
        Mon, 26 Oct 2026 21:43:07 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm55884722eec.23.2026.10.26.21.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:43:06 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] fs: allow sendfile EOF at the file size limit
Date: Tue, 27 Oct 2026 04:42:57 +0000
Message-ID: <20261027044257.90408-1-dennylin0707@gmail.com>
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

do_sendfile() returns EOVERFLOW when a positive-count request starts
at the effective file size limit. If the input file ends exactly at
that limit, this rejects the final EOF probe even though no bytes
remain to be copied.

For example, Python 3.12 shutil.copyfile() copies all 4294967295 bytes
of a maximum-size FAT32 file to ext4, then raises EOVERFLOW on its
next sendfile() call instead of completing successfully.

Allow the boundary position when it matches the input file size. The
existing clamp then reduces count to zero and the remaining validation
is retained. Continue to reject positions beyond the limit and boundary
positions with input data still remaining.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/read_write.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 4da846a2bf17..a25e23c6a327 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1347,7 +1347,8 @@ static ssize_t do_sendfile(int out_fd, int in_fd, loff_t *ppos,
 		max = min(in_inode->i_sb->s_maxbytes, out_inode->i_sb->s_maxbytes);
 
 	if (unlikely(pos + count > max)) {
-		if (pos >= max)
+		if (pos > max ||
+		    (pos == max && pos != i_size_read(in_inode)))
 			return -EOVERFLOW;
 		count = max - pos;
 	}
-- 
2.43.0

