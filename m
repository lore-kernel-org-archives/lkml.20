Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620927;
	b=lycTDcy7bk0cx1SItPJj6nURVsTZUD9o328gvQkaYszTMGIXzf2HV+N7CIB5MC3YKeFV
	 GK8yvRPEKI0Xzhgt6LuEr+UkmGtTWVdGmZaVsCWp58VosbKOlxYcrr7AM7QeHEfDdjy2C
	 VVEIRRmfMyNyCODIoHPTD5MQlEk//6MCqLSh7FvSLIkygYsGJa93eosCo/Is41wbsQLGF
	 6xqkE30yI9XzDOggKY/xbARYfOkFDNxr/+mTFOpnfQ8CYlnUU2nI7K9SpY0RACPlK8rlK
	 6LONdgkcWo2S72nGVmp3DTXEO93t/TVOUXV7VTGpKXlEwa2f2XlXZqR/Y2cEeeM9N7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620927;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gHY1puQJ7kSuZAenvzMMAkp9lfMXsFJFMUTGckGB6U0=;
	b=WDHhpRYhX1+czBcc5edWWDTtJZJ9i1/tRFMUzFeQrUXvlst47psZtngLi7WY5UdW0ADS
	 k6GQ+mnUXRZcXnUJ3tdc9hBdD0Nn0mLL2ZDtk7SF1ikeJoCceUkNl7iOywLtunTos5/yl
	 VJ2l6flwArPRgQigor6fiw88vRd58NJ5pduT2FMvrPlWoQ4MCIrWdLkR6QTTP7CW2YEJM
	 9VUazLNb6ON19TjlYs5qqrpDBfedOLNQFZhm+3S2ol6JIN4KcFGD9b2WwAnDs0gT6TwZp
	 1BWCWk2b+q1/X4+F+5MMfXfSKQL0pfdK/RkyBrFxkBc9D/PQtoLNUMxfIK74GRHImKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hFqWJ6xb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB69606A943
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hFqWJ6xb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089F91F00A22;
	Mon,  2 Nov 2026 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793620926;
	bh=gHY1puQJ7kSuZAenvzMMAkp9lfMXsFJFMUTGckGB6U0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hFqWJ6xb8+YNk2t4sqrI8V49VwC1ky8tbwa60SzI20Liy9keur6iv+zgK/Z5jBGvp
	 VEN3IY914EIWvC2X3C2X3PjLJoDWBL+InxYyR+XoDpNceezLVm265BrBAA18IqxmcT
	 FOF491UKbf8ndlsXtIx83tfjGijOU7Sbtq4Y2Gue7Uk15pgY6Jv+jDwkZQ5DEB5Sn4
	 tI6qQy3ac3QTS9SlsKWAQ0L6Tm8CRpjamtFKFFVzRcG5Ygf6Cl7IEWr7d49axmJM3A
	 xP4KCGJxwFpDPvPNtKMq81V67IzV0eLLISziWwmjNfWBYwMKuNXKTYBjqhZYm4Nj7Q
	 HrJ2r5cE5Rjvw==
Date: Mon, 2 Nov 2026 13:01:59 +0100
From: Gao Xiang <xiang@kernel.org>
To: daejun7.park@samsung.com
Cc: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>, Jingbo Xu <jefflexu@163.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: apply the stacked fs check to extra file-backed
 devices
Message-ID: <auh7t-KdfKXhUAUY@XiangdeMacBook-Pro.local>
Mail-Followup-To: daejun7.park@samsung.com, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
	Jingbo Xu <jefflexu@163.com>, Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
References: <20261030-erofs-stacked-extra-devices-v1-1-39f7df7ac01b@samsung.com>
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
In-Reply-To: <20261030-erofs-stacked-extra-devices-v1-1-39f7df7ac01b@samsung.com>

On Fri, Oct 30, 2026 at 12:52:44PM +0900, Daejun Park via B4 Relay wrote:
> From: Daejun Park <daejun7.park@samsung.com>
> 
> erofs_fc_fill_super() rejects a file-backed mount whose image is on a
> file-backed EROFS or on a filesystem with s_stack_depth set. This
> bounds the nesting of reads. Extra devices given by device= are not
> checked. File-backed mounts can still nest through them without limit.
> 
> Apply the same check to extra devices.
> 
> Fixes: fb176750266a ("erofs: add file-backed mount support")
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>

Reviewed-by: Gao Xiang <xiang@kernel.org>

> ---
> Tested on erofs dev in a QEMU guest with KASAN and lockdep:
> 
> - Blobs on a file-backed EROFS or overlayfs now get -EINVAL.
> 
> - Blobs on XFS or a loop-mounted EROFS still mount and read back.
> 
> - Lockdep warns about devs->rwsem vs i_rwsem for a device= path inside
>   an EROFS mount, with or without this patch.

What does that mean? Can you explain more about this lockdep issue?

Thanks,
Gao Xiang
