Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131626;
	b=GBFjRRexvZrijMjrqxvAeGAV6V4krN3PYfvg5t7X+ZxBJLzSRP+FSNiQq8qmBelJcWgD
	 0kvIsFn5xmMcjEFFNVxFEmoedQsYcP1+E9ROKIMYrW78jpL7MtTRSb75e7g3hQ3c0Gipx
	 jbPAhRpR3OyXRqkRRgmFVEBlEIcJykK3suXEQFqzsLT3w/h9plOjQ/HfQNuavkMObqQZm
	 IyFq/VigNl3FAZxDFw2ltb6aC9hX1P1E31RHApl0XHU+oYiRfM6MLFhdDg2YmDu6ty6Np
	 CLMBD7nItGeIuAj4jP/PHwqn71wFpMazwcbTdH9cbg5Uxd2Y9uMbtIbvusrrIUpCPzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131626;
	h=DMARC-Filter:Received:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=d9oSnze2vw3oc+VVxfYM2BcxQUZjEbs0B685TTsdPkk=;
	b=4XDKWatcNiZYH4nzTYa5yENcvu6WhjuQ9jad5nrDn/whLOhoIivu5hxv+kjkMijOCSDo
	 EBniNj30jQuJaEMwX3QjPM7dPKCCcmb+dakcSqBmGShwzRedVx08UNCfOdVcJQuw8ZCCl
	 zRyZs6UrNXICDtL0ivnDasxmdTO4V9yS5KOhnJ+ouZDnerZ9Z4KflFOM8UTlVoAco9/am
	 FsUeJENxQJfLE+jbe0VKKz9q3Ob3Y6WdKTLM1t0114DJGTYwhkZrAImYL9ncbwp1c2XTV
	 GOFggX2iC4xgXP8waPdqGaavQx1n0NYOFgmPOtsYDY9U/ehp9UrvIUu1HypvxCO9XDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A36606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3ELabRvBq5PiYAA--.38431S2;
	Sun, 08 Nov 2026 17:53:31 +0800 (CST)
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix GCE clock reference leak in
 cmdq_get_clocks()
From: Wentao Liang <vulab@iscas.ac.cn>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <2026091720-erased-urchin-8903@gregkh>
References: <20260917093745.2144930-1-vulab@iscas.ac.cn>
 <2026091720-erased-urchin-8903@gregkh>
Date: Sun, 08 Nov 2026 09:53:42 -0000
Message-ID: <179413162201.2723269.10723981032501014855@iscas.ac.cn>
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
X-CM-TRANSID:zQCowAB3ELabRvBq5PiYAA--.38431S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWxWF4DtrWxuF43WrW7Jwb_yoWDGrb_Wa
	yvyr9rWw18XFW7ta1DCr4UZrWSg3yUu345G348Xa13t34UXFsrXFs8K3s3ZFy3KFWSqFnr
	Grn8Aw13Aw47ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
	FksPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRIFA2rv4kic0wAAs9

Hi Greg,

Sorry for the very late reply, and for the confusion and extra work this
caused. You are right: I kept sending patches while not answering the
review comments on the ones I had already sent, so it looked like the
patches were coming from an unattended bot. They were not bot output, but
I skipped the part that matters, and having to drop them is work I caused.

For transparency about how they were produced: the candidate issues came
from our static analysis tooling, and I used DeepSeek and GPT-6.1 Sol to
help audit the candidates and prepare the fixes. I decide what to send and
I am responsible for it; the problem was that I sent far more than I could
follow up on.

I have stopped sending new patches. I am going through the outstanding
feedback manually, one thread at a time, and will reply to each one. I will
not send patches in batches again, and will only submit what I can review,
test and answer questions about myself.

Sorry again for the noise.

Regards,
Wentao Liang

