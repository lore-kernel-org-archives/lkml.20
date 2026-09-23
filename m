Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421D7369D75
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143978; cv=none; b=Be8klbTS4Rg+7RRDSgM+kAtlCqyPYg1oMqPZnpTTn5h9GPsrnjIEhCJzmG00J3G3f2kU3SK9xrhoqLvt1H2sjB0II9AtlTgjY/1svHK3gncbysWe0hLLfrQRxZ/L/cbj6GH/bfiU8vgx9sNly+Utgdyo3fntJyRWRt3VoQOwHK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143978; c=relaxed/simple;
	bh=1fRPmNbQXvHC53xMbdAtoAdeMF4gnTqois2bu9TUmow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eklrl0USvr8Vo/kzTuybIvJkZYw7PFDacfX3TDlSyrqO19KEcAOn7a+2wD8if3/IMRNQ1b8xHhtpOkw3Yag+cKw0nv9ciRXsJtztCbXa8WvV2tMJllqx1UHFJuAi8fv5bWuFLj1209OBCfVMLH/IXMbCxdVrOVfveNztRpRp33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=NH9KNzny; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="NH9KNzny"
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id 9BL9xbiXMv0nd9GDwxnPLE; Wed, 23 Sep 2026 06:12:57 +0000
Received: from gator4166.hostgator.com ([108.167.190.91])
	by cmsmtp with ESMTPS
	id 9GDwxHac2kH8b9GDwxv5vm; Wed, 23 Sep 2026 06:12:56 +0000
X-Authority-Analysis: v=2.4 cv=d6X1yQjE c=1 sm=1 tr=0 ts=6ab36de8
 a=vY9Mjuda9oMEc2E4Cx1x2A==:117 a=vY9Mjuda9oMEc2E4Cx1x2A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=7T7KSl7uo7wA:10 a=1XWaLZrsAAAA:8
 a=VwQbUJbxAAAA:8 a=veQ4WiWKPWtZt7Vb73kA:9 a=QEXdDO2ut3YA:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=ZO1i4ggFjC7Ha9WvUkpYNEJJNq9r0nBtBbotd8bB72o=; b=NH9KNznycqCa
	BU4ju8H1PMxR+58tyqj2tg5Na1X7gtSQqh+WYZc4zLltb+/d6BCPWESWEZhXdenMKm6epntaWWVFx
	PI2554lhHsxwz8BMCIRu+taZlOarboUmWN6yZcSsSO8w8WkyxV38U0dNVcrkd75nlcyBN7IqrS3CB
	gac6G7hWqOXtm/CaOyIOlmKRG68fEE516VUykP2yaZcsYWliVe+lZK5CEq4UHFVCNjVDyEcsoslDM
	E3HPw8Fl39XcOvtKQqmAIQLk2Zm6EVbCyeilLx4zt46yC4DGTRZPuJXswW5UTWgW/izDkyLTk//1k
	sW+sTo6YNZUoKDUgmkwSFw==;
Received: from flh4-125-195-69-90.tky.mesh.ad.jp ([125.195.69.90]:54704 helo=[10.203.100.34])
	by gator4166.hostgator.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100)
	(envelope-from <gustavo@embeddedor.com>)
	id 1x9GDv-00000002NYs-2PLz;
	Wed, 23 Sep 2026 01:12:55 -0500
Message-ID: <b2bc7fc9-baf3-4717-a012-cda73a9fe977@embeddedor.com>
Date: Wed, 23 Sep 2026 15:12:51 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: hisilicon/qm - add __counted_by_ptr to
 dfx_diff_registers
To: Bill Wendling <morbo@google.com>, Weili Qian <qianweili@huawei.com>,
 Zhou Wang <wangzhou1@hisilicon.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 codemender-patching+linux@google.com
References: <20260923061027.2650324-1-morbo@google.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260923061027.2650324-1-morbo@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 125.195.69.90
X-Source-L: No
X-Exim-ID: 1x9GDv-00000002NYs-2PLz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: flh4-125-195-69-90.tky.mesh.ad.jp ([10.203.100.34]) [125.195.69.90]:54704
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 33
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOwYpvkgqzeejqls6b1hlfZkPvxIkzD++wYL99MJJa9pyiKlTuHoHJl8t4AKUDgvJV4GUuUjg0odNl4n1T2kzqSsMCEpWwUW0Xduom55O2YAq2V4NWnB
 ISpBGvAmkHC5RTaTnQHAMp24EV7qj6M7mYJWzHMNDMNDBwNpGNCSZMxVK5BJt5HLSehtTfWXieRuVYb7p+poibnm2mZF896uIzktRA4Myr7pSUTIZEXuMX4f



On 9/23/26 15:10, Bill Wendling wrote:
> Annotate the pointer field 'regs' in 'struct dfx_diff_registers' with
> the '__counted_by_ptr' attribute, referencing the 'reg_len' member
> which holds the element count of the allocated memory.
> 
> In 'drivers/crypto/hisilicon/debugfs.c', the 'dfx_regs_init' function
> allocates the 'diff_regs' array and initializes each element's 'regs'
> pointer after setting its 'reg_len'.
> 
> Since 'reg_len' is set before 'regs' is assigned, the compiler's bounds
> sanitizer can correctly associate the pointer with its allocated size.
> 
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-Gustavo

> ---
>   include/linux/hisi_acc_qm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/hisi_acc_qm.h b/include/linux/hisi_acc_qm.h
> index 8dc49fa2123b..f2885d60b468 100644
> --- a/include/linux/hisi_acc_qm.h
> +++ b/include/linux/hisi_acc_qm.h
> @@ -196,7 +196,7 @@ struct qm_dev_dfx {
>   };
>   
>   struct dfx_diff_registers {
> -	u32 *regs;
> +	u32 *regs __counted_by_ptr(reg_len);
>   	u32 reg_offset;
>   	u32 reg_len;
>   };

