Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC0B4FD261
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015974; cv=none; b=P37IQpU1qbqc/VgCtku+GA8k7tdS4bZnGVNIvzx0UzB4tStZ7m28DP+fw0q7V8QUopRLdXUYzazZ3d7l36beJemWMrPHgE9tZB4TInnxbDmZqaVFLEd2RIoSZt/MB505jaFL6WHxxANaQgWNiIAJD9I1NnRbsJTiDe/h3Fn6VKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015974; c=relaxed/simple;
	bh=kHF55tgxlhodvMYjiaBn8wLp3n68ssCHiTfatMPtKzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpeW2vDqBApw7ItqRlo3amK/VXD0vpDuiaFadiR/DJobaPsFDudW+5mcAJYSDFgVJs/lpegRKPPV+/QQi7RhunEcfPEsgSUWiGlSZS7EhubHvqyaEnUDJPjXn2jZO3nE+W/m201sdFT6QZJEOqaNtaaMLSfC4jgCyLJbTk5hgxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q61+/ffH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q61+/ffH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so23150615e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015971; x=1790620771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfp1Yz3ifDR2lWMmmnGcVuQR5yKwqsCt+IibNOfjTJk=;
        b=Q61+/ffH+YPY7ry05EkIm9rcFqrdHZGeekDmwTv0pbtCv1kln1v2bsemS1XUki6ev6
         26R9RGSXGCLbqEo4qkeyEUw9w5hGP7L4mBkmPZ7r2WbQVr6lEan/BSLC6+Fgc1v7L7T+
         Ab4/X4dpB5OUmki3XCp6itAzzBoO9aeXAx9JoFeLSnoHeL1zbwRgYQ5GjUxgm1qQUlFu
         3+GHDDdP7LkuG5UtcBVOPYp7dWuxu2mkHOkl7yHUuRJfwMVZxvu6XXHTKQc3wOrhZ0c2
         lrR3HC2eaZptkb9xnSrURs4YizSiRmMn92GLa/1ItwrIFu2ggPUn4Yk5O+rhs1XM7FZm
         YyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015971; x=1790620771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfp1Yz3ifDR2lWMmmnGcVuQR5yKwqsCt+IibNOfjTJk=;
        b=p0XzcD/Atdke8iBjBv6YL+K3G/nyBmXF5AawCtH1A7LwSqCaGGhB7cur6+IK0iRXRi
         HoJKkx2L86rYUM6t/pUNRh7f/4mf63MHKA3F96WY1HC/jd8XL3vRjGKY8gsext5XP0OR
         yuTcdM1IVWH1Xx7b4sn0nmUvfHlvLthi2Ho1241g1KbWpSrkumTQaQcqDorY4qhrWmw8
         D8xKpFCLh0X9QL/aNAW9MsNZKG83ApJQnhtbG0S9O3elnvIpe0PCyfwBKFEHi6pEtXyb
         XcCBQ7fQA6UDYlHcUMXEBtD/jDYyCu9jS/TRFAtlNkfencWn4N7S8S3XvIiqv6QjTtQ5
         C+tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs2cUPz+O1gDLTyIbUxvCB97xSHzopIahuUdAEmvlgAvdy/Noi2Mbddl6A3ejnSioHt1Q2tyhgbrSryo4=@vger.kernel.org
X-Gm-Message-State: AFuF++lfCrB31Q+WZxv8nyswphwRsqnk0B7GGHPohB+I4Fd6wGtwlN5I
	TuZ8984BD64f0m0kwrZbBFZdK6OB2GompwLBxnEGqCUa/pqcJKJCKepJ
