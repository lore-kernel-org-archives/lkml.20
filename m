Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216836826E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131828; cv=none; b=jnpqYHwC3GFd4Ox8hdAjY2EpSUTC0briTjZ3kEeX9CL8S3Px+H723VYF4kgKZ+s5IvU0CQJa+67aAYnfrMncZ5AM595RpVzT2cy9ST9/O0Mf1t70C4QMC1h5Y475RQcNRGEGVky7JuE+nKFcuNfe8SwmQ+stlYA3SuvNckNed0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131828; c=relaxed/simple;
	bh=29KDYz6cyVhVVU81jwGIJJ7Vfj8k0Jv4KztMaelGLMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vl5OysKWjXKIS5tRmnb9FjSKI8k0/hiKuJbCqT0f78jhrPNZWVjrnuFIIT3P5uIM+KMoPw1fGZPi/vbL4hcLXwqLC7GERqKcI94YKwH8vrKp18/GUio0suh1fGPUO1Kd/9nvrejvH/VPGhyG4S1fQsR1vYSdy9nqmQimYukyJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=Qcz4iVzH; arc=none smtp.client-ip=202.108.3.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="Qcz4iVzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789131823;
	bh=r4hqRXRjzNrFGbKSm0BCwt6eT9Fm75lINYYju3CwLd4=;
	h=From:Subject:Date:Message-ID;
	b=Qcz4iVzHNJ2cvacNfwf0uy3QPrQ84hfGvzPLVRmp7FROBsuLEjYM2Vy8RM4Ovfsu2
	 D3rsfSYjIbALHTxYKfgsDrcbdHhLewbEfxENlB5v0UUPbgRNZDkIe1TPyYmwTcCreY
	 GCykM+FuDJyP5I+GCiqdnUyrHmWKc81an0xnKyNY=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AA3FB9400001AD9; Fri, 11 Sep 2026 21:01:14 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 821336292082
X-SMAIL-UIID: 91FDEAEF2635441B89DEF96B656E5C52-20260911-210114-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+1dbed5969931c19d3eb5@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ceph?] kernel BUG in __open_session
Date: Fri, 11 Sep 2026 21:01:07 +0800
Message-ID: <20260911130108.859638-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aa30f2a.f81106d8.2ab401.0013.GAE@google.com>
References: <6aa30f2a.f81106d8.2ab401.0013.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 50d05c7c76c9

diff --git a/fs/ceph/super.c b/fs/ceph/super.c
index 72935f665f11..0f20d6c5e4bd 100644
--- a/fs/ceph/super.c
+++ b/fs/ceph/super.c
@@ -818,7 +818,11 @@ static struct ceph_fs_client *create_fs_client(struct ceph_mount_options *fsopt,
 					struct ceph_options *opt)
 {
 	struct ceph_fs_client *fsc;
-	int err;
+	int err, num_mon;
+
+	num_mon = opt->num_mon;
+	if (num_mon == 0 || num_mon > CEPH_MAX_MON)
+		return ERR_PTR(-EINVAL);
 
 	fsc = kzalloc_obj(*fsc);
 	if (!fsc) {
