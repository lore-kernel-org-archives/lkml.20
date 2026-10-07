Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71851DFDA1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350990; cv=none; b=F4Hm6s8rO1zRqCECNHYGVsblkD0sIzzC7+AcKzWUQ3kJIHT7acyscqKpI9YLPypcKvMfuur/oOZvcpR/nzIIKTKUIeysfXodmpgPdsbH/u0rOZZ3hF2yivYzpDZVq74nHhHJXzW2Yzy73NmEOGNCXy5P12KmudyXLYOUssZ4Ex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350990; c=relaxed/simple;
	bh=RwulzAX00+CO2uWURfkzqyPiAeRgBcELLAoTC6bBjRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcLxOgJkOBCnIENBZKWeHxNJowVrbytP+4HwrHLCDNyLt7sytNYsKS97gZpw3ckoSwkV0QA8rwwD1wvXNCfhJsuUIYq0vbvflPZm7eAcb+gGdt6T1hrsGnT/9q9jMslQpRVjsma8b4QQiDPE+Kjam/yJ3QarC2iyO5hMHxZG7RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=j/pKzMPr; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="j/pKzMPr"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a49623b865so2224362a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1791350988; x=1791955788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z52a6p9Xj9U22/KNTTKc6LTUFoObMps4zLoaKHLJEuc=;
        b=j/pKzMPrRhXpa9cTjaumGPuMMp8NpOFpVCQFjA9j4n4m+p+xhxM22uIaHPjEgJjih5
         gXs9DpZqtPBKNrUsKImjsdMJhe39eQEP4mBtvs6KRzHvCyWioRJ5ObeW84tufq2JgWNc
         HfdgX3oRQXr/wiPczV961bGwplX475uTG+gXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350988; x=1791955788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z52a6p9Xj9U22/KNTTKc6LTUFoObMps4zLoaKHLJEuc=;
        b=Mu9R8xKNVervxhxWo4Vqr6vJr8pbHnDQfNQftCXyfmnLBvPlOfSD5XF2bKnEpEpHGX
         7kNKu+CAVJGVMCN9qMdNEDMrhqvB9WPYIs2DvtzJ79DWl436r4oKEZAXzkMpvngdzunu
         zNEefg9YUeNYU2fVx9husaKs9HwE3KB/yGTGooGaZYeOG6eJOFOX81Q8M4ap13eM9rbh
         Bb01qoT3GERjDfwAI9hNpSIGSiRITtXT2sreXH+nrZvS0DeGZXxQc7a7mBCp8zYXymW6
         ZJ9YlB9M48nZu41P0uQ1ppfK/NtmdXhqczketwPpNpck/vHO25gGHePTuzd+7cRY4+K0
         kjIg==
X-Gm-Message-State: AFq9FYJ1g5gTHczqFpfNaD/Pc8cwWwujqlksPdbN1Z3BdyFnvl/BA08p
	x6nYfygyL1UiMSbFGw3oBWxwh7RW1Aq+5rzSFOw1R4ggrxEfTjqq+nSsJjaXvkK5jyU=
X-Gm-Gg: AYBFou2JTfVNEempw/ZTDbIeK+htChimIpg3ASI15WaAh8H2nIVqiQT4+oms+RgXcF0
	gpvFnuzZaz7nnOxZe3lgYDx1NLxE4In1g48yCm4LV6SUL3uZP0wqVnhyX5YbPbKgu6MVtarzxV9
	XXTOWTWQ+MS6egxkGk//Fx2zcfknnlUVJdSVk1nL3ieIcXpA8IP1MNH3Vb2014y0icz+afHcjz+
	cvLVDsZTFkNe+G8JM1/217uE9Ux/qNm537cqY21NPPXPngs5qT4W9gP/M/99FMLP2zFO8VrqBvr
	ooJ4cqrKTT6diDHRMiiAwYFDwy6z+hsHKIU5pa2or8iu+ZgNo0ATC1VaI+ex4N7wAerih7hmAzQ
	MQZ3Jp/m/Dr0XJtjPPZOvpoZaF+OqC3rQEz3cEErJkSM2KoLCSn5slu8CnJZsxY9xDUoEaJwus2
	EkJ55RW2iXEJQc2GvwawQaRGZq+4XwkKBlOtVx75DEu+u0+m+EvZE0OhSeReNLOc0NbCVUGMbRe
	Iv8lTsmne2eqwSggWD6D4zYZHN8pDY=
X-Received: by 2002:a17:90b:3c06:b0:3a8:9751:14df with SMTP id 98e67ed59e1d1-3a8a1b594e3mr973348a91.18.1791350987781;
        Tue, 06 Oct 2026 22:29:47 -0700 (PDT)
Received: from kinako (softbank126255145177.bbtec.net. [126.255.145.177])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm8208425a91.13.2026.10.06.22.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:29:47 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v2 1/2] tools/nolibc: Add dirfd()
Date: Wed,  7 Oct 2026 14:29:12 +0900
Message-ID: <20261007052914.888956-2-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007052914.888956-1-daniel@thingy.jp>
References: <20261007052914.888956-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is useful for things like fstatat() on children of a directory
opened with opendir().

At the same time use the new internal helper to replace the two places
that are converting the DIR pointer back into an fd.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/dirent.h | 38 +++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 4e02ef25e72d..d282ea8eb5d3 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -27,6 +27,18 @@ typedef struct {
 	char dummy[1];
 } DIR;
 
+/* Internal dirfd() that does not set errno */
+static __attribute__((unused))
+int __nolibc_dirfd(DIR *dirp)
+{
+	intptr_t i = (intptr_t)dirp;
+
+	if (i >= 0)
+		return -1;
+
+	return ~i;
+}
+
 static __attribute__((unused))
 DIR *fdopendir(int fd)
 {
@@ -49,15 +61,27 @@ DIR *opendir(const char *name)
 }
 
 static __attribute__((unused))
-int closedir(DIR *dirp)
+int dirfd(DIR *dirp)
 {
-	intptr_t i = (intptr_t)dirp;
+	int fd = __nolibc_dirfd(dirp);
 
-	if (i >= 0) {
+	if (fd < 0) {
 		SET_ERRNO(EBADF);
 		return -1;
 	}
-	return close(~i);
+
+	return fd;
+}
+
+static __attribute__((unused))
+int closedir(DIR *dirp)
+{
+	int fd = dirfd(dirp);
+
+	if (fd < 0)
+		return -1;
+
+	return close(fd);
 }
 
 static __attribute__((unused))
@@ -65,14 +89,12 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 {
 	char buf[sizeof(struct linux_dirent64) + NAME_MAX + 1] __nolibc_aligned_as(struct linux_dirent64);
 	struct linux_dirent64 *ldir = (void *)buf;
-	intptr_t i = (intptr_t)dirp;
 	int fd, ret;
 
-	if (i >= 0)
+	fd = __nolibc_dirfd(dirp);
+	if (fd < 0)
 		return EBADF;
 
-	fd = ~i;
-
 	ret = _sys_getdents64(fd, ldir, sizeof(buf));
 	if (ret < 0)
 		return -ret;
-- 
2.53.0

