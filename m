Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB99A36194C;
	Thu,  8 Oct 2026 21:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493791; cv=none; b=NjjEQF43CzFQHtwb8VY8jW7hDC6MotuHVv06L4Q0ZIvsjRnG8iIOj3XVF8/1NZOjwxk7FsrH6FahzqikFoJHQ+n8bwA6rjj+1aQzNCpf1fsrX+PWkdMUmSGQk4aCO0ygpUFyNrsT30hT2mxMJbIbhSefud+uLKEVAmrPds5gQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493791; c=relaxed/simple;
	bh=GmXQ5SxYhRzI/e2c38oVygRqTxUrgnmGAt1AI6EQLCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ovnOU+sNX+ST9Hd/gFTwmFKWyeVULJi8IOKALb1bb4B14raNNsbP7Hgco8HikBUVrvYzxyUiOsQaBTSad6hlgpS7CmhdgrJpNUtE0K6lOYYvKyLsHUbnywhfzDWP7IUBe8vCoONXlx6GL6F6IMvMU0VyiDjPKhnFyKOmnkX6qgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AhLoOiUn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AhLoOiUn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=dEaNN5QaqfENY+W8IMAdAhQJTg7qgggAe6er7ZK5B6g=; b=AhLoOiUnODXkJFR+hF+L2u6duR
	6SvFyuDOGm5c5bD4g03iniYvYALEoAZYU4zUzKlMkPoccrAkBbbW2sZUneSFB9GUdz7IbSYvgaEIP
	XMcMMAjMrZA1dAsBnWXIkV/wIBanLxtexmFR0UkotVlWzbRPbynRDnXB/W9prwSPGN0GwjKUo3N4i
	sqdykw1bnyuSAO9qhyX1uGz+rF7dNLUJjEH1FFxhIVcs9AguvMv7F6HnxSorwyx0iA5zM9kjUQJb/
	bOPcj+/mNhzeryQi+xJI0FZrheUKGUKp82umZEjBVU5Na38wROn1QxSAQYuz1pAn2rGpNUzUnsTFu
	ca9GCMSw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvN2-000000053vb-0pQ9;
	Thu, 08 Oct 2026 21:09:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: ioctl-decoding: use a list for bit meanings
Date: Thu,  8 Oct 2026 14:09:43 -0700
Message-ID: <20261008210943.3297085-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make a list of the bits 31-30 meanings so that they don't all
run together in the rendered output.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/userspace-api/ioctl/ioctl-decoding.rst |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linext-2026-1007.orig/Documentation/userspace-api/ioctl/ioctl-decoding.rst
+++ linext-2026-1007/Documentation/userspace-api/ioctl/ioctl-decoding.rst
@@ -11,10 +11,10 @@ uses 3 bits to encode read/write and 13
  ====== ==================================
  bits   meaning
  ====== ==================================
- 31-30	00 - no parameters: uses _IO macro
-	10 - read: _IOR
-	01 - write: _IOW
-	11 - read/write: _IOWR
+ 31-30	* 00 - no parameters: uses _IO macro
+	* 10 - read: _IOR
+	* 01 - write: _IOW
+	* 11 - read/write: _IOWR
 
  29-16	size of arguments
 
