Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500320;
	b=WcqhgOcjulbNkUOfsqCymGfhHAQbqDmBq15Vin/uIgCkHaZ6a8X1H7WZlFurjRAcQeXC
	 6LMqvtO3ZWdNanPyUCOAxS+C5QOZMXtjhtw6KAcGFGn6okNkSxAaoHgB/4ppKQW9inIr7
	 iBA3Vt9NlrADvNhizpp5dkuQg57M8KBrjhikSqAOukdlSigVBPUF6J2sgTfuJKqvaVd6G
	 WxS8VJgn2XKtoY0eoiXZZghSf8CfGqynlRxAXI6a+7IY3ktp1oJjFEtjBA99pcdNwfftN
	 ySkLXIFxqZibRqemhoQxxPtKtewIMmfPKMO7ZP9D9ITzQ/jaVG86jPGznYCXdUHoQ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7bQGV8m9SsQfHL9PiSrFtM1am6ugdH42awCUmoZInsk=;
	b=KoFzrpt/LzqkTzG6cSmetvNVX3Xx/b7JGjpAB07rvabhSk2P2yk8soXuxBDXMEifaVsB
	 BCkmqsmNFNOtrkHCaeUQXGmN4MytFt0hFTN56zj6JtvsT1uQtfRChyrIO9x7aQhByD1FN
	 jXB0WuuNYT4pvaqIlhaFN15pjlRmkD1aEYWs70/kif43y1Nr3buDJWpdg5gwLqqnMMstg
	 XzX+HCrMF55Hj1VVgpyNqzov0qNpWdA77avOSLSDtQYVzw6AqGzdGyV2BEApanS3z/Nk4
	 wsus0jrXuqCxBZxWc0WpA8sSGt3vclP0RmWGfWkxrUBrDbI+lWyz77FgwHf+oIFfDyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=iPYiimNr;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E03606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E03606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=iPYiimNr
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-353804b591eso6039838eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792500318; x=1793105118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bQGV8m9SsQfHL9PiSrFtM1am6ugdH42awCUmoZInsk=;
        b=iPYiimNrNKUnQFF6EfnBirVN5SyTwPwcokjyTTsZAxkHg7iXLU21aSOOZFBHDAP8u9
         3iYTvA4g7ng3KwYx/yFVBSv5C07YcYfo19cF+hbGw/NclQD2TRB8lVcN+HRr5EgHptvl
         4zUgletCd6fsOpHHiY6XtlyoiaJY1sgSabSdEpy6SB/nlD1y3t69+bA/A1H8lILbFOxx
         ogvQlDc3bDKwLxyyopPj1KELtVHfFhC0LcFgcRr0Ek/ED6FRf9v2zP5iRiBGu9UniKBP
         2IzDLDs2qbcmKErG7BMVpjwBYcYyPHF0IAq2F/t8dzSiDtHFoln+7MFmwfSulEUREOdb
         NTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500318; x=1793105118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bQGV8m9SsQfHL9PiSrFtM1am6ugdH42awCUmoZInsk=;
        b=kd0FnlSNqWVDELNeuU3mvl/5CVdTny1d7xw+b1D0YzjcEKJtyDeHYkl1I9Os4SB50n
         1GkM2Rq5Duee1xP3s3tNHjh7cHd1+mLCng0l2TgGSdVX1L86EsYx9iQ/7YMTo1cuOJ34
         1bAl7VIwLQ1C3kvi6gmOqHq2J+T1IJhrW9LNKpaWtCd+Y85sqBuiKI8co0ApIVcqnT+G
         4mHlvzaqLcM9uOKJEHQju0IBD3mu0UGrLGyepHSQZCzuE/SwWvPITWU8/Xz0ov43vkNT
         JkaYRZ/R6VONI2ay6QvS9ac6560YbFDUCiRJYvy4dSIKqsI1A0OErfWFTCa1v6xPHhPR
         XqiQ==
X-Forwarded-Encrypted: i=1; AKwUvBynpkEg/9O6sAW2ESd6UdvjPSwCwWVOGMGB+OqAER1qeFspYIRFCcKWjfqjRKDPREgsShoZyIpx8zbgSmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1f3fmgb0ym6jz6BTDEYv2MEzMj6z0SF153+qbK8/FBcgjllnx
	9Th+QSt7lmsiQwYYQf2zOL5je88F8pCg3kZUoSSpnS+oZ+wlPhsD5TPNP359YoyImew=
X-Gm-Gg: AYBFou0a/1+UVBbGFmzRMjueThR0KXZCfhHdHONFRA962xLX2Ee/fE3DpoWvu64CheH
	igzy0i5MEA3xd+PMZ4afHt7kWT+zmHUXMeb4KSH+rqMURZBkWL/owme7OpfGvd8O2R2CQFWRsKi
	eu+f7y5S3V+Ml+6kMoj33tgzH0LdFrmupx5hVtyLUIf3wJZHA6cR+GwPFBKWnQiXy21DFhdCo6E
	A8lsNdKd4Qe8Up+lZFIekzcfxlAlz6A61FAuw63gaog7e58AKFMlo/JXCy81kgukZqEo5vbLkeC
	fhkXvjTTWSGmwuuWw7ireqQbpTmt8ptzcRktxrtpP7pLLLtELdsQWNccMKMgTSGxPpV1yyeBMqL
	q+pc0tQnc8jF3JFDoBfmQZO/im9G0ICL0MvUY7lBxyIOux3z6yA+d3DOXQ6sX/zoi9BFqfXwWmT
	AgL5Pi7yo/K6SOMekGlqQl125QcIyiIVwlw+l5BXm6ARAC+j2lAKxO3U+rDr6vC/j5w3V9ZqQB3
	d5m6evdrNjIXmEvOjwlTUHLjuAfALZD01QQFdvPPc5YXMuxAfWDxBtTAWI=
X-Received: by 2002:a05:693c:638e:20b0:366:2893:7422 with SMTP id 5a478bee46e88-36628a2bad9mr2496843eec.22.1792500317990;
        Tue, 20 Oct 2026 05:45:17 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm40483258eec.14.2026.10.20.05.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:45:17 -0700 (PDT)
Message-ID: <553dc087-b5d4-4aa0-8e84-4de6eaa45847@kernel.dk>
Date: Tue, 20 Oct 2026 06:45:16 -0600
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
Subject: Re: linux-next: manual merge of the block tree with the mm tree
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Tal Zussman <tz2294@columbia.edu>,
 Vlastimil Babka <vbabka@kernel.org>
References: <atdeJ-91RQrqLke6@sirena.co.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <atdeJ-91RQrqLke6@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 6:27 AM, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   block/bio.c
> 
> between commit:
> 
>   d4ee6948bcabb ("block: restore the iterator when rejecting a misaligned bio")
> 
> from the mm tree and commit:
> 
>   73a0ff6030afc ("block: fail a short atomic pin in bio_iov_iter_get_pages()")
> 
> from the block tree.

I suspected as much when I saw Andrew pick it up. Andrew, perhaps
let's queue it where it belongs?

-- 
Jens Axboe

