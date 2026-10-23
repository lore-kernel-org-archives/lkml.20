Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716051;
	b=y/RbLlytYwtMnk15FkoeXOCtldSy6OykAKssTzLlNPAgo3sl4oxknc6hoIhaTLxeVxcG
	 YbcnijffJzGCa+VGcz3abgfOIPo2Cgi+Vi9MF/OeVOcwDNyM2Nk+Sogw3FfQjW7KV/8Im
	 QgPgLQuL9T7elkCnZWe5fqG2sZqM16MqqNzPo/62WkO38MFV2C3hdJIXvjQVRNPdDGxd9
	 kaycxZ8zDRLqoX99Vp+uPJx107DXvsRR+QraHSaNmHXZgtrqr0tCar5J95RxkECPNojIY
	 WvsHx3UL2zFA0+7QiCeyGAmqFd25mZe584Ad5LHWedO8hfwDsdHi/r85dtmUcsnSuUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uWyqPtiO9T3gA3HzTMYjuquERoZRGMe37lTtw9Jts+o=;
	b=JI08qs0jEYLolqzjS6Tby6SOcEFSk1xfPMwA4MhluCuVRBSCDPYWVD/K6FW+w6pw72AG
	 KzvfP6pu2iOjesLHbNrdgXS0+K3eDf91JbN/wizEeeao8wD4OU8ReH/euK1KZEBL5g0Pd
	 ln1CZmx2SeKCVwNM3WQ5u8BNiEnMel4QtfoN08BCSUv3vLCXCLAoMvSGf6BEmf/aq0tuZ
	 s+EuBeY3ZypspJR8NYt0atP4EeRo7lLI2Fgl5P1s90dJ0l7w4CxmgF5nBDYgJ+ul6JvAI
	 TzxD7BH8MAraC+PlTot7nsDBx+ijToEku5dGs/vPjFbUr8+G/HRdimDHgHX9AJ3/gGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TXhpX0Bw;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC4606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83BC4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TXhpX0Bw
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4395d31228so57748866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792716050; x=1793320850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWyqPtiO9T3gA3HzTMYjuquERoZRGMe37lTtw9Jts+o=;
        b=TXhpX0Bw8RC+C+6aO7v84NJcvA6Y6SBRlt/g3tanIP9RPjaV46IAJ7GtnrZigg5+NB
         u6BDsVBkeabEXXpYzULc1G9c1X5Y8ivE6kxaFq2vCAnmvBU2wqsxL8kPk4Wpvjz852PQ
         zsiEZQB4DLHXf/LnNWW7QZU8GFbeG7ydwc98Cr0xhQ4eErXDwkolmxsSg32G0kDJFJb0
         vxthV8K/mM71zLP7qBcRIbholw2QWyaJ0PGqSdCOyW/dT6UvusVn8abJulDGqV2l59eK
         76zqrbHrbV/7C36vXpcgcGIypP1y6Q1lSyHjhUOpQg5tOAirhT8NkRqkWFOv9V2wjE+s
         gRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716050; x=1793320850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWyqPtiO9T3gA3HzTMYjuquERoZRGMe37lTtw9Jts+o=;
        b=D5G34FVgcFPsrlr1FhwQ4mby8/+q/s905YyMLvT4xnK7DxDAP1jrWDTynE/LywWncX
         bG3DFg7ioS4zcKSxqiCTG2wEcRh6JIGYpPJAHd88KM9duO3FN7Cjdxjett9QTvdAz6Hc
         jx+60LKtuE6NHLUGcCerqsfaZkuMQCggSAL3eK8N0/j1/kwVqhkKBPElu8YOKUPVe18g
         Jb0EUkFoad7KgM1t401Slv/81JgIjmbyhagcGrn5qBYAgvvjzGAO+oDBX5N29zpVAS9p
         aEPaQBq+oXqW94oMYuyZMTnQEAARWra55Sf8xy421ytmnaKaHaZjSQzKulFx0Rjgnbqk
         FasA==
X-Forwarded-Encrypted: i=1; AKwUvBx11t4vcuybrgwGlqRMGqmk6vYUB5G/nt6wj8Mlpc4SCq403CGoTW/ZxUdcDe3BvPQig333JV9pGE4kPGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMe+N+eEdKp5YX4BRAVZXNo4moJFcpTxbv9E7t36FO66rMe6dn
	Wj711Xdfa8ftsvXCKA1rrhSiQJvDRQEG17hjHWf1NTfjLAO/rIkyS7pN
