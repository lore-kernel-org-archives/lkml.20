Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785695;
	b=PfP8DJvr6umbAO9LtPTuL79CiwKJ1ZAXcsMD1uTzFPqMJoAyo5RYwY0UoxZafDBA96It
	 nWz3quWbHMjiqHiIG1oRuXeqxdMOFSc/O59JSeTE8638BZaMRIJOvAJ5GN+Y4pjha2GCg
	 547GI3qJ+YmffhHYcHxjQT9atkLR/PT4Q4iDP1H+gvHoWZEIuf8O38MUHIEtSPMCHTiY1
	 vZcQ7zG43bS5h2ivtV2tSHjFRGDlNkzKvSXvIWIl0jHvJq8cn3yuHrd7pGo9BkoUHi0JA
	 ncLiz5KuclQTMTySQ2oWKMHu3/Ot6o0N3pSsCLgqCR5pARan4K1z8mZxExgKap/gwJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785695;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HXzV35Z8UwpB17ysmZXHbQ0RRCvEcx5jH2Iaw9wScdw=;
	b=goBCpOZwWZu6RL55EuUpNTfCAYptVhfOjdna+Sy1H0HQXdw/vIsAnDgCXtEHAUn8r+fU
	 CPxxHojDDXIkTARJ8PpPxY0+tb0Ql7vEUY2nthmWhvSb+NNEinCn1y8V7AXEhOW60LmNN
	 j6FphnHar1LAKElC39NCUV6D0IU4C4SlCQyX2Ql4xiWLk7FMktLJbf3ZIoKVkikNRbkK6
	 q4FcMkeOz7q1IGOxmNhMPcTuPgiZwfV6S83bVwjM4z2yTBMLRKTi+d5wMRYiUFjZpEC4z
	 72o564koVtfuzNOQKXwyG01b67iJc5Jmot8uqRuMkvmjxFiQAUhn9T/r87IHv1O9Sgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=InY6wC0L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF9A606A33B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=InY6wC0L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9089D1F0093A;
	Wed,  4 Nov 2026 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793785695;
	bh=HXzV35Z8UwpB17ysmZXHbQ0RRCvEcx5jH2Iaw9wScdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=InY6wC0Lu/gE1+Uh9tivct4df3l9zhQNYnbCEA4+N7iJzhya1BjWHq7875hXbMx4i
	 JSOVZ5adapMJadDpAl1T/blwxthLNJSOEA4t4EVO7LTnwUxSQknlv9JvKz/3z8f7av
	 KYCJ7mxw/uUa9lvseLUNpsV+sEpSqq04qJJkMJS0aBkatvZ32QaEI/gCyICcnTkGkB
	 ipEgO9WNm2noUsomIFuHtMj1kbeeoJKeKCEwprSSPgfc61IYJ8Pl8bvhgmCa1/YM3m
	 pRdTX7WUeZ9fKYV8MKpHLCYG2kwNqW4v7BFC06Zf5LZaC7titPk3Z+Yl8jLsO7dz0Z
	 DPoLcM769tPpg==
Date: Wed, 4 Nov 2026 10:48:08 +0100
From: Gao Xiang <xiang@kernel.org>
To: daejun7.park@samsung.com
Cc: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>, Jingbo Xu <jefflexu@163.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/3] erofs: treat files shared by inode_share as
 stacked
Message-ID: <aur_WN7z_EnoYSu-@XiangdeMacBook-Pro.local>
Mail-Followup-To: daejun7.park@samsung.com, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
	Jingbo Xu <jefflexu@163.com>, Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261103-erofs-fileio-bioset-v2-0-5b91af423f72@samsung.com>
 <20261103-erofs-fileio-bioset-v2-2-5b91af423f72@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-erofs-fileio-bioset-v2-2-5b91af423f72@samsung.com>

On Tue, Nov 03, 2026 at 03:29:32PM +0900, Daejun Park via B4 Relay wrote:
> From: Daejun Park <daejun7.park@samsung.com>
> 
> A file-backed mount whose image or extra device is on a block-backed
> EROFS passes erofs_is_stacked_file(). If inode_share shares that file,
> erofs_real_inode() may pick an inode of a file-backed EROFS in the same
> domain to read it. File-backed reads then nest in the same task.
> 
> Treat files that use erofs_ishare_fops as stacked.
> 
> Fixes: 34096ba919fd ("erofs: support unencoded inodes for page cache share")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261030-erofs-fileio-bioset-v1-1-caf47adbb3a3@samsung.com
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>

Reviewed-by: Gao Xiang <xiang@kernel.org>

I will address the first two patches upstream as fixes in these two weeks,
and then review the remaining one as a new feature later.

Thanks,
Gao Xiang
