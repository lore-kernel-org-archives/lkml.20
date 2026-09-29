Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0348F52268D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691873; cv=none; b=uwIVTmPpYXTjVnR6WyCUYOpEatPvzRmBqSRz41R5mfbPiUsvfiAj7jgDntN6iHLmrMD2Tu6BMjS2SCQ+CX+zWtzzsuQQzyD4F+3RznqPyrdWltpsYKC2QT/ongRBM5aTqPryBTPsLbII+bqWdsZ+kSW/VpGfCletyaNY6CqyUTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691873; c=relaxed/simple;
	bh=FF5+ULRw4hO54xck9KwGDwRdr7GuxwcSVd/mkPyqdPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LuKGbEoRph4j6E444Wy/BGCIipQ7WjHXl6WgJvtfX7yJflUH/1UgsaLNTcRJG7wHzI4CNhvq1fH98TzbSDekHyCpLxMxxVO5jct0D+2R9yLp5oJZEyogy8WJF5lVjO2qfIbP9yfkYruy+TUhChLmwGRKatUSzSWDs+8NXVh///E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruOvqu3w; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruOvqu3w"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso1536224a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691868; x=1791296668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kE1PErOwA5bxVXYFyrSKZUxCQRKAPU34Zm0v54vSkyo=;
        b=ruOvqu3w5IR9syS7ZYisvJwUi6aZqPrXWfh/3ASr1C3v8jVt6d4nnGVbThuIyYV1Bi
         MZi7bOaXKwgxzq2oGNBWL+j/9S3LF57aQyygUO+pUA5sXCrTq/HaLEtg4VrF44Z8fHRN
         vyF9iXcdncrjjnjwWcTVVe4a3xyCJYgTw1ylRo7FQEIqX3tOzsuTilHVdCMyODuVe1ms
         GYFkfD/9mp6B+EK8CzFbulG4ivdtZkEJ5hSwxoBeayhWMjQlb8yvbP5CQXw3W24WP9tX
         SfCw+Bb59phTzgeHF2KRdS720EMfcOhRAuv/WznvGKDm1LINIxsPGBiJGw2BzhB55X6D
         18Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691868; x=1791296668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kE1PErOwA5bxVXYFyrSKZUxCQRKAPU34Zm0v54vSkyo=;
        b=HntYH3G9xa5DqQI1F1++aoMP+S8YZ7ZrBnSxgZX/FBKrf4RwtLF8r025OcxulL0wGD
         7TGCfC9kuLLaFWIOyPlLQWQKmJEaD5G5jaJlGK3oHYQAlJcUx7k91ldbaDFwgZGMb7z0
         S1MiUgBRku+cPWJG4OJK0qPP3qiNjhAMNtlHULPNhXN1VkABdsZn0riPxsqwp99w2Qvi
         J7DwziePfNNHSgycbylwJeHmZkQ8QeJXZ9/zlvYqoQ8oUx2yWKQ4pF4bnC+fj+Usm9zW
         93BQus/9lDxYT4u6xONAgREjBg52mF6NFMGlLxg6YWEX9rTJFbb1MVDCYdYWfZWgtN+x
         +MrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLYB7x40TFaQW1LuZe0W6UdHwgGwOa/gEoLi5KHSjNUDU/Vybl37jzHn8uI1lFD4sN3MYp4tivmUU33N8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXVv0C0wHsr8umFZ+Ml3CH+wl9McdFxdW/uiuzf0HRHfmA/X+T
	6l5Qpv90f0F0T8LHfWHgFr83uNEobPFMvwis2jcnmGFXk5mJoEabItq0
X-Gm-Gg: AYBFou34Q8XgCQctjudXvClHk4d5lQF4ageamR1jlDzzsS1mPbATLTcSOyKkG6bjc4l
	yEiWzMpyAHtCwyX32mLApQ+NyGydR0uuGs5uoshGjaUiqKyP347jSO14bLScVnl8PGFw2V7yq1H
	3R1Mnidkd3MULXm3CktazJS4E5SprEVynNF4v/Z5VHNxZnrzdYcxxCasqDh9YMg1snBfhqxO+zu
	8Nn9JsqXEEUYHXrNKG+0KIJsStxSRI7w8jCw1CcvKya7xdqef1XNsPRAvHeZpq7Mq9Qq9nXSf07
	X4tmXIlHpeozj6WLeiI1RHa+pDzeSTHXKb5smQMaAmb/t4ST/6G8BohyuKqSjSZzifitRwmU+V4
	adbvgrpJqTPG//Fd6Vma7/lsGZd4x6QeEsO3D5pUvKmMZmmflYNiZRTO7jQwtlNcBsxI7yd3Vjt
	tEKae/R+aG13pew7se85/KjdVVNqrGzNDJhUoVBi9GZQXo5CdvBraBQC4pxm8Xj7sDlArYcEWPI
	jhN3At6ReeDO/24fMwbSg==
X-Received: by 2002:a17:90b:35c4:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3a2b16da167mr5814264a91.46.1790691868252;
        Tue, 29 Sep 2026 07:24:28 -0700 (PDT)
Received: from umang-Inspiron-3501 ([2401:4900:1f3b:8187:c8eb:84b1:3b4e:3624])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4b71ceea2sm439666a91.1.2026.09.29.07.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:24:27 -0700 (PDT)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] tap: report IFF_DETACH_QUEUE in TUNGETIFF
Date: Tue, 29 Sep 2026 19:52:38 +0530
Message-ID: <20260929142238.41742-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tun sets IFF_DETACH_QUEUE in the flags returned by TUNGETIFF when the
queue is detached, since commit 3d407a80b62f ("tun: Report whether the
queue is attached or not"). tap_ioctl() returns only q->flags, so a
detached macvtap or ipvtap queue is reported as attached.

Cloud Hypervisor ran into this when checking queue state on macvtap.

Report the flag from q->enabled, as tun does.

Assisted-by: LLM
Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
---
 drivers/net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index ff67d99deb39e..cb8ffb0c4a315 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -950,6 +950,8 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 
 		ret = 0;
 		u = q->flags;
+		if (!q->enabled)
+			u |= IFF_DETACH_QUEUE;
 		if (copy_to_user(&ifr->ifr_name, tap->dev->name, IFNAMSIZ) ||
 		    put_user(u, &ifr->ifr_flags))
 			ret = -EFAULT;

base-commit: c66d93e68728cfb5f40b40d0f24129d7768faf43
-- 
2.53.0

