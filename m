Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890622;
	b=gCpaIwysDG/iCULtie0+1MM81JVeFQ89ch2eAadPBnoU0UXjqTVJAyk39TTpmAEjqvrk
	 xIsj4tP9FACx75bDxjnHJ9y8j6vHlVi25Egj2X4CXBfPJ+EhhRHIqm+wU8dNYr+R30FSG
	 jReOlGOAof1bIjGCNY0Jx1WofMqV2W0OYhp+hpvlb1jfhinrqtTBZA0Dv/4c6/JDWmEdO
	 iPQzTWjoHllSnIssmjuTO1Xo2hGHN2vJjtldOcMDCeBUJS7sSo26WboJ4WVmiGntQm0p8
	 GrOGIfkFJ4FwpgSYhLomUFa4wj01EoMzNldq2R7Za0ThlkvyBlBWoFK1g/JJ670kueQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890622;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=qqlqZQM1bgY9LghoHa28vdCwGWWwQsflm2XkB9xroRw=;
	b=dfw8u3ucdwkR/n2/H5uXEhJyadk5dr3FNwOck/4j318NmQ1x2DwU8nNEFO/yhfiPUjnP
	 kLoLKL+O6oFA9l2+ZmLZRxfcTqkpSSaJS+lF9+Kj7gii9VAPAEM2avyhEobEAKbjaWSUh
	 fpJ/dXRGFYt6GTLsWqHUATllANSZRb3vWGDSGNWwEmAYtCMgHnEO5p1gA2YKqX+fmqlx2
	 lD/iIE/xAyOihsjVlLDMnJGUzU9bZc/2Z8SafTxvGhq9Ivx5Cr0qGFKOrGCci+s3/i4rS
	 RQyX5yxjQi+7SvgJiLiE9GlKSpeEdRxVWB/myDvZ8QEECXVKtMCb5jqBklH+IbvoD6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E302F606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E302F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACHH7U2mexqpshgAA--.7159S2;
	Thu, 05 Nov 2026 22:56:54 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
 vulab@iscas.ac.cn
Subject: Re: [PATCH 4/6] clocksource/drivers/davinci: Fix clock reference leak
 in of_davinci_timer_register
In-Reply-To: 
 <CAMRc=MdzjvFovn5_QCtLQr5zGR4zjJraPXCaXNe3hxSVY39uYg@mail.gmail.com>
References: <20260915051948.1727882-1-vulab@iscas.ac.cn>
 <CAMRc=Mc3Gu129N9w67NzcPjK=EGgrB76922JiC3bg5NP9yzrTA@mail.gmail.com>
 <20260915092518.1868587-1-vulab@iscas.ac.cn>
 <CAMRc=MdzjvFovn5_QCtLQr5zGR4zjJraPXCaXNe3hxSVY39uYg@mail.gmail.com>
Date: Thu, 05 Nov 2026 14:57:01 -0000
Message-ID: <179389062168.2031761.8680361794072834990@iscas.ac.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:zQCowACHH7U2mexqpshgAA--.7159S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFWrGw13trW8Jw4fGr4rZrb_yoWfGrX_Wr
	1vkFyDA3WDWF4jqr18KFyjgrZ7uas0gFyxZ3y5Jr4fZ34FqFn8GFySgwnY9F1rJrWFgrnF
	gr1qvFWjq39rZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
	aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
	x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4
	x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7VU1pnQUUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAICA2rsjugZrAAAsa

Hi Bartosz,

Sorry for the very late reply.

> Can you test it on real hardware? I still have a davinci board somewhere but
> I haven't booted it in years. If you can test it, I'm fine with it, otherwise,
> I'd leave it as is just to be sure.

I do not have access to DaVinci hardware, so I cannot test this change on a
real board. To be transparent about how the defect was found: it came out of
static analysis of the clock API usage combined with LLM-assisted review, not
from a failure observed at runtime. I therefore have no Tested-by or other
runtime evidence to offer for this patch.

Since I cannot meet the bar you described, I agree with your conclusion:
please leave the code as is. I would rather drop this patch than have it
merged without testing, so I will not resend it.

Sorry for the noise, and thanks for the review and for your patience.

Best regards,
Wentao Liang

