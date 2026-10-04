Received: from mvsmtppost15.nm.naver.com (mvsmtppost15.nm.naver.com [61.247.196.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE9421242
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.247.196.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791118301; cv=none; b=EsrdN5na4oknlZsMYqy3WwMGo24XmlanMlZhnm74Nf57g49uH/HR75dJULCipFgyWZaa7CEwuEbWoI9apbV78TfIp0q2bzNhC4nxnezBYmnu0Rlv/5ZmolLBa1mcIFNHaZwQah27EceOUTyMNAe+dvMVeLgHOVMLtahCgTanII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791118301; c=relaxed/simple;
	bh=C6vVqeK2FOLYta7MPGKeywkWPkllVVZeURs+a9k/bB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/YJ6m/fk0+jXs5OQQmxmhN5Emerw1h1f7DJQrGzbpOiPvKoG3bR0hsCIDCPL3AM2TofOKlNaKLVkaELqKFLc8qVAFspAUF0jc+sChoD/gIkKn/eTMleLXcY1V81BQ3Y0kcwvrc8BQtONgacNONGJoDX+Zqwm5ux471tq2PpRTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=CmQ7yN07; arc=none smtp.client-ip=61.247.196.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="CmQ7yN07"
Received: from cvsendbo007.nm ([10.112.22.31])
  by mvsmtppost15.nm.naver.com with ESMTP id -9gMIX9iTJGNeFbpK8ZYsA
  for <linux-kernel@vger.kernel.org>;
  Sun, 04 Oct 2026 12:31:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791117082; bh=C6vVqeK2FOLYta7MPGKeywkWPkllVVZeURs+a9k/bB4=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=CmQ7yN07Zdb6vGHihEh569OZpI1V5RE9IQOeWPah2dXfVShTmpSw393eMlxDpVzKt
	 6Aim7kbD0HsVB4Aoh91GNZnKSB7E3w6z5hG5J/z+EsA9Hk9DYA8z9e1enEIxw9lK+I
	 gyH8LUD8Rgo/2LJ1q3Ns5lglPlBCWXX6mfJ0EiphvuqW3bmpCXeMsszM0/dyjJZjDs
	 48iJV4hUDwH10YYSUzYMfG8h0wCzGUfAgekixwrWZ94ZiPa3Mxxgu08ROmHb14lxap
	 TmewhI5LjbQ+Of66wWJL2KsALOXtAM5tFSgNIPyWSRqOs8xd4uatvyXTaXyh4u9mKi
	 Z19wdwv12DFYQ==
X-Session-ID: MHbCHEbcRTmhnUCyGFZqVQ
X-Works-Send-Opt: OPFwpzGdjHmdKHFOMr39Ko3YKHmdjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: PqY/KAulFqJZ+HmwaAMd+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp008.nm.naver.com with ESMTP id MHbCHEbcRTmhnUCyGFZqVQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sun, 04 Oct 2026 12:31:21 -0000
From: sungbyeongchan <tjdqudcks0424@naver.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] jfs: reject external xattrs larger than their extent
Date: Sun,  4 Oct 2026 21:31:12 +0900
Message-ID: <20261004123112.584574-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The external extended-attribute descriptor contains both a logical byte
count and an allocated extent length. ea_read() trusts the logical size
when filling the allocated buffer even when the extent contains fewer
bytes.

A corrupt descriptor can therefore leave the end of the buffer
uninitialized. A later getxattr operation can copy a value spanning this
unread area to userspace.

Reject external attribute lists whose logical size exceeds the capacity
represented by the allocated extent. KMSAN reproduced the uninitialized
read on three boots. Size-equals-capacity and patched controls completed
without a report.

Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
---
 fs/jfs/xattr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jfs/xattr.c b/fs/jfs/xattr.c
index 11d7f74d207be..25f82ca829574 100644
--- a/fs/jfs/xattr.c
+++ b/fs/jfs/xattr.c
@@ -370,6 +370,10 @@ static int ea_read(struct inode *ip, struct jfs_ea_list *ealist)
 		jfs_error(sb, "nbytes is 0\n");
 		return -EIO;
 	}
+	if ((u64)nbytes > (u64)lengthDXD(&ji->ea) << sb->s_blocksize_bits) {
+		jfs_error(sb, "EA size exceeds extent capacity\n");
+		return -EIO;
+	}
 
 	/*
 	 * Figure out how many blocks were allocated when this EA list was
-- 
2.43.0

