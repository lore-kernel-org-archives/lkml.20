Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B0E49F11C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357534; cv=none; b=IXLDh4fQN3GUXLG9BHIhDUMxbTw9WUyZBPr6NjZojDz3IkKaplfmwX3JJf+soDYdRstVzQUBWTObX7wEQ3lInOEYiLhy26+grRG2XX1uHEOYAhid4zifS57ymRqVZ9+4etHT6DbV714xKqpD6RYGnIJlMs7tZxHLTmZBtqTG8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357534; c=relaxed/simple;
	bh=uWT0lnTudKC4otiiCe9Ize4yxihITd8gwsGZV9zmkGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmZafqUwUDfMEFoMEOGwTiM+N3bjNYjSNTW2IBXS/+oSK5yMRqHqBfo5crAMTY23Fp0R7KRpv8UOO0HHVtyKXkH5XE7O+ycnhm3ZdOgjxMJnahy0fBO3BjIBMlfWw9IZLNt4I+md6r1Qje5CYVk0T0pHs4LAi9s4MW0LBgaNr5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AZilYJBi; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AZilYJBi"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90cd4631090so12186246d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788357531; x=1788962331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97xe5JLv+NaFCNr+X5yBHso7S5p/kZD7Bjv4DEhoDWo=;
        b=AZilYJBi8VX6LX30adQpJDh7U7tXDHOMk1OAdiSBikJCRHjBU0zZqZBi3fLFuEY7jo
         G6ysLsJqABjNPSG3QSqNyLRALLxsN7UQLSTmzm7XShbmjMqAKrJIXJlpB1nAu/BUQZ8J
         21/7QNUhGWvH4gjidVkE8AKSJi93ysS9pYW/d1n/2qtgCp0RRO/laYR4IdfMj1+Sl4xh
         OudfsNLtvCQInPWLWgs3axkUCei0B/96Tndb0Y5M1zk45QgfYbyRQi4Hn9cQiTSrO5p2
         iya+u2jvtYALnLA0nbbmYQYgmWZeBNALVho7zPe+OHopVNNbPg7Kzb5ULYySXfcKGN3D
         pRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357531; x=1788962331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97xe5JLv+NaFCNr+X5yBHso7S5p/kZD7Bjv4DEhoDWo=;
        b=jAp+ooqDo4F5OTHbtKp3qQQOE5pkVglm/3+5D9Cx0u5getkC2AJRrTH/6IAIED37dL
         +ZqzUG0GRaSoueCcT4GEpv2cRqJTzhoO+EDZh/wwZZXepb3Ms2cfNA/R6eEgDcJTjEBQ
         QZTq4chXN+7jhvZzxK0HKg5FVJdZ0IaBpi05rCoqHCeA3u34iz1kPfYuF2ojw9mPBaJR
         5v8MZ4JBeLVoFuyEmxg0g4UAeBjjdEsU2XYKE2BLaqrPpCh7qRCYw7CCzyJhSa9bJQif
         66huiYoXbuqeyJrB2GStfuA6MPlMAI/1qyO0CMJ0ExROXwlJMADnbs7ANj7RQfkGfSK+
         7N9g==
X-Forwarded-Encrypted: i=1; AKwUvBz9lwVLcSia0SMUryEYIpbvfVbSrZbUkd9YkgA+PL8tHWpHs23xHg3ghHmeExd/q3FDgUG9VUvNbLGq+gc=@vger.kernel.org
X-Gm-Message-State: AFuF++kBQEbao6xTGswQYs7MwHt6uzdX67NO0KQub+ONe1aeb3ybXAsd
	oAFlvoCnIr1fYm62ihWJIy1XccxwU6x2A8VIxJW6R4ZBytfUhq+wM///Itn0DXUbhYWpMxIYaGF
	qMpmS4yg=
X-Gm-Gg: AYBFou1M09v9T3aJzYmnY+SzUBvH/0VBmVa75HwnC5BdwYFtW8q3SP+OKM69LECJ4Nn
	LH70Hqb78K5DaZI5PIQ4NPo6jvyMM/K+hrXJxCC0o1ER5xxMLk0ODP0q+1GJHx2HEivWq/CsBjT
	Zii5HeUHGoubVAHgMboEFKtHdTg+kaHhjlCWbPBd4LvIift+SK5dUDdvivrEYvA412qUEuRvWxI
	gsc8EoVPtlXtyHjj7iz7q0ehN4voLChvSgHSWuPc2+2+FXw7F7840JXY2x95Bd5qAY83GDTrfwe
	cA/hsn7+VL4hQytQzu//8n/RJ/AD4EVKtbjL8uH/tAHAl+BlYNtFIZ9w0t9BM3IYR5pg8sfkI1p
	07DPuWGwoR44vf5TZV5VkbnGYhgUrcQ+sHlm7vdD2FfObD5Udh7FNp2dcI4z91XgWDCtjN20JVa
	Udh4i2soeBH34PhOn245PfY5m9fVixq0Om3TTW1cp0dinirA1W6cbqZofVavSxIZGMv9tyCEHqU
	CFU+5ss0GMIYC+kasGocdFDgtH/sJRzV5bK8KaJ2/Qg2N5aXBrYr0A=
X-Received: by 2002:a05:6214:2628:b0:8e9:51b7:2d49 with SMTP id 6a1803df08f44-9102e9d92a2mr33434286d6.2.1788357530755;
        Wed, 02 Sep 2026 06:58:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee07983sm18656516d6.8.2026.09.02.06.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:58:50 -0700 (PDT)
Date: Wed, 2 Sep 2026 09:58:48 -0400
From: Gregory Price <gourry@gourry.net>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mempolicy: fix mod-by-zero in weighted_interleave_nid
Message-ID: <apgrXDZ_dOz2hRJ3@gourry-fedora-PF4VCD3F>
References: <20260902090346.16429-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902090346.16429-1-liujing@cmss.chinamobile.com>

On Wed, Sep 02, 2026 at 05:03:46PM +0800, Liu Jing wrote:
> In weighted_interleave_nid(), if the iw_table contains all-zero
> weights for every node in the policy nodemask, weight_total sums to
> zero. The subsequent "ilx % weight_total" triggers a divide-by-zero
> panic.
> 

weights can't be zero and we just fixed the rebind race

if you're actually seeing this then there's a different bug to fix

> Add a zero check returning the current NUMA node id when the total
> weight is zero, consistent with the existing !nr_nodes guard.
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> ---
>  mm/mempolicy.c | 4 ++++
>  1 file changed, 4 insertion(+), 0 deletion(-)
> 
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2218,6 +2218,10 @@
>  	/* calculate the total weight */
>  	for_each_node_mask(nid, nodemask)
>  		weight_total += table ? table[nid] : 1;
> +
> +
> +	if (!weight_total)
> +		return numa_node_id();
>  
>  	/* Calculate the node offset based on totals */
>  	target = ilx % weight_total;
> 
> --
> 2.43.0
> 
> 
