Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF99C4FB9AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880149; cv=none; b=W3cbBKiQHN/+GYs01ipfcfHXNVaewN/wRbuHFMx6nO6kzCOp3NIMOSUe/bb7hzKMVYf2nWZhHlsMMSwi56eiFOgqATJcqEjL+ygqH1jf0/0U9QxFYt2zMqihtruA6Qd8semMboH5/JA/qR3jZbP9JLpKYEqBmOYMpc1e+qDPbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880149; c=relaxed/simple;
	bh=jZfddFi+Ah2cAcmFlLPkriku1a8/BpivA7UBy811i94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kf0ASzfIVbJkuED0w+4kxdNaVU8v4xluHfqcrzyNqs7fySve2s+bb0+lSy+dInpmQgEJ2jyBk5PHS2mOA70Ak0pE7lwe6IdibA7xqtSRuXFFqPg8jN4eJOYhG9LAxcJ3c6B8V4JmHaSt22JCMwrr42gUF98vw/paJ/s4uklHubE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=BgvvbtAs; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="BgvvbtAs"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91054f537ccso28966116d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788880127; x=1789484927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxbeSw/1O0AaW3ymGCl1woEb6mnK2PNLKhFRMNzFF6s=;
        b=BgvvbtAsQSB+itxBdEGL7MPEqwS4vJLqFN4RwLP5n9YTLOnFbt58tF4h9hA++QMkWY
         4fnFzRHQxy3qPK6G5nHPSvh9s56GQxQd6YNx0Nm1MD9Ij+Ti0S8f9YCn+O5EkZOnPhvO
         7kC6+/cWmQmiGQ9PWRkwfQP9C+6eqjhy2uDTVJp8hsH4qHKspOunCPFcEn4FxQXulSGV
         pVrPcEDcmwy1aFZoFVYb7xpPZvLyYMWLRiQuYwQANmAs1ZisufkqHJnuUMal7s8zaXwj
         6ivQE2fuccyfoJKujRlVNUVnqCtp+aS/OHNwxiHuTa5Ai6P8k31dX3+pMcg7b4lL7tpO
         UC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880127; x=1789484927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxbeSw/1O0AaW3ymGCl1woEb6mnK2PNLKhFRMNzFF6s=;
        b=SqjQIpobR2JPbagoCz8ujDttPIMETEDg/8YztrT4JQmQe/HEPzSSn23zbDESWDBEok
         Nwzso91zROmrV0km4rHnMpmHqTApQ+4wV1hTeIStnmhRIl8xnp2Ob0rnJhxcoE70ug/6
         tKkqpVTsjzt0XLbgEQYhkpOISAeqY24SDrbBWiiR42l3KT83GccufxIy+Szzk6wiUd3M
         DLVkO2WTka/eiIj4P2umIJsPgO7jLW6LeFaBCZHMWZAOQe7Idk95hsURdLf8qh1VsDgi
         75zKSFSeoB84TlPdnQ3Ok9hbWPXF1GXQe6x0pWat9Ls5WowD7LsbOZS12pJEeXZzMuIK
         LfGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxah/HqpLrRbg/+RQD/l59zW/m2itbuqT9FvwBWv5UkXnocU0hlMa7ieb11VXuaoVoTkLBo+dfCluQKtV0=@vger.kernel.org
X-Gm-Message-State: AFuF++mls0fzqeyV/L7rMIhrgIhRm3Tbm7IEwZNXmMNOBYDQbIV/vMLi
	AcPQiNxx53/9lMRCy5TDtwmzUEesnh8NNmXUVeHXEPuxCwcELMxxCZ8BqeQxQhv5yro=
X-Gm-Gg: AYBFou0oII0TQY1NwUwFUtLwwUTn4ekTam4KmOikgEgmYDbjuRPYKHoT/c9KVZRAK2j
	Iuye1uwJysFpvOaDR6sIVrNKdtM3KYhJI1f5NOWBTH7QVbGovA8BY/7HMOd39wNqoKZmG70d8sK
	AJZKhXyxrV5cMXgzgPoiGT2FCND9f63mZdYRey0GGmGZKqv/ph8XrbYrtgb5zxWsJg8oq4cW/Ro
	nB7O4nff3nqbPiWjO+L+yCCagGYRaJyzvIXPjBj0Gf0Hp0kom4eqH2NKuWhYSLK/yqI5a9jlZvE
	flMUIDgNVEq5S0MaiJWVD9/MMqBGgxQc5IsgAwvl+OpINkDmCpKQzLs9ABevsQFPsQHVUetcpoe
	vCiwK2xD9gG3nowGsoNC8gkF+Mt1NyjHz2xxDXqfs4rCSRzSRp6Gd6nCpfPhmqW4nqgGv0MNylr
	bt7MnE37fvQHscUR2TkH05lCsSXbGQRC1I5DCzsGbWlZd6XKf4ej41KxfY99+K8NCRwZsR4s6dJ
	e02gocvT1oBD2UY/9RiuhuZU2GQE5jY1tLBt9v0lKtK
X-Received: by 2002:a05:620a:258c:b0:939:afb3:f9e2 with SMTP id af79cd13be357-939afb402a7mr1220077585a.23.1788880126645;
        Tue, 08 Sep 2026 08:08:46 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafbc53sm1161160785a.10.2026.09.08.08.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:08:46 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:08:44 -0400
From: Gregory Price <gourry@gourry.net>
To: Qiqi Liu <liuqiqi@kylinos.cn>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, 
	mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mm: page_alloc: add missing hooks to bulk allocation
 path
Message-ID: <aqAk6W4LhR4EpvHk@gourry-fedora-PF4VCD3F>
References: <20260907120949.418450-1-liuqiqi@kylinos.cn>
 <20260908102356.344075-1-liuqiqi@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908102356.344075-1-liuqiqi@kylinos.cn>

On Tue, Sep 08, 2026 at 06:23:56PM +0800, Qiqi Liu wrote:
> The bulk allocation path in alloc_pages_bulk_noprof() currently misses
> trace_mm_page_alloc() and kmsan_alloc_page() calls, leaving bulk-allocated
> pages invisible to ftrace/BPF/perf and leaving KMSAN shadow memory stale.
> 
> Add both calls in the bulk loop to match the standard allocation path,
> placing them before set_page_refcounted() for consistency. The gfp mask
> passed to kmsan_alloc_page() is stripped of __GFP_RECLAIM because the
> bulk loop runs under the PCP spinlock, and KMSAN's stack depot allocation
> must not sleep.
> 
> Both are no-ops when their respective features are disabled, so there
> is no overhead in production kernels.
> 
> Suggested-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Qiqi Liu <liuqiqi@kylinos.cn>

Thanks!

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

