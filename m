Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681472;
	b=cqZeTmSmC86Xtka0Sl4w1hYL7MeEdZTmNKi01I14rAh3APf/FGo23uP/teF20FEpohwr
	 sZbj2jFu2jFUewEi/choTVNrY5HbtWEE3CUK/gCBdYZBLsgBgRjcmhibG0XTTqtW4W2As
	 gEM2Vw/70POsj8PA3xbRYdDCf9uplMKbGXfO5oqdnYatD/LTJhhwyR9o7XdEZXqbAotHO
	 NH3xAfmUB2EyT3lN+P/r7EUiFG944tlKdgn6rPKLHZpXVY3aUZqwJzncjWwth52M4hmDs
	 i0Z0MFak/bdRnyKX5Vna3uorUvWTKWRRMGS5DyTV8FT0j25je18e/yCjR9kEmB2A2vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681472;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=xaVG5gHIVqbQ9ul/dJPjVIZQfI9Fixu/KkPob37v9NY=;
	b=nLuIqFw6UeW/2N5DCVHt79qiB8bISzKb98Y2e8oRDZFeT2iP5qsjebHow0R5/oojXAeP
	 Zd3ljkr+ibKC7bWhOGiewBvgyC8PskKmQvSv8VMwQDG/DHzRs3TM9SSSUlKlw9BxDs78+
	 OFAm83fb/cIs18Cn1LpegNu2kpDHIcXQ4/E8/PkPoQmkMRyZFJRwW3jkuQXYRKE5bVWT+
	 Z4GVV+mk2IG7GKZc02568KnZ1mT3Hv4Fgosa9ICjkLj61Ha5QmKCJgKB93LDY9r848DdX
	 DQvujCfPtg7QeZW6pfNNvP5VQjL4tvu4VnLfN5FIrqDm88GrUafd9VghfAd23n8+fxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LEuibVSA;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92110606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92110606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LEuibVSA
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xaVG5gHIVqbQ9ul/dJPjVIZQfI9Fixu/KkPob37v9NY=;
	b=LEuibVSAF+UvrgJznpG2pGaxo2AR0TiCltYbq0cXoZCkUUZGx/cF1Bx5sA5JRJVWPaGncLnCc
	wNadBv1noSdJ1Vf6zQGoJ3hjyjij7DygQFIbbTyjFcAMctAjSKsdUH2zhca49Tnn3ozgmTxbVqu
	s9Zawf+tIh9w3T9CAs23+r8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jJbjv42Zzz1T4HJ;
	Tue,  3 Nov 2026 12:50:43 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 893BF40561;
	Tue,  3 Nov 2026 12:51:01 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 3 Nov 2026 12:51:00 +0800
Subject: Re: [PATCH 0/5] ubifs: harden validation of on-disk inode and node
 metadata
To: <shao.mingyin@zte.com.cn>
CC: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20261103123059667zqKLXZXpg5bc5F5FV7Xy8@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f9a31ba0-2a71-440a-6fe1-42641bdde01d@huawei.com>
Date: Tue, 3 Nov 2026 12:50:59 +0800
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
In-Reply-To: <20261103123059667zqKLXZXpg5bc5F5FV7Xy8@zte.com.cn>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)

在 2026/11/3 12:30, shao.mingyin@zte.com.cn 写道:
>>   From my perspective, I'm not really interested in the problem scenarios
>> triggered by malicious fs image, let Richard decide whether to merge it.
>> This series does not seem to introduce any issues, there are two small
>> nits in patch 2&3.
> 
> Thanks for the review.  The threat model in the cover is the only one the
> series claims: mounting such an image needs CAP_SYS_ADMIN in the mounting
> namespace or access to the flash.
> 
> Two of the five are not strictly "malicious image only", in case that is
> useful for Richard's call:
> 
> - 4/5 is replay: a node that was corrupted on flash or written wrong would
>    otherwise let ubifs_recover_size() extend an inode to a bogus size.
> - 5/5 leaves the image unmountable after a single removexattr(): the
>    underflowed counters are written back to flash, so it survives remount.
> 
> The other three are mount-time validation of fields that validate_inode()
> and validate_master() already range-check for other values, so they change
> nothing for a valid image.  The patches are independent and any subset
> applies, so dropping some is fine -- I will leave the decision to Richard.
> 
> Both nits are taken: patch 2 folds the size check into the existing
> ui->xattr block, patch 3 merges the lower bound into the highest_inum
> check (that one then reports error 3 for both bounds).
> 
> For the series: I will repost only those two as [PATCH v2] in a new
> thread, each noting that it supersedes 2/5 or 3/5 of the v1 series.  1/5,
> 4/5 and 5/5 are untouched, so I would rather not resend them -- say the
> word if you would prefer the whole series as v2.
Resend v2 series please.
> 
> Thanks,
> Shao
> .
> 

