Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493082;
	b=Z8D8BPXRvwfG8uSTvhSmL0/tXcAXcSKxGHHq8XTYqwJxfSTfVVWjtP1Cr+Henb85AzCj
	 WHxGiZuAev3bWw+pnttoHXrVWBr1UrnxNAfgsHJ0NvaOudZ6LLUCunV1SpNaUlEaU0bsq
	 HJOrJhldgEV4LYVqAMDy1m5w8jN/sBcj8ycSFSeQLRWxDXNn4xfzL+4qd1BAkrDuGm1cj
	 m2chyx+eVOBMuz7H124CmeHijLxx0mJ0FC98vJM/43HYzCLaPcxL13S6gt6GgsFddPP40
	 dPomTywTOLes8GQMd4d7lWzXLsNt+ZRGDTMUQeq6abbEqJ7to+C8TbLBDpQojFeH9LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493082;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=5M/PwM9mUmbTzOCDNqAycHJtgySfGH/PUnOQ9n9PwL0=;
	b=nnsFno1+ke9uTEb58Oq5WJMpvhnMz1ea6VDlo4CEGXyDIs0nN7M5OBgEc3JM/jhFQSRD
	 rhTIyhvIzZqG9WhH6/dDlNm5+hjS9aM26DFhNnXpw9MmOE4v8fD5CRreeHaN7eW6JtwPX
	 CWREOB+eTXuW6Ruc8+xkp+duRvZSRWSGARtlLX2NK/U1QXAL8KnXFS8UcxO3ItmOYdlBb
	 JmsauAIGl3gvAfLS48izaCFgLFoZjbc1SR57+aLp+5fGNbCywA923+BpjyYWieAXglh/q
	 Rs3ZCfCxROge529/aFek1UwLOtXUMhzMVUhnC5aZjvQnFzM3PyeZGP+3uozKt4RvBIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hWs9JrmQ;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29487606A32A;
	Thu, 12 Nov 2026 14:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29487606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hWs9JrmQ
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C09F540920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794493081; bh=5M/PwM9mUmbTzOCDNqAycHJtgySfGH/PUnOQ9n9PwL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hWs9JrmQAS3kzaFP6LPOIiP8eMbsg+2ZZRchSHvv3Wn+gDpCDozfbzVOcBEadWQ8V
	 9Vtiy203C2c3Oxchfcujs1By5FdAVJbF/7nHj494qida3sfCjPfrHhkX7wvdLKXpDX
	 WGDOPZAxVscbvjWvldpudEjcEXqGYiY4OLqPyDNoeEnnu1/DB8c6nigAewEXksikdY
	 RX49Y+thl50nMcsus0F3VwwNSXZoftve2zZ+5iX/Uo5tX+HZvH4ZAIcUKhUUiebFm5
	 WASLRLlskTtbBZ7wLLeSbS1jlAGlZ6X7oLjcu/87q5ZakHghX51C1UMESgaRZ5hcFg
	 Ra82/hpkvex5g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C09F540920;
	Thu, 12 Nov 2026 14:18:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: improve translation update checks across locales
In-Reply-To: <4c0221d662b7e8521d93000ad6ae09300dbda9c1.1794196480.git.dzm91@hust.edu.cn>
References: <20261107000338.1243411-1-dzm91@hust.edu.cn>
 <4c0221d662b7e8521d93000ad6ae09300dbda9c1.1794196480.git.dzm91@hust.edu.cn>
Date: Thu, 12 Nov 2026 07:17:58 -0700
Message-ID: <87pkwa6smh.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Improve locale-wide scans and report English documents without matching
> translations. When a translation commit lacks its English source in its
> history, use the source history at HEAD for the author-date fallback.
> Capture Git errors for unavailable commit IDs, honor --logfile, and stop
> at the first file that cannot be checked.
>
> Update the English and zh_CN guides to describe the fallback behavior,
> directory arguments, and logging options.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> v1->v2: add the missing sign-off-by tag
>
>  Documentation/doc-guide/checktransupdate.rst  | 42 ++++++++--
>  .../zh_CN/doc-guide/checktransupdate.rst      | 38 ++++++---
>  tools/docs/checktransupdate.py                | 83 ++++++++++---------
>  3 files changed, 107 insertions(+), 56 deletions(-)

Applied, thanks.

jon
