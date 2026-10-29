Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237494;
	b=MGLZ9/Kad/gLSKmavryaP2E37ufZ/53BAzeH2Uxoqk9evVCGmwuBTqWqRCTHBmkAtDmU
	 iq3zsqN2GBNagm2D0EYVgrP4Z8BMIl6mY21UPuhzdJOxS9n83uDUGALLJF8sKJMKTuhSH
	 bWeyNayfJ6MeJN82VlsxBVwfgviTrLjTqxap1hPsticDXF+zjAWKh3xDFLP2MtLPV0tSr
	 wUnW/JMejXBuSwmQFD9tpj9NkXpcMfDboa8EmVoifsnKQ79r82DuG6rS3pPhPhnSzF5qx
	 HLs3Cx914JwRRaT7ERrmPA++a//LfF+alwYHs2nFeoQ1BUzkrtegCon1804/1CglR8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237494;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QzvyD1MWwWcM2D8fVR9Ay/l11ugYd2Yxj3Xl2WNQqh0=;
	b=1ZrMPMWWnujz830+EmUy2CTWn1wdCSSejn/9CW9bT5VFUMkBdwQmPUI12rGixIGHrebn
	 PD2VNg3OIslQEw2YZWwOJVyCsctnDAtfyj7Jn4Wmb7jiGC9RLZEmuKVio01g5GEahBH39
	 thPbEi5qAgcFQAIXorn6AFh8iOOGofq1lkZ3CqelpvObul4sxRoj7vcohriiCBUI0NVR+
	 wS5cRHpIR17Hbi89T4cFCpb10XV6tDepVl6midMY2Q+KYfA205AwmJFUdEC9dhXQp0Gus
	 6plBuT2fiKr29KCGgXJzfebQ6nzNmccOq8dLqadjGbWpn0fdi2NrzztCHUhcnRltKYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwNXv2Aw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CD8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwNXv2Aw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5E71F01825;
	Thu, 29 Oct 2026 01:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237493;
	bh=QzvyD1MWwWcM2D8fVR9Ay/l11ugYd2Yxj3Xl2WNQqh0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=nwNXv2AwDdbRNxgOxIfQyQWuDY26T9x0FUi3X+Mo2Ij2NJe8itQw+LXcAYJGCL+ez
	 jXR8RsLUn2ZawimSuV+KnA4Ze/Te2+pm//cB6X0Uloliy79Me+LhpCES9pFPbL39ba
	 ciMiPWcZ3MXiDz/KzFii302RYJuesDXwZ4HZfgY0J2Aa5QtYU870FUJSYyTry3P58n
	 0b3QycGtokkQEauUoyhD5RKXeSy5g3c3kzaeMZSaAKdZIXjnRAc5Rb/oDA7k7bUGIC
	 AAp1HQTO28tn3NzxjK1l//GrcltLB8n/2qMctkqDpXlhDRRmlRMaVH/200Nd8A9CNS
	 xbXUpJ69lSLnw==
Message-ID: <5a644470-f8db-4de6-96bc-becda4dad88f@kernel.org>
Date: Thu, 29 Oct 2026 09:31:29 +0800
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
Subject: Re: [PATCH v8 03/15] f2fs: support regular file buffered writes on
 large folios
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-4-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-4-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:43, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> To avoid the complexity of unlocking a large folio in write_begin,
> preallocate partial blocks for inodes that can use large folios.
> During write_begin, read only the partial head and tail 4K subpages
> that need read-before-write, and skip read I/O for the full middle
> subpages covered by the write.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

