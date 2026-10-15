Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD26252269B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067611; cv=none; b=KfhSqXwwaKh6Mrgw2t4lGc1gnljfPomGI93PBMuoJS+vtumpCS658swHA0brP5XUY60MArtu3GOrbx+vDvMNoHEaKbofbNbchuQimJ95mdM/60pMwDR32mAxkOApJs0Mjk6ZMKuoWX3P00uM15XlS0cKC/v2coeWJaXIg9dNKjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067611; c=relaxed/simple;
	bh=WxZIcUZ8FWhFti1m9S0HjqQX2p26cQuA2jTaSpKgkeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2PDD6ZAjl+scvm5R/ZZSyvSvLRv47B9qK9+Co23grpn1mOEtzrKJ8+7HWgJA5/GMj2tW+23uDPAB+MSrxC4SNBU1gShVMCOSbo2x9w0Z6Ghmi9AYbrhHEYlqTceyFqqnMibW4e657nc6qPQyYFzB1ERVP8x2KGXAnCCR/EUwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=yE/C1ETO; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yE/C1ETO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792067604; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WxZIcUZ8FWhFti1m9S0HjqQX2p26cQuA2jTaSpKgkeY=;
	b=yE/C1ETObIAklZzDTxwh0ZELL6L8gYRzacDOUvIFeKBINPeHMiz5T8b+Tz2zcppSHUD31Iq5WaYy880FBP+TCJYiCWGn8idw3lUgmS8vmGBZA2sqXDgaevlJm3F6OIO4aY0W5turOf2HigxKw3U29mnEyP3FjCVt16jUxrvGUnY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XCroT0S_1792067601;
Received: from 30.178.84.15(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XCroT0S_1792067601 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 15 Oct 2026 20:33:23 +0800
Message-ID: <f3a05125-837f-4c7d-a53b-58ef2cfef384@linux.alibaba.com>
Date: Thu, 15 Oct 2026 20:33:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/24] iommu/amd: Introduce AMD Hardware-accelerated
 Virtualized IOMMU (vIOMMU) Support
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, joro@8bytes.org,
 jgg@nvidia.com
Cc: yi.l.liu@intel.com, kevin.tian@intel.com, nicolinc@nvidia.com,
 vasant.hegde@amd.com, jon.grimm@amd.com, santosh.shukla@amd.com,
 Sairaj.K@amd.com, jay.chen@amd.com, Ming.Shu@amd.com, SooJin.Tan@amd.com,
 chrisl@kernel.org, wvw@google.com, wnliu@google.com, dantuluris@google.com,
 kpsingh@google.com, alejandro.j.jimenez@oracle.com,
 joao.m.martins@oracle.com, guanghuifeng@linux.alibaba.com
References: <20260930092344.5616-1-suravee.suthikulpanit@amd.com>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <20260930092344.5616-1-suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Looks good to me, for the whole series:

Reviewed-by: Guixin Liu <kanie@linux.alibaba.com>
