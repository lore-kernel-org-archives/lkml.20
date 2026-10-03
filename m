Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717E26CE32
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 06:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791007717; cv=none; b=PoJWmL3E64XUuBmEWwBfe5cp93JPyEXM0tN7V26tE29Z8bvo6d6Pi2XLMjFfgkw7KHd2cdL27M9srWyt5nQsvNqeJL866N9f7+anJP4M4sKZ70MCgSDXuXo3IgHw+wmr8d65JPGVj83ZiTTQNgIJltjM1IhhcjNZmJexAmKnCLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791007717; c=relaxed/simple;
	bh=Bq6MIY7CYCGN5YFO83plBrLT0wDS2LRD2/45NbCikMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wvlpp/aQ0QgBRWTFQP2X6+NM10Mzs2I+NuVPe5fZ+zq90SKyRCWIQtgLJQ4YovCaBNlGw42YxFGgDtp1i8yL01OWhKho9LduVbFRtmn4qcv806hJ1pEq6TCBg9F9+XHAxcgKYmIhJrFdPUa7BfVdCRxTfXOUte0dDpotkhd0X/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONiK2IVN; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONiK2IVN"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-32efd24b2aeso379012eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 23:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791007716; x=1791612516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvPvgzZ7iYnqitO0H1oFllRNtu+MflvF26mLCrcp718=;
        b=ONiK2IVNxf4hQGT6f3SZK54c9rAUF9yxU5YImJzhjRu0o8L3BR7qKqmSqd9+CrKfaL
         9JdIS/Dv72cephy8A7J9qD/BibBIvhcV+DqCHJQcVlt7q2Gv9RSO/OLoCBR0nZEsWppl
         eiifKI0uTUxJO4ypazFqVgwi4fTHRb3721E3uxpzEvLouIE59qRFNBtiQ2iTy7P1FLQm
         bNSbBLKKRwrH30MzfEqoCBEDTOWXnripJk7mdguTdZIo5XadVo6Gh0KXEVDovmDbJfAH
         qoi2wBvWlHL8f2kH7scN9diOmrdywlPZOKGB7Wm7l3red86L9OyEwguELm8wV/MzMXkB
         KtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791007716; x=1791612516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvPvgzZ7iYnqitO0H1oFllRNtu+MflvF26mLCrcp718=;
        b=HtrO0YExZk6w/t4ijaR/kGMvny9Gu+d88ViIEVKhYSNqs8yYId4kr5aYotm451uDHo
         WtEJ+pczF2jeu8ZJMmXIrhCWQT0w7jE6680hkDed9kmSArqXM5XRJNOJKA4bF19DoQVK
         mR3b7EgJQuuv+RZfw66nVFi0WEkuwXzEVbT3tumCbMQu0XsgQwFlwnBOAZhIwkl4SWVe
         qZcohTS4GV8ct4rY7TLoikzuOIhcyoSm4ZfKdFbHSvqsK3YK7R6DcwYvHTLAhlCyDTOq
         ybVnd0ApFVSxtzaVn4WTT9rXI/r8j/nkT5Jwp+AbcgRsDMQ4TN1gbQePmTDpo4B7uIqX
         G3Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxEgC/fsa2LVl9F1I+s/x5dXPTby3Isx6wTuV2L+xeb3L+1gHup19pEXIgxC0KPsjhkAeah2WNFGxywig4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0ssPryDG415I60u6J0L6sUQwO8h4vie9DxQ75FhLzTAiswZEv
	bzai9QbD0SU5UllZ5Z5Wc9fiwV9jOKh6y3NgoKfh5Y0pkFbALNJcjwiC
X-Gm-Gg: AYBFou2gOkaOOLB1cStYILOzHPIpue1ANitH+mmn1HyXX5qO/R7A1WD1AbCQRtKsTAL
	FSTe/E/ddvhcc0j45oC9azaQq9IRjdPnOZjnNNUtAdZQZTmBvF+V4ScHYE6MY7frrv9wQp70RXt
	E495i21sUt/CIBy19rWFX3w1qDVznDPkx4el8QFWHFaO3J+W3+LF+g9YvfohudRZOPt1QvTr4x2
	RKP6w9PNA4JetrHsVdA4gGlRSWiecX+ca46xDRylyOinNanLlhOPtLcyzxb5Bsxc6B+5i6l4NHZ
	wLwRmvHewOnfi9qRWZ1nJRl2xKI2z3a4WfewdjKNan65z4TAJXHzXCzHeNHixH0WD90lqI7xoUQ
	A6l4BCcyGoHioAPpz5aVfdaR/HGnL13/OiIZXBn4v4Wcf1XnxxP5NzyyPfyLyh0lKmcqfbpDqLZ
	Me+2+GC/g5lM71CYq7cxJrmK3IgmhTIjo7aHknmTmyvEVVubDpEr5bTZkW4+tBCRCk+q3C3wh3b
	TP2c0LZbmkG1dR+iRk=
X-Received: by 2002:a05:7300:550a:b0:351:fff:6cc0 with SMTP id 5a478bee46e88-351114114b8mr2562425eec.17.1791007715633;
        Fri, 02 Oct 2026 23:08:35 -0700 (PDT)
Received: from kernel ([103.219.206.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm12313344eec.1.2026.10.02.23.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 23:08:35 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: ebiggers@kernel.org,
	ardb@kernel.org
Cc: Jason@zx2c4.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: chacha20poly1305 - Fix missing state zeroization in xchacha decrypt
Date: Sat,  3 Oct 2026 11:38:26 +0530
Message-ID: <20261003060826.7792-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `__chacha20poly1305_decrypt` function does not zeroize the chacha
state, unlike its encrypt counterpart. The regular
`chacha20poly1305_decrypt` function handles this by manually calling
chacha_zeroize_state(). However, `xchacha20poly1305_decrypt` returns
the result directly without clearing the state.

This leaves the derived chacha20 subkey on the stack after the function
returns. Fix this by storing the return value, calling
chacha_zeroize_state() and then returning the result, matching the
logic in `chacha20poly1305_decrypt`.

Fixes: ed20078b7e333 ("crypto: chacha20poly1305 - import construction and selftest from Zinc")
Cc: stable@vger.kernel.org
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 lib/crypto/chacha20poly1305.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/crypto/chacha20poly1305.c b/lib/crypto/chacha20poly1305.c
index ea42a28f4ff7..03b14d272520 100644
--- a/lib/crypto/chacha20poly1305.c
+++ b/lib/crypto/chacha20poly1305.c
@@ -199,10 +199,13 @@ bool xchacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
 			       const u8 key[at_least CHACHA20POLY1305_KEY_SIZE])
 {
 	struct chacha_state chacha_state;
+	bool ret;
 
 	xchacha_init(&chacha_state, key, nonce);
-	return __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
+	ret = __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
 					  &chacha_state);
+	chacha_zeroize_state(&chacha_state);
+	return ret;
 }
 EXPORT_SYMBOL(xchacha20poly1305_decrypt);
 
-- 
2.53.0

