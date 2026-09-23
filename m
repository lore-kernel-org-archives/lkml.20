Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448713D53C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147068; cv=none; b=J4WiiBtK0iEiSo1Vy64xaeaSCfo/KSUATbXlKHBEy4u0nJnNai1b4yywCjsLhMOn1CPKFksDza61OJJjo1kVcqOnC7V0RqH+xYM872bcZ4gTlCFnqHx04AhQWiDOruTXMRiXeFWdexgtXQrpgs8KLLg90RCL6S4/p02AhEDdlNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147068; c=relaxed/simple;
	bh=ykxKnSBJcsvvZwLLY6xuHQabaFPv1CdXP69zplrPXIo=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hWjadP/tU/BcVrltPbeJvC+zLBDwgniqdbObN6EIrylXPmxW2hiP88eMAHdl+efS5qr4/KisueMcl4625uBaELiwW1vTRvLFhZ2VJMH8uEYOUuDqHYyPVo589Ox+LWjpENpm2+Pdsb0TYb+7GDrg+oe7sv5Esjpij4Ykp/YIbs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=mve9PMTv; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="mve9PMTv"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=u+h8E1QKWSZDpJwCxpdRnKnG35J6P/3C8VA+1n19Xdo=;
	b=mve9PMTvFtE9KLyj5595nFR4Gtto9AwDKfJyqHeyAf2Z5gmF2V+oK13d05KTmeo8cHGCgkNw1
	bvfUaY+nCurpYTXQjccE5JvOXfxR6PG+JLnTh/gXjcAJHh9hbVrKXnbddAhxGgMEpFko9NPS1Ih
	/sCZMYdlM8xHZJQomv5DbmE=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hqSLw4T89z1K9B2;
	Wed, 23 Sep 2026 14:52:08 +0800 (CST)
Received: from whupemk100014.china.huawei.com (unknown [7.152.184.20])
	by mail.maildlp.com (Postfix) with ESMTPS id 181C84055B;
	Wed, 23 Sep 2026 15:04:14 +0800 (CST)
Received: from [10.67.121.110] (10.67.121.110) by
 whupemk100014.china.huawei.com (7.152.184.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 23 Sep 2026 15:04:12 +0800
Subject: Re: [PATCH v3 11/13] crypto: hisilicon/sec2: Remove check of
 CONFIG_CPU_LITTLE_ENDIAN
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
	Chenghai Huang <huangchenghai2@huawei.com>, Weili Qian
	<qianweili@huawei.com>, Zaibo Xu <xuzaibo@huawei.com>, Kai Ye
	<yekai13@huawei.com>, Wei Zhang <zhangwei375@huawei.com>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-12-will@kernel.org>
From: liulongfang <liulongfang@huawei.com>
Message-ID: <0c929b0a-8d92-2d2c-79c2-4d9f7c0c29e5@huawei.com>
Date: Wed, 23 Sep 2026 15:04:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260918145217.1669-12-will@kernel.org>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemk100014.china.huawei.com (7.152.184.20)

On 2026/9/18 22:52, Will Deacon wrote:
> The hisilicon "sec" driver targets arm64 but can be compile-tested on
> other 64-bit architectures. In preparation for removing the definition
> of CONFIG_CPU_LITTLE_ENDIAN for arm64 (since it will be little-endian
> only), invert the check in sec_set_endian() so that it behaves as
> little-endian by default.
> 
> Cc: Chenghai Huang <huangchenghai2@huawei.com>
> Cc: Weili Qian <qianweili@huawei.com>
> Cc: Zaibo Xu <xuzaibo@huawei.com>
> Cc: Longfang Liu <liulongfang@huawei.com>
> Cc: Kai Ye <yekai13@huawei.com>
> Cc: Wei Zhang <zhangwei375@huawei.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  drivers/crypto/hisilicon/sec2/sec_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/hisilicon/sec2/sec_main.c b/drivers/crypto/hisilicon/sec2/sec_main.c
> index 752565200c16..03523cfbb28e 100644
> --- a/drivers/crypto/hisilicon/sec2/sec_main.c
> +++ b/drivers/crypto/hisilicon/sec2/sec_main.c
> @@ -484,7 +484,7 @@ static void sec_set_endian(struct hisi_qm *qm)
>  	if (!IS_ENABLED(CONFIG_64BIT))
>  		reg |= BIT(1);
>  
> -	if (!IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
> +	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>  		reg |= BIT(0);
>

Reviewed-by: Longfang Liu <liulongfang@huawei.com>

Thanks.

>  	writel_relaxed(reg, qm->io_base + SEC_CONTROL_REG);
> 
