Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717698;
	b=hIoTViXWfz4SvIy8Tm5Et5emIeMWfvZ3CFB2xZK7pD4q2omq5mPGJNj1mCFiT/0/nkJm
	 AeIDJTMPM+Oi0fsDtkcXpDTB9VCg5PPi6HDkH5BPHCdbcg+7KlClv7qhlNDJHqgPSGB8j
	 e8N4LXGj7bmebvtZARDwFsyP6dKc9/x3eJ/A6aSIXV2tOuc7Gw7eANWVv6BXSRXEH9MQ6
	 3ImdQfC15MIJdlnJxlg4gOwMieg9fDamscGpEd+S94zy0Y55odVvbPOyfgEtypoziQXem
	 iGRUyjqmQJv+7WqbjpQC64Dd3o9EdshN+ujiKNqBuSYB9mCb9Gva+qxNalxoxF6XdxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CAccl21Ta2xKfCvErWmXwQUaoiGO2p8CkPuu5f18Boc=;
	b=gVirTGroF3VondCTJiWWTzqxaixgCLSj9rbLZ3GSJKoYMq8+fv3YtDCtaqH9DJ5yiR3m
	 /LplxYTAkBveiBBMLdwaxewaZglez02/o9QhzRkydjMYdAJR7gHOGLWkYw0D/sNVWcaMC
	 f8usIxVp2ST073bQswVRbCH8kB8xJxkJBeiTPJqDYCcXOpD9UsUAh6jq2sLMXR9l7GFUm
	 GUup0zmXtzn2G5w3csU5o+NDUzYM9V2WUWxI72x+YEZOC8TkckaZfXHMXXdT/1iMgdLvh
	 /5fwCXOyIvDsQYMQnUVEsV40XiZMa1Pu7HfQWnQTj9KhhejFm63KNtxsUPQBgkDoE9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGZYm3UA;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2C4606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2C4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGZYm3UA
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso1195001a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717697; x=1794322497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CAccl21Ta2xKfCvErWmXwQUaoiGO2p8CkPuu5f18Boc=;
        b=cGZYm3UAYTYHGi7MmhOTUyo7jEpJXrjWzTcmNeYCa8209WrAgS27vxUMTaZ88QM9gg
         J8snYVgRixOJsTkFQ4vno+yBbCMM1/ELfSy1YOnR2qZ8B+rOk30XTLqZYnyzWL4oUbNQ
         mfQUPI3I507wi4G3DYeK3TSNw6rD9YHM/G4Zsu5hwa90aMJjmfe8KHxddYQ2kepvM7bg
         e1mv/gh57+WAAnqtoYoveCwh16chExgRVL7mvEqtI/3TZ/Ks5g5oH8UNAMAc9CYYJ6AS
         Wcz4GBhWQQGuNXEn3IdjtEMw8ZOsaJx0Cpdy0OUSYRPacvmrCNX13p5iIi83zMbcivm7
         pieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717697; x=1794322497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAccl21Ta2xKfCvErWmXwQUaoiGO2p8CkPuu5f18Boc=;
        b=yTnbZDFo3zjA1KGKqHwlR7f+Hm5xX0XbIvZUY8c6J9dvoQCqE0ir8MDIM6auFBwmPl
         MWYPLj8V4e1WJ4sfT0BVoMjKCp9cx2g4jpSScHUEIrqtkbH6MxE5xQW3E2Lutm0JamM+
         slvAexH3WWjX7hs6/OWzgxl4Zg36HR8z2tlN/uNDNe8fbtgRy16etgx/blbfys8qBmT2
         5uVY/uf5QCAabwY4Ae3Ko9qpvMj7Mrsap0y/rkxKDy8QPmkfX66yp757+GmvmUNfZ5L1
         ZuXdZXvpuYA7lcDniAEeouI+STM03PLKP5ZELKrvQIRHdSUEBQazx5h+8EhJhAIYtVK2
         BHgw==
X-Gm-Message-State: APuU4Z9+YNq8GVMAS6R6nvL233QTHJhQ7D+2uz4/zsOoue87If9FypsW
	pBGef0uvNiXj6y2dqpO+XYosMRdWRm8YsAldotl1SVR6C0h876AqkZlJDhjU+CpwyeuzJcX0
