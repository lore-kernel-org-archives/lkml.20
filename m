Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612150;
	b=pscL+Az/RkMGJiDtSprbhD2EqE/DfCwlNbMZZk14riCZ4hBzikeQxUcuBvrfWqFjbf5s
	 aVhvRKtaqiMLJjAoW5l8ECQgqkdJ1kISbBTN3e7u3AEHTbHIC0zZhQJ80jGI/1ebw3/Jo
	 WWSmrcAsEe7L2EoETCIuanvL/9ivtVQ5bAGj+q1U0miN1FJYX18unuQz9FoWgc9ECFIhm
	 SR4cJNT8kF3hZ4pzsd8oDP3uoC0lAvKJ7hmlWiJANTfZWA1rgM+iyFJmPwZcLA4rlrDct
	 VzMHFqJGaFbtHMkB6FqKJ/1UGsv3TSXxH+zlvr2Jv3xdeg1x1WUGch3LNtHZc8NBH+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nvbS9iFrs32HLnd2NRpzXjnfEXZME1jnaetqHlPZ2Dg=;
	b=gYQLXxVa4jyDsqzKzLVonVnF+yHvqB2C1/QWAKecSzzzLPX5pJ3wd5LP7so0dl4ZIAEH
	 fsHGUZisQxxF6g83GPKAtKPHEFxwoNTyoZ5UkF7Cd1ST5VKcfEHsUy4hsEw75oDZ7EsJI
	 Sm2NdpZgy3Qc9W5zjbxpI1eeMqdmNukXuHlPCwqP+inU22zGxeo7aXdrtW8u2gXTCYi52
	 uDKkhKmQXD1f4z4qJx5SeMYAZdrEvOjIDnAYv+U/03urtzYp4cmfP4pVK83+sl7VnXVVd
	 9beHLXgJCVWlAw8/Ndmx9UtNbVviyS4Inq+b3W9alMpRZKxbnMOfMKr1bAdsyuJ4VhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/BO/xBj";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B65606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B65606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/BO/xBj
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso808090b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612149; x=1794216949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvbS9iFrs32HLnd2NRpzXjnfEXZME1jnaetqHlPZ2Dg=;
        b=U/BO/xBjL44xI3TvofHUUDLRyHj5x3r7UKaogyLGXKB3+cA+7n6GEHfKh5XRPM2WDh
         kA4/xqdZPgAmvRqIX4RK/p41OCdjU4KM94zP0EatJd7oGP2WwvDhIdmbdG98li53TBVM
         UpTY2x35UArSlPTSTk8SLzdypo6YVp+ziC4butgH459ocIJaSNyJK+vgu6MMRKnGl9sV
         hO0CBmuLhQSOHMpXz0+NYY4LjcePr1f4zu+jR8HQVk8DiAp5cazorrGLAYkC38IRszLV
         9BwGp4wq6Prft0okT7AjZkVYSYRUggkO2Q2j2m0BlxaaWMpaf8gFSwD1YZ8H0s0LExRn
         zQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612149; x=1794216949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvbS9iFrs32HLnd2NRpzXjnfEXZME1jnaetqHlPZ2Dg=;
        b=21AJkRDD3MikArmRPnjnLkv+5pPEIygjxOIcpgwp9eLGYzLelkzZNhFi6MSpSnaa/n
         igC4+ii+ztzNjbyCm27ZmfOQH4qIG3Rl14ztAfLffTRI0usrF4YGFT9AaKv9fzgDB0Vt
         OvKQUbgg1DUaJNdvXzy6lgzHgcjedg+n0qXpbEWT8qd9uEKDnwnmd3OQWtIZ8A3KwFL0
         4xj5tmIarZCuo4sEUa6wRnyn+uKJfu9puqcmTa+V0TArsjMcuKf/6kDR+HGVlxcjbU7f
         TiMRU7judssLtE8qURfiwHYe0yMbn3nIUf5m3nSqUU7qwYnyriFm+/+JDTY9CWPjWvH2
         alXw==
