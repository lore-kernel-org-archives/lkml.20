Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61E43B4BF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634583; cv=none; b=axlo5Qu2GzP0we3Q5DivWRzbxRwWQzGbMkfiwxs0hooukDifE1Tdb2juL02Hg4YMOGoYYUSGpuu+YzK0+oEzXaH0hf7JSWVWgFkIcy9OKhQVNOu/8u16GyUphvtZOTJr+/ekvtjt4AUKPxe0/x4DJHV2Hl5+onZnTtiGim+3iVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634583; c=relaxed/simple;
	bh=nVMG1SbekNaLvNRQlQ39Yo+Gy2z6qKasZ304GKCy2GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tv2ulcayUmW3IBiK81v1y4DPtN/5jfPem3gKSpsazD7NRwt5q9wokG1m497q1HZkzKNL5d0d49Wmp+OLtQO0CYiCQ0RAQTAYTshALRVwIcP7i7YH3KMuQ0uIl9DtDzBfxmhCsoU9zbEWQTtgDUEEzuqNmVPKZ1D3cdMokULbYdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He8UH1C3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He8UH1C3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso4342085e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634555; x=1790239355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qhnvHXmqUmnS9g4y5J7KmcXx39UVV4BRbHPaDoXYC7Y=;
        b=He8UH1C3TTEZOxKwlduC92ahxT5UbiUOC7rtz6FAidL5Z3omGGvbgw9944Emm15S7N
         JwRcshv1tk8TY0Pj1l2YGEAZeVZY8yHhlaSSqgyfFClN4Z+QGO7sgwTC9VJ/+XPNT0oa
         mNjyKZM7wfckQ5De/YI1mzPjOez4YepfoizBAGiV+lrb3drSgKhEPM9SYLLFZx9MwrWG
         asNF0f9ZOhWfK8LXEbfQgydZjfTTeNuj0OkLjCE5/hcZtrEISdFffBb7vBfiv569iK4G
         7u5cD1mWdOtZFqWkTpM5VSyqQTWy0zsowKATO5srX3ZogVEsbdiXjfkRgUYaJVR0DUuN
         fzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634555; x=1790239355;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhnvHXmqUmnS9g4y5J7KmcXx39UVV4BRbHPaDoXYC7Y=;
        b=oz5K1tGvHpAGRsx95cVCSF+xiniUQhs5w7clRnPfgYDYOnK+SHscpIKQZ3b9PGQbB4
         tgC5diL2pFFSjbFi81QVakWIX57h+yyec4MpfKzA3cptmdoQIWvEXdKgM1iL19YXyRLk
         a2MNSKKZkuP38Uzc6ONX0s7RlvBKcJxCfgruH0mkzVJ+GXeKh1FMQLwgW7pVCLlOQATz
         3xl8ci/tg0kahXxXUObLVsJykSSvPlbrqVYlwweHYsmqbgb3xDGNyGMgxDW6GGcXMIiu
         kQRWzZGuNVp0h+yNWHEdqVcEeXQuybfqAVfGmMcJ8uCibO+kQxJ/vVja5uyP+V3lOhBS
         v70g==
X-Forwarded-Encrypted: i=1; AKwUvBwoOkmVd+fo11WkZgJTWKk6R3VZJBb7tfO5XvGzzGZy1WBF3cmG+z9Yj8xHXE3jXuutOPrtVtfkJB+DpvY=@vger.kernel.org
X-Gm-Message-State: AFuF++lDp26+3EpZDcb4YBLYON3ZAFKjTJRDBvkkKjceAzDdAnG1QGCc
	qtcCfx4ZIeSWifjFvhHMOkB4BwpwtzTyJmXsa1d68QuJ8xCnD+mhcVrd
X-Gm-Gg: AYBFou1lG7guGrOu73QQj+sFWmSRS9qgeTJKSqWSvqpw/3rOraDxDu2Z1LUxSOkAGdH
	N5lj0vTaBlJiBRCaVLdrm8CIIzl5mLe07jaFP4oMq2rY+s4XxokEXjtT1aYzl4FVdQcCNaKwIRJ
	yv49vJdYd/d22oYzHRbGt+JTlCcOz63pk0/OJXJaew8MloekCiOMeuWgp/lro2aB3TBZcVyHRvc
	V+Qhzy40GyFym02VRLyRdXFnPE1VqGW4veDfLycQu5j4kdQ5Yg9XNalWRRmav3zlmSy8Kala+WO
	407ONoSQeKhppns3JblMqBbrFyWIBL5Tkf8zKFWUmBc5dj8vRj9pKPm+Hhv42tjpqWkseowpzbP
	ezYZSgPs7ac+j/JppCnzS3IuTFuZZCDnI07qKHvVwt1wY1ni8hHBcsCodpCvFbapznQ/8QM7kMn
	uAky+ktp6Qlu/iBtIwvRRZctmO7fXGh9cKoa7oJuQkhuaJq7Dei5xosOWtdEdUpT+7PToG2uw1L
	ZUM5TWlsTttj0PWQW3asBApLmdLiMWicqxjgLf+l5Bp7vsVEk+ad/rJkhPQkC5LrhazpJiXZxn8
	VOON7Uk9qZ66g9C1HP6ZDK4EDPd4sTq+sO7U1R96BzYZGNYv63T1eDjt6fXA+sZF2U7Ib+pE5eV
	tzaq2qIaRD9u/GFU1WWnuaZExcdJYulp74mTgm3BCNPfIOYWUiPLvwmoBoq1CxBMuhfkLUAi155
	c0JqPdNiOPz1jOvJw=
X-Received: by 2002:a05:600d:6446:10b0:49f:bc43:9e8e with SMTP id 5b1f17b1804b1-49fbc439f6dmr34380115e9.26.1789634555063;
        Thu, 17 Sep 2026 01:42:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1d0978sm56898145e9.2.2026.09.17.01.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:42:34 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:42:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260917104233.00007a85@gmail.com>
In-Reply-To: <20260917102429.00002faf@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
	<20260917102429.00002faf@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 10:24:29 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Wed, 16 Sep 2026 11:11:54 -0500
> Frank Li <Frank.li@oss.nxp.com> wrote:
> 
> > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:  
> > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:    
> > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > on teardown or error, causing potential resource leaks. This series adds
> > > > the missing calls.    
> > >
> > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > resource leaks. [1][2]
> > >
> > > The autosuspend setting leaks if you will, but that only matters in the
> > > theoretical corner case of someone rebinding a different driver (which
> > > will soon also taint the kernel).
> > >
> > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > which is fine in itself.    
> > 
> > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > include these pair functions.
> > 
> > I get many similar patches since scan tools is more powerful now.  
> 
> I suppose that could work. One would still have to scrub the kernel of legacy
> use/dont_use_autosuspend() calls though, so it could end up being a large
> patchset.
> 

On second thought, some drivers do tend to disable PM runtime system sleep
etc. so it probably isn't as simple as adding the autosuspend stuff to
enable/disable.

-- 
Kind regards,
Joshua Crofts
