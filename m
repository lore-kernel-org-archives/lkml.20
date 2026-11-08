Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158660;
	b=1Xmf8GZ+UqxLggzPavVEOKOu0oyIYaeY4ICHmECsjRLlgvXp/03X9I5JbHV+DKCSlML0
	 14j96LX+iIgPp0y6kGars8zRrYc7eh8WOTADkIuDopMZbEOvH4MN3Jh/PwGxdiVueYZWq
	 QDp4fsvFNzcTyfidl+LYbLHHEN++HlMNz0QQuAkZfL5e0ErEaLHQb6B/VK+wNf77AqTHq
	 ifDSKL+bwowxGzeAhEHojR3mNqcI2/zE5IwG8v9rLpF+TJu7gOTMS33CSt2IVc84nMY3I
	 rDVs6ZHBDSD3uSyjKeGpxUSwbD+/2lwP0J4FyzfEInOLPJzog4VltWBmrqv2lieZlZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158660;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:In-Reply-To:References:
	 Date:X-OQ-MSGID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Sd2F6E2+vvUGJZN6TlZjvTejd/w2j4OQKJqvFBSb3+I=;
	b=BTODgSAdyOVNGD5qmP+drzsXaBK5qwwMEtzMvL35LflujjJrxXrodvLJnKKJHpwfHA17
	 R5ibXNKzojtAr7t2qhkvFzV6v2mxDgaJBOdS0QLBt7wkQm/M8utNY0+fGwI0BL0R665Or
	 Ysi+7ZCP8lQ+gN4YzBpg7VgeuoljNNTYROJMpd/T6qbLuGoAPf3ToJVBU8MPCgeUUVJz2
	 Df+Ir3f1FmO8CwcC4PzUbl6OLstOuLgF4HRPK9fxQHPY5DVS/q/4IXIkEN/Wea8ObXzca
	 EL5QIRCFevJgHLkPGiT6MYMObTFvzKLgYOfhZ6i3w5vp4leRkfrB8D05iw2aLUncBMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=hJJ74bqx;
	arc=none smtp.remote-ip=203.205.221.245
Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCF8606A334
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCCF8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=hJJ74bqx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158652; bh=Sd2F6E2+vvUGJZN6TlZjvTejd/w2j4OQKJqvFBSb3+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hJJ74bqxUaD9FKhBA7xB5dHBbk3QiBBtpT2OMZvy7O2vutM0dEVzrDAHLT7PAgC5P
	 Q5xLMfrpY00ddFqtjk/caJUEZtesB7oUvXzD4QatouKZQpGxDVY3MCP1M+Zcu049vX
	 z2sALATlHm6p2/470i/LEyg5huJrBX6StVvOPLPU=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158648tfv7cpwne
Message-ID: <tencent_465445D19035BA754E768042BF2C953EF508@qq.com>
X-QQ-XMAILINFO: MAUQIEZVArhLnsYD8Dui+KlixWzWH6CwW24t1Km4F3nfOJPoBna0nf7p3p3FMA
	 9k7syCti/M8l/1HnGgpgh9ZF3dFNV6lKBmiqWp+D4/7RV4Z6d10cfx2vxCyObe6wLTiwddxy1fKk
	 TFLsZ9g2PTuR05kG/pQIByejueNygMjkwuHqhCvnxzZ0+hEUc0d+aBjvKWxk4WQF5oM7P8+cXyRd
	 LtNndz8no55wErtNYLh/wKKKDo5y4Y16N31KN7zLx59k9DqII/D7sxtNXwY9KijFS3QR5MX41R4k
	 fzLjkZ5xkmiw7fv1sEcKk+sYKWvfEjnZGK7ki79L2syEwmzFF3V/F6QWXVYJM4JrYgVUk6PKwVZE
	 ZnW+oViDj26QaZV7oU31TqKoAlSJE9+KfSwel+JENAGqSAfjGUV8/Qt3SIGr9YZSJvpsTrK1OjHm
	 wLMNur6CQW/cOU3AcOWWHSXm81F7R4QXDLjfddwbIvuqPllFln+jRm5Sc8+uwnX2Zp5xqdfDAhsc
	 cKWiIyQSN4GuzIdj5ah1Eo2DRg5M05D9NfAIy98TUnCO1VLlo4I7MDQqL8NYNqCgkpWxCff5vdTQ
	 WsXqFNW3qj0cfR6bF2e0pkjwndxYugi3eH30Xn+tjDTxWJftdsA++GucSMS3UtJQZa+TR3QLYyK5
	 ryibjHD193oLBGg+DvD9ipTfhMsfb5VEMw6sI/wtniXgbkKqvkE+mTjr5Lo4U1eDoyf9FfdMty+X
	 +OK3nkun6qNbrGf+XR8D3NhmRgzwdGQph9TUbnnI/zmREd7bkDCmJpFhgf/7bpHnKcqX7Oe68rLk
	 Q2apN9ZIeOTvKmh6trGYvIy0J6ttOBS3EtzuY4s9S4ugB1i7KRGNySnvg1j2xk4BDV9dLu1GGcfO
	 lyPvWHUhwBLbF3M4mLFGsT04LRM5zTr3fj2U49GvLCxwfh4J2TCxgcLvmoLWtg+9c+/7nGB0dKqo
	 GMVy13U3D4t+MVDSeRQEgzmuaTrd1AgqHfuvwTeh1jmsr5ggwp8ylSDwjkeTHx7IpGhLQRAAfgJb
	 TFm85pd5Py34fl5dXMOENqzjaKsut9bFzBn1H1jPDoAHybbshf
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Jiawen Liu <1298662399@qq.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] irqchip: irq-imx-intmux: fix runtime PM cleanup
In-Reply-To: <tencent_62C095FCF52245E6900FBA2E4E008042BF08@qq.com>
References: <tencent_62C095FCF52245E6900FBA2E4E008042BF08@qq.com>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853265.5.9359140695668758867@qq.com>
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

Hi Frank,

Thanks for the suggestion. I'll review devm_pm_runtime_enable() for this
probe path. The driver also takes a reference with pm_runtime_get_noresume()
before enabling runtime PM, so the rework needs to balance that reference
on each failure path as well.

Thanks,
Jiawen

