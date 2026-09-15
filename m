Received: from mta0.migadu.com (out-195.mta0.migadu.com [91.218.175.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D8123645D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439217; cv=none; b=taw1pgHmCqITTo9LHTb6GxB+CB4KW3Q0k6xumiPLLibdr+5/LvhlsmdR22dgMhJf8Ul/Zbz8WZaWrYz4mcYsWMuLA950xn7+HQeo5/ICldwov2tCczLp7w3Hk8HVnYj0LHaDs1VpKaEPQQpvminbZoU3tMSKWnhS5lNse1O++8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439217; c=relaxed/simple;
	bh=WFAadgQLRx9VGPG7beZ1PrymSk2taGND2sdEQsl8PYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSW24+RLgatNH1BqWbnMthNK6t3i5Lsi3J1mWh7EoeOz0H+il6ya6Aowvq6CMnGss6sAIW/DU2H3Ohv/QFV0Sjb92iwVCmMjRP//zrESeHCF900t8fqm4axqN2+k64K4veRmu2om9XtuSbil18lv+oGVne7qxO0pQJx5rbDndTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IDOPJAkx; arc=none smtp.client-ip=91.218.175.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IDOPJAkx"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WFAadgQLRx9VGPG7beZ1PrymSk2taGND2sdEQsl8PYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789439213; v=1; x=1790044013;
 b=IDOPJAkxV1E7AzaSc2U+1EHFnJVe9bFouwDr5qxPJEIvlUEhnz9UTbdjQXiBFhshNck9po96
 KZPR8ThwEs83KO1OgLZAN7lXnTvbROWgTBT/WHePb93AmuV0iOCvi5TpyiahBN36DQpzl/srgVw
 H98PFKLzQYBrGMToLsIP5D7M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 28292594e66ea37f;
	Tue, 15 Sep 2026 02:26:53 +0000
X-Mizu-Trace-ID: 28292594e66ea37f
X-Migadu-Flow: FLOW_OUT
Message-ID: <7dccfc33-0ab8-4dc5-8886-8ad2b6dc290b@linux.dev>
Date: Tue, 15 Sep 2026 10:26:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm/vmalloc: extract show_busy_info from
 vmalloc_info_show
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
 <20260914-vmalloc_study-v1-3-526f68559706@linux.dev> <aqgqjRJ8qpYmx04v@milan>
Content-Language: en-US
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <aqgqjRJ8qpYmx04v@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/15 01:10, Uladzislau Rezki 写道:
> On Mon, Sep 14, 2026 at 11:34:02AM +0800, Ye Liu wrote:
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> Extract the busy vmap area iteration into show_busy_info, mirroring
>> the existing show_purge_info pattern.
>>
>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>> ---
>>  mm/vmalloc.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 797933ba9451..7638845377f5 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -5345,12 +5345,12 @@ static void show_purge_info(struct seq_file *m)
>>  	}
>>  }
>>  
>> -static int vmalloc_info_show(struct seq_file *m, void *p)
>> +static void show_busy_info(struct seq_file *m)
>>  {
>>  	struct vmap_node *vn;
>>  	struct vmap_area *va;
>>  	struct vm_struct *v;
>> -	unsigned int *counters;
>> +	unsigned int *counters = NULL;
>>
> Is setting counters setting to NULL odd here?
> 
I would remove '= NULL'.
> Other than that, LGTM:
> 
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> 
> --
> Uladzislau Rezki

-- 
Thanks,
Ye Liu

