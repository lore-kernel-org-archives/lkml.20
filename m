Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139009;
	b=ZBh17961JTy8HKGm+nnwK4QSmHiCtF6O6Fxfc6rN3o3b6N4XE/jaRdifo6+cqvIV//L6
	 DJX+UKA4knhBriE+ZsXB27tU1ard4n3ao5vfht+AvYtpvGoh8MZf6tpDE1AkZc0oPcRBE
	 gtEHIXiw/GdlW0U5QyRje2rXc7Ue+OeL/0SVpoqeV+3Kack84utjgQWtE4zQnebWqjxzV
	 P8wajye0d7D6tk/AA2PyjHZApKtf11b3SBDLhnm4BnHne04XVJs8Es12DKfmPo+7TzZpd
	 tF6uFh2HSEuA4ZzTi83OKq1QZtJ+K7B3aG4JEr8PCzu1RpGRF1dzYd8RrMVkvacWpPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139009;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=Yhwi5G1p8COsWA4S7+9dfClhRgm4UpSf7hb70cbGHfY=;
	b=EzRtevKKjvAgC/dkOgoSvBabEvqm5C6UTAQD7Anb8CLpVJ8N3217E09yF+Kqjv0Iq/ba
	 /L++V2CUL3QsElUOGSe6EUgyIGzZsE0dIs//TIIfVLZ8ytyQWhWKIAtWkZ6Ui2YEQTM8T
	 Rgiea6HkyA1aXKQ6INaBKFlGPX86QIDdLZZ8STrn0wiCZlDD2u7BrTpQ8XKYCzKwrn1IX
	 mVV7gLkIdU0qcJxwh59lyQXP93TeDNcfzls7be84amqL9qMxGajJPypD5o5HbZrnxP8fs
	 GKgzu4nS+weYlwBDbS2otiBaDFCwZJPxNO2clfmb58ywLSYS7tChD3qxFLWKkwqXMdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336AE606A31C;
	Sun,  8 Nov 2026 11:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABn_rN9Y_Bq9tGaAA--.19222S3;
	Sun, 08 Nov 2026 19:56:45 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] of: unittest: fix node leak in of_dma_get_max_cpu_address test
Date: Sun, 08 Nov 2026 11:56:44 +0000
Message-ID: <20261108121500.3131-1-vulab@iscas.ac.cn>
In-Reply-To: <20261103104234.1373570-1-vulab@iscas.ac.cn>
References: <20261103104234.1373570-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:zQCowABn_rN9Y_Bq9tGaAA--.19222S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYS7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCF
	04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxAqzxv26xkF7I0En4kS14v26r126r1DMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JjUgAwUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcFA2rv4zLHwQABsU

Hi,

This post is a duplicate of the September one:
  https://lore.kernel.org/all/20260917125110.2152065-1-vulab@iscas.ac.cn/

Please ignore it, no action is needed. Sorry for the noise.

Wentao

