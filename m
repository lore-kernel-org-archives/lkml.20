Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619923;
	b=kKuMZa3MHEe4QkmvpXx58IeYuT9jHktsPjQMhOhT6uzVyminLMRZLXoNZa1O4LYEnNAa
	 2wjJAr/OTCs8R+KpsutIZLy5Vc31dqEGe0sD5mq6Y5WP67HIHKtxok/t5nRYKtid9khxP
	 TYV2LvD94T8nuy6HWaQtoIBtqU7GT5BCZt8V115ndTVfX2P/v+xM+vnUqL96nbfBvkQfT
	 iMgJcJsAppQbmUnsh/TDqP7Lv0X0CakSOAzTYrOlWwMIrWjpiScG9Y1P6YSJPjdKm/Fx1
	 nyccfOUcGnRm5QikvOuupsNRrmSrGJuaKEHbTAEZZ7Hi9XtQRONQcI8hAe9Skw28acg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2iW75D2tc7+B3ipWuNmxmErb7fmmq8W4bpLgK3YkqfU=;
	b=ETCy2fHk/73S3F8GJPZYYgOLngr5JcTc6wQNWBiKkYcGun5k1P1p+hgezu2h32oL4Mfw
	 A53imAn3VIMC0/TB1Jeg9DSj/FrkDncxQAVn8pgjH7H96SJExxbFUbDrNT17EUcZX08sM
	 T7ZAOEHr8qjkZsBqlz3MzE2xs6AxP+9zbCfYz7SSlHEDLkodEv+B1BvBGf1BtcljwSvft
	 +oZP45yMYk/NbJxvYUUMWcl9POH74C6iVEkUBiWltdR4QM97eqhSPnYHPX2hY+7mfIV73
	 vJMyp57pP422O+dW/40q86QBZlprEbH9HWSHvylbxNWRh87Lkeo8YelbBv8H6n4YAYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWuxymhd;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F07606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F07606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWuxymhd
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1775832f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793619922; x=1794224722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2iW75D2tc7+B3ipWuNmxmErb7fmmq8W4bpLgK3YkqfU=;
        b=CWuxymhdCZDUyoGLevjZJ++ZyeOFkqaVRzstAiq0GcdmiVkaJUAyjo6W2hct2Qen1r
         nAzJcCQnsGP1w9SUFUo+ihzHa0UrvqENRPwa/wn7mOzuRa4nBGPBvi0iw6/MRvteq+HY
         qN4txXGirJZqs2AhQJD5ZmZg9wzs2/JtIV1BgUiCgZfd88iMU938GlX6exTKMugFfoMG
         hifMb7hbKAeDwCBT0l9hpfdi2Q6ti7d8XQQ3pWrdnu0tbUSAbTBJP22f8r6B5q47HBKy
         9ObXtZBdqoPZ9eAfuuT8tTmFkKtn+CU1pPhYouSkP/9YVpzBkbuoBqEw6GKvkKEmvf8c
         zLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619922; x=1794224722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2iW75D2tc7+B3ipWuNmxmErb7fmmq8W4bpLgK3YkqfU=;
        b=23vERWzD+8uXqhUGG8DpjpmKQK//8j/YnnXE8SwhxISI3+26RN47pbfHF3CG9kI1dt
         ctTxU4CPxA5POD2F46TY31xgxFEmahgGT8hfmdYqA21Lt/6Fe1iZXJWQ7hEF6Fm/kg6T
         0NPrZ0+QdPc0O+Yr/lzmkRgM9WuHkeCv/zS8xz3HJQeFy6K9yZFMPsj9ed1VgBf41g1G
         LBUI0MASyHwCGZP/g/wie+w++jwcfxD3jUE2IJhCRQctm9EcUlHkC9NT+qOxJRV9Q0Az
         ZPd8vrT+56ELtpqHX6BGT3Jb2Ai5qtlunalg+92biqD7bFt87K3W1YXggS9mAoCcvVNz
         KW5A==
