Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792982944;
	b=rnQRSLyUWeIenY062Kvpx0LN53h657aQ58sAhsLJdHnXxGnb1SbJ3gAMqE7otdG1rt16
	 nwc+OtG3IR2lcFxLwYbenWkqm4fOqcfaGEw3OrNvioWiYQbp0+4qN5UppjejWuHa5q8ie
	 RIeD03ZYbZHIaT/osGBTnrLDpsccTjlkYWM9iNiKH2t6fyHbjHYiQKC74JhtdZdRzGUTT
	 /VgWezmEmNCZEvUIWO067IJ+UpLjgzfsY08r4SkRh0LiWY+iNSJoqz7I2o7OtNd1j6x7D
	 zYQvdqqYH77baf02QFyjAMqb9/SF/mum94fLvcenkuhHQd39XrKE+NV2TsagH4S6Jqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982944;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QoMN9IuoMoRHGY91ipX/fPql2/FDyo785asdqTToyvk=;
	b=JPVssrKCYpTRMOswKypx4IHHh8RzHmlGoIaovka9bo9h8xVl9izNQRRnj2awoh4IIxdz
	 uPhteuGLUEXgxtxTHgx69v/8UujqBQLnxbVIINCV0Q068tXVm6dqVzCS1m6ioQ4yFdNLs
	 0atmUDtzZI1m81uphPrP6gC26vMDzD/20wfi2SkwIDAmjIFuBFfKsv88llaPMgEMt2npy
	 FlxPt16ae30p6W6A5BS2xcc4/hSAeP9ZN6b2x9Il9imiwWXN9vvWlMDq/FLYUSGKkLfrL
	 I433fNfPXMGmSHtiZkXxwiIRmpivYw7V/pOneR455t6KuabFeFVbzbAc+YvmT/XkWPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SiwXqmHb;
	arc=none smtp.remote-ip=95.215.58.84
Received: from mta1.migadu.com (out-84.mta1.migadu.com [95.215.58.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AD0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50AD0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SiwXqmHb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jdRN6MFYj2YmCSPub8P43JPTJWPrmm0ezeN7UlTo9nU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792982940; v=1; x=1793587740;
 b=SiwXqmHbi65DNkwwTjRhyM6I0cf8U2pHI0z3sKlege9VRk7dGsCpjiFCHsKNi56JsIGrCEFq
 QjTEpy9XjBygk5vpewtFb/uZge3opXg0VpkYG83yVVH76VurYndIhXHDIXIBb4RZ1Ov5rAY52rG
 OVsg92/8WqJaebd8ExTg3EsM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a9d9d49db9a7899;
	Mon, 26 Oct 2026 02:49:00 +0000
X-Mizu-Trace-ID: 7a9d9d49db9a7899
X-Migadu-Flow: FLOW_OUT
Date: Mon, 26 Oct 2026 10:49:35 +0800
From: Chenguang Zhao <chenguang.zhao@linux.dev>
To: Serhat Kumral <serhatkumral1@gmail.com>
Cc: jgg@ziepe.ca, leon@kernel.org, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/mthca: Fix off-by-one in mthca_map_user_db()
Message-ID: <20261026024935.GA151928@pc>
References: <20261023192348.11070-1-serhatkumral1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023192348.11070-1-serhatkumral1@gmail.com>

On Fri, Oct 23, 2026 at 10:23:48PM +0300, Serhat Kumral wrote:
> db_tab->page[] has uarc_size / MTHCA_ICM_PAGE_SIZE elements, so valid
> doorbell indices are in the range [0, uarc_size / 8 - 1]. Allowing
> index == uarc_size / 8 results in an out-of-bounds access at
> db_tab->page[npages]. Use '>=' instead of '>' in the bounds check.
> 
> Fixes: 56483ec1b702 ("[PATCH] IB uverbs: add mthca user doorbell record support")
> Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
> ---
>  drivers/infiniband/hw/mthca/mthca_memfree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/mthca/mthca_memfree.c b/drivers/infiniband/hw/mthca/mthca_memfree.c
> index 9c5eb03f354d..39d82dc73807 100644
> --- a/drivers/infiniband/hw/mthca/mthca_memfree.c
> +++ b/drivers/infiniband/hw/mthca/mthca_memfree.c
> @@ -453,7 +453,7 @@ int mthca_map_user_db(struct mthca_dev *dev, struct mthca_uar *uar,
>  	if (!mthca_is_memfree(dev))
>  		return 0;
>  
> -	if (index < 0 || index > dev->uar_table.uarc_size / 8)
> +	if (index < 0 || index >= dev->uar_table.uarc_size / 8)
>  		return -EINVAL;
>  
>  	mutex_lock(&db_tab->mutex);
> -- 
> 2.53.0
> 

LGTM
Reviewed-by: Chenguang Zhao <zhaochenguang@kylinos.cn>

Thanks
Chenguang
