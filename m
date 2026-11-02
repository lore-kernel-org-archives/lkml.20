Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655733;
	b=1w+FLooGGtiC++F9EQoUGzhPDG/xSYHDOhWIYMJ3bR4C69NPuKsRpoYvRIHenwqeaK/i
	 oslirvE6kYJA56i2g/gDwjl3RfP0f8OWdWAZpETrXM1tDYEv3Oky3WRCkzWZlV3mcRwdz
	 Ty9v7gEMTHkShfTqlQkYgZQtE02qdzeCscq9U0tvgliB9wMSWsPCUNgyuyWDaswV10/RF
	 hlid3wVA8KXAxEt6NicvQoA9l+aU//zkVdNxP4iWKqAa+wTkx0RwNSL6fw1DFK6DMFo2T
	 NThTNP7FFLANCX81aF0zxwZOgjGYuFd6RdZd5qe0Pnn25jI4xibZPN21qJfHlQ8je7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PZ/799kMOjxtNn84XuJu3OyHheoZSdoT1O4MCuG7Zzo=;
	b=WNem2Q7e8pgpF3PnxaWwTPrGuSnINYwUOprFe+MBr3UuToQ8h2JZGUKGCIUK3xgTmqWi
	 +K8Q4p42XGC2uMGgOCq4wb8S0KQf0kbqECm7ua2IfgWBIJP3lIpo8sQFDbVG+ys7q9eC8
	 zbP8bafAD2JZBz7M43j6Mt1LbWqZGFPT5pZ8Z22Qu9RtsXLDE6GkZqYmEFyDMJDVU0Axk
	 ZbcDxEdU5YxwPzqTnTob6Wle3+EH7j6gitteAGCt397WOY4GfYELtV4x7qFuRk1C10J71
	 LTmERVPrTKdVkfwJ634BZ1t0JlKz6qzUysrrOQBEzfcj4ueBUPuHjprM5hD2IIhOs5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTwRuitx;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F8B606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F8B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTwRuitx
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-164f08a9e84so801012c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793655732; x=1794260532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZ/799kMOjxtNn84XuJu3OyHheoZSdoT1O4MCuG7Zzo=;
        b=KTwRuitxPy5moFX8wy0TubLgo6ta508Q5yRImE6UzZK6LkHtFtFrbYhGrtp60iAFQA
         q7cm6dM3+PFThOCPjZD3qo0wo01QuFTkt2zxLVLghwZ9pfEQDHYWJfBtey17KcEBY/OY
         UsctJtuU0ej0rEWe/5KG6i4kXPUDqSdqPg0+EbA4LI8XvMAQx443ZxdCnCqQIzwLCcrv
         t5yEBQf34SME96iHqaxyNDhdvu05HCC5JrobnDPseFd6KMCI6tbwgyYgIW9Fu0dpwn8h
         qbpkT/koYsT8NbWuRZ5vlT4ftgPS4HFBZ6uIo2hnn9IJT5HxXMMnGyAJo5ZdF1I95LI0
         eNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655732; x=1794260532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ/799kMOjxtNn84XuJu3OyHheoZSdoT1O4MCuG7Zzo=;
        b=dGERABrVCystphu+gS95oHpIDFWzHP+vPYWR/wgInW3nyC6zt8kKqQgFb35PmYSiNJ
         3MO3f+FazZlRAe9Sq3ZAsngqDx0e+j5XapNjbbG41lh96AQ0UtufSe+tMnjtTlXrqA2U
         vnDJrTaNXAR75490CFHepdMlUGkbqi2PL04U4CI29YOSI3Dht1zX+ekfEofAvtmqOpHA
         VF+1LB53GPKFOEuG83vCUtQP+Yo9VNms4AZs7QvIcW7cxofZqiljUh9EDpttL73G4mUg
         Xe8k/87+YrjMngrW6mkvGnyKYMdpwrdKnOOm7evbBCubsJuhKAsY4L4pnaUMXVCawKBO
         hfzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwH77T/MbdTNhKoVV+T9cH1GZAM+qtvLnqakHkh/glfZWqgEsvdjCfGHFtfg2tEzEXy7SrcDx13PpdPmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6YAvPxpm/vuhu5VGdEVfjN4bp6YILUQ3BUI9/y513X0GICqaD
	H08pZ+TsZS8fVXtJhalWEV7DEao30cws3iGSrc9+pEhsfoDBxyUbFK0Y
