Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424464;
	b=TW6DetZNC46dmYp8Hy032xRbjTGkEORy7uZ6JWj32ozg8fJUYeXOJcKYJjjz8+skK+yM
	 v+8TGmyu4xKm0aqsnT2f+XTNkC4nQDSQQWBaPhAMLzC2dAI1jwHlkucZuM7jf3/+56IYA
	 sVoOvDZIkBQuszk6bT0SqmmgkHYyMmfBSWmoohaaGo1Kl2KYxmEAmONNyqt9yjFh2c3JB
	 KpUKiYsqxvk2tCG2r9gFY1zOvxYqgk5WR1i5iWq5MRW/lttN2+7VRJ6aTUdgfzEzF+lXD
	 pPq8ldSgMeVQ5wwPpAIambrQEAMZY+28RkPN/od66VpzpHcTtFexM6+auzTdSiYFHkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424464;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=RFyWw8vuZkBEx/wkkxZdiqnMcUj85ATVC8BmKduUB8A=;
	b=kAhRT5G8+FDf2iVIg81MRg1HNbWdd6Mn+X2m0fjjvRggZA0bU7+sTc7Xsd3vvSVFDs8O
	 NSjIspykEtxP0L1uyd2NPy5lcCjphurB7DFX7WcktySOinWl3VGCmNCL7jRSNKsyeE6dl
	 2IMOYsPF1qdKyLYEgQMET+yRwJFKM7LULMr08yI5hstSShI+8vuFdYuk+oloodZH9Z+Xp
	 /jgkWbJuamLQI2fcy0mWg5qIF05w9eAxnqLZ6RD693BVGYDZdjUdZR0TmGbAlzd0G8IkP
	 nEzNBH2fRy7SjGTkwAnMJ/QE/ml29zH7WY8J4HOFCxhkVfjBmTYri07gnbhDm5XsovA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=pHAApBGe;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B11A606A31C;
	Sat, 31 Oct 2026 05:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B11A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=pHAApBGe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=RFyWw8vuZkBEx/wkkxZdi
	qnMcUj85ATVC8BmKduUB8A=; b=pHAApBGergbRPvGIMagonHssWgXT06sEZ8c+R
	i8I52oj8pw2iSLUUkbD69SeLCHnhnASc2u871g799/jojVmTi2tYpfqu5Qf/1LrM
	HNGExz4zLGV0+FQo0BAoy5fa3SaFBa7OeWuJGvTNzRInWFfTwFB94r60K85B++cC
	eIxXmI=
Received: from [127.0.1.1] (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHCT46fOVqfzVtAA--.5284S2;
	Sat, 31 Oct 2026 13:27:22 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: mdss-common: describe
 additional block resets
Date: Sat, 31 Oct 2026 13:27:22 +0800
Message-ID: <179342444215.451721.1758131515489182461@mail.ustc.edu.cn>
In-Reply-To: <d265dd66-d8fb-4fd2-b6cb-d50462e4b6e2@oss.qualcomm.com>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-2-xiaqinghuan@mail.ustc.edu.cn>
 <d265dd66-d8fb-4fd2-b6cb-d50462e4b6e2@oss.qualcomm.com>
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
X-CM-TRANSID:3pYKCgCHCT46fOVqfzVtAA--.5284S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1UAFWUtw48KF4kWry3urg_yoW8tw15pF
	sxta4Ykrs2k39a93W8Aw1jyFWxZ3s5GrW5AF15KryIvay5GF4Iyr47Ka1YvasIgrs7u398
	tw4ag39xCFZ8taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IUYTUDtUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwAxsz

Hi Konrad,

One note on how this mail was written, since it matters for how you read
it: I work on this board alone and my English is not good enough to
write upstream mail unaided, so I draft with an AI assistant and edit it
myself. The content, the measurements and every decision in it are mine.

you are right, and I will drop it.

MDSS RSC is not part of the MDSS block: the RSC sits in its own node
(apps_rsc at 0x16500000 on SM8750), and the only reason I pulled
DISP_CC_MDSS_RSCC_BCR into the mdss resets list is that the reset bit
happens to be generated inside dispcc. That is a register-map argument, not
a block-ownership argument, and the block-ownership one is the one that
decides which node owns a reset.

What v3 will look like, so nobody has to guess:

 - mdss-common.yaml: resets keeps "minItems: 1" with two array entries,
   MDSS core and MDSS core INT2. The RSC entry goes away, and the
   commit message says why.
 - qcom,sm8750-mdss.yaml and sm8750.dtsi: resets drops to CORE and
   CORE_INT2.
 - drm/msm/mdss: unchanged, it still drives the whole array from DT.

One thing I would like to flag rather than paper over: the reason RSCC was
in the list at all is empirical. This board is handed over with the display
block running, and on the vendor stack both a warm reset and a cold boot can
end in the same panel-init failure (command DMA timeout, L1/L2 error
counters non-zero). Resetting MDSS core + core INT2 + RSC is what makes the
failure go away on that stack, and I have not yet isolated which of the
three is load-bearing; I have only ever measured them together. So after
dropping RSCC from the binding I will re-measure with CORE + INT2 alone. If
that turns out not to be enough, the RSC reset will be driven from the RSC
device, where you are saying it belongs, and not from mdss - I am not
proposing to add it back here.

Note also that the reset ordering caveat from the cover letter stands
independently of this: mdss consumes dispcc clocks, so dispcc has to have
programmed the PLLs before msm_mdss_reset() runs. I have no measurement for
"block reset after the PLLs are up does not disturb them" beyond the vendor
stack behaviour; that is still the open point, and if you think it should be
answered before this series goes anywhere, say so and I will hold it.

Thanks,
Qianhui Xu

