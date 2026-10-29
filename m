Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297429;
	b=pTdwi4kTfzHteLkK2m15nj00COi333FfQroi6Yyy+CUMogRdnU01tyKqp/GZJbvgLsF8
	 96Micf+TffhlYhJpO1+8Nvuj8mNrQLfUyzcJKsI1QiwLTpXjSw0qJihWPwtu/r0a0u0UP
	 TU+fOzwDHwbKFrydF57xXk3KaYQnZ43UWh9Q3g6Es66jS1Z98jB8LUfG61zFH/Uf/rL5D
	 O9nZua7twopIBGKU53yS33Jx1lvON2F1nj2Y4ETdKZ+uxaU0+9OWvsLLyC8SX3TTSPYQN
	 54J1CDzJwOUGXqx6R9k52MJ2mGOqTwfrMEbb95ts+XwZnXHWKdTEExCi322PtKJ7LhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h/Q9DLGqoDPx/XvjFFuDFe37sX7w21EVwh1yv9Pf91Y=;
	b=kkePHz5ssofF0ORPRnJsM+3kHCDJbjNNB41T/EV9cQvqO6T4j801TqwR6dDlyqg3CRcJ
	 0gEc4y7mpJTGV+93Y3zyM8XyiyTG1qz0h/qNGPxYpT4Mi2gxP4jz3D4wa65t0eK86XBLt
	 6xEnYtOjMkF0UeZ1bw7npByiTZNYWvcJUwdgYuLY8IMkxGAUy9d/60XMKmWC3DIGOHn53
	 RQd4I2Gk6iVzcipD3BdSHAjMy6FYMQtsry7sWn0PZS+c0xc6JbdZfn5nRRMw+Xjp/s24V
	 a8q2gkuX/W7/n9Yr5XvQTyInTgnurEWSyW6WudEelY5+vhiGqmQN2xPrr8lNa8QmCXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=K9KYxWzC;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B58560A383C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B58560A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=K9KYxWzC
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-823e4047037so1733335a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297428; x=1793902228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/Q9DLGqoDPx/XvjFFuDFe37sX7w21EVwh1yv9Pf91Y=;
        b=K9KYxWzCPyBeEIuu0xpic15O7tkqjAgj1nlmkbsQeMWvTEey5aLgbok8m4unZflqLY
         rs5fGM87nV69qB8wilEMbeXeAE88KP9x+lNfrUrKwQArfvUXNC2uV/OQZrUUapzQoqms
         vl6mrG6fe9r5iM3347P0w9f4+fd3IuhyxmhGFebTjl8VZR43FAFyIgmRZSZ33LjLmsS4
         OP3WuXl2s/15UqqSNeOKc0PXcccomgQi8PL12E1a2styv3LRLiireJIzjhCmd38KLQC1
         0y1fJALNITtpO1nxWvBnGQDumgMFnQjGS7ppjXFe2g4UxkNjTRViIV9I8CyqKY0Y5IdR
         ZV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297428; x=1793902228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h/Q9DLGqoDPx/XvjFFuDFe37sX7w21EVwh1yv9Pf91Y=;
        b=dcMmzEt7h8ZLrgKrLZ96a9rjHFbl+ThQKC3HeJ5k9Z9v0T/60XcgibhTc7s+6YltZj
         J7H1xoqptqLAcoXEKNkbfDMGOrXZ2afxi/ZtWmS4+gPfCB726cd7r0JP+N/1K4CwkILC
         IsI2MX/+Edj6TTuDTi/s6f6P78tsMdO8RnwKfYX9TzH3VygR53S8nfrl6xPhyAR37VOO
         l0aad6wRhkh7ew4SuenQxlmTwajuUYEFa/1KIezUx0bD/FFjh742/5OVU7iWF2iWtFjs
         UpvG2XtLmwgv32dZalL0/my4yo6ZpDjeWa/B33K/9uHeEiSRbSRket0vhCJ1QXL3+VkT
         XMRg==
