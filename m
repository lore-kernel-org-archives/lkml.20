Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4084937E5EB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532402; cv=none; b=mLv1xuBklPOszK9AV/mqnMAyFvxE7DtiUA8TgFlQGl3NLooxY+TRT0FXjcrVbOPVqfIfuafTieudyuIymgem5agAuyaPvS1n99ELqMnPzvRZqf1etD6jVBhcT98irgOST7wzqc33p3p9oAgg9PIi+nUoZCI13lGPy9Yl/70Jv4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532402; c=relaxed/simple;
	bh=x5EJoQUjhuKVRv6H7TnddzJ1gRrd5VxGkLSN6Y2akPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcCkqra+v72SXj0KR3KrWMhjIMB2nnwNosSXXp7h5UBihFlbiemhdcjvSOR2jiFqT0RRn5Qv6B3zY4w76NTB477NXJfKHCRImOldud+v3dEhUlV5PXr8tPGKCrTiU90AO2R0qZ4uWdEC8n7nUlyO4qhF5a6S/uc/3tRnLqWkirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdVn6YCT; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdVn6YCT"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so595753a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532400; x=1791137200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8TG0yAO5zlCMJEzn/u58IOvQE9mGTzeJPFMCVyrSII=;
        b=JdVn6YCTA21b0INUd15bDq5GxgKXkGhXIJpTEL58wMOqzWODU+9fhor4DqopUfhtb0
         fgwP5waVrH9C1DY1PcxujJTWca6+9gNTVYkRb4EoirjCnghMnIyTYWjePg7DhycyPoLu
         GXjqQjBsBsTH1RNRphq/QZcHOXLlSaUGQ4QIXFq3Fmk6MzUp97lGQ1d3XRuK+4wrkje/
         TVnVZFUn+MeMg9wTrsYOfogHoLrpRx9GCyYB7autT7Ut2CueG7VLZpU7c7PnXwmhY/si
         9RkNKGIl+VxkCKuMThPfrs1k4ADJHX9FuR7b7GQy+YN548SxLbCfp5AF4RRFTMQGpjCt
         zSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532400; x=1791137200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8TG0yAO5zlCMJEzn/u58IOvQE9mGTzeJPFMCVyrSII=;
        b=IvoLUV98TTBu0y9SAkRlKaMkeBBys9zMKckBjOPqcxgB8U7AjSii61ArkqJxt4ZpO0
         CYiPsi1QCUd464TRVHEsAl2QzSLsGkcy32gkmoO1mYh6kmueucexnnLAAgRh2KSPoTP0
         HwS6SvDk1aPXBhUlr7SWX2KUBDeq5s2dCb00UQ4txJ04e3XV4lMJR6xVKVwB/bDWMcGC
         CRV3U6ocXM5xpebS798inQVemCNh9gPHmUp18a0sEl3wiP/tkVBJxV9GBnVQumgVJnUK
         h1r/esbBF5wuB3EPMFvGwT9qoYRJVoDOeilywEHb/7YZAQddKPsR+aijY9JQagIWrBil
         uc9w==
X-Forwarded-Encrypted: i=1; AKwUvBzQUkqQqqPrcwUZadgXKkgdCigVagE9BrAPzWf+BV+MZwBm7h0RCIAcVakmDUb49nndMBHyhtFIHB/p1FM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPdxlsZ++gEpVOwm20ftKVSUHbCA3xvT0fBSnjiJqRRm6NC50O
	QV0PhbnOmsGeQ0AQ6dYFZ0b2mhvL6EytmiTs0ZabTwSPsw0gAFxXhYUf
X-Gm-Gg: AYBFou0mwZZ251on+KQjGsazt0zT2bwfad1YhhgBBn1/j8QekfUs2E03ZyjsW7JVYsg
	0eTrQ340dspMsDYKCQ7cvfRI0mcdNqy+LsMUxOdQEWLHbQNKC7SjeL9wM32WYOcQaqcNPJ+M/Qm
	NTxLQJ3iy4ez6Irj94jQtyZjqkJUSLg9zCkB54A6RNeRqs4ing2So3T5f5+bkolYrP5EVxFKxcy
	tUnJzfE+CEjievAGXOeCS1OCtxD9jajkLLn16KWKt2nyyTFVCLC2xnsLbViuvlrfUJhRQPnTM6f
	aww+PdezPqonuUPZIrJt+83JgDgAVXwHTfOTwzf8q3XKqPBB66KzXgthjMO4oyoJCiarpQRciMC
	5jIy7C7nLveIzi+w5ApnvQQaRRm3MSiBNDs8OjWPwrUYwRuuD99siHtu3XVZaqu157Pxwt4kQSE
	NqX/j8G5iVO0AsOyRo79SKbffNXfE5eZp0WAh+kdQ63t9bnQ==
X-Received: by 2002:a17:90b:3b4e:b0:3a1:ef0b:5a0a with SMTP id 98e67ed59e1d1-3a1ef0b5e90mr1835104a91.23.1790532400174;
        Sun, 27 Sep 2026 11:06:40 -0700 (PDT)
Received: from huawei-w510 ([2401:1fe0:5::3b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm5225385a91.3.2026.09.27.11.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:06:39 -0700 (PDT)
From: Zhenyan Wang <maximwang110@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Christian Brauner <brauner@kernel.org>,
	ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhenyan Wang <maximwang110@gmail.com>
Subject: [PATCH 1/2] fs/ntfs3: clear FILE_ATTRIBUTE_READONLY bit when argument 'mode' contains write permission
Date: Sun, 27 Sep 2026 18:03:58 +0000
Message-ID: <20260927180359.3867508-2-maximwang110@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927180359.3867508-1-maximwang110@gmail.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When creating a subdirectory, ntfs3 inherits the parent's
FILE_ATTRIBUTE_READONLY bit unconditionally, which means if the parent
is readonly, the child is readonly by default.

When argument 'mode' does not contain write permission, ntfs3 sets this
bit to 1. However, when mode contains write permission, it does not clear
this bit.

Fix this by clearing FILE_ATTRIBUTE_READONLY when mode contains write
permission.

Signed-off-by: Zhenyan Wang <maximwang110@gmail.com>
---
 fs/ntfs3/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 0c9bd66..6717563 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1273,6 +1273,8 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 
 	if (!(mode & 0222))
 		fa |= FILE_ATTRIBUTE_READONLY;
+	else
+		fa &= ~FILE_ATTRIBUTE_READONLY;
 
 	new_de = kzalloc(PATH_MAX, GFP_KERNEL);
 	if (!new_de) {
-- 
2.53.0

