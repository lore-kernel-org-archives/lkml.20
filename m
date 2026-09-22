Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C6553C3D9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079054; cv=none; b=WIOuw34GBrtjEiwb095D7z8bN+ZLku0MIKRsWFFEZVa5/Da71qSXu2BkBfyEUYmtfReELy3JHiH/u0ZOlUQrO64fPIilLz2XOZjVhtvMAkjwFTqfVFOV7HuNV2IgunsK+nIJyVClKDD2wMl4EXdHhnsyNPItBO0JuVtPoLibiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079054; c=relaxed/simple;
	bh=q+96XJpPAwjrzNc4z8gwPbPubuwVJu3js3U311Eo3fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iod1YXkOCW86ryrI8llwRPsWwmhbuXWUIgFqQTBiOhlYkdgQnPFOYOQeOKdZb9gLc2Y6iuEwjTopPfl/m4LgLCSBSv+iKgQ8KSOSq7RPheNmQZXBYgIetVLE/oqxjswz7tdBGpNlo+c4gtinDatgfP9K/u5YZiirmKWKJtni04I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i01rFyrL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xf7JLSCW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i01rFyrL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xf7JLSCW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBOujX984440
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmuNBCn2WcfbClZ5XMSuk70NP23bX3kKvNdyJ4b97To=; b=i01rFyrLz8Io7eud
	ZDHIioglcZTF0Sri/5VWhE2RsAQ192uXjBkODwYl8QZqw2A2ex8I/WFnfC4KG0Ad
	88440la7uJRDqxeXHjkqwL6T9A15948QmHnVIOIy5II9NWrOFGqkrMeW01JxHlzK
	JTbrnnr0ttguVzFe15ntBpGDSUPxHlYNPgmpG/4tjVuJKYfBiySPl0NhJPYqj/dl
	86dhfYA8sfMUbqyuJ5N5snars3PxjRvchmMWmV/m22Iv2Wq1DN3wW1KPftiFJCM/
	gmvHHLphfDoF7GaH0q4X69oBpTSNycyAAAeWL4/HBARNpwodMq0B3h/9yckTqsbg
	zRgIfw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4rf41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:10:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so50312945ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790079051; x=1790683851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmuNBCn2WcfbClZ5XMSuk70NP23bX3kKvNdyJ4b97To=;
        b=Xf7JLSCWzVuR73Z4ZbehxuWzddqoYn0aYoC8fg87gUlOHnpP3su6Lyfu/EhTiEfZJh
         UnoQxBQ/EAr7oMcQkAfCryi2plLw6zZmX8E06jvhU5R3yupD+/kokzTCu0F2Me41ccEN
         KlexORWZEmuUyg0iQA0ByV/thWpbg6VevPxGaFeWYalUJaEn+bAQwlFS9kiLFlmOVx2w
         9H6CjXXVyBYLphNfff8IN0gkg/ClzVI696wrL7JmNbHLCOE5U6WIzV9T0eDPdWpufoMQ
         vv1gJpLNOzHJu0JsNLwNf2ALCpYK9BJeMew92Bp8ChASmVvqZEw5qarWkrpQNjpHnmc8
         E+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079051; x=1790683851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmuNBCn2WcfbClZ5XMSuk70NP23bX3kKvNdyJ4b97To=;
        b=Sx1/5fDq9DUWGIfhDjpqjFIEXs4P0V2/hxYxVge7Horz6nyR7+vsByuimtIxV41CD4
         UPaDnZ42qr4xHvdEdWOLfgkr31Ra132ZVNVOk1Wcyf8qMhk3sd1ix1/ggXSbhn5EvA1G
         3Pnl0EnXPJSRFDywYa+hlKi+vHCjzzTDBM7r2Ui9b7Z1bBZ65rMemF9tSRYbVh2vDggz
         sCshNaTxSsOCdsJbETYGZuwmIN4bu3+nkd0vpgr+8+DgHIS248HuYQuSU7BAOTIudOg0
         F+e66bUJu3hvRL/H0PwKKY4PEdqBflfI0K7L9vnGtFAcNNBhtXIP0lTsQl25g2joDSF6
         p+Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxEbjZWO0QvEVq83aFu4yTWc30kPdzR6hw8Jx2nqgwIyKJ6LjrLntqGhzEToDH7TeljXoEZpaSzcnBr1d4=@vger.kernel.org
