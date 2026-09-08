Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A8F4CB8C0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892585; cv=none; b=TVJUef5/Bv3fHONZjngyOOl776ZYS86yJmlXfvsQsKn1qXRVFsL6Gk50prCeir5p+xM8fXCDBKRg8h1Ys0iBAaKHU/2vyjrL/ccJcF0hr2bnPi4k/gP1ZyzK7jlnDwLXoasgN8irIEqOgbv4mT4wt0EiOJeToB/OGNdRh5OvHu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892585; c=relaxed/simple;
	bh=X2f6y+PvEknVvBPCY9H1j4smNvHqxddfu1MtYEZcdoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X5hIGCALTxavyWrTnkZnXuw+cqmWOULe0AAd7WHkIraK2KY+J+UNet1ti/JozCjlF0B5/UudQE3GjNpI8ldp1XEhLgVCdErH/Ctyik8K8exHn2OHaSmNrJ8V2Qe1UjbFZtQnOA6NGNhSKXVd9QIqClM+j6h72PwMqhrUThe6Zak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ion1NeRU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ion1NeRU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso4609430a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892577; x=1789497377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J03j5Oa+4o/cWwbhDEZ20AHDlnfgmdHJGREi3xwk5Pc=;
        b=ion1NeRUByGlgwTonLcMQz6vMwbIsASqFqkBlW+dYuYQT0MIGILIY0gAEMqGU6FdOx
         yyjQHlWd3r/tUg9nljPkvCyY66FAhOk1Qo8xErd8cygTTV0fsVVJl0KoXeSVJ/sRcBxM
         PLUkLjer12lCr/5enP20fzgTjB1r7acFZBhe/EZRsBpypjtR/biA+K9InVrsIEpL0lBv
         DQF+gx4EsgXrmnsfD9JEib4lm+Md/W7TLdTq4hHPXJIqqZaLGRSyax6OeZH/pmti2IKl
         rVJRKpnSyByJ5fK30+RnBNrFA2q8kblG51I40m154hs43LruTrUxXlXeVSn/xWadv0j8
         44cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892577; x=1789497377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J03j5Oa+4o/cWwbhDEZ20AHDlnfgmdHJGREi3xwk5Pc=;
        b=VLYXiRVqvI5niB1nAvSuLv5awPHDzCClP5FzyUwWHLYapxEl1wiDr1OM9ig/Ec4BHx
         patlMhiM+ZCTQQDvSJ0NRK6iq8OIpMFLuXyO/yr22PQXEJyK9qsRw1Ru0iGb2+4NlQfW
         xeSzZH15CAl8kIO1vS0WSZ6REX3yp+aUM055s28BTNmpzxGG/0e59FehwJ81xaOGnpJM
         ANIwSiTS9fcgEY7TSvO6JAPAdLfX3V9j61DNOyHENveYOCDEXrR9d3Ebl75SN5XKb0Kh
         8n+KtaIUBnR90G0jh47c542dg7MDW6Ew/JUHvgKP1E939WxJGihV9rkUuR55KNzVmGQx
         xzHg==
X-Forwarded-Encrypted: i=1; AKwUvBzguiyNJgc5gLwFkVSTyH6ErY0zeKjXQs5JLQvvG/GFnjFn+cpzukPaVvnFbpSyG5zUX0BDkaN9ctxkAgY=@vger.kernel.org
X-Gm-Message-State: AFuF++lTwmP/V6GN23R3rLqs88aB7dIWDCO5XiMTJJF+tr+mnjyz1fyv
	fhFGGW1rO+qACR5UxBJePdTJE8uD3FZr6Ufg5i/X9lJIS6oS5IItOHjO
X-Gm-Gg: AYBFou0/ffdpa4LKa9FpbZ/qLh74EHmFcwgBCHgEz8VFIhdqcOjuFxxUNSDNrqTmwNn
	Mg4JEi/jyhcOAbN3ejzADcXev/N/ZF6wl8JQKVaoOvz+MWg5HD5wz/kMkcXrgsIE6BUbTtzQyhI
	q6LXtpeTBgqMKGW0Jj6lqghTR9pP+d6G09+Tl9mvVjihuQXTjAhz4klFEzTD6yrQ6z5WpqEQ+BK
	7SnetP14umR3cO8rXOmaanJ/7d3bPUKbJfazL5BtjOJ6B8vEtS8CbC/3Aq5PEWhpQhbmlMFATL7
	6LamdW4cUtsfPb2HrA5re5+gDjE664pGJC6VwaVIS/RN42kCGsmsqngPb96gDH329Zn7dKh+/DE
	XS2vyGcAuKk7Rb5VOyUZXMzRTMi5J8lvh32f2S+KYxiiisqkXVqzFTkyrsZ5KAQdiG26f8sGg2y
	HCIpQbhNuBGk27R+rAc95yiL1/JjhWdydEWYcwMeak48kAU0WaE/qQNHsKtcXCfCQA
X-Received: by 2002:a17:90b:3943:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39b26273e31mr49215313a91.23.1788892576922;
        Tue, 08 Sep 2026 11:36:16 -0700 (PDT)
Received: from G15-5520 ([103.246.195.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm14884906eec.3.2026.09.08.11.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:36:16 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	linux-nfs@vger.kernel.org (open list:NFS, SUNRPC, AND LOCKD CLIENTS),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] NFS: replace sprintf() with snprintf() in nfs_root_setup
Date: Tue,  8 Sep 2026 18:34:44 +0000
Message-ID: <20260908183444.183687-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with snprintf() to perform bounds checking when
formatting.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 fs/nfs/nfsroot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/nfsroot.c b/fs/nfs/nfsroot.c
index 432612d22437..d2c26d5378a6 100644
--- a/fs/nfs/nfsroot.c
+++ b/fs/nfs/nfsroot.c
@@ -144,7 +144,7 @@ static int __init nfs_root_setup(char *line)
 		size_t n = strlen(line) + sizeof(NFS_ROOT) - 1;
 		if (n >= sizeof(nfs_root_parms))
 			line[sizeof(nfs_root_parms) - sizeof(NFS_ROOT) - 2] = '\0';
-		sprintf(nfs_root_parms, NFS_ROOT, line);
+		snprintf(nfs_root_parms, sizeof(nfs_root_parms), NFS_ROOT, line);
 	}
 
 	/*
-- 
2.53.0

