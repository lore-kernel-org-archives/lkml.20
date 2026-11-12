Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519800;
	b=XGvdma/hfZLIsvkLz2IUi8ObvXC8BlANmL+oXjHEjT3V5JBoxuaqbgbs1CuHENNkHtdh
	 qI55l0sHJzRi4l4UytIjYj9xXYfduLUAaxqyfE0JiuPzJenYL/EsryVMJ/s4J85v4YzvV
	 V6wGPyOttM8LegdoSPbyLt6rEsq3mbm2ckn/HpUuwH+fx6Y3A+xlbvZfqBeZEQbB0ErpU
	 rgITGXukrFmqnjeoQ+GfTVoj+mFMyG5g+280C2GSJeMDcMOJ3RgtzhuN5eCkUmcAXRGMx
	 eo6bKU9nLydSTpExF1cadLWajFgk4F+WUUFQsmlunO5OUdvDdMZ1xxyreMZFzJYvkyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WvUlOeDanurqLbDS6/09GivlgebJIQFHQ91QWYUQty8=;
	b=2nTUpeuMxedNWtwliXLQ7zwz7cvu/H9vQvrr7tS5nOtHMWxZUzIQOZps4ctleTLucAiI
	 wFI5daMxC3r7i/9jnkGNkgM6ruIXpyonB2Lwk1LFKLFP3f3b7GCfxa2BNMD+yzZs0oHCJ
	 HsqRrWJUx1mKzRA/wrBM8CkYTVgf5rcgiytYMKzGXG8vm8rPTrmM3+GTKeKcJMZWV707h
	 tLVY0sY0Zn0mBjd0QnMBbOzoQWD6gUO1t36zV6gNry4UdrTOGYjBE5IgtjEWqKz8c7i+G
	 53C7GIM8BROPot09T04Aq6jAy8YcTk4cPHDBSG9vVqmkQskGS+6p/NyTsN++cRm77Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFV1baGs;
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C90E606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C90E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFV1baGs
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-37198ed3727so1658710eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519800; x=1795124600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WvUlOeDanurqLbDS6/09GivlgebJIQFHQ91QWYUQty8=;
        b=qFV1baGsB9i6b6FfU38Sh9xO2kVWxvEqMaRWDDtBNM3P7F9j7LlsTHH9wthrapch6F
         pk3W/IGVtOOABWZSiPFP60sP3nCMjN5rdQ7yElyU2RT376CnGHSw4H8BKvm0xILwjDUs
         Hiuksfi/LdkYXptT1JLx4FwNRkcd3pcYF2vDJnmLGMVjcyBY2oT+Zs7bz9HlT0Fu5VgL
         yNbTQs39FQm6A2d5fA0yvY+x0PTw59xKBcOCgg1j01sk3FcnoNX07rE+Ze69L7IxvsnY
         dsdM2me2kXGEq3k3A/RlLaQ2daCy36XpIXmvIFvLN3zNTJVWPi/xPyyTVvXga21oz5tD
         j18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519800; x=1795124600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvUlOeDanurqLbDS6/09GivlgebJIQFHQ91QWYUQty8=;
        b=zdj/76uDwRJ3ZqB0+tRQvg5Pm4plqhC63M+4UIA/WusuCwljqJ1JLMaWTdhPRRTy8q
         6vHkakHsylTflJGZF6b7slIYJ/z/otZm+2YumVQJu2vrR8LRlZyYE2xFNeX0agbxYRsD
         CdYNuXlVzkOIr3DHPBG7MAO8JCv5bSDK1teV+c+qHqZBBGlcRSIX00shlAF1tnVRPrYr
         MDgo31c83lVhGKJSAeX8zZ5FaXddVhluUHeeiH5zNAtuqZLZMO4yRyMeuPXyReN2Z/cH
         bSymr9lE7hPcJG8DNJzenmjmDfI9xS6urTVZvzL/+/OXsKgEGY2pUyIseiVxQxwGXOuP
         F/wQ==
