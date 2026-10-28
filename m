Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198787;
	b=cqMEfr5Homtriq/7LMmYIPGfDO6UywYHAgfekFcumqtQv25o515K2y9qI63iRCqz2Igi
	 l49W5SNguEg2rXbLe01Sd8Q/jEAYX3zJ1uK5tAsxJHzssw45+x4AEyI4X1x4Wx2bk33ld
	 sqA9+wDT9WMFzQxfT78jjbvBijlxjB/ytqRmmpnZgP2pH0xwKvM96JQbtFCnezQzlu2cE
	 z4xB0TCs1QVmjjr+ExDoBWnHeExBJ/Qm1VegRvWZmi3P1qdFgj94cIBgVPl8HfENVEvyc
	 IXXbVrOhXGGHcPkzBL4S0Oz9hWChN9nUk+HrhE7pcgbFa9bctpFBjc06vWb+FNgPA3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198787;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=vBgTVzHQFe2aPdSObqg1SHyV3sVR7n01PtlNLIgPSR0=;
	b=day8mhuLrV+aZ2qXzZSJSmhPTcJOsWXEnT0Dd08E2yU16uc0Shk7d+s7xn4ABGFAntUl
	 /d566yXbcPE89lS4Llohm+xhSv5ttJ5CMuNOyW1mHvLxzHrUxC6unkhySqhobeCfmUydz
	 Q6Dg/8aQtTKYLAxlZLsP/YAI9A7yIUNDK8ByzvzU23iI5TkFeD3azFzsyidIYMG3M377w
	 /hjzjCtX6lyyVp+u5XqiD9fZm/BZ83fZJcsgUS6Ew2ReYYXO0oG68hAUrRtd7iH6KzJOP
	 LnGzjFbbBNdOfrX8l7WdKjX4JyZLW+MQ2PbJU9HQxiGWf+DYEbe/jrWjBPA1Sqmu0/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF8606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CF8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9BB0668D0F; Wed, 28 Oct 2026 15:46:17 +0100 (CET)
Date: Wed, 28 Oct 2026 15:46:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Qing Zhang <diasyzhangqing@gmail.com>
Cc: linux-nvme@lists.infradead.org, hch@lst.de, sagi@grimberg.me,
	kch@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: protect nvmet_ports_list with nvmet_config_sem
Message-ID: <20261028144615.GA14239@lst.de>
References: <179275538809.275862.8334230595898232727@tencent.com>
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
In-Reply-To: <179275538809.275862.8334230595898232727@tencent.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Btw, I had some old patches here:

https://git.infradead.org/?p=users/hch/misc.git;a=shortlog;h=refs/heads/cap-analysis

to add clang lock context analysis (still called capability analysis
back then to nvmet) to annotate and verify the locking scheme.  It
would be great if someone could take on that work.