X-Forwarded-Encrypted: i=1; AKwUvBwLPtnOof94stVFp/fXM9eSYF+oIa1a5D3ronirdkNJiuTwdpL0hz+U+EjXhPEq+Pwb38cPJalGSzxMk4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkVsILvCGfjZrgiVStkW6TgFvkwl+mClLtThK/CvYM6vQJ/Co0
	eizDFvzPLT6CD27sb8ICw/muWQfmhSy5MlKbscHV7cG71QPhB7IEymAdGWdrL2e9Xcs=
X-Gm-Gg: AYBFou2LOOo1LicmPNFQ+EkMhzNmx5o2ixG24ObZDpQfVA3TBkcLQMkKgtOQEllXcll
	jDIXwZBKQTKt0V6oZyjMaDrB0+xYTFMdi8ZOTnkfDg6L1DzuYqzIzx8tCYcoqklHePKqkqYR6Pe
	d35G61ggpkqOcSLpj+JcUI/HwVEMrKbNH0DbEwFD1tKv+lWGjNX0EGKlU7/b6RX00y6lX9RijKF
	wy61OQe2XK2AjYrKStdFGrdUd3m4iAkqKGIYyHc7OBKJWeN7uxWsgbFerW0RxK9ait6wjq/BKl5
	zGCOUdJJv4/OSF/V0gX+1Vd8vXCXRb4QsG3o2ENzYPt8/yBCBovqVMllHRVfzx6NQsBeBWFbw4y
	O+BJZ0evwhyfP0GqTKbyDKqoD/GvueTY53jpow7NgNGXMITS4vTpBBPrVgnx0j4NRErXkizyXN2
	cGE1yZCRxOMwH2XzpqvgaIrNx6MMg5Jr3a8L5Q/n/KMFesuLmcRh9sV0+nY8kBbsQp5WDegDVwS
	mp0yh/lgWo084hClHiEFPMutZ+g5cSuDEW+iHRp6UAONU6+GLs2G/+co2mOJjcLM9856xWQ2kKC
	a/wVtH4dVkQKExTyM1iGfN8Lvve5Smb9a/nmjYmM+8OVJVCK1m6+fwbsmOucRt3XcsWNos+pGw=
	=
X-Received: by 2002:a05:6808:181f:b0:54c:7bef:90d6 with SMTP id 5614622812f47-5640dbd679bmr1506b6e.4.1793297427868;
        Thu, 29 Oct 2026 11:10:27 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5437cfcsm4755474b6e.4.2026.10.29.11.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:10:26 -0700 (PDT)
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
Subject: [PATCH RFC 12/12] nfs: remove files with the parent directory locked shared on NFSv4
Date: Thu, 29 Oct 2026 12:09:57 -0600
Message-ID: <20261029180957.387138-13-jonathan.flynn@hammerspace.com>
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

Let removals of different files in one NFSv4 directory proceed at the
same time, instead of queuing one behind another on the directory's
lock.  The server orders removals of different names.  The client
orders a removal against lookups and opens of the same name through its
cached entry for that name, and against listings through that entry and
a count of such removals kept per directory, as set out in the changes
before this one.  A removal it cannot order that way is done with the
directory locked exclusive, as before.  On a server that reports itself
case-insensitive or not case-preserving, every removal is done that way
from the start.  A server that treats names differing in other ways as
one, as Unicode normalization does, is not detected, and there a
removal is not ordered against a lookup or open of another spelling.

This covers every NFSv4 minor version, NFSv4.0 included: nothing here
depends on sessions.  NFSv2 and NFSv3 are unchanged.

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
 fs/nfs/nfs4proc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index fbf9e97815..0acc03dfe6 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -10860,6 +10860,8 @@ static const struct inode_operations nfs4_dir_inode_operations = {
 	.atomic_open	= nfs_atomic_open,
 	.link		= nfs_link,
 	.unlink		= nfs_unlink,
+	.unlink_shared	= nfs_unlink_shared,
+	.unlink_shared_done = nfs_unlink_shared_done,
 	.symlink	= nfs_symlink,
 	.mkdir		= nfs_mkdir,
 	.rmdir		= nfs_rmdir,
-- 
2.43.0

