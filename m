Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833738;
	b=jATN2BhtYY5KPSx70b9LS3P3JOwPMs1y7w6BuzX9hB6n+Ho4Y4eoJ/TrU4tRqHfMObCQ
	 0gZC5o4QIh/qUY+lpOTMhEc8LfN1qhMW8PBn/XyUPJUEMUjPR/8Sm/DFFalHb+6Fnb7pb
	 ZA2EO8BBlXD74Vp3ts0xZnFAZpNF1T/TTy+YkLfG8fjNZ+sMFbINNzPSXk+9bAZrNP85G
	 MimbwdrD6t5P0iX4IY9dJgUU8vStbGPOepms6AB/gjabJCjIZfjvg6jEcepCOA5x7+z05
	 U7dtbyAv/HjVLkwdar3197sd1zCh1sI367/Mw6Iw7UzLZQQPqkYovC2swExWL/jT1CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YJsmZX1McOF2pOnvr2C6ZlYhQtDabJGRiQqmWYszNws=;
	b=fDe1ZZ1jFpElfjRHyLlbqRGbKC0cm+aHfBf35vVDXTnGj7i7OsaYVhO0o2yzUw+D14vO
	 /encZCcgkb4oO/ewLENLEIUxrPtcGE4AVhZXotP2J28pFz5HK/Ffh4Wp99RP0+VUl2QsT
	 Diix1woLeshSwJncv7XLCk53EqJxYLtEOkRBu09zEC48Lz66Ps/W4lLhcnwL4DsWcMcio
	 791qClssihvG63dcYb6ARZw4a8W8CzM9MJ9GwnUNn+uxjR79cQ96O85ZxRlwmgG4A6Vkt
	 TzAVxe1r/my6zVtjFV5D0ccosVLdJVX6DHXG5m1SgFNi6vWLbCnkzF13yW+z+gI3TiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KfdPlMq5;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC3606A323
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBC3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KfdPlMq5
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2817128eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833737; x=1793438537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJsmZX1McOF2pOnvr2C6ZlYhQtDabJGRiQqmWYszNws=;
        b=KfdPlMq5IP8gXpr8akrtD/n0aaIbbM2p34tMXzhjtIiDX56/ZJ+hAav8knzgQkAzcz
         AsYzpskP4TWhgpT77j+jWZXsOWlfYHGhX7C/W85A7+nYY0B/frootnVuyZFcVQoGhpsL
         HaZCeCG/X4sh0mWRQYDFoCmWIadkCIQ0ZM1sIG5a2jpPGvLSPsmo+1t77khPw/41eJxy
         6sOmOQ5ZV0oa1I4QnUuiAR7LQ8Jcd1MuAmeHwjpdLV8mUDGxyZiv5LTC/BWD7if/K95M
         C1CRd60capLeXgKYpz5JGM2FSuz8FEmni/hNiMyGoUfqoJX82GWMd6xPmR5Gc4Zft4gq
         /b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833737; x=1793438537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJsmZX1McOF2pOnvr2C6ZlYhQtDabJGRiQqmWYszNws=;
        b=U4iz8PYioMhayrAOzzxc1eo7qcjugfnZDA81ni9wtBIyDaB0f6Qf/AKtuC2+m5mejq
         5B9VvDpkWIoxqsBvHyHRf06pQv+tBHeVepp3zUTjCOWmShaPxFiFnwz5npsLlTYgMZuO
         ubYGX+shed+tpT1in7tFAZeZIGa1qjewAlZ2AT2VyzvCI1ku6wA0K6Djp/qU4l0E/C3r
         Rz04+V2GeM6ilrdU9oy8S3mXSjNpBDyjGSKSToNo4+UNV0zkaH60aCMmdkg5WJTw8jHy
         1HXIxj/AYIip7xn4JDe1hETQhMXuP+pvsHdmKUSlAruV+oTzYfwyU79j9bo9XgGEffhC
         JrEA==
X-Forwarded-Encrypted: i=1; AKwUvBwLyFpSR+2MTbXEFOif3ML8YNfTO230LHmp379i3siLHlkofBEMx2wWpGqIyWJvwlGhBEia3yWcK1OBpuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIR49Gz6z002zWqB0cogvwN8lnwwOXT3gWkURHe0Yj/tTp59tS
	OQYgedQRiS18iOWJ2YwXN9ofpbXb8rDa4t9+thxvvHA0ROq4cdRI46MS
