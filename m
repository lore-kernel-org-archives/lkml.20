Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065303;
	b=rXQ5PCcB1RVSMEGy7BtRmWU6d4HeUH+oho19V9+sQOcVwpNwEl5lcJsU6/Aekfywm+dZ
	 WGiYg9RKeXbHxz3D5VsZJILsLcDX/Pgqv12tqRkLdfbuGsa58wxGe+JDTE8WknXpaVqzt
	 eAvP3YHT8Z+kMe0tlHLUo+xlE4Ad6x54XMt1aNsABGBhbAUcgQvdggWbuaSKTAt0tyWJU
	 MPkPXwwyO4cScZZkxsXbHxEbFTVUPZSYXrCelDuDfH4i2QlAsgfcD7OXp+e26bXFFvNC/
	 YeSlmlloDCzD+oemaC5o8JCVDK0wYNJfHcDFGwmqFBTnuJJ35UIysfHxRDVSrYn2Mcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065303;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=HU2jQwEVpLrvbwEbz/Gar4ZXPXw7yw5r3qXadtLdjKo=;
	b=AQ8YhyMABAojuOZaoDwFvV4D3l2IeM3IuhmRN+h53xPdhY/Dh6+WCVZQynPj2H8Hd8PJ
	 gpoDKzsRSF0ng5nYVMzQo9oF8EnbChBBtwuO+vqD2heVKvOoFc9ELdY0aUAFLPpsOO7ix
	 FpwdhAaz+4PbIJxIkFxWZutGsoz30F4VsPkD+aA8+J/84uxHRW2x9TvU7sbSeBLUdbS4q
	 0VeE1ORXo+Orf+1cpX8EU2VMP12F+qFou5U4waQA2n68tuADRg8ib6T4YFbwXUxocmgm7
	 xxi7tX8AuxNGTHH4KAgnstwskeRIwdE66DlbmJV2T72MLPnOIVVZ1jvQQVTUMiWQOHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TT9AMUXe;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A1B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A1B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TT9AMUXe
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HU2jQwEVpLrvbwEbz/Gar4ZXPXw7yw5r3qXadtLdjKo=;
	b=TT9AMUXewXBPUH4eMiKZUBBGYQREKpLjnDUybvQgbv+j/BKMlQMt1cA5OE17l0xXNnVzUfCOv
	bRaWIsXyYZLHcJKUh9tb/I6r6trUU4mrT90NDWFCxx/oueHqziYNFKAi0uPVFYoPFTVciolO5uB
	A6kpgDFyvHzCsWGSs9N2D9c=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jDCrn5JRZz1T4G9;
	Tue, 27 Oct 2026 09:41:29 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 8434C4057F;
	Tue, 27 Oct 2026 09:41:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 27 Oct 2026 09:41:36 +0800
Subject: Re: [PATCH] jffs2: Fix a lock leak in jffs2_flash_writev()
To: Bart Van Assche <bvanassche@acm.org>, Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <f7faca912d873560eff94cf729e6d75decee76bb.1793044478.git.bvanassche@acm.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b40928c1-ff16-f973-f3e3-c5b0b9e83644@huawei.com>
Date: Tue, 27 Oct 2026 09:41:35 +0800
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
In-Reply-To: <f7faca912d873560eff94cf729e6d75decee76bb.1793044478.git.bvanassche@acm.org>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/27 3:54, Bart Van Assche Ð´µÀ:
> jffs2_flash_writev() write-locks c->wbuf_sem near the start of the
> function. If jffs2_sum_add_kvec() fails, the function returns without
> unlocking c->wbuf_sem. Fix this by unlocking c->wbuf_sem before
> returning. This bug has been detected by the Clang thread-safety
> analyzer.
> 
> Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   fs/jffs2/wbuf.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> index 3b7803c75d58..c8fb58513783 100644
> --- a/fs/jffs2/wbuf.c
> +++ b/fs/jffs2/wbuf.c
> @@ -904,8 +904,10 @@ int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs,
>   
>   	if (jffs2_sum_active()) {
>   		int res = jffs2_sum_add_kvec(c, invecs, count, (uint32_t) to);
> -		if (res)
> +		if (res) {
> +			up_write(&c->wbuf_sem);
>   			return res;
> +		}
>   	}
>   
>   	if (c->wbuf_len && ino)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> .
> 

