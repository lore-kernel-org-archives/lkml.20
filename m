Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634837;
	b=xvHt/AnySG99d9rhjbL6GtcDMI8y9a5hy0UYTh6KKTF1X2bMTJcZIc++E4FRHiD87Abc
	 mAYhP5xg7XpxuKPd3m1dSzgIzUXuSHmYbl+khZjra25XbQUMgNaxoSyeih5Uc4xIhzI0Y
	 6sKrCgX9OAHHN2As2K91D2UzsQwnOh4YFo4GilOeHPGa4VEsDeI6nWKoKPKaSlwAm9jmq
	 oVX0eJY2pqZLSPx4tp5WX0zfGwTut+9tV8hG0MLHF665EAOjfsqAgH696fa3qCYK8RmVj
	 kpyO2p2eD20cIShWodeh44UCes55PzvJ61OHxiA7qLysx8GE/tg4uogIaaiqGWKe7DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=73DR8o62Fs8K8T2lKj1AIW1Z0OeA4tbHKQ/fX8k3s30=;
	b=DiqENjMRarXSWDnHGWEXtMsO8hZJ4URAKN0jYjb+TzQoDjSrRbVXI/F8wKHcuT0Ziuee
	 DQ7x+KudjW2DjNwJuDyjl5NgZ8Ci9o4uSiGznWQOTZuGgyvCxLU5LPpsftTaZ8mt49tF7
	 fzATw25nHC/Qi6/a5c8UDP7ks/TeQS+nJtQnt8ZQmWiOGovwmPRJ7ulZTGfJiY9suhChh
	 MGedyPiF4oBARWItPFd4jhwofXMKTtv88Uf4pA7yHskyn135KHTgxnCmgI3GMJ/HthUun
	 SX/gmj2Ex44whXkwnJQVgDzK704RjSHhfgm+1yW+X/GpyIcX0og83QyEOn2tZ+g5Ywg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GSTzNnTp;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73DE607B78A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C73DE607B78A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GSTzNnTp
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3259592f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634835; x=1794239635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73DR8o62Fs8K8T2lKj1AIW1Z0OeA4tbHKQ/fX8k3s30=;
        b=GSTzNnTpuWGoXoGwURiFUC+RcXlSjBM2byaI+KR0CSGw+H/KFBUlBesE+xenaYscIB
         k9GXHRknAoBNiRKs+8i4IeB8dHdxSgdTDVPDk79Ktc17BWcLA99KuIOdGOF38WxFFpbZ
         ZWqIiya+OOtDEjXCswiSRcmaJ3QgwmjDpfVA9bnJp+DjgnPuu/GbfpbbzuIlhMpXxBdG
         rJc+cmAmHOTLh8h/sk35iHv2Ml5TB+sdYeDpBoV2NSTsXzSbHhz7WVGvpI6qiv0wsRwM
         3xZauCPTaOBYo2/eXXNSxiQ1qDolSe78LZwAI8cqy7giQvyF9yCXt7pQVYmaF8Ct1Sn4
         6kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634835; x=1794239635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73DR8o62Fs8K8T2lKj1AIW1Z0OeA4tbHKQ/fX8k3s30=;
        b=iP5VVmIJ1ayTtsFMceXqoJp+D89cPDhDbOduDZ0NRJWYLUAC7QOoUnKqh8Uq5krjT6
         kvgLJ9Y9zt2O8QoBLiOtN/U5A8tAPi7P6NPskeWAEy2pZYQnEeFhnMTQyeRf6ULfit5e
         aImZIfKHT5JbAhbaHz06n+5+J6MiKErHajZkdE4gxZV1mNpiPSZjXCW1NgjwuLFYxa7E
         xWQ/VBRJxDlGjEX6BM16JXZTPoJNxfrxSn/1771ZFJLkOqirxhg3CbnO9UV5E7krb+aq
         755tSbWbLG/VhR1dbKSekRIC1fu+Hez09cHFZkKEzH0uifCFvFr3bCIyddiM0UNjy8R8
         YcMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsTdgfB6r00W1pM84GrwweNH+nUdX2trvB96zEm1f4K8Bf4KszITmk5KOGsabDen6Kc1eiCSd+YAXn0H0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bp7qVUSKkVoZz8vGc7jgxJ/puYBXt0R9yFQq9jXu1IfbDQNxl
	H+8MlUGII3J5rYn9mgHQ5rEc8On5p/ovuE8cxXMwj807eJGY7pHPdpE=
X-Gm-Gg: AYBFou2cauvO9loXdU3LiV41e16s/SO+XwGltDNnjTRS5na5G7MOQivmmDQCtaD1vQE
	VeLrfQ6mUttr1rBT2HBRUvA3lxdCowEAojHcZ1I9tGDIV50//UZqaZelUEhB9oyGcgh7tAZCeVr
	DMxzpxY33mGN5eJa0OXg/7i50go2YofzOdzv8mOhBQ99g+4+XshY9IN7q3sWUsonZ6Bp7IfbvnH
	h2mX59Ifra33BOenC97gYa2ehM7ieUe4YH6FkdERUFsgDwiaVk+34GDYWA01qHsX3QVd3IJ2w9r
	JtsR4lIjqr3nubp4o8pm3pNceSH5wOS/M9R+cXG1xkrRFhu72Hj4IrhzJoXUZ2lC2XeNu2dcKj3
	H/4DR/bMTDrLMjJm+TCEkbe5zZNEVbv0oo4mWLGhgIGwli91itmczSVbsCx5rS+v/Y8ox808NOc
	zw6N7S5Ci8iF/xLwTnws/9JcL5O0UQ3xMwZWSEpu4O/d+1J3Cu9eyShz9Jy1JBwkag1ycZoNiNq
	hdEIC/6CCVtKf8kQOTXMqR6PO/QRK3ufXK9Z4aid0aSAVe2/HVxcQLHnV+3I3lnliKXT3lKozKE
	KbFAxJ0vC1Y=
X-Received: by 2002:a05:6000:26c1:b0:48e:870:7791 with SMTP id ffacd0b85a97d-48e6e30b824mr21941019f8f.26.1793634834903;
        Mon, 02 Nov 2026 07:53:54 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm22010082f8f.34.2026.11.02.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:54 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: steffen.klassert@secunet.com,
	daniel.m.jordan@oracle.com
Cc: herbert@gondor.apana.org.au,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] padata: fix lockdep warning in padata_find_next()
Date: Mon,  2 Nov 2026 15:53:53 +0000
Message-ID: <20261102155353.1268322-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

padata_find_next() acquires reorder->lock while the caller
padata_reorder() already holds squeue->serial.lock. Both locks are of
type struct padata_list and thus share the same lockdep class, which
triggers a false positive recursive locking warning even though the two
instances always protect different data.

Annotate the inner lock with spin_lock_nested() to tell lockdep about
the valid nesting.

Fixes: 16295bec6398 ("padata: Generic parallelization/serialization interface")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 kernel/padata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/padata.c b/kernel/padata.c
index 0d3ea1b68b1f7..2f769ba7dfa99 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -253,7 +253,7 @@ static struct padata_priv *padata_find_next(struct parallel_data *pd, int cpu,
 
 	reorder = per_cpu_ptr(pd->reorder_list, cpu);
 
-	spin_lock(&reorder->lock);
+	spin_lock_nested(&reorder->lock, SINGLE_DEPTH_NESTING);
 	if (list_empty(&reorder->list))
 		goto notfound;
 
-- 
2.47.3

