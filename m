Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768821;
	b=pkOrHu5L+dGwUYZx11Bbxma1oROrJDVNUMg3LJpQnNcmdrs4+8Z5+tfxxIk68M/X9ISe
	 1aRRpTjTLfFbkW+XXrIXopqy8YpiDCv8WSCUcts/dx5qqatuaMKTKgAkP3p2Hflti6EWJ
	 TEbUPamtByPDRsRrmaYd/pIzib9thtiC5LJ9MqgfVcmWeHrYuudGx+ZXgGhf7P/49uv9T
	 aJlNBtW3PRXtY6NJ7UZCaZZ8R4O/93+lDdLU/e7e/DEoygAtex/Ck3sm9rRhyKlPtbZ24
	 jEbW+j+3KkwxaTdQmnz+34DCAN8skVzuEPPyIo+crA7WmkVkan1JBbYPzZKKr3qLmcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kgBPwDDX0CwJQQOHPTuz21QVSBDvEn3NadhaVZDEiYM=;
	b=Gqro7f4NUhNZKtK6uFFNF9nC1KGYXmStGaDc6rkKWC33JZEGm4AcAu052aJCeVmUa+fM
	 IYJpvDdN0oqdKHrnR+wJ2avgI3AjzrDuT2s596nxWR2GE4wuX5aDvGzJp/pMhREl+Dol4
	 g/rIbJXNGJ81SO5fPa3X4VOamAyic75SkLUbRJmjh7ki1sXPGfmudSQ+9fn9U63jylVhm
	 kV+SzlDq7JaXxQ9k/XTYilg69PQssTbgE7A+frd9jt4CWzh6sC2IvwHnf7Ztrznnesz/K
	 hBY2RCGajHAYXmIJr5ONhXKpcmmhR++P5dK46PDbe7/9uNpr2QyfPaedMHlYHsAaABA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=cuSfOPL9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3AB606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=cuSfOPL9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so3910035e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768819; x=1795373619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgBPwDDX0CwJQQOHPTuz21QVSBDvEn3NadhaVZDEiYM=;
        b=cuSfOPL9SxtWJBIQCPRkCUVbjmCBC3S4+VTz+bTqgxvRZhgftPlGpK2uiuwvIjogDQ
         CYGi0qIXqJ13VzjJc5XxVsflKsZI7NzypaDFx8hpEwczBtUxebgzAXG9bMyVONf/Pbtt
         fSt9qTLUWmQvq0iCQ23655ig0PSIsYtrfeqYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768819; x=1795373619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgBPwDDX0CwJQQOHPTuz21QVSBDvEn3NadhaVZDEiYM=;
        b=VOpwimipZ1sHHswGwQm/XTjLWc8NSyidzaSgc+aMd8o21OBUovzqiKnzffWpfiBqnh
         Ror/c2EC9lLxzC5RGX7e6TUG72TpyDVEeauY/czhhgPqh9D6yOLZUoY+CPeUKZYJ5iHR
         tEZalVaaUdabPMmSnZwrkqW9/n2hV3ul9QK1Bxej1tVj6ynVn6Dly6c75h3TORG56t16
         dthdh2uePKEuD90D72QLS4WVUYt0XKwcGuxBnEm8Uoku/Etz3u6BL/emL5+5Uo0fmrVX
         u6EqMdOF4ewa9878024+0w60yz0xvYTr9XrnsEcWi2C+Si9eOATFxWt3iR/BuysHoHAB
         kfJQ==
X-Forwarded-Encrypted: i=1; AL+hErFzklJj7VuSKurqu1OXvjqRis9MK2sAKBVF9HodvtMQGnHpHzQD/CtlU6Jzah03YYbCobnAi9rkZBXIy40=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iimKqzkcokQS/CrGEwicLLgiWvJThFm3oeS1nyUKEl2gknUiL
	OIC1LkfPDShfUgPQ3XdE5BbJp3blH5PDj766QV5xemu4dmTZeprOd7L+luVHZojDenY=
