Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297401;
	b=3AL5NNdVZTkQmHW6Ga1c8fhpUHBBTqQ1XBjCLONgWU8PvA2T7mKd4bKIxEka5TfOjlyN
	 kqF6c1vuZDX64gc3R1Q1UAwR2pZtwSlwzdLr9rNGnNS9adqW14QTWycKU9Qt/WIbhZV0D
	 kkWnbAVlDrx92BFHnvIPt3Is1rUKpNLSyoXhBgtsiTGyf+hBMEDSJUd4J+6L2SupzV1TT
	 rRJDE85KQVE4GmQMvt6y/72hX613Mxpjb0HyyvBGfxPPYMaqnLXldH6ZgtbhJj8ZCYDxv
	 qN6sQD9RsxsYVfzsxOcqf7CWvJ4Yv8fcwoUF05u4Ia+4lIPOtuah/Nn5G2GBQbvLV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VIRuN5RJjbuv5CSzCNORIV49ClgI3heQ4aV2Bv/ASqI=;
	b=PeM/ymv4+2Fr1HNByEiOcuiP6vTkxCZYKatHhBswd6P8bCL8LQz9IA9qrc8TUCW8DWY7
	 2bxA9+shqf04+S9vprsIh2N30+2Vd+ie51ANxZW76yLUgyoWCFxltGo45QrB+qXyMrVMc
	 v/JLMjyPk2gwRBc4JveSVRLJKl1jWk9EkYZltqh5uwp503MPVGxH+mwrmb5IBWRf/lJOS
	 k90n9pgCyy9jnQ4l6jm6jcRE1jiqC88HMBZutmEbcjoDcIdeMPaL/zB5gxca/0r+shtT3
	 ObN+G4uVn8Ghr1gZBaNErzUlghqkHd+q8Gzh1mgorDJEYDpPNac/B2jzNYzrm8fCJvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=WZLxBgd3;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66860A380A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC66860A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=WZLxBgd3
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6df0b02fe91so770981eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297400; x=1793902200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VIRuN5RJjbuv5CSzCNORIV49ClgI3heQ4aV2Bv/ASqI=;
        b=WZLxBgd3shKUN9MMxfxeWoZmoSQYqQnLq8nPl6E3Zj9r4MlVGXVCy7M50RgeVTldnT
         QzFj53iiOXruAIVXf1MEj5jDvkLWMdRs3iT0mxxToRMGZ+ayO6ETyGc+nq7PoDNt2Gx9
         YkQkzqm5bSa1e9r7FmarbxkfhbsqrEcIBpWIsHl6SKMsMGlN9zJXSX4ZUIuCdoa5xLj5
         kHaXFxjOYlyyundHMLrv/EY/3B9cJY8Vf0e7+lpfd/dwd4T2l/KhC4HPAoXdrgVCuqBj
         khWsYoU1VSkvWeCLGxvsw8NRcQMwmctajSHnaCdrAon9Ig5dwW+vqWMvyM6NsjeB39Qh
         xHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297400; x=1793902200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VIRuN5RJjbuv5CSzCNORIV49ClgI3heQ4aV2Bv/ASqI=;
        b=yfCpL7v6adyQX3WeKsBaIProrSUEm/6J3M9FSdAkoqBqgax0srKdBiw6GlLo5MlHIS
         VOwVBozubmzVvXe1zNMEYIsRYAtJxeHTzYtjINHsKB1V14/QqAJaz9tVR/LGHw4KF517
         m/vfTWEMzWswYPsk53xGL7oQdXrzoLQEz+/18JtzxkpXNSHr2mcpblshE6d9icbmAnhw
         TgMH0h9RP+ZYLdlAPXvYPv+S/MW37VFb8TKBzUOroCI7hwW+duKJD6ySzlkyY2Bl1fLC
         yjKS+cQDrahAdJ6L8wMIqspt8TazHGQxxX4ey1Vlo/LuuOF43YojsT5YiIHPEMvC2fPm
         3VCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvQ4ubHvzyXYXh3M/ifAUpnjxJk8ZVBnm+GslCwLrhQFQl3QFBlfm1AVcFT3KZKmQOfCswf1a8+T2GFns=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvDveRQUE4GwOv9S6pZuQg3aznrBTysvWThF+8XmRCL2acWzE8
	kOcT1dyx23HDFYk4Rh0FzMdV6x9tz+JI9prTWDfU9DHLz8j/8VT93TJxQBh8gASMmy8=
