Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518548;
	b=P/KjIWBPwOBZ6QMuipBuHZDTcwlb5shjsnRz8TBT2Pb47SF8e7SVmsJcU1Mc+5jXz+wE
	 n0T22As7xxLS2alvt2bygyedMwRcqs5QScV3MLMMNH/twqBDnKUJTlznubqSskSQ711Rb
	 KJX/VAE0xB3Pd5mihPtaZDTASixsPItA8osl1mLsWJvwgsy5+VXG3OPHEYwIsWo5DRMoH
	 KEt/zqUE1yJBMrRGbVJcKmE9Z5zcxtXG1jBvK7bw5WWyv9rg05qP/vkOZouX6yp6mIZm/
	 2wRsNBEqio+9ko/gLaw9PQeNYg3UDi6lpF+Fjn/iZHfu4DKWk4M/pP3LnpR7YEwXxlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518548;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=s7FoF9hJ+Ah0TrMg+HEuap4l4DC+BeUCHbDc7MUUxoI8AAHTYR0VKFl7wA+9EHFNiTJe
	 d6PHz/lUBYYDPPYlFnc56hBcEeWV/BCCMMkxWdzePbBymRrUAnmlvFL6RQAiemGKcBE8o
	 Ef09PURncKl/pU8fnq4LpSdHnIM1+BezGZxEVQSwCp2uk9n27Q9TBUhJ5yCPxqBn3964y
	 XcCjwHX6aTk54RuOKH0Wm4Gy0Ke7efmD6S3o8Ugwg8cC0biMvFlxCPqb0N4M/Dkn57c07
	 5TQOG68w1u9VsfBKaYPbdkWlLXepsEXL4VtYq1yG9xM+wxrbY9JCS6qc9WL+vcSGaqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA7606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BA7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8A84B68D0F; Thu, 12 Nov 2026 22:21:40 +0100 (CET)
Date: Thu, 12 Nov 2026 22:21:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: linux-nvme@lists.infradead.org, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Keith Busch <kbusch@kernel.org>,
	Maurizio Lombardi <mlombard@redhat.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Hannes Reinecke <hare@suse.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Aurelien Aptel <aaptel@nvidia.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Jesse Taube <jtaubepe@redhat.com>,
	Rongzheng Wang <testwrzwrz@gmail.com>, Kees Cook <kees@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Guixin Liu <kanie@linux.alibaba.com>,
	Qing Zhang <diasyzhang@tencent.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Julian Sun <sunjunchao@bytedance.com>,
	Yu Zhang <yuz08559@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: clamp the last ANA group index against the real
 array size
Message-ID: <20261112212140.GA11411@lst.de>
References: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com>
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
In-Reply-To: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

