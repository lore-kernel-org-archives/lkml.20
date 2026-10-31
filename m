Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424547;
	b=zU5WmV0bqk2ku8eiYXjtY6XqZuwP6f5qVOJxFvx75a3QM66gVZVNVmdlGLYy3ozicj98
	 3MUEhEmu3Xc/LLj0WaxVpWlW3M5YuHdbsaoK7ubXWFEGAsCCSS4wnQc7XMiOZOkCkXovK
	 97WExXKu1D5UPPBRcCNTEumgoQyghERTb+a8ynFN4yQw1VR9oHdycSd7555/ke0MH5EQh
	 HFAuIuVW6oVPysA0/Bw6e9nfj7hq1sWCD6FLWUViu7vZx3gnWtl5B2cICaUtSmmrG07Td
	 RKpMpERhozIZsFjHzgVeb4+eg6fr5g+JxrRYP6qv8xdmZZ/LQUM//qvxmvTnT0KgTxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424547;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Vp4ntnb+XElE4TpyNxo2r3GVX7MGf+Q7eXs3f9RgFlg=;
	b=V/GZsB/hmIt8GoIfH4nwY6CXUcJKsk8uJ6dENrQwOzw7DlPsVS7N9RXWRPuRh3oZo9TU
	 TLfVoyZIiYQVwS89F3f0YW2GtZbO2zXZ67lL+CdBjZXepEf3eVHLsmdim1IZfib2Ek/Rz
	 LLJ/LivSl3LjJukb190DBZBO5tx6yEOdeH/B8IPw3WKTFXW3FKHaMxdSKgricSdEnyEQs
	 VlzKuvY0jUnBeH96Qay8zmG+7RkiUNCW1OA8zDyw7u7PJrNKjKECvOwIwi9yvIrofFnC1
	 BFnZIMSEp/OCZXazg9YM+Uky8/dPFliK/Z+GMy1xPrd1Wo7bO06s/4qmn7DRE2MifDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iaQjTOt+;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E03606A31A;
	Sat, 31 Oct 2026 05:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E03606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iaQjTOt+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=Vp4ntnb+XElE4TpyNxo2r
	3GVX7MGf+Q7eXs3f9RgFlg=; b=iaQjTOt+i+y8CdLvA+KH7QLZGAn65bFxYWkcu
	Qigaaqh9Km5juDS+QlmnqohP0keWsxfKaCbXNsh4qvwSjeNvW8LMAjxhH2Cy2RI9
	R/C14UVoUvnT9RVc0wOEIEnxf3IlJSWCKKXnfLzFnPDbdj2M5u5ADZIAMd1Vpa5M
	m8IRf0=
Received: from [127.0.1.1] (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBHwDSefOVqwDZtAA--.172S2;
	Sat, 31 Oct 2026 13:29:02 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: dt-bindings: willsemi,wl2868c: add the
 WL2868C camera PMIC
Date: Sat, 31 Oct 2026 13:29:02 +0800
Message-ID: <179342454262.453004.7013252409006345812@mail.ustc.edu.cn>
In-Reply-To: <20261029-amiable-loutish-wolf-60a76a@quoll>
References: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029-amiable-loutish-wolf-60a76a@quoll>
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
X-CM-TRANSID:3pYKCgBHwDSefOVqwDZtAA--.172S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1xur47Kry5XF43tr1rtFb_yoW5ZF4kpF
	ZIqr1DCr4DJFZa9w4xAr4xXa4S9ws5JayDAF9Yqw4rZan8C3WftFn5tw4Yva4jkr4kWr1j
	yFs0g348GFWDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkI
	ecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUgasjDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwA2s0

Hi Krzysztof,

two corrections to what I sent you this morning, both measured after v3
went out, plus one thing I got wrong in the first reply.

First, how this mail is written: I draft with an AI assistant and edit it
myself; the content, the measurements and the decisions are mine.  You
asked for that explicitly and it is a fair thing to ask.

1) v3 has a defect that makes the "users" argument weaker than I claimed.

sashiko's review of v3 3/3 is right: that patch enables i2c10 but never
enables its parents, so geni_se_probe() never runs on qupv3_2, i2c10 is
never populated, and the eight "*-supply = <&camera_ldoN>" phandles in the
same patch point at regulators that cannot register.  So in the upstream
board file as posted, the consumers exist on paper only.  v4 enables both
parents in the same patch:

	&qupv3_2 { status = "okay"; };
	&gpi_dma2 { status = "okay"; };

2) What I can show for the hardware today, stated precisely.

On our own downstream board DTS (a much larger file than the upstream
submission, which also enables the QUP) the driver does probe and the
regulators do appear, measured on the board running 7.3-rc7:

  geni_i2c 888000.i2c: Bus frequency not specified, default to 100kHz.
  [camera] loaded wl2868c-regulator
  /sys/kernel/debug/regulator/: camera_ldo1 camera_ldo2 camera_ldo3
                                 camera_ldo4 camera_ldo5 camera_ldo7

with camera_ldo1/2/3/4/5/7 at 1128/1288/2816/2824/2808/1800 mV (LDO6 has
no consumer on this board).  That is the same wiring the upstream file
describes, just carried in the vendor-shaped file.  It shows the chip
works and the supplies are real; it does not show that the two hundred
lines I am asking you to take bind, because they are not the same file.

3) On "I still see no users", the honest answer rather than the
   convenient one.

The users are the camera stack: s5kjns, gc08a8, gt9764 and the CSIPHY
rails, eight supplies in total.  Their bindings are not in this series -
the two sensor bindings were posted separately on 2026-10-27 and are still
in review, and gc08a8 has no binding posted at all.  So the board file
cannot be complete, and dtbs_check cannot pass on those nodes, until those
land.  My reading was that this is exactly why the regulator binding
should go in first, but I accept that from your side it reads as a binding
with no user, and I would rather say that plainly than keep shipping
sensor nodes that cannot bind.

What v4 will be, if you want to sanity check the shape before I post it:

 - 1/3: arm/qcom.yaml registration plus the binding, unchanged in
   behaviour from v3 apart from review comments.
 - 2/3: sm8750.dtsi, the three DTSs split out as you and checkpatch both
   asked (this one was mixed into the board patch in v3).
 - 3/3: board DTS with qupv3_2, gpi_dma2, i2c10 and the WL2868C node, and
   the eight supply references, but without the sensor and lens nodes.
 - the sensor and lens nodes move into the patches that add those bindings,
   each arriving with its own binding and its own CSI endpoints.

If you would rather not see the regulator series again until the sensor
bindings are in, say so and I will park it - that is a legitimate call and
I do not want to burn your review time on a series whose consumer side is
not ready.

Thanks,
Qianhui Xu

