Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C55E49AA50
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947801; cv=none; b=gQcif+x6eRE/J1xQhVPdfe2HF+WPZEEPv9KCmAbeqdEHXAChrgC7Ij4unSZLM2/2VC+ELJteheu+nZZwJ4RNAjjVyOXWn0OebNgVTr6Zs4/8TINsOnI2kE0ycfSdZVjhHCfmgktceUZM7iV1MAMmU4XFCBNIch4Lr2wzEf+EDgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947801; c=relaxed/simple;
	bh=GQJuucSMvbnox7DkDUXejBxZdAlWUG/zRLLQxJhap2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQt9holo5CXY84KSZelg9yFw1NMZVki12A/wbdRcfRsleVsZxRxHmKaO6y696SwklCHf+JRiT2C1Q4zbJRQcxYmWbN5An90t1ICzX9eLZKj7UHrj7EJHbF1XssUu7ngZyVtoPTLlSRLy8bX9TR+H7Ff/qgbZaThbCH6NBRaK5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYiaH8n6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYiaH8n6"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb750so804501a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788947799; x=1789552599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBlj7x8sD658i+Z+IGaqtSDqi4AT+nBLY3OAnFyQUPc=;
        b=lYiaH8n6HBCooRPOySFHcG4L3+UI6qVids8bsO5pxUKMoAeN4dPd6Jwkb8fEjzBI3/
         JiuUEJfcVm3bjvb/pkn6BTrEmlZgwT3XmtrsMn2cmF5VJXFo4mRn48Q713503cCWAvnt
         XuZgV8ojPirsjmbQsrjbtCZtIWQn+x+EAx1/PesLg7J6GR1F01Mo3QDY/NAe68KLmTQS
         ivpoREWui0Nz7dZUr6EAdsy7dI2OOhEKHNMGPFqIfDq4x4CEyGhNh/BPrklBc94OXOCv
         0A4BQHzyHvca1z2qteHCW84X4/Fyi0MP6dT2Cb+BNuciRgbV6gFUvDU9102JZwUWjUdp
         UUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947799; x=1789552599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBlj7x8sD658i+Z+IGaqtSDqi4AT+nBLY3OAnFyQUPc=;
        b=WscVYwN1JvmUfb1qeuO+CAvRewVzArXNNgC+OVWujIn1njUcZ1s8C7KqVP03Txr46q
         nmfCIkF17lHvBf7VWjy3Bkbov4nl89qcZaFlClT1a9uFewnZ+mfjo5uV0IzsVUUeDoqX
         VInUS1wmCwCHJj0ff7Ji6z7vt5zlgoPOXDNObKeSi2qAVy25hmbhq0I+U21XN+BW4A8Y
         XZqiLuQnDu6w7vPCN1uJ29gHGu+ccsUo6S5E2+5gjiRayY6wFvJBZa7fLaFa6Uaiwztx
         FHphPiHefyyHH+XA5K8uAMo/351d1v3vlDDXWCl9VwauwXc3DqTHrHKF8hHBx9/aaYSv
         XHeg==
X-Forwarded-Encrypted: i=1; AKwUvBzy1ejpmrt+YjVt6S+1pCR/Of+TG1WldQtoORUBtFitg71u2xO2Si1aQPzoTG00yr0GlE1yPfajCNvJK3w=@vger.kernel.org
X-Gm-Message-State: AFuF++lOVv1TCxC9dE71ee+rfY9AYoWpjgthfarYKKu5qh2+aaZYvrOb
	ZsWMdIL9EQo0It0OQTi7AJbVJvMIFcGTSjzXA9GgfCfYsdosqOmBnyqq
X-Gm-Gg: AYBFou0lfItbhHRXpw/nJKP5qxYQ/bdK/ho4bduHUIM/nthlZ4dtwb+Kz2M+F6D/qiF
	xBZeTu4ddgaihJDtrwIeWAoXs+iP0TeKgpG5MSjvJ3wBJ8ScJxBump+7BTkIw4KFt6K1w8P7f7i
	NISLsr4eOrPNF52pHAbe80tdayQ9xX8zKngzwoaEn4wVhv6zVThgnYFVSpa9L3QKPYch8ja5lfQ
	dJD4V/xc8Dm5w/Xw0KlAd/eRZss6IJAOMqZJPssY05Y4Wj75p1EjVhKbkxT304uPIOjwAwutmF7
	HrxIEXPzCR9QdEgst8lIvyLI645BOuTI/VJpxaSraPF582hi4AvjxKlF+PW+0QZHu0a0t4awQI4
	Vppr/FWN9kFq5xcAWpHV26l7iRc/F5BPSzteFhsWMGk2YrwJWeysG23+veqyu+CrcMX0dsWfT8O
	t2qgxjWFX9/C0cPuUR+7QOG3LGTgMYBKtBASbV2mxW+XffYj3DX9E7xby3XrZqAG89JpFzFw==
