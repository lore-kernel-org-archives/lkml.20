Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2CC3B0583
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278059; cv=none; b=XBikb5N7ZGh6vuy5pJrqpEJCJynhMLrJL6i2EXczXetoPPbGrlB9fhWWu8LElu1NCFOmoFYP0UB36Er1B0kxCbzQnTJ6aL03XB8eEdtZrQQ4IwiacxxfOUcVwtEE6IaY9j9FZRPUOxChVhFhNv1Qf9jYc+kr0MYTRBLlWtUzRRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278059; c=relaxed/simple;
	bh=PfGEGa9wvfw0RCllVqPBZxXC8XwYxchEGD4nyMsP3Ms=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=LZ9jOv3OfHcWpH1zd3w/T92vEbr0G49M65JpNxQdsJL7ucAdpf19rqs4A0nxLx5eJTfL6nZ5SytSD3/Cn/vi5zl4iLXfdoC+UhwtAj1G1WxkRas4rZ/4QU2MDNSqLSyWZYSIYjOcXMDkE8rcZG9ZZBe31u7TrwuJHeqw/XimMD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2eFLSOD9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2eFLSOD9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5FD084E410FE;
	Tue,  6 Oct 2026 09:14:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2DADF60553;
	Tue,  6 Oct 2026 09:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E27B0103308C2;
	Tue,  6 Oct 2026 11:14:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791278052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fMapAeKmXlDWuv9nzOJJeiM1M9TPlq/T8BrfoSxUyH4=;
	b=2eFLSOD9RyMdir4MSqS1kS1pCLaRHC6C/TItzX6FfbjNkM+odG5bhFxyVmRmi0O2hU0Iwz
	b5pEUT11p7IUqrjvVuUS3n9wkMHtYOK+hQBOHM8IE3QDY+Aj9NTZ+z5CbW1hPFPuMuvzOF
	dX40CnV5uZVEl1QndICmnzLPVkXIQpFKFtwoX1lzAovLuVzKHjoLCONSoy/3DS6swNWWD1
	NcIJal5uysHoPHgsOvD+9LtvV6Z3tFi491YTVCmQMt5NmD8Ciurjr+KrlMHyVPIKgW5RZW
	edoM2RJD4snPz/3lom2GExF9sfPQr2EXqOtyqykJr5r2XQm2JIUCZxPUT3i8/Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Oct 2026 11:14:09 +0200
Message-Id: <DLXN2NHRB139.7OA9W663817Y@bootlin.com>
Subject: Re: drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c:72:6-12:
 inconsistent IS_ERR and PTR_ERR on line 73.
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Linus
 Walleij" <linusw@kernel.org>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>
To: "kernel test robot" <lkp@intel.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <202610060853.t5Q4BX8P-lkp@intel.com>
In-Reply-To: <202610060853.t5Q4BX8P-lkp@intel.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Tue Oct 6, 2026 at 8:40 AM CEST, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   2c3418fffa9d037b2038a6db48be63f9e2291806
> commit: 5b03d4907db93627ef48396f39c3455ce644c946 drm: rcar-du: encoder: c=
onvert to of_drm_find_and_get_bridge()
> date:   6 months ago
> config: sparc64-randconfig-r2106-20261005 (https://download.01.org/0day-c=
i/archive/20261006/202610060853.t5Q4BX8P-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1=
95c81658995a4b7531c30a12c5aef6cf2bbd671)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: 5b03d4907db9 ("drm: rcar-du: encoder: convert to of_drm_find_and=
_get_bridge()")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610060853.t5Q4BX8P-lkp=
@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c:72:6-12: inconsistent=
 IS_ERR and PTR_ERR on line 73.

...

> 9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent =
Pinchart 2020-12-03  @72  		if (IS_ERR(bridge))
> 5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Cer=
esoli    2026-04-09  @73  			return PTR_ERR(no_free_ptr(bridge));

This looks like a false positive to me. I guess this code would not trigger
any warning without the infixed no_free_ptr(). But no_free_ptr(p) is
transparent in the sense that it returns a copy of p.

So I guess no fix is needed for this driver. Just let me know in case I'm
wrong.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