X-Gm-Message-State: AFuF++n1RgR9e1nyzwc1FPTtt0LM6ljkkqT1cPPlB9qUuYM4pQYPP3DJ
	gnA8wVVLx6MrLjYJ4+WbJDJTPDAQwZ0w49EjKoDbSa7hg/FXM4Rgaygv3b3QTnwndScnkV2UW3N
	8n7K+6436BjfEn4UdBP6Z6SGYQ1SqQyYy7eiXL/6EiZhcN791tlMI+s7auBZTpNBw5/0=
X-Gm-Gg: AYBFou3luPI7g2++0Ge8byVL6WEj3aNrhF1TmXqjJM0G7mO6tcBxMiwEJiIbDBe5vsx
	5cl+jEt6Rqvi1ngjYeCrzSMBQvxdAc9mXGOTTn98++6uzvh8FiETUS5OOb2/7UL5Sol/pSM/RLa
	Gd1lNqakQfsstOQP5+QdcQ+mKhHV3RSZQl+uhDB/tx4NJ4weDbj+OYM8JxWneQ8CpjPGzKvVxTH
	Hd4h50GNxDQI7XVg1iScwJlZrZJ2SKPX0Je0JBDalifAookbiHRtzVk4eDEk8oHb0vLft0kk0yk
	BQaO/l8VWGeRbrxUFvfDe/fIyXj60mBZcce1UWaRvt83dP/9TSrSXSG0zYMGGQly+fDP+7Wy4jp
	b2JIAASSqzsO4smiNN4vmE8tk2lHCo7pcZ4mBzvngGNXb5mdPxIyVkvFNOQ8oivIg/SHB7f77mV
	gasg0XSf/lEYEQumgTog==
X-Received: by 2002:a17:903:28f:b0:2db:8c12:6b03 with SMTP id d9443c01a7336-2df609ad83fmr11047205ad.8.1790079051439;
        Tue, 22 Sep 2026 05:10:51 -0700 (PDT)
X-Received: by 2002:a17:903:28f:b0:2db:8c12:6b03 with SMTP id d9443c01a7336-2df609ad83fmr11046765ad.8.1790079050851;
        Tue, 22 Sep 2026 05:10:50 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612c9ca7sm6295940eec.17.2026.09.22.05.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:10:50 -0700 (PDT)
Message-ID: <df0a5e79-f2a2-4f74-868b-8f6291accb04@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:40:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dma-buf: system_heap: Set allocation orders for larger
 page sizes
To: Juan Yescas <jyescas@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        "T.J. Mercier" <tjmercier@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: baohua@kernel.org, dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com,
        surenb@google.com, kaleshsingh@google.com
References: <20250417201913.2393655-1-jyescas@google.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20250417201913.2393655-1-jyescas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NiBTYWx0ZWRfXy7Pl56z5AOhz
 x+a7YRzY2xXUlvkgwx72Q2OO9XQxhnX7u1Lom5WBQoCdRX9WHLxk2u4VyVE7HLkHyvclU+VW0kF
 F6slbAr9mSSqIsvASGinvdgOFqesTb4EjGZxiAAGAaixF760JKlKKca1riXProL/qWMV2TlCMS+
 W7BEZQtUd7tgdHhZ+tKcymq6ISri62tlAOpcFl2Soa12fXKKkYSHmoaw7daCKMZeE0sVCXVLwIR
 docDXtNTck8LJ1fqN/PzId7X9DHcKWDQrsJiIeA6KZI5Kul6RTuIMBqvWhyuwWukBV1sE8i6AfF
 7eh/HvaX091c0C8x+tWFvqf0kk391bH+9I0p56AO/sqEHpj2VMuHu9jmMOEuuVBwf2O2u6OuzCJ
 nmjA7Gg3l9Q99C99c2GETTaufMWe+uyRUQ9E/XqKtdfZ6UE+YIefeMlzmatSymJtq30COQ7jXJK
 EbB9YUPYYUuAKQLpDvg==
