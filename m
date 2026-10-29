Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237476;
	b=Jdr+scicIWnpINFIvkAia7U1uisLsIbm1Hro5PbvPtX9O/oj58/J6K8QZx0mg+IBi+To
	 S1Pzv8aJ+8TH5FXRA/ORTcQ2k8pmjT2W/71/aSH9YJW8NaBeRdxcS1FktcWUSeR/nhtrd
	 uA/DCZdXG2H019z45seR6lz6+WadzjYdP5PL/FBnMqR6BObJsaZJVbF8mG6BFz1I/4Nat
	 uNSQFl0j+nddCOeUiFVsSK9QNIuR6qAB6Jr6mRt89zaXUulQxpEn/Ced9SCNqX3pgUak8
	 wS6rEdWWc5z6ybTLGjQVXyd5qThQHokZEnGY/UDbjZ22y+AbbRQmeAb2YGFaJ/MSRVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237476;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zF1LbWjI2Ky7xvAGGgZGckaS30gdrfCaUY7oUIJ7sFM=;
	b=kIAiCs6eI6Gef22QwGb4rREyX4ZZaRznRlBvSQX74pSpPaS16UvX1RatsF9zj7zc9kl1
	 H0xtdQ6D/QPv1/9UcnmmvyEdYRFyM6dxtkYfo3WRQcMG73Y7AaB0na+E+zsWokvdODdEy
	 sA/w0ybHzD8KWbFAn1CTPi2UQJW7jtbKYgQZ5jwzv8kEaHsemlGNB75InP40xUjNI2s/Z
	 VOZY6MFAckhZdBtPSm/zWqLXg6z1Fwch/kKTIG52FTGDSjzQM2/i5JST967ubUdnoL6B9
	 2mBsA3xbseP+vTP2UNt7d6731wcyIgWSejv1dxBsdfBek2NLM4yXEWPc7h/bS3Vkxrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=goFftCYb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A15606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=goFftCYb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC8B1F01825;
	Thu, 29 Oct 2026 01:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237475;
	bh=zF1LbWjI2Ky7xvAGGgZGckaS30gdrfCaUY7oUIJ7sFM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=goFftCYbm+xFWsw2EfmZUDSNNOMR0L6I8n+g48eyn2L1FQprUtRwecj+YQWjMV2wE
	 jMBvqC4EZ9lb2DuJRLeaqPADeEXFN/EXDOh7bPan3sHiB3op40Ccp9ajHSckkyrW6C
	 UEk/+uY1kuCTjYLiIasIJrOn8GUjtBi1CyPZ8tsrCgv8gIAe+utW2k0rYix1rqblww
	 UwuQAAZC5kdgRt+9Kqo7mDKWdZ/6lKBQ4BdA56boChaC1Gh4r/J1xCyhgve6FMPZwB
	 eNasXBCEKz0NaIE4nKp1LI2tHx3RpdHBlyq1MHAsVWdVR5dOhI3EMDos8Y2eFPy81m
	 VOpq4ZJt45ViA==
Message-ID: <78d734ed-55fc-4f42-b85f-79dd1715555c@kernel.org>
Date: Thu, 29 Oct 2026 09:31:11 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v8 02/15] f2fs: carry subpage offset and count in write IO
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-3-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-3-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:43, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> Large folio write paths need to submit I/O for a range inside a
> folio instead of always submitting the whole folio from offset zero.
> Add folio_offset and folio_blkcnt to f2fs_io_info to describe the
> block offset inside the folio and the number of contiguous blocks
> covered by the I/O.
> 
> Apply the new fields to the bio submit paths that need the subpage
> offset or contiguous block count.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
