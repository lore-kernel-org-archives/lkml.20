Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7F4383984;
	Wed,  9 Sep 2026 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945331; cv=none; b=T2Ai5K/Hc7xEszKlpGeW3vzWk6twyyQzcFbhIBifT7Xv9ZOA1XBj/m/kfZi/f0Tr7btk7OSjTsR32RZ9ehXAFjGVqXq6P14rP5//qie1gMAj+vZqV3HYZq6qzaM7mXDYDhmiVhU1iOCsNBAiqFG3Dcb1JYKWVy2PXD+XryvLW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945331; c=relaxed/simple;
	bh=IXDU44H7iXBz5xhc0VLgNZho3AMoaHwKjtE0AooC7Yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHoL3XFG9n95NuYBqA6TROAk/yAWYmtkpx3vC7r3SEdQBcrXJ4WLsSpqZshTtgAVHzCo8dfMnSWKZgTbRhKX5IEJqc8a9etcZt0b5duRbpjiw6LsRoM/z9IcZzAwz3HYquV4gfNneQmlEf+89KhDQxhSBv7lpe9Q4wi4rx4iJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CS4eFhy/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CS4eFhy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788945326;
	bh=IXDU44H7iXBz5xhc0VLgNZho3AMoaHwKjtE0AooC7Yk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CS4eFhy/9Iso7Tu8z6DW92SgFfW5ZwJay9upAv8jy9gY4bSqDPXBFVuZZCJwcc57i
	 1+mFIrL1X/A9jm6k2uyHxEIRbXcI6le//LBevRa4JjmGzmr9adiR54VONdgwvH4qsU
	 QFvtoen7zV43XdZH5hZ/pyLIGLBrsUW/Sj+rc1MPLfZz+lwv9otANk0hNCufyo2ePa
	 MZdVnZ3ppUY9GUOzCcZTHIsgO0uRL6EMqsBnwVMFaSoSZzUicUMSYUx7LapDHbLgQV
	 878xW4UyXv3SbHingQYfXS9N2mnI3QznuQ3nU37Qwj8dqzCz4TKgoK5mMMaIeCPFjg
	 HrecH4NbMHriA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4D7717E0894;
	Wed, 09 Sep 2026 11:15:25 +0200 (CEST)
Message-ID: <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
Date: Wed, 9 Sep 2026 11:15:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Kees Cook <kees@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Douglas Anderson
 <dianders@chromium.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 14:03, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves error handling in several parts of the MT8188 AFE
> driver.
> Propagate errors from clock, regmap, and runtime resume operations,
> remove redundant probe error messages, and fix clock cleanup on
> registration failure.
> 
> Compile-tested only.
> 
> Best regards,
> Phuc

Series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com

