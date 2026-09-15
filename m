Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEC639021A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503851; cv=none; b=lQr+B6TzoEQnv2ydTrcNeKgWVtlW07zv55cbPSeD9MgU3nkNvAXjxlNGwxuni/7DkBc5cDbojMw3YoP90rFpLlDccdumrqXgemtbXX3KaULNpMjCY4vURyrTTlBkFsBV3Kmk3gmVCRlsq25Z5KIuJQneAW/1v98C/ecbpzoZjNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503851; c=relaxed/simple;
	bh=d607VzXe8dE1CE3S5EfLD7UBK43V4xlrtzI6mmpAsco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Npr5FXs+tUJRwcMUM5xa6TIO+alTFCH40nIRotwL3I647p+biRIzgJ0KiJE+2bFIjzEu37khDurLPGSbA0dLwA4maDntkSG3bK4v8TtKAmzbwxMeLn5q6/ZP4B1FkVXdjkC3O4DTNObTirtnrnjVYPsBmE+VVg36uFWZzNKJTeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f77Drhjh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f77Drhjh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648E21F000FF;
	Tue, 15 Sep 2026 20:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789503850;
	bh=tbK5dBu9nRTU3QvieHc3/0LbLcHA07gVdSlPwNAJ1Wc=;
	h=From:To:Cc:Subject:Date;
	b=f77DrhjhRDPVvupB4apEZa6an41Br5nbzOwCCzspB3gl5aQHM9gDvvUBTtGrLO5z0
	 Ed/7m3uT6RpomTpwemThYmRwXwF4Se6z8ROwYgwaFuq4IiCzuu2BTWKthtLM0eseQu
	 nx1NIh+Lo2+OuPCrKjKNLaDOit5ZTcwAkfxjWytZI6Z4s/c1EQ0Wd3zUrinFLrAHc0
	 y8ay1nUarPTC1JI6UzySBU38fuV63tq93e2WF7CIMEGS8cVKMy7zVumaNiA+GGc8V/
	 NawrWEjZousSrqOvNih8IHBPOfUA3PMEPNGx2wEwuEEQ/IxGMR30fTfXhMLb9z/WlW
	 /w4d0sbwP24iQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Ge <hao.ge@linux.dev>,
	Abhishek Bapat <abhishekbapat@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] alloc_tag: avoid implicit padding in uapi
Date: Tue, 15 Sep 2026 22:23:47 +0200
Message-ID: <20260915202404.3568029-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The impliied padding causes a harmless warning when testing the uapi
headers with -Wpadded that could in theory indicate incompatibilies or
data leaks:

./usr/include/linux/alloc_tag.h:41:1: error: padding struct size to alignment boundary with 7 bytes [-Werror=padded]

The code here is fine, but it's better to make the padding explicit
and avoid the warning here.

Fixes: 1d581ab2348c ("alloc_tag: add ioctl to /proc/allocinfo")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/linux/alloc_tag.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index e3ad94444864..7d4618bea043 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -38,6 +38,7 @@ struct allocinfo_counter {
 	__u64 bytes;
 	__u64 calls;
 	__u8 accurate;
+	__u8 pad[7];
 } __attribute__((aligned(8)));
 
 struct allocinfo_tag_data {
-- 
2.53.0

