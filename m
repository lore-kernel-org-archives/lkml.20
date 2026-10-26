Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985379;
	b=tb8vT81cDsOycuY1dnapPzUJp+Fq8miFxoPskbaz+Z+vmqyTf2ZjLeeR5v6MyaKTk1mf
	 isvYGJ2/UKpIgZ84IRjh9uh3MR6c0/014zfHMXis6N7+v0zsAkY0YGtQf54BjN1Tr+V8E
	 skE7ojhLTpzOgEsGsatVjpvciR5HkQ4zkxBj/3Pfey4SCArwx07L5LefP1vmYzGerlEYv
	 057mNW4R5gV56sb/AnA7S2zel2kpwZbVCG507ha2+Lm7+bye6krimct58BJkkqa9xfcjH
	 jFVNh0np1i+TExlb+h8EvJlZXPeOHq2KDES0BMtpXmGP4WBx+ahW6fYFJ5KKqCBHFDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985379;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=BQLkrYzA5a4M0h6NQaNmaq/76j0SSO4S3rXXiIgtZNo=;
	b=vjFqER9xxQyV5kFDjf8Qqvaktdd1GSAp8acHizSzdrQgl359lTkZm66b4Yd0oFKHBgFT
	 IZF3xG8eQLbajPL8V26iqthj7nW8oJadAXER+TQvCV9EMfOLhDNfCnGfm8SrUAu5wQSa6
	 rWdwxK5AN+etnvtKzeMtpoou/qg+hDGh2SZ98n2+GEyErl+n7utzblHLOJOZJjrmwHDnO
	 yO6eu3I9YASyH/nm1ftNZ7JOF/QjNAUCYA8UjpW/6NPlPeAhP/fcnkbZeNIeqLUGj2Old
	 ODmWVJHQ0HOPR/8oHwSpqQRf//DH9ro01dSbA4iVnm+GwhFdh1qoS6cSJFNW3+ORSbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=jS7UAufb;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D05606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D05606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=jS7UAufb
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BQLkrYzA5a4M0h6NQaNmaq/76j0SSO4S3rXXiIgtZNo=;
	b=jS7UAufbwFhPTiNNeYKJKiTccUpIAfad0NoMp6zvZ0BRIzdz21OWIAHEBRY+JlrSJuLSMLWLL
	roZ75JHwmRqfTui1RkQp3PlbhkLA7hrX69MZHoQs+rfF2pVTbBSzThlzl7U8GDZm9ZAgcDLlNSE
	wiF/fE6wx9oDlmly2KyKf84=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jCfHp5LWsz1ps8v;
	Mon, 26 Oct 2026 11:29:26 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 81CF14057D;
	Mon, 26 Oct 2026 11:29:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 11:29:32 +0800
Subject: Re: [PATCH 1/2] ubi: fastmap: Check the PEB numbers in the fastmap
 lists
To: Alejandro Pacheco <ale@alepacheco.dev>, Richard Weinberger
	<richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
 <67870349-f17c-44ef-8647-28a78da80624@alepacheco.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <40267039-6718-2d92-d5d4-63fc9c54c674@huawei.com>
