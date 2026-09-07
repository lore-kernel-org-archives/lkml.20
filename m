Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5AE40EB8D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763666; cv=none; b=oEpGWuLIGNI2xbqtn9iWZ7dt2NXkDe01p5bLC9gpM7UIIAKywHxhUQiO7qBvmngk3yCEzS5+CQjfOCwdzgSZlEQNgk5WFueBvupSvT5cu8hlioDPhnDN8GJrjOAG/piVbxx2nhgCLdwdFcNBskKLohW4V+QpYBb+889oaEYb1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763666; c=relaxed/simple;
	bh=MocLf3HnP4+qthNgKN4Yq2l2qafbC2+znsfUYos2kTo=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BQjLM739vIUwIS91OXsz7sbpYkSq3c64HS5BhmL0L0o8XK+S2+Ma28P0P2mD82XIZ/fQFPQCmaigfANvlQ4t09avSWz0vcCqHve+BnQvbK1YKpNNRS3KBKpqZSNOPjI+ZulDo5tqlQWNd53VuoDC6r45KGMSHNvKs/xMW3SwBzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RnQKJ+Id; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="RnQKJ+Id"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fH2rWvrUYoJAcy+LEQqi2jnZ83+Fb9pIuufTdnEsnwo=;
	b=RnQKJ+IdQcQIGA+6kd7JcPPOeg2u5ZT0Sr0Ar5DVNSSSm79brsGdzS4bCwH6vVOzxXG6h4x2m
	TgN5lTU3dUSOvdmReB8ceyfA/Hx/PrU800oJBX+i9z3xG7SWbvx8BKzgCcoBUrhaXW/xStC7xcH
	I+oczq85Zt3EIke+HoqfeIs=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hdclj6BmbzpT0h;
	Mon,  7 Sep 2026 14:36:01 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 493462025F;
	Mon,  7 Sep 2026 14:47:31 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 7 Sep 2026 14:47:30 +0800
Subject: Re: [PATCH] mtd: ubi: fix typo "occured" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>, Richard Weinberger
	<richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh
 Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260907063111.19769-1-hemanth.selam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <de859d54-615f-8e64-79df-9d207cde6d1b@huawei.com>
Date: Mon, 7 Sep 2026 14:47:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260907063111.19769-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/9/7 14:31, Hemanth Selam Ð´µÀ:
> Correct "occured" to "occurred", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   drivers/mtd/ubi/wl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 5a0db928a90e..44237de52250 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1486,7 +1486,7 @@ static bool scrub_possible(struct ubi_device *ubi, struct ubi_wl_entry *e)
>    * @pnum: the physical eraseblock to schedule
>    * @force: don't read the block, assume bitflips happened and take action.
>    *
> - * This function reads the given eraseblock and checks if bitflips occured.
> + * This function reads the given eraseblock and checks if bitflips occurred.
>    * In case of bitflips, the eraseblock is scheduled for scrubbing.
>    * If scrubbing is forced with @force, the eraseblock is not read,
>    * but scheduled for scrubbing right away.
> 

