Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DA738E8A7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795608; cv=none; b=Jq9YPPnJxl1D5CupVpxVZsaeIu3n40XYKU2BXye9qUSHRiLaYKWBCFj34YTEyb99V6fZKphseM+Haa2scIhyPgKNp72rn/l7+iIKorDWd5VEXJlu/jtSuZoKy9lvCSsTL9z/grNEvGeGKoW7lCRCaSAKT/XTGCMbxNZc6cwVbyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795608; c=relaxed/simple;
	bh=Jel4EndZbXb8x1Xk/74XCyhNv7WEnh2O+SP3vcyl++Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFXs0Ma/lPXC1iwaQa98bf/EvpGWZMtYxkmGFi9BUVGcKx4wDFhBSS2tIKBn1iZjfdYZMGsYe3gP5nrgMgzSKUI27Rp0oYsU656LE2QOvswN5B4MF2b76DRpQGkQwVtL3NL8q2eXZAEkHmtxAnxsSU15chGTzCLBxCsKnnjXpik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=M1fjyC51; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M1fjyC51"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=UKKWOnQCcoGtayn2pHOb7G8xUo0f1QkdSYMBVmDE/fE=; b=M1fjyC513h3nWasF84ID/8yH94
	CzT/IvDHLCQw146LKf9PWfzJmPo1/gQf5Nhve0MA1acA9LgC6RG0tKVHYdWzux95LSH1YNSSZte1Y
	W1YjWEH+n5iT5YONetchrdokxM7u8ZMfSlqYn3zwVK2vZthVAsikl6iCOwiCAftjYMpLCn1sApcAN
	gU/ydiRMwptrw3IcLZ2qQsXdqiRBBH7Tv+KlbERnI4vB0KuywvhQzD1P/nP1z4xZGvKMGzioLsTs4
	Opma2DuzMB6J10Tb/wWPkMaxe4iAUuegc98r0V5N6rvFMZZia4JInhzGOJfwhOZV02HQNN40ntTye
	u6N/JKQw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bRr-00000007Cy9-34n7;
	Mon, 07 Sep 2026 15:39:58 +0000
Message-ID: <22496d1a-eabe-4606-8619-391d96c124eb@infradead.org>
Date: Mon, 7 Sep 2026 08:39:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/spelling.txt: keep British spelling for
 "initalise"
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Joe Perches <joe@perches.com>, Colin Ian King <colin.i.king@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
References: <20260907091324.32211-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260907091324.32211-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/7/26 2:13 AM, Hemanth Selam wrote:
> These are the only two entries in the file that map a British spelling
> to an American one:
> 
>   initalised||initialized
>   initalise||initialize
> 
> doc-guide/checkpatch.rst asks that British and American spellings be
> left alone, so correcting the missing "i" should not also change the
> variety of English.  Following checkpatch here silently rewrites
> "initalised" to "initialized" in files that otherwise use British
> forms; arch/arm64 alone has 58 uses of "initialised" against 132 of
> "initialized", so both are clearly in use.
> 
> Map them to the British forms instead, so the misspelling is still
> caught while the spelling variety is left to the author.
> 
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  scripts/spelling.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> index 3372873cd7bb..9ec2529bc584 100644
> --- a/scripts/spelling.txt
> +++ b/scripts/spelling.txt
> @@ -872,8 +872,8 @@ infromation||information
>  ingore||ignore
>  inheritence||inheritance
>  inital||initial
> -initalised||initialized
> -initalise||initialize
> +initalised||initialised
> +initalise||initialise
>  initalized||initialized
>  initalize||initialize
>  initation||initiation

-- 
~Randy
