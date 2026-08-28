Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6627C324B20
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787884523; cv=none; b=nPEz3IXOo/kCLaXXbRpEZ2RVlK4WFsh+RilSMaujbVVpyrJia4bO3o7zE3N+SlRqhjmQP+dN5X4oX+3tz4x7eWPOLy7mEIyMQOBwU4olevO/MkL+MGRKleaWMvf3uYmLAxMZcNVoAzC4dz1225/Btj4RfTd74nBnYxHhjcNYgU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787884523; c=relaxed/simple;
	bh=iHNMzq+/NKMUkHH0HQ9xpBgCZzs3t/sTqW7yQBYDjGI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RFDiZtl6ggiuqgb2+vTCo3a8rOmWYbeU93OIic1aFrsFZgqRH7BA6irpy96eHdPMbpML97x5B19eLrMruhY016AZw5c5h0pioDjBdErvRm98nX5Q+T1PZNARib3GLZNtjU15IV6CZDG2+RlzrvjhUqoNAj2FOOWyS+xgA+dAb3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=in1+qzo/; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="in1+qzo/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1787884488;
	bh=dbFXkQZBSmErM+u1il7Juifo5Ap8Xz+VinJFw7kOTJc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=in1+qzo/BDcdokGu2oYL8NuWBW8TROYhby7c56JkfR7+jjMfA2reHyXE6poUWxi7A
	 uXaxR0engre1ZylEDts10WDkiyOR+2VE/nt/tK4YbAXwGNufY+q1QcyMoJoy5KMzg4
	 TFk6JAwApA5lzJypnHz2R9JbKNDAeHMq6KkqZZWg=
X-QQ-mid: zesmtpgz4t1787884473t8203fa20
X-QQ-Originating-IP: jTwvuIzg5eUYVIPrnp4P9QO40+gjkufemVY8L+5fVsw=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 10:34:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1290645837597897669
EX-QQ-RecipientCnt: 5
From: Yichong Chen <chenyichong@uniontech.com>
To: dhowells@redhat.com
Cc: jlayton@kernel.org,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] cachefiles: set HAVE_DATA only after successful writes
Date: Fri, 28 Aug 2026 10:34:29 +0800
Message-Id: <20260828023429.2461803-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ODcDgdcDagQKvPQGwrrszNBI+53qyt70a1E3iPbn6QeUURRBm59Ar8is
	7kMpBj4/SOrffGu+lEAlU24BYySSAn2IE9T99oHFnVCrA/91c467O9C0fT9c7LfwU9wrTyf
	vV5I1VXU/9T4tQbg5b/6ALcUYl6iwidOQEeidchomklC4gol8xUiqh55vh8SyMxC7NL619i
	DhEZCW+NgU99gc+oL8Nnj93gUreyR6JEHYywWukQPt1Qror1GIj9RMpcVJQ0LWKhgRgbvjS
	B4cXMQOaXzKqnScFaMfOobKPbfJx1E0ey8qNRQrIQvw5QUAgMYg1mBEVgF0rGhIX/uDZH5t
	cVQz5CRWQIACLYFPeN7usg/TfVdCyIz48DI8oH9pmRIkfBzwPP8zo1lNdP3GkXiwM1RmTay
	MkLchw/s5wpg2mKgcqNMsS7OciXnsEkfm4/ZYf+jIWMWRJlxiCxRupRibipUQtIc6RcB06l
	UyxifVRQsz3mdbFOe1ACdav0WuUxn6JqhRwG46NYb6wjSKlHxzlmUmfOy1kJam4vqh///Xm
	athbChUi/vFtkrXrfyQuX9aJ/aG1pEPQj0DZofosPgVs+/P70YVR4kl9BOxoIrTMvi+FGU3
	hNL6p4i2M62DZMYSRm5NiCOxvRxcDn+P94f+AFpU+C3GkwZ1riHUC9KYFvLgkgmi43fie7n
	iQu5KuHVjvhSyxR6Rut4j2QgZqDVBfKVewIeaQ2y1XUUBjW+W8mYVAhmMGECyBq+AOq/oF+
	/0ypkFU3gB9tSeDLMscr61sv352Qbl4jYkUUFRotTs6e6NocmF4FmYY0VPP2EvU/2KFSPaP
	SSfbS7eGd2PcsrtQdtbYoUAqWVcbnmMtpwszvl/QA+vogU0ujSjaegr8DRKE6bW7m0bG1o8
	Y3ef+tWZyCEF8dkIKpjFEDsR2XC1bFwi5ugBrYNnysNuA9R7BzshmWzeJZRKGqYaFZP3Mdj
	N6JTSrWS87iF1xex/LmAekrBdvoqomf4XsZwZXEh7AVc0BUrHXbuYueYTjUl7EZRGADNtNa
	bMW6R6x6+tOmA4oym7
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

FSCACHE_COOKIE_HAVE_DATA means that the backend stored data for the cookie.
cachefiles_write_complete() currently sets it unconditionally.  This also
happens when the cache write failed.

A failed cache write should not make fscache_note_page_release() believe
that there is data to read from the cache.  Set the flag only when the
write completion reports that some data was written.

Fixes: 047487c947e8 ("cachefiles: Implement the I/O routines")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/cachefiles/io.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 9540ec25b3cb..0f94ec2aa5c8 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -269,7 +269,8 @@ static void cachefiles_write_complete(struct kiocb *iocb, long ret)
 					  cachefiles_trace_write_error);
 
 	atomic_long_sub(ki->b_writing, &object->volume->cache->b_writing);
-	set_bit(FSCACHE_COOKIE_HAVE_DATA, &object->cookie->flags);
+	if (ret > 0)
+		set_bit(FSCACHE_COOKIE_HAVE_DATA, &object->cookie->flags);
 	if (ki->term_func)
 		ki->term_func(ki->term_func_priv, ret);
 	cachefiles_put_kiocb(ki);
-- 
2.51.0

