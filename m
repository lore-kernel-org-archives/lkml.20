Received: from mail-pj2-f25.google.com (mail-pj2-f25.google.com [74.125.227.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18ED38DD3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560939; cv=none; b=gp7AXI31jdxgmkDb+wL5uxsQoiXXNQwaoAX9O/s878hm+pLsOC/0VmN4rFmCDmk8SGLt+1IOkxRK8DZJPzpYAIgJhxhhUNsGfCagsGQpco7vyUuxWdJGv4Yg5MaZgrtGxz7Rs+/G4VuOmQY7MODlYttQilJEl446SVKEowIGIck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560939; c=relaxed/simple;
	bh=+cQtYvWDLHAmX48DVUXZ2TeOzxwTCsUiHMQFa4A7xwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6VzzHpTfP+J5h8DBcE2xSb9DHcUTV1S9DcWiyFy7sILZdctyNWvIsdtKuZBM8jr3Hhsic3ZEmoWuizfDqD7lTwIL0ylqaOGHX9xYX25qhFozc2MaCzlqb92+Xg5jWZM0n01LRfg/VSDLjyOn8DkIibsdNrPM3TvmtfxSF9ynGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMQzjaDB; arc=none smtp.client-ip=74.125.227.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMQzjaDB"
Received: by mail-pj2-f25.google.com with SMTP id d9443c01a7336-2dd4b43b20bso9975815ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790560938; x=1791165738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZbLdKEWpHSapkqyM8B8OGEl2PI6ciRARCkQx2ALNTU=;
        b=kMQzjaDBQSQfCtBgf7cVIO3cspMSOILVM2dVoeWAstHLk2ONrduY/tiUHUUt+PLR6/
         3ZI0BdqXI1w0cMyyB6vA6KxV4jOjwn6cDpozBt2D7N72tT9G90Uh/PoGBTn6A8SSiXOj
         +Y/1bld/WXEntcLGO37rnw6uIMW2ViTKZMuvmUO8ill7LGDe0CokCSzbqfbZQCRWINSS
         h92ZS3L3pRYuEXBlYuuU7jHBBPoFYgPbfa1iFBGkbH8Pn5w9HVCHIG6rNoThwohHsQb8
         jcnMpLoXYfypPB8R8mZQwGe3P0KOrh6BSgWykFQ+3lDdfd84Gr2I8CzCSa2Y/bfWQltT
         HJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790560938; x=1791165738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZbLdKEWpHSapkqyM8B8OGEl2PI6ciRARCkQx2ALNTU=;
        b=KlItyLOzXjul59ul8d+dNPJRVz4lh3PKoE8PayrJn5jzn5eE4SyTRziIeW+kH/GK0/
         Ixo5bjofkAUXfFQTeVdEibC04gy95KQwlwDZU4umR9Gv0ZRvx+oXBeDC29OG5YDsho2L
         +aVN4Wm6n4b7fqbqOVXpPFwQDiuolTRyQRIqV4laIrw4u3Xgl+MPRL42S6ey3im8znRe
         qCy/t9pbZCiUBoNkP8tMljfS7wx7Ml3gviENeqLQLMNnGmSuHHT8HcwEHRaMQgTDl6tz
         Yg3PWGT5O0VnIU4bp/9IBzDFMa2N8Rm4LKtBm/tGuHK9iuBOa1977VvToaon82WQ2JUU
         cIdw==
X-Forwarded-Encrypted: i=1; AKwUvBwY4smCoD6kz/5LGOUL6Oq4fEvMGvO7ffnvtx5LBPcz+XIvvOCJ1qc2OE4qgv7QrFVjLnR1RkkTsQSXAfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYISyTnlt4scAE6l44Nm3GWB1MQauNYVJWguPFn7EB57LHuA6eLG
	T8m6+6EJjwl25XFtiF0i0ckfYlrZYJmMVZmgZ9vRJfNOoxeP3tAnxw2A
X-Gm-Gg: AYBFou1ls4XGz8dKrtv5Glqdcu2eou6fB+A8QrqWJaLe0qD5jrbKCxvbd97NgaYupg+
	RMoaECwA0vviN4cNkfxiPcTWFxzH89scP/scSwz33u3g2rUWt1keFexH28xC3Dg83yNn+y2UkMM
	qvFstVjYX5A+4O0VmKBymGOKsvyy0Jc1tDg36uhhsaOZMXzqex0yqKGoTQwxXKS9u3xO9xZVxVV
	sIgkxL5j2YAXBDS20WveAk/eM6nyNSVqeijbefSZ1UpyLIm3GgCCcHa5ywqDmPbkqW/Ih1njcVg
	8B9Nyf8+ccT7kL6ern6uyO9zKBJP5JpBuqDleusIoL6sSQ2XzQhiMaB/CLMXR7cOnxdqFiM9Cyo
	VifWR8yTXsks0v5g9uCvRderZhOZ1GWmC8BId7ZYMQbHtbfeOTmb4m66dALEgnhgQ5dIlx0mibc
	lGzEaS1k75K4cZQ5jSKD1D6r+O9VoXAsHcteTAqlfaVHyXHJXcQn7jaAY87Bmyydb+H2b5c9fQS
	fdBB1Z80Vs=
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3957 with SMTP id 98e67ed59e1d1-3a0d65147cemr4515615a91.35.1790560937918;
        Sun, 27 Sep 2026 19:02:17 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e05d674dsm4631129a91.4.2026.09.27.19.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:02:17 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Kees Cook <kees@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] sysctl: Negate before converting in the int read path
Date: Mon, 28 Sep 2026 10:02:04 +0800
Message-ID: <20260928020206.977522-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928020206.977522-1-zhanxusheng@xiaomi.com>
References: <20260928020206.977522-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

proc_int_k2u_conv_kop() reports the sign through *negp and the magnitude
through *u_ptr, but for a negative value it hands the sign-extended int to
the converter and negates the result:

	*u_ptr = k_ptr_op ? -k_ptr_op((ulong)val) : -(ulong)val;

With div_hz() and CONFIG_HZ=1000 a stored -1000 becomes
(ulong)-1000 / 1000 == 18446744073709550, and negating that wraps:

	# echo -1 > /proc/sys/net/ipv4/tcp_fin_timeout
	# cat /proc/sys/net/ipv4/tcp_fin_timeout
	-18428297329635842066

The magnitude is HZ dependent but the wrap is not: the negation happens
after the division at every CONFIG_HZ.

Take the magnitude first and convert that, which is what the open-coded
version did before commit 2dc164a48e6f ("sysctl: Create converter
functions with two new macros") folded it into a macro.  The
k_ptr_op == NULL branch was already correct.

All three int converters that pass a k_ptr_op are affected:
proc_dointvec_jiffies(), proc_dointvec_userhz_jiffies() and
proc_dointvec_ms_jiffies().

Fixes: 2dc164a48e6f ("sysctl: Create converter functions with two new macros")
Cc: stable@vger.kernel.org
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 kernel/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index f7b75985d542..38597f26b34c 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -483,7 +483,7 @@ int proc_int_k2u_conv_kop(ulong *u_ptr, const int *k_ptr, bool *negp,
 
 	if (val < 0) {
 		*negp = true;
-		*u_ptr = k_ptr_op ? -k_ptr_op((ulong)val) : -(ulong)val;
+		*u_ptr = k_ptr_op ? k_ptr_op(-(ulong)val) : -(ulong)val;
 	} else {
 		*negp = false;
 		*u_ptr = k_ptr_op ? k_ptr_op((ulong)val) : (ulong) val;
-- 
2.43.0

