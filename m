Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424469;
	b=DWYSk1j5T4ilZjekhF1J+wQ8ZSTO4Lcb90BM16xI+FrRPHD465rIV7CVpZa2fCY/IYZ2
	 Y5FAacibnOo9M1XtX5d30Ww/s7ra7deB5668wGlyddVCnVzcXvHhZIav4q+FFm4iPoH5M
	 NtiWfk9tkhaYyHmVgj6Kt2Tl5Kcfqp1Zzc5lQ3Rx04S8L7rk1bFuXZmadWiHUwp5J4ZKx
	 +Uh0LfS/laoR1P8/JdHIUoF0CQeizpXhyJ/nX5e7CInDzaO25LOXtz101hgtq8mE0Y4ym
	 EXCyCi09pf9W4P6u/uG5FnTXP0NQ46qN2x2qMeBHCvS7ApA6vqJSwZVFzExqvym7Hbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424469;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ZEF2f4QM23xxp5nfr+zqHD8hjPW2/JUV1k15Xchzdzs=;
	b=K9naAQYnhn4+jR8fWTRmzmAA34rxViZqOarOcDFuSTr1iLOFyvsQLd6ooJOiAlJPjZTM
	 ze2zEsuRRSS52sQeM0knk8baU+r0mHUgs81EtEJWq4EEayi0YodrNt/p1Z2EgleTkpFsJ
	 qZ5rTT4dp03a1wxiM9dGJWNuWqZAwTlyXBI73I1FOBn2t7Qneq4Hf9uU1C/xYD4Tnu/HV
	 GU3gCDck1vRFc9Ci+UIdxnsKc0jG5xX3smzXdhdXoInVTTl1Gh3fnucgHAGGccXFCvUkw
	 2xXQtEpjjiyxhe3t8LDl3HpfNfAwG5zr5q6F8yBpPJMGdEs2YYfm8G9A8hTTykPY9Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=dTHlKQS5;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B01F606A31A;
	Sat, 31 Oct 2026 05:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B01F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=dTHlKQS5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=ZEF2f4QM23xxp5nfr+zqH
	D8hjPW2/JUV1k15Xchzdzs=; b=dTHlKQS52p4jU6k6aQY90t5//eq2cLropd6mJ
	E9BMVmgrvidnFacwWKaT18jB+uq8/j3yJ2YuZxK2BICSgVe59HfpOkyClfs26aQi
	ksJgzABeqEduCpsIMiaT6aDSN/wsiPYyJ7hPcgofqrN2x8g/4orOGOj0NL58pF4y
	Qr4Lvw=
Received: from [127.0.1.1] (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAns0dHfOVqqzVtAA--.5315S2;
	Sat, 31 Oct 2026 13:27:35 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: sashiko-bot@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750-lenovo-elden: describe
 the WL2868C regulators
Date: Sat, 31 Oct 2026 13:27:34 +0800
Message-ID: <179342445495.451929.5990710287507462097@mail.ustc.edu.cn>
In-Reply-To: <sashiko-outbox-191739@kernel.org>
References: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031034300.272730-4-xiaqinghuan@mail.ustc.edu.cn>
 <sashiko-outbox-191739@kernel.org>
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
X-CM-TRANSID:3pYKCgAns0dHfOVqqzVtAA--.5315S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWrJr45tF15ZrWktFy8uFg_yoWrWFWkpF
	ZxKrnxKr4kKFyIk3yxCr48tF1fuw4fJFZ8Cry5G34kAan8WFyIkr4Skw4Y9FyUWr18X3WY
	yF1a934fKFZ8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU5-VyDUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwAysw

One note on how this mail was written, since it matters for how you read
it: I work on this board alone and my English is not good enough to
write upstream mail unaided, so I draft with an AI assistant and edit it
myself. The content, the measurements and every decision in it are mine.

Four findings, and three of them are real. Taking them in your order.

[High] i2c10 enabled while qupv3_2 and gpi_dma2 are still disabled.

Confirmed, and it is the worst of the four: nothing in the patch enables the
parent, so geni_se_probe() never runs on qupv3_2, i2c10 is never populated,
wl2868c_probe() never runs, and none of camera_ldo1..camera_ldo7 exists at
runtime. That also means the twelve "*-supply = <&camera_ldoN>" references in
this same patch point at regulators that cannot be registered. v4 enables
both parents in the board DTS:

	&qupv3_2 { status = "okay"; };
	&gpi_dma2 { status = "okay"; };

I have not measured this on the board yet - it is a DTS-only change and I
will not claim it works until I have booted it and seen wl2868c probe.

[Medium] undocumented sensor/lens compatibles, missing CSI endpoints, and
power-domains on external sensors.

Partly accepted, and the parts that are not accepted need a different answer
than "fix it here":

 - "giantec,gt9764" and "samsung,s5kjns" are documented, just not in this
   series: the bindings were posted separately on 2026-10-27
   (<20261027051048.213177-1-xiaqinghuan@mail.ustc.edu.cn>) and are still in
   review. "galaxycore,gc08a8" has no binding posted at all. So the nodes
   here reference one reviewed-pending and one non-existent binding, and
   dtbs_check cannot pass for either in this series.
 - the missing port/endpoint nodes are a real omission. Sensors without a
   CSI endpoint cannot be connected to the CSID, which makes them decorative
   in the current form.
 - power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC> on an I2C sensor is wrong:
   the GDSC belongs to the camera controller that owns the CCI bus, not to
   the sensor, which is powered through its supplies and its reset GPIO.

Where I disagree is only about sequencing, not about the facts: the reason the
sensor and lens nodes are in this patch is that they are the consumers of the
regulators, and the binding reviewer asked for the users of the binding to be
shown. Dropping them makes the regulator series a binding with no consumer
again. So my plan for v4 is:

 - keep this patch to qcom.yaml + the WL2868C node on i2c10 + the regulator
   supplies that are genuinely wired on this board, and drop the sensor and
   lens nodes until their bindings are in;
 - carry the -supply wiring in the patch that adds each sensor, so every
   consumer arrives with its own binding and its own endpoints;
 - drop the sensor power-domains either way.

If you think that leaves the regulator series without a user, the honest
statement is that the user is the board DTS as a whole and it will land in
pieces; I would rather say that in the cover letter than ship nodes that
cannot bind.

[Low] cci0_i2c1 and cci1_i2c1 disabled while the bus0 siblings are enabled,
bus1 pinctrl omitted, node ordering, and "two CCI controllers" in the commit
message while the SoC has three.

Accepted on all four. v4 leaves both i2c-bus@0 and i2c-bus@1 available (as
sm8550.dtsi and sm8650.dtsi do), adds the cci0_1 / cci1_1 pinctrl states on
gpio115/116 and gpio119/120, moves the cci nodes to unit-address order after
videocc@aaf0000 with the pinctrl nodes alphabetical inside &tlmm, and the
commit message will say three controllers exist of which two are described.

[Low] binding schema, SoC dtsi and board DTS mixed in one patch.

Accepted, and checkpatch already told me the same thing in the same run (one
of the five warnings on 3/3 is "DT binding docs and includes should be a
separate patch"). v4 is qcom.yaml one patch, sm8750.dtsi one patch, board DTS
one patch.

Nothing above is measured except the DTS content itself; the probe of i2c10
and the runtime existence of the regulators are still unverified on hardware,
and I will report them as such in the v4 cover letter.

Thanks,
Qianhui Xu

