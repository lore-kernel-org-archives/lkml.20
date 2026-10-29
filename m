Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237631;
	b=a7v6+Hea1di03KGTTKqFlMo11v01lFqu7BC+iskupLo4a1wG9/YMRxkiYbRJFwE0NxB8
	 uSEe0lRj8H4Bzc1AkHFsOyR8OARP6J50o9wVlWQwPRnobzVNK4TroNvVgk63OLZ0Qr7J3
	 HwRnUPJWgYUIFXvmHlannh1WuxFrAKNAmaqryuS0/bVXOkjRrfC4aRzlWPaa/t5loxcEr
	 gMJnh6qTqSLH4cfGwEsIODMkF2hfoDJITSQCriy1nE3UjQGzJYvoMf99AWET1hcoHOKBr
	 moognfe4tXi10UW1xR0DjugSDPqgdxpN13UzSluxDLCMso/at7AYMvFW3W1z9ojl0yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237631;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=a7rbOhwPi4sLK14hPJS6IvXt3+PLmFcdLkquk6t1/r0=;
	b=AuaUZqibtOqD4Q+HZ7j06gJQi3LZ9uurptCKlnjHCeFBV+hhRqcqYJCnqBCMwy1WDW+S
	 5Do9HsHyznNadAylWXtfv2+pih96omLvF0j1AvbvQDRWIcPV4jMRiGPHIkhZofNf1kod+
	 ufxQpa1NeNIHdOiwHrgU1NF2tm4V74Hl2sjcLLS6PHsxCI8rZ6m1DmaxiDdbEHlIZUIJC
	 lDEJ2Toc61Tm0lG9oDiwYdZBkVF4V5A12GlXasDGbqXgIW9zAr3Y/tDNK3vu7bdGIuzVS
	 qxtUqnbih38EDNddoIOM0DcM6rvhzwRv3PkNIBczMOafXZihh9t7KaYO6pepNV7sn3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jka1QTng;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jka1QTng
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF95C1F01825;
	Thu, 29 Oct 2026 01:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237631;
	bh=a7rbOhwPi4sLK14hPJS6IvXt3+PLmFcdLkquk6t1/r0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Jka1QTngbX9BTXQMar///2PfqgFfgyWQWTagPZ56/t3RPENCMZWLBN08gGYcxfHXg
	 egBSLU1cCFse9ncI2N4wF4oaGOX+HW5EdgR0GtHI4bRuxsaHudAAg2IZfL4oMPLB3r
	 h88GMuloMwAJxYmBbraw5k4vVeGPoE9CQoZ+U7l3rBdbxjwSDh+JnXxgiGKpg9AxMU
	 9tJ6tBQfRKROdksUUCFzzH0AzclcAWRx89GZK0S0a5k2/sCpY6M3bEkLnom4vn/qIN
	 ZOsEuBpP2qvpTZqLphi6cUQqqQsFxUozK3VSG16DMWQG+J/T1TtW1PSsBU3fh0UTbz
	 b8eaSayVf22OQ==
Message-ID: <e06a8219-3ef3-4b08-a6a6-235a5329516f@kernel.org>
Date: Thu, 29 Oct 2026 09:33:47 +0800
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
Subject: Re: [PATCH v8 10/15] f2fs: support partial uptodate large folio read
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-11-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-11-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:44, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> Buffered write can have write bytes smaller than folio
> size for cases when folio minimum order is not zero.
> This can left partially uptodate folio in page cache.
> So we skip uptodate subpage read in read_data_large_folio.
> Also mark hole subpage uptodate in uptodate bitmap.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
