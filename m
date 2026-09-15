Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF254AC167
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490280; cv=none; b=Em4tzD2bVV6ZcgoFQdd3w8MTPnqxCsChUVG5zPi7UFRCzWOQvZ1Ze67hgjjHTWLm87NDI4BGQHzXdE61HcEuEd0cihTbnVeIacAFxhSG0ElYFUWMj6EqU8qPv9UkNf2V6ecxm/EVVFTj82rJKTw82L9nztcvq+FjuFdb9qrbAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490280; c=relaxed/simple;
	bh=KPKPGF5qsUQqYvKCR/MMxXPy5D1ntqEEj0Sa7swQ5r8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2LGkBRexNytTiUK5yjyuDiT5qU32nGY8y6l+vmZRpqf0Riru42wYeDJRIr9DUfAzZgIK0XfiPArbtddVP+feWVadcKBmNmx6c0FGqa/7OyWY5Z2sEID7t89y5FI0v4378ZfAyxz3oAT+mq6qRN0MA0cmS3/6lZEjw3xzjcaMqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClksJwj9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClksJwj9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so1197897f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490277; x=1790095077; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mP3itgi5VQlf+VGvNzurDARzBqpMd7On/zzuIfwN8vA=;
        b=ClksJwj9NL9O5VrFv1vXx/Av2PseudcXqXs9dmbmj2kCGAaxOnqMZWpwgGBsvU1L/k
         RjvdfE031DE5SJu2pDR0n4n+Me8LhEZ1L5Vvo5ENieEMDV2BpcTe5AZynDer0iPH7hCE
         6o1iUd6+NSB1H+VQoS9y+eYPBjWRlpmMMnj8LeTfxFnjlv/uSqp6ZN1F2eLTLRtkGbvR
         YTb5/QgkIgh3tZiDBzOA1MeT0vYBKrwAB3qTXBz9eYHmMi5o+arN8Jcf5ufHanQpeOdJ
         OzqForr+4dC/dKkNtGwRPaTvoJnW0vEXWxzgfPD8lsXWVPIPwlOavQtSF+iF03VY2I2N
         RJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490277; x=1790095077;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP3itgi5VQlf+VGvNzurDARzBqpMd7On/zzuIfwN8vA=;
        b=mFJ9zgr/IwIgucawgzZr14vb5+XHllI8kaM0zXxBQMQut3qZqyvQjuGCGCvn7XsPly
         pjYOsnQVmVfWIzFu3akNQczAg4zhngqjeMI00szFt5Ie1FsDOMO4fRmV/5HGVAlLhHjD
         bxY+u3XgPa2xQQ3SS7p6Y/4sefuFU8IxSU97qSyCk8S3i4OLNmTbAQo2gqzXnOqEms2B
         PKovw2LcLeJMTC1LqzdL2VdDWHugWButfyNFtUiGO9kFEDZwAnj1iIm/ImE9XwKxuuj4
         A9o9rXS3xcDTJMD8izLdP7fKH2erw2WVysuCa7LTfblYO2TgOxXsKEzFSH5bHfYhAYI/
         X9/A==
X-Forwarded-Encrypted: i=1; AKwUvBzBP7J5VZ/ZSXQnfT1PB1F7RaED0l4IcL91MEdL81OmuJFnGh77K2wiDYPVJs7G3snK0D74VP+0ds+V1hw=@vger.kernel.org
X-Gm-Message-State: AFuF++kTXguz3DzrsfKd8qcCzmOw1nnnT+2jSOVwGqq4INNCRfYdFnsa
	97DF+RDTgVRVs7WGRNyp8gxmISDk2h4pNMTAsyRY7ORal324yFPqn6f2
X-Gm-Gg: AYBFou30Kk8XiD0cRmu5fqCQe2gx6IAYx7OEn2Fk3m2MTsg0MrIOQ34EHPh+B+1tA2x
	aCq2RPeOl/FydNMFJ/1EvTWOS9DwSmtJ6kuXQcOfCQgjkkAdeDg8n/NzLiIc9Z038T88i2UTn7P
	dkGdNtxbVFFeH5MHU/Kfa2iq8PQu+SwdZgmLOvEBxhjqsUnskcTTZATxZ60vRAxAl509TKjoku3
	/pmah+9q/4ES0UfjmmytC9svZjeVdzCiPUMLU+mijf5g+ZugULGBviRvDYv0ldjA3ku1vHu2MdA
	Zh4sh0tmHi0U39g5Bdq1Eke/eJK9+0kEF8NffMDTaNUyXQWs6qFy8jLUY2grzb92zvVXCXmCqcL
	Rlt8n51fj0zAWrX+rYSQ+/8k2Yu+OlT+LiLYwVG3MYBaEDwgrPodszgTXqfV7lBqwsLYchWaNgP
	ZRLGn+ebrsn72zec07wf2yWo4To1aOgWjABFfE4sozj0OV3/GvLRp4QAtUZYDR32ieM/hPskR3N
	tkLlQ==
X-Received: by 2002:a5d:64ee:0:b0:487:342:eb37 with SMTP id ffacd0b85a97d-48705a44316mr6723385f8f.7.1789490277250;
        Tue, 15 Sep 2026 09:37:57 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf34440sm233295f8f.25.2026.09.15.09.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:37:56 -0700 (PDT)
Date: Tue, 15 Sep 2026 19:37:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] vfs: clean up indenting in lookup_open()
Message-ID: <aql0YTgwtRI0VZyG@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These lines are indented too far.  Delete a tab.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/namei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 1dd4ec7d0e62..48b28ed44a9e 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4636,9 +4636,9 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 	if (create_dir) {
 		struct dentry *res = vfs_mkdir_no_perm(idmap, dir_inode, dentry,
 						       mode, &delegated_inode);
-			error = PTR_ERR_OR_ZERO(res);
-			if (!error)
-				dentry = res;
+		error = PTR_ERR_OR_ZERO(res);
+		if (!error)
+			dentry = res;
 	} else {
 		error = vfs_create_no_perm(idmap, dentry, mode, &delegated_inode);
 	}
-- 
2.53.0

