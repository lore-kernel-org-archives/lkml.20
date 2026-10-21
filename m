Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550576;
	b=rF9Bhpy3Bf2ss8SGuJVf5NXhy6yH5Tm9O4RiSa+rmBlD2hFC/WL8b/vty9xRy2R5/BSB
	 YwAFAG49q+NhJEB9QkmSCkjFFvsIzdAofZARhXmGbfsfRcgQA3xeitDuTQW6VeiY0vVGK
	 0EDatmdfOTzpbzFam4vuhRH8d9Kfc422m4C2RtZmZw8NZc23nJ/CkngW4y16FyigZifVn
	 SwRD33R9DRYDI4OB+oR9cEgZNIG1/Dr1P3Cj+C1QKBlD35qIIhIbEhPJP2fkUUpja4Pzf
	 JuDiBkF3752mR1W4PAfRywwYAF568PdKsqrR8Zb1uh6akpL5OTUdYPRQP9arsEgxjTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NSNm3PGjiMFoOsDzDjaZU4Z4GyR4rNUbLgx0Nkj+0wk=;
	b=j20aztnHp1jQskbpDa51XvkrxSZViAB6cT2e0BTnPFv9AD/bSamDcVBioiojCS2n4Rqn
	 pIYgbq6U3K2p4MT1Cv1hLyqZ8jvF2o2GDy+RiVhsKobn9of8wfozX6QtI/gsDUYHqfJZB
	 WwgO0EmqNZ9uVXWw34VWFye6nymUz/GxB0D4mi6SiEoZL3GGTeyL8Hjr5GdnnuLxZ6CWg
	 RlDS1sLVX4CKN+3/aU/YUfxuMuwMjEZ/Bh2lMvqAySm6MGPoU+J2wOxoK92xltfrrjnQJ
	 snMlE4IPeNadZrCXCpIc0zjkct/xEP+xO47Ndw+PnQjv8TOI3AXCNfeCuNVido6koIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e9rUmx9b;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BD1606A339
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29BD1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e9rUmx9b
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-16079d54c17so510510c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550575; x=1793155375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSNm3PGjiMFoOsDzDjaZU4Z4GyR4rNUbLgx0Nkj+0wk=;
        b=e9rUmx9bzG9+1j7EgduvYDIR8a0RyPKrm5gYNFkpkTOx9q7kVV7E6W/zfEM+cEjijD
         yJFOOuNRokkPKizTmwgUwXT1skOYgb/35iZfT50YewjGwaD/K3TmSHI6F8pUQcP2tvuN
         FQ5NDbljFpY1A29xEpnd5ua2h7qLX0RpaLjec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550575; x=1793155375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NSNm3PGjiMFoOsDzDjaZU4Z4GyR4rNUbLgx0Nkj+0wk=;
        b=PxrnRaBRaDEKFgYDrmxQFHKY8ku2OY0enC8Ijqgr2XY+o+hZAi0C5ir+LS2Z/aEsAN
         UxiYs/oysw9UKwAGLwjg93/iVLB20rN5kDDmi14pCW+yKq95IZQFHE7EejZjPO8NvT3R
         8K1mYpIjPUZHLEpiw75gHKCEiapnEXek3bVAP4pBJfsmHGY+9XJXnTUu7Nfv/O+g3RK5
         YNcuv2BgWos54iatAuLALIWIoNzYKuqFDFIvIZ79xpV4bfBgSnYS3YmzCcOMg1gAmts/
         Mo0vl+tvhDe9TusTM9BkDqyQn2qcSHVmSeoiObxC/36ywNQgIqQynSI8VlM2NIPFBIwP
         jKqg==
X-Forwarded-Encrypted: i=1; AKwUvBzdEyDtIa/ZZ0OT+YjKLrLP55ZvvxHSSCjj0oI8V0ymXL/DtbIvdbg8H281/1qrePPLXBk2H/BQV631wIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/0jlariHAZvEvxhOhi9f2WDUIXnPRIXYoku9m3xgR4n08w0Lk
	hTtvDBckwMPsxxI8CFKEt0LkAjs4+SBp6JKyctBGSA3o90y8KXTEsznF7acXmwtoIA==
X-Gm-Gg: AYBFou2GkqFGBuDJDQ9qKdrFW0ZqlBODRQnGVw7mSoaVcNAMtVIU3U5Ha/BlzwNuIR0
	PX5uD2K7f+tAYopSOt8J4WVbH6ZxUbIzsXeXHwQpaCa9s7/gdBLr4LvA2FajAx4CVrfiLrTOYIK
	cMm7KMjpFdHmX9eMF90cwOqXeia+2UdAtp8AX8PvZnZmD3U8BNOrW0HJHYXGsjExSzPwYTnfiLR
	yGvhyobTL4pSUJSQph7N75GSrxTmcm8YNhOxVnKHZV7JVvB4PWXQ6/mt5sORMP6K6cTAEoXHjmH
	c36B4Wbip2xJ06GFp5KhzQ/FM6BQwqfnyv+f9LXprU1r/EkX83331Htd6tS4NE33QjQEf7E6A4q
	synkeJcgYZHLUwBbdLolxVLgPuLJVdVg2PKOOfveBLLt4N2LnYA1UbrSxrga0wKONIbMHJhnpPg
	DlTp7T4FRODrs/lxwhBk2NzIvc81EHDl4H1nqOi7KuQE8rxaaa60SnA3w9KxsK53wsconZdTBJK
	2YjixzHmG+3COCn3HJDK9zfXQM9uwbsoC3lecRszOZraVhEnLNP7f0ko/ExZfLKrxBgWJIouM/H
	ZKPidGKQiAapnUjAmFKV73SxHNqe1nV2vMztnZGh1cpj
X-Received: by 2002:a05:701b:428e:20b0:18c:ad6d:b790 with SMTP id a92af1059eb24-190a81e3c24mr914391c88.45.1792550575181;
        Tue, 20 Oct 2026 19:42:55 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:42:54 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 04/13] zram: zstd: do not allocate empty C/D-dictionaries
Date: Wed, 21 Oct 2026 11:42:14 +0900
Message-ID: <20261021024236.1787884-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021024236.1787884-1-senozhatsky@chromium.org>
References: <20261021024236.1787884-1-senozhatsky@chromium.org>
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
2.56.0.212.g129ede20d9-goog

