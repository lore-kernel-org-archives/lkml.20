Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368396;
	b=zvq8CBCqRG+Hg05pqM8LIQlsqyC6yW/tx+uFnIztOvRzrShtj3QhM2JPv6Y7xqQFpKCp
	 qxErJV6bT8ML47q7YVkdGISIHf6er81hAPyLPuNZrTAnwIn04oyVLlKI8XCQrn13fx0UP
	 PPce4Zm51aa8IGMop7oMy6KMjz4RW6TqALW7YhMOeLhGYljoCLPm6ozLnIFsiAIwm2GoY
	 r1ozdMHVi0qkd5SItpYyDnH6hQM1jDDdh17VCaZw0iEE0/qdgx/n7TwKTBo8kxRxrZhv9
	 6FmDrP5Yp/bE7ih/FcVFDKw858qgH+wjobdRWRhKclYuqdLqYL0sO2GW8MG9JeIIhaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368396;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=k8pe3tOEsqNneCAZxFljqZ7LcXG/k88tOXHdLWz/vDc=;
	b=Mcv1xgw5G6ywwkwNtK2yF6nAmnvo+EWm1pEjmlkkO9d8pIJR/Ul8AseGx6BzZAgVEu3r
	 qcYSUpIo9II/2f8gc1JSiLBJwV2C8Dx7aACmzr2k2uL4ib3iYK7dhAWy8xmeZ/5sEVdSH
	 bogs1q6H8g6UC2HWCBrcqbDVrLySL8nZjziBc0LA2MougBULA9EXcy1H1/JzISIy2IX6D
	 IT8FFTyo1P05rl3rSk1bj5MwPxtHZ4JnSyoctG7/K47xjEnj+FmeliI0GDvPQNcyyvl2K
	 SDfNESSMbYQt1B2gECWC/HZcFpzH7d/GKjCse2xeU0nuNhxMmcsDkYVjuu1rep3dWMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773CC606A31C;
	Wed, 11 Nov 2026 03:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3DrSB4_NqwzzZAA--.16282S2;
	Wed, 11 Nov 2026 11:39:46 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
Subject:
 Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on teardown
In-Reply-To: <20261110122714.GA3809@killaraus.ideasonboard.com>
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
 <179430684554.3011466.3431045638041318447@iscas.ac.cn>
 <20261110122714.GA3809@killaraus.ideasonboard.com>
Date: Wed, 11 Nov 2026 03:39:57 -0000
Message-ID: <179436839700.3055208.16759622808608708086@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
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
X-CM-TRANSID:zQCowAB3DrSB4_NqwzzZAA--.16282S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw18Zw47JFWxGryfurW3Wrg_yoWkXFbEka
	4qvFykKw1UXFZF9a1Sqr43Zrs29FW2v34UJ34Fqa1kZ345GF47XF4akFnxAr1SyrZ0kF43
	Wr13Gw4Fyw1xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxAYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
	6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
	b5lk3UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAIIA2rzsLXizwAAs0

Hi Laurent,

My main goal is to study how to find bugs in the Linux kernel. When
that work finds a bug, I also want to help fix it and contribute to
the kernel.

Static analysis flagged possible bugs, and we reviewed them by hand
with help from DeepSeek and GPT-6.1 Sol. Even after that review, many
of them still seemed worth looking into. I got excited about the
findings and sent more patches than I could follow up on. I regretted
that decision soon afterward. I should have sent fewer patches and
replied sooner. I'm sorry for the extra work this caused.

I'll use this shared address only to reply to feedback I haven't yet
answered on patches I've already sent. I'll go through that feedback
one message at a time and respect the decisions maintainers have
already made. If any of the remaining patches are still worth
considering, I'd be grateful for the chance to answer questions
about them.

I still hope to contribute to the kernel in the future. If I have
the chance to do so, I'll use my own email address, respect the
maintainers' requests, and send only as many patches as I can
follow up on promptly.

Thanks,
Wentao

