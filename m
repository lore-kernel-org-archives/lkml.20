Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C64EE86B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623289; cv=none; b=HEzoSTWcqAdjzmn3xv4XZ8QKdwlQ3U4K1zBPPmHShVpxmwPaff0oFjsNRYTgTdI8e8tGVY8cI1zXlonnwS4T1CHHj4Q8vNSb6z7dynHSopRvhHuj7LE99QPyDj0SzYcnMTQnFDVf/lqy23QBYhlCpxCpadbyRsN04XbXjp/ea8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623289; c=relaxed/simple;
	bh=e4W3heWpJSSfMatKHc6jQT2QirxzrrhJb2u5eQNHmGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=th4Fys2BLSfOzQcXf3l4b8UHarSSFA+jYuVRIxcYxDZ1mbh7N3hfFnmFCMgL8rbIPRsEqN4KXbJn9ocb42kkcYb3M91l83EW7oQYPvC5buLSsMpxX1LEG4L7lIkK9+uYDk5BiQepC5hjtIQl/JUjFIOOWxnfWJ6r3qBSmQ1T8Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz+GHSZ/; arc=none smtp.client-ip=74.125.231.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz+GHSZ/"
Received: by mail-oo2-f4.google.com with SMTP id 006d021491bc7-6d8f2bdc754so643257eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790623287; x=1791228087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVeRClalrWLka3P0+7DfFgAskiK62atsVktrSXYS9Rw=;
        b=Xz+GHSZ/gIoBvLcPJjaQk3rDT+HEw67Hwg3rJt4chZEILO8gHA6xK9dtcWq/JDyflT
         0BAuG+Sl8zwoOOArQSDZi93W4CTdpe06z0XZ3nqC4jG+k89A65gtxvDuR2I9RT8ucY0L
         77xDGU6SZe7JtV6l6XGwH6KVqiv3VynwuSdUJIeSM6aThb2IA4M/WbCwNl6OB2o4uXVZ
         9PbVwkOMm/SBHtNFpYVbyaG4aUEz8pno3b7y9vsae02eT0oickJRlaU7oJKC3H5RpNqr
         LnL/QKLB+g2iBsI7KtWJw1naFeBXOImVEWyiUjQ/4VFvTWwM4+mltB2eVoxQO9JDpzIk
         c+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623287; x=1791228087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVeRClalrWLka3P0+7DfFgAskiK62atsVktrSXYS9Rw=;
        b=m3q+Dwdt+Nmts+BzgLhzvpwWoGzzPewI+nXImaXNcxKwDDpYWA7Ydrb5TJCRzW9xgS
         zkeSTkWb1Wujq+JxJ/P7adFkB9HmRH3ZgDrzrfCDkTa/PCo6A2qEUYzkkPt0GBndI+z5
         tmKxY5WvNDt1f+fySOon22VVZ6C93xL18mseqowlxIgOKkWtG6x2zdcxUZCw/w+wPgS+
         ilotoLzBlsP3Mqw5p5HxfzL9QHV1KCGZDc8dLouZEDtOh3XVnRnXeuZQGMIVdDRf1kMQ
         x2qY1aw/ofd9G1o6jraBNoej8D3D4HP969CPXn9JZKfJrTybtn9RonKRSr9Ki1YIoHZA
         +qLA==
X-Forwarded-Encrypted: i=1; AKwUvBzjEoPFN4EpgS6O30KWp6fGX7ZhDOa9IjMdQBHXHTOpgtC/9kcQooE4HxxKlg/vq8lM0Ur15G2hCin6B4c=@vger.kernel.org
X-Gm-Message-State: AFuF++m0doZZfm/eyxw+NiGjUbF4oWb4JL+alJCVsLO0T5sEVgAJsw/t
	JVO253GFiJcYMymCjvf5pD2GZ/Eh25lGRedoJ9rDJGEgrUkm7ysvjYs0jm5Ow67teU8=
X-Gm-Gg: AYBFou2WddfTzBDRnIoTBOUqOuxkXrcH/iXfPLvAiFnzChYNQDCz2PsWU1AvHs7RVzV
	+HlZWQifWEVnfOT0p6w83+UgiAHNgrnehUsiMceUSE78+wt5oGbDhJCgxofVcDSA/l9biUbM+Xc
	1fEcO0dLEVnKFnu0aDaSY9tka7AO+4YufkvWs4V7Sqag1Z9Q3aoSvXSSSNaIcJbFGYAcAcT3xVU
	6rINZDxjnMWtGdQ+8fKR9TxktJcaF7ljOgArVL5A25LR7trUIuM9wlQ93vjxuu8wySxMnZ1cSWy
	yKbZX5qejGX46ml9UBlu0ZGKb0SQMTNHH2LrGHQJVebwFfp7YUdUUlTw1aGrlQnVr2t5ZYcGnwq
	l/+dvZyMqHhr4sKQFaCe5WEjZ4adGIu5v+xulDmiPC2vXijX8CABitl8lS/F526C86COZ3qY/N2
	tG7ZRQk/nMM8D6ZyhhD1vbIaK1PzHF4u/Uo/stEW8wSkP/bjk/VSslEOVYXRTA95sR1FnU/F78S
	8Uh4qbv8Fsrs4ywo9DQvCU=
X-Received: by 2002:a05:6820:214:b0:6d9:8fed:b73c with SMTP id 006d021491bc7-6d98fedb9aamr2471163eaf.57.1790623287111;
        Mon, 28 Sep 2026 12:21:27 -0700 (PDT)
Received: from Xinshengs-MBP ([129.79.197.98])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d882dc49dbsm6088996eaf.9.2026.09.28.12.21.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 12:21:26 -0700 (PDT)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: usb: asix: remove redundant PHY address short-read check
Date: Mon, 28 Sep 2026 15:21:19 -0400
Message-ID: <20260928192119.73351-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Short-read handling was added to asix_read_cmd() by commit
920a9fa27e78 ("net: asix: add proper error handling of usb read errors").
The helper converts short reads to -ENODATA while preserving negative
errors from the underlying USB read operation.

Remove the redundant short-read check in asix_read_phy_addr()
and its unreachable -EIO assignment. The existing negative-return check
handles both short reads and underlying USB read errors.

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/net/usb/asix_common.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index 4f03f4e57655..51bf887e3520 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -327,11 +327,6 @@ int asix_read_phy_addr(struct usbnet *dev, bool internal)
 	if (ret < 0)
 		goto error;
 
-	if (ret < 2) {
-		ret = -EIO;
-		goto error;
-	}
-
 	offset = (internal ? 1 : 0);
 	ret = buf[offset];
 

base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
-- 
2.54.0 (Apple Git-157)

