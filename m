Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A6256C87
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485714; cv=none; b=UIb4mZa3lkoeJYw6L2do+gPVKE2K+HzhyzPFWxeGmAAvQ3DhDJUz51tuzVGe1wrMzxTn2FQCa/1NUdVjWRdotk2GvBNSCWe6ZAN3FPiCsO+Kqe1gNdM4DcNWXmxaRVn0eSpHvO8FmSwWv9Qh4uBfh4M2SxSnOiAnCsWecbWUJRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485714; c=relaxed/simple;
	bh=YFMedcLY/M4zuhaWIeBEi/XLzTwpA8jS3WV4wGPTyc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pyqjl0j4Ay09DaqcDCjcRnS7yUe1BrkgZpDRMm3qOiMFzMvxw8ZZQX4YSOXqlXs2KC2lkCG3bcvxcczl29jVdhMpQPVSwTUoBuXJmtplKZKL35ywB4lY08gRpKk9jR0GAxY++rm/WUBJ9IUxeEeuzl/yR4Y5HqOt5ty5/vaqzDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwBG+RJ3; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwBG+RJ3"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso8070275ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485713; x=1791090513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbQX4osT0iHuALCntOuZ42CmWUb/HAhxOLR/MsgsY78=;
        b=BwBG+RJ3FKe7vWh03h9C5IDpZyObtu2fjGL8Cw4qU9B6mJw0lPN4BdST881XFdywDs
         6vwYS+pFfk+hMyOfgC5J2M78KuZC8ZZ0KWMBy5MxyTOOPYs+TtHzHzi1gsMmvAlEpo0M
         X9aRzCuW23UI8D/PaPe12cGgW2Hn1f18WZ0+i6icms9xCgFwZtqzWGf+N62r5gT1yfmh
         QN8MueDu9uyeVDHgYAPTJYdGDCNbSRR2Kyc0cwHnNOLSOKmDprETHSId1cEOX6MI+kYv
         pNhsBw5t1p9ekMntxE3DHKG5WxMzeEcn2IL/TqarV+NQO09bXABKhJyExm48Dahjdc2k
         1kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485713; x=1791090513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbQX4osT0iHuALCntOuZ42CmWUb/HAhxOLR/MsgsY78=;
        b=qI9yVQqZj7z9WYqGYqT+FKRJEwBoC2T+pYx6ukoqztmC8QnGAr84XN2nrr5DNmVhK/
         zNQUpbrVEYX+CxCLcs3n52LUNUMy9ZDIT+kKflwGWrGOKK9LJah8RiCubl2z5Uo7ruJz
         hsFaIAZzgnruZW7nOww71lso2awMg/737qkWSQLQKrTnJJ4O5SMPXBBXVM0cBJvByc8t
         8/omug28OtsOjG9d068DmGFh6dq668lQvdM3h14ZVNSNxzg7LcdadJq035WSwFFRDkXN
         AIFgAU6lCCZgIsaxeYlkrW2qKSfLhnE8/o1v7aWGwlwqPDf4bTkH26gJSldNa7+udgUz
         tjdA==
X-Forwarded-Encrypted: i=1; AKwUvBzoQYgpv9tkdLU8+N+wx8ZwoUwq3f3N3qhYZ9z+FYCoQPMnqPHFoSQjytvJy6ejU1ncpkl/VSQHVRn2c94=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbSg9UNY3ImH1Q2nFPj/CYmI38cXVVsNPSTuLo4j8VEx0Xpt+o
	0t0Dj6SrfCK+ZYZC8yr7PiMN97oEUG4yT5bh3tF+NydzuxnT5KQehfw2
