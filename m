Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681425;
	b=2BYaxiCtFgHSEtFy3lytPT2Iaf/nuLXq1xK13CGcs8q+dJbjLhPMlgCQHhCKHbIqqqCM
	 PjOYfiuzvvzk9tLwZAQI/WEFO3zKIgWnkORefMZjCsV9fEj513xsuP84eVQFNaoXTnM28
	 k0WWybyk6ZyBGhGckX8iDWIjZO0vBc4U3lZWJyV2Cipd0Urqu2iBhr3v8QhnPvTxSBJCO
	 9QLKPlmXL5t180CstA8Xb1FtNFRya2bTSxincxAgCUK99u7FQ+MF9v7TXBYeM1U/4BSXe
	 Afp94ktMR411bYrJRVxrTuo++qhJjLol+HGsnvf7B4qIECR3fYvNNdZCf1heX3TXFgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681425;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=tKYkGRJueQ4xHnKwkjwzEUwQGmQwSgxAdVrQiSPCVM0=;
	b=E6NAjMixqfFTzWW2u3pH4O13ACWznSIYwQEL5Z+lclVTXRI3Z928IdixI+16+xT9creC
	 Y7TqwmpcnCugyr5ssgUFnMgNlCWysXEkxYM4pi+jzfcUpnnyZ11XyMGsd3WKMkneU+Esu
	 +ylQnaQt228CbxFUiKFLfVfKpT7bdMS4SmNXO4XkNJGanwG4DT+mYft/mG+OTNucOQbef
	 R2lRYBIeEu1rvdaSnxKkqm1+RiEpUEmiYk3lZDQyqTIJyqMvHsp4OKrb8D6fritRUx+tQ
	 iyWpwuyQQvQFIBD1vWjSYc/Z2IfQoS4diOGwmftEfmK1eSB7UCMh/V4Rr9lHwjfQ1iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=12COAAUg;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5354606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5354606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=12COAAUg
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tKYkGRJueQ4xHnKwkjwzEUwQGmQwSgxAdVrQiSPCVM0=;
	b=12COAAUgRMSucGDaRdd9nEFO2NcTHpF5KyMlJi0iyNbGUdDBgOIlaA4H62rB1QpDjcR/0O6J0
	FCB/aCxNjZUW3QzF9tjs8Zk17bI/TSawtH6KqJ7qfEqwtJc0SDMyoE6gs3BatGavL3lSTTOX83S
	JevDnaKi2SQaddDID29g7Os=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jJbjD4M4mz1cyqq;
	Tue,  3 Nov 2026 12:50:08 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 0024240574;
	Tue,  3 Nov 2026 12:50:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 3 Nov 2026 12:50:17 +0800
Subject: Re: [PATCH 3/5] ubifs: reject master nodes claiming a too small inode
 number
To: <shao.mingyin@zte.com.cn>
CC: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20261103123104319tX_sQcNY56466a6yZeEgg@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a6608f36-7ce2-bfbe-339c-c5719bbb867f@huawei.com>
Date: Tue, 3 Nov 2026 12:50:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261103123104319tX_sQcNY56466a6yZeEgg@zte.com.cn>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)

在 2026/11/3 12:31, shao.mingyin@zte.com.cn 写道:
>> This check could be merged into previous check:
>>    f (c->highest_inum >= INUM_WATERMARK)
> 
> Agreed, the two bounds belong in one test:
> 
> 	if (c->highest_inum >= INUM_WATERMARK ||
> 	    c->highest_inum < UBIFS_FIRST_INO)
> 
This looks fine, there are many places return the same err code 
correponding several reasons, the err code help user to identify which 
field is incorrect, then ubifs_dump_node() will show all details.
> One side effect: a too small highest_inum then reports error 3 instead of
> the separate code 24.  If you would rather keep the two ranges apart in
> the log, I can leave the lower bound as its own check.
> 
> Thanks,
> Shao
> .
> 