X-Gm-Gg: AYBFou06+VMKomiHHEfM9U8xWNPh0DsmJq0rARf8cGzT0+T7qZQPPsV5gE09fnlQrZ5
	JlUxRrJKzX7HZn9G5s4Rb6v3XFz7vPQ1Z0VZJ7lvQXwudLnhD092FGF5Dx6ruZ8DJoe5qoTeOyh
	ClXxDotGxdh7PdiF3a7FyZ53tzfAHlDnnSeO4G88dEr0mqJSGKBJGshMOsozW0LTChU2P03Y2qb
	BPy5mgejS5ySindUVLKv6ThmuhNHRrVIIhj81d75b2HO9gT+lK0yuk3LC3JEsY2KFuhXTRGXUyW
	vodsxYbZ6aHXjPj4i2AYrhA+oQ7kfmy7PGKqPbwMrhHHStAc7582C8hu4IpGB891bYW9R37inLe
	ZjaaMqCzr9q7WRJ/FI+Gf9g+vlvYMIzfiQ5uqUvyLyZfdqS0jzZ4rYlmBuP2cqAIclr8z78WCyM
	tBINE+LiZmxnNZDOOR0KQxze4AUWlsugrAi+Lie1xiUVJBWaKMMd2MJDv0IjShEbKUWzJTTMKxb
	lh9qfFhFvCHTGDglKcjDPMm095JOlxjZ46bTRxA90PHsX55hLwk6mYX+NSbgEplTwbqdGNDp91k
	VueeK0mlGxnRLXovnIMcSP6duCZYgMgKzxgVk906ydmSueKVDaJrD0R+4A75aT2vGYuzHj6q5lv
	Yd0Q+29ukEDDhX3qYj+JegYrWx/n6aQbU6hLtM2MBH6dzmBblby4ihloDiRfI2A==
X-Received: by 2002:a17:90b:1d05:b0:3ac:80dc:f40b with SMTP id 98e67ed59e1d1-3ae897f55cfmr9602071a91.33.1793717696954;
        Tue, 03 Nov 2026 06:54:56 -0800 (PST)
Received: from localhost (ec2-95-40-37-200.ap-east-1.compute.amazonaws.com. [95.40.37.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9b0ec5sm4753310a91.16.2026.11.03.06.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:54:56 -0800 (PST)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	stable@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Dave Chinner <dgc@kernel.org>,
	Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>,
	Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>,
	linux-xfs@vger.kernel.org (open list:XFS FILESYSTEM)
Subject: [PATCH] xfs: fix misplaced unlikely() parenthesis in xfs_iformat_btree
Date: Tue,  3 Nov 2026 22:54:47 +0800
Message-Id: <20261103145451.23755-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Jianyun Gao <jianyungao89@gmail.com>

The two corruption checks (level == 0 || level > XFS_BM_MAXLEVELS) were
added to xfs_iformat_btree, but the closing parenthesis of unlikely() was
left after the previous condition, leaving the new level checks outside
the unlikely() annotation.  Although the boolean result is unaffected
(all conditions are OR'd), the misplaced paren loses the unlikely() hint
for the level checks and indicates the code was not written as intended.

Move the closing parenthesis to the end of the condition list and
update the comment to describe the level check.

Fixes: b3bf607d5852 ("xfs: check for obviously bad level values in the bmbt root")
Cc: <stable@vger.kernel.org>
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---
 fs/xfs/libxfs/xfs_inode_fork.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_inode_fork.c b/fs/xfs/libxfs/xfs_inode_fork.c
index 486fe7ab8b61..48e1c83329ed 100644
--- a/fs/xfs/libxfs/xfs_inode_fork.c
+++ b/fs/xfs/libxfs/xfs_inode_fork.c
@@ -195,15 +195,16 @@ xfs_iformat_btree(
 	 * blow out if -- fork has less extents than can fit in
 	 * fork (fork shouldn't be a btree format), root btree
 	 * block has more records than can fit into the fork,
-	 * or the number of extents is greater than the number of
-	 * blocks.
+	 * the number of extents is greater than the number of
+	 * blocks, or the btree level is zero or exceeds the
+	 * maximum allowed depth.
 	 */
 	if (unlikely(ifp->if_nextents <= XFS_IFORK_MAXEXT(ip, whichfork) ||
 		     nrecs == 0 ||
 		     xfs_bmdr_space_calc(nrecs) >
 					XFS_DFORK_SIZE(dip, mp, whichfork) ||
-		     ifp->if_nextents > ip->i_nblocks) ||
-		     level == 0 || level > XFS_BM_MAXLEVELS(mp, whichfork)) {
+		     ifp->if_nextents > ip->i_nblocks ||
+		     level == 0 || level > XFS_BM_MAXLEVELS(mp, whichfork))) {
 		xfs_warn(mp, "corrupt inode %llu (btree).",
 					(unsigned long long)I_INO(ip));
 		xfs_inode_verifier_error(ip, -EFSCORRUPTED,
-- 
2.34.1