X-Gm-Gg: AYBFou3yU+2zWWBbihyxJ4B6doAWG8nzUxzM7aNAnQqVTBxQspPuSbXKNiNNT+4R307
	YDjTyxJmHPIZCUp1usYmng3UttqA3zJc+ttS6lQ8Ncxylg4wECKwV9UaGX64XOI4E5rNpPopsmy
	GWNnX8tLrlRIv/VLiMcX0f5wRWB1r+RnBxpHT40LR6hjq+X3V8WrsdsajDZD0xLNDc9xne7roQ1
	tEp1k7MAA4XMX7spy6mJ+kBNHkkAXKLkbrThlgBz/63Y/NmAWIH3Sgp9b/B70hoRNK2s4YU0EVM
	SLO+jXzofXdvsJjk5SPW2IRalU5AWYfDulGJ8GwQFvALfUsPrHnBgZxotjpuilPTambc+Xt88Fp
	+4ZlNC6dltoVxBF1UQkMCMjDzFHckOmG7EYlqpOnkTnJhvCXr1g0t3Tt2wF/GH95RzdKifFcSFg
	fZndRZeJqjmHIHZU2JwCLy8udduzm9Mre1qK8IKTF9/nAnn56dIKFt9UCiaeCk0Cd9vYGpSH5Dz
	zQaOZhgd6VJz1Of+DohKm+M2KkOn5m4re7rBUqSvQZwCKRTBoqjkWCZstUOhrj7Di4QaNPP1/9L
	zk3TOK9I/wjgE01W+ok3WFUr40TtMQhJZx83qjH9
X-Received: by 2002:a17:907:7285:b0:c42:2d07:4c38 with SMTP id a640c23a62f3a-c46a903b6e9mr116843766b.26.1792716049876;
        Thu, 22 Oct 2026 17:40:49 -0700 (PDT)
Received: from localhost.localdomain ([45.93.75.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5a90202sm47330966b.5.2026.10.22.17.40.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 17:40:48 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Subject: [PATCH] ksmbd: select CRYPTO_AES
Date: Fri, 23 Oct 2026 02:40:45 +0200
Message-ID: <20261023004045.98484-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ksmbd allocates "gcm(aes)" and "ccm(aes)" AEAD transforms for SMB3
encryption, but SMB_SERVER only selects CRYPTO_GCM and CRYPTO_CCM, not
an AES cipher. With a configuration in which nothing else enables
CRYPTO_AES, ksmbd builds but cannot allocate the transforms, and every
session that uses encryption fails:

  ksmbd: Failed to alloc encrypt aead : -2
  ksmbd: crypto alloc failed

Select CRYPTO_AES, as the SMB client already does.

Fixes: a848c4f15ab6 ("cifsd: add Kconfig and Makefile")
Assisted-by: LLM
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
On x86_64, defconfig plus SMB_SERVER=y ends up with CRYPTO_AES unset
once MAC80211, XFRM_ESP and CRYPTO_KRB5 are disabled; with this patch
olddefconfig enables it. Without CRYPTO_AES, ksmbd logs the messages
above when a client negotiates encryption (seen under UML on
ksmbd-for-next f75c93278608), and with CRYPTO_AES the same client
connects. Distribution configs already enable CRYPTO_AES, so this only
affects custom configs.

The smbtorture smb2 tests run here (dir, create, getinfo, setinfo,
rename, compound, streams, dosmode, read, lock) passed on the kernel
without CRYPTO_AES, as they do not negotiate encryption by default.

 fs/smb/server/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/server/Kconfig b/fs/smb/server/Kconfig
index b7665e0e494..f8b03605db5 100644
--- a/fs/smb/server/Kconfig
+++ b/fs/smb/server/Kconfig
@@ -16,6 +16,7 @@ config SMB_SERVER
 	select CRYPTO_AEAD2
 	select CRYPTO_CCM
 	select CRYPTO_GCM
+	select CRYPTO_AES
 	select ASN1
 	select OID_REGISTRY
 	select CRC32
-- 
2.43.0

