Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB462FFF8D
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791692890; cv=none; b=LhvIE1qWqpYjZnGotABfpZjGCvHwsVA1eraaslXEmIIkyyV7T0ghrIQE1S9Qo9xJmDts6mlnRlqARDCmDNQZfYPk1k4oDnfW8RMn4u9kvgLzT3bQQ0++4TKF2w5Ty+EeNRQ8MrgNhD9CqX/sjn7yypqtPC4G6L4DoWdkhB4Af0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791692890; c=relaxed/simple;
	bh=NUKj3EZm97qkLDRMMjG9360voWGZgERsw4v1velbTR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOt84T5qHS2w2Ibu5fRIsNfK8jGOoo2sz5470IOYdM1zTTobbcFxAjxdvdPNFeugzggYcR2yZLYjZODsDSRKd9aqDoOBBuBqhUIv7Fg+Gh4BI23LEFnxcOvfr3gdrXDqGlchGubfpIwvqiyB2OIKBAzOC/xWKF6Un+6v5Blb3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A+js9uAG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A+js9uAG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db710396ffso17369395ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791692889; x=1792297689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VgUBQDdodR1jUKBZJnt7Hs3MkCVZjH756ozkqdENr9k=;
        b=A+js9uAGkzq/KqoVVUu4Rs9vLb2eRzVIEzc4yTu4oLveDL6jxCuHCgBM5xCqS+b4V4
         sGx3VhsrOPlv5cymWkHxRpE8t9fK8B3r721RmhWUNx+CSXRU1fgn9HcAjFpo/nuio9Yb
         LG4HenxlRPUojJB26n3ku32RLIAvCJv6rhWXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791692889; x=1792297689;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgUBQDdodR1jUKBZJnt7Hs3MkCVZjH756ozkqdENr9k=;
        b=v8eQYkDQmXQr33MdgZBfRqi4shNuG15dKFAGNIJj2mo2WsIUkU3IA877Y6uCtUI1Dl
         GRiv3iiG3TzNXgUDlKjA12RDv6/IgsIivbxCKYCY/GIqxOSJPt37Ee00V/B8BgLxtnj4
         KDuXzsEUV7UULnafN45JIqD6ZNSyQacbiA5pLO2sl7h+CzdA4YzYiY26mvt7jIP8PxCN
         F3WY+sk8uP84eJBNnz2/cp8cS3XQj/nQkmaRCbAb9t/2PZ454dXqn+TW2VaLcr+aeFH5
         dq4Kj1iuvUov6g0sdy3ZMBR1PFngjY5ykiae3j2Rft5jWjyFGGLPrRh5zP5tjhCGOy/R
         r/Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxkVcmJ2FTVAlJEo9EMw0RWnJ50JUBD+Ftd165+y7r4A4sbnxnPLFTh6gwcskvcY7SA2q23c/Z4Pu3Uz80=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFlNwj/Smc68C+2ClY1WgNDgf9qE18B6SyKiGD85YfJQ4D3OJS
	Exa1zCnsY5YCVloXHBDuIlycJzkbBNVyJVzTQS4ptnUoS71mZEgz0w8D/JwrSQCKXA==
X-Gm-Gg: AYBFou1aGGk5oHcUGlnYewuDN6PDeriotAOiuMtzDt+vnKIPQRdEFff9cr2Bn33yOkk
	04eosouT44+gNVuIFDghgAu8QBj3PC9RgdYGTiwKPruvVQ9VcG1lQ8hO11lSdl4tzHFZ73DrSDA
	fFSJWr450h2epL9Jn5fZOltFM8dXzJXYBoeEhHF+02sT/kI6Ax6BsNmTMq0P4aEymCnYy5ueCty
	Q8rtiySZJDHXiNRAyq2C8OBoTlXd6mBdiB3oqhz1Etncr0zchhbJPG0lpHhbkBY9tDutKTzn/sX
	xzjmXmduItRZ9Y0TEm81dODHKVVrKfXSQRflVNr6TVR3/X5UKvZUBkKSMkuHB78Zg5FB3Xs6xvY
	eACnIdVj5DccnHsgMq+dk6Zx8j+OntiQpn4KC4tTRN9fAGaMSA7cTtQhEUXqNIK41ZE27fLcUwR
	vC8kREwQBFPKbisIW2OCT0JfYmMvxBDsRGqjqTIfWABkm5Fk9Zzkd36r0+cSBoLem/PwiVd1k2i
	186QmFqSiz551jKiAgiIJkkfK2158srML7toGc=
X-Received: by 2002:a17:90b:3b84:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ab3a369ebamr3764665a91.3.1791692888901;
        Sat, 10 Oct 2026 21:28:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:75d8:6a8c:e079:f021])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37163e21sm11921110a91.14.2026.10.10.21.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:28:07 -0700 (PDT)
Date: Sun, 11 Oct 2026 13:28:01 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v2 11/11] zram: use rw_semaphore for decompression streams
Message-ID: <assQJStvoDK0nepk@google.com>
References: <20261009071157.3730698-1-senozhatsky@chromium.org>
 <20261009071157.3730698-12-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009071157.3730698-12-senozhatsky@chromium.org>

On (26/10/09 16:11), Sergey Senozhatsky wrote:
> Currently, per-CPU decompression streams use a mutex, so there is
> a chance for priority inversion - a low priority Reader can get
> preempted by a higher priority Reader, which simply will get
> blocked on the stream mutex.
> 
> Switch zcomp_dstrm lock from mutex to rw_semaphore to permit parallel
> usage.  However, things are not completely straightforward.  Many
> backends have stateless decompression and don't modify decompression
> context, so those can be used concurrently.  But then there are backends
> that do modify decompression context.  We also can have compressed
> object span across physical pages, which zcomp linearises using stream's
> ->local_copy buffer before decompression.  That buffer, clearly, cannot
> be used concurrently.
> 
> When the backend has no per-stream decompression context (stateless)
> and zsmalloc object fits in a single page (ZCOMP_DECOMP_INPLACE), take
> the stream lock in shared mode (read).  Otherwise, when ->local_copy
> is needed (ZCOMP_DECOMP_BOUNCE) or the backend has a decompression
> context (zstd, deflate), take the lock in exclusive mode (write).
> 
> A quick synthetic fio test on 24 CPUs (preempt=full, lz4, 48 low
> priority (nice 19) readers, 24 normal priority (nice 0) CPU hogs
> and 24 high priority (nice -19) readers):
> 
>   Metric           Base               Patched
>   ----------------------------------------------------------
>   Read IOPS        473k               680k          (+43.8%)
>   Read clat avg    35.98 us           21.28 us      (-40.9%)
>   Read clat p99.95 55.55 us           20.86 us      (-2.7x)
>   Read clat p99.99 6,717 us           2,834 us      (-2.4x)
>   Read clat max    2,005,100 us       1,614,300 us  (-19.5%)
> 
> Suggested-by: Brian Geffon <bgeffon@google.com>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

JFI
I have completely reworked this patch.  Will run tests and then
send out v3.
