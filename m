Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894740;
	b=V4eKqzvktsDC7bhYIqKvM1y699617k4IdaW0TmcRom/NBanjtEYJe1PNvK0i5lrruRN5
	 sIJ9/etV+HmbHivf1naV0xtsU5bcsnsOaSPLJ7m5Kj1T6MJszNSu4xEXAQ+PXwd5dASLX
	 kH7afuSGKPQnZKMjQpcT+0muim+7xxT28FBjIVsQWI+uIHhHvhc101AkXLiXR9DN8/WTI
	 /8gs1MNQX7/ImDJ3N/oEz2+5j2usJgmoIrAwxcLgzUfoadqTzdak7od+zfhSIV29z1U//
	 LGhVjsUyFaahGaJCrr6VPdtOrmPkU6IF87aGArIcn1mYg/45otCKMlk/nIcDEp1J/ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m/5b7j8QNKagV6FrH9MtDrAVHWRcPhsXwfAR70xb0Ug=;
	b=sIvQ2u1o66F9Vudtj7u19Jnt25sjB2aExbPKFUFg2gkqYz0U5AQJVX4rBr9GU5ueDKz1
	 ladrs7PY0PwrpBB0ipO5GFVClMa1586KZcwBfgv+mGMrKn7sX96gglcYeK2NaGigc16Js
	 USD2NCvVTnTKkVcAK+owulv3N2aztUhTvAk8fmyd992P9K4azj59+yeVF4Mb6Gpv5twrU
	 S+lHsZACpRILlx+Bbclh6ELh46jz79EtC5X7vdWby/9cODLhV/ClQUWMYbLwHJVhbM89z
	 VV/vwP3WG6dNNBcXtzgpJ13rm1+ak5dSsqqsF3X0CNixt0k7PYL85o8HeYabfFovvAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mEaEtWj1;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443D606A325
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E443D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mEaEtWj1
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2323946c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894739; x=1793499539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/5b7j8QNKagV6FrH9MtDrAVHWRcPhsXwfAR70xb0Ug=;
        b=mEaEtWj1OFaHbLGuSLDOWsJZilE11kSLTXklpDVe9Nq/k5sRlT+ra3XSCqIX3jSnRt
         V1BaNi/mcsF+VaKi2bRK0Oyy8Sger5f5DR3cORrxrTmOi7srOxQZCy8KxfD3oiwPMBF1
         iqgcnbvVx2TtfrPMtc10d2NtZMnvRrW3ebggk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894739; x=1793499539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/5b7j8QNKagV6FrH9MtDrAVHWRcPhsXwfAR70xb0Ug=;
        b=hWCj+f48e75hBXFyVkFgdSDfZpNxIcCK9DGPjAKXLEGthFdbsTzXrgvsCSYGXm3bpR
         kVfydPZDzItewUP46yY2rJ2s3KTigufsQbYoAiiEcp/Cq/E1+k40F1UQCEyxeXDwHH5i
         aJd46cXkk6I02p8VCfk9HI2D666a2SY54FALTgoXJn90WzACpwYC0rD7FBHG2O9Hf9+R
         QMhiQz1iFR11VvHju+62uqu0YSazNA6bIa/BiEXU2qiHmumPKfp4iO7Ln9nWToOiZR6Y
         VvLzaMZfapoje5fGXMRnr2IigJZThPGrrrmOMwX7RUe5jHInNvZxTeDCqOSwYIfe7Ckm
         l4gQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJuYNqUpwGPZz2Ic6foOl8TkYU5Ro3LPI6SmuD+hD0Ed4e2cY/uRbF8+KqltfkJ64YzrJ8YubhKR4iAhw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdBHFV5A6CHQ0hxS4bvJzhlpiF5kCx32ANongTAYgGBXmTXL/q
	eSGZWHfEYjF0UmKdSG9EDLNxjL1kslnYfBFnqed1MLHY0XdGxjUWNuLIopxC6SQhcQ==
X-Gm-Gg: AYBFou0xe1T6lG/886EP1qDFMmUUWcmfemI3XuD6mh3SSoD3Kc5iKE8b+O7tS+/tkY2
	ZPEL+sWMDHfGGy5j/9ylw4oaG43TXvrZ5qRvHUA7zFrHl4epBE8hN9jMxGd8LZmSBXedqId5CoO
	o3K7oocwRnAzmZmtuvJuk8Fxi4p/VA5Jg0LDr6DSUtwImPGZ0xx652tdmZPMZulj5i5pWpP4gTl
	xfDqbPHkhwdhGp9/Gwghjm2hcd6CQsce4NGqcDsj/efQ5tCa1foZTBCX+bzwXOE9g1SOTB21G++
	VWD8U/3xh4j/EqRomp692L76M4RCpoUSNr/cbp1KeIhCaHllokZaPF5uw7oqc6QvKG5jaSExgqT
	6x+O7mjc7kwG9sAn+W0652U/WO2SgeoybC/5FSyH6p6sD8NtYDfNN0XVLkuHCpzR9uEaD/VjIca
	yg7a1Blys2B4LoiicDTUxhbY/VYv+3lcSbR3dFJqa8MnVh/OkdAuyrwyhtguwgZxXINx4ZX7dwN
	Hq1eUMFLBNWgO+1VU4TPaEq1OGEWLEVGxttNE0O5VeandqZot+x+dGUz0zTLN1fcUpmz0yinQBZ
	fsgeslrjo3ibbN2uSlkAKfjZ/59sJJ5w66yL1lP8YMIA
X-Received: by 2002:a05:7022:fa02:b0:166:37d2:3b72 with SMTP id a92af1059eb24-1993686f496mr5842218c88.27.1792894738959;
        Sat, 24 Oct 2026 19:18:58 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:18:58 -0700 (PDT)
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
Subject: [PATCH v7 06/15] zram: zstd: do not allocate empty C/D-dictionaries
Date: Sun, 25 Oct 2026 11:18:22 +0900
Message-ID: <20261025021839.1542805-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261025021839.1542805-1-senozhatsky@chromium.org>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
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
2.56.0.257.gf7497c7d27-goog

