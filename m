Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793935715;
	b=s3Dxy6e2URJKqDi23jy3qYBXJZYfvf3mAOaChkrTffpWw5kclv4/nAEkdpx8zxcvyyPb
	 kQ8Se3udH1MOPzXqzxhbBG6qUv5OMGpPGz4qw8aiPfqqy4f3JvzNuaKZ7n2gPMzI2G31R
	 9sjvsYISJeIty15wbrxPaQ+/R79blz5W+MGJ0n8/noniKNzyL6mnTucMbXQp5Cm6I2bnq
	 fDFwOyYQm7ENEiCGlkJCa/zVe03HVhvieCNXEzCl6jhAOCXNLeOWTm0pn6ttGsoRQ6iK3
	 ViDseh4JUhYxDKXA5h1R/BYOHd0D1NBsQMCxtXmyCg1L4oBCgtPS/UJL4CewStpYUgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793935715;
	h=DMARC-Filter:Received:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=CwVW8g8VuAc/RHQdF8sQQMhRn7phT/+JzQWOyAvRNBY=;
	b=VcjegCJiHGB6IUshQa+WWBYnICEgnAYqTPlwXAHVbvSoQUTFZjiX52ijthBRiJkmjPHv
	 x3s71BBMcZkVKEGtIQKzPFEBVJL3lVP7G7zgt6fCP86hydsp+Ka/EFeQCGL/wOjwPNHK2
	 r0sn0PGPkrbK90P58gPBmz2tv2kZ5zvUxwvSKb5CYrKyAu4rCSOQUITGplusRtPw2hDxo
	 S/kLOJC1nR4iO5KfyHBuyB96WHcp8fsgTpWO21EEL2m9Y3SJuEhjIrzAYGSU5LQmUDtgO
	 oaigtyUnaQ9kS3euiNBg/ASjRqH5lpIZ447y8NSwDunhL3Gahx/rGVvKdmlIN27CWYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15372606A31B;
	Fri,  6 Nov 2026 03:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15372606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnEPtcSe1qV7leAA--.15079S2;
	Fri, 06 Nov 2026 11:28:28 +0800 (CST)
Subject: Re: [PATCH] EDAC/i3200: drop the PCI device reference on module exit
From: Wentao Liang <vulab@iscas.ac.cn>
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, vulab@iscas.ac.cn
In-Reply-To: <20261105194529.GAauzc2axWPncLCpVo@fat_crate.local>
References: <20261104033833.1566974-1-vulab@iscas.ac.cn>
 <20261105194529.GAauzc2axWPncLCpVo@fat_crate.local>
Date: Fri, 06 Nov 2026 03:28:34 -0000
Message-ID: <179393571491.2060286.9429869566285761831@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADnEPtcSe1qV7leAA--.15079S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF15Zryxur13Kw1UGw4DArb_yoWxArXEgF
	4DJFnaka4vyFyUXa1jyw1vyrZFgayI9ryUAas5Xrn3Gr9YqF4DXa98K393uw1Fga4rKF4k
	Cw15Z34jyrsFvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
	aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjfUOMKuUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAIDA2rtCZfodAAAsL

Hi Boris,

Sorry for the late reply, and for the mess it caused.

Thank you for telling me that the EDAC i3200 driver is orphaned. I will stop
working on this driver and will not send patches for orphaned EDAC drivers
again.

In particular, thank you for pointing out the Assisted-by guidance and the
problem with my submission process. This is an important lesson for me. I
will go through all previous feedback manually, one by one, and reply in a
timely manner from now on. I will also not send patches in large batches
going forward, so that I do not accumulate more feedback than I can respond
to in time.

Thank you for your patience.

Best regards,
Wentao Liang