X-Gm-Gg: AYBFou32EZIytHvYnL4NjlX5r71dfbX4VYenmfjxOrm3X540MlD8gIuHzNQntXXcbJZ
	izC8isBqlbbEbDGecRngrXxSZSHPCv/jEvtWRKzLsZFDTnww/yMMy1YQmvqPLdazMvR0fF60OLw
	2SLmwGtVVQxewty2RbfLIsIouKhx47x57CyK633zeyXKy3yC4mJmuPEH9NyoAH9I32RAOG6ldM1
	/4AwYAMI9xF/u7qEtbe7d2q777eQn6UiabJLlPmLybrKpfzr6y8gKkCekGbC8fWZ8xjvYV6+YMH
	yD0Ab/ZELjJo71n+3s+yZUjmvO7lq+qCELLx+wwY6j7FjsK8DsrKVEAt8aOOx/bAZy9CZjIby2v
	xzcFCFNSdsyNXl7fCp7NnXetT6o1pIT/cVMJNqObJNE89n7yJ64PIfOPCTNtLQBZ4yZnEWvlXsl
	GoAdp5LKaKkMq4yJTweL3J7K+L3xMaRFNWwXimxczV40n8Xh6IdNUkYPVgoRRe1hYJ2XcqOR/Mf
	BWzdkV4XYCvNvvfAEXZ5ca2i6MZ/ylw2Bd1siuV5xoLn4XT1IpWhPOYsseZz7oQBBq4rb5Q0Qbn
	tiHoTxKSm4d3GJgB2OQIyjeqkR06brpxhxEQAxmBqct3p2h/NMUtVB6J
X-Received: by 2002:a05:7022:29c:10b0:143:8860:afa1 with SMTP id a92af1059eb24-1ac5f36d693mr16412434c88.46.1793655731508;
        Mon, 02 Nov 2026 13:42:11 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm42301283c88.16.2026.11.02.13.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:42:10 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: Jie Liu <jeff.liu@oracle.com>,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] jfs: allow xattr values of USHRT_MAX bytes
Date: Mon,  2 Nov 2026 21:42:01 +0000
Message-ID: <20261102214201.55330-1-dennylin0707@gmail.com>
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

The on-disk EA value length is __le16, which can represent 65535 bytes.
However, __jfs_setxattr() rejects values whose length is equal to
USHRT_MAX as well as values that exceed it. This prevents setfattr from
storing a 65535-byte value and cp --preserve=xattr from preserving such
an attribute when copying a file to JFS.

Reject only lengths greater than USHRT_MAX. A 65536-byte value still
returns E2BIG rather than overflowing the on-disk length field.

Fixes: 0439e091e3b1 ("jfs: fix xattr value size overflow in __jfs_setxattr")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/jfs/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/xattr.c b/fs/jfs/xattr.c
index dcc4a69d44fe..44c1348fece8 100644
--- a/fs/jfs/xattr.c
+++ b/fs/jfs/xattr.c
@@ -755,7 +755,7 @@ int __jfs_setxattr(tid_t tid, struct inode *inode, const char *name,
 		 * return -E2BIG in this case, which is consistent with the
 		 * VFS setxattr interface.
 		 */
-		if (value_len >= USHRT_MAX) {
+		if (value_len > USHRT_MAX) {
 			rc = -E2BIG;
 			goto release;
 		}
-- 
2.43.0

