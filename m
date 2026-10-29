Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237653;
	b=xN/1pCdG4RZPB1aIBcQm22SW0tQH++TxeozYaW9oTnaV9q2qMukbAVPBpQ2RPi+38ucP
	 SClGJd1QoRY6XHaUanMiWMWCkKZuQ21ffnEbYoSrnaEZO/Dgch+h4pQYp/kdms7jJa7Z8
	 oYfgXUxQsbGxJB3x1P9wnTY0WP9rLZD+/iFtHa0z1kbL6zuC2y5wSFDRFRbSOmemO2Dz+
	 5tAmeAOPr5qoeBPouq5B9tpCb0cPOIxbe/hmLXHRc47XVY4G8feu/il4RNwlJdkksctQq
	 lb9R36tJAyEKM1MqzyUJJkBeeoEa13QRat+GTlq7+BQlk4COMoRd6dLZRjtXcItcv8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237653;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=g3i67qdTmeI4QwtWjq2CBi54hJqSscZ9bcsHrw5POxY=;
	b=zwjaoHpHI7lrPIhf2aF19TzmRQTeus2fKi0scobkNA16pZaJtAVHW/USACl6+lzvzjbb
	 Bbzbe0T6/qOmA7hfbSK2Y+SmkFqTgVlhxFiIshjC+2rRDczOoKLK/d58WDWU41kVn89s8
	 DMRGlKaqA6VOhUKt2rQnoHG9t2FyRqRgl+I6dHwbrfwP5L0HvxIptWl+CHA1PmBV87USl
	 J4N48qeCTMGRvkU7h6MBvXGzgkKoninaVwNVGxk/2WYBHjaQS3krx3DKNU8w2GqnO01Jm
	 Y84Q042KYgVzBZD2t2us4q7972gwM1/sfokPxwn5clWQT3/TIpCI758OCE7vL/cLnwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbyCPu5J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6C7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbyCPu5J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BE21F01825;
	Thu, 29 Oct 2026 01:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237652;
	bh=g3i67qdTmeI4QwtWjq2CBi54hJqSscZ9bcsHrw5POxY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=RbyCPu5JUZ/Se4TXJsHTpuXrqIakttrPppgqJXRlN+RxfWJxvR20youROmC10w5hW
	 OQJ/2XZPIrrlWbXpmSS3S3+x55pqoFBbdhFiBZfwDcL54TksyimIcLzCR+wUMhFx5l
	 4tkgOAosO5USzMobFWOr6lQR2F7NRkDdSzT9gWWMPe9coLO1w2ix5yHNMH4TVp5x3j
	 wOTjj6JWTCqjRNUQV28QD/RU85UcuYhLgg2P3PNFf2fCWEmyDpR7q/8jRJ3gWljQQ+
	 GSYuXnQJptNmG4DLURK7BaO/DFsA7XtYZmqhAPkDZBiH8qFB/OeUxcmv06n1xqeWQL
	 +nxVMnArhBJsw==
Message-ID: <a6cac17e-d66c-43f0-8e4e-cf00a6213b68@kernel.org>
Date: Thu, 29 Oct 2026 09:34:08 +0800
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
Subject: Re: [PATCH v8 11/15] f2fs: handle partial truncate of large folio
 dirty subpages
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-12-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-12-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:44, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> A large folio can be partial truncated and stays in folio mapping, we
> need to clear the subrange dirty bits and uptodate bits that the partial
> truncate covers. If this partial truncate happens to clear the last
> subrange dirty bits, then cancel the whole folio dirty state.
> 
> Also add a guard in f2fs_write_folio_dirty_range() so a large folio
> subpage whose disk block was already truncated (NULL_ADDR) is skipped
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
