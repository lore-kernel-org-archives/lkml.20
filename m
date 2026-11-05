Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=180.76.5.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855852;
	b=wUKlz+kr5h7E9cCvCRMP2iZB5qvjIdlhQ322JE9f1Gkumwrb7QpYH0lMGf/9dlBPnHyu
	 uUNmHbE+0B1sq4gW+IgcPFXRxN5fqR4FtFu+c2xaZ78WzQGgZIiWZ0Piun5w+49H7vpiv
	 iUWxF2kLFlxUg6h9sUt/BWC79zPBWNV1YVIcSNYJSqCKM93XspVb9RdKH635sCpsYQEzs
	 Nz2of70rKxTKiDo7rFH+ScRLSrrLawTwSAqDyWwo2/xUlFCrVRkpFOxBvoAA2EvL5bAdN
	 v2vIzRBoFakXoV44CCpwUaUhzt2sUVo5YLFQdSvX0NRmjE8RtCWg2l8U5NNN+NQiKUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855852;
	h=DMARC-Filter:X-MD-Sfrom:X-MD-SrcIP:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:DKIM-Signature;
	bh=mo4tZCwDPyINsh+mtEZQ6SccSEU/b2YuNT4z9b45fwA=;
	b=SVEA9RRu6reWjCC0Nmj/pUz1XmvxzneA5HU5N4t2QTNWZhZTOC7WExJvzevxgoQKhZD6
	 DTEy5ZYm2ETPbePi/JmO/BAmLbVCMZgXXTPGJo6UHk9t0mTNmqeqXdqCopE0AzD2r+ZNF
	 a/JvQqUfU1wlvVsoxc3zrJh7Csk3ecRuNyr/SSw+DECIvw4UDMPngyeMTMj5VQ7vog+ZG
	 voiMunU14RbcVoRfkKvKoDB7gy1m4DB9/tWy03xt2ZDOGG1sVR7jaR+cjmFvG9xhw3xQL
	 HwFrDTOBJd9RyUh2sjW7x7KiWvgP33mhg2uzO7SYcBh67RlK4GvcO3WsVqpuEEVX0JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baidu.com;
	spf=pass smtp.mailfrom=baidu.com;
	dkim=pass header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=KcIENYho;
	arc=none smtp.remote-ip=180.76.5.236
Received: from outbound.baidu.com (outbound.baidu.com [180.76.5.236])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 25E90606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E90606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=KcIENYho
X-MD-Sfrom: zhangyili01@baidu.com
X-MD-SrcIP: 172.31.51.15
From: Yili Zhang <zhangyili01@baidu.com>
To: <muchun.song@linux.dev>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <kas@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <osalvador@suse.de>,
	<rppt@kernel.org>, <zhangyili01@baidu.com>
Subject: Re: [PATCH] mm/hugetlb: do not invoke the OOM killer when optimizing vmemmap
Date: Thu, 5 Nov 2026 13:17:15 +0800
Message-ID: <20261105051715.95172-1-zhangyili01@baidu.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6773CA2D-35EF-441D-A736-BBEA4A07B074@linux.dev>
References: <6773CA2D-35EF-441D-A736-BBEA4A07B074@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc14.internal.baidu.com (172.31.51.14) To
 BJKJY-Exc19.internal.baidu.com (172.31.51.15)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1793855846;
	bh=mo4tZCwDPyINsh+mtEZQ6SccSEU/b2YuNT4z9b45fwA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=KcIENYho3LBTqPq92nE2sW2s0UcGToUXRRmoZ/N/FrXkVUVoy4KGyxRhjFoGY/T4y
	 uQznbnnzBMpGx+3nEAFQ8q/elZn8K1TlN/GO5UpRmzQXm0Xhlt9UlxuDHoaIJhGjhi
	 kwF7eQp7I7AvuZBgh3894is0agcT9XUtEZ2jYdqTjiOdixEvog+rHTM//YR6mWKHA4
	 ZDh3fpjfbqNax9hFSfGGXptmDlBowU7rB9j7dpR/W7f/SAArdnOCClcFdtc/87OAbo
	 bfbg+hSRra4KEpaCshgRWbL8l+lkD1DI8nn8Xi3O7Zb2+5HKxj1drg3T/O02j5yUWy
	 ZtegfnKNfFbtQ==

On 2026-11-05 10:38, Muchun Song wrote:
> 
> Thanks for fixing, but I realized that I've already fix it here [1], and I didn't
> realize it's a real production issue. If you don't mind, I could add your Reported-by,
> and make it a very small fix patch so that it can be backported more easily.
> 
> [1] https://lore.kernel.org/all/20261104023510.260766-5-songmuchun@bytedance.com/
> 
> Thanks,
> Muchun
> 
 
I checked [1] and it fixes the issue. Please add:

  Reported-by: Yili Zhang <zhangyili01@baidu.com>

Thanks,
Yili 

