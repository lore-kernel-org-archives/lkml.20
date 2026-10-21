Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553706;
	b=xemJ75B84XpRjviz2fpErKssoLay+YcgcrXs+FFqMIRsK0cHevqRJ/aTg0O2qqHAh/+f
	 KTfvqAW876zugmEVpwCVJCCpEmRaUrfxlMMp2DYiHdmaxRkrDlLrltfVp2vwqMJnXdZXU
	 dKdFVbrIgFoRVgG79tt+45KcDFWLZsAKd7PSU6sPo6ScGVuowvICVoV3Yaa1lcOnEouDa
	 daekDdWrffrohznKuyeKwmfix1zCMYVCBzUFNoi6+2SO52Asry3TXTUm6yvSEMibD4ETW
	 ascHF/l8o8LzJ3Ih68Cu4Pqas0Zd5rcUX3kts6/MWzuSt8WLA+u+bxNAxOq4429f16g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553706;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=E1DNLfQwy0cDFHoOZobs3LOUZcf0v3kN59C4dk7YFoc=;
	b=uT67jPTL/zG9Tr0Y5SXY2YZMq1+M5Ysx3FnenXuooo+3qH5chOJNMVuzf7m4G+luVNGz
	 FxS483C9mZSh5dSWG5zYcRbTE0zClRkfmrGB0yP/Hy+KHQkQHWWkO/Q9GFzlwk9SsEIxf
	 Q9wjLUb9LJ02njnMMCBbcKt6TMdYq5NPGbwUK4Ey5+FuNhu7Ox9hXwr3WtC8P/3MTtQmE
	 JhpNZ/ALYYV+2BGYzODZhBnUI7OzYa7HfYKZgtn5zjnTt6xAvrsv22j9NLVZaSDEcJyMW
	 C8sVRIPfnKClmKtDZkPzVkyB/RCI/L9A/q25liEvqHNqxSaf0ql4URKeF8v3Mx4oX2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="IJkQ/lkf";
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A845606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A845606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=IJkQ/lkf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792553701; bh=E1DNLfQwy0cDFHoOZobs3LOUZcf0v3kN59C4dk7YFoc=;
	h=From:To:Cc:Subject:Date;
	b=IJkQ/lkf7patQJ5PVoaGXx9s2g2pBXaRqNbK5qQCBdJ9vb9YDd3CKCHt8q07JP7g6
	 NyFYMBGUVyiISKJ3A+dJoVjVYxOZdd0v8/ma18zXDzrN2ggS21WzV0Ezq+vv8zdA7t
	 pD/XLj/vlt0UG4Ins8S0cSb/s5ucmrnMA9Q6UTdQ=
Received: from Liujunyuan.. ([58.19.27.181])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 849A0A09; Wed, 21 Oct 2026 11:33:09 +0800
X-QQ-mid: xmsmtpt1792553589tkvi6ks7p
Message-ID: <tencent_8D0F8B2180750F84AF2D147AC203FEA9F406@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XMVxXvcIPYs5ML3PhM7pE6Ezlq/N7hbcZlBNIasXX4c3yaDeL2D
	 Y+LExGMQuPdbw2Nv0d02aYWFnRwQD1qXYuTel2L1N7F/lkCejpvNgx5Daeiok39/y7i08lFC3enL
	 jRy5lyT0cVyuBxihz1MuAYbWeP5t4DAm52ZpWzkhoqHjTiov6rZGclOKXGJarbteJutvsWZdiao9
	 tTbB6wn+k+6x7muJnCSUbDgPAYliO+O0cPZo0G8X7xy7p4EpRAw/M6kgIOLgZT7fuhMHhB3lot6L
	 9Hg/EGoBIoOoM/rcm759HGZShOLlXpifuRY6ifUv+5zYCM37K8Q/EcrlFqoC5Kq0m8yXK6E3Qbzv
	 PjQglDqL8QCAQk6duawoaKPdUupaBFGt0Z/ambB2CMuu5fzdo11CqC7qSceXfCxIr4SLSZvGyXTc
	 NmhTURqtTSvMeAlSdYQkI122+KTnbfyg7D6VFzCb7ZISqzcFQ6YtHbLXC58FVHV4vyO8IGrXGdB7
	 M8i1rWR151cdjtLG8pbNskmikhk/M/w1ldGkKGwJduo8E82YRq2Z6nW6zHXqGrp0/cPE+ji5ZEXf
	 UNzq+D7cu2rMrvtiqnoNHbsAEtWZTRqU+IROUIwH9u1GbEpDs31IMQ9IysxL14qiglMfhCYr8BNf
	 CF5r1XxJtuylOG4ktXRzhGNx0WZuCFbMMfwTYhlWLrj0uTPRGDq5VKdXglCbJALn/60EKu2liPE0
	 dTqc7kCjRsr4ovuUYNbgJ66yftwpDFR/3QL6tCKYphHzDKc9UHeUqWSc7qyEKZX+t/oA1hIOrGVz
	 yzMl1zoAYN32OMBeYFsZopbZ7296HG5WLINZ95vQJukSJJEVwRlm2zJRwUvPx97dogccPr1xIvia
	 TmV9dto8+kheP9IzRgnFSGQVGXRJNQ6an7xTvfSCz+YFyn62uWuoKNtVsGQbn+ALDRyU45P6wkpJ
	 tJYCgM9vwW65jvV5JbjJJ0ktHvMLKpA7Ghzbnu+PoqtpBnOC/+jS81tWdk/fn+96wZxpF1056aYx
	 skbsh9gzRY05SWt3VGESuoaoP1K/o=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: LiuJunyuan <2058432396@qq.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	LiuJunyuan <2058432396@qq.com>
Subject: [PATCH] staging: axis-fifo: fix tx_fifo_depth underflow in write
Date: Wed, 21 Oct 2026 11:29:08 +0800
X-OQ-MSGID: <20261021032908.13693-1-2058432396@qq.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check fifo->tx_fifo_depth before subtracting four words to avoid an
unsigned underflow when the device tree provides an invalid depth.

Signed-off-by: LiuJunyuan <2058432396@qq.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bb35e11d1dd..178514a71734 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -228,7 +228,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 	 * raised, which requires a reset of the TX circuit to recover.
 	 */
 	if (!words_to_write || (len % sizeof(u32)) ||
-	    (words_to_write > (fifo->tx_fifo_depth - 4)))
+	    (fifo->tx_fifo_depth <= 4) ||
+	    (words_to_write > fifo->tx_fifo_depth - 4))
 		return -EINVAL;
 
 	if (f->f_flags & O_NONBLOCK) {
-- 
2.43.0

