Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA643603DF
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791667715; cv=none; b=uL0FKSJot8SMcw3zx8ucqfdg/iKmqJmR4fRlfVB33iXYVLEWpoRnOjztj/VCVqb+Ds0MAprpHW0TxhpM9Q0N7s4ngBTtUkZXuknFeUgsJ2dBK1zGDUqmAchdDKDHog/a8Q2mInW6jy46Tc28hBOt/3EOWTHhUEhaDSfUEf/X0Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791667715; c=relaxed/simple;
	bh=hZwCdPORanRj+tX/jGD1C4mZw3+SoChXKKT8L9EC4Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uC/9RcRp7VezPXqGFPd9EgMm2sXE7+2qhs7zUZh8WIM3cWPxLS0wvfnE82YwJm/mHOQL8G/Hhw+eIAGDNRQwn2BXRxO5tlQUE2+OIXXdjDuBNHQK1Z/1Ofh/WGikowedmiPsF12qOec4YXWc+rz8bBWSF6wGGlmoFCSFuu08KfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdsEZHUj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdsEZHUj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF0F1F000FF;
	Sat, 10 Oct 2026 21:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791667714;
	bh=A0mLpUjsNB+/hFJXiSI4UsRTSWL1TE0IwIRugJLK2mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AdsEZHUj5k2pfgQnJLsW5C0VAiUQ47NxbgmMYVyZkT4qSu8taeA+hpoe8Mzvc0hrE
	 aJiQd7hSb/Icb+BboDTz+o5u4EuPajVA7vHyUxqwbrbmi2Dfb5uLOGjP4E+p2Cja5v
	 b90Oal8FTO6sgXK04XLEIghnLWBHrXCy4nKRy6qsG0Z3Fi+OA1VZq/XEFT7NBxwFIt
	 BMvrtp1cUiTYDkYBS+gbqCxkMQBR9I2khD0eUyTAcuwxiJjZA4EMduC5tvi3xh79N1
	 e00zvZnTxUPNxIoY3G6nFNdsIL/S/LoO2XA7+wqK4gnmwPjginQcme5c9woxEMPFZM
	 3r9PLQCTtKIjg==
Date: Sat, 10 Oct 2026 23:28:26 +0200
From: Gao Xiang <xiang@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: xiang@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chunhai Guo <guochunhai@vivo.com>
Subject: Re: [PATCH] MAINTAINERS: erofs: add dev branch to git tree entry
Message-ID: <asqt-vM6LOPyqz_p@XiangdeMacBook-Pro.local>
Mail-Followup-To: Chao Yu <chao@kernel.org>, xiang@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chunhai Guo <guochunhai@vivo.com>
References: <20261010070623.1766952-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010070623.1766952-1-chao@kernel.org>

On Sat, Oct 10, 2026 at 03:06:23PM +0800, Chao Yu wrote:
> From: Chao Yu <chao@kernel.org>
> 
> The EROFS entry lists the git tree without a branch, so tools that
> derive a baseline from MAINTAINERS, e.g. sashiko, fall back to the
> remote HEAD, which points to master. master only moves at -rc1, so
> series developed against the dev branch fail to apply there.
> 
> Name the dev branch explicitly, where erofs patches are queued.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>

Acked-by: Gao Xiang <xiang@kernel.org>


Hi Chao,

BTW, could we request sashiko folks adding erofs mailing list
to their review list as well?

Since some patch could not Cc LKML or fsdevel, but I guess
we need them to be reviewed by sashiko too.

Thanks,
Gao Xiang
