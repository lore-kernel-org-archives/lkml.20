Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484DF28F5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788316250; cv=none; b=EnT4ksmDb+EV1wnxRgJ/Zrhq3oQXlA8Ze1Kin8PlAzBaOUhwODb1YbPwfaX/8Bv4na557lDw0nQY/LFOvqKBb0chA51IPV8mXYwunk5jDTIbkc8RCToErA+8SGb2LYvZvTsYGu56OWGoG/QjLiJ5PuaWvye7FZllfEcA6/9Qrd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788316250; c=relaxed/simple;
	bh=FxtH3ZtF4lLyMpinScmxVAqqHqb3NE/kLqCbh3A4CHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhGFtwuyzweGx86HpqDKXF9R5grJqnE2UMuOZS5htW1qGegu/RF2xTT52rDrMtNS+pom0QXw/GWknChN/eoiCMj3VTGlw5jMyzEUSCisuWU1Tbft3pZVsl5quKMUkrcix9nTzUyTqLEDFWDPPySpCLCvi/CcWd0fl0wEjW8JM0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvZYBXLk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvZYBXLk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6331F000E9;
	Wed,  2 Sep 2026 02:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788316248;
	bh=bmZ3zyXvqtCC4yEJpQ+fp7sbvP3sfAY6Z/LhHvL9IHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MvZYBXLkL4wjyheg6fTHnevdvRBE7Ds9Q/e/wtBt5/cpCfgiXnCd3STCy2+xsJbqy
	 i5QOv84fQ2wSAXUq/m+0UW4BRzdhCmcpWrq5/VohiIvu5Qy9TIsQWnD/r/6QpnRozf
	 Zz6/QbD6z9eK7foG5LfUO4/ddd5BOLRtVXOwKm3N4y97MO2c04vx+E91uScluUe+06
	 s3FQKcsdAgzLSzYp02QYHqST10bS9h6zoibfURKryFZ4Ryf8qo5TNbZz57hvBdusm5
	 tZAfiC/I51O1XBsaZKldgOnBTR+QyshwNsYYj4kJonXFW8KGrYTMM6eS8jk3YWOio6
	 2V7gxODH+yuRA==
Date: Wed, 2 Sep 2026 10:30:41 +0800
From: Gao Xiang <xiang@kernel.org>
To: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
Cc: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: preserve LZMA decoders on resize failure
Message-ID: <apeKUdpJhf_NlKR4@192.168.5.22>
Mail-Followup-To: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
References: <20260830104109.60639-1-nikhilgurudasani314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830104109.60639-1-nikhilgurudasani314@gmail.com>

On Sun, Aug 30, 2026 at 04:11:09PM +0530, Nikhil Gurudasani wrote:
> The pool-resize path frees each stream's old decoder before allocating
> its replacement. If an allocation fails after some streams have already
> been replaced, the failed stream is put back on the list with state ==
> NULL. z_erofs_lzma_max_dictsize is still advanced as if the whole
> pool had been resized.
> 
> An existing LZMA mount can select the broken stream and pass
> NULL to xz_dec_microlzma_reset(). A retry at the same size also
> skip another resize attempt. Since the global maximum was advanced,
> thus, the invalid state is left unrepaired.
> 
> Allocate each replacement before freeing the old decoder, temporarily
> retaining one old decoder during allocation. Stop at the first failure
> and advance z_erofs_lzma_max_dictsize only after all streams satisfy
> the request.
> 
> Record each stream's dictionary capacity so retries can skip streams
> already enlarged before a partial failure.
> 
> Fixes: 622ceaddb764 ("erofs: lzma compression support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>

Reviewed-by: Gao Xiang <xiang@kernel.org>

Thanks,
Gao Xiang
