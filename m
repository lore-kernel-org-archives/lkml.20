Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237459;
	b=nnoqR1peo4+kJXTbPLRH2FnkzeC3TqspQwIQYSrXbfmqz39y2uz8kbNziwNtOp7yTcaO
	 UtcYZwzFfK9f/2vHa5u9LYt/BYTaDMJnMabzhvCa4wRuIRHGcsIMHHZqrrCiS2z3fqFDN
	 l/nW96imcBfWhpxitT+XFcFYG0Uc6CGQ/ehT3uVFwknzt0yAkIXRKODDFP4hf4dboMiNj
	 S22xhCv7c0NRgP5rUrMXlwnF93kqt8IBiMPtA1QvHkTfk7Q3JthpozkPFZlO4AZuJYARK
	 +ZBXy8HEreHfQnLkYs5RfVJdTGmdCCLPvhOYjh9YnqTiGuBqjC5DRW3jXyChPgZbqng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237459;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=q0ZKJPgJU67rNrM9GQ++LxkEhkMlTwB29Xurgfacd4M=;
	b=QPbCr9zwnwlnYg4ITHNWh9wlIg3+h2LbmP/z8Npz0y6KcHLNusWVA+SvoyBoUVbKKgij
	 lbD7RegOdN2Ugbc6KK/Fzi3RfAROfQISoy4kOzU7WJFOlpW9NJVX0zrAQJrnvCqlB4lZk
	 w8GatDGtnMUzeQiaBiK0ty3ZcUT4X5OTeR0x+YQ4NgDEDCQ8FkVNLnah8gr2SN8lJNDC3
	 32i8zYwn+feh+CMs+v+j+y0Ontx4/LpwQoqWm3Giq4asWVdVBgl3CfTk/qm7JxTJbafrm
	 OIXaNFwaC/tWCa0c3FVH1lJbKF7zWSzsbDxVDUqlai9O0eKt7QuXIFbXUjeYIVwznjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8SlSu1Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F27606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8SlSu1Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710C81F01828;
	Thu, 29 Oct 2026 01:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237458;
	bh=q0ZKJPgJU67rNrM9GQ++LxkEhkMlTwB29Xurgfacd4M=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=g8SlSu1ZZkJva0Uk25sxluD+zl/3O4xzpnYvBFwx5q0DeS7PkPttgHY/pXuGpUuKn
	 Tn+Sc/s6DxfCTsItKLsYRtY6VWpkwJImXq4WH+NWo/8FX6yYFP/ouyUT+Ra7VtqD2o
	 mPdgodkplIWlJze/u8aUtnXlMZNe4ZVjDJj15ZLYPru7QDSe510nMnrgfWjrqOxUth
	 M4p+DO2pOE4nlwBneezQADzaZ7uhxGuEUnrVbPK7nieRLyqf0Axa6nt3eOEBW4cM2U
	 gfc64Y9xiBYdp7S1YUtjI9poujqfo108loY6ffrEDulvZj+txopuIfCjBzZmO2dFHi
	 DsUq8e8xBpAFA==
Message-ID: <50b8a3e7-a779-46b9-9238-b1e345d03841@kernel.org>
Date: Thu, 29 Oct 2026 09:30:54 +0800
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
Subject: Re: [PATCH v8 01/15] f2fs: extend folio state for large folio write
 path
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-2-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-2-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:43, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> Large folio write path needs a subpage status bitmap and write
> pages pending counter, while keeping compatible with f2fs private
> flags.
> 
> Move struct f2fs_folio_state to f2fs.h, add private_flags and
> subpage state bitmap, and change PAGE_PRIVATE functions to be
> compatible with f2fs_folio_state. Allocate f2fs_folio_state via kzalloc
> instead of kmem_cache, since the state size depends on the folio order.
> 
> Note: Now if a path wants to use f2fs_folio_state, it must call
> `folio_has_ffs` instead of `folio_test_large`` to make check.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
