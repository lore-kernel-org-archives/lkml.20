Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990633;
	b=qazfOxGc6oiRuhkW6qlcc0e17Sz6fGbGH1sGBCF0s1A7719OoDanrGfjSy1Mt5ZWpQsL
	 9LaBOtyQ3gSWriy9od0yZ2k66rfYLorGFH4rMRTkkj8T8NszELEIYHwAy/PQ2LiVOqMYX
	 JAczupva298XwNHBjKg5Po+Vz/9guPewVPA7m7q73/Gw0BIsZcdNdFh1WPgKWZERiRApN
	 GanIDMt+11cfeOGf0qGq6iN5zRT7MJQg0Kjb3QODgAeTpcnNGdWoTdz2CSKmEPsifBKfW
	 /jp0ptQtasoWqgb4dZxP9YMS0XTR8++JLInZQYxhzDiMwSJFxZiM3haXuNCFhKnRHOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V+8S8+cfVySobIuEWLwG5yyplz+yBADfrmzT80ly82k=;
	b=NPs3rKisb5zRsahrTHBWsT9nYUQ9M8T+1Ld2yUi7Wkc1O9T77kLSzDhW8VkMrvTXUDDE
	 GL1MCgF84ND9/0lPwD9+NQUSxxyi6Y5eFb7AEgL2zmj/nFUE16eGQKC5snCzWBmy3JZNB
	 5gSfb4/UWuNKjtGEJCekRoFhMNqaYk4O007kdoedUMsdZvNPUh9MsTOXYDXoNymHtntem
	 0uz2AbBOHJeRnCQe9OQjhHknhkeoZjGe+foheTS6hTcw01svD0ltbZxCt4lM+wb3y5gEl
	 htGbaX1LyPMteRQL0tAaQ+DH/3WnLrmQg7u21Kilv/4xYAENfAQ5BV/fFKBXFb/1QQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLUt8Oox;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B898B606D839
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B898B606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLUt8Oox
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1225473eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990632; x=1794595432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+8S8+cfVySobIuEWLwG5yyplz+yBADfrmzT80ly82k=;
        b=hLUt8Oox1wh+RjoZr4soKfhuHh/efc9x9XCcVBYW0QcvUiwa2YY1pL35ARccV2i0o4
         FwF8RyC6rYr0xQx5cEi756PL0wOLo9s+GrN2Lrc4SnZzQfZ2XzrhfY4UWj5erNGeVZjh
         mW671qX5TKHR5fN1JPk1n9a9b4wSnGvjoFPf2rMdO41BSMjTObGWsd2oTxO1jyr2Foy3
         tBkdUavBMTWrVs/SWnNgADkv2nZPYotHLXnszKEJ5WuaaRQ10FSGBcL8+FdmWSUukYEB
         p4uU8/D1M/frnSvLA057OEh+5whQd94RHg5Yzsi/WJvHh35jl35xkNZm/+w9cg7/OXZt
         xqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990632; x=1794595432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+8S8+cfVySobIuEWLwG5yyplz+yBADfrmzT80ly82k=;
        b=rx7ngNASXB2eZiA1SzXJqVu8rqA1TDhk1TDkD4Wdy0zcXYQ3jn3IkwM1l9IcyEd7dm
         H8wD+0wja74gVsWrraXnOeJI5e3WnAVNY4yxpYRkFBTvin6GcL5GP56WIbd6vk0dajJT
         3GPoNCeikJVEKnEMVNqwM5TR14SJB0eZwSI47Uyg6WoVFtXikE6RYL6d38Y5JpGvyBd/
         SlVPtsqUnX/o1MicLrsX6yaKl1YoYEtJ7Ag1EPyOemT1h3GBq2CpWzFMhhldRaVp3IJE
         I+e1oeTvZL3R4vJGLIXAYom+QiZWTasVF9J5EtAdqEdIfCOx1SxBgIqGqoLsE6Fx8aA0
         hysQ==
X-Forwarded-Encrypted: i=1; AL+hErFgQGq9qsLQOdZnCKDi3icmuOKdoc50kcDnWXp5BGM7xeDT7wKfjqgqZPbX6wbPkWm0AHURyh/BsmBfOL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YVLy6rEvmZTC4Lb4k661lYGjJolB0bej6spsEToVXABXs4qde
	58tlWZauBE9gnUXn8WDDrFFD8UCEVlKjojKIlZGrFXwVe3KnKI6yvByqGejiQbkk
X-Gm-Gg: AYBFou2gFewUPvIrnvwaVub9VMEmCamsza+f0sd7IB5nQa+3ZcoSosM/IbMs8nikefL
	PKIlpyRRqVmkteJPBfgS23cjN12/8GuCXepIpEuG1QK6enG3HtVPwASmopjlxG4/zPlWD4VN2oq
	lR9So0KIiWO3sVC5DmqOSZZnctdsrAQ55JBRpb7sp/I2PHGkXYRqB1zh5GDInXPcoVKINA4me3+
	Ge9aHnpFd0ACkcdSRAvI//YryBmJDt68vkVH5d7uJVviaA8yYgeX27bolberKcFftLxdgTiqACY
	85dJ0fctusGW5OX13CF7q+JriDxti35vQgnbrYkWgHdyD3BxikHFIeTPsKH8RepVpD7hZr5X9Av
	5vVYjTnqnKdrjrhZpeoUggotNR/1taYCPEqE2E0uWfpyaalL9ityIRyglmYgQzDbe9xZp01hqf9
	Y6HQhQMUxcvDDftiEipGNt3nxiR4HUUST7HuaaKVtGtzbqG4Iejj/JwbwmcPBGMLUFcDxGeoAPZ
	6DMopWdGm4wmaXUsCtI+B6HGrP9N1fSdRgcAHBK0YSbiTHJGlZD5JL/8Tc69YMwuJF4F2lrp7U4
	ySxgaYhebLSY422LRWszovUA+oEg
X-Received: by 2002:a05:693c:839b:10b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-36f76023a00mr5131720eec.25.1793990631801;
        Fri, 06 Nov 2026 10:43:51 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:51 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] remoteproc: qcom: Fix bounds check in wcnss_da_to_va()
Date: Sat,  7 Nov 2026 00:13:11 +0530
Message-ID: <20261106184312.100-5-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261106184312.100-1-atul.akella@gmail.com>
References: <20261106184312.100-1-atul.akella@gmail.com>
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

offset is calculated as da - wcnss->mem_reloc and stored in a
32 bit signed int, while da and wcnss->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
wcnss->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < wcnss->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > wcnss->mem_size - offset) so no
intermediate sum can wrap.

Fixes: aed361adca9f ("remoteproc: qcom: Introduce WCNSS peripheral image loader")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_wcnss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index c856a92af43c..d95530e8be71 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -321,10 +321,12 @@ static int wcnss_stop(struct rproc *rproc)
 static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_wcnss *wcnss = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < wcnss->mem_reloc)
+		return NULL;
 	offset = da - wcnss->mem_reloc;
-	if (offset < 0 || offset + len > wcnss->mem_size)
+	if (offset > wcnss->mem_size || len > wcnss->mem_size - offset)
 		return NULL;
 
 	return (__force void *)wcnss->mem_region + offset;
-- 
2.43.0