X-Received: by 2002:a17:90a:d00b:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39bac471324mr7523375a91.25.1788947798681;
        Wed, 09 Sep 2026 02:56:38 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd291sm31419062a91.6.2026.09.09.02.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:56:38 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: john <love_goo@163.com>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	akpm@linux-foundation.org,
	liuye@kylinos.cn,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	mgorman@techsingularity.net,
	yang@os.amperecomputing.com,
	zhangqiuhao@huawei.com,
	wangkefeng.wang@huawei.com,
	mawupeng1@huwei.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wupeng Ma <mawupeng1@huawei.com>
Subject: Re: [PATCH resend 2/2] mm: vmscan: stop scanning ineligible folios after max_nr_skipped
Date: Wed,  9 Sep 2026 17:56:28 +0800
Message-ID: <20260909095629.2523075-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901084706.3784449-3-love_goo@163.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 16:47:06 +0800 john <love_goo@163.com> wrote:

> From: Wupeng Ma <mawupeng1@huawei.com>
> 
> When reclaiming for a lower zone, isolate_lru_folios() accounts folios
> from higher zones as skipped and, once max_nr_skipped hits
> SWAP_CLUSTER_MAX_SKIPPED, force-isolates the remaining ineligible folios
> to keep the loop from spinning on the skipped ones.  Those folios are
> reclaimed even though they can never satisfy the current allocation, so
> nr_reclaimed is inflated into a false progress that keeps resetting
> no_progress_loops in should_reclaim_retry() and delays the OOM.
> 
> Stop scanning once max_nr_skipped is reached instead of force-isolating
> the ineligible folios.  The skipped folios are already accounted in
> total_scan, so shrink_lruvec() can charge the overshoot against its scan
> budget (see the previous commit) and will not rescan them.
> 
> Fixes: 1c7b17cf0594 ("mm/vmscan: fix hard LOCKUP in function isolate_lru_folios")
> Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
> ---
>  mm/vmscan.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 823af9e86efd3..375f7cd5aa441 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1701,12 +1701,20 @@ static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
>  		nr_pages = folio_nr_pages(folio);
>  		total_scan += nr_pages;
>  
> -		/* Using max_nr_skipped to prevent hard LOCKUP*/
> -		if (max_nr_skipped < SWAP_CLUSTER_MAX_SKIPPED &&
> -		    (folio_zonenum(folio) > sc->reclaim_idx)) {
> +		/*
> +		 * Using max_nr_skipped to prevent hard LOCKUP.
> +		 * Once the cap is hit, stop rather than force-isolating:
> +		 * reclaiming ineligible folios only inflates nr_reclaimed
> +		 * into a false progress.
> +		 */
> +		if (folio_zonenum(folio) > sc->reclaim_idx) {
>  			nr_skipped[folio_zonenum(folio)] += nr_pages;
> -			move_to = &folios_skipped;
>  			max_nr_skipped++;
> +			if (max_nr_skipped >= SWAP_CLUSTER_MAX_SKIPPED) {
> +				list_move(&folio->lru, &folios_skipped);
> +				break;

One question about stopping the scan once max_nr_skipped reaches 
SWAP_CLUSTER_MAX_SKIPPED.

Previously, reaching this limit caused the remaining ineligible folios 
to be force-isolated so that the scanner would not keep looping on skipped 
folios. With this change, we break out of isolate_lru_folios() instead.

Could this cause us to stop before reaching eligible folios later in the LRU? 
Is SWAP_CLUSTER_MAX_SKIPPED intended to be sufficient to determine that 
continuing the scan cannot make useful reclaim progress?

Thanks,
KunWu

> +			}
> +			move_to = &folios_skipped;
>  			goto move;
>  		}
>  
> -- 
> 2.53.0
> 
> 

Sent using hkml (https://github.com/sjp38/hackermail)
