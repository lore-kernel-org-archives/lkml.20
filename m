Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B007949EC5A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343606; cv=none; b=RATnVrwRs3XeeFlgz20oiMQHXXpy9xBJbmN4QenkGtuh29QNw+E+LtkkyTP0YD8RC4FerIqjRO6g7ifdLpBhu5nVfWyC4hrafCT9pF7U7E4dCQ8eYkrAso7Ye4OutL+CaBzzZeKLY18x/wj2VJPA/pBSKGMeN/gb2V37U4bYnzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343606; c=relaxed/simple;
	bh=AXKRUR9A4FIrBfJhdR+Bf9SUSczGGvQ5U+kVokyuKbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=swGKzAA+Zk/gsjMo1X7ZuljqkQ7XbBLm2N1XvzSDCvBu7o/K2kgRyxDfI1vl0riZk0N8XMhVk6i1lJPulfpur9X27gASo7RMQKjZgcHD9GBTl/3BL+RJWQ+Jyf/tQavPQufeXZ9Y0oF7XsYPN6cNbGFORXOBajYz+n+P9s8OO3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NG/AEA5X; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NG/AEA5X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9AEB2C653F3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:40:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DDD76073B;
	Fri, 25 Sep 2026 13:40:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9147E10329294;
	Fri, 25 Sep 2026 15:39:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343602; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XHkEOzH7Xbe/GK8KJUktRku6qNZ+JMr43NslTVYlhXo=;
	b=NG/AEA5XkeVoN9LDRMXzCggJJ0effMbNMsX+bfZB7oZRhLeHyYc5EYwPgkeQjgNIz9hk+f
	DxIgQ1wnQnCKB9Jjk5AzrYV2RVizD2C1IWxusi60TXHD3oQd3p/2NOOpIyRZ6MxPVbrMab
	tnrej4pqBJzYjyAtJW+SyubNdbYyiJJtg2YffSj4vODQxW6seJRbVsZXySInOoMhz39Rcc
	i/HlN7GspKRTcsn3ys8cCThHnN7hxVl4+6U7jnv9CM3z6VM7jHUO+LkeTMP3ZLRR1iEWq0
	oOmqofvjqyORFbRAfFGZEHJSL9A2RRtjvSrkhzwfzyfsmQSOuF/nKOGU159jEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sagnik Sasmal <sagnik@sagnik.me>
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, 
 mikhail.kshevetskiy@iopsys.eu, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <010701a08d7e1638-79aaf1ea-cc8c-49e8-ba74-cba028aaa183-000000@eu-central-1.amazonses.com>
References: <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
 <010701a08d7e1638-79aaf1ea-cc8c-49e8-ba74-cba028aaa183-000000@eu-central-1.amazonses.com>
Subject: Re: [PATCH v3] mtd: spinand: Do not update the QE bit on devices
 without one
Message-Id: <179034359937.1130052.15368175578389496971.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 10 Sep 2026 22:44:05 +0000, Sagnik Sasmal wrote:
> Commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
> steps in one single function") moved quad-enable setup into
> spinand_configure_chip(). The new code only determines whether quad
> mode is needed when SPINAND_HAS_QE_BIT is set, but calls
> spinand_init_quad_enable() unconditionally. This clears configuration
> register bit 0 on devices without a QE bit.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: spinand: Do not update the QE bit on devices without one
      commit: 6b660e07255d46a25a7f8cf158804506dffbbfa7

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

