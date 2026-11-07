Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063299;
	b=HhLSE2nIpMen/PxSo0PTkXSdBvg0IeTjMwkwvsW/i9sQ7oh99aOs4RCk8+IT3MmkBDJJ
	 jxcF/dRhYP94nE41o9Y7QVGFa72Z3UTKlUaEKvgwO9tRYQuwkidd+iZOhfX1s9VGks6xV
	 Rhen2rM2nhr96YpfvIYBrqBx6/tJYzSvE118e1zZhpcgHuVus3JTSL9wue6V706KIGjZU
	 20wqp4D1lS2SzgsoUalQjaPaMQd84V1qm07vDtrcLSRyZ6yd91UBM8pP01ec4kv9SfT5t
	 9ZwWhhpoVfZzkGE97nwpPW59Y2gijQKBHwwbnx+GxfF9vdfuiNdk3BeJ6A5z6xLUf2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063299;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Disposition:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=fwzgFfyRkO7QHTV+n5xTB271rZfLlWMBGyUdFQl14XY=;
	b=sPy71IzB6uTolJL68SpZIPS5ZA5wOFU97VkJcE8n9YS1mvaP+wkwk4to/bTnl+JxRzyE
	 CmozLa20foYijz11Fk8ft+JWn45ohqFOnMxY4U+Rpp5+0Jl30bJ0J5JJy2oW0WGcXuyTm
	 IT3yrsPykChQflOikrRl+O8YdPBTynzJKN8d+PzPSqMNkvXQ4rRdGoFvPwZRlKAc/rN6A
	 OELQKO8FZupjLcnq7g9FYT5R3YJOXYY7MSqjJ+VLsONyGdFMZVnSwhV6vep4f9zQjQfzg
	 E3vobnnSuFIWmCpAO9exua1Lu6ewiqtVmvrYEQ5tH/zb8Y1G1H8qOrHceeTeXAb+f6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1532E606D821
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1532E606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAC3vI2+O+9qHm2AAA--.8910S2;
	Sat, 07 Nov 2026 22:54:55 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>
Cc: linux-regulator@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: tps6594-regulator: Fix np_pmic_parent leak
 in tps6594_regulator_probe()
Date: Fri, 7 Nov 2026 15:00:00 +0800
Message-ID: <20261107070000.0000000-1-vulab@iscas.ac.cn>
In-Reply-To: <9931609e-c74a-45b3-8dc9-ced30cc44d81@sirena.org.uk>
References: <20260917143155.2156974-1-vulab@iscas.ac.cn>
 <9931609e-c74a-45b3-8dc9-ced30cc44d81@sirena.org.uk>
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
Content-Disposition: inline
X-CM-TRANSID:rQCowAC3vI2+O+9qHm2AAA--.8910S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw4kuw4rXFW7Cr1UCryrCrg_yoW3trcE9r
	WkKrsrKaykJrW8W3W5KF4aqF9Iga4j9w1xCw4DXFW7JryUZFykXFyrtw1v93Z29FWjgr4a
	9r98CayY9r1qvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vE77IFxVWUZVW8XwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjc
	xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr
	0_GcWlOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
	573PUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgMEA2rvBClaZQABsU

On Thu, Sep 17, 2026 at 11:21:42PM +0100, Mark Brown wrote:
> This doesn't apply against current code, please check and resend.

Sorry for the very late reply, and for not checking the patch against
current code before sending it.

The reason it does not apply is that the leak has already been fixed by

  7fd28093b3ef ("regulator: tps6594: Fix device node reference leaks in multiphase loop")

which releases np, the intermediate parent and np_pmic_parent at the end
of each iteration, and adds the missing NULL check after
of_find_node_by_name() as well.  The commit is in v7.3-rc1 and later, and
I confirmed that current mainline has no unbalanced of_get_parent() left
in that loop.

So there is nothing to resend from my side, and I will not submit a
duplicate.  Sorry again for the delay and for the noise.

Thanks,
Wentao

