Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=8.221.36.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841966;
	b=0ABrB02qdCVxGLVXILWPzzyfWdVdO//eHYyUv5CBovTN94rV1QJvn8eKrGaa9Jq2RkWI
	 XwcZlfCROiqcNxuYUoapAvCLOnU+hmWDkiYWJFlYKfqdjzTxwXaLLrueZk2mvVaQ1Ft8K
	 T3iPGmNpXgwyZqni2Jjto4be+vynBGOkKFc5FEn9MkDO0sAaQ52YFVx36/ly7wW3wLIRs
	 i+lgCrU0Sy8HLfpR6Tiygv58MZGd78on+uze0xcXczd1vBm8SEMyC/lT9PyIHKQJ6IH+h
	 uC3vFo21RuWdH217mToTbNayL24brTDWvJ9kRmnWXRSKA4wcsGYtQz5QLCSVMhBjSrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841966;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=wYPlcYxWEFPPxDzllayWHKcttt65f1mLVtY971TaG9g=;
	b=WMO8weEjPl4Tvg3lP/E4uAE69eo9UzQuAQlpLepzHovahLlTL4zLMxOtsWWNhlEt4HU8
	 8u//xQij6u1z14tD4xMbPE8vr84q8RiFjnv84YohOx6JVrQP4aBkFU1aZE9nWl5tvAwRJ
	 JqL54712whoISY/NR5NxFbtZXX7VtyGf/kApYSli3AjZ6FJQAz9HSiBb+EdRLAkTaWwBs
	 JoKs1gflzcfNYjlViz2UllfMAvGgvfNKNeX+jdkBf3WEmQHBxxWk+n2xoXp4FH2Y/bVf8
	 OiANkqWz0aE0LNjSezAWYxLpGWVW0Z4fM3zYmmJYpvXKO+wP6i8aKGuMB0j8ySc0NSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=g3zKO2fI;
	arc=none smtp.remote-ip=8.221.36.198
Received: from mail-m822136198.xmail.ntesmail.com (mail-m822136198.xmail.ntesmail.com [8.221.36.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B2606A31B;
	Thu,  5 Nov 2026 01:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=g3zKO2fI
Received: from [192.168.10.59] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 538ad91db;
	Thu, 5 Nov 2026 09:25:51 +0800 (GMT+08:00)
Message-ID: <8ab021df-dd10-4f29-bacf-9c01c22c7202@rock-chips.com>
Date: Thu, 5 Nov 2026 09:25:50 +0800
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
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: rk3308-codec: describe
 detection and ADC routing
To: Mark Brown <broonie@kernel.org>
Cc: heiko@sntech.de, linux-sound@vger.kernel.org, luca.ceresoli@bootlin.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 huangtao@rock-chips.com, sugar.zhang@rock-chips.com, lxt@rock-chips.com,
 xing.zheng@rock-chips.com
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-2-zhengxing@rock-chips.com>
 <aufBA7-uC7udM0qa@sirena.org.uk>
Content-Language: en-US
From: Xing Zheng <zhengxing@rock-chips.com>
In-Reply-To: <aufBA7-uC7udM0qa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a94ff11e03a8kunmeffaf22e3a50de
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZT0NKVk0dTEofQk0dHhodGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=g3zKO2fILayjVdGEZOCwKOnfIp7jt4rjJRF3J5aD3fldQeIQB47CNsGCkR6dKMnPT7odmhpFizQdvM2Ru9irAIQkLfADKCosoYb/99wAonx6O+0VOOdiq2L5clqxymPBnknZlowa8rtF1891us3q0aWT1/Tegbm9s8U1vtnTETs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wYPlcYxWEFPPxDzllayWHKcttt65f1mLVtY971TaG9g=;
	h=date:mime-version:subject:message-id:from;

Hi Mark,

On 11/2/26 06:45, Mark Brown wrote:
> On Sun, Nov 01, 2026 at 12:41:47PM +0800, Xing Zheng wrote:
>> Describe the optional detect-GRF phandle and named interrupt resources
>> used by the B/C headphone detector. Retain the legacy interrupt order
>> and index-based lookup when names are absent. Document the detector
>> disable and reversed-jack properties and their resource dependencies.
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

Understood. Any future patch series or revision I submit will start
its own thread, with links to earlier versions in the cover letter.

I am putting this series on hold while I investigate playback and
capture problems observed on our EVB with upstream codec changes
backported to our downstream 6.12 kernel.

Before these backports, sound/soc/codecs/rk3308_codec.c and .h matched
the upstream versions at 2ba2d17170f9 ("ASoC: codecs: rk3308: fix
building without CONFIG_OF"). On top of that codec baseline, I applied
the following upstream commits:

   2d8a091725e6 ASoC: codecs: rk3308: convert to snd_soc_dapm_xxx()
   0c55552b5f5e ASoC: codecs: rk33*: use .auto_selectable_formats
   157f7cba77a9 ASoC: codecs: rk3308: add support for codec revision B

I also backported a1c99b6097af ("ASoC: soc-component: add
snd_soc_component_to_dapm()") for the DAPM accessor used by the
converted driver. These are upstream commit IDs; the rest of the
kernel remains based on downstream 6.12.

I have not yet determined whether the playback and capture issues
are in the upstream driver or in the backport/integration.

I will rework any necessary changes against the current upstream base
and validate playback and capture on the EVB before resubmitting.
Depending on the remaining scope, I will send either a revised v3 of
this series or a separate, focused patch or series. In either case,
the submission will start a new thread and reference the earlier
series where relevant.

Thank you for the review and the threading guidance.

Best Regards
Xing Zheng