X-Forwarded-Encrypted: i=1; AKwUvBweLWnlU++pCgq6xtklHQqetrX9H+TcBl9d/VJ9l1FuAp82jkpED/7PiJ9WF5QDGjXabJAnslevsdQCkVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOQhSWvZb7dFkahKM7ynH5QR/ZvpB6yn2cxwDTHMgtuvUoe/EX
	7Jj+fNE26uNInkHmbtVp4QnuNAPnd3brEmLQQy/hvNb2o9yzb55VBXvLI5AHTCDe
X-Gm-Gg: AYBFou0v3uCd+BCkLcq5iyklhQ/G388DdKGTTH7l4lpzhz+lSBSbqsDutcxHxSu5ow1
	4FvcddrRahytbD6CIfnoVWQ0zBFJPzocYTqCZxt6fym0YQo6cItM+V8dYAZyFLue1X8tjifrMK4
	HHOzrgKJrBThhjdDtgX+KdBn+Out//X+Pyz7YT36j6wB0SMq212kB3BX0sHkfA6EyPZYfTEtgsn
	LtaUYsk856GJrqbciKtBmxmOzALgPPTDlz1BDhdlK/i3x4Rj8CG+uEhy5hlOqy0knAtd/if1GsJ
	df1fYHs7F8AEdWNIGeHo3w+YAxIKoaniwZrpEJfe9XtygLIjzLLaACIVniSRZpvBfDWbMEggqxT
	obVLLSHdcOjd0T6x5RR+Kgy//wOxqNV8osggHh0gfWcp/LxCMSJgexZ/7otQg75uXwMhkMQKtoC
	uwc0B7WAFp/WQNv1bSbfQH8tiwhX1GsDfOj1Hr+JOzyfTBbXjwPOg6Bq/qnKFmk7tCHVBuQomnq
	x1hzQePdU7Z7OLiu7TxF8onJnn4c2M7TEWykgDs7d6uarTlpPaUmRARF+C7uETasB7z0W2SMrZ/
	LTgnh6JnjTHCs5R+qWqO8Ek7CJcBpTFjJ4OQIVkzvF/3+aUBcMP5R37t03zSKry9s+o=
X-Received: by 2002:a05:6a20:d81a:b0:3e2:3392:53e7 with SMTP id adf61e73a8af0-3e92885cfb5mr9195393637.0.1793612149040;
        Mon, 02 Nov 2026 01:35:49 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963d6acsm1773626b3a.18.2026.11.02.01.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:35:48 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: don't allow compression on volumes with clusters larger than 4K
Date: Mon,  2 Nov 2026 17:35:43 +0800
Message-ID: <20261102093543.1199671-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

On a volume made with "mkntfs -c 8192", a user can set
FILE_ATTR_COMPRESSED on an empty file through system.ntfs_attrib.
Writing to the file and reading it back after dropping the page cache
then crashes:

  BUG: KASAN: slab-out-of-bounds in ntfs_read_compressed_block+0xa2c/0x2040
  Read of size 8192 at addr ffff88804355a000 by task dd/106

The read path only handles clusters up to 4K. It copies each cluster
out of a single page, and a compression block of 16 8K clusters does
not fit in the 64K ntfs_compression_buffer. Loading an inode already
rejects compressed data on such volumes.

Reject the flag change the same way.

Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs/ea.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index fa5c5c625751..68397b2a4e43 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -721,6 +721,11 @@ static int ntfs_new_attr_flags(struct ntfs_inode *ni, __le32 fattr)
 		goto err_out;
 	}
 
+	if ((new_aflags & ATTR_IS_COMPRESSED) && ni->vol->cluster_size > 4096) {
+		err = -EOPNOTSUPP;
+		goto err_out;
+	}
+
 	if (!a->non_resident) {
 		if (!(new_aflags & (ATTR_IS_SPARSE | ATTR_IS_COMPRESSED))) {
 			err = 0;
-- 
2.43.0

