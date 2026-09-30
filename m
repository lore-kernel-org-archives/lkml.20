Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA4E51357D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786648; cv=none; b=c4ecaCvaXedpLQo/DKwG4r4osIF0t7xtwvQbYOvHyI6bClTcKq8i4M56zU+iABIFgTSPGPTW6m/1PkZl1ecfZ1keIhGvqI0qGXMKL0AK3Hxa9L685+5eliRBNC+H8kH6sfLBrJokTeiweex3xj37exAWCTYIG347IkDfUnvnYlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786648; c=relaxed/simple;
	bh=IlOWPmoIS1wBYoM/00Hywy9qyD6BB4xhp9iVnM/iX8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHhgyQCpKqwBHf1YIJkDAcq6VY1qP5gPukVBOxw0BBDlSS+NxdAF4AOrd+SVDTs5svNOvATbIZ8EIQN/W8SugRlY6dHQjY0UVaGcsbtlrLj30G4fDZT0QSTDU0H3FpWcxGu0pOIUCZF4D1Ar3PC3byk4Uk6KV7ru+slmQ1rntjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=RLqFp+gq; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="RLqFp+gq"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so36801035ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790786646; x=1791391446; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W33h7LP0cHQ4lydwZhCKuU0weHrmwtzViKu5Dtf4WpU=;
        b=RLqFp+gq1gtZHRAJ7J6pg4LyuxJz0ALeaC4BLXm5WdYLthF0aY71xGsw/t06TWo5DS
         +yqB5pjq9zCt41x91hnMDDu5WmXyht8COG5H/7JJtAiWmOwTJGNwG+2oVtt8BuTh58tF
         BuCg83Ej/4gY8pdP5eXqajGKPoJ4yTtK0TjweGilCAZD5qOezzZyQDgIkH7Wlh92EUgv
         EzNbzWl7Ja1tVzNNsVsYGUrgnYstiWUZnkGwifLMr6TFKtUR51TnevaCOfHE82rPlIDh
         k8TYkxStM0jPzS/kmTeQ9NZuP4KoSbPWX8tFnpoDPcwTdAwa+UoHLkm4iQyTQ4FjDdW1
         1hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786646; x=1791391446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W33h7LP0cHQ4lydwZhCKuU0weHrmwtzViKu5Dtf4WpU=;
        b=eJR2l9JdvZRh+EqBA3ZPAv9WfBrs7LFw/JE0nVQaPrnyE6KD25LEEd7U0BqPwxuUUF
         dRnuCSzA8wLk6wLlf9Ll16BjIpa5oCVZWphiS7ib4/ubuhE7ToooMCAZfF8OoQrySonb
         Z9PlNBL5Tw5CZPBoSBzVcHmEPHlb9qtKWz9q62G/bWl1RAPiWT6zXT4VTBFTi3ZlOhF4
         CVDJn+mFwGbzPgUMykg4I9XbaSekImI4SmT2Nn2/S6jl+YXpFFxzkq2vfKTxRK7VgG/a
         +cjOmvdT5R9QHx2Jvp6YMCnXusfHv7+gPoMHSAeZGHgUxwadTvaiy5foP/5U3tE0aR37
         942A==
X-Forwarded-Encrypted: i=1; AKwUvBz1bIWTf4LfeBUb0bEzWEdDGNCPfUuu1NXwsfqskWNFnQ+uI1as+7hm4q+zuXobulgpLHyEcLJHhmp4ct0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeiUi2XZWXqdUJabIxT+N8OmzwNOV1iI3R7boWbEqt0qS3l9Xi
	L8FHu5TwwSbfxpkG+pt3Z+xr62YlfLPTDe7sa264AW0U7huRVcMmNV48Vft7WOyZ8TI=
X-Gm-Gg: AYBFou2QqBYousjYmD/9KNKpq7lUN7pIXxLamH4aDztGp6gx1/8Y8KfwvPqCj8LtARZ
	/Ns2ojwivXWNFMRg4uu9Jodr1kNfkqwSr8IYnkYnxRkH8X5vcnZ7cUpR/IBIM2bfO68Mu6snu0T
	pnFBy6qL9jJzg/2io5rCUoFDxKkmLmDqPWpsaM3n+ayzkAbvDc5B4rgftR5BiBxcP8xE62Hx/ZX
	tnKSFBDtL3MDV2jq7wQ8UN49oAN8SWeYBcOZ9sJ2DYbWVLwp2VshdpnPKg/KrZvAtK8mM/qpDkD
	y7msFYMZbK9FGf2hJ7d5NMdddCcX2KWU0tG9FE92GL5ss6QHhSQBY5/EO02ZL4ifxUgwZNpSvb0
	M0mlCAaaOqWAJwKqcRbBBNqwd+8ML4HRrJKRmoDwGX4i2OVNrVyrG8vu3mLoMuNigD5XGyaY63u
	pXI/fc0L64GrRmc8oL7SfT4eyi/st0sIDprFpoAWBegHlX4vrEH45nZdwoEpjgBtp/F9S3kM90s
	PufBcbRkMEk
X-Received: by 2002:a17:903:b06:b0:2e2:fc69:c15e with SMTP id d9443c01a7336-2e2fc69c990mr2871005ad.65.1790786646189;
        Wed, 30 Sep 2026 09:44:06 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e3005839d7sm396175ad.6.2026.09.30.09.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:44:05 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:44:04 -0700
From: Joe Damato <joe@dama.to>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>, Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v4 1/5] net: Add netdev_config helpers
Message-ID: <ar08VMVC+hYDI62t@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>, Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>
References: <20260925104417.2325213-1-bjorn@kernel.org>
 <20260925104417.2325213-2-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925104417.2325213-2-bjorn@kernel.org>

On Fri, Sep 25, 2026 at 12:44:08PM +0200, Björn Töpel wrote:
> From: Jakub Kicinski <kuba@kernel.org>
> 
> netdev_config manipulation will become slightly more complicated
> soon and will be used by both ethtool and the queue API.
> Encapsulate the logic in helper functions.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> Reviewed-by: Breno Leitao <leitao@debian.org>
> ---
>  net/core/dev.c           |  7 ++-----
>  net/core/dev.h           |  5 +++++
>  net/core/netdev_config.c | 37 +++++++++++++++++++++++++++++++++++++
>  net/ethtool/netlink.c    | 15 +++++++--------
>  4 files changed, 51 insertions(+), 13 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
