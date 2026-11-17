Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916597;
	b=czmnBk1+F9AmypZfDm23nYswZrSJ2xWN4eg4XdjpKCXi3uATcv3oHgPCimLDX5Wulafz
	 PzBe/w+TqfZFDuX6L7y3eQU1FU0clit8b7fHGDCHK+q4Za2atEABOH9L4w9tqEk0zntzk
	 BYKzGnCdj+BjHyn8WWzBF/1jgn0iuxaYnSxuO/p53Fnbu+TuRCfSNmGSrL3ELMCpolavK
	 hA0mpe4vV504ZxYUJBwJE/TYbSTrXq3+eGdNEIgW7PvculM8Py1AWJdXgkmdmHRs5eHif
	 bqP2erwHnQ8LLO1TSHXTWeSyk70X6Lv6qQzRhU+1W2Z8mdmecaUNu/34jZWuPLWCDfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916597;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=b8/Om5r4OOqZRSoAI27MxRWrMg2+0ul1nFv2YlNR7Tw=;
	b=0/Iwj2d+HtTP5UNhbUBzN0YVr4XwhxeCspfHRVsYVtgSVOoK40fxq7a9jlu2zn7nkoRG
	 AB5aLP5fALZyMiz8v+k4YYXPMX3ibiwbVS+flNtooZImHqimuQZGiwmouOyvItz8VtQSd
	 oCMQzc5vpBFhiPuHvlAPsOeANH0rXl978dobE9Un1zy9vMAXmx+ksikBO0RQznL1lcIm3
	 q8E1cw6Keic0msR3PwOLLI6bzFgpgZcL02kzlKLZtQDRv+c6nr4Bw8M4QfPlHzKGIjGez
	 ZjkgLbCL6kMgNOQbOWJgOTW7P5aBeRjb2SNwLiGTqTWCtR7UDU6ay4us4NUuwggm9yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=S9MI7p8F;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E6606A31C;
	Tue, 17 Nov 2026 11:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=S9MI7p8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794916595;
	bh=AcKOBruChaR8ypBOJHDWNFYx4dckNjh02lWHi41qQSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S9MI7p8FNmcFSIt/obHNujnaCgPiQU1FpLQOE0WLyJw2ZINt1pV6WLw39NLPg/piC
	 96yfx1Pkhk+Yzwna3+7aso9t5WF36zlRw6QPwZJlE3rwKkMreeOlNEGAO1E5UHQct5
	 HQ4LXYhoWupon7McApOjOBvEj/1V5UiRZPJu/qHXLTABpFjUtNTKVvdgQaWMivgcNd
	 kS2S+X7jU0S3f7E63c1HBUoJWsGysQFYN+4TV1mZlZK0H09FsQDlDuzruggtWvijxp
	 2CugvP/KfgmjbhS2Kv1/xqzN9YzWyTTiXhqD0vzPVPNQgUakxMeG9DCutyOSaVAAUN
	 Rnf29AE4qkIPQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 372F417E05D6;
	Tue, 17 Nov 2026 12:56:35 +0100 (CET)
Message-ID: <33bd4c10-ccf6-4cff-9aaa-5c58e02ee1bd@collabora.com>
Date: Tue, 17 Nov 2026 12:56:34 +0100
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
Subject: Re: [PATCH RESEND v5 4/4] nvmem: mtk-efuse: add mt6572 support
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
 <20261117-6572-nvmem-v5-4-9b561a8a83e1@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-6572-nvmem-v5-4-9b561a8a83e1@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 12:33, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a platform data struct for the efuse controller.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

