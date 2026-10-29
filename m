Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237549;
	b=1d4xAKeg4QTOqS6WJWTPZNLiwjDZvGbaGRUUX5Ao3nB5KUBurCVUSyvun5k5Ry4MfaK6
	 xT2tv3n0Mkf8NJB8NJe3YBcoFz8pyxeGsbcA5cNICNGc2G4HWuQxYNO0NoqDz2st2hm61
	 t5+ME4b+nhNToa2zP+Dk46giB8bDrYblgWjGayOJ0LElbS8YRAdse7baiaZwKP1duxC2I
	 pgthmYdYn8bnMU+dmFzOvclYU91SGqw01hWJBWwqjuMkR0WUYsenxcKhVokz+ijNFoeTV
	 R+yEfdSOtDJqHOlfrIE03n5/w6Ghs4Y6jbQuRFkxQJJ8J7M6lZ/3RoRp77fsoScT1xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237549;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=15Ra/rwdO/Kadg/p8Kzkk2D7noAWdrRG1iepoM3Bqqs=;
	b=Gr3treejVSKHjhgf9OhbrhWiZpuQM/nv4EYtu2VHRXe4xC3rjTLTAVgxSl6p5x9qjl3J
	 8EeG4sXQAgUdo6+zukeXrnbVRFkJCewHVZUXFr19j62fr7BU1Ot1w6F52Iw8MCjhugd11
	 Gaifxjwm7so96FGuKh+TO5II6XG/WvYFa5f+x2JwrB4ZjBeNcx3qZ4rgl06X+MpR0W9Aj
	 atF97Rwnk1ERTVuVG42ZujyJL6MHGaV6YieXwwlCTRJ5R40thsL5CryOFk11ykJtRdJnw
	 Bg7iu5IS/mNYrh8uLzeA3GfrB78KcYIY0OGkP+UyhX2HitVAbp9028pO8ByClhpcvtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWPGoSjk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWPGoSjk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A3F1F01825;
	Thu, 29 Oct 2026 01:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237548;
	bh=15Ra/rwdO/Kadg/p8Kzkk2D7noAWdrRG1iepoM3Bqqs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=OWPGoSjkJAl5EDFwakE/PvpPSCBgad75UHQG7YIE7Cj/PQIBgVXybVVdZbOKJgGwW
	 0l8m0EwKgBTMWfaSZqdzQi8nC0Np6geZD7yiVkvcy2BqrSb/jCYAslrBU8NLB3n4hT
	 CDqSTmNzfbgo8p0MYEq1SlEHHztgJvBcJQeF/PV8RhRB+ivGhK3CdGbSTPEka4/oNF
	 UE8wAXd4PW9+Ef58af149R+STnhmU263EeCHaqhp4i2Aaxuv4QhekKydG9BwpZHmW4
	 m1sbJwwZLvlX3N2qJvcnHWd+/N2FgGLr0JSQHYLV4TlT01uOpwCCVFzYmOJvwD2wLo
	 N9nHHiT+rf8pw==
Message-ID: <288cd311-055a-4116-9425-133064548c96@kernel.org>
Date: Thu, 29 Oct 2026 09:32:24 +0800
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
Subject: Re: [PATCH v8 06/15] f2fs: account large folio dirty data at block
 granularity
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-7-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-7-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:43, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> Originally inode->dirty_pages was accounted once per folio, but f2fs
> needs the counter to be accounted in blocks.
> 
> This introduces batch dirty page add/sub accounting; for a large folio
> the changed dirty page count is computed from the dirty bitmap bit
> changes.
> 
> Found by f2fs/006 (lfs + checkpoint=disable) and generic/363.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