Date: Mon, 26 Oct 2026 11:29:31 +0800
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
In-Reply-To: <67870349-f17c-44ef-8647-28a78da80624@alepacheco.dev>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/24 20:43, Alejandro Pacheco Ð´µÀ:
> From: Alejandro Pacheco <ale@alepacheco.dev>
> 
> ubi_attach_fastmap() reads the free, used, scrub and erase lists of the
> fastmap and adds every PEB number in them to the attach information as
> it is on the media. ubi_wl_init() later uses these PEB numbers as
> indexes into ubi->lookuptbl, which has ubi->peb_count entries, and the
> PEBs of the used and scrub lists become the PEBs of the volumes' LEBs.
> None of them is checked against the device, so a fastmap listing a PEB
> number that is negative or not below ubi->peb_count makes ubi_wl_init()
> write outside ubi->lookuptbl.
> 
> The PEB numbers of the two pools are not affected: scan_pool() reads
> every pool PEB from the flash before using it, and the MTD layer refuses
> an offset outside the device. A PEB number of an EBA table is only
> accepted when it is found in the used list.
> 
> Check every PEB number of the four lists against ubi->peb_count, next to
> the other sanity checks of the fastmap, and treat a fastmap with a bad
> one as unusable, so that UBI attaches by scanning instead. Fastmaps
> written by UBI are not affected: ubi_write_fastmap() only lists PEBs of
> the device.
> 
> This needs a crafted fastmap (its data CRC catches random corruption)
> on a device that UBI attaches at boot or that a user with
> CAP_SYS_RESOURCE attaches.
> 
> An LLM coding assistant was used to find this bug and to write this
> patch and its changelog.
> 
> Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
> ---
>   drivers/mtd/ubi/fastmap.c | 40 +++++++++++++++++++++++++++++----------
>   1 file changed, 30 insertions(+), 10 deletions(-)
> 

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 3f9fb7c181f..41ead6b4f0a 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -558,7 +558,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>   	struct ubi_fm_ec *fmec;
>   	struct ubi_fm_volhdr *fmvhdr;
>   	struct ubi_fm_eba *fm_eba;
> -	int ret, i, j, pool_size, wl_pool_size;
> +	int ret, i, j, pnum, pool_size, wl_pool_size;
>   	size_t fm_pos = 0, fm_size = ubi->fm_size;
>   	unsigned long long max_sqnum = 0;
>   	void *fm_raw = ubi->fm_buf;
> @@ -640,8 +640,13 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>   		if (fm_pos >= fm_size)
>   			goto fail_bad;
>   
> -		ret = add_aeb(ai, &ai->free, be32_to_cpu(fmec->pnum),
> -			      be32_to_cpu(fmec->ec), 0);
> +		pnum = be32_to_cpu(fmec->pnum);
> +		if (pnum < 0 || pnum >= ubi->peb_count) {
> +			ubi_err(ubi, "bad PEB %i in fastmap free list", pnum);
> +			goto fail_bad;
> +		}
> +
> +		ret = add_aeb(ai, &ai->free, pnum, be32_to_cpu(fmec->ec), 0);
>   		if (ret)
>   			goto fail;
>   	}
> @@ -653,8 +658,13 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>   		if (fm_pos >= fm_size)
>   			goto fail_bad;
>   
> -		ret = add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
> -			      be32_to_cpu(fmec->ec), 0);
> +		pnum = be32_to_cpu(fmec->pnum);
> +		if (pnum < 0 || pnum >= ubi->peb_count) {
> +			ubi_err(ubi, "bad PEB %i in fastmap used list", pnum);
> +			goto fail_bad;
> +		}
> +
> +		ret = add_aeb(ai, &used, pnum, be32_to_cpu(fmec->ec), 0);
>   		if (ret)
>   			goto fail;
>   	}
> @@ -666,8 +676,13 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>   		if (fm_pos >= fm_size)
>   			goto fail_bad;
>   
> -		ret = add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
> -			      be32_to_cpu(fmec->ec), 1);
> +		pnum = be32_to_cpu(fmec->pnum);
> +		if (pnum < 0 || pnum >= ubi->peb_count) {
> +			ubi_err(ubi, "bad PEB %i in fastmap scrub list", pnum);
> +			goto fail_bad;
> +		}
> +
> +		ret = add_aeb(ai, &used, pnum, be32_to_cpu(fmec->ec), 1);
>   		if (ret)
>   			goto fail;
>   	}
> @@ -679,8 +694,13 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>   		if (fm_pos >= fm_size)
>   			goto fail_bad;
>   
> -		ret = add_aeb(ai, &ai->erase, be32_to_cpu(fmec->pnum),
> -			      be32_to_cpu(fmec->ec), 1);
> +		pnum = be32_to_cpu(fmec->pnum);
> +		if (pnum < 0 || pnum >= ubi->peb_count) {
> +			ubi_err(ubi, "bad PEB %i in fastmap erase list", pnum);
> +			goto fail_bad;
> +		}
> +
> +		ret = add_aeb(ai, &ai->erase, pnum, be32_to_cpu(fmec->ec), 1);
>   		if (ret)
>   			goto fail;
>   	}
> @@ -732,7 +752,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>   		}
>   
>   		for (j = 0; j < be32_to_cpu(fm_eba->reserved_pebs); j++) {
> -			int pnum = be32_to_cpu(fm_eba->pnum[j]);
> +			pnum = be32_to_cpu(fm_eba->pnum[j]);
>   
>   			if (pnum < 0)
>   				continue;
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> .
> 

