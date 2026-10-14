Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2894AA1EC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979591; cv=none; b=NXYPEdHw+tjAYOWu/MZjDzC8BuRB9NW3GzcUUC1/nNUaqg8QN3AnNCRFVnODQJgWr2Lj1TckTYMJvYPuJ83gq63+vxoLSJLAoex+4/9W6QF3SupQQVhsWKUpihkzgHckxmzf3cThoSNmfuNRvcqPEoDStT55wxQrtPTU+tuymVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979591; c=relaxed/simple;
	bh=79oWpjCCcLv2DOL8Zc9zaY14CCZt5glhmm0B1RRRukg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OgMYOh2SpMZTXb8KRnzfZO/QaU56RmdQHSWX1fcL0I/r/utMQXz2NVkLYpZPrV0JNzhAGbRzOGyySmIBwIGSYDY4Runp+R621xcLoCm2UCesGYRaUv62m3zy/l0awpaskhsI5LiIgKLpt4oRSyIrbFMy4p6+cc4AWbel3dpnslU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k25Fo/BT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k25Fo/BT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0722A1F000FF;
	Wed, 14 Oct 2026 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791979589;
	bh=UOKoeE91QC6wHlg10Z5WINTUk2LP61/1hj8/SrQfMlM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=k25Fo/BTJqRN8wMTrL2GokCqB56I6UZMJfYKO+1SNvTqdx/Su+uO/JNTZp5lsndV7
	 wdBzrQuTBcEFF5GCvRSdduKX2dWu5wAhKTh5vaeEfeQqn3Yt22JNGttWRxy4SXNms1
	 yy3nV7+tIyneAJlvXoNg4voiwfjzCEM0Yjn+v6vWR5Ci2AlTqvXqkp5S3IMpjBZvmE
	 L9dEanAwHCYO54rp86lTeP13cP9r/zKXvr0qRiDKin9mo6PhHQpgL0oaQXAbdtaikP
	 2TpRdju9kDlaj0EoOL4SekyLIP4GjAAthScAeW4f+pexIo3NNtzFTmMmMVZ83ka0V7
	 cNPlVl4aja0vA==
Message-ID: <6fd7029b-f0dd-4b29-b480-3d9c4b113bbd@kernel.org>
Date: Wed, 14 Oct 2026 20:06:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Xiang Gao <xiang@kernel.org>
Subject: Re: [PATCH] mailmap: update entry for Gao Xiang
To: Xiang Gao <xiang.gao@docker.com>, linux-erofs@lists.ozlabs.org
References: <20261014111504.48355-1-xiang.gao@docker.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261014111504.48355-1-xiang.gao@docker.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 19:15, Xiang Gao wrote:
> I recently got a new job; update my mailmap entry to indicate my
> new legal work email address (though I'm not sure I will use it
> in the very near future).

Congrats! Xiang.

> 
> Signed-off-by: Xiang Gao <xiang@kernel.org>
> Signed-off-by: Xiang Gao <xiang.gao@docker.com>
Acked-by: Chao Yu <chao@kernel.org>

Thanks,