X-Gm-Gg: AYBFou1TmpnYN5vZsLxJlI2yYipO9fgCV7kcYqUKCBp0ITAvJ4l1PaGfp9ORdejcN6m
	2It7ZZeOu+gd/lTCM3eQpmYPn4NYd8IAqmSR3Osj3ZAfRdPfMKtl8LSWidV5gJkJK8ah4Uu0no4
	qz0R91K08p+C/Dp99zKlq52Ki99jqhj6YKShVXubUiGCGKYZLx1sKlYES1/3O/9iDDHSKIfiZNh
	tbe9cJzlRELPZUJnvvfsIbxqRZLLaSqwZ8y2OStBTYv5k434wsw2WH5z0lqYdEV0VPvzSuqQYj0
	e+vamy0xDv1rgrSQvK0OfqMAB6sIR4V9lnJcnLHxbizmE83CYDib7+Dv8/F9pU0BsubIitbDrle
	yLRB++QSAYv7oRE9OGpKkC1LRRXCTzeXeWTP236dG9A3ON5nZz2GgnhkksYKGquJb7emM7vjUxQ
	U4Z/E4+tuHcQlsb9/adzaxtjtu5+QyXgGuUhYwQUPsrrRcPfqaYt1Cc7FTaa/jeHL99NZ3acQaM
	zXT7RzTRZRPeaGeDWPyXuUudxpYr9R2E89k9oyIUxRavYSl6bO/srUGhsMVN9J7nrtg3ZZL8n7P
	nm7ZE6eT2lGNGqrksBhbtZyEwijHilg0N5atqdw6WruUi6RKJwWLQDhluJ9CgiY+8jOi4UUL
X-Received: by 2002:a05:6820:4ccc:b0:6dd:c600:ec2e with SMTP id 006d021491bc7-714ddecf85amr1873577eaf.19.1793297399528;
        Thu, 29 Oct 2026 11:09:59 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354d12f2sm160242a34.17.2026.10.29.11.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:09:59 -0700 (PDT)
From: Jonathan Flynn <jonathan.flynn@hammerspace.com>
To: NeilBrown <neil@brown.name>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 01/12] nfs: update a server's capabilities in one step
Date: Thu, 29 Oct 2026 12:09:46 -0600
Message-ID: <20261029180957.387138-2-jonathan.flynn@hammerspace.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
References: <20261028041023.3738553-1-neilb@ownmail.net>
 <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
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

When the client reads a server's capabilities again, on remount, on
migration, or when a later mount reuses a filesystem that is already
mounted, it clears a group of them and then sets again, one at a time,
each one the server still offers.  Anything that tests one of them on
another CPU in between sees it missing: a case-insensitive server looks
case-sensitive, a server that supports security labels looks as if it
does not.

Build the new set first and store it once, as the NFSv3 path already
does.

