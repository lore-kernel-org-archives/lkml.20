Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AF50EC11
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778083; cv=none; b=krvIsLijwWEHv829FrhTTDX//Ck2v54Lmc7SBjvL1qZGxOyIjOZBksSY6PrZNZYDwRMA/4tFdjRStV5PLUxcl3zLmINyvrOQUkwabsY97sHjX+xIpvliXr+MBXTCQ1szDHije9DXC9f4d+MN6pp3WP2ejAzC3ptV2SsD1RjEYh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778083; c=relaxed/simple;
	bh=uXwxt0Qhbcg0O7ZYfHlUJHUOGbr9HzDCl+H0IvEAXtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgzDmQaAlRCLeFcs/qsQaN63ZNqnpFXSZk1aZ/rgVoJcCtbikKbkSkCZvf+x8L/kuOptJwkb00K8L5GZ2gAawd24dzzF7Cfemc0PQQSSLoTQwXWrFgTZBA5JFCbe3DvHtC6kFYonpA4u+wBHpvtrgDFC2+ezWXZjJQuzDt5WH8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aL+o4Jao; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aL+o4Jao"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 308004E410D9;
	Wed, 30 Sep 2026 14:21:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFD9E60749;
	Wed, 30 Sep 2026 14:20:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D10D5103283FC;
	Wed, 30 Sep 2026 16:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790778059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Cp+D07WurpbWSMpKPIKSwnGgyFLxPSz7Sc7naukKSWg=;
	b=aL+o4JaoBIzNiZWSzVmZJCG7egwzH8W98aDqnjHQhKcZqlO08OmZwVowGNlXsJHXckHUZt
	ITV52l1zpOZ5QsiHZ37nAMv2Bmz7pmfGbcEGnbbcQPwn2HVShx4AkRzBH6g8ywF1FvcRAr
	4mjXL1s4237TBSeOF08WSgU3+dzHbwKxuVHN8Q+6/zn3BWyagSkEbFROk/QJnQf3I/u5bo
	NFVN/G6MRe2PSYZgt9ngEU/whfqYwI2BMGkM+fy9adM1CZwrH4NKIiYXquKhoMXCM5rgYK
	Pemx2v6e0KFM7v7eVgagOGgRa0pk8BbJtH2Bwfqu+X2KIAiTeth+psp2J4EU2A==
Date: Wed, 30 Sep 2026 16:20:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Song Li <songl@zju.edu.cn>
Subject: Re: [PATCH] i3c: master: adi: free the IRQ before unregistering the
 master
Message-ID: <179077804631.406255.4420583421827208390.b4-ty@b4>
References: <20260923085340.490776-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923085340.490776-1-fanwu01@zju.edu.cn>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 23 Sep 2026 08:53:40 +0000, Fan Wu wrote:
> adi_i3c_master_irq() is requested with devm_request_irq(), so it stays
> registered when adi_i3c_master_remove() runs, and the writes masking the
> controller IRQ sources do not synchronize with a handler that is already
> running on another CPU. i3c_master_unregister() then frees the
> struct i3c_dev_desc objects that master->ibi.slots[] still point to, so
> the IBI path in adi_i3c_master_handle_ibi() can dereference freed memory.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: adi: free the IRQ before unregistering the master
      https://git.kernel.org/i3c/c/1c1e2d90aa45

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