X-Gm-Gg: AYBFou31dNrbuA7dlBr2zfSl5ArfdgEnd9bL1a8mmpVqxypJ2daEhfemhCrMI+gX7Wy
	7Q/7kgw/I8aFuIi3boXQ9j1927A0UYP0kcjquJQamLy/93ysHMBXkdbY49x6Vgu4wwH1ESxtyCT
	UoqV9Vla19gCcpVYtTVTACJsjG4IVs4MhnZ5MSmLg8NmfnZ650/VUE4ly4Mua7OS4Y3sznFLMou
	8BlB/jc4tANTcDEZgCuDomX0j8VklXeLz7m2BVZFizv1MP7+sUH+t9OVYiIjxQwLzTNh6hG175i
	rw59Re2TrRuaHv82T3hRClrt5aQ80ZgCfyt6P5jsjqgUCm4myGz96pwBVCOVUTLAyCqu8v720rx
	vUEAAtaPT6PASTYOuWx806frfJ2Kgksrhz0AaLzN4E7hbrnTxomJpY+KrCv59E7mVkH1Bi1amRn
	Chl7ZO4xePgJZJUq0++453gGruXTMEYUYQtOx1z8+gd+/LlHtbgjvwTwtiHMHQjWIiAVffCt1GK
	23vfl1Z/q3734ZgTCUXHQwx915rQgDH1T5uQa44ekbfKiqilP+MZ+l0HAMJP3bk/8GS6EMXytkO
	UVRYLnyKRku9mjNLn4u0VeAV2THpiifMCBBjaoHDbpHeOe0Kwy8KrtjTIGDE8EIXHo1zfvGTM+d
	7LHFjs7zHVfVtiQghJqQAjkG5VQ==
X-Received: by 2002:a05:693c:408b:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-369e86749a5mr2838749eec.36.1792833736816;
        Sat, 24 Oct 2026 02:22:16 -0700 (PDT)
Received: from LAPTOP-VN8JNK11 ([111.223.26.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db450bsm5108584eec.17.2026.10.24.02.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:22:16 -0700 (PDT)
From: Ankit Thakur <codeankit.thakur@gmail.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ankit Thakur <codeankit.thakur@gmail.com>
Subject: [PATCH 2/4] 9p: fix typos and wrong parameter docs in vfs_inode.c
Date: Sat, 24 Oct 2026 14:51:52 +0530
Message-ID: <20261024092154.1844-2-codeankit.thakur@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261024092154.1844-1-codeankit.thakur@gmail.com>
References: <20261024092154.1844-1-codeankit.thakur@gmail.com>
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

Fix spelling mistakes in comments (functon -> function, Hadlink ->
Hardlink).

Also fix the kernel-doc of v9fs_vfs_mkdir(), which described @dir and
@dentry as being unlinked instead of being the parent directory and the
directory being created.

Signed-off-by: Ankit Thakur <codeankit.thakur@gmail.com>
---
 fs/9p/vfs_inode.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 537cb22ac..0585cc915 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -481,7 +481,7 @@ static int v9fs_at_to_dotl_flags(int flags)
 }
 
 /**
- * v9fs_dec_count - helper functon to drop i_nlink.
+ * v9fs_dec_count - helper function to drop i_nlink.
  *
  * If a directory had nlink <= 2 (including . and ..), then we should not drop
  * the link count, which indicates the underlying exported fs doesn't maintain
@@ -673,8 +673,8 @@ v9fs_vfs_create(const struct mnt_idmap *idmap, struct inode *dir,
 /**
  * v9fs_vfs_mkdir - VFS mkdir hook to create a directory
  * @idmap: idmap of the mount
- * @dir:  inode that is being unlinked
- * @dentry: dentry that is being unlinked
+ * @dir: inode of the parent directory
+ * @dentry: dentry representing the directory being created
  * @mode: mode for new directory
  *
  */
@@ -1134,7 +1134,7 @@ v9fs_stat2inode(struct p9_wstat *stat, struct inode *inode,
 		if (v9fs_proto_dotu(v9ses)) {
 			unsigned int i_nlink;
 			/*
-			 * Hadlink support got added later to the .u extension.
+			 * Hardlink support got added later to the .u extension.
 			 * So there can be a server out there that doesn't
 			 * support this even with .u extension. That would
 			 * just leave us with stat->extension being an empty
-- 
2.55.0.windows.3

