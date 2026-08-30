Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0246031E834
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075864; cv=none; b=lI8kG7CNbTJd9sHOlm0GjgQsozBMlVYrd+pB7kAkHPMZcTOIqxIKkoi+pTnNQXA+5QF3c0D7DzZ3/y1tdCwlsVnYW/UZ7Qrz5EkYGSVYEffOJJmUg+SEcOpeAff8HDYxxtjaxDKxgC7sa8rMsZ7MgiLhxBvgOBKRyNyqic6hE24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075864; c=relaxed/simple;
	bh=mMjFsIQfSYpF3u2RxLrVZ/VoGV0TmCIoxhWin2USHsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sqb46nPJZliKkjFGQ9IXbpEJ1Oj/BunVU/iO43MvlACSrTCLGjm28zplDn6Y8n0azScq0/zJeCTGXU4MJLgFIcpBfmCXJIliNm4B2Gz57h+g4Mi3IFvGBHGY4P9//WAsnqkmJ4Qs7mrLRt9ddcXtzN3GnCrki1YfZpykusFJzz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sT+iS8/j; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sT+iS8/j"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso2597089a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075862; x=1788680662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1463Nua5rsy1ZKhdUuK5314KEKn538+dBkzqnDChMps=;
        b=sT+iS8/j7cGxZkHKOWmAeOAaIKxY62xvjBOenAD9++rqX01hvgAggM6nbNKvA3Ni9L
         ijmmm0h3G4jt7xMsWdNjSYn0BFoVDNQAIz6WipVZEhtZpKaqW1TaWHsfZ4OnJRKJnDDo
         ZArfvInzUGu6weV0msHrWYdWIOv32HGuxyOQak3UHhkCiiAegNryLGktqqlRC+Hm7FW5
         OQt3c1MXff5VvXZszIZpdprFq6kj2CQe6UwNZnuuy8Rc5jaqiwR/4uAMuHJbWRWR5HfW
         53+sSeVVXXRSugS4+yddrCLl38Oj2K8G9AlcxJBu37WHi1YRr08ma8E++/hXfDDvk8hq
         JyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075862; x=1788680662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1463Nua5rsy1ZKhdUuK5314KEKn538+dBkzqnDChMps=;
        b=QPMxq7dYuYWM7FCX6ysi4yban8hFehlJvs6+iwgWiYQAS0wz3llZ2fFLVLwpbVDRh9
         ffZwoKNyN/hyehcqjc/TksDyfctpFa99Bf+zeQ4Av1kzyULrVskCff85QOkYS01fu7RV
         Gsdx2qpApoA1T+7G/U4lLfrvSYttxXmH2SwyGOOaIPVPIm1yfsxpc1j2nTAmbklXmalW
         rQxcSbH5pXfZf4sjiGkrAPGnF7ovA+gDYZD7sMaTByWsV2SMOOWV09fKIRqOn5yJqyRE
         V4OY3lxn6lkbq07l5kPVnGtQHyzzjvBUhg/gAOHS3rSd6ex573BUSafrR9w9s02+rL7a
         t7iA==
X-Forwarded-Encrypted: i=1; AKwUvByiVS8/lC9LucRUJp6jf/pK8uyp8RnfmxIPKXYHeZZaEOplcmDRd6pfU974XdTHEvvPT+PiEGoitbt0HOg=@vger.kernel.org
X-Gm-Message-State: AFuF++nP0hA9+A2vWszAhzLvBzC06au7ZmyeatfRc5loA6Jm7T+tEwlC
	bpE2TtA4msKnmNy0a2LRHkRqIdQR5P8YdrgubRuX/zB5oMLDRPsmbJom
X-Gm-Gg: AYBFou0vDPyjQCaGVnuQ3TuM6ZVVo6lJid/+cMy03xKSb8yAtNvJV3j9EivRwJ5gXRS
	+wyjQgkxurXGLMQYG4T/ZbZkvNTB9trCMpDA7ZLGEf/Q/uYVn3Lu4IX4CEevhQB4hg4pvEVn69S
	yFV104m0Bhlc73Uw9B3WIgBNtjOfYwLfUo1PYI6sAwaUoHCGnAmNFYHoSNBRJNOHM/WPlpez4Nn
	D+s0adfAd/KRUqBE5fUTChMN29qqZUM6YnQR414Sbf6enQCk0FjsqPBJ+mjjdUx/lY6h1D66kW6
	wgPTesiT5wifd890tqa7DkPwM7/l+Wid5Kflpd4M641JnA6X+tC08ApGYjksplHA65YR5yyq2bK
	/eqPWy6IBNPKb4NY2olbFa578Ji1JjyasE1arPo0uPwZzWm88JMCwTzsusmlvK+UCsFPbgsWrf2
	BVJ+h3JrOUBTwmm6rk6z1/s+gjjicmGpGLa6e2hFT33wtJJvaa3qR9PaUCNyDF9iT6d/fBd53wY
	Jq37UdAvDcAgldtTeSeY2GpB6Q5o2lCd07ZMLs=
X-Received: by 2002:a17:90b:2243:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-3989bd54c26mr10681172a91.20.1788075862358;
        Sun, 30 Aug 2026 00:44:22 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398bd356f80sm4527719a91.9.2026.08.30.00.44.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 00:44:22 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [PATCH v2 5/7] mm/mglru: make LRU folio prefetch helper an inline function
Date: Sun, 30 Aug 2026 15:43:56 +0800
Message-ID: <20260830074405.79857-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827234704.63163-6-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org> <20260827234704.63163-6-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 07:47:02 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:

> `prefetchw_prev_lru_folio()` is currently implemented as a macro with a
> potentially unused argument. This makes the helper harder to read and can
> also trigger checkpatch warnings about unused macro arguments.
>
> Make it a `static inline` function and remove the unnecessary `_field`
> argument. The helper always prefetches the previous folio's `flags`, so
> there is no need to make the field configurable.
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmscan.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 2b33d3f44682..81f95a968447 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -182,17 +182,21 @@ struct scan_control {
>  };
>
>  #ifdef ARCH_HAS_PREFETCHW
> -#define prefetchw_prev_lru_folio(_folio, _base, _field)			\
> -	do {								\
> -		if ((_folio)->lru.prev != _base) {			\
> -			struct folio *prev;				\
> -									\
> -			prev = lru_to_folio(&(_folio->lru));		\
> -			prefetchw(&prev->_field);			\
> -		}							\
> -	} while (0)
> +static inline void prefetchw_prev_lru_folio(struct folio *folio,
> +		struct list_head *base)
> +{
> +	if (folio->lru.prev != base) {
> +		struct folio *prev;
> +
> +		prev = lru_to_folio(&folio->lru);
> +		prefetchw(&prev->flags);
> +	}
> +}
>  #else
> -#define prefetchw_prev_lru_folio(_folio, _base, _field) do { } while (0)
> +static inline void prefetchw_prev_lru_folio(struct folio *folio,
> +		struct list_head *base)
> +{
> +}
>  #endif
>
>  /*
> @@ -1695,7 +1699,7 @@ static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
>  		struct folio *folio;
>
>  		folio = lru_to_folio(src);
> -		prefetchw_prev_lru_folio(folio, src, flags);
> +		prefetchw_prev_lru_folio(folio, src);
>
>  		nr_pages = folio_nr_pages(folio);
>  		total_scan += nr_pages;
> --
> 2.34.1

This preserves the prefetch behavior while making the helper
interface clearer. Looks good to me.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
