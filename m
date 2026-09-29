Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C52D3225;
	Tue, 29 Sep 2026 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669104; cv=none; b=EuvQk1AfEQTGmv5oa5q/G2fMBrSJScbyC3CMxYG+q0VkpAWm2C1offSpUyEciQQYHVdcZzvF8yIkvvvmWHmRwvhwgwzqw/71H/NSeIP+nuy00Ns5AqD+4mjfp754q2FEwwqCKmN2Z+ZS0MAry8/MOgHw53wjQO7JbmoW64s09LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669104; c=relaxed/simple;
	bh=H/u1bp9WWsdpdARAjI+1PMs8EE941fO4oZ+dTqpHuvA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjKS6K6v9ytRpfjd3zGAQot0HRsNZz1KrHkEUBAzsmoEc1rnepVHnECVgUDwl5Y01FY00GdD0ZH1BWQtyilHgrvSakHXmlaitD7MI8Dy9w4+BDtWmBlbGoXQGDnbOASav5I0Bn/E2Q9w3jWZd6coIPuOrLadodzHn+SilTyo5Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=AY29NCue; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="AY29NCue"
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f78dd921;
	Tue, 29 Sep 2026 16:04:57 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ymfpci: avoid changing control access under spinlock
Date: Tue, 29 Sep 2026 16:04:51 +0800
Message-Id: <20260929080451.2048040-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <871pad5yev.wl-tiwai@suse.de>
References: <20260927135301.777475-1-runyu.xiao@seu.edu.cn> <871pad5yev.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0ec320a9703a1kunm3b96ee5322fb34
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHRpOVkJPH0kfQ0xJHkhMH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVU
	pLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=AY29NCuefG2QmVxd+s7HcFtynnyuWetEFfNBTUJ6j+gKNP0sYVIp5ODc96aQAzuu+J9QrE9XfOFGgW43v5BfAM2jtat8erOmzW4X+1kyuiNKuY3b7fF+tuul8e1Io4gMaXQtGEJrFqrY7XYs6Ur/HHIASA1/BouEcyETUlhGD00=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=H/u1bp9WWsdpdARAjI+1PMs8EE941fO4oZ+dTqpHuvA=;
	h=date:mime-version:subject:message-id:from;

Hi,

On Mon, Sep 28, 2026 at 8:54 PM Takashi Iwai <tiwai@suse.de> wrote:

> Although the intention is clear, this is just an overkill. There is no real
> race, and introducing the offloading work just for using
> snd_ctl_activate_id() makes little sense for this old code.
>
> If any, we should rather make snd_ctl_activate_id() to be callable from the
> irq context, instead. But this would need a redesign of the control-led
> layer implementation -- that's the very reason of being sleepable context.
>
> thanks,
>
> Takashi

Thanks for the review. I understand your point and will drop this
workqueue-based patch. Making snd_ctl_activate_id() callable from IRQ context
would require a separate redesign of the control layer, so I will not pursue
it in this driver change.

Regards,
Runyu
