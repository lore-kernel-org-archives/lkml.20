Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7BB47141C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813806; cv=none; b=V2Cr4R+xBcgH+nljwhyz4EvCS0EQUG/1x8lyV8tY11ALQv29HIcNQKTI+BmS89A1afDhgbGcaBAsW/8Ygv2ykPeE13gLbO6iPJHCPRIZOy0WPF2MC50m6+e4ff3bBLj8TrmfpF70Xw/8Hnl1TiYBHVGuhGIhr8RT24Yk8+q/NZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813806; c=relaxed/simple;
	bh=10aNR1/OzVSg92vw+9r9iv8RYBFynhvsIll+J1ZdnXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MN6I9//g/KCOpl+Ky5QAo8qlLyux5ONv1zhBuB7+5NS9FV3cP26t5z0MmC+z1NFUqAzDnq8DMAbWK1HYmCNARWB1ynr+mekmK0uuA3EOvRaVFqAs1WiXpIVEwGDAI5vvjnx/OX7O/HjZazVmpCdq9CaZqA+EqVQCkc2ZREGId9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgljwLFd; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgljwLFd"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469f20513so1401896b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789813805; x=1790418605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DJwFYYvkh3jDIq+va/i9wZ56mvOt+2gnEp9WZYEzLE=;
        b=PgljwLFdwOJLRF+tYUjqhN8HpUMzqks64Em9B5P/yDl3vYlYCnpQQCfwJSbz2NM/wp
         POuGgGCXQ0G91u8S47UPS4PRU+3epeJsbEb6/Dn8ioU8H9q5Pgj1iDJCspOpg9mftVed
         TdzorDzNhv+JPqaPhy3c5knPfny26vahxlRbe0Qx+U1daykGctkS5bGe9kpSQVNzBG+K
         W0ZWEwzjngzugNKgQaXMBk11+i5Dg3SuhkayjSTE5LD+83Y7auidIj/i9rZBxtKyzJI8
         6t1FTv9yjhSC5k9kRz20p3bgH0TaPc+Qzxe21qV8D3+Gf4Pgl4DPTix+81BfjNR1Hnsa
         n+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789813805; x=1790418605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DJwFYYvkh3jDIq+va/i9wZ56mvOt+2gnEp9WZYEzLE=;
        b=rrsevab1Mkfnggwnjudc1iArrzu7kTRsH9L/exuX0EY6a3+Qes2Wh6SxolrDMReSdl
         n93hRg+9pftbOz3WbNbBkYnuAaOzi84Vgds8s43RgZvNWqXz2vtW+I4O9KoIqptNKYF5
         wUrmyZAREY9xDKW7N4lK6fFHH5vOTSrfNz+8v1XNbU/se2NQPE9CYkOth+0wQCQuHAlF
         u2KloaBK53ZxPJYioFUmJb/2Cm638CMkHwf0GI+h/F1NuQ7oSMn/pMWF+lSSYaSWiJYD
         yecSGoBt+cenBeZaCJt4vceUNgv5Zbkb+h71t6S5OYxcB2aLQYPv5Z2vzabfoH4WlbV9
         u+Ig==
X-Forwarded-Encrypted: i=1; AKwUvBx2CM2t98R3hbSJKCy9oTwMsAGjwitJ6X+9RqHLvuXHjomfdR+OvAJ/1ySZdrtaaP7QrvxtPQ6I3sazyJU=@vger.kernel.org
X-Gm-Message-State: AFuF++ndCvdZsHUsD28XnnvD/5nZGI6ijnZ1xBxW43cwtKMMgPDLI/xy
	MHxoyhih8znMV/1rbH3uvFMUA613nsEeImKmKYMFHrHzbI2PJmkKMmR3
X-Gm-Gg: AYBFou1xg7IrwMTqhVINfUrvUF0hWhz1JIYtupoi6gsAlSy2SlLSt/eAfW881zi5v/B
	nEvb1lp3qh9SPB7i5YUFuh4FLLBiBPw4Ur4BhUtBrqmCVTT2E1nqFL9zTjvKcsglmawqEu+NbHU
	hsBaehjGHmS1ppv90YVt/VNEwuNkQK+RIsuCMx0ZBqw0S6fEG+j5nOYsKk+fbIkRMkN6SPuUHh4
	RpsPxaSD2wA+Qid6R39Et6tUul3Pa3SEIxhLjPMsj/qXykwmStjqGn9m/woICBC7v9AA3zb82f/
	S8Z5MUGvJzf3T+GKrEoiJfCWF7tgF0QK2ZaZBTQ5q5s5hdMMWCAAa5/qt2cGtNt/eqtPg/DK69M
	JP+6V1o7DHacxj6Z0MRkjNwflnTMADQdRmy61UVeMHOCFXPyBzXLm4RtkzCtf82CUj2k0HBfZcO
	fEJ1nD2t2hLcE/C7c3L4G4SRzbduiUp/kqsdXkFrOb8WXqcoy7FvF6WaY1dtPsnmT8wMRHVofn4
	r42CuiEasJYPKA/
X-Received: by 2002:a05:6a20:438c:b0:3dd:a197:735f with SMTP id adf61e73a8af0-3dda197740fmr3383216637.56.1789813804679;
        Sat, 19 Sep 2026 03:30:04 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:814e:e9d3:767e:9a2a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aefa9c0sm797164a12.29.2026.09.19.03.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:30:03 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Cc: v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+de6fd6789748a8aa64a0@syzkaller.appspotmail.com
Subject: [PATCH] 9p: bound the xattr size used to allocate the ACL buffer
Date: Sat, 19 Sep 2026 17:29:58 +0700
Message-ID: <20260919102958.142460-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v9fs_fid_get_acl() sizes its kzalloc() buffer from the xattr length
reported by the 9p server. A server, or a syzbot-style fake one, can
report an arbitrarily large value. When it exceeds what the page
allocator can serve, mounting with posixacl,access=client trips:

  WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof
   ___kmalloc_large_node
   v9fs_fid_get_acl
   v9fs_get_acl
   v9fs_inode_from_fid_dotl
   v9fs_get_tree

A valid POSIX ACL always fits in an xattr value, so reject sizes above
XATTR_SIZE_MAX. __v9fs_get_acl() already maps this error to -EIO.

Reported-by: syzbot+de6fd6789748a8aa64a0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=de6fd6789748a8aa64a0
Fixes: 85ff872d3f4a ("fs/9p: Implement POSIX ACL permission checking function")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 fs/9p/acl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/9p/acl.c b/fs/9p/acl.c
index ae7e7cf7523a..0dd7e72bbdd3 100644
--- a/fs/9p/acl.c
+++ b/fs/9p/acl.c
@@ -29,6 +29,9 @@ static struct posix_acl *v9fs_fid_get_acl(struct p9_fid *fid, const char *name)
 		return ERR_PTR(size);
 	if (size == 0)
 		return ERR_PTR(-ENODATA);
+	/* the size is server-controlled; a valid ACL fits in an xattr */
+	if (size > XATTR_SIZE_MAX)
+		return ERR_PTR(-E2BIG);
 
 	value = kzalloc(size, GFP_NOFS);
 	if (!value)
-- 
2.43.0

