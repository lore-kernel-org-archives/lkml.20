Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630270;
	b=UC60KrzOjOl4QsmEG68F27HYrcRJ5uop/U1nWGAcM0bVSbV4O6f0LCFnqTsAmotx53PJ
	 GeW68Gm/6J+24nSEIdK+pPrNbwS+TLeu2F5rapkH6lBDfJU1J1ZCgWcg8eOSQLxs1turk
	 Ro4FaQ8Sfc4x7ako3lExZ4VeT2btFbYCv8UFlbXPMCc424mFAcSvuVf22Bau1OU6HhAJF
	 4g3Id9mZrfLnUCPr3YF16U1JN0j/NIVBMQ1Z0bx5DEnQin8z85kjFElR1trtSkGs5y0Ka
	 6Fgr1HLgDLu1keIQp1qR9fqImTlBl8l1DHGmLmnDbtbFbNu3XlWCLEKnw6nbXJrMXWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0+KnKlr9xPjJpW+GH/q0yJUebUnS2gk/U45PnsNsRe8=;
	b=TxGJsPjudUUiMLenhM6aMH/tecCqsjpxtAdJ1CuXTH+p2L2wBvB7p9WYULrLAcCJ9WcB
	 qUWXPWbUfav7n4zARf9u7LaysjesZAD+I0w7wWJt5ofYTpE7H7Bl4ArEtWI8H+8d3ClsD
	 N2A0HEJYbuKO3wSLc1AAoTpzragtMBsQehoVlcAd14bZcxMBJHy4D144rOp2Gde1XDuka
	 xdBeD+kn8LwTTnfeLsLvssIJYPavGLlxsNFO13pyZskXP4PKb66bj6IQWDg6BTcnybE3P
	 qvJgjj3wo/zbTf1C9Kc79LOaqgVBlJJgQHWisUj3y3s8u5Tn90/67g717QxtE9Y5IAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8aW0oqy;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7AC606E03D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD7AC606E03D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8aW0oqy
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so4646613eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630269; x=1794235069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+KnKlr9xPjJpW+GH/q0yJUebUnS2gk/U45PnsNsRe8=;
        b=I8aW0oqyxUauKugpGS87StTJqhuknb13hxjl70I2wRsjnhcTLFU1XQgi5nfliR9hie
         PT0EY6i1134C8w5Idz+Vk+xhQgJASlsV3EDY/ITRxQaAstBdoaosYCVVPnjv7JmBkoYJ
         CZZJr04Z9vrWfU6XqbtSifELdILX0jKYUGtlPg3oa6o8vbsz/bG/5GeCzdusIR60aGK2
         eubk5pyFyFGc4qg/27vBslv3GkOMcJdsMymAIKCInQuRrflHjSosJWom4tnq5GNSZChc
         YTYpoK8JxH/p2W6S9M/ip/DvG4/ViLRtXKklh+gmLfdkGIyDnHNn9xKSnKe1/FfxW8/t
         +vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630269; x=1794235069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+KnKlr9xPjJpW+GH/q0yJUebUnS2gk/U45PnsNsRe8=;
        b=n5KIT+qGd4rzE0ls7dIxT5RzDivvAh+Aa4s1Qw0mT+Y2S057fB6+x76abWtR5N+EvQ
         t2EPWnaOGMU1IbekDae7geWiwTyqxo5qyuI7dBGVbQi5S6XPiFqUOQ8qYTjV8gWPDCTx
         le1HROIgT+Rm5PTbSemKgcBfOQzzE0/t8IrY9/CFky6v14Z4cIHrmMi3zwhlBtoHJli2
         35huVcHRtjlcGTV1cQLo3ro54/5qb9MdWGWk857mvkbsVrbbYuLKn/S8MqBCkQVtpOU1
         +Re0fdnssH0UAYtilhyMiysb+UKpjYE/g5ggpn351XUm+OZn8BffobooZ9esqOsLj2YT
         7ydw==
