Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363996;
	b=ZYeLIoG25+9TbLRI88d1WkFkJ1jMEbHULGMPZVzBMnDUl9jrWAdtPKLz1Se7XIUx37cG
	 iBU57NpEPa9CxZXfGlcNnW26RfhEtJjCsx6Z67KVg2KUJUO84O8V8IJ8Rxvc8Tb/2deVZ
	 1T103MpEXbb/2ADOHD9W6xFzMStG/6LjMInbh7c/u+wgqOR7NJ81C7svrFCD88u4JxQip
	 01UI9C0hgPIxAQg/kNoon40R7GZp1hZD2O5EhHJCFvPex6wLutC7rbQbWRY/V4Jh+5mLc
	 +TALslWu++bfs0SLXhnYvTbJKGntfQGlTplFCoLRvjbEqTGqbMHa7E2tQgdnBFN9d2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1KaBBNRkubak3FMTFfY4sBxEh/vBQKes4YxguyRgqq4=;
	b=vlZWE5jwMcaXVDlWNT7tfJQDMd4BPUqhr+57iW7H4SQ8ipoRf/BBbyaive4Zv7gv4YM6
	 aMI924zn8Av0YQUAiDhTz+uuyUDA8RBzyarWgj5SsXLuca+3fdl1sLVPk474Uw2SiEyNn
	 ECf1xKdL/WK9L3rB5kPlHjoTA/Qd8HXK74oa0kPDu2/RRNMB4v7YFTaYuZN7E7zTCWz2m
	 3b76dvHoNLik0rDmPNzVBKzWBKU/ZhcsQs9kEbJ8vPU+AMQa6o+/Tc4i0OmCg06GrgLXq
	 QLnfSeDu4C+C7waVYIS7K3SPVShfDdELXF9kczD2ny/ZhxZ7WktW4dQisq6c2vFFN4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ja3ASSH/";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9364B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9364B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ja3ASSH/
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so624037f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363994; x=1793968794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1KaBBNRkubak3FMTFfY4sBxEh/vBQKes4YxguyRgqq4=;
        b=ja3ASSH/iE95Go5UBevpUcMxsL/Vg80+7lCs6UIB7u3l3kbsbyrJ6P/8k/5+IFKOvH
         B7yn/tq8CT74wXWyPq36GasVJcMVdc00E1lLzkDx2aWtyyBtfljSRnFAgGKcqps+Hqa3
         lLRxLtBezMavP1A+PBajIBjD4U5aARsjheb4teH5/s3DmOc1tAloAeSHpYeo1wGwIcF8
         gtqShB7RxUgP4oRWpenW27vWc7AXu103TGk3alXPxEu2BOe/2oWQvj8vv23m9KZt1M8V
         CTaZHWH71u08+EbG6tM7pqEIiHeK7qkaiAOY5PlNO6jNQtE2lN5YwrbdS0JVhBIdPYD1
         tlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363994; x=1793968794;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KaBBNRkubak3FMTFfY4sBxEh/vBQKes4YxguyRgqq4=;
        b=hx228e+A87jrd+jO54G1D0UbosyEwcWsijOZDqXUUzLtsMh0B2phI/R3MOkLJZ5es0
         d2QP/GrS4dtcyAOg5DeGC+QPZG+4TvQUdL9nKuu3XyyfH+9pBK6TMhpQgg84Dtfez8lS
         n479flGSaob7bwPrzwsG1BaA0O4SMe47hHfPc2dE4i5GzxFk6oWfajLkHNOCMO8gLNCM
         s0Uz2yQn8lBoJaE0KBg/UWMEqvf2/B+XjckbItEXHY2g+WlYTUd6MwOWIG6RjFI11eLl
         FCJ1CBCJx7OiaN4b9YPPqpQloS2zDEjlu3C4I+0hJbNzlP3qLV5WgQRRlMBWvYZ5lVZt
         3Ong==
X-Forwarded-Encrypted: i=1; AKwUvBwFCs5ioCEmPc5pp4jtnIDbmv1y/TZ90n57LQszJIGomUax15eT+ulu5gJda9ItEZ9lU3UCetHhJLippIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuZUEO23Ccy3Q1/hoTWeg/w6Q8A5E+c5lQxVgab9w0JWZTNI4q
	jfzTurZ+6JKJdtx9KzBrfXBcUsP0o198p6+dzvEFXn5Pr2jqlFxvg+ja
