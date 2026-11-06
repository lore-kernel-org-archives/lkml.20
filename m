Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793951854;
	b=a8wLxcCom8iToRJO3fdd5WbCedPf6b1nQoh1VmJoFQrIaCw0OjXoIZ9mgaSKDmkRBYLu
	 IV16PFwRemWc0I6IU5Se4t2HgfoUl8l7hAVDDFS5Wxa8GBLJbE6I77tZ25qukqV3WpCSd
	 4O7OGOGqHISSVdLEHL029nCIs0ftWvdVhlo4DXQhj0pRRrk6hZqRXMD28YCu7hmgoUPOq
	 RJG/czBX1EDHIgu30+OtrOMW00j6gMmy0bDzSQ7VRCG+7zPNJsk4Q8HEC1cg5+YjYPaiY
	 P1eT3OU2WFj4guGpYgrpmuHr6fNJWKMJrdz6LLRJig4sDOzlGIoW1NbytT6p596lLLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=DYpY5tnHLdMu8mF3D5OCo2Uuu5ItSVDB1Brn5+n2fPg=;
	b=BPQL9KUBrNWHnji/umrNxYqJFdCpiyAYhCULjIzuR/uRKMYAXEZvMayrI51+rQPvVTNQ
	 hNbFhlOaqx8evOo5fiDl0ZIgIEmrETEB7Kdc0q9GiEV4OSkueCbTPFojmw7nigb8wTCBX
	 FniQEgj/7ZiCp3yYuG/ZNpqOiruSj2FZSg7Iy5sol/xae5K40bfaapdbdFBPYdcCTFAlW
	 mzyGen2g7LNU8cj3Y20ysnMV6k3PZTQE0QM7yw6F0Gy+HKHTE9C7hkSuvp6zv5iNuxsK/
	 R8G+LAX+cjJPy75j+7UeKMCKopXHeBNjPfY/0hm1YBH5rJ0AuO7cmIdwLBhsWyjJeZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neTSPHul;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C0606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82C0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neTSPHul
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a77761ff8aso239853fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793951852; cv=none;
        d=google.com; s=arc-20260327;
        b=tB1fRTi9Q4YZa4MLMDRwudq8/a3jq2PMa6jOr/oObpOOTn0Ivh0KifkvRhYuiMgNDs
         BMNOg0v/BKPkgS80hoPh0FSWySFPDQCOcRV3QH/7PDAB4ZK+o2LCnbUEzNhQnevrRmIA
         kFfJKTSieN53fAgMvh+4UrHkFnCUR33jZKoKGjAr4XJoR2wAylAoCMrVz5AT7Y4DHDcs
         jNhlBOGqimFCW8gmgUAeOwbMDUp2KU8Av1FATvg7XqhcoXsUJVGE1ZxGHDGvuu7feauF
         TBE8n+Lfu72F4BS4RxlDb560WQlw35hKtiS7+VHIhUyn5GpMl3ivi999+y/BuE6zApHo
         7EaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DYpY5tnHLdMu8mF3D5OCo2Uuu5ItSVDB1Brn5+n2fPg=;
        fh=Z/0M+LeXnW3mTHgEka46zxFTRikq8R/SN/InN0+LqFs=;
        b=DTjRlqlShKeduBc9LEeJt0oocmBZdMFavXL4atvq/hmslT7nNMpmH53b1hlGONOJOZ
         RjuwxPv2nXm8SnVfHxcz01X4MdgVTIm29vTw50jJ0KJ5yfqWSyb/1leSFE135l4k5igY
         Lwtgh0Is8/Caf4DQQMBjlSLqigV9CKXsEPKaMgAJs939urC63Mx2biTmMiMWAQ0DBd9G
         AOXa4cBVSjEMOt7yDXk2hXlYQan3JPGq+i7SbUGxKfLTanLV5fI/KDU3umxwY8bRKsIm
         ISvnndO4QN5zcRkSfDYUn12JNf3B5uGZIJqC0KEZGl5JYKtFcaQrlPGmZljMWK1cddbP
         6/Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793951852; x=1794556652; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYpY5tnHLdMu8mF3D5OCo2Uuu5ItSVDB1Brn5+n2fPg=;
        b=neTSPHulGqVXZF0NQfyklXAwchkfj0GUiBFJqGa5Avzi6COHPgjJiVGMYui5HxOIM0
         Ypvb0L0gYNdvfeN96YMzg42oFQtSIgWIgxQVDUIQfRMmC1JFzyvqsvBcV0z1eletAxaL
         daCOSclpZWk2K8OowrTAO8sD0t9wvTGIFgP1GLs3qCRbpDfDjLP+y5dXYFs2G17kOb7Q
         RYZXv/ezrvRE+5k4cwXSEdUaCPZqs3tSO3auIJ30pQCwfCBI26YumU9Q2INdy1QB4mtb
         tiPsnRFnGQYKSEyteONJw+dg+XaoIHnBqGnLEtpthovyWx9pp2bQQp6DUnazkNISUQtH
         EDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951852; x=1794556652;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DYpY5tnHLdMu8mF3D5OCo2Uuu5ItSVDB1Brn5+n2fPg=;
        b=gIgOITvAwH+uF/Ki7ETzu71PjkuL6muV9cZUHUxnM4g/EEvxR8zUpSwSIXNH3t3QS+
         9cBqFulvTGtrXkh90Em6QZjKcEFB+d/JM+h/z3wHuYVf1srOzlAzbWHsmbFhw7LK+JJE
         YjeLmb+w28JbXb9ZNKNLfbaRJXe8C/DOI/jOfXiA1yMSUVC1SwNpGckNP8qdss3MNZDU
         EKHoO8f914qGVLQlLmvjN9+gHySq2FOmFsBUj9RL+zZ0ZtkTKvGGfJPGDQKP0+oPrNVT
         lNioL4B1xCTKV4vO9LaBQgZ8dZGzCQVZ6GOMOpLu77JUo64ko9m273XazKe3HWwmBGiy
         4RhQ==
