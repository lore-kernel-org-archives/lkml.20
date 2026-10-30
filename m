Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333155;
	b=Jo6Vh+3Ppxldr+bmKiVd2CjFJ9QAitZGdc+Vn1lio+n/wvTV1/cdNwns3t/Uyb7nVmCx
	 2MDY9+1RkIwnzYDp+qHi3CFhwMkwRaA5kg5+XkP4pmWSDx4JV1+QmcaWshgWzc38Vqyfa
	 RrKwz5p+j5LJqzPzc6ALDPj6FLwqjyimUtKuCUi9rk7BbK+ZCcT+c0r75ynGn7LXR/yat
	 NHLrxt9xcsozgQKhExgS+/jywYJeK8ROCorZs+fvoqcpQPnFFs4Ff5N6AnKmD9c4xd6gF
	 lTr8D5IPffxBvT0pwBP4DRbeJ3vgGktKYnoZA2dZjUtfRXlC7iZnFHt29vpCzZTO2JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
	b=gr8tDCs39td7+4+znwTvuEk5S9VDh65GN0L6cPNNBmnRVajEdSqhGC2Z7Ymdcs5ZvWGu
	 KVLR9XD5HO+drNEJbdDDzZ8dlCl9wt5CyiaqpcRGYQx3Yt01OVsNSO6fuKHTAt07UOkC6
	 uZQg2dftJrtKeTmbE90leVinVNuodTg036o5JZY3NMIYOuX1Oqb3d/AwFsTcCjt8OwFoW
	 mmioPEdI+Nc71U6MAZ2jg6UwDGIyewb3mqUgOGK9KpBThH+49wpTEHL79HdapHLZMroBJ
	 eN/OLeLqCe1b0SBH5ZBLuNlB7Y7ZiUsLUb8IeRa1k8cyj69whxyk3iIosKmQUfEocNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="cZUI88/L";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985CB606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985CB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cZUI88/L
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so519845eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793333154; x=1793937954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=cZUI88/L9F1F6vaHkoJiPubaFvpBx9ZOZoFIH4WzYEl9uT8+1501kBXRQ+iQnW1rG/
         4Fw7u6pK2bhGr83aiABmILWeko3myUezgpD4yxFu1q8ofu7DAw3nd3xwaeMW+dOR7WjW
         fF2I6XSi4uBYslctXHDwkVQCwzAYXH2+VEB4ld4ijUFXCUVYiKPoDWGSOArpmY2b6MgQ
         9ZvnqUJjjMcJdZxPtAbFTkDp6O48lwLVb7JSCvyQcehPpzJbJ6jeHUnZCR3iOiOfxhs1
         cwBXgsfbLoMorO9ZFOLAr33BI+k9rnycgZilL+r2ECnd+fRbSczk3whlomOJkp24wZFS
         GQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333154; x=1793937954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=nprre+Z9yN1l852dJkcm+dWuulcWn1nAk62VpgYlUPj14e9LeayWJsbVDTE2Mnnwam
         Oidh5BDg24gOQQ6K93nLYBgmfFp4+Sg0gyx5vgKOT97T4XmqLfph9gQk5p2eMdEW/OKl
         6qKWbSanfEIsqoIza+V3+ghKqHZcr3dH1mPyA26HOsTHY0JzC3R1Gl5XyoQmGtUiI5vY
         VoSAzyhuwkZdlVtrGC8a42/3hdr/AQwQYCCfve0f0tGDywBo2hhThZ5Lyr1ryP7XNJjl
         DudHCP2c+HY0oFwOOSKae91/C7kaoKO0ewT9ge/M0m0YTiy//NHl2zm1hWaiiwNd1UZE
         WuxA==
X-Forwarded-Encrypted: i=1; AKwUvBxv1xRJcjccGBeEY34Nkbq+9/pD8AbF1eUcp3r14kqiWe5zd9WLsExrt7Vjk8kNixAsPZLHqTuBr5lcCPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkLqdBGQ3UJ59n3q+uEiN/OYUx2B4TaMdWdMUvDnkN0J6UP/t2
	bzEFSHfaq1JOuKB2QvAu5N1emwfHwguO/WIITFXU+UKm2GYsuQjqBZg83r8oPx/Tlko=
X-Gm-Gg: AYBFou1dm9H3OKT9p1M0V6vTUtrimfW9NQ3U2pq8wuTcHImNulhr+8/CnrJ6Zi22k2y
	XKpgVPK4xenJPuIlEaBtoYwd2/Cyflb9Kyp18o/Ge2r57C00sgSoLHcNrmNAN4XKG91aryLryfx
	mVd+cRTujXPczBNYt6ZFtwi1i+ITuiDKB8nC5EIN3RLUn1QtrUD5lftFELO+zA8b9r3GA/Ypf73
	5fsrwWleBtxACElSPLvIPZ6XgnqQmv+P2xSIq+apzE23BIkHjyQ0HWzCFmso8Yv29rejEzDUf79
	KDVsc6xnqX+P20EvPB7PmtfC8dl/lGJiCHf2CNVvir13x7gm+GgNrjG96cv0iKmxLYSmZDg2/YD
	Vc5rUMtFECjs6OKRbm89oIFIjtW0Itkf9G53DAun1oDDwqsn5dP+GeM3biE6N/4w+sQucw2uq7h
	bwuLC0KKqUKRpZ/RhzoVe5D8e7PlWVq0wcJmmeSeOZ+KDFquFLyUCCLh5zm50wd9GNukyGgObf+
	oIJoDQY3S/UHwb6WWJZpKYRQUVVPIBpSeRRRz2gwvx4ktZa4FxgNxJ/G7/jaMI7Bp1XFrB2D4LY
	XKW0z+exswevGKH6YQNT7APuvT+iU2g=
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr1772736eec.24.1793333153319;
        Thu, 29 Oct 2026 21:05:53 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm3512579eec.15.2026.10.29.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:05:52 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:35:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
Message-ID: <auQXnep2xKpuNJOF@vireshk-B250M-D3H>
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
 <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
 <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>

On 28-10-26, 16:39, Rafael J. Wysocki (Intel) wrote:
> I'd expect the driver core to pick up the series as a whole then, so
> please feel free to add
> 
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # cpufreq

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
