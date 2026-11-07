Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070295;
	b=Ksi3yHA6rvOX0pJXJetG1QjZUvNqY6Qld5P4giloV2Dm5NqEonx7hMUOpBJUtbXKCDWJ
	 uoj6xqL4uTpRADIeLPoyw7tADGHrTLBdCcG48heslmtwC6Mu/GB+5BVpzXx5YH5nouuav
	 6gL4rD3L+W07ikFQAwjDyxiH3cOxyICqiMvwVJ0xvaPQEBVDDk4YwokOPV+3AMZRFy4io
	 ip1Bze89x0xq9HqsufA5nDdyeNmuoxEBqCEGKsFcb1IAw+juu3bOZrttrfCkKFVw7m9PJ
	 YLqAAZtKTo2nB9+sSPKw5p4p5bTlJTVOjz8yX65nMQ1y9HTj1xKvF6nOXPfdQocKEKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070295;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=VbLb18D7bbJK6JDUj6JDbtdi+Q6UDJpBt4qI02Zz624=;
	b=iIxOsCib6mhyWrbfyG757pzB9BG4ugCknOmFx1cvtJH3Vy1RVse+S96bN+KRLZAr9eWk
	 rSFXom5SCaiKGQixes/guQsu/rX6nmOy0lOzrs/atS0VzwZIDHf4qgYf/wi2WWtBUtkfg
	 DWncNvbr6SfxYcyBiEofylBX7+uyC6WPVc/POvmAOnth/W8ZZ5WaSSFch4hA0H1EKnxPD
	 /fNcLrqMwrF6SOKUD5XsazR/uT5yp3Vfn/aY1CNAglS0cKMvgBEwmgHHC3BeSFlSUwx9y
	 Fap9BemYeGEudbFLI06csFvdYlF2GRDByNRVSZLJHF3skVFl0Wewz6bQC9/+UqzrCRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E557606A326;
	Sat,  7 Nov 2026 16:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E557606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADXqZoOV+9qWjCCAA--.10229S2;
	Sun, 08 Nov 2026 00:51:27 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/20] ASoC: samsung: snow: Fix clock leak in snow_probe()
In-Reply-To: <1a22633e-6264-4ea4-a6be-28f87802000b@sirena.org.uk>
References: <20260916070341.1965422-1-vulab@iscas.ac.cn>
 <1a22633e-6264-4ea4-a6be-28f87802000b@sirena.org.uk>
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
Date: Sat, 07 Nov 2026 16:45:54 +0000
Message-ID: <20261107164554.314159-1-vulab@iscas.ac.cn>
X-CM-TRANSID:rQCowADXqZoOV+9qWjCCAA--.10229S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYa7k0a2IF6w4kM7kC6x804xWl1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k2
	0xvE74AGY7Cv6cx26r48ZrWUJr1UMxAqzxv26xkF7I0En4kS14v26r126r1DMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU5HyIUUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMEA2rvPcsj-QAAsw

Hi Mark,

I am sorry for the very late reply.

There was no series: the patches I sent that morning are independent
fixes for unrelated bugs in different subsystems, each with its own
Fixes tag and no dependency on the others. The "03/20" numbering was a
mistake in how I prepared the mails, and no cover letter was sent, so
there was nothing you could have been copied on that would have
explained a relationship. Sorry for the confusion.

Patch 3 is self-contained and still applies to current mainline as
posted. I will send such fixes individually from now on.

Thanks,
Wentao

