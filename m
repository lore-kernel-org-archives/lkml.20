Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF17947278C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670977; cv=none; b=ohJGkYm9rNv49zBmV3OMEbsNZm2jIkuycSWUK5LyAS4YQ8vIfdH1S2NkM1sN0S5ZZyGcXBYlVjgf2a6g71Xc85fDkkTrcYdrgYmuyffOHTg42GiuxMTYKyzgKi2XGlq6JTfycZug2pNCo+cnKSh9S4a4zAYG+/JfE+BJYlC9kEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670977; c=relaxed/simple;
	bh=VRAOKD8IQiv5Doj3zfyFa4TmmxoE+pNf7XnBp7cBamM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oScue/XPsW5RvRz+Se/tLv5C2iDlYCT3I5JTcMtnwHp21+sRsvESFQUZ4iuD/6uTGywHOZkIQ8v8HIt5bmvXawy8llMPhnkqntRbbfbptlTv9nvo8QMtZ8FDBr2gwdCikT8VsICKwa3p3rflB5VEx5rxB6KDqEh2yKE6VbWvmhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gCKSrm8k; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gCKSrm8k"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1964537a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790670967; x=1791275767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqIX/K8+VwYyF/xC9PmKKDDvSH4cgd5EwORlAHhZrEs=;
        b=gCKSrm8kWVAQuscs8wlwU0pm78XNEwx96TPwSd1D7QSM41nZ9IgUycfbIMNk8oXEz/
         +9Gzcb7XDuQI3KK0Ufpap2f8MbdpJBu5cdjWK//V/LItFlBO60fv/TRXUnisbMSW1DrK
         kScCkr+CyDoRtfy1KlPyuY0IjKIQuj/pHVjYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670967; x=1791275767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqIX/K8+VwYyF/xC9PmKKDDvSH4cgd5EwORlAHhZrEs=;
        b=PeZY2/qoVuPIJRHGEsn/TOvrtB5et/zFyYUIcAezrmf0qYvfy4aFhYw67CTXYj+jwR
         glbdK4ncaJq9+urU6Nkgz06aO7uxo7hPkTZcbJs/KGPqEETMUamjd17URi+U5GURPJ/C
         LAlFam+7kP19c4aLfTs6YamOCFhS2/XZk4NU8P/29lGPhvSTeKpy/P7tybrfq7yX9YQv
         7Hy030ZgzAntS0xz2vSS6j2Y4dHet3uUyU0HnIz0ak877A8AgDugCovCaDir2DpqPt74
         fUpqlTc9l+diupFXENX5OLF1koLP2w2HfgCRsdD3e1vDqVInfzGkrYtPwDAPFvcrZrwE
         hqmg==
X-Forwarded-Encrypted: i=1; AKwUvBzoKX8AhOx4n2es1Ovsk1IOYEM9JTjNDrvKMkCrMGEhAmVtWIFDx0U1OdwmF+8Ck14sWgW9u4lQ2wEG0L0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqCgWyAP1yll+aIhpqDdoyEiUaZw6cRYeDpe8F8n7ow+eBfPVK
	bvYDHF85NMSoXMtn54I9+55a08rQHViIvJmIwe3PPsPUbLHLtlkrii8tldbVTz909w==
X-Gm-Gg: AYBFou3wIHciYadG/y/6LBYxwwc85EPx/HTNqSKx6EHgJVYaaCKk4MZ70RWO1GerEfm
	A6Mjoc+ecWMQaoQjCJ+k27jrcs2wfXJrLco0cxjnJ451rdm5G3bCFjunxwT8l4S42nbweiiBRT3
	3Aifwmo7c5UGWYIw6shRtbUemr/cXBE67wmISvfONo3rgLqrVF3/M+SI3/b0bQQXCKhBdTpchax
	7e7oVd4tXSYNk3+1IyBhKk36x3hJVRIbp1pf1+uJB1Qcb45jH096rAa1PRYiFDQNZT9SY6qu8Ag
	EhKO8ebEBiyyzO9YM+nsxsdF7KePmF9bDnrV4X/wNID4P5VyCpZZMt+cj2IzilwtPbbwZn2YLfC
	ihYay2r4Cuuowk9VFqXuvkR2AT8wO3xlwaEszMh0j58OEQ1cUrslvhyCzhS9Yj4Qu2E2GGMF2h/
	Q9XGW6ssSImcijBs4mYlu4zd7xO1cheyip3wefvaTQNU8vVKA6OVvhX8qstQ017P2lBIGH1RpIf
	FWC3wy31ND9cl+NouvsppWkQKE79RTEqrhDrmuwCHTXIlni2gk=
X-Received: by 2002:a17:90b:55cb:b0:3a0:f4ee:d2a6 with SMTP id 98e67ed59e1d1-3a0f4eee43emr6338930a91.19.1790670967013;
        Tue, 29 Sep 2026 01:36:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:31b3:f8c3:893a:d0bb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2202607a91.3.2026.09.29.01.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:36:06 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:36:03 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Pooyan Azad <pooyan.azadparvar@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] zram: fix short reads from block_state
Message-ID: <art30sD5xpFZx9QG@google.com>
References: <20260928164826.24858-1-pooyan.azadparvar@gmail.com>
 <20260929071846.24829-1-pooyan.azadparvar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929071846.24829-1-pooyan.azadparvar@gmail.com>

On (26/09/29 09:18), Pooyan Azad wrote:
> read_block_state() formats each entry directly into the buffer supplied
> by read(). If the remaining buffer is too small for one complete record,
> snprintf() returns the full record length and the function stops without
> copying data or advancing the file position. A read smaller than a record
> therefore returns zero at a non-EOF position and cannot make progress.
> 
> Convert block_state to seq_file so formatted records are buffered
> independently of the userspace read size. Keep dev_lock held across each
> seq_file iteration and continue to protect individual entries with their
> slot locks.
> 
> Fixes: c0265342bff4 ("zram: introduce zram memory tracking")
> Closes: https://lore.kernel.org/r/CANC3H+LdtoydSp+o2ecErAw7k6R2+gRf9LyxcaoHv_mGhJmyQQ@mail.gmail.com/
> Signed-off-by: Pooyan Azad <pooyan.azadparvar@gmail.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
