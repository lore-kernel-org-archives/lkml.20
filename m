Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069545;
	b=Fmbf4slnRjYIxtjOUHdHuUBgTE/ZP3SKd2Z2bwJbjQ/9IBusgo+QM639IHgfIGcrio2N
	 m8QIvpZiFJ+I7jPAmqghkfhTi/ORw+FABux+asQV18+7Md5p8G5VwdA7nunS7STFDoHLb
	 TYA0GFy4qrr5E13o/y8OlvGtIWHiEymVp/Eh/DEXP+HnjYEAPXjOlMBJtCBTmUdCz+uiP
	 KcH9ubu6Mvm+5DvPnmQi83VqIJAGNIkvhv7DaIRKPlYax2305+BWzNDFX+yIfOqhKz5P+
	 Dkr0z7OgG9tZSxFWIR6rmAnxpgHTFs5lqSyWIJ0M68vuZ66Nu6d+3gfcXqpAplLevPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069545;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=40kuihcjhTlj1aLdgEnB45MZzzZ6zfuouT8zXvlNzdI=;
	b=p5q4/rlDSel2PxztzLpidadCMnmeSYLY4pP9+/NLhuNK57QJe4BkGM9H4lkAg4AtYpis
	 jm1ywbLs19e2U6zTML0tcMgWiV4Kk76UVBHg5nJf0QJ5mn2V1rEE3Ipt69ewzkk08VAxt
	 l0GuUtJ+39PX3GkXzVaIaVZ2HQP2S2M/AHl4LmMsFMGNUHWAjjvipzvrm45qC4Q587fp8
	 XjC8LIVHyGL1pLKl8dpnl5WS7JeH3rv1wiesi9lNN9F2FJEIuYROLRjpnnQwJXf3wxVWv
	 UPXAwUOZOD9+n9zM0AoXk8jrW2Oxrr9KyMbDVI1AaAaKZQpsRQ2NYm90nXt5wnyfJOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB3606D81F;
	Sat,  7 Nov 2026 16:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEB3606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAXJpcfVO9qL_iBAA--.3844S2;
	Sun, 08 Nov 2026 00:38:55 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 vulab@iscas.ac.cn
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Fix codec device leak in
 fsl_asoc_card_probe()
In-Reply-To: <1ff14ab8-fa35-45c3-abcc-1075a848be2d@sirena.org.uk>
References: <20260917165654.2163461-1-vulab@iscas.ac.cn>
 <1ff14ab8-fa35-45c3-abcc-1075a848be2d@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Sat, 07 Nov 2026 16:38:38 +0000
Message-ID: <20261107163838.271829-1-vulab@iscas.ac.cn>
X-CM-TRANSID:rQCowAAXJpcfVO9qL_iBAA--.3844S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4kAw1fuF13Aw1kXF48tFb_yoW3uFg_ua
	93Cryjqw1UZF4UWr43GF1SyF12gFWjqw1kGwnYgFWxXryrAF12g3ZYgwn7Aw1xX395ZrnF
	kr1DZ3yY9wnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
	aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	ACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDOz3UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAIEA2rvPp4fAgABsw

On Thu, Sep 17, 2026 at 11:29:53PM +0100, Mark Brown wrote:
> This doesn't apply against current code, please check and resend.

Sorry for the very late reply, and for the noise.

You are right, and after rebasing I found that the patch is not just
stale: de27e0cadcce ("ASoC: fsl-asoc-card: Move bound-component setup
to late_probe") removed the codec_dev[] lookups from probe().  Codec
components are now resolved in late_probe() through the bound rtd, and
no codec device reference is taken there, so the leak this patch
addressed no longer exists in current code.

I am dropping this patch rather than resending a no-op change.

The ASRC half of the same series is still valid and was rebased and
resent on Nov 4:

  https://lore.kernel.org/all/20261104024047.1508601-1-vulab@iscas.ac.cn/

Thanks,
Wentao

