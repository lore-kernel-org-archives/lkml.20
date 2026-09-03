Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E304732E692
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400828; cv=none; b=CZgzDgwtR4C+HaLGzRPcoXGgv93KW9zp3CszRIM7KQJOTq2gMgR8N5cc3URzqcNVh40oYQc+LHwqwvP2v2Gnw6GBp6K83oeO4c+PKxMrifinjAsh2yyoKMxnPCcL3lq/fd1RP7vY3Zy0xDTgLKI9AJE2jlCGyOo15+193zPJero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400828; c=relaxed/simple;
	bh=/CP95G0PR3H0g0ykJcTxUmn6njWoypYNANPsfaXRf3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvh3c/JsWMxZrNjyR4fbZgiWCs+zy4hFHRQArxaKFB2fVwmP+L0R0kQ6S6v7ccH0/VLExzqJnM67TGG0fZy3sI1nZ8b2mJ3quDMyPuh79yqOdfz7wD4NGgGWLfBauYgKnoZQBruHPUHsAl+v/d/VpzHGRq3OX6xOWay3OiLEzPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/oQ/HjD; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/oQ/HjD"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso1453078a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788400825; x=1789005625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozJ9M4cDK/IvV3gntKv2Fb/293HION6/QD0PdVWp1Zs=;
        b=A/oQ/HjDHmdwrXd1LhQHpLxrNKe3Y6XlXfir9ZmscE0k0vNUAVqQDgFabBLe6LkiEh
         9PqUarT2JLUDIf4KWwEuNBxaeE9QOlAKTz6COsZHpH96Py7/xP9IXzGvK/bkJg3H0XKt
         Vv/kHLveErXW+efGjesReERjEsKXhKQCCG4/hlanbLZZSplNkmNLeLjSrBkn4zWgYger
         nok4vX68zeiKmJ2SF4MFgfSkOEzKgiLMQUhbS8jhhXjxuGdiCyhkTH0RHA9IvVj3AVu2
         jO6PbwF6wO15AhifdiTMtJk45BtK8k3S1YJQ7HqIQsywVibp/tfuT9VoTx4944ieIirN
         11DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788400825; x=1789005625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozJ9M4cDK/IvV3gntKv2Fb/293HION6/QD0PdVWp1Zs=;
        b=YgCULfKiwQDgcKYqJrTnQtQxQpWPqKny8HJ/EWaa2UrTypGFfBn+8L4K/G/c37ZjPF
         e9YYVv/4BnPxBcMw27GUbNRputv6bPZpgwHOO6xLITE73Jn7jlNnRnLV9iH7kf5G7bjU
         lQH4vhe4tqB554H/DixVFgbFrioCh0tlFBRsm7Usfv3kuZpEwIzFGNaacTC8ICzFOW+n
         YqFL7Otp37mFzFZRPO5Lgh/nCtQogUYVhTLNkHDy02B6xXVeZo/65hSXrhWr6lbbHgpl
         zETNye4b9tvjOughgBCLoajIvKdr/AL5bCE9pIOtGp3O5RJ+uI0KueZw7kOroF3ebfbn
         IYzg==
X-Forwarded-Encrypted: i=1; AKwUvBy6lyTxrRf+HhsMbnip6Z8OvP3/mIbMny1HSiMmd4JbWJLCUC/lg1VIrKN4iDySw5Oq1UYLglqthwlhmSA=@vger.kernel.org
X-Gm-Message-State: AFuF++kKJjHW2I+0fS1nnA6ytyaRIYI5Tig/BAZboqVnSo6rLmdMAx1A
	3Uwj58HPVS4UD4u1R3u1ipiDNQ+MJ1JunPqkaVZgbJ0XKLjWw3qjNcCN
X-Gm-Gg: AYBFou34QWh80Kgc8WLATbNI/KFZRDo86OZ6D+twR7JSNQPBnUqEvYUnAouxnuxHqrS
	jfW0umZiPr81/DSnyTwr/KuzRAkKEQcNHkv7qUDiCXgItveDwxQZzDQU3bblfaHE/DY0/NKkV8a
	GqvqGNfQfpveEM0k1hRFQwGze8Om4bSvDuA2gWquV0UzGgOosbFfR+Jnhgte4DRhAA+o3IKwl8B
	KaFbjS5SAJzDb+6ppzgZu1qCO/ToQtwzHsp02cRcLQfeaGtl3GjvRjqBTNHGnNoIV1TL7+TJbq3
	XSllu9cWNcFk8d17mw+3sj/5chE+YuUvN17Wzy+3r478Lrir5yB80/caci9q4m5m0Pec6DL7JBx
	mAKxoflCzon4qwUxKjeDkTzVGm51jZgqPr/lP4qs++KxulT9QRVA9nb1XhNG8XPucmdwRQBgEOk
	+OKM3zjWL7lWpABM5jKWjjsjqwSrHYt7echoEd/ltaRgRywWxUL55E75xyZFg9L8luARV46w==
X-Received: by 2002:a17:90b:5107:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39aee066eaamr13504509a91.15.1788400824555;
        Wed, 02 Sep 2026 19:00:24 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm2179825a91.14.2026.09.02.19.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:00:24 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 01/12] mm/damon/core: use damon_nr_samples_per_aggr() for max merge threshold
Date: Thu,  3 Sep 2026 10:00:08 +0800
Message-ID: <20260903020012.4160595-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-2-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:34 -0700 SJ Park <sj@kernel.org> wrote:

> kdamond_merge_regions() open-codes max region merge threshold
> calculation.  What it does is fundamentally the same as
> damon_nr_samples_per_aggr() but missing a few corner cases.  The
> unhandled corner cases should be rare and make only a negligible level
> of monitoring results degradation.  But having the inconsistency could
> increase future maintenance burden.  Use the dedicated function.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index f748acd6bbd5b..846da6df5b552 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -3509,8 +3509,7 @@ static void kdamond_merge_regions(struct damon_ctx *c, unsigned int threshold,
>  	unsigned int max_thres;
>  	bool count_age = true;
>  
> -	max_thres = c->attrs.aggr_interval /
> -		(c->attrs.sample_interval ?  c->attrs.sample_interval : 1);
> +	max_thres = damon_nr_samples_per_aggr(&c->attrs);

The helper replacement makes sense to me, and it also keeps 
the corner-case handling centralized.


Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu


>  	while (true) {
>  		nr_regions = 0;
>  		damon_for_each_target(t, c) {
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
