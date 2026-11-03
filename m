Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668026;
	b=u6JOBHeFU5wREwIh4fqjKhRLnuvdbhMJ/NcVCf3VlI1G5KH3KEvoc5b6VY1ZJbIm4uf5
	 DFvtev0NkGNfxpWQIjhiYp40j47dVLNDKfBsjy+SCSui8Rp7Xja0DMcDhAJF0Uku1KahV
	 ePU65QCxAtRXdLFlnEHM8IveAi8zr96mVOmZPUUR0WfJgBIvTbTLe4/8Iktte9EN6KBpv
	 k7FtMFl7qaqKwyynoOSBlwPr6pM223sZee8DyYsVj/nKo5vaYHkUJHYQ4iq7wL5Qy+VLx
	 vkfqrO7GlPY+BOEkeWfKiGRWP9PLzdTCZMhMO2cLY+0geWvvZkD8vXnsx149+2x0dRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iw/fWoRrccFojpUKteaeVfiegzWbJTWaZy5KVRGPlk8=;
	b=YBftR3ihtiSxfS+Ttz9i86kJYKcY1GgR9VnWQlZfNW2xdcjIEiUX0lepp+cK4umJN+PL
	 ao11zsBA7PJ3wuKmaEE3bujvdTCgLLlwvDBBmJ0/fBbQWkbiUkWqZnT7ProLd0wUehHko
	 JGHDfZrfAUFofMn+kAV7sLlZ6yLE4VNV+Ck/jY3mbAwacreKi/2XLdFMfjcP7t50lmWVn
	 0ycn9YPYl0qCHvTu28CPKT4fA/GOz/mBwzGtRLljvN6wHHB71w+VEC7E6mxJMcXTi4JUT
	 7xzcme6X5SbAEC9vrg6ozFjJpEe80b6OGI1BHG1eTkJlz6Ad/OOeKZPe8j35lkziuvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J6jvsFfR;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD72F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD72F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J6jvsFfR
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36888ae05e7so1326061eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668025; x=1794272825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iw/fWoRrccFojpUKteaeVfiegzWbJTWaZy5KVRGPlk8=;
        b=J6jvsFfRyHKynUd6nft0Z3wodmI31lFxt9PptawBJIh9WmMvvFUJaURQ6h0KtID3Nx
         DUmXdvmBkX7FbzCSxb8F6X1adrlhh18+SQLjakwkE5Xiy2Pk9OrvGSTm/gTrpN3IeCDg
         84etaGutbhQZY57ncCAr1kbvv+jVlJp0hKPRhfcsh0fmdp5440sB0XYxVyIrBNK9PgTx
         yCIPzXeuedSnQC68tJRXUB0a0UB7QtT7PvGB8LXPF8CrvJsqoy77rpkcmUtP25ZBTOrF
         V+ppgkO/rwPG9En8GEdy/sq/ufHaY+RYBPZDo+BSCAwts/08j1ANsazxkO9oZit68mJH
         Wy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668025; x=1794272825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw/fWoRrccFojpUKteaeVfiegzWbJTWaZy5KVRGPlk8=;
        b=Q0p+oDwFg+uthK3fBzte6y/GXORZeRz9ypwjhU5iSOvKz4zl6VVFn6a20ana6lPNgL
         JSUh5wCMhlMDH88Ez44ybRGbp9X+drBDZVdc/Wk6a6iR7/UG/2rq3KNhWIJ52c3a4CFZ
         VR+YLWsg0myispjmRVT/671udcdE+1vFBhWHCN1TRk6C3l3G8on1u1PADbkTNOJjxW+I
         OnnLd/cIw3zJH8ij5m2H4157n3fsrTsSfpOhyw9oLJCJOeVDf7svt33BJcd/6h2kfTiV
         dFbPS6vislxjUqy6fAMCwYPUi3lmAi9at0MMYw/0VhuHaj7sKFvLZ+qp14IBfnS8MSgw
         swCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzVqHbMOz3Xx/alXSnxmB+FVmvhEgpNem42FNhLPN6jmsRYFMqq5vAfbz9cas15+DEEC6dSgfeE/6ivgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXDBwWN1MWwmEajToNbhEiyujUjmIv2fV+zz5AQpxpvW48bmuP
	VMpv4WW1l/TFiIo6MMFRtQSzw8+1EMB2aPMqQjrF4z+Pfwe0puJ2qeYiMun+wh5YNwc=
X-Gm-Gg: AYBFou2fT3G13WFQxnjVcztA8MpYaQcDBH/uFshM8Rn+ph3cr9HNUVhAdMDbUc57iGg
	pYGfxYBEcP7TtKS/86klbCpTA/mSe5wGuH/1w3o6bM8HpRGFvbMgEFI6vQ6zRWW783/b872ET6/
	ZQiuLH3J0D4N/FehzHUCoKasnBmaJsQoQho4zl838YzkroPiU2kvCnpoQ19Zsqm7FcIUUtAngJA
	fec571/yHLyekL2K96WTqk8pRwAbI3jLA4ofEfhB+B/IonQv3AkFvn75oLdiGGg5hHZCzb/Z1J6
	nweuatJnVOu7Oc5Srix2ZPWt4zAYyQphZL2i4tLdcmXXeBR8MpV1/A93O/O+kLMe2+EXVE2AN2m
	MCvpkHubH8NEN+UXEDiHZctU6rR2VoOdVECjUCmVisVT8uAQuXXJyK/xsOQVf7XGHbqXZZp17++
	ugkVj3xgIFq4af5GNmsmovgPwOKE5PzUSbMqnjeMFFFePylKyCgAOMAKuhN08EmlI+M6HG9cQYL
	X0eFd2OhSmd8kuB11WevlAMCIrf6qBcOXee3u4h1M7z/yhWuDacSKAZWpoFxSG6fIbbVaq3VmDy
	e3AQ7ROHB80wJNpt33wrZpFNtDpzGtpgVU9m9R1LgqepSI5GnnYuj1+M
X-Received: by 2002:a05:7022:38b:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1ac5c45fd1dmr20515706c88.15.1793668024586;
        Mon, 02 Nov 2026 17:07:04 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm3767727c88.4.2026.11.02.17.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:07:04 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fs/ntfs3: advertise nodump in the statx attributes mask
Date: Tue,  3 Nov 2026 01:04:37 +0000
Message-ID: <20261103010437.55455-1-dennylin0707@gmail.com>
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

ntfs_getattr() reports STATX_ATTR_NODUMP when ni->nodump is set, but
omits the bit from attributes_mask. The returned mask therefore tells
statx callers that the flag is unsupported even when attributes contains
it. Callers that check both fields cannot recognize the nodump state.

Include STATX_ATTR_NODUMP in attributes_mask, whether the flag is set or
clear, to describe the state already reported by ntfs_getattr().

Fixes: 33f29fc7c67e ("fs/ntfs3: add fileattr support")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 1624f9b014e0..d5c87d608bd9 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -295,7 +295,7 @@ int ntfs_getattr(const struct mnt_idmap *idmap, const struct path *path,
 		stat->attributes |= STATX_ATTR_ENCRYPTED;
 
 	stat->attributes_mask |= STATX_ATTR_COMPRESSED | STATX_ATTR_ENCRYPTED |
-				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND;
+				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND | STATX_ATTR_NODUMP;
 
 	generic_fillattr(idmap, request_mask, inode, stat);
 
-- 
2.43.0

