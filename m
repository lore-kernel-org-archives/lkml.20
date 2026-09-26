Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0803282F01
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430460; cv=none; b=R7u7CLYp+6MJoX7Xwrf0D+DzwlBkxmYlszckE3ceehoN1V72obnKoLUut0uh6jCZB4Ih/OF9kxuEzTknN7KqmbBJJPnu/d+1OeFODfk14bBpC8d15xNbGRvav8DbfO1Yiq8pSqNYC9k0pkDlosacsFX/EoPnpcAtk6FJv5T8Iao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430460; c=relaxed/simple;
	bh=tQFF9BLw7VOfvbaawIs6NuKTflkxcILkdgKzZb6bEAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuPOKod73TZKJNU3w4PXenQ+mwV/V10nJE7CTsf5kn9hTlIVsDB0r7rnmwYTDYSbCoFouhI+VpLifATvBz64VP+tSgqm68O3bXwCQAlD7daX9K3CF5HKDgnI+dwNn5vNdSaAU39K5NkNY4gYGvYuz3GtHUQZBPzRJJAX8AQ4APo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjGb0v41; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjGb0v41"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso2078495eec.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430458; x=1791035258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJYMhqDKm5GhyNvxQ9MB4u6a1fm3m9so/DIypwQkZ0k=;
        b=kjGb0v410zY+XKDVSfYy+MwANYt4CaWLllOe2X0dvUlwzdRwltVXC7RAmgR1iFSrPW
         j8ojs/ixW+CbCy7THPvOi0zaM6So38nUWj4I5+YbKWDzVs6EkLOYdQpGbizR1/IGeeLZ
         OVBqSVpaI7VpZmTBsRM/oH3+wTzphdotVHekd5xuzyQZZ5mx5m0KfIhDXPTaNL6p9CFt
         ZINw7g/yxbUVhRUx0Nikz+A332Tg4B/dQ/zMru/XGFFXipnQaKS7/AXWNyw79lVHf+XD
         MekjaTPmrSRuz/z8/pr8h2ek3VTiOhWNayf8Kfj5nG0bd2joaIJJL1equE/qmt9WFwlt
         1cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430458; x=1791035258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJYMhqDKm5GhyNvxQ9MB4u6a1fm3m9so/DIypwQkZ0k=;
        b=jOXS9KkCkCEaycEit8Xhua/gfHLiW527YmLyIRya+AINs5pLGqrEl8XXbtEd43T2EK
         /TAs/3Yem+w1vPZ99GDC17+3qeM8/8/o+8BbdTs9dWDaVe0Xpcx841tTEDCaBj20dMTE
         rE6o40IWcW+JNjAqlFsLoDHkw4Qt2PQtMxsrE0WKLOMfonmkbvJqZ74iskARYxfBUvr0
         BqR00sMu/z9vxgNC23oLGnNkhO6GvtFigzST4uw4SmcIOzFIpv2+annnxKqfLUirn64b
         rEeHVnvL/2rdxcZb749I+JSZYBI/1+EDBhN0Ce+Wzk5gJMYqhQCHiSCl8p7g5RXicpDo
         JUkw==
X-Forwarded-Encrypted: i=1; AKwUvBwuxL/1/7j2aEDmI1yNZbnJ87h6mEP0XaZT8dSZ6DLV7LGo8O3r1LMt6qCattX+VvMcq0goKKbnFOe4dNg=@vger.kernel.org
X-Gm-Message-State: AFuF++nBG7ctUrC4xPdEAEoZyrUIuWvyZsflUC2V8vKxSKK0DcBynhcG
	d6lm/96oF94aN9r1oc658yoyLABPEK21b/kUGOcgR6rfByyKiMr8SXJW
X-Gm-Gg: AYBFou1Tv5dPhSQQEy+BFwGHWGaOk+VC0gMa9YMfIKbeiy/VJUoqevI4xTe2Mcnpqhp
	5i6yS1XZQNIxuoOtByB9N/W/AaKMMjSJ3OZ+5cBpti9nXwjJAfw00VLOTecOgn0V5wB0mWMlAI/
	28o4VYMqJyeWaaOIt9g3dV+CE36Iriap/UNzHaUG9+f9C56z2XXuw8fHteSvY0H7ZnU4HeDJJ1b
	Hp4qQYKkKKJAfR5zZs9c3cPnWqvmEKLmz56FlANsdmac/Mj7yWJrwwM7QL1Vqz7RSux5bDbQCg3
	OfK7hLTSeYOG5jvVQBSmQwg1YPG5sJI+c47Dc7My2O0d8j+WWJzuu38OOThkEnaaxlENOa0Sx1s
	l4jn4cqBpbtx94880g1KLlIiwLIIl2RTiN/UDpT9VoXl4rulEuqYpFMfDkKV8udXd5kyU5FZ3OA
	zqZyHyvH8rbEiyrd3TrPbzbbn3zR9IS0Z+mU7xKxpGcoqb2Rqd1ZPjBBjqakVC0EU=
X-Received: by 2002:a05:7023:a5c:10b0:144:f9e5:c355 with SMTP id a92af1059eb24-146d058dcb5mr3102537c88.41.1790430457523;
        Sat, 26 Sep 2026 06:47:37 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm14942565eec.17.2026.09.26.06.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:47:37 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v2 0/2] debugfs: fix UAF and double-free in debugfs_str read/write
Date: Sat, 26 Sep 2026 10:47:26 -0300
Message-ID: <20260926134726.1063068-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092647-ebony-unlatch-d3d0@gregkh>
References: <2026092647-ebony-unlatch-d3d0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 26, 2026 at 08:53:06AM +0200, Greg Kroah-Hartman wrote:
> Did you forget an Assisted-by: tag here?

Yes, apologies.  Both patches now carry:

  Assisted-by: sashiko.dev <sashiko-bot@kernel.org>

> And how was this found and tested?

sashiko.dev flagged that the write path uses rcu_assign_pointer() /
synchronize_rcu() / kfree() but the read path dereferences the same
pointer without rcu_read_lock().  I then manually reviewed the write
path and found the second issue: no mutual exclusion between concurrent
writers, leading to a double-free of `old`.

Tested on QEMU/KVM with CONFIG_KASAN=y.  The double-free in the write
path reproduces immediately (~3900 KASAN reports in a single run with 8
concurrent writers):

  BUG: KASAN: double-free in debugfs_write_file_str+0x194/0x200

Full splat is included in patch 2/2.

The read-path UAF has a narrower race window (just a couple of
instructions between pointer load and strlen()) and did not trigger in
KASAN testing, but it is structurally obvious: the write path calls
synchronize_rcu() + kfree(old) and the read path does not hold
rcu_read_lock().

> And what kernel was tested, debugfs strings were changed a bunch in 7.1,
> what bug report are you working off of here?

Verified against torvalds/linux master at v7.3-rc4 (commit
6812ce4e4379, 2026-09-26).  Both bugs are present in the current code
at debugfs_read_file_str() and debugfs_write_file_str() in
fs/debugfs/file.c.

This is not from a bug report.  It was found by sashiko.dev reviewing
an adjacent patch and I verified it independently.

> and shouldn't this be multiple patches as you are doing two different
> things?

Agreed.  Split into two patches below.

Aldo Ariel Panzardo (2):
  debugfs: fix use-after-free in debugfs_read_file_str()
  debugfs: serialize concurrent writers in debugfs_write_file_str()

 fs/debugfs/file.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

--
2.43.0
