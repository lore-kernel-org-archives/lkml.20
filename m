Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5BC388880
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747578; cv=none; b=rPckss8mg8O0wFBYZBa6r9+mUL933e9tWEjNrLj7aFkUfTVBC9VIIGfwJFOGJ3Xgkkom4eky1LUJFK39KSEFD3XYeMq72AycQomR0fSEtoP9bVr8uev9mjXHYCgrvJLHOyaX05+bq50KdgCFUFrim7crXlqLYWSB6qTIZ7ZnZLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747578; c=relaxed/simple;
	bh=XyHEKhvIy6l7bjLhLmIpERKaJrBr0+oHZc2fEju0PW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iBvHx4nP60MLFMNgqyJ7xjOOVUBiSGku//vWlH+Aef6fDAPe52m174HYm61OpKqwbzd9o2CRu4yuKR7fEnYzbRILtdIkzIAxmXX8styqhmoKlN8OB6vLG39Ay5BLQdepVUPSA8JIch2j9KwRbUh4uE6oX/0NaOLZQUGhRfmB8U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=LDXHvFzB; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="LDXHvFzB"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Z+OsHRrbfzg0IKCON8AfnJbS2L5luvQDqvdg0XbXUCs=;
	b=LDXHvFzBIojJRN2Ps9E/nGx1TIH90RHo5VAR8WBDAcq3eKrZpEB4B3+Vg2i4m69D0Bis3s2xd
	QK1QIBwUdO0zOSXF096Ms+nQ9fMp5CH/WpqS+9Kmodukd78ocKbnWCP9KRz/rC+lDZIc5Zt2szS
	TFegHqvd8LRifven8ledOGA=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hdVq03vc7zLlXC;
	Mon,  7 Sep 2026 10:08:28 +0800 (CST)
Received: from dggpemr500006.china.huawei.com (unknown [7.185.36.185])
	by mail.maildlp.com (Postfix) with ESMTPS id 78DC440586;
	Mon,  7 Sep 2026 10:19:21 +0800 (CST)
Received: from [100.103.109.15] (100.103.109.15) by
 dggpemr500006.china.huawei.com (7.185.36.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 7 Sep 2026 10:19:20 +0800
Message-ID: <4b7d4054-633c-4958-9283-2d34f0a0e50f@huawei.com>
Date: Mon, 7 Sep 2026 10:19:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] workqueue: Reducing flush_workqueue() overhead for
 unbound workqueues
To: Tejun Heo <tj@kernel.org>
CC: Lai Jiangshan <jiangshanlai@gmail.com>, Breno Leitao <leitao@debian.org>,
	<linux-kernel@vger.kernel.org>, liuyongqiang <liuyongqiang13@huawei.com>
References: <0a030145-c108-4365-ba2d-ac1973a1e352@huawei.com>
 <92e520050991ea409925012255480655@kernel.org>
Content-Language: en-US
From: Yao Kai <yaokai34@huawei.com>
In-Reply-To: <92e520050991ea409925012255480655@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemr500006.china.huawei.com (7.185.36.185)



On 9/2/2026 5:11 AM, Tejun Heo wrote:
> Hello,
> 
> On Tue, Sep 01, 2026 at 04:46:06PM +0800, Yao Kai wrote:
>> Is there a recommended way to avoid this overhead for such case,
>> I would appreciate guidance on how this problem should be solved.
> 
> Posted a patchset which makes flush_workqueue() visit only the pwqs which
> have been active since the last flush:
> 
>    https://lore.kernel.org/all/20260901210929.3092513-1-tj@kernel.org/
> 
> Can you please test whether it resolves the fsync latency issue you're
> seeing?
> 
> Thanks.
> 
> --
> tejun

Sorry for the late reply. Because my server encountered a hardware failure,
I was unable to test the previous comparison data.

This issue was discovered when running MySQL sysbench on XFS. When we
migrated the kernel from 5.10 to 6.6, we observed a 60% performance drop
in MySQL sysbench. After investigation, we found that the time spent on
`flush_workqueue_prep_pwqs` had increased significantly.

After my colleague applied your new patches, the performance of MySQL
sysbench returned to the level of the 5.10 kernel, so I believe this
can solve the problem.

Thanks,
Yao
