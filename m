Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925973;
	b=IAtUNydlEqiVM1DOOa5g/m+TvJbDjYKEG/HmsWwqFfmjqcqNTn1ANzLWO7XF0z9vnnJF
	 +9hAqfoy24vTxKP0zQDA/SZ/i2dRo/8Jjzv/H+LC8Z7CWi/XRddpypq73q2wKsnW5KjKC
	 DhQ+FjqbR8g57PiHX+KGtQ/wxtcJa5PrHKFg0AAy2byjVzvt2nDSMB/jLYZzCMTiXOVrn
	 3nwCqcmAqdcPINsvNWSdzl6NL71QAc8cwd8fAQEMzhNoI7cFgu/Q8PlLhtEkoQeqrt14l
	 4c3XCKAlXJlKnvem+XtX0jiecFMo99xkKkYCka40Yw3cI1CyEcyOZonxaZG5w4N//Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925973;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RTqHAtDYMug8aKNf43ueqF5OhBLCVSRjCf9NzHVcOFs=;
	b=Tm5WO01VRkFVUyovFtVBfqmp+xnHuJGVw6UMDWyWZWgKrw2IN0fqBVxMk+zGCyc9fGWW
	 NT7X10UywanOt3Wg+gKRCEfomghSYEe669t4F383s4f913OslsWvBl+WDbzvPxUDujrJH
	 BsJOALCZVKsix3acC97Eda9m6iNJA7XHeYTBF/+/mI5pZ1yIPkvxaoFWVZRtMtorTe1TM
	 z51yYXPTXlUA2WBMc2DcDOtJ6DdjW8UXhvzIvoBdUpocqYsMXgAcGT7KueMlkAEqfm8Uu
	 GA8wd+hdb5gHuJk8erFTtQBJuCymjdR1GCkIEaLWXdUM63q7cv5eHtj5JdHdwqbIsBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RmUQRZZt;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAD3606A330;
	Tue, 17 Nov 2026 14:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DAD3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RmUQRZZt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794925971;
	bh=8JLKK52+o0i2JFWndjt7ZicRjZjcb4Br+OPe2B8YcKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RmUQRZZt1rxxETA+jlDkX8XADuYk6uwWqBssrHsHIbnNZCzD8bHvkD6bNDBu2npgG
	 +vZ2IA2GYHqKm9MQ0ZHAbfFfreCfoXKgEivQC/UzYjmFnLSmFIsZbCtq3qU/ZPxQl5
	 W66zm1vRWwuxvYQr2LVAzHnVdM7jKY1IEhtKLPuJ/ezL+5z1z8fMhCjTkZTQJP5agQ
	 z6p2Iw13qab37PgcVczXG7eLaVB7zueEwKZlqcMxf5Mlqyd59FtYpiOhuIQODzqxNP
	 FH4gbnzyy7qG232wfJk/oo/gDgAIZHeSXsgf4Qa6FsgpuV9IYZ8tp69hZT/m/pwG5H
	 2IsroE+VCNJCw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D20E17E07B5;
	Tue, 17 Nov 2026 15:32:51 +0100 (CET)
Message-ID: <ed484d74-98e8-4590-8466-17ca5a292025@collabora.com>
Date: Tue, 17 Nov 2026 15:32:50 +0100
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
Subject: Re: [PATCH 2/2] soc: mediatek: pwrap: Add support for MT8163
To: bengris32@protonmail.ch, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
 <20261117-mt8163-pwrap-support-v1-2-b00fa10035a5@protonmail.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-mt8163-pwrap-support-v1-2-b00fa10035a5@protonmail.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 14:28, Ben Grisdale via B4 Relay wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add support for the PMIC wrapper on the MediaTek MT8163 SoC.
> 
> The register layout is identical to MT8516, so re-use its array.
> 
> Additionally, as all known MT8163 devices use the MT6323 PMIC,
> re-use the reg clock init from MT2701.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