X-Gm-Gg: AYBFou27vP87MJKdkSXVS/vTxadBPrQKdS4KEpBiuYM1wJU8Ky/VZ+hmnwBVyXx8kuf
	LTRNftjUo14K8SrGRShi7L3JVDlbqrMIJS7nSW7YM0DFlX8ppClTIXfFi4BbRQcd8f9LMsggFne
	TqPZ4L70KzALulfs8RgyUyrUgwtwFLImmLqYaf0al/AqbQa+q0gUFkKcn0Ua4ICvuOyyNykhx0e
	gDaKF8wxvLv8W+C2FRcDNFPb7AqnBR9loKy+eX9FMCtxjBWfpv8Ju9wPyo5TYyMSZkwogsgHL+i
	ejZF+peYg0DUkB0ObkelrgtxXYHAHDKVHPdXmrcdL1AnBGkW/olczIijQjPNbNSkFmEasOg89J+
	+fnwtCFMuq3EymYAhHua2/9L3g/z7XqR51dJw68hrtm6Hodr0hnnOt68ZHZSZZNeTP/kwyT8CGH
	5l1JLdWgcFmNNZHUcQQ3kUgM9VDxv84bmG9Dovp9se/VVPoZfMdEJ37fnDAVeQWwwxPzfjMohZ8
	p326L22rRwssf5JFqP+j5bFNzLKdgML0ixsEh+++63ai/pWtoQqrLqTI0qYD3TLcNaeLO2axKmM
	2NcpO6Oo10TWgUb2kOayML58q3lsJIKXYWQyrhdFqDKU22bCaTf33JLjvsYqgXyPdj8nMwO+zaM
	090LC9BjGdVOLoyMP
X-Received: by 2002:a05:600c:6214:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49fc568129emr158209655e9.6.1790015970588;
        Mon, 21 Sep 2026 11:39:30 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a8e9-c501-45ee-6f60-3fc5-4072.310.pool.telefonica.de. [2a02:3100:a8e9:c501:45ee:6f60:3fc5:4072])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8ccd185sm10667745e9.8.2026.09.21.11.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:39:30 -0700 (PDT)
Date: Mon, 21 Sep 2026 20:39:27 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lian Wang <lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mm/damon: preserve temporal quota state for
 unmeasured PSI goals
Message-ID: <arF2epnyKAdkwSG-@gmail.com>
References: <20260921020013.33105-1-kmehltretter@gmail.com>
 <20260921164749.82070-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921164749.82070-1-sj@kernel.org>

On Mon, Sep 21, 2026 at 09:47:48AM +0100, SJ Park wrote:
> The patch 1 has wrong Fixes: tag, as I replied to it with two options to path
> forward.  Speculatively assuming your preferrence is option 2 (adding this
> series with fixed 'Fixes:' tag), I applied this series to damon/next [1] tree
> with the suggested Fixes: tag modification.  Let me know if you want the
> options 1 (squash it into the incomplete fix [2] before it is merged into the
> mainline).
> 
> Unless you want option 1, and if this series is not added to mm.git in short
> term (~1 week?) with option 1 update, I will ask mm.git maintainer (Andrew
> Morton) to pick this.  So, no action from your side is needed for now unless
> you want option 1.  If it seems I forgot doing that or you cannot wait for my
> action, please feel free to ping me or Andrew.
> 

Hello SJ,

Thanks for reviewing both patches!

I used b73198a47ffe in Fixes because that commit introduced the problem
with the temporal tuner.

I thought a Fixes tag could also point to a commit that is still in a
maintainer tree. The tip handbook describes that for tip [1], though mm
may handle it differently.

The hash can still change in mm-unstable, so the tag may need updating.

I also found this reply from Andrew [2]. He says he tracks these fixes
by filename and folds them into the original patch before moving it to
non-rebasing git.

Maybe squashing is indeed simpler here, also for backports.

So either option is fine with me. I'll leave that to you and Andrew.

[1] https://docs.kernel.org/process/maintainer-tip.html#ordering-of-commit-tags
[2] https://lore.kernel.org/r/20260313091738.354244f6fb500bef3bad1fa1@linux-foundation.org/

Thanks,
Karl
