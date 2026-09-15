Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E54826FD9B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789446194; cv=none; b=ZsVJZf939WjVbead9IyKehFPkG5JvC+dQCkUU1dJ42uz4AFrFogMR1uG1EzzXsuecEKYak89Hk9RZ9lnnbr01D5xKRafpr/Zwy/6xm6b2JU2WVp1dj+HElejYVfTb7Qgl7h8LVoQl5U18Iw3Nx6wddHthpL/XOcIHotxue59xhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789446194; c=relaxed/simple;
	bh=QTihovuoYTHtrWdsiydIKBnDHHDBkjzHaEXKFHeEaf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAhIbzTuqhnmgU4FVE/9mwJG3DMOY6AHxBI0ZTjRj9ZztajORnL3jiKNkl5MN26fxTxAaw3yi0ULozmEIb548hE0TenzmIs6yOZfvGIiblp1KiHzyoALmOR816Xf6XnpSpRaCP0nXQ/2LngCdpRY7ZjIfiHnIOPgcFsR9TWVJiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=laRA6TOX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="laRA6TOX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA1CA16F3;
	Mon, 14 Sep 2026 21:23:08 -0700 (PDT)
Received: from [10.164.19.33] (unknown [10.164.19.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6D5B3F86F;
	Mon, 14 Sep 2026 21:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789446192; bh=QTihovuoYTHtrWdsiydIKBnDHHDBkjzHaEXKFHeEaf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=laRA6TOX+7Wq16OysZ3VgBnqWdJeIUrsYRlPTMhc8ZVylWTgY9bJxhHO/h/SK5BeB
	 w1m3+S4367IkbYhXwa+NVuU2U4zrRi24asaFI7jDgbNmlEKUdewsGao+5wnaBeERcJ
	 RWrAY5YmLx2eqY3yqBKii1rLzKGaEWD/keZ9+9/s=
Message-ID: <5f1f4e7d-909e-4622-95d2-c4ab26c567c8@arm.com>
Date: Tue, 15 Sep 2026 09:53:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm/vmalloc: extract show_busy_info from
 vmalloc_info_show
To: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ye Liu <liuye@kylinos.cn>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
 <20260914-vmalloc_study-v1-3-526f68559706@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260914-vmalloc_study-v1-3-526f68559706@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/09/26 9:04 am, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Extract the busy vmap area iteration into show_busy_info, mirroring
> the existing show_purge_info pattern.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 797933ba9451..7638845377f5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5345,12 +5345,12 @@ static void show_purge_info(struct seq_file *m)
>  	}
>  }
>  
> -static int vmalloc_info_show(struct seq_file *m, void *p)
> +static void show_busy_info(struct seq_file *m)
>  {
>  	struct vmap_node *vn;
>  	struct vmap_area *va;
>  	struct vm_struct *v;
> -	unsigned int *counters;
> +	unsigned int *counters = NULL;

As pointed out by Uladzislau, setting to NULL is redundant.

Apart from that LGTM

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  
>  	if (IS_ENABLED(CONFIG_NUMA))
>  		counters = kmalloc_array(nr_node_ids, sizeof(unsigned int), GFP_KERNEL);
> @@ -5415,12 +5415,18 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  		spin_unlock(&vn->busy.lock);
>  	}
>  
> +	if (IS_ENABLED(CONFIG_NUMA))
> +		kfree(counters);
> +}
> +
> +static int vmalloc_info_show(struct seq_file *m, void *p)
> +{
> +	show_busy_info(m);
> +
>  	/*
>  	 * As a final step, dump "unpurged" areas.
>  	 */
>  	show_purge_info(m);
> -	if (IS_ENABLED(CONFIG_NUMA))
> -		kfree(counters);
>  	return 0;
>  }
>  
> 

