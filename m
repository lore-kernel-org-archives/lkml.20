Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6D2BDC1C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750340; cv=none; b=ZbMhpyw7McjK6IDPYXBEE3FCPlSrRWCG5c2Z5U7XdPiiT696G571RWTdpCOpHj2pPJm5q2LmOGgIRREwxDu95iVl16274Ftuc3fi3KDVlraBgF3dmdH1eRLxW7l6d55FE7nGTXQVX7/eBZwCrpPwY0FUDjPWJj76FF+EQVO9Ioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750340; c=relaxed/simple;
	bh=dHqJWZUgXl3dGlbdWmNmBvbXc33kA1M/YhES/1zhvl0=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TU4VDM1FhZdkRMzlhOhbVWlBAmt7rGCtlyf3HP+k4qt2P1qEKbYD7uad6BHeBlkF2tGfrOgXL2XjGLf5n2iAc0LL88gjyQj6BtHT+BFfPe8U9/aPr82OfX6Q4/HHJCP0Y0Z9CQS5lfz7IJv+X+7E3+rZ92ZHa4R1RTqAUbzJYjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=PiC6HyEQ; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="PiC6HyEQ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qVlgjFyr8X3oCWakePj9eLcqUMiSwXFx9x+NdGeLY4I=;
	b=PiC6HyEQi62P8vWr3VMiTe9VyyEKf6iXKJdsCLfQpnpObLXCcLee2cLRhB1uPrSv4MCnf/gwm
	F5udepC2YFJ+PQ5fObcZpoHPX7VIW1qeuaT2XwFcMgbJgxWjk8F0EDIcA+a1XFYoKFowiTwOHRE
	qfOuZ4rl2OjE4Vd6rnOOVgU=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hdWrB1CZSz1K96b;
	Mon,  7 Sep 2026 10:54:34 +0800 (CST)
Received: from whupemk100004.china.huawei.com (unknown [7.152.185.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4077540565;
	Mon,  7 Sep 2026 11:05:27 +0800 (CST)
Received: from [10.173.124.160] (10.173.124.160) by
 whupemk100004.china.huawei.com (7.152.185.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 7 Sep 2026 11:05:26 +0800
Subject: Re: [PATCH 4/8] mm/memory-failure: convert process iterator to
 for_each_process_rcu
To: Ye Liu <ye.liu@linux.dev>
CC: Ye Liu <liuye@kylinos.cn>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-5-ye.liu@linux.dev>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <cc748395-95ea-a7d7-d1c9-9678d2eaae21@huawei.com>
Date: Mon, 7 Sep 2026 11:05:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260904083001.553587-5-ye.liu@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemk100004.china.huawei.com (7.152.185.74)

On 2026/9/4 16:29, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pairs combined
> with for_each_process() loop in mm/memory-failure.c with
> for_each_process_rcu().
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

With SJ's comment addressed:

Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.