X-Gm-Gg: AYBFou2imZ/+bKfycQW0Tw2YB13Q/W0hrLJChnzip+WNZRgZ+jFJTqjyvHh/Jq2EtgF
	DG9LEs3+ePiHdiTODTr3BAB9QcKtv7wOk0O+y07ou5Nf/pWnpdJ0VbnIdu23zhhljpS0w8k82xw
	1gYQZXSKyiesWV8BK7iF2kFb10OglcieV43s3KwQSY/zRwAYLc4RpK+JHI341am2yrK7bjbtfrW
	EtFcFfTcucjc7K5xz4HfJ/x+ZV2qoKp0OGNunlsfhMhAp6A7Nmsf5JUYtk4llkla2zb2GpLNNiQ
	t1vVwLRfY+Fi7Ut/GDCTxSA+F02mPuyyGlDRv+dfNhlcHxcPwzfE7scKyCR64/L7mL4qX45e/pT
	buY3j0ueQ1DWh3CfkLjy0NraKCr5NN92K/1zghozPciRuoqDQ/QlP7k2RXDrz9AX6LcAA7YfkJL
	m/T+aA7v2aGtERDyRt/ev+nCzNrnHOgr57xtPUDiXhvgERnm3jkMcY1s9xwmqd1ad//L44QgFEa
	SaAYoGSAu85Cm73kAbuwLLISFFMdTcb3EdZSRv9A4kaV44eaqAPqpD+91cANdBifT4SRxd5593r
	ytRKs7s6so0S9vf7o5zzwqeEbQJkieBzrN6jbLfbZrDNVRwGZe79gEAAsJvbbboMDJ0dZpjgHrs
	BWJM0hxR5DYzMgL2HNe8=
X-Received: by 2002:a05:6000:184d:b0:48d:fbf2:555f with SMTP id ffacd0b85a97d-48e6e518487mr4939043f8f.55.1793363993996;
        Fri, 30 Oct 2026 05:39:53 -0700 (PDT)
Received: from meven-thinkpad.home (2a01cb088745e00090de407b41070a01.ipv6.abo.wanadoo.fr. [2a01:cb08:8745:e000:90de:407b:4107:a01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm3088971f8f.23.2026.10.30.05.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:39:53 -0700 (PDT)
From: "=?UTF-8?q?M=C3=A9ven=20Car?=" <meven29@gmail.com>
X-Google-Original-From: =?UTF-8?q?M=C3=A9ven=20Car?= <meven@kde.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] fs: add filename_utimensat()
Date: Fri, 30 Oct 2026 13:39:43 +0100
Message-ID: <20261030123945.1704118-2-meven@kde.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030123945.1704118-1-meven@kde.org>
References: <20261030123945.1704118-1-meven@kde.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Copy utilities that preserve timestamps, like cp -p or a file manager,
set the times of every copy after its last write. To do that through
io_uring, the request needs the utimensat() lookup on a name that was
imported at submission time.

io_uring takes the path of a request when it is submitted and looks it
up later, from a worker thread. The path ops it already has call the
filename_*() helpers of fs/namei.c with a struct filename. utimensat(2)
had no such helper: do_utimes_path() took the user pointer and imported
the name itself.

Split the lookup and the vfs_utimes() call out of do_utimes_path() into
filename_utimensat(), declared in fs/internal.h next to the other
filename_*() helpers. do_utimes_path() now only imports the name.

Signed-off-by: Méven Car <meven@kde.org>
---
 fs/internal.h |  2 ++
 fs/utimes.c   | 12 +++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index c658c8a5ebd5..985b2bc5895e 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -63,6 +63,8 @@ int filename_mknodat(int dfd, struct filename *name, umode_t mode, unsigned int
 int filename_symlinkat(struct filename *from, int newdfd, struct filename *to);
 int filename_linkat(int olddfd, struct filename *old, int newdfd,
 			struct filename *new, int flags);
+int filename_utimensat(int dfd, struct filename *name,
+		       struct timespec64 *times, int flags);
 int vfs_tmpfile(struct mnt_idmap *idmap,
 		const struct path *parentpath,
 		struct file *file, umode_t mode);
diff --git a/fs/utimes.c b/fs/utimes.c
index e22664e4115f..8072f05ac8dc 100644
--- a/fs/utimes.c
+++ b/fs/utimes.c
@@ -79,8 +79,8 @@ int vfs_utimes(const struct path *path, struct timespec64 *times)
 }
 EXPORT_SYMBOL_GPL(vfs_utimes);
 
-static int do_utimes_path(int dfd, const char __user *filename,
-		struct timespec64 *times, int flags)
+int filename_utimensat(int dfd, struct filename *name,
+		       struct timespec64 *times, int flags)
 {
 	struct path path;
 	int lookup_flags = 0, error;
@@ -91,7 +91,6 @@ static int do_utimes_path(int dfd, const char __user *filename,
 	if (!(flags & AT_SYMLINK_NOFOLLOW))
 		lookup_flags |= LOOKUP_FOLLOW;
 
-	CLASS(filename_uflags, name)(filename, flags);
 retry:
 	error = filename_lookup(dfd, name, lookup_flags, &path, NULL);
 	if (error)
@@ -105,6 +104,13 @@ static int do_utimes_path(int dfd, const char __user *filename,
 	return error;
 }
 
+static int do_utimes_path(int dfd, const char __user *filename,
+		struct timespec64 *times, int flags)
+{
+	CLASS(filename_uflags, name)(filename, flags);
+	return filename_utimensat(dfd, name, times, flags);
+}
+
 static int do_utimes_fd(int fd, struct timespec64 *times, int flags)
 {
 	if (flags)
-- 
2.56.0