This was found by an AI coding assistant (Claude Code) reviewing how
the client derives these capabilities, and has not been reproduced.

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
 fs/nfs/nfs4proc.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 22a2a4009d..113c199a6f 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -3896,6 +3896,7 @@ static bool nfs4_server_delegtime_capable(struct nfs4_server_caps_res *res)
 
 static int _nfs4_server_capabilities(struct nfs_server *server, struct nfs_fh *fhandle)
 {
+	unsigned int caps;
 	u32 minorversion = server->nfs_client->cl_minorversion;
 	u32 bitmask[3] = {
 		[0] = FATTR4_WORD0_SUPPORTED_ATTRS,
@@ -3953,7 +3954,13 @@ static int _nfs4_server_capabilities(struct nfs_server *server, struct nfs_fh *f
 				     res.attr_bitmask[2];
 		}
 		memcpy(server->attr_bitmask, res.attr_bitmask, sizeof(server->attr_bitmask));
-		server->caps &=
+		/*
+		 * Build the new set in a local and store it once: a reader of
+		 * server->caps during the probe, such as a remount or migration
+		 * of a mounted filesystem, must not see these capabilities
+		 * cleared and then set again one by one.
+		 */
+		caps = server->caps &
 			~(NFS_CAP_ACLS | NFS_CAP_HARDLINKS | NFS_CAP_SYMLINKS |
 			  NFS_CAP_SECURITY_LABEL | NFS_CAP_FS_LOCATIONS |
 			  NFS_CAP_OPEN_XOR | NFS_CAP_DELEGTIME |
@@ -3961,22 +3968,22 @@ static int _nfs4_server_capabilities(struct nfs_server *server, struct nfs_fh *f
 		server->fattr_valid = NFS_ATTR_FATTR_V4;
 		if (res.attr_bitmask[0] & FATTR4_WORD0_ACL &&
 				res.acl_bitmask & ACL4_SUPPORT_ALLOW_ACL)
-			server->caps |= NFS_CAP_ACLS;
+			caps |= NFS_CAP_ACLS;
 		if (res.has_links != 0)
-			server->caps |= NFS_CAP_HARDLINKS;
+			caps |= NFS_CAP_HARDLINKS;
 		if (res.has_symlinks != 0)
-			server->caps |= NFS_CAP_SYMLINKS;
+			caps |= NFS_CAP_SYMLINKS;
 		if (res.case_insensitive)
-			server->caps |= NFS_CAP_CASE_INSENSITIVE;
+			caps |= NFS_CAP_CASE_INSENSITIVE;
 		if ((res.attr_bitmask[0] & FATTR4_WORD0_CASE_PRESERVING) &&
 		    !res.case_preserving)
-			server->caps |= NFS_CAP_CASE_NONPRESERVING;
+			caps |= NFS_CAP_CASE_NONPRESERVING;
 #ifdef CONFIG_NFS_V4_SECURITY_LABEL
 		if (res.attr_bitmask[2] & FATTR4_WORD2_SECURITY_LABEL)
-			server->caps |= NFS_CAP_SECURITY_LABEL;
+			caps |= NFS_CAP_SECURITY_LABEL;
 #endif
 		if (res.attr_bitmask[0] & FATTR4_WORD0_FS_LOCATIONS)
-			server->caps |= NFS_CAP_FS_LOCATIONS;
+			caps |= NFS_CAP_FS_LOCATIONS;
 		if (!(res.attr_bitmask[0] & FATTR4_WORD0_FILEID))
 			server->fattr_valid &= ~NFS_ATTR_FATTR_FILEID;
 		if (!(res.attr_bitmask[1] & FATTR4_WORD1_MODE))
@@ -4009,9 +4016,10 @@ static int _nfs4_server_capabilities(struct nfs_server *server, struct nfs_fh *f
 
 		if (res.open_caps.oa_share_access_want[0] &
 		    NFS4_SHARE_WANT_OPEN_XOR_DELEGATION)
-			server->caps |= NFS_CAP_OPEN_XOR;
+			caps |= NFS_CAP_OPEN_XOR;
 		if (nfs4_server_delegtime_capable(&res))
-			server->caps |= NFS_CAP_DELEGTIME;
+			caps |= NFS_CAP_DELEGTIME;
+		WRITE_ONCE(server->caps, caps);
 
 		memcpy(server->cache_consistency_bitmask, res.attr_bitmask, sizeof(server->cache_consistency_bitmask));
 		server->cache_consistency_bitmask[0] &= FATTR4_WORD0_CHANGE|FATTR4_WORD0_SIZE;
-- 
2.43.0

