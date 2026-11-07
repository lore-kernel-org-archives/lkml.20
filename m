Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069542;
	b=L+Al9+ww4KcGux1UERAt++A9j0+OcI5JgDbvhZ+w/cRwQa5UWGPGrZon6DygWpUMM2I0
	 tSGXNYYOuv4+lQvKpFazccyf9OW5sOr0Dd5vHEwCjdDAlJuVY3KmTJWYuk6NLoRp338Yc
	 ulh1Sops5Qw59cTKAUYC3EN45+T2EWvxc14H54jZortauBMGlw9DyAm9uYNO9TsEQ5wvm
	 UuWy6w9ryqiTVUxm9dcWUv+biqmLUcncJaNS9HL52YqMyaSIUCQGRb/mKh/rSHHtjT3XB
	 fsG5hINfOD/ANA01EbNYzDXqG/bO0jbBf7wX6WBbNAjK9zeEmLUAJfJCo8Sew9WOHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069542;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=lWUiedORJz9iuGG8xvWpfiLUfTiY46+2FOj+Hma4KIU=;
	b=V9aS5gHfpJ6at0K6nyMetyIpHGpF/NBYVslqP/Al1P1/J3/eS9iALwLZPaviSpCUxzBb
	 d6ykKXXYlhm8aRpVFYrMojgP/7m8q2XQaq8DpEMiAj3hlaaqNb51h7qrzjyeFiAsxHB3m
	 15Tn+cFFQakqt4z4HYpHD4YYF2USXk0KzrqWTxmeVnJnR7MQCIvqbFeXdDWqguUSN4ADr
	 sDbZrWS3j7UAAEbDDPX3gGE2EUHYsYPWVuu75UkMIw8E9stSllW3Fl2OAhP388qLVqtbc
	 Mcot55Pcf8LpG9pMXc/GhBgSYL5eV5Fnfh1iME3LKlk5f/Vaxy/+5vsHRg5huaQ2ctA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C41606D80A;
	Sat,  7 Nov 2026 16:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C41606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAB3hpccVO9qzfeBAA--.3936S2;
	Sun, 08 Nov 2026 00:38:52 +0800 (CST)
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
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Fix ASRC device leak in
 fsl_asoc_card_probe()
In-Reply-To: <1d80b89f-7b33-4036-a450-bf32c603a238@sirena.org.uk>
References: <20260917165430.2163372-1-vulab@iscas.ac.cn>
 <1d80b89f-7b33-4036-a450-bf32c603a238@sirena.org.uk>
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
Message-ID: <20261107163838.271828-1-vulab@iscas.ac.cn>
X-CM-TRANSID:rQCowAB3hpccVO9qzfeBAA--.3936S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4rJr4kur47Kry3CF1DAwb_yoWfCrgEkw
	4vkFyjvr1xZFZ8Ww12gFWkZF9F9ayqgryrK348Wa4xuFy5AFyaq3Z3KFn2vw4Iqas8ZF1q
	qFyqq3yj9w129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
	aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52
	x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4
	x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbUPEDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMEA2rvPp4fAQAAsz

On Thu, Sep 17, 2026 at 11:33:55PM +0100, Mark Brown wrote:
> This doesn't apply against current code, please check and resend.

Sorry for the very late reply, and for the noise.

You are right, and it was not a conflict with another fix: the patch was
generated against a tree predating de27e0cadcce ("ASoC: fsl-asoc-card:
Move bound-component setup to late_probe"), which removed cpu_pdev and
the codec_dev[] array from fsl_asoc_card_probe().  The exit path the
patch was built on no longer exists.

The leak itself does: asrc_pdev, taken by of_find_device_by_node(), is
still never released.  I rebased the fix on current code and resent it
on Nov 4:

  https://lore.kernel.org/all/20261104024047.1508601-1-vulab@iscas.ac.cn/

It adds put_device(&asrc_pdev->dev) at asrc_fail, applies cleanly to
310ee4c282a1 (current sound for-next), and builds with arm64 defconfig.

Thanks,
Wentao

