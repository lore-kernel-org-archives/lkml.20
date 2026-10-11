Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9EC348C4C;
	Sun, 11 Oct 2026 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758089; cv=none; b=l28s/3vtI0VVCnu8TVaDMtSSkILXrwT2IHpTdf+Jd1eHthpuZvVLFGPDIXucOBRWKEAA9a5DgvkuEge4yR4+opFf/LpSwO1yOhzCQB6NOC3JJqUnp8OnIvg0qQINWixdQmTgDmZOzzErsJQ6kcUU+wbpH+l7muQmgnrX+SKmJ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758089; c=relaxed/simple;
	bh=i3V963Jme1roxXyzQq6E6ZrwG0aTP0eE+DNu1fuNhVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s9Jpu6b2nU/EFB8ro85HBzngabv6PNkIUveUaUv3bGGjLZZLLF3qNNba9y5u7q0wFnf6UV9FzMogJc7zOoqe3LQXLTLcZCz7UP+6IEgTSpMFxSyhYIlk5ZM1b8Ys8XrGH6hHfFIWFRlInQdqqHXxY4NPQGOk88NRM0Cf3wHjk90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9wxRbWg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9wxRbWg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482C21F0089C;
	Sun, 11 Oct 2026 22:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791758087;
	bh=LRXHkKhVvVWxfxHo0ntkJbhN1/Zb5wxbAKFW0se/Ef8=;
	h=From:To:Cc:Subject:Date;
	b=A9wxRbWg9QodLfBRIDJtah31QE6hF154lT/GsJZpmk2fCbnXn8Bsvz21unOFIsdNu
	 60tRngeRnLEZ06VO5Lq41N/lReZJGU0S5K6P+Two2B2GfraVX7i3w3MFKwsrhyjEfu
	 B7abk9v8Zm4fdbZcSkQxrEkO8vYl282abf3eGzqCss3EmjyryLwQy1BhVafyswgzGq
	 qqW87iI2MqYuberedhXLOIU/xy6j55+jOb5YELHXL5t78ge/Mf3hgtyA4xVCWfXKdg
	 S1KTdsYfNfUSVKARKSG47TtgMDxT/XfEIodIT4Cogyxyz14v65Y/8jdSYUpfci6LMn
	 PVHnJy7o8AMdw==
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Michal Nazarewicz <mina86@mina86.com>,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] tools: usb: ffs-test: return the number of bytes written in pipe mode
Date: Sun, 11 Oct 2026 18:34:45 -0400
Message-ID: <20261011223445.2328181-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

empty_out_buf() returns len, which the PAT_PIPE case never sets:

  ffs-test.c:551:7: warning: variable 'len' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]

Nothing sets pattern to PAT_PIPE, so the case is never reached and only
the warning is visible. Return nbytes once the buffer has been written
and flushed, and -1 if either fails.

Fixes: 93f2aa4ddd25c ("USB: ffs-test: FunctionFS testing program")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/usb/ffs-test.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/usb/ffs-test.c b/tools/usb/ffs-test.c
index f08060459b3f1..283db8979d67a 100644
--- a/tools/usb/ffs-test.c
+++ b/tools/usb/ffs-test.c
@@ -528,7 +528,6 @@ empty_out_buf(struct thread *ignore, const void *buf, size_t nbytes)
 {
 	const __u8 *p;
 	__u8 expected;
-	ssize_t ret;
 	size_t len;
 
 	(void)ignore;
@@ -550,9 +549,9 @@ empty_out_buf(struct thread *ignore, const void *buf, size_t nbytes)
 		break;
 
 	case PAT_PIPE:
-		ret = fwrite(buf, nbytes, 1, stdout);
-		if (ret > 0)
-			fflush(stdout);
+		if (fwrite(buf, nbytes, 1, stdout) != 1 || fflush(stdout))
+			return -1;
+		len = nbytes;
 		break;
 
 invalid:
-- 
2.53.0