X-Gm-Gg: AYBFou0Bzar6v2ea0waI0QyDMWuZ269lMbPSkeHmvVKoSQFGa/mXBMz+N55J/cliNCf
	qzVYmQz7JqoClotIWnm+DHjYLSGnCEdOKZVj0QqzHgob9HjVw2fCTCkb66pCkNAUzq+/mybBHXS
	uAFwLt17YOqzM5yDE2UPMbCl7I5zK49uXUW2xYjclLzBR4nac811mp7jbEQTStYx2DgVtEgFT5J
	2e9mIu0bW9q1wC8hUKw55M/MSCfMYha1FFX6xgwKUpQ5SE4wQbbpNZ/ip95+UBkXkF50eqcPiIp
	K7f4ww9wMRXLm6jhwcTTmpBg0oOTvnMazJN2lG8ZjeS/nZWfbKXwu3Zk3diaPIap4xEKUs7qQTT
	XL24mD3TRHBbQxUrfIs6i2MY+7EXy3Cy1WGiEydrer5Bj+h/dE9aTq6jxaFKHOqU6v3Vncr6bjp
	fr7q0Id2PiGBQ7Ul81KBUQYf8XVAMuMWiHUyLFh+9u0l2FZiGMb1ZzBTDDdbqSixbVIVchDBzWu
	/yYSMmIYxEu3nELNPlRGtteq7t72wvWhF5MF+QxZo3vX9eiByYfvxnRdIiEelEe9pe3wf6A2eJc
	rzSdE4HIKcjOdnGi0SmVuzGAGbUqi650OX3BoGTioMxZpEyBvuTSOkvymds=
X-Received: by 2002:a17:903:228f:b0:2df:a4d8:579e with SMTP id d9443c01a7336-2dfa4d85a9cmr30233225ad.45.1790485712776;
        Sat, 26 Sep 2026 22:08:32 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:32 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] ntfs: do not map an unmappable runlist fragment as a hole
Date: Sun, 27 Sep 2026 13:08:20 +0800
Message-ID: <20260927050831.2739166-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the extent mft record holding part of a file's runlist cannot be
read, ntfs_attr_vcn_to_rl() ignores the failed ntfs_map_runlist_nolock()
retry and returns with *lcn == LCN_RL_NOT_MAPPED.  The iomap read path
only rejects lcn < LCN_ENOENT, so it maps the range as a hole and read()
returns zeros with no error.  The first read already does this:
ntfs_attr_map_whole_runlist() keeps the fragments it could read,
readahead drops its error, and the next lookup finds the unmapped tail.

On a file whose runlist is split between its base record (vcn 0-214) and
one extent record (vcn 215-1499), breaking only the extent record's FILE
magic makes the kernel log "Failed to map extent mft record", yet read()
returns 1285 clusters of zeros for vcn 215-1499.  A damaged attribute
list entry, which makes the retry fail with -ENOENT, gives the same
zeros.

Return -ENOMEM if the retry ran out of memory and -EIO otherwise.  Both
callers already handle an ERR_PTR; other negative lcns, including
LCN_ENOENT, are returned as before.  Reads of vcn 215-1499 now fail with
-EIO.  An intact volume exercised with buffered, mmap and O_DIRECT I/O,
fallocate, truncate, sparse and compressed files behaves as before.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/attrib.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 333b3371acb47..a337a3429b401 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -317,7 +317,7 @@ int ntfs_map_runlist(struct ntfs_inode *ni, s64 vcn)
 struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64 *lcn)
 {
 	struct runlist_element *rl = ni->runlist.rl;
-	int err;
+	int err = 0;
 	bool is_retry = false;
 
 	if (!rl) {
@@ -335,12 +335,21 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 
 	if (*lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
-		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
+		err = ntfs_map_runlist_nolock(ni, vcn, NULL);
+		if (!err) {
 			rl = ni->runlist.rl;
 			goto remap_rl;
 		}
 	}
 
+	/*
+	 * The runlist fragment containing @vcn could not be mapped, e.g.
+	 * because the extent mft record holding it is corrupt.  Do not hand
+	 * LCN_RL_NOT_MAPPED back to callers, which would treat it as a hole.
+	 */
+	if (*lcn == LCN_RL_NOT_MAPPED)
+		return ERR_PTR(err == -ENOMEM ? -ENOMEM : -EIO);
+
 	return rl;
 }
 
-- 
2.55.0

