Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB547F789
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202869; cv=none; b=NXJ3IMiKvowiLlfBjIlwB4D5mL5H7oLMA+zJfaVhpyc4gGhwm6gYfHJ4+3kGi2zznOw5oZKSOLWxej2TGFsajKIEfGW5H6zG+ZejCX4Dr9cpNw/v2lZLdvzUtjHmpBlkDDiRvvHkLGxe8Di+usqF+QJR0McjHOWJ2d1viYDPJ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202869; c=relaxed/simple;
	bh=VHW64+XKqVe3avQgFBnjX76UUHzzxcjsjk6c+6CGgdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiJ5GF7aktS+vBwAyv789ed6QRc+2u5lhVQwtV0xng3nLm2Eur61AlygXJsajdWhcHgWZPvv4DoyAuRXjdto4psBrOnpuSZ1wpiJop14d0wGTMQjDKV/yx4zYB4IkASGvWLD6alS3+EZYZ8iDuy15C3ymgfwZaV5sAvC7GoN/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kph0Z43z; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kph0Z43z"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a82eab3fb0so194206a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791202867; x=1791807667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xr7xKaCtjbvx7w72LQrkYXXkRaaEyza6tLflugoYiLo=;
        b=kph0Z43znHLgC6qQYU1Gp4rbxlIQCzrADxUw0M835MjpCI593XT96YKBiL5uZ5acYY
         Mp92wKMEF6AnD2u1jsZ7FlCY7a3EyqoJ6tds9awQcsilE9VOeqpySGpGJZxYTHNXLQAf
         W9y9ttwT7dRvzTA72/HMpfiFm8Zl4bfJAxvc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202867; x=1791807667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xr7xKaCtjbvx7w72LQrkYXXkRaaEyza6tLflugoYiLo=;
        b=MFv0tX8dYG92/dU+EPoLS03b5EU3RHWPOl1bJVUJ//to7Dj5qHfXvRV8eLwV/Y3O3z
         ZoH393ymnfS5oEhQuuQqC8XAvCmCIn2ccZlKSuw7UZdj4yt8zSFfAokwwXKMATfKIWE4
         IqNwp2yUqNj75JOQGT8P1sAzYI73/2TOnRv2Pri3E9qx4vFzzFE0uNwqzuXxDWbC9MCl
         FUib6P94hp44yqkY0CfFGTquW5Y368oJwLHf5EW45vjdLXWJpwFcssKdt9PJBdBJLlI4
         kn+uR/5uQXP9wIgWWDrGI3m1sRGAWFw+jDe/iETfCD4b4KmDE8ovjZTzhBRYRDF2Dt+D
         TIrg==
X-Forwarded-Encrypted: i=1; AKwUvBzQdmFTK/yVotVEQS+zA4bE5EeB4Q7Nex2Qr82kEd/DNhS+igJ9To134xGVrC5kIGoB7HH2uH54uE1AgO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyGi+jEyO1dcvhlU0+SGlA/NTlBXFrhk94XstslUhScVH1BR7H
	GU6Ek1kwdweYE+bOLG4oQfTbfnVSKgBFTqBeD9/5FVos6RCIJdWzmfhSE7BEFmgElQ==
X-Gm-Gg: AYBFou2pKyi8GLhRGuKXcCCoxXMU/G/DHv6szHsb7CUrgkMouliV3y03WfG5692g1oW
	JVZHT3BdMoy52Xbno2rIH/8lLsjYBBr7mct2SU/zhcQCKAqIs/KKVeP08gyqCOcBichlXMYKxbm
	AzaVoLdmyJbrJlkWoHPgD9dvVVhfZBl8UdMNaCOSkygzSPHCKzQTh9/YqGY0Q7P7eWJcPbRVB4T
	+eNezcbPSrzQs8tDHlgLHaMPI8u8+wBjlkjk0Sc1jau4B5dGVtyUgK7gqRKbXps+ioKEhX3HMax
	SXvk1nJewK+cJqKRsF4Itj1yL0icdvhyMJSB4LOOSgpfJciMKlyqLNznacq7xY4XNt7+nbdJsxO
	trOoWJXQYAinr9/IYDQqtRiA+sXOv2oV2h2LY3LZe80bPq1Kqg5k/5AdWZGpSrU3HG50S3gZXEs
	iM8uItUf3hdE5oukpqhBDbAD1v/UBiY1i1+W9tMpxtEKciCY0NtKnFRQfzqezBYfLfPj+GHog34
	doMbZRQDZrVIof9DReKrW2qEAnIQIwhCBqb6SUgg3H2OGkyQqY6x89ismEAN/XXvjvgUl3O3A==
X-Received: by 2002:a17:90b:260b:b0:3a4:f1f9:1cb2 with SMTP id 98e67ed59e1d1-3a6ce6b4005mr8903790a91.13.1791202867515;
        Mon, 05 Oct 2026 05:21:07 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9211:ddf0:3c6a:bf9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm3342997a91.1.2026.10.05.05.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:06 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 03/10] zram: zstd: do not allocate empty C/D-dictionaries
Date: Mon,  5 Oct 2026 21:20:18 +0900
Message-ID: <20261005122036.718976-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261005122036.718976-1-senozhatsky@chromium.org>
References: <20261005122036.718976-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not zstd_create_cdict_byreference() / zstd_create_ddict_byreference()
C/D dictionaries when no dictionary was provided in the first place,
because zstd still allocates internal memory for such calls (~96 KB at
default level 3, and ~160 KB at levels 9+ on x86_64).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_zstd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index 127976b5455b..b367049f131d 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -76,6 +76,9 @@ static int zstd_setup_params(struct zcomp_params *params)
 	prm = zstd_get_cparams(params->level, PAGE_SIZE,
 			       params->dict_sz);
 
+	if (!params->dict || !params->dict_sz)
+		return 0;
+
 	zp->cdict = zstd_create_cdict_byreference(params->dict,
 						  params->dict_sz,
 						  prm,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

