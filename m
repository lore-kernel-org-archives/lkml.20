Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237511;
	b=Nqp3LkvOoNWgYeex0F2ntMSET9fSNl3LIMMeqg3KDAgvkYJVvhl1YnRIdtwRqDwZ0RRE
	 3wdQkWhUbiy2CkZJld14QK4wFWI1Ceh0zIvRzsMFSvuH+EtB8DVwaFUtzHD5ZaIKq7AfU
	 nRC3urMvDyeUkaGnpRUZRcvQJfezBZ5vBlcP37IH6/bId2dw7BjN1D0PuISeuMK/Ofa2I
	 1JmF02wXpZd7IL6lm33Ylj2e7EMem+P/GYi6UZTUPQ/ylZz9g97Yc0kic1RLGWagq06mk
	 NbOA4PO/UZdjWzf9up4x4nWpnm+n89wK7LbVg33NyJqfauFX2yZj3xQLzCQ07p459pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237511;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=35RtJRrcug9GhWpJmIM7ZP68rxkvgihcbPPiLAkaQ8Y=;
	b=DU0Ry5aTUPz7d4K5iF43/1er5sEWmPu0cDP7Gwc9g6ZuxiW4QDeK3arqh05vl3FvOap+
	 opZbhLGedulCUDcE830YoXcq2szufk8sVF5oPNfSteDZXbUhlD9RgweIhd8RHcPx6kNKq
	 zl5tZEt4h15VEY8anRAN0jddlCAp2xE0g7dmLsLJ1U+QZIgPFgcU4obA8y6wY/rxUWz1z
	 9GlDYelVERg6Mp15Ws3zMPodjOFUTxPDOlr46xwoRcBHoG75xnPGlh5MjHetyU31f3DRc
	 KsKGv3FJJgdgH4EQ+gnIJ5cPVcjxCTyhVpT0x9QDaBFt4fxGDp7aI56oyLkjrka+elQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ad/Zd2li";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80A3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ad/Zd2li
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60551F01825;
	Thu, 29 Oct 2026 01:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237510;
	bh=35RtJRrcug9GhWpJmIM7ZP68rxkvgihcbPPiLAkaQ8Y=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=ad/Zd2liOx+7lIQwJfkevl890cKDoL0oJdZoYxQI9dvmVpXcsXfss3QylRJ1Pm3rv
	 E4m3uGrXKoCXrbhb4LBHw1+fQpsCP45/EjamTc2Rtu8G9LolOrlApI9AgKQ81Wd5Ul
	 lOaMqtKCtkRowns4q+OfnLzKzJhFYc8TfPtEAxhATM0U2gyVkDqNcwkjQu19HhFiLf
	 mUdgcI6+xxX85p7j7kwQnyTnGdb0wP5eUVEs99VwnaduU4QV079osUd5MtL3QQTgU5
	 7DEEzz0zTmIUuO6O7WGrjSEa3P092pO7xFrw7TDjazV7KHYPLUgqqn48qwXnCnglAS
	 gM9rdScqFn+DA==
Message-ID: <6c9275d8-6819-4758-a36b-28c3256134ae@kernel.org>
Date: Thu, 29 Oct 2026 09:31:46 +0800
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
Subject: Re: [PATCH v8 04/15] f2fs: support atomic file large folios buffered
 write
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-5-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-5-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:43, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> ioctl can convert an inode with large folio support into an atomic
> file. Support large folio buffered writes for atomic files as well.
> 
> Add a large folio atomic write_begin helper that reserves COW mappings
> for the write range. For partial head and tail subpages, read the
> existing data from either the COW inode or the original inode before
> marking the subpage uptodate.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

