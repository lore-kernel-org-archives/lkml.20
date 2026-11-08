Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130156;
	b=CqS2JoKYtZAwd36lRmJV4/lHPJ4NrKNprDQ4VL4JXahI+et0KIkZ9hw0O6IbH+bF+3LG
	 xKC1xsZT310jxOqbBr2B2Jjzrc7ttBDXCOhtAcfLpRsSYUX4Gjn8G8yOR3sSuybcY1fzG
	 Ax6yy7E9VIPvxXrioj38aWr02UwMckdSx8cIWhOBq9RgLto+Kv1NrqsegVRm8SYWXWUN3
	 lunBTM1R3ys2qCkOkwcvRVn/h2C3dfreikGaGMW5eGn9GtRxZ8Lx5i4cqnugZkfSUVZyo
	 LfcNk0ND4H7i2DUAnFXlonQ2aACCxP0sUifmc/WezGvkoAjj+ycisXnn01v54dDUbVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130156;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=tPpvEyw19jVc6Tky8BefiztXlIepqELBj3IYsA/oBf8=;
	b=im3ONbDUvam1XMS5a46xwuUNONBYCVkJLcSFCbM7n8AajRk/9D3Grscqx2EfzLZMqtMJ
	 dFClZyEltKhBUw4Sv1L7FKxLK05rBsJcdTYH6SBLbY68mEsWPWyzsRC18PyjW5s+9mhUI
	 YhZal4MShYni+kBV6o5ntWjdnMzaRw8O9A0lR/yRv5M2KFvXl1aF1WGL632pqalLpH91B
	 rUMUQp+SF/dGdLArZqcjg+0PRJA6PI1tIN5n82iI2aslHPipviwXDLj/TjjRou4+9v4Nw
	 focVTnXTSCjRfgYkuPv3lovJc1RzL432TaZkCG4wLga+n03NmCYxTJOKm0gaRDNqrzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C342A606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C342A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3zrPgQPBqx6OYAA--.31341S2;
	Sun, 08 Nov 2026 17:29:04 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@kernel.org>,
 linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 vulab@iscas.ac.cn
Subject:
 Re: [PATCH] i3c: master: Fix of_node reference leak in i3c_master_register()
Date: Sun, 08 Nov 2026 09:28:40 +0000
Message-ID: <20261108092840.314160-1-vulab@iscas.ac.cn>
In-Reply-To: <aqr19zvkGvMqRi2B@lizhi-Precision-Tower-5810>
References: <20260916160358.2081087-1-vulab@iscas.ac.cn>
 <20260916161616.7B6B31F000FF@smtp.kernel.org>
 <aqr19zvkGvMqRi2B@lizhi-Precision-Tower-5810>
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
X-CM-TRANSID:zQCowAA3zrPgQPBqx6OYAA--.31341S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF45Aw4kuryUXF1kZFW7XFb_yoWDtrcE9F
	W2kr97Jw18Jw40kFsxKF43K3ZxGr4qgry7CrZ7WF1S93s5XFs8WrWvqr15Gry7XrWSy34q
	gr1DK3y093429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
	aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43
	ZEXa7VU1pnQUUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAAFA2rv4qiU8AAAsh

Hi Frank,

Sorry for the very late reply.

Thank you for catching both problems. You are right, and I am sorry for
getting the API wrong in v1: the reference on the node is taken with
fwnode_handle_get(), so it has to be dropped with fwnode_handle_put().
of_node_put() only operates on Open Firmware nodes and is a no-op on ACPI
and software node systems, so the leak remained there.

On your second question: every other error branch in this function runs
after device_initialize(), and all of them end up at err_put_dev, where
put_device() calls i3c_masterdev_release() and that function drops the
fwnode with fwnode_handle_put(dev->fwnode). The i3c_master_rpm_get()
failure is the only path that returns before the device is initialized;
put_device() cannot be used there, so the reference has to be dropped
explicitly.

A v2 that calls fwnode_handle_put(dev_fwnode(&master->dev)), rebased on
current mainline, follows in a separate mail. I also dropped Cc: stable
there, since this only leaks on a registration failure path.

Thanks,
Wentao