X-Forwarded-Encrypted: i=1; AKwUvBxWzABHo9fWovG0XFWlG7HT/urb6jrM/fh9L/Mh6+E4M6Oru7ieVbZ0QbKmqgGM+DZRdChD9PZWBOaivU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z980HHtBoKmEHOf/4uPUIcqTmoLRZ8sel3XrXZiwlPeXWRF6XR1
	9hXg5ip1Qi4Ync96DKqffLQGkKqH9rV6GPGq+vZrVIDfBcgy7qQ41Nui
X-Gm-Gg: AYBFou29iEHMFqGu+3Jq7WdCr4VAWzPuQUnz7kJvTfKGzibOWPC31rimHJAb6NHedYv
	Vo6R118G87tbsVAjT9sNMyzDIxek5fG+RlAtbgwFLY//wLjrpNFUQO8B6JAPzr5+aloDBAy9RuV
	FKbaAkD9+yU0wVdN9WRIUD47UrEDsPfRo7A5hz/jL6MJETBN5ynl36XVhpm1xayXdxqmH0IkwLR
	TIBK/cvnXxiHtg0tfWk9kIBs3yS9Fs4JQxCG++vPj12V9yMUXgfbmy6jOnQOmO4bRIs+jOo0/Ub
	4D4QGn1QMZgswtNoGiXuDcqf1pBOgDz4XJSCxm2P2E4+NIn6z12UON37gp1RqwHFKme6g5Y+wx6
	8CSvszxy1VOjspfWf9KviI0YffDHNFReAqjnv168B1oD/KwheX79qka6Wj7l7/av/i2ak7f0DiH
	KEg0Mw5LA+jHc/ie+4WznXBMdquU2QYmmKC9PtfMkJ7Xd6j7mX5h+n8lceSjsrtPDwNMFm6Q/7k
	cpMkpjrXvDClYiO4CuUunRB0Q8zDxJhP0EXM6M+6nFvFSAXbb7gpYyIG8CO1bz6mqdOM1pyaygy
	uQSMiWr/T9NJmPK+APiUt6+n8d3o7dYahNq+u34IYgtqWILGZMNGESKIs+a8u8OG2ndiYSgWq63
	MyJR1Rvw7stOtvUciv2t1mO9LKyHKrAqMXVSM
X-Received: by 2002:a05:6000:4b0b:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48e6e2db9e1mr21860101f8f.6.1793619921668;
        Mon, 02 Nov 2026 03:45:21 -0800 (PST)
Received: from x1e ([196.189.89.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm19731126f8f.42.2026.11.02.03.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:45:21 -0800 (PST)
From: Maritu Hone <marehone12@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Maritu Hone <marehone12@gmail.com>
Subject: [PATCH] staging: axis-fifo: fix integer underflow in TX size check
Date: Mon,  2 Nov 2026 14:44:51 +0300
Message-ID: <20261102114451.54579-1-marehone12@gmail.com>
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

fifo->tx_fifo_depth is an unsigned int parsed from the devicetree
property "xlnx,tx-fifo-depth" with no lower-bound validation. The
write() packet-size check subtracts 4 from it:

	words_to_write > (fifo->tx_fifo_depth - 4)

If tx_fifo_depth is less than 4, this subtraction underflows and
wraps around to a value near UINT_MAX, so the check that is supposed
to reject oversized writes never triggers, regardless of how large
words_to_write actually is.

Reject the write up front when tx_fifo_depth is below the minimum
required by the hardware, before the subtraction can underflow.

Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length check")
Signed-off-by: Maritu Hone <marehone12@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bb35e11d1dd..aa76be5d78e4 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -228,6 +228,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 	 * raised, which requires a reset of the TX circuit to recover.
 	 */
 	if (!words_to_write || (len % sizeof(u32)) ||
+	    fifo->tx_fifo_depth < 4 ||
 	    (words_to_write > (fifo->tx_fifo_depth - 4)))
 		return -EINVAL;
 
-- 
2.43.0

