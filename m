Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFBA26CE2C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311007; cv=none; b=B+B67nQEYIWo7gSqPepfJWFXYdRIVZ8jumtugbbzt8u8IN7xw1ZagX2ECyuknzPM0FdUKzKxEz/OmxptPoXO1nt+lXHGNgvmnxfrVtEKwQB0qZsj6/dP6sdPtQ2AC8FN3OzLp42PHDRCJ6cOw+lt9nxBJHVrxh4kNEdbqLuH9Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311007; c=relaxed/simple;
	bh=K+PLmOasqiFz49SkYI5ZQC8ph7i9n+Ko+tC6kFac36M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyjpNXYS5hByBn6ak4Kt1xwGjWmmY/NbiYVFqGjofDQ/s9XYZNvTTqZNq4hU0ioR0HN1H4rlFhRgOFdS3C/fJHQsb50zMnjjjJUp8qW9W4xgrHHaHQMLLRHN0xH3zJ0eEj4poyJ6GA1NGuRgERJoY5/3yKCFy+/Bpg9RzpqH2ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue86N306; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue86N306"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20371995e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311001; x=1789915801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYu04XwjPKA7ypsZV/R/wfXfVMywl2LPILiCNN7k2X0=;
        b=Ue86N306bpHMXOd9Thm4wxf8hgGgCAN9galG+qJ2pJ7CkAziCtvZgpiBf5RJH8Os6t
         a33BOJYTIfu++pQQQ7r5jEtFxZWd0PL2B2Wvro4mA80Q4SxZcFTlZEzn70GTnSH11QfF
         Hu1/ZWnEeit8wpAorqdBq0VHfzeAXm4xesBUVIsZEeUd69lW6uxUDI9sYC0HWcZL8UOE
         SSw0JxxuoAxpt5WQrWKGtVe1bS/31iJogWmnkOQyNw+MeS+GpIV3hRSf99+gOG3F0Hid
         YRIR/Fu7OFrCU53BruiNSLL7b+re3dJLgo8M+mYG5NmtZZzdo6x6a8jVlvq4+GNgHGur
         9GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311001; x=1789915801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYu04XwjPKA7ypsZV/R/wfXfVMywl2LPILiCNN7k2X0=;
        b=PuLJBmUlgm9EiEvnviFQPHE+Or6DasLtLAbexiGS9jgbNJLFyj4FvM1uIlBXm9U/+N
         Qu1KF3EbBbkQSo89Fus6I4wkodvbe7OXvF2s9+yl1LuEleMnrNwcFCrFEZsu3P4zeaou
         RQ7GpYHu2lADNIhTiNGi+dR2hfG469YmMfVeFSuuD0Pi033obPqZdxqkkGXgZKBEH9d/
         tLWif/39q55Q1bNIJLzg27mD0qGQ9QTexdMSpg4pLqU6vO7qE7qZBmc+uejIC4Q+MT0k
         wBzzo1+bRIednQE7hyjEo3tybeeIuZgjfR7Oiff6U/sQG/NqJpgY+lnxVIo3xcvNUldk
         Sjfg==
X-Forwarded-Encrypted: i=1; AKwUvBx/qN1tEWxO7sqTG2oH5WlavCE5S21caoYXdq7AEgIBnaT4saUwrtMTnvze3gBIsVKEtznHN5VLKHb6t6w=@vger.kernel.org
X-Gm-Message-State: AFuF++k1+YK0sO/WzCwmeXopN3YiP1NYgCDZUcXm3C0B6vc5fsaJQvih
	Z7cZhH+xtmQz3/vbHnesb/EJxxfvIhdJeWuFoT4ZhKOnDxBaEzRVpH/G
X-Gm-Gg: AYBFou1i78MAKV86R5qtOJApId4oQeEOv6FGyMhysFjU8BS5X8h+K6cHR8mm2zxGOhM
	kUCkDautRdg8LU/UH0SViDpouk8oSTXjRfC7x8j8Jyh/8KVH6hplq+/9hNUv8k99BqS5sJAxFMP
	iKNrP6G89nxG7N6WN+1ZsXv2l/puqYZCeOUuvwxtmZMI4O+w1V/vbGHN9oUuLY6txdETOxr9Hgr
	VXfc2697N8uw8towK+4stlZp3dkacnfqAqMmC2Smz+LzIjZzQULuabiXsbAhRnzxnXdpL9eBLQd
	LrEjgJyJzZot60THPQbgObjsXatT6g222GRfHrlYjXkcqzFgFkAgJWzF80BoJMSTqw4Z/hKlvjJ
	yfNwbAlKyb2l+FHxsWOgWsFhlcwlxdHcgfNgvmwo8T+iZNg7Q1zEMgZE5586UDp8i2P3TDjCH0G
	UcqGZthQ5eTDmEOvSYIswZsBNheto3rHtufWWabwg11IWXOBsD7ACe5H0S1GpJB3dpkDvwT2Bd3
	Z3PqN9HmLlce1fDqNiVHzfrsPuFuXCBR9U+O9qQGGE=
X-Received: by 2002:a05:600c:620b:b0:49e:6bce:b0f9 with SMTP id 5b1f17b1804b1-49e6bceb168mr77747365e9.16.1789311001488;
        Sun, 13 Sep 2026 07:50:01 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:50:01 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 07/10] autofs: use path_create()
Date: Sun, 13 Sep 2026 16:49:14 +0200
Message-ID: <20260913144918.1606123-8-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913144918.1606123-1-mjguzik@gmail.com>
References: <20260913144918.1606123-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/autofs/expire.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/autofs/expire.c b/fs/autofs/expire.c
index 5c2d459e1e48..9d19c47dc3cc 100644
--- a/fs/autofs/expire.c
+++ b/fs/autofs/expire.c
@@ -30,12 +30,12 @@ static int autofs_mount_busy(struct vfsmount *mnt,
 			     struct dentry *dentry, unsigned int how)
 {
 	struct dentry *top = dentry;
-	struct path path = {.mnt = mnt, .dentry = dentry};
+	struct path path;
 	int status = 1;
 
 	pr_debug("dentry %p %pd\n", dentry, dentry);
 
-	path_get(&path);
+	path_create(&path, mnt, dentry);
 
 	if (!follow_down_one(&path))
 		goto done;
-- 
2.53.0

