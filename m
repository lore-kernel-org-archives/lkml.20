Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C83C8728
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389332; cv=none; b=aZOn2Qb/jvt3uHxFH1zlRjKxWONoKsf/1oRrbM652qdk9nFlHXFZ++3fK51hcDYDAW5/lbgNp3Qpa912D+9vIll1lpVsaUvNK4tM7jYmQ52Lm5OJ+ZiEMwOgWkPjYM1Q0LiGJlXvvNSSj5CxrvpJfdmsk1Lka/6vO/z2YfVABEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389332; c=relaxed/simple;
	bh=vbBdaLoopUUlhWVw+UGt5lKN4LEI/dUgN1+9SCpkx4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuP+hGx1riM5l8PHLsPyloHHkvR7fMYaO4dC4411XF2HYGIptmXUj1MRjgEg4wh2jlQhnmByhW3IiU+Qo8vNQEhQrqpBOEhoyM4mimCAdYNAnUEzTtgnp71VoUxUvf6BcRW1bq2HkUseOap+FDbk7UZImdvUorJCeQm0B71dMjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J5g9bP7o; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J5g9bP7o"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so1137365a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792389331; x=1792994131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qdtOUxXRF05TEuV+l00U15wQDymBAePZDceRfWQ/v5c=;
        b=J5g9bP7odmuRh9pcHB4bqUUShXo1EGdolJyt/AEb8v9T96z9d8iO3VcxkA28JU/y46
         Obs86UndaaJZ3ZqJFmkBOLHwsSNAHUuX0m1hyglQQoijr1QoOFqJcMjtPArtPm/FEJ0I
         JTHX69JbWvfHdjy9srk5kc8oPQD6cHMaFGU5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389331; x=1792994131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdtOUxXRF05TEuV+l00U15wQDymBAePZDceRfWQ/v5c=;
        b=jqGiX/+pYEy3kCU0DsjMNFNGWYwtCvLTNTQ/5m0Us90VHFxU0vGaPP0ZyT9bzDKF0n
         q9vec7FqISOwrvhJUfnKS9etGAhNdwBYxBM6cx+FKUZOZUfkOcig6PuJ3tuOGoononYh
         qtl+UwzfRjQ83KlFs3pgA5Ti4ocfT/XnHsHzZh0uz6g33JVaJ4akO75ffNwSugLpLjpf
         Agt+XPutGro1in+P7Srv1DvvlLW3K5+mlfdWi657D3F3TRhtU7rLboXkDfAdawjsj3Za
         AvTyFcFa5eLg4AXA/c1S+/1kR6DhW+Pvm2+E8Bc5zalDI/UguixDE6C6YIy2P/tPMd3p
         YYxw==
X-Forwarded-Encrypted: i=1; AKwUvBwkWeolMNZw4y2zZqhp6FT9cmkJM541n/LQ1R0d/ssA7Xzb+Pvz4dhHlwtGXtByPCQzp1V8PT6u8OmuSJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2e4YWQ+Bd4ZqYpKqONZ4MhClNfGFzQv+bgsbH0zP5JX/ixHoo
	KjF1HnUVtepfLsQx/fwhPkjMUHomSAQTokz5yequ53jylAMh54W5OOHah/AGwqXTAw==
X-Gm-Gg: AYBFou3VfXufxq0SyBlPlrdJUlZ9inE1ajYDs5PE2yA8ImnUudeOz+dtJnWxq+t/+Hr
	kFIO3CkXSO2S51XdlY5TVAY9lIhaA0MSrsRKQORsk0I1171BOhFgMAWduneEU8HQC9v1ipadMeJ
	/wIRz4ShdJZ0k+DcnFEV1cAlF2fqXeM5rc3IxrMBGspRae/g0F7ywnjl6m5biAPjJtNaAgKwj5Z
	VpK6sONXTMxl79gMDHhqFiqrgHtdONRj/mkwEDjFFNlTJTwf76sNX9LLD3qNm3nnOLR0W7kYtVp
	6daRYZQiaGptGlaPv3JaM8GQjzsVukCGFomqAOcwB7rkkgvZOgG8+qnOvHzOBmkSw2dsoO9U63D
	xaTHUao9FteHhjzoyYS8VHWygRolGYBLXQESqGUPnLm62ssQOEK/UDwVjVxuGN4oPt0ziOfkrab
	vRa22mY+8Dyjqd2WNSpjAvn4AS4hF+yiDSEd35vCHCEYnEmY30+083SQCLLh6h6+a4s3Ca3NJUm
	b1+bCzrplhaBIY8sRhGQRSfTcN+R1bcwuZ739Z6PB9AzWYsUelzN5U8FiuUPf+IplAa0eFOoY8i
	os68jdbCEca7ZGiubPe5QIsSVu8dmP7LPxD8T1Hf
X-Received: by 2002:a17:90b:582f:b0:3a6:e9bf:f244 with SMTP id 98e67ed59e1d1-3acee275f7dmr4044584a91.1.1792389331013;
        Sun, 18 Oct 2026 22:55:31 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:7b3d:f4ff:823:5963])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm19129769a91.8.2026.10.18.22.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 22:55:30 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:55:27 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: senozhatsky@chromium.org, akpm@linux-foundation.org, baohua@kernel.org, 
	bgeffon@google.com, minchan@kernel.org, richardycc@google.com, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 10/11] zram: use rw_semaphore for decompression streams
Message-ID: <atWwtdGez8Rjq5ht@google.com>
References: <atHftz13hWzGludk@google.com>
 <20261016134847.1620103-1-zhangbo0325@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016134847.1620103-1-zhangbo0325@gmail.com>

On (26/10/16 21:48), Bo Zhang wrote:
> On Fri, 16 Oct 2026 17:54:25 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> > A quick and dirty patch, as usual, just to play around with.  This
> > attempts to improve the reader side, because the reader is side
> > much more sensitive.  Tested only with zstd.
> 
> I applied the cross-CPU borrowing patch on-device and re-ran the same
> zstd Android A/B, so it can be compared against the preempt-disable
> numbers I posted earlier. Focusing on the read (exclusive decompression)
> side, which is what this patch targets:
> 
>                         9+10+kmalloc   preempt-disable   cross-CPU borrow
>   dexcl_contended       15,919         54                1,447
>   dexcl_wait_ns_total   109.6 s        0.68 s            3.66 s
>   dexcl_wait_ns_max     145 ms         34.6 ms           26.6 ms
>   dexcl_avg_wait        6.88 ms        12.6 ms           2.53 ms
>   dexcl_acquire         2.21M          2.75M             2.94M
> 
> Borrowing clearly works: dexcl contention drops 15,919 -> 1,447 (-91%),
> and the residual 1,447 are the genuinely all-CPUs-busy cases that fall
> through to wait_event(). More importantly for us, the worst case and the
> average are the best of the three - max 145ms -> 26.6ms (-82%), avg down
> to 2.53ms.

Thank you Bo!  I included your numbers into the commit message.
