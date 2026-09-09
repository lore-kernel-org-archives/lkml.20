Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0252A4825AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788992962; cv=none; b=Fv0dLrsun2nkQwB1HoupFJx6B73GnnX68GOlgXovo8EQPiEX9oP4aau4cZ4mN3UogfwAaKxgCL25EN1nwnpjwSYXZL7Hu9ghg8/0JMC2e5hEKBAXm8YYUMzMvrSw3FVP9n0s8ljcGNqu8GpG/XT7jVTff/YetL2Cukto+UdOE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788992962; c=relaxed/simple;
	bh=WlsOlqUvKm0Axyc+Vr7Lx6IQyXMjzH3K2ebSlJNCLAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQkW600eV7z3t/nTw6hDNv2MUnBSMFRzbULtAihnVRiJFOKOUK7qBDrcVoRg+gftJlMkz2MUfcdbbvfJKXSUgFRIc+dtTtFmk/DQ73QS+deCJ5f/rms+oT40PJio1aFltvzp1eXq4vmK/vqcfFE1lNYg3sOPKXaTqvIhg6m46/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=YlaDTKAO; arc=none smtp.client-ip=209.85.222.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="YlaDTKAO"
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-939a5f8d16aso884285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788992944; x=1789597744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMfVAOprw3d03YbEriUlDSnVZxTmhvnPgihN27iwNZ0=;
        b=YlaDTKAOPD8G9f6lPOdiST5HYvAvKoSvlH1Q0SKuFaO04MjE6GXwrFoaECtfMuWseT
         i6JIP9OpSkWmJrK+hCs5zwirb9PTaYOFEIjPhwYDxXlx0M3W4slMSObihwDMwEK+8Sly
         JKNS3jSK+MBICrCm6z/UfNqdlcUPH6zO3SXSeob9nWcjF0qeSNpwwm4wk5vSfzAjMpae
         tI94U6R6t6K8/p5ch9nWGNj4sr5i2Bpp44VbJYIGDBxW/SUzU0dK+fb3ptJmA18VTkta
         1aQWLCsngoLenxXlVpKPtsi8mzs2edAo/XdAkknk6Nnwomtk7366JjmabSnqOYnZa5ch
         K6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992944; x=1789597744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMfVAOprw3d03YbEriUlDSnVZxTmhvnPgihN27iwNZ0=;
        b=BmWDflUnMMnTAVo0NJm8MU95/9akfNGI838oKFIJojv+aEE82RrIxORvYd3w30eE9y
         kcuYHwWs54oFzvJPPdvJeuwafqmtgI38Nns4jOasJt4F9vlhIf1yvIZmXFj0VdRUAg2a
         8gBu/JHGQa6KgPX5L9Y+CV/koZGD42vzIp7cvRQyVr6G3IbeEUqiuydeEpQouFlFNQ+8
         NrSUXWpLAZQKmAaN8w8ShTKuw01tHobCf+O5QS4k1MR/DH5jirWzydw32scvutGimhKK
         xuY3gyIqSbhnllUOlZDU1TN+Ko5WJE0z8nuawBdF7tz4uyuSNUMA2YbU2Usn6bL2zAcv
         cYvw==
X-Forwarded-Encrypted: i=1; AKwUvBxHUL9pt00wA9/77KLArLj9rZc8bf94KxzR/Z6nDUhCTP9x8ZqyXJQ/BaZAXQpwKk6AJw9hCHEdAX/RsLw=@vger.kernel.org
X-Gm-Message-State: AFuF++nvN11f+hjuuphag5UYcAPWYbPX5YUcDmYnfxQgyMXAYQjF/GJJ
	gDGilbrKwg3542J3mpYxl8VyXpyYgYBIu69TyAIK2PDehSm1cjMpeQGzJFt4Uldosgnk6Z4Lnpf
	URc1t2coXZrGlMrwUGPvfN8acwmunpwxHF3SmXqzxUT8Y3hfdk7w+
X-Gm-Gg: AYBFou3csJiEjHJPAOcSM7MvdAypkOVUTcY4dlD+EgCFdJh4+kWssE+o4NXQSryjAxG
	aOBccqvM3RWkyT+Q0TMi28loAgOmUzWEdpAxFNh9xXuGNl/1SRf/N3917bgXu1ER7DY7iWnW0KU
	CddUy7r/pfgczEEZZnl/2qSBk91BtbLum5nhMxhw8hIhyKwAa36NThW1ms2DhKKjfabCU5KLLdk
	JZmWzkcyWHPJBtJYPEQx4Ec5M8l44T1d/zGDVIkcHrXlJSDhpOKuygdEHj9jClK153t0KCicqwI
	MQ96sOb+25nlg8Y26bHIglIwyiFYd2TqnmBf0F2HxwEja0D5I4dfs3S0JuaXDy64ueV3Prrj7Rk
	DqXCAD+Ud2bAgnnrW
X-Received: by 2002:a05:620a:46a0:b0:939:8a2e:68bc with SMTP id af79cd13be357-939916a0e37mr2963766485a.1.1788992943812;
        Wed, 09 Sep 2026 15:29:03 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91040757b20sm1488646d6.24.2026.09.09.15.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:29:03 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 096AD402B2;
	Wed,  9 Sep 2026 16:29:03 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 07299E40322; Wed,  9 Sep 2026 16:29:03 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 1/6] bio-integrity: remove dead bio_integrity_copy_user() error path
Date: Wed,  9 Sep 2026 16:28:31 -0600
Message-ID: <20260909222836.2475352-2-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909222836.2475352-1-csander@purestorage.com>
References: <20260909222836.2475352-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If bio_integrity_add_page() in bio_integrity_copy_user() fails in the
write case, bio_integrity_copy_user() will return an error after having
already unpinned the user pages. The release_pages label in
bio_integrity_map_user() would then unpin the pages a second time.
Thankfully, bio_integrity_add_page() can't fail here because the
bio_integrity_payload is freshly allocated, so bip_vcnt is 0. Replace
the unreachable error path with a WARN_ON_ONCE().

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 block/bio-integrity.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index b23e2434d80c..8ba8bfa41f8a 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -299,19 +299,13 @@ static int bio_integrity_copy_user(struct bio *bio, struct bio_vec *bvec,
 	else
 		memcpy(&bip->bip_vec[1], bvec, nr_vecs * sizeof(*bvec));
 
 	ret = bio_integrity_add_page(bio, virt_to_page(buf), len,
 				     offset_in_page(buf));
-	if (ret != len) {
-		ret = -ENOMEM;
-		goto free_bip;
-	}
-
+	WARN_ON_ONCE(ret != len);
 	bip->bip_flags |= BIP_COPY_USER;
 	return 0;
-free_bip:
-	bio_integrity_free(bio);
 free_buf:
 	kfree(buf);
 	return ret;
 }
 
-- 
2.55.0

