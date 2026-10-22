Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669280;
	b=ontUdQMhRT7kDN+ntgtUaS0xPFOoV30swnc/z59KJJAxHmnC/ZfHm1PYU5NAzNZtRzsY
	 4zFiHnyHtXUyzM4oWgZo7FgmcuFblP2bCy1+iuLhnbFRCWeoeCQcvrZG16AGweCh0HF+j
	 TlCGc6wRwe3IzZbSwbXaNvZLw9EbvbTaZ2GXXhxyMuVGVnlXeTo/oO+94aORbXRXo9JWe
	 +KKe2GqqAjc5Ott/W6C2yRpQcskYMYA4EQsLQeC8cw8ZVzp8rxEf0NPr0hMAWZzCk5EbF
	 Rcs6trtiRCtKynqrz6CQ6M8Kc3NN9kBsVU73f5KAP/wYmmZME1xLDw+/I/VzfPM6IAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669280;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=szxB/dyITK/phILUcJrvxYH1e/hG1kmM9/9Dx4NlOBU=;
	b=WCSuLj5woxprT+Q/vbtXw0Z8DURwL21aJZwk92kCFV/fTp/T5yUo3wnU0tfW1ibOLfvr
	 ssIMEjmUxfVZWYWf92OHoEZxpCrXHnbPYDHsOaxOLe7cHzEwpECeHPPWA+LaKUkEV8gRK
	 iA/8Xe2Mc4sLwYV5B1Lwgbc2g8lXNV3Y2cYjP8tQICmBAj7rDnuHsCxkZZZ8D+B6P7RtR
	 LHcguyC/+NlNYap1AbOQJGMJhaJunBqMt3IDcb4GdlLAbmK4tZqmHJhANKfPWRO10mE+s
	 m8/LcLCG68tokReu7FqAqfVe5RtnYketnJGO46Ihd6Gg4RKLUeeMKhBj+PzPcsC/DWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fbqcgThb;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C52606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C52606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fbqcgThb
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=szxB/dyITK/phILUcJrvxYH1e/hG1kmM9/9Dx4NlOBU=;
	b=fbqcgThbNMiQeqPg2BsoIbYCOlw7TpmbIBxRnBS8GOKONEztbFHjXgAsm3k1aZcmE4IhhkwJa
	Lz5Abjohxh3FxSdXdCcDFpgYO1O1oZwaow6DEZNiPT2YtWSkGYR/7hfLDjb2MCLJMVBCUA3YJA5
	F1HjhnmBCNXPOV/aN7hLcYM=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j9PNt6SvdzKm5C;
	Thu, 22 Oct 2026 19:41:02 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B09940578;
	Thu, 22 Oct 2026 19:41:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 22 Oct 2026 19:41:07 +0800
Subject: Re: [PATCH 1/1] ubifs: fix typo in comment
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261022112640.11822-1-alexander.stein@ew.tq-group.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f406a1a9-2bae-e39b-7d7d-62ca43f68937@huawei.com>
Date: Thu, 22 Oct 2026 19:41:06 +0800
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
In-Reply-To: <20261022112640.11822-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/22 19:26, Alexander Stein Ð´µÀ:
> Small typo which stayed hidden so far. Fix it.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   fs/ubifs/scan.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
> index cbff2d800e27a..50740e9dabf73 100644
> --- a/fs/ubifs/scan.c
> +++ b/fs/ubifs/scan.c
> @@ -245,7 +245,7 @@ void ubifs_scanned_corruption(const struct ubifs_info *c, int lnum, int offs,
>    *
>    * This function scans LEB number @lnum and returns complete information about
>    * its contents. Returns the scanned information in case of success and,
> - * %-EUCLEAN if the LEB neads recovery, and other negative error codes in case
> + * %-EUCLEAN if the LEB needs recovery, and other negative error codes in case
>    * of failure.
>    *
>    * If @quiet is non-zero, this function does not print large and scary
> 

