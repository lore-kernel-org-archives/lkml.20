Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ACC2EA173
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378335; cv=none; b=FBgyeuRN8/GeDAHv647etN6VWOuMumq8eeOwoGMY+c+4W0V9TUKHQ8laWVFx04JekTITV6y4MKmzR9TzjKL5rsOuTygMp8qDATFz7iw3XVyJNRdi7nIAkAuiw1OipdDhtRIGjSBuYMtfkXjBGEDRqJD9OwzekvPKWSZaMQnHS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378335; c=relaxed/simple;
	bh=1IdoY1hiT6PmkTeljw6MT7zrKtvU8liEHU6LWcr8124=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PXCQvkug8YudQdi6L9KsePyDzkOQcEHgtXJ6VYKOVla321E6eNqRKgvHRBdFmDR0X3vXX8ZECYiAvayAyDJIoszHnJnqttEO1O35yWMk4VNQ2JhkjAdSYyzV4fcn+8d0GAKtDzXvMU22QLurSGhc50DrOU/mvcMPIvpVk13l7EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dk8jzMDc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dk8jzMDc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1280938a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378333; x=1789983133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUgUbIzBHavhcx103b2rVszh/STl0E/XwGRt39cKnyM=;
        b=Dk8jzMDc1MpJzUyRROkorzogF28rUqt8PpiLyLwdEp3qEOU7h/sGptIbgPtngWs0hb
         sIJFmowjKbL9UUANISSbcv+hepwRfyCY3qYXEzMATdw6aBBeBtqIt8yCTz208fgtytg6
         9KVlmpKw8hCLbNPk5Bj3ngyGTZ9hQZEGy4wDGujp/+laP1rE5RzUcx8gCJHytXeA1wfB
         hbHZQ32YgYSuJgEJQ85voGZqjNYvww3NwR8Y99xcX1/FD031GtAF9RZfuOGkDx89T/wz
         782+G6PuSeL+CvSXBgdL6oQCjz29z7Q8PHPmOrR/YeWB2lKRKsnktaF5ok1nG5cq3ZAs
         L4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378333; x=1789983133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUgUbIzBHavhcx103b2rVszh/STl0E/XwGRt39cKnyM=;
        b=dI/HXWOtspAzGmT6mikO3Jq5l7dY10wbrBpSS7T0hjWHwAFUrI1vIeEIuTYYdQBHca
         hI8pIMX056ljQ5T7LCaMI/9xUOgf88Ru+h1yYpjU2mEZi/1yRl1nd90wtaNVjVge8rv3
         rhBeJLYSbeT3s7JC5QbNYAttd8UDk1NRfqy6K/HA9rFCYlxNQaGHMwFBcNn151one2T+
         aFqwxp294GG2Rk5AP3PT/Xr4LX7OZal5U3vsryy/CEjFSGN8aNAjTh9Hsfki5M+ECAT8
         4vMpbS7IAJUx0wHJVQw21KGPWjcTq51/86b8k4VEwlKDQZxMCgpdQ683WuWEHQHveW6c
         sXGA==
X-Forwarded-Encrypted: i=1; AKwUvBwRbU1DjhQqVTvff1Yfq7ji+O2mJECAVk3lIOeeRO+oDZmHj5EgKmoed6DlaGC+2FncBfaeaBLaMEEZPr4=@vger.kernel.org
X-Gm-Message-State: AFuF++ke+K8UF7BGJyW4DWPSD1RK7v7dJqgXtj7V6++WPSzdHwA4ifcg
	PXTihUhnw47Ydp/rYj2wzUB059q7moBLSelL511lF/DYNqZk7FTC8PceumG+thvU
X-Gm-Gg: AYBFou3MBYq4yiyK6Pd5BoXZ/GVfwO7bcLtItz5TYhjctr9BZRTp0l+PpsFcICrD/Pd
	9daaSH7c/m26opP+ipIJ7wFTTVAzhtpKs3O/Bk7jEPwyp12QzQ3OMb0EikKYa8fgOA7AxRiPgGP
	x2cHnypHdct7y4bTQFbILo2d8IOagYRgzbo+Q6iXINN8j5ChimBetpxIi4eNOnLimq1oGE7b/gB
	bxg6rzYpbRI9M1tgYZ3otxBhLJ5YjMxyIlKu8sMukxlA1vSkwPfGmzCy340vQAdbUaYaARw9SVR
	3qRU3r2hKFY2V95OfgW20diCA8IVpvYTW29W4XhVVk1adinc2lYb7HxQrOJPaQDuHCJQs6AVCn1
	QqUQZlJGX2dEgiDZ3fi18XXiuDE4i3xEV9whyNh5/zC91OCpe1TmBy+5lVPO30NW/ZQF509wn+N
	yxjMh+yg1NSrtWbarWsO0OAfLFAykpZT+8SDKkOtdnUq8186Q+F3defIzKCctQnkXzrPYfkr01a
	7QbsRdb+Xd7WaRSN8M3tVgiRadm8o48E8UoHxTwsvjNZwMFiTLWmM2+QZrbrpt5ovo4q5SZy+7e
	S1AxNfLNF9c/T9oizjmltZAvPye9n5XYXKCUIS77JV3MtrTKY656qNTQv5xa6+Pvu2zaraFZ0Zo
	oS+HCe4qRiYk=
X-Received: by 2002:a17:90b:534c:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-39df08f09b2mr2513332a91.9.1789378333338;
        Mon, 14 Sep 2026 02:32:13 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.t54fbfa9bf0658dcb-tp.internal (155.135.143.34.bc.googleusercontent.com. [34.143.135.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d6b08sm20414733a91.8.2026.09.14.02.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:32:12 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v6 0/1] xfs: prevent close() hangs on frozen filesystems
Date: Mon, 14 Sep 2026 09:31:50 +0000
Message-ID: <20260914093152.1698-1-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christoph, Darrick, and Carlos,

This is version 6 of the patch series addressing the close() system
call hanging indefinitely on frozen XFS filesystems (Bugzilla #205833).

In v5, I introduced a transaction allocation flag
(XFS_TRANS_WRITECOUNT_TRYLOCK) to handle the trylock inside
__xfs_trans_alloc() and propagated it down to xfs_free_eofblocks().
Christoph suggested this design and reviewed the implementation.

However, Darrick suggested that the deadlock can be resolved much
more simply at the VFS-layer within xfs_file_release() by surrounding
the existing check with sb_start_write_trylock() instead of passing
transaction allocation flags all the way down.

This v6 implements that VFS-layer trylock approach. It modifies only a
single file (fs/xfs/xfs_file.c). If sb_start_write_trylock() fails (meaning
the filesystem is frozen or freezing), we simply skip the speculative
preallocation trim.

I would appreciate your guidance on which of the two architectural
paths is preferred for XFS:
1. The v5 transaction-flag approach (centralized within xfs_trans_alloc).
2. The v6 VFS-level trylock approach (localized within xfs_file_release).

If the v5 approach is preferred, I will rebase the transaction-flag
patches onto the current master and submit them as a new version.

Thanks,
Aditya

Aditya Prakash Srivastava (1):
  xfs: prevent close() from hanging on frozen filesystems

 fs/xfs/xfs_file.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.47.3
