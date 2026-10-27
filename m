Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113334;
	b=H/gSFLNuukiwbiwj9UHhvfMtyN0xdyPP+1DeItgrtDnwiBk5A6EYNfiNuB31zxsXeD7e
	 JAofKHe3ZEfLWrVDws30WdtJLXAiWc3vlLC0wCa7ZPrjGGYj9hamuCG1R+aLXvocQL76i
	 CIFnjYbPppNPE/fUktqRm3swd7D1Tu/gfnp3VgNp93T9zVFbFiX0Xn3XON/ZDU5DijHP6
	 4JcLbuZiKJZ507P7l0G1P8gFFJNrAuZh1QeHkXnvy2tFNcVZBdAt/75YSVqlxH89ahjvq
	 faShhIKMt0xDc/lea6IYObNlw839A8RRUg7939wlW1nrSxTD0Qb9S8ySnffYH/SmzBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113334;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WHO1mAqmrPk8OPKBUEwgsF2j51VFPDAfdswqDjCD/dY=;
	b=VTCoBuqWDvoFFZErawEUzXSZYqhwor5hF8MMkPa7FvDN5nHZQkXn/aM9yXnz+oWqFuf8
	 ahZjZLNTINmri/SSWLW8sxzA+B+OkcneSfLRNuzGVhwvPcuVpA2Vxa+W2tqZEAElB3Ktb
	 i76Yqsa8yIu6stE93wMnRKxpqd+yNsG7zdtMxSx8Idp7QHqRKlTou+uqYWLVQH6b/lc0X
	 tNdhsAglbk6SxIHP5RVIGOXacd5mmPlUkpuXEzptP7ghhSLC7rIpO/UhKmdVWlBsAytYq
	 s77tHv6JOoCdpC6HoP4HDSuzeIRKtEkTQt8mHYi6bPxhR7Vewu7Ctdj5qeKVkpfoHpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KvMw9MC3;
	arc=none smtp.remote-ip=95.215.58.86
Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9CC606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD9CC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KvMw9MC3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W7XcvJkjNj1nyOBP5NzQSVWrTpXkf5ocgz66HM61XFE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793113330; v=1; x=1793718130;
 b=KvMw9MC31Y/L0S1rypRHPgd7wWl1nFk8q9UKmdXV+4qLictwBjXdkSJt1XRqizykqV9vhjpI
 wZMBF2KyNUnvgv8PLw54mLViYo6OCZV3WzGsSo69sx93nkTdTmIM9z27owaZBtvFdizZZ5E3eyB
 KiORmKqT9+XYDGxZFlWkuyTE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 55b435fb15f6a4a2;
	Tue, 27 Oct 2026 15:02:10 +0000
X-Mizu-Trace-ID: 55b435fb15f6a4a2
X-Migadu-Flow: FLOW_OUT
Message-ID: <583dc515-855c-48d6-aefb-abaef26b2564@linux.dev>
Date: Tue, 27 Oct 2026 23:01:52 +0800
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
Cc: shawn.lin@linux.dev, Adrian Hunter <adrian.hunter@intel.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-mmc@vger.kernel.org,
 Ulf Hansson <ulfh@kernel.org>
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <20261027144051.249211-2-ulf.hansson@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@linux.dev>
In-Reply-To: <20261027144051.249211-2-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

在 2026/10/27 星期二 22:40, Ulf Hansson 写道:
> From: Kamal Dasu <kamal.dasu@broadcom.com>
> 
> keep-power-in-suspend is currently documented as SDIO-only, but the
> requirement it describes -- preserving card power across a
> suspend/resume cycle -- applies just as well to any card type. Drop
> the SDIO-only restriction so eMMC and SD platforms can use it too.
> 

I don't see how SD could use it from the following patches. Perhaps we
should still be more strict here to say SDIO and eMMC only, unless
SD part is implemented later.

> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/mmc/mmc-controller-common.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> index 8b9b3b036129..2fc8e06d5ec9 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> @@ -301,7 +301,7 @@ properties:
>     keep-power-in-suspend:
>       $ref: /schemas/types.yaml#/definitions/flag
>       description:
> -      SDIO only. Preserves card power during a suspend/resume cycle.
> +      Preserves card power during a suspend/resume cycle.
>   
>     wakeup-source:
>       $ref: /schemas/types.yaml#/definitions/flag

