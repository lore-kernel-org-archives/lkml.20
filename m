Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380EB54A7ED
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877391; cv=none; b=mV4B5W9qovp+LpNBI9rEQj034RST60TPX3bs0kRS+LLksEh+gK0VwdQJ76QCA0gtwlFzPd6XXsQtPqz+7xzKbRqBf694KeHLnJoYcSe9rRpriTkZ9HiDPy1MQrnpT2vBCtjQ+96cDmwsBu/WM6zduHZHtqF5jYDtvKHuGbkXCZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877391; c=relaxed/simple;
	bh=r4WcVwJlAzuVfNTRa6K7DKxEadAS1Eak2yTrvNVf/t0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PG6IAjn0eNp40XR3PcIOacaktoOHS8Pn14knRLtSOyyLlyeTo8MqucKhP+DqgQFf8wNEeuNSrdODWrzCwg9e5zJzmt+FYLugSG3BVF9/ZuFSBewcvnUl9bcB2GtJ29/3n1iLJFEXI8T4zV4d6oooymFLJmxw+LKBLJ+ve43FpJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AxJ9Fp5H; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AxJ9Fp5H"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE9954E41591;
	Tue,  8 Sep 2026 14:22:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2A8D603C4;
	Tue,  8 Sep 2026 14:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B59EA11C7AF4F;
	Tue,  8 Sep 2026 16:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788877371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r4WcVwJlAzuVfNTRa6K7DKxEadAS1Eak2yTrvNVf/t0=;
	b=AxJ9Fp5HlfBE5bikqJQUJyrn4SaOZ4JUyUCNsg5AqkyFADS9syKyvQ1IOfrLpe6dYA18Wl
	Cotr+r0M9dCZmioI6o12FqqVCEH60py+7MW4/yxeFx+dIkwn6QyQv5LbtmH+4ieCL6Nm8e
	4ebttxHJL2Z45x6sieycjY9yZKjY+LO0RXpoSVfq7e/QEXGveUifKnB9XO/PWkdLbKu0cb
	QKG9rXTIxF8I20TCIHhWrptR676uQsmSdENRHKIdg/N1gbUQkoaBVFAQ+2LwhEMvY5vhcN
	6qr06W2/J+jelEhTNXA0U7yrTsyiY4ZnoDDmBony7NQBjAH76WP/Tmw7PuZ8ig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zongzhen Feng <1768315307@qq.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  richard@nod.at,  vigneshr@ti.com
Subject: Re: [PATCH v3] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
In-Reply-To: <tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com> (Zongzhen
	Feng's message of "Tue, 8 Sep 2026 18:19:58 +0800")
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
	<tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 16:22:46 +0200
Message-ID: <87o6e7u8jt.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Zongzhen,

On 08/09/2026 at 18:19:58 +08, Zongzhen Feng <1768315307@qq.com> wrote:

> When squashfs reads files through mtdblock, the mtdblock layer
> splits I/O into 512-byte sectors. For a 4K-page SPI NAND, this
> means reading the same page 8 times (4096 / 512), generating 7x
> redundant SPI read-from-cache operations. Each such operation
> involves a full SPI bus transaction, significantly slowing down
> boot time and file access.

I haven't made a review yet, but there are still a lot of Sashiko
complaints and they look reasonable. Can you please check them?

Thanks,
Miqu=C3=A8l
