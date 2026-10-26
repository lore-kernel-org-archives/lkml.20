Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989811;
	b=E8yH9FtDGJMbp+aTpOLb5CkdS4dsq4wrd2FEy5hgtMz1grsOEKu53HlFpthFEbBQAw3i
	 QHqMhvtmFjN8i4v1VeC421QV3Bi5pCZGbz7y0MY+O8vncHcChCyMvzFEatH8/69VaxCzy
	 3DZbRWKQfOW/LMQGOJdk/ieC5EqcR5WmEsLUV1LV3LvQE6PxiOwMikEZgXuU0djXeTmly
	 tBE3FLLeknC8HyTZwjQ8bqdso4X42wVjLt1fkv5DS3Pi4+sJFX1+0v/N06Jt3PHWy/Fp6
	 5ALKG0WE9ARZ9L5CH0Mq7MKRKGN33O6JVmnitXgnKffB/cvuoBC0cBQK7gtxk5Pj/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989811;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=pA5SQuNt2A3L8vVVAARn7Ve8cg2BMqGbZ0MCh8Bf2x4=;
	b=aEXgCY518c9m2L9Z0slAKsqT8m7bQLdunzhN5ZhPF7zsPzxARGTuu14ONGdJAwUUtEt6
	 YfaNr/vn+F/3PFmrG91t+tHvOyq5oQ8KKdAUgRyB+Oa4wTTjNmOxyCxEwxs8XUcCCE4Vs
	 zMm9CBXiUtH379yQZTxBIKgCzmsMuNG0vpNUKdHmV8fw+5l1gRDlDYdtPppvuDTZX6p0/
	 P8BFa4jMrx2NvHB7lkjL2Xj9LUOdruT9qajC3boMWBrNuVTxvBw+doPDJL8Duy5i098k0
	 uQtQCUrBquesxYxIcuFSa0q6/haOMltc+H0O8R+l/ceB2mZglZgQUIy7YZZp6yN367g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TbIrOkJj;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F76E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F76E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TbIrOkJj
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pA5SQuNt2A3L8vVVAARn7Ve8cg2BMqGbZ0MCh8Bf2x4=;
	b=TbIrOkJjBbYTPkV5O0h5OcNmzcv1E2fqHSRZSp9h20CuU/J67lm7Go46MuSK6RhLS6OOt1y9n
	2p2qkAOZvC51+Zt1aVCdWkYx2G84fKfKBhlR7lN4w4eQILjLFaGNHgSc0j2BAt4DdEppe+Rzo9H
	ZilsoKpPRl8zEXwRQGO9Kxs=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jCgx30ppDzRhRs;
	Mon, 26 Oct 2026 12:43:19 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 5580A202E6;
	Mon, 26 Oct 2026 12:43:26 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 12:43:25 +0800
Subject: Re: [PATCH 2/2] ubi: Check the data size of the last LEB of static
 volumes
To: Alejandro Pacheco <ale@alepacheco.dev>, Richard Weinberger
	<richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
 <67a5dbbb-911a-4f24-b862-9dae24f958e0@alepacheco.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <22ec08e4-90cc-a45a-e334-c355da430928@huawei.com>
Date: Mon, 26 Oct 2026 12:43:24 +0800
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
In-Reply-To: <67a5dbbb-911a-4f24-b862-9dae24f958e0@alepacheco.dev>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/24 20:43, Alejandro Pacheco Ð´µÀ:
> From: Alejandro Pacheco <ale@alepacheco.dev>
> 
> For a static volume, init_volumes() takes the data size of its last LEB
> from the attach information, av->last_data_size, as vol->last_eb_bytes.
> When the volume is first opened, ubi_check_volume() reads that many
> bytes of the last LEB into a buffer of vol->usable_leb_size bytes.
> 
> Nothing bounds that size by vol->usable_leb_size. When UBI attaches by
> scanning, it is the data_size of the last LEB's VID header, which
> validate_vid_hdr() only checks against ubi->leb_size; that is larger
> than the usable LEB size of a volume with a non-zero data_pad. When UBI
> attaches from a fastmap, it can be the last_eb_bytes of the volume's
> fastmap header, which is not checked at all. A larger size makes
> ubi_check_volume() write past the end of its buffer.
> 
> Before UBI comes up, check_attaching_info() runs check_av() on every
> volume that has attach information, to check it against the volume's
> record in the volume table. Also reject there a static volume whose last
> LEB data size is negative or larger than vol->usable_leb_size. Images
> written by UBI or ubinize are not affected: no LEB of a static volume
> holds more data than its usable LEB size.
> 
> This needs a crafted image (the VID header and the fastmap carry CRCs
> that catch random corruption) on a device that UBI attaches at boot or
> that a user with CAP_SYS_RESOURCE attaches.
> 
> An LLM coding assistant was used to find this bug and to write this
> patch and its changelog.
> 
> Fixes: 801c135ce73d ("UBI: Unsorted Block Images")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
> ---
>   drivers/mtd/ubi/vtbl.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> index 06d87a3013a..f1bd6e1e488 100644
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -696,6 +696,12 @@ static int check_av(const struct ubi_volume *vol,
>   		err = 5;
>   		goto bad;
>   	}
> +	if (vol->vol_type == UBI_STATIC_VOLUME &&
> +	    (av->last_data_size < 0 ||
> +	     av->last_data_size > vol->usable_leb_size)) {
> +		err = 6;
> +		goto bad;
> +	}
>   	return 0;
>   
>   bad:
> .
> 

