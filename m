Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C313B0AE2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937012; cv=none; b=UZFpt9w1ajrQ3S70N7KTFW4nojkijUEZq05EZY+0L9QlPMZxsRmGjDBs53/uy1NFlIK30hfl27YJZhpJiKAGCD/yv9kNI2G/LmjUHcTPQgqHHvXhSo8xGffnpa3SFx4AgQ43qZcMT3MIAu3OysUKJXFg33HPZT8dt+sWPKP2kmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937012; c=relaxed/simple;
	bh=HPNLMBO9N4prqf/mQOgRlKyxaKwXtI72+5mxXq1aDyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTrLAMcW48GtQmv+4VHz7VNlXuRpSHX/sm5KldqtxKIYv8GNsQWvFYnleiuvMhE/boZEW+Pz73C9iHLXyo5x9/O3Z4q0cMdLwQQwktJOSEoP9/lsfhEqFUKwmrzdVRHwv03/osd+pd4h2lzsOaGMYhdBsuKSubOIJvQ+Q8+DA0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F82511EJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F82511EJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49557167508so64449535e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788937005; x=1789541805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7VMyo+jbi8Y24lYE0+2xSfhRa8JaTYv/5jSwKEcVL+I=;
        b=F82511EJwoG7tMy1NBoAeSRgiSnVn6sQwU1gdln+/+HDzycMG1Vx6BEMOp4ozNTgeq
         ZhpGHC4qql/hGNxeMmFSm+K8UmmjpSpbrma8hUtERQlv0AqmcRwySucGTpA1b1bCloIG
         JH3u3m7UMSm2ufLCqtbXMpyQtLeV374eWsMFcaS4pnVErf3+2nHjgynSXU2eLnpDtsBV
         Pvh3ry8QwwUyQ+3pe72KE3rcaEVsvrgs2k42aSYl1uFjZsdQNJu3LqsQx6tIlnsG7tdR
         Uegp/0A+3S7L13tX5fxvyyzimJA5pdbrhYLpuS4vRtg5WcOSNTCkNVE8NgNX+86AQrdr
         HjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937005; x=1789541805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VMyo+jbi8Y24lYE0+2xSfhRa8JaTYv/5jSwKEcVL+I=;
        b=KP037KMc1PjI6UdlundHxO5y950XuPpsNic8KUgJhFMlhj+xEr5v1jJceLIljAY+kr
         X1I5fy9SLXG2Fz1PImbydl3pG9MDJRGt0uFifDLO6S2uAyR3jIUV+hXUVdGRCbx2fPV0
         LN/dBGNP+80qWqGsfaYdxIWrEbBJp2L19NCxOATx4VDRVRehWbXCa1BZR5oh0BDgHxkK
         Bc0iDRUEzkswfcSCaYg3f7CbPc7RE3maKKrMKsn5Hp3yUzQ129joQU8MyOSdTVcLxE7k
         gmW0Xc1Cj5L6Qrq0wB+Ax2qx8RgRVY73FtszcYkgArc8UZo0XkzX/Ae1edAjQ86WZAUS
         VYoA==
X-Forwarded-Encrypted: i=1; AKwUvBxNBhYJRB+kMQXcdQt4ThCrCQl8f5ufqGwgu0H16V/WsLcXvo81ozNW86XPQp+DC2qG7XAHUbs0CKMBTJc=@vger.kernel.org
X-Gm-Message-State: AFuF++lDPTeUQXC3GNwnmZWYdR7+udN0KBQQoXHCW+BbMmKgn9Fp6gR1
	SISF2FHn5whxXyYK6T+REooSyKmQFDvhzG7fgM5yoASR8dyg69an8QnjOwac5+EIGg==
X-Gm-Gg: AYBFou1Je1+3sPpHSXpksAw0Bewr3PBm6H5cEn9/h8kYZW7j8WAF0sdSQODrxBccmpW
	Ru2QjQRFmFhp6rZGzQwu+iiVrFxAwQ7O/2+YVGHEZ+LetOG9tZlx9tluVRX2wG06dkDxoPFaqqY
	lCk0UmhD+NmZcgQEKWziZhcNM2oakxOivYAd0aZ7Xjc1eSBWKluifrvf4TB4OqEdzdgCq0aPKdy
	cJVWrGKBWcCjvfgpHo/bJQxC3nk08uOY+MxOpnyhxw4YAJKAW1ULSJQO1k9qg6ae+l29MZMSvDb
	Ix+J+0X3W2JAruSAKO4UMhSufMMEG1SPBkLSaTDU4jBlNkER3KM62T2N4d9fZIPebjIT8ZubluS
	VcxSzttBNSgp4195qDLn9nGv7DF9XvlmoOm/+fZ0TW/IIjVB4himm55eJnVGHlmlJn18FBbIRQT
	64SpAQQ22fxRdvaDM9CluH1idzgJYIVD8FZq0NImMC+AV7yiEdfYa3Q8IDVJnmEKNjfXRs5Hl1p
	x9wPTQ98prTNaWFKj1Uy0GMgcUkhVMNTQdOzNQcPGk=
X-Received: by 2002:a05:600c:8715:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49d17d4b01dmr220148115e9.1.1788937005074;
        Tue, 08 Sep 2026 23:56:45 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm350601935e9.0.2026.09.08.23.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:56:44 -0700 (PDT)
Date: Wed, 9 Sep 2026 07:56:40 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: Fix ring_buffer_read_page_size() kernel-doc
Message-ID: <aqEDKFX7X3Gjv2oq@google.com>
References: <20260909062917.89482-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909062917.89482-1-kmehltretter@gmail.com>

On Wed, Sep 09, 2026 at 08:29:17AM +0200, Karl Mehltretter wrote:
> ring_buffer_read_page_size() takes a parameter named rpage, but its
> kernel-doc describes page. As a result, kernel-doc reports rpage as
> undescribed and page as an excess parameter description.
> 
> Rename the documentation entry to match the function.
> 
> Fixes: dae8dda341d2 ("tracing: Fix subbuf resize races with trace_pipe_raw readers")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  kernel/trace/ring_buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 9c03a555a6ba..0e30c7bd6045 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -7384,7 +7384,7 @@ EXPORT_SYMBOL_GPL(ring_buffer_read_page_data);
>  
>  /**
>   * ring_buffer_read_page_size - get size of the read page.
> - * @page:  the page to get the size from
> + * @rpage:  the page to get the size from
>   *
>   * Returns size of the page in bytes.
>   */
> 
> base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
> -- 
> 2.53.0

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent
