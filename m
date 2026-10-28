Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189351;
	b=h9RYvR3Nx6P3xrxpLYjMQmam8yEm8s6JmHAkG1JHUYLHw2VHRFWAr7vUTCBS8VK/25qS
	 Vn3VGo80gWPHWEAWysrX2FGwVpINHQWMR8R88Fc4hV0tCwXqfmXyKgj4GtmSnG6NynUNe
	 jjO+74e/vRUWcoFDDy3sSi7jCxNUNtGp2nKzL0QTLKRtYsgLxTXbwNXHL+wNXAZmArEae
	 Xq1dJ/BnRaIouHUhNUH6jxfYA6/fW+0PENtynCDOTbfbIN5dPDgtB7dJ9B2HvHjxZ573D
	 BxJMle3Oj5fYKnDZncP7otHJAmd2qdKz05vF+/FsN3MWX2/6PheQxz+wm/OYEiEmmGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189351;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=DmdTMbPjtWxfoa8cBjGlNCm80JGdkutMoXit7eg+qwc=;
	b=EqGxrBfrUqEGXhcZokjUkXoolfGIi63prysBRwNpxJCV0LYOigYgDkvqCp42yl6j+T9v
	 l0Miprve29SEeeF6SzQpWZY93XPxSGq0EczcUi7QVRJxmL22NcVpWoheqLkN6IY3HK8yq
	 Ins59xDWKfC/aQy3bnSRQRzEAkc2hZFHWlbUSMLkfFnMSFisL4XqzomyzKPr+PzMffhpl
	 p6x9TyGmTFiqBwh2oDCCQyqz2b6nMj3otOnkEBZiJUXhwq8mpk5qjj3t8SgM+DVRrnI3F
	 oLCu0cE2TFObajcAOQ2B0Co6q1uBBjjdwfgIV9PdbyBLSW4z/Mf/gEqZokb/biAzPbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="V/AmCjrg";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E839606A31A;
	Wed, 28 Oct 2026 12:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E839606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=V/AmCjrg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=DmdTMbPjtWxfoa8cBjGlN
	Cm80JGdkutMoXit7eg+qwc=; b=V/AmCjrgIk9pU7+rpjoMJaYYcIYpboT3yW5A8
	r2VP4EWL+pSGQHnt/qqNQIywNwdhZFSGvhElpclO7IRGcNSIWtp4RaZ1TwyDsYls
	arc2E/x0DN6nSWO9ZzE7htDZ03/AlA8diOcoJZlTswfD9odnRghfVux1EMHaUpt/
	nmtnM0=
Received: from [127.0.1.1] (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3cjfd5eFqgNxYAA--.9511S2;
	Wed, 28 Oct 2026 20:09:01 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
Date: Wed, 28 Oct 2026 20:09:01 +0800
Message-ID: <179318934146.107329.15810039464216984473@mail.ustc.edu.cn>
In-Reply-To: <218d69dc-5761-4a8c-824f-7a15307f54a6@oss.qualcomm.com>
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
 <218d69dc-5761-4a8c-824f-7a15307f54a6@oss.qualcomm.com>
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
X-CM-TRANSID:3pYKCgD3cjfd5eFqgNxYAA--.9511S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr4kAryktryxJFyxuryxAFb_yoW5AFy8pr
	WfKw43Cr4kKFWvkr48Zr17Ja4rW3Z5tay5JFyY9a4qv3W5Xr4IgrZ2qw4qg34DC39akFya
	yr4Yv3yDCFZ8ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUgBbkDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2rg+9ZksQANsm

Hello Hangxiang,

thank you for the pointer, and sorry about the attribution. You are right on
the substance, so let me be precise about what happened rather than vague.

I went through all nine patches of v2 and compared them line by line against
your SM8750 v6 series and against your Kaanapali v22 series. Three of them
carry your code:

  - 1/9 qcom,sm8750-camss.yaml - 76% of the added lines are from your v6 2/7.
  - 4/9 camss-csid-980.c      - 92% of the file is your v6 5/7, 20 hunks changed.
  - 8/9 camss-vfe-gen4.c      - 84% of the file is your v22 9/14
                                (camss-vfe-1080.c), retargeted to the 980 bus
                                base, plus the SM8750 csiphy/csid/vfe tables.

The other six are our own work: the CSIPHY 2.4.0 lane table comes from
disassembly of the vendor camera.ko, and the csid error-path unwind, the CSID
frame-start reporting, the two camss-video fixes and the sm8750 DTS are new
code. I am not claiming anything there was derived from yours.

For v3 the trailers will be, for those three patches:

  From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
  Co-developed-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
  Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
  Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

with Atiya's Co-developed-by/Signed-off-by kept in the csid-980 one, since it
is already in your v6 5/7, and a short note under the --- line naming the
series it is based on and listing what we changed. 8/9 will point at the
Kaanapali v22 series, not at the SM8750 one - that was the part of my earlier
description that was simply wrong.

On posting: I will hold the SM8750 series. Nothing further will be sent until
your team has rebased onto Kaanapali, and when we do send it will be rebased on
top of your trees with the trailers above.

On splitting: I would rather not split the SM8750 generation support out,
because the binding, the CSID 980, the VFE gen4 and the DTS only make sense
together and would be reviewed twice. What can be separated cleanly are three
patches that do not touch your code at all and are not SM8750 specific:

  - media: camss: csid: unwind the power-on path through a single error label
  - media: camss: video: check that a buffer is DMA contiguous
  - media: camss: video: stop the subdevices already started when a start fails

Those are pure camss framework cleanups against the pristine tree. If you would
rather not see them before your rebase, say so and I will keep them back too -
otherwise I would send them as a small standalone series so they do not sit
behind the SM8750 work. No dates from me on either; I would rather wait than
add review load at the wrong moment.

One thing worth flagging separately: Vladimir has asked for the CSIPHY to move
to drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c, following the SM8450 series.
That affects 2/9 only and is independent of your series, but it means the
CSIPHY part will change shape before any repost.

Thanks for the review and for the patience.

Best regards,
Qianhui