X-Forwarded-Encrypted: i=1; AL+hErF3jdtpabxL81yn6xloc/LT2SHynHzfxOmBhuXEo+TevY9/T4YAwoughSLVUdjSvDKQjMvspBh/oYV5jQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wmiiEv3HBlVBjv/+MfOqmUQtTUllaEBJyCNnlnSIQJsHbBcNi
	RGU/mJRc5gD7NI3qL0lV01Cp6pts6UpvZ9gtxfrdNTKwMG3NaPpx2wFe
X-Gm-Gg: AYBFou1ukmj4TDusghLRf62w3nHS6RgZkb6vxcdxMzZXho5eN4pAJp0Cy4gYi9NCEDX
	goCO0HTUpFpfwaCwSmGnbW4tRjads5QFgIFNQ9DSjiv3WvoVnkj9+fBuwhF0Wh3h/usO2thvHzr
	K4787m01TvWU5rKy8xBA0KzzxiUfuIBdq4UekChotiSCgzuno2HS0Utan7tvVTR+esH0YZebAfv
	aIib9CFl1UKlceqoSHgRbfoRM/L8T9N5m/gAPaOU4GiDTUu7C90S3O7XzZge7Xb/uybgtA8soeF
	Yczx/8yooe3BSFNodzZewMZlEKmOB3wAwwJIMjc3fDakZ5z4/yGia9DRT6L1z95j9TbdDFY/jT+
	9Wt+zGTw5YzLLYTMvNCMbDS9hV3YCpGPiHCuFyp/mPm7av6LC7atBLvCYA570eZKCwz3SWSvBoC
	Bila5O+rLqxuEZwmKO3Cjx1tOwx2dTWe8+DRIbVikPey/OjyvYBI2MZaJSpgz/anO9rT7xfdiO0
	FmfWrCH9ToVh6e+YRnQOb5RxC5o58Kro6cDAPqzqwpzl+Rt+jYBtpHXqpLsHZCSy3txEmRllXN6
	OUek54rTtTvtdbpjJGbGvbWTdVNCOTbco+yqmQdscsqDONk2GwhqR58KCVK5CuDvhJ5G0rXqjBE
	QvQb9LIChHsgtFyKkdrW+ODYyCjxY2MY1Saz5SumDBZQlW6GebsHqC96VQoQ=
X-Received: by 2002:a05:693c:83db:10b0:375:6fed:8e71 with SMTP id 5a478bee46e88-377e093ba7amr3053481eec.7.1794519799484;
        Thu, 12 Nov 2026 13:43:19 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm1194466eec.27.2026.11.12.13.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:43:19 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 1/4] f2fs: require write permission for F2FS_IOC_SET_PIN_FILE
Date: Thu, 12 Nov 2026 21:43:00 +0000
Message-ID: <20261112214303.16198-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112214303.16198-1-dennylin0707@gmail.com>
References: <20261112214303.16198-1-dennylin0707@gmail.com>
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

F2FS_IOC_SET_PIN_FILE does not check who the caller is. Any user who
can open a file, even read-only, can:

 - pin it while it has no data blocks, after which writes that extend
   the file fail with -EIO;
 - unpin it, so that garbage collection may move blocks that a user of
   F2FS_IOC_SET_PIN_FILE expects to stay in place.

The ioctl checked inode_owner_or_capable() when it was added. Commit
aff7b628ac2d ("f2fs: set pin_file under CAP_SYS_ADMIN") replaced that
with a CAP_SYS_ADMIN check, and commit b13bdf03bb80 ("f2fs: allow all
the users to pin a file") then removed the CAP_SYS_ADMIN check, leaving
the ioctl without any permission check.

Require write permission on the inode. Users can still pin files that
they can write to.

Fixes: b13bdf03bb80 ("f2fs: allow all the users to pin a file")
Suggested-by: Chao Yu <chao@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e2c0f5083313..cfd24a5fa271 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3664,6 +3664,9 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	if (!pin && IS_DEVICE_ALIASING(inode))
 		return -EOPNOTSUPP;
 
+	if (inode_permission(file_mnt_idmap(filp), inode, MAY_WRITE))
+		return -EACCES;
+
 	ret = mnt_want_write_file(filp);
 	if (ret)
 		return ret;
-- 
2.43.0