X-Forwarded-Encrypted: i=1; AKwUvBx/2wL7DihIzNCpqGantGeBaNDS3cYHmrImD341eu8lWGY5VGjSndCJ9iXq1cdJvFXcmkewyc3phWrIoMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWQR7DXJXm7AQcU3PawmIgiLAqQxp1JJYIen4jgs/P4p9F1gR4
	CJSMqBjqIq0qqMvKZgoqRYiyk0hwUBIPDudYS2uXxu3tJGN+osKf7gC6G/8vC94u
X-Gm-Gg: AYBFou2YvTEES+cffc7SvpcNmvTx9UGbTocugzDD/2xJX1VsPFepJPbGQWlOwW7DFLm
	KlE7C83XdC2aurKC4KgIip16wwU7RzaFPW4iIlXccAZeirOG8jnQUTtgAbLVmJzflTT0UEXxHtB
	QWbuIGS4eY6OQrxjYApdjD0IsJX0A7nRJGUtShCcwj/4UXoOIke20HQb4UwkpGmuR58n2CKz/NT
	4TcYTxWhHAFsLRadIicI7CJE5xxHxNp7prXgAMZ9IAlrd6psuFabTe6/zGhqhDSMyZIpepyKQ2w
	DiEVEaB9n8Yk1dZnOJdZG6r19WGGJvkiu0RrSDS50lMwDs+KY/JC8ga11/jhhb8peANELuEDmMk
	7CbWu/fa8d3sV7UioLPAO9yiNiWhkI5fOWEQDacMh+kZycNwGgBGIpaXPX42dPXtmJp/JRpFZVW
	maBuGkl98TOcR5EIMwZrxnsmoqpeZxfeizIEO18/VcxmC/bO36e7KsDXDDxIx9zXw8j5lqQa1ad
	Xz4FzFdLLjWNwfi9fFj8CfXYEzMR7pa96dl30d95zgnXJG53b/fnalW91MNpJXguEWlnqZpwg0Y
	yW0wAM9EGiK0TskBAUsTDFULiNjB
X-Received: by 2002:a05:7301:6187:10b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-36a4242f5c3mr16363420eec.16.1793630268636;
        Mon, 02 Nov 2026 06:37:48 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:82cc:4587:6dbe:2fdf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm35247518eec.12.2026.11.02.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:37:47 -0800 (PST)
From: mdshahid03@gmail.com
To: maddy@linux.ibm.com
Cc: mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] powerpc/perf/vpa-dtl: use GFP_ATOMIC for DTL buffer allocation
Date: Mon,  2 Nov 2026 20:07:19 +0530
Message-ID: <20261102143719.165508-1-mdshahid03@gmail.com>
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The DTL buffer is allocated while holding dtl_global_lock, which
is spinlock.

GFP_KERNEL allow direct memory reclaim and may sleep. Combining
GFP_KERNEL with GFP_ATOMIC does not remove the direct reclaim.

Use GFP_ATOMIC alone to ensure the allocation does not sleep
while the spinlock is held.

The issue is reported by script coccinelle call_kern.cocci.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 arch/powerpc/perf/vpa-dtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
index 3e3d65b6c796..3d34417e6aae 100644
--- a/arch/powerpc/perf/vpa-dtl.c
+++ b/arch/powerpc/perf/vpa-dtl.c
@@ -338,7 +338,7 @@ static int vpa_dtl_mem_alloc(int cpu)
 	if (!dtl_cache)
 		return -ENOMEM;
 
-	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL | GFP_ATOMIC, cpu_to_node(cpu));
+	buf = kmem_cache_alloc_node(dtl_cache, GFP_ATOMIC, cpu_to_node(cpu));
 	if (!buf) {
 		pr_warn("buffer allocation failed for cpu %d\n", cpu);
 		return -ENOMEM;
-- 
2.43.0