X-Forwarded-Encrypted: i=1; AKwUvBye6Z0LKxWNvTeFNmTe9kyd9Wu//c2qkScQFXRpS2y1iSehOmOG8IpODp4pgmqA7p7kt1418s+yfmySeRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FhwDM2WDozyYeyjeRo3dpolAl5QrazCjFG0UBVW6eTRUXs1dt
	iJuNyWUQjvMYpYgnfDrKKh6ArJUE8ucpJaIFv2TZ8vHu5XPOddGNMGf2tNPSTHh5wDmFKyLm1jD
	4LNN4GXm6sIDA+pzbeldFGfn+D6B6lRc=
X-Gm-Gg: AYBFou1kkOhYVSO2X+utiXkh0KeN7NxLquXOjqyNVuvl+beGnYC3ub3EyrUfU1TWOc0
	9uYTy4sD1jKUMU6eXvGG7cNyyKE8fATaSH5eQqUL814nQN8PB8FBQ3iOgiGPjGffHufYPziuLEt
	nqNAqamzXo5N0FhNxb0fEbe/OJjLxZmdi8jh08dAe8Svtm7EhsOUb7MFrscG8hH32Uv8z8H60cV
	LDS4mMoVUJr77YBxPNZuGy7BDF2ZcYSXrPppTaz+rTIEplSLwNPBk77iDqAgKBw+x2+yQg1V3k1
	tut2xVM/8brF0CLrK6vuzchPfKQuW4vg/GbK1CT6jCvXcVdzyoOY38yBwP+3ahyThJ6gyIz+itR
	dABYo0kS9mq5IuPVgs/mCffVajdFcrqvzCfivSv4P5BoFf9L1eiR9/YCel5GaXHDCrU7/NQwLtu
	Zd68wIhU/bMF/ig2dsZA==
X-Received: by 2002:a05:6870:65a7:b0:494:c04a:1a6a with SMTP id
 586e51a60fabf-4ad98dd0677mr1074288fac.55.1793951852375; Thu, 05 Nov 2026
 23:57:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Donut Oreo Computer I <donut.oreo.computer@gmail.com>
Date: Fri, 6 Nov 2026 09:57:35 +0200
X-Gm-Features: AclHuK_ZbI3jZ0vN-VbRk7HqBIHFw9XWUh-3AyP4y2zVhD1hRbXzpDrRyJS7WPw
Message-ID: <CALKjhPewyFB0=2tfyNVuDPosTAisDD2YcejTpX+0iiKRXdsGaw@mail.gmail.com>
Subject: [PATCH] dm btree: Remove redundant index condition
To: dm-devel@lists.linux.dev
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The index is unsigned, so checking whether i is non-negative is
unnecessary.

Signed-off-by: Donut Oreo Computer <donut.oreo.computer@gmail.com>
---
 drivers/md/persistent-data/dm-btree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/persistent-data/dm-btree.c
b/drivers/md/persistent-data/dm-btree.c
index dd02eee4a23c..b7ac2f6d1d71 100644
--- a/drivers/md/persistent-data/dm-btree.c
+++ b/drivers/md/persistent-data/dm-btree.c
@@ -1108,7 +1108,7 @@ static int btree_insert_raw(struct shadow_spine
*s, dm_block_t root,
                 * see a way to do this automatically as part of the spine
                 * op.
                 */
-               if (shadow_has_parent(s) && i >= 0) { /* FIXME: second
clause unness. */
+               if (shadow_has_parent(s)) {
                        __le64 location =
cpu_to_le64(dm_block_location(shadow_current(s)));

                        __dm_bless_for_disk(&location);
--
2.56.0
