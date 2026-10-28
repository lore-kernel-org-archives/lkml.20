Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189077;
	b=FGCNPPN+F3FTs6DHul6OZVJOgdo5B2X9UDR6hztotIPltooRFxUVCq7Aac9/pjII4ngg
	 26HjN/VtJjFdc6mtyFtUjmKptvbMrvL/dluJXAC98fqI2fWRBZ+EYiUQFUtD77zqfvU8y
	 5KYNjWO+my13KuTazLkRt/BRENtCn9/kCM8t6l1w8pF5npYbip4mBGR/nT4KsTKrbzq3A
	 vSc2wcG3kGQJcvIrty3K5+63mxDtk2qYT7W+HFqjUt81TdS4yNP3wwjbz5HoSnAoNvp6x
	 FLPnOvEbC1EIvFA4vR7xBx1CueRhMB5U1A08m184x9Jn7gtgESErTnRqSb2s85xA5Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189077;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=E3HCJL/3/cBDxnq1BGgLAqKWVcEqPACkLs+o9+nUbcY=;
	b=aRWel1qocg/j+3T5302PffLMEoh+LM69e9k1E/RabVPzOE23MZe/AlcZOiN35wCHLj9n
	 4TosFgyEvIbwCzHZvC0XVmDCVu6tW1h9Ybjc5Fus4Rt9nKIQxVYWP8pzai1hwBLy1buPs
	 MG+y0MaYAQuWYZCIi6cDS41m9D9YZzH2kw4vcv0zF7srl2Y8vNv/QjUCwtXrngEes0tF0
	 oCIhoYNokXFyABR6eAMiux7ktxNUu8aCb/fhlpkR5WWfltsTHbcQs7R1hP7qz58bJpD+w
	 qvB5WtFBMj+DVZcouf4ybu5DpuA7zwjCjkAMwyW9k1VBGRMG6+le7wMSMt5nRc/A68w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Sd6apGdP;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032A8606A320;
	Wed, 28 Oct 2026 12:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032A8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Sd6apGdP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=E3HCJL/3/cBDxnq1BGgLAqKWVcEqPACkLs
	+o9+nUbcY=; b=Sd6apGdPB2rX5ZB69Q9tqOZ6V/3Aj0Q0I3Z1v0Mqwt1PH8QlNL
	3Yq7L2WxuQtaNquPqZBhFbT++kQOdmEOApRu9n72wnshLvIJKlS6n8YEkjtdddjs
	84Wwrnhy2A9ah6FlvOlZrbI2Wsn9idLptEN6C0HYB6doLTTdX4vjGXalY=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgB36i7Q5OFqCNdYAA--.809S2;
	Wed, 28 Oct 2026 20:04:33 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: regulator: add Will Semiconductor WL2868C PMIC
Date: Wed, 28 Oct 2026 20:04:32 +0800
Message-ID: <20261028120432.99230-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179312390429.199157.12016700546762955000.b4-review@b4>
References: <20261027051055.213301-1-xiaqinghuan@mail.ustc.edu.cn> <179312390429.199157.12016700546762955000.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgB36i7Q5OFqCNdYAA--.809S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr17ZF1UZw4DKw4xKr18AFb_yoW8tFy7pF
	WkGFnFkr9rJFy8Cr47Gw1xC3Wrua95JwnxAry5trWDArW5ZF1SvF93Ka1Yva4UGrn5Gw12
	yrZ8urWDCayDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUgZmRDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2rg+9ZksQAJsi

On Tue, Oct 27, 2026 at 05:58:24PM +0000, Mark Brown wrote:
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.

Changed in v2 to:

  regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC

which is the shape the regulator tree is using (e.g. "regulator:
dt-bindings: ti,lp872x: Document input supplies", "regulator:
dt-bindings: sy8827n: support standard properties").  The v1 prefix was
copied from the media-side bindings I was preparing in the same batch,
which was my mistake.

> > +WILLSEMI WL2868C CAMERA PMIC DRIVER
>
> Please keep the file sorted.

Moved.  It was sitting after "VOLTAGE AND CURRENT REGULATOR FRAMEWORK",
which is the V section, while the entry name starts with W.  It is now
between "WIIMOTE HID DRIVER" and "WILOCITY WIL6210 WIRELESS DRIVER".

> Seems a bit premature to say we've got a driver when this is just the
> binding!

Agreed, the "DRIVER" suffix is dropped: the section is now "WILLSEMI
WL2868C CAMERA PMIC".  The regulator driver is a separate patch that I
will send to this list; if a driver section is wanted at that point it
should come with that patch.

> > +M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> > +L:	linux-media@vger.kernel.org
>
> A bit odd to have linux-media, I guess that's because of the systems tis
> is usually used on?

Yes, that was the reasoning - it is a camera PMIC - but it is the wrong
list to send it to.  The device registers as a regulator and is collected
by the regulator tree, so v2 uses L: linux-kernel@vger.kernel.org like the
other single-file regulator bindings (maxim,max20086.yaml,
maxim,max77838.yaml).  linux-media is dropped.

There is one more thing you may want to know about v2: Krzysztof pointed
out the v1 mail was a broken patch.  The diffstat had been typed into the
commit message, so the mail had two of them.  v2 is a real commit in a
pristine 7.3-rc7 worktree exported with git format-patch.  I have also
added the consumer information to the commit message, since "why do we
want this binding" was the other open question: it is the camera PMIC on
the Lenovo Legion Tab (TB322FC, SM8750), feeding the DVDD/AVDD/DOVDD rails
of both camera sensors.

Qianhui