X-Gm-Gg: AYBFou2sym3jeRIvtQpEvEF7hJfIj+/oIcOH5OwkgOaytTJxL3VS9IcQMj6yJd3s4jG
	wOUZZSBsALrB3Y14IEybMFTrlHQUxDZVXcMU8YsYPxeGdhd3XvKW2leIg7JJehtd/Ytzlcbm+nE
	FUw9PrJ3f970WlQodTH0J2WwY1+BEzPGTISDpuzCXG603c5m18tMNGpCIAxfwjAbq9OOqAAT7Qm
	+6fx1gBBuH26rxYNCXHCXkaRqAtlV20SeAMQDW1/Jxlyo/SIS3DcpbECOUEgi9yjUEAVvx+FigK
	JcIG0oKbqZQztt5ghzOwxU/FBUNe9ce0RZ+SCL6Jrq73U4+mPNAB6JvFHQYZqOhOSreOA5zoOaR
	zjfaCO4WpHld0PnMuR4S+Aowe53VEPaVzCBXamX61eU2gEQYmznjQR7fdcZXpM0DVXmnNaZqyrU
	updZX3h2leZhua88e0mmElMp1/cvKOWQ4e3bQGB63SAJR81pkHn8bU7zZE1jJZ0WXFu6lky72ZK
	I7DpskH4It7Y5fkGc/pphWLPESZHEyGtuYE5nozESbvrD8Vz4fV9nrgbUSUEiXSLMRF+ozxUvMJ
	x7xXC9WjxcIZhBnDb0MbiL/gcDReNYpfxd2yGJ+G5SrLidJQXp099nfkj5vVvrtz6dMm9LSPqWF
	DHGRueuQ10ZT8qOrjSl0TtWyIHbvVZF4Dykof0KoNZhfUHkh0qJJYL5BAOSmtPNokzSySwfE6+d
	urrJC7dt8PTOaOhQ==
X-Received: by 2002:a05:600c:3ba1:b0:4bb:6847:792d with SMTP id 5b1f17b1804b1-4bb68477c2dmr82470275e9.20.1794768819503;
        Sun, 15 Nov 2026 10:53:39 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:38 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: dwc2: gadget: descriptor DMA fixes for BNA, found on Sophgo SG2002
Date: Sun, 15 Nov 2026 20:53:32 +0200
Message-ID: <20261115185335.782678-1-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
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

These are the three patches offered in [1]. Chen-Yu asked for them as a
series and offered to test on a Milk-V Duo 256M.

We run a Sophgo SG2002 (T-Head C906, DWC_otg 4.20a) as a peripheral with
g_dma and g_dma_desc both on, as a composite gadget: mass storage, HID,
ACM and UAC1. Descriptor DMA works there, but only with these changes.

Patch 1: an isochronous OUT endpoint that takes a BNA is never restarted,
and the BNA interrupt then repeats until the host resets the port.

Patch 2: a bulk or interrupt endpoint that takes a BNA is only logged at
debug level. It stays disabled with its request current, and the
function waits until the host times out.

Patch 3: why bulk endpoints took BNAs at all on this SoC. The core
fetches the descriptor before the CPU's stores to it have reached DRAM,
although writel() orders them before the enable. Reading the last
descriptor back between two full barriers closes the window. The
measurements are in the patch.

Patches 1 and 2 look generic to dwc2 descriptor DMA. Patch 3 is the one
I am least sure where to put. The effect was seen on the C906 only, and
the read-back costs one uncached load per transfer on every platform. If
it should sit behind a quirk or a core parameter, or belongs in the
RISC-V T-Head errata code instead of dwc2, I will redo it that way.

Known limit of patch 2: it starts the current request again from its
beginning, which is right when nothing was transferred. That holds for a
chain of one descriptor, the only case we hit. A BNA in the middle of a
scatter-gather chain was not exercised.

Testing. The series as posted here, applied to 7.3, ran on the SG2002
under the load described in patch 3: 1.47 million TEST UNIT READY in
8 minutes (about 3060 a second) with a 1080p60 H.264 encode running, no
BNA and no port reset. The viewer's network link dropped several times,
so the encode ran for about three quarters of that time. An earlier
form of the patches, which our tree carries, saw no BNA in 6.2 million
transfer starts and none in a 60 minute run at 1080p60, where there were
about 6200 a minute before. In that form patch 2 also waited for the
core's write-back of the descriptor at XferCompl and changed the AHBErr
message; both are dropped here, the wait because it never triggered.
On 7.4-rc1 the series is build tested only (x86_64, W=1 clean for
gadget.c) and passes checkpatch --strict.

To try it on a CV18XX/SG200X board, gadget DMA has to be allowed, since
dwc2_set_cv1800_params() turns it off:

  --- a/drivers/usb/dwc2/params.c
  +++ b/drivers/usb/dwc2/params.c
  @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
   	p->host_dma = false;
  -	p->g_dma = false;
   	p->speed = DWC2_SPEED_PARAM_HIGH;

and "usb: dwc2: Disable gadget descriptor DMA for Sophgo CV18XX/SG200X"
must not be applied. That change is not part of this series. Whether
DMA should become the default on these SoCs is a separate question, and
host DMA was not tested.

An AI coding assistant (Claude) was used in the debugging sessions and
in drafting the code and the changelogs. The measurements were made on
real hardware, and I have reviewed the patches.

[1] https://lore.kernel.org/r/CAH_=YdDCDyFBn2k18w8Ck5jrmHHZme7TuAA71hSgcAa9ZPb38Q@mail.gmail.com

Vadim Yuzifovich (3):
  usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints
    after BNA
  usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints
    after BNA
  usb: dwc2: gadget: make descriptors visible before the endpoint is
    enabled

 drivers/usb/dwc2/gadget.c | 112 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

