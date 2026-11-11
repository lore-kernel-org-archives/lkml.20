Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379655;
	b=b3WSxqso448uwK5ExrINnCuLBiA4ZYgO8hVIh38DGuv/IrfbIFD3+6ED3olsjS5lySmb
	 1IPcyKglsGuXT9XPYCX2E9Oecw4bH96+FDOn+wGz6mqd6cLkieuwMRoXvOg7j1nvdYmc7
	 A77ZWNLD4sowXlNDEtyXfJuh85Hlenmxfd4tHyAAuxRGfRicBtrAaknIESbpArum3gQOm
	 u+ssmp2PSgQzt2cFNY71YK2jwrUoGJZO654al/3Ca+fUeZRu9H8VaET616H1a62JdVLPU
	 mhvThXiOU6tXKv+lvAKi5b8h7yicavUiSBeqJfLHiGUvBRNgtmYkAII/Q8UIU2pEeYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s901sm95u73URLyqX1tOE80ZT+B5IbZa2FXF/1v/wOc=;
	b=BQUa9/0zj/7OHYVbm3zzsoOZM6LeCLBHgyY+cXNte0asISLoRqlDb6+tgpnXClfkJrph
	 rEnrFJNIO/7qnAuPeKTBq6waFUKgL6bZPZNTEdY/Cf1JlfJ42f7zOQrfu1GGV/chORhyj
	 1c5MxlrxX90AVxVv2dGQAd+P9hLvd+DG7KHHoQulzYihgcu8WtShYM76395GQ4mt/jQY/
	 6TdvL+Qi2ZYN9ADAX/DGhiji0nX0Ku+m49uhxoxEgfG6YplWAopYbwtO8CzTlRe0DuMXr
	 rflO0ir9DPVfsM+GnzuLFGQ3kPv1t88ssb8yUUpfzkd36+WCamT+4GqAZaaJqdMv10A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NOxT9t3y;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6958B60A6F77
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6958B60A6F77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NOxT9t3y
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1352951a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794379655; x=1794984455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s901sm95u73URLyqX1tOE80ZT+B5IbZa2FXF/1v/wOc=;
        b=NOxT9t3yuAD0qUgj7W/iiAGInCeeNlp7Zg8iZy5iOPtKHIRWghpas2IseiK7VMoOO8
         s2bmDOs7YyyNCOjKHhw9P3/cRyC0SKO6pgV4GtwdeIJy4P3MxyvcCFVgDZtiEpnm/uQL
         ju6AfVGmsaXiCaWmTq/mwvPoThf6oL4jJf1v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379655; x=1794984455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s901sm95u73URLyqX1tOE80ZT+B5IbZa2FXF/1v/wOc=;
        b=QGI0DqnFoyHGUhjsD12DTaOf5WaOL+EMJeP97shIoWD8O8loFAAX6T+t7cwLv76EEE
         gIBpDaVjTQrSx3DkJb4pBmDAQtxnbMF6sWnTyJD5bIuNRY8ghEyfLRbP4gAc9voALM+K
         /Qap2uxv/wrfIBqbR5443hKfEAmPtzW5DwelCVZL8bnT1OUwUtX2Ar6aG/B/W2icrRsR
         O/eqjkWBn7XCYSZs5j97iJbOFjFG74U+TicW/UfLv1Xp9pRP3HCzRn6pGNzyymtqFA6C
         kGeiDvgjkrpXheO44Sezeoz8LWcGDQ3Beu695S0s7DLjLF0ARvbJg51WqN2lbfdfP1Hu
         DBIw==
X-Forwarded-Encrypted: i=1; AL+hErH9zNS6ce954VAm6UyUWLl2cyNGGezQJl7hONn6WKkFbdCIVemm7ZoX9o1MReT08ZJjfCYLFo8FozJLbFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yUrzkwUpS2FZoovVrr3haDLRTGhVezs61Bn4NgY+STLEbGQjY
	d+QrVz+FQBWcOZQTSKtu4ejEANanZ8FAjHzkB2f4PymjV52ltDdbbquTRDTUySv+Yg==
X-Gm-Gg: AYBFou2xRIHOvK2GStMhu5kiK7ICQNMEc3IkdTmBqQ63Wo9qFinZmvWGWsUoJYQfc+y
	leR0Cyui6gWg2xB9HPjlcEf8NAgF3AxLmK7If+qUbjloMabQiG8ZA0b9i2s7ZsZcV8mt8IZd8a4
	DN+oSVMMqxTrxZRwDBForyNLz7GbhmDB6sqY59mQJTAKbf2aZQVzvfpj0oi2M410U4dG1b2Wu0Q
	UiqYNWQBfxpDdr347E2K55v2l5t+PehW1GEUCrXb4imbOHkyLkZnsvyWy4zZ/r0cyn3RaSGjr8X
	NDZ29Q8+kV46wg/5Eaok3jXSTLbek59cBPN3Vy9+t73WLhiineELyvu5vYqSJZNrrYGAAwPIDtp
	SPiEk39nbKdjZySOaJvnQkYR8PODe8BhDy0dqROpt2pPJ7vEDKNtwzi/3jc6JM1vbFGevKoDcuS
	LWXn3YfgN9wjJjjQgaV+bYb2C1ssJhFGK0bXYQdgQ1Ea9pyTjHRbcrAAykvZ6OLa1Li1HvBDX59
	Itkqb6v9WnLZHpx7jxLvpgMadaoFBw/2csqgPfI0MiqqnX3Fl3FS05R2Rsb+w8AreZ9cDEVbR/L
	PQVsjvCACrEA1FNJZxVupMOmjK9TlQvhBrIJ/Nwhkiy8clmYx7XlUOyIw7m943jdchs9GJOoBl3
	31nyAhSLAqYFzdhYOXA==
X-Received: by 2002:a17:90b:4a90:b0:3b0:aaed:48d0 with SMTP id 98e67ed59e1d1-3b182f5a300mr1674067a91.37.1794379654696;
        Tue, 10 Nov 2026 22:47:34 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm3268666a91.14.2026.11.10.22.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:47:34 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yosry Ahmed <yosry@kernel.org>
Subject: [PATCH v3 07/11] zswap: do not free the entry if its pool is NULL
Date: Wed, 11 Nov 2026 15:46:30 +0900
Message-ID: <20261111064707.2568433-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111064707.2568433-1-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
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

zswap_entry_free() warns if the entry has no pool (which should never
happen), skips zs_free() and then frees the entry.  A subsequent patch
embeds zsmalloc handle into zswap_entry, so zsmalloc object will point
to the entry, and we cannot free the entry while the object is still
there.

Bail out early and leak the entry, its cgroup charge and stats instead.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Acked-by: Yosry Ahmed <yosry@kernel.org>
Acked-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zswap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 1160bd34e289..dc0400d7e1a3 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -787,10 +787,11 @@ static void zswap_entry_free(struct zswap_entry *entry)
 	struct zswap_pool *pool = zswap_entry_pool(entry);
 
 	zswap_lru_del(entry);
-	if (!WARN_ON_ONCE(!pool)) {
-		zs_free(pool->zs_pool, entry->handle);
-		zswap_pool_put(pool);
-	}
+	if (WARN_ON_ONCE(!pool))
+		return;
+
+	zs_free(pool->zs_pool, entry->handle);
+	zswap_pool_put(pool);
 	if (entry->objcg) {
 		obj_cgroup_uncharge_zswap(entry->objcg, entry->length);
 		obj_cgroup_put(entry->objcg);
-- 
2.56.0.542.g3ef89b7020-goog

