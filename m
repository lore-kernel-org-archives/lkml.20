Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189360;
	b=O0nSvXh3VitvEkvzL36HcYf58W0GTKXahzDQKXGAMWqQDB3mfgBBlZXrjyB4mxdK6WTx
	 vOsMKvpLH03ULW95jsXt70GQYz505kHVSNOWR7ixqMTEj2zj+/ZOtuh1u8uS0xp6ZFY2z
	 GwuqnZ8c7IWjFP/GbVn/lvDJpbuillYD3XI9u7UIkOBCer7cp0xsbfZK0iQz9nH0vfdhh
	 bZHSBnxEesxoW3rnyEH8re5vOM73cy2ff/HC39XbjdErXeSlZPCXLPC6PiOftGHjJpja7
	 fRep36E3OEVm5kew4/QqSg0/Vypmo54+zEoyNy30I9HCol/B7pAe37lPnkFj4KSehLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189360;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=1Sl6O3iIgu8J9uI3oOhkGE8jeT+SgkyHgDaQbTxgDr8=;
	b=VodjKr7bhi9GimqABQcNpwg+6ZMlWryRWCLp/n+DSrSnMGSqXdmLfwaGMIs3PNzbhXDk
	 NO8DsTBm7PH6BOgz7kGQ+2+crq2+Nfjx0rpr9mApaBENVbndt1sbmiUPtGeV3dbZKcPiU
	 qEONx0ggLOTTownSGj4dTeYmxnG9NgOARuM8QXBsZ0ozk+sd9crOY4+6Mk2AVrk60AFhM
	 qLKU8hwkFolcTpsv0CNPsrsZ3qyuh2NN57SK0OndVCDrwLbQMUQS7xUY10CxqvDBHysqV
	 93CESyopg1BKD7cytQHCncf9eZR4o928rmifVmd1wr9fGpey60Co7gFosTWVhirMkAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=tkeH2Tgb;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F5A606A322;
	Wed, 28 Oct 2026 12:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F5A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=tkeH2Tgb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=1Sl6O3iIgu8J9uI3oOhkG
	E8jeT+SgkyHgDaQbTxgDr8=; b=tkeH2TgbWNIu50IYUGT3oXGw10GBIoxnYI+d0
	xgJb3KLMB14z+12D+kYmups9QMi9sJQZHBDL0hh1X22+P4z5XPlu/tfDCm16FFKU
	O4va4z0YUVN0dIYgTDtsbwIaBwYm7JqO+DW6zhXXfuDP/ORKojjhiNpUICnwRpFV
	3gsOXU=
Received: from [127.0.1.1] (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgB36i7o5eFqydxYAA--.812S2;
	Wed, 28 Oct 2026 20:09:12 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
Date: Wed, 28 Oct 2026 20:09:12 +0800
Message-ID: <179318935222.107529.54392791903989018@mail.ustc.edu.cn>
In-Reply-To: <8e05a28e-7881-4bf5-98c7-c5ccf4e22735@kernel.org>
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
 <8e05a28e-7881-4bf5-98c7-c5ccf4e22735@kernel.org>
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
X-CM-TRANSID:3pYKCgB36i7o5eFqydxYAA--.812S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW7JFW3AF1fAF4DZF18Krg_yoW8ZrW3pa
	yfKF45CrnrJrWj9rs7XrW8JFykCrZxtr45CF1rC3s5Aws0k34xJrZIkr90vw1UGw4S9Fyj
	vF4qkryrCFs8JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9vb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJV
	WxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Qo7JUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2rg+9ZksQAPsk

Hello Vladimir,

understood, and accepted - the CSIPHY must not grow another per-SoC register
table inside camss. Our 2/9 does exactly that (a 103-entry lane table added to
camss-csiphy-3ph-1-0.c for the 2.4.0 two-phase PHY), so that patch is the one
that has to go, not be reworked in place.

What I am going to do before proposing a shape:

  - read the SM8450 series (20261026224957.1115370-1-vz@kernel.org) as the
    reference, in particular "media: qcom: camss: Allow CSI2 PHY devices
    without CSIPHY resources" - that is the part that defines how camss is
    expected to consume a generic PHY instead of owning the CSIPHY;
  - read phy-qcom-mipi-csi2-core.c and phy-qcom-mipi-csi2.h in tree, and the
    Kaanapali v22 phy patches, to see where the 2.4.0 two-phase register map
    and the common-status offset are supposed to live;
  - then restate the SM8750 support with the CSIPHY as a qcom,x1e80100-csi2-phy
    style PHY device, camss referencing it through phys/phy-names, and the
    binding describing the PHY nodes rather than CSIPHY registers.

Two things I want to be honest about up front:

  - our binding currently has no phys/phy-names at all; it lists the CSIPHY
    register windows and clocks as camss resources. That is the part that has
    to be rewritten, together with the DTS.
  - the 2.4.0 PHY data we have is from the vendor camera.ko and covers both a
    two-phase and a three-phase variant of the same block. Moving it into the
    PHY driver means deciding which variant the SoC actually wires, which is
    the kind of thing that belongs in the PHY driver's per-SoC data, not in
    camss. I would like to get that right rather than port the table as-is.

Separately: Hangxiang asked us to hold the SM8750 series until the Kaanapali
work is rebased, and I have agreed to that. So this will not appear as a v3
soon; when it does, the CSIPHY rework will be part of it from the start rather
than a follow-up.

Thanks for the review - it saved us from pushing the wrong shape twice.

Best regards,
Qianhui