X-Proofpoint-GUID: e5qgX9gx4mV0wy5M9f7fjwDamGYljxht
X-Proofpoint-ORIG-GUID: e5qgX9gx4mV0wy5M9f7fjwDamGYljxht
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NiBTYWx0ZWRfX85JmS9Juym1+
 BUFGPsaM4/Ibzg8Nyx7dtat44/PZ7UI9XgWryDPXfAmI9r8rnZ3W726WD5PooKiq4hYKRU38mqB
 K83POHIEKpmIRx1mM8Hslgh0anErPiY=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2704c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=F0MHshuycdHDXIU-fbcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220176

On 4/18/2025 1:49 AM, Juan Yescas wrote:
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
> 
> This change was tested on 4k/16k page size kernels.
> 
> Signed-off-by: Juan Yescas <jyescas@google.com>
> Acked-by: John Stultz <jstultz@google.com>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> ---
> 
> Changes in v2:
>   - Add John's Acked-by tag.
>   - Add TJ's Reviewed-by tag
>   - Use dma-buf: system_heap: in the subject since this is specific to the
>     system heap, as per TJ.
>   - Remove extra space in if statement.
> 
> Changes in v3:
>   - Remove defines for the orders as per Christian.
>   - Update the order array for 64k page sizes as per TJ
> 
>  drivers/dma-buf/heaps/system_heap.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 26d5dc89ea16..8c10c0f2b473 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -18,6 +18,7 @@
>  #include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/scatterlist.h>
> +#include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>  
> @@ -44,14 +45,28 @@ struct dma_heap_attachment {
>  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
>  				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
>  				| __GFP_COMP)
> -static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
>  /*
>   * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
>   * to match with the sizes often found in IOMMUs. Using order 4 pages instead
>   * of order 0 pages can significantly improve the performance of many IOMMUs
>   * by reducing TLB pressure and time spent updating page tables.
> + *
> + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The possible
> + * page sizes for ARM devices could be 4K, 16K and 64K.
> + */
> +#if (PAGE_SIZE == SZ_64K)
> +static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP};
> +/* 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE = 1MiB */
> +static const unsigned int orders[] = {20 - PAGE_SHIFT, 0};
> +#else
> +static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
> +/*
> + * 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE = 1MiB
> + * 64KiB allocs are calculated with (2 ^ (16 - PAGE_SHIFT)) * PAGE_SIZE = 64KiB
>   */
> -static const unsigned int orders[] = {8, 4, 0};
> +static const unsigned int orders[] = {20 - PAGE_SHIFT, 16 - PAGE_SHIFT, 0};
> +#endif
> +
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>  
>  static struct sg_table *dup_sg_table(struct sg_table *table)
> @@ -318,7 +333,7 @@ static struct page *alloc_largest_available(unsigned long size,
>  	int i;
>  
>  	for (i = 0; i < NUM_ORDERS; i++) {
> -		if (size <  (PAGE_SIZE << orders[i]))
> +		if (size < (PAGE_SIZE << orders[i]))
>  			continue;
>  		if (max_order < orders[i])
>  			continue;

Hello Juan,
I've posted a respin of the patch by extending upon your work,
Can you please review?
Aplogies for adding signed-off by, will drop it in v2.

Link -
https://lore.kernel.org/all/20260921-dma_buf_improvement-v1-1-23d82e771dec@oss.qualcomm.com/


