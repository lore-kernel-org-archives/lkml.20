Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690530;
	b=zqKcDLsdxQPTvXpIeS/ucA9YJ/aK25EP7oew+OSzCVrSd8Y3OtplLWw+ysxcaa//3Bys
	 rpz+DooKYyLjsPsV4YRx9wZRDrl8ga26oqUYnA4gNsHtIaJLUc8lo+Kfzj7g4bCnOk2yM
	 UeMaLc5CBiAZJUneibKMF+1jvO8bblkGml3ljX9GhIYBrOYktpO6KU/QzPbRju5IjfsXc
	 JGaBeFAXhSlEROzthJzrRyLygNnDfjzF/8sMKvF9V67Tk2aPsR7/wxHbA14wtxXBc63gQ
	 N2MbKbXyCB5jPbR4h4mWOgpr/EasbezTmcJUoUOXFWw0zGXJJ1ZuCxlvzWUQ5Hzgb+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aU0Fo/t+9JMAeVCzpMHJlOqMoWJ9Ex7tTQwt5AkyeMU=;
	b=F88NkN/qVv2OeCeuaC0X/aYGldDKghjQLPWtrOYtdd8mwwyXzcLUOdoae41H2lLGnhhr
	 fnEINJ/CwPpDPv45RhUPDSyM41Kph9ppS0YgkFgbK/xH7CL/KPg9AJYilTP9FJH6eYuOv
	 ns7BrmFqqMlABKg1nS9jyQbuFVPUnCFzIprXDAGnzf/SlkZThNAZIyYxT5LmhOqVfER3B
	 iOH/dTWNTYZgh/jkzN6sj2mIMMugNTFJKeA3juLoYSJYtvTZvtXRDnQPgGABor8rT0fJY
	 86V1R94FdlRNnXlFOwaF3AFOYmHCwXxlvedeWMVk+LuQx2ebUiDNfgjZaiKFKN+bd1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odyE8Yx6;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE52606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE52606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odyE8Yx6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so29003585e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793690529; x=1794295329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aU0Fo/t+9JMAeVCzpMHJlOqMoWJ9Ex7tTQwt5AkyeMU=;
        b=odyE8Yx65t7UsqvcKqLhGzKhrrqO8u63aeWrdMumgLCHNAkRMRNKLZ94Fdb4ABER4G
         Xqxm/dhzsDrYsM3LYV2j6/Iw8zJ42pkhJsIT+AHkvC0LD4ak4XsSszP8mU+ocuZ7G8iO
         RLbQOxQfAiqF5C7K2pXjz1ukuvWPTDx4eQkaPV4WjOrugqcyHQ155B+DRXG8EqpS+iHs
         cimiWx/UsmQHZW12PGCdfs5k6bNUs4XBVMhSfJv6lgEdTjGiQOOKtC7Ew1BVUxLe8OsK
         31D0UZANQTVx0TNw12/y7SFZvysT0hxyv/YuVw4lPEREjVVGLY6cDMFr+FCmkwojsSA3
         6JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690529; x=1794295329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aU0Fo/t+9JMAeVCzpMHJlOqMoWJ9Ex7tTQwt5AkyeMU=;
        b=n29EfGlk1c1XMwbEUc9wwkMtcUTJYVb7EaPZgdxvgrE8z7gEojqMMrKyI0luNQict3
         HGfttqMPyrCP7NhAE8PJuNEtIPCg560VCocaw+UsERO1F6nL4WDWJBPpnw+m7Ko9sO4H
         Y4/u3sSwPhocv63Vy0aKPfUTTDOzPPUh5NVyNjKaeddx/KD9MHDlDMDb5jdx9KkWfEZH
         uGmG0eKzp57Fy/0ZcniRiyR3cK3jYcOQENV+szzqeGw/mf3ty8Z4HSMMaPHw11w7tDST
         gXrD2ymbjbRfwYlUXybj9WhuBXOUSVPcom16LkfSj4jZy0H0ALZjN6pAEnXRfoHHL3TT
         YhvA==
X-Forwarded-Encrypted: i=1; AKwUvBycykfA/j4kc17LknWtVSaVai4s6K2D7pXj2bK9rTdJiKpsyTlJvebf4Wea+spKdgQU4fMtCRpf+wxUrLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IPsHTek1s4BDeLeW3Wa0FiuHWhEoIuB32u7X7hFv5Jlzew5gi
	3pC0JEvYifYnb6BfgIkjD7HW/pa2cs2ttrDNrwF2oEvAsSebZRjNHYUG
X-Gm-Gg: AYBFou1DsOE56/pZfBrQwY+vsWFXLhZdYQzlAD+G6F5uxS/7270V9lv6gkc9kALBf0Z
	YjrRVhhnwp0Htmy5hraj54ip+8DZUSQYpKRJQQFHD6IJBtJy5eiyZmwTtYP+hlwf03aWixAMazH
	Qd6O83sQIgIa3PxEIcG6QrYCISVrCH4HJcQLhFl/EMx+uwvxYsuZOHY82qzrfx85RzjZ4Jidh/t
	8vafgRgX0jFtRAP768bxJqlPGgCdHvr2HhrMTNb4+4MBvzu0ixR1HYnM+LmOjOe8R5ppAF7SSQY
	ZuOB5u7aOnLTzTka0J8rMnKGPO6a5qq18zYkmKP8Gs9IPd1K3wCuRtFqP3d8zUn4zzKx68yTgAr
	pZA+plD22uzoeCyKotcUpe2zEHERARFXxcf1rnPzvcegJOSpP2+fCqESRj+47W1Df27zU+jn8uX
	+J3ps9nMmw9smixA2RHgpeZBxbdwokxsENk5cn5mAV7fNSvzp1MTyuPLt16BQlZg7lQHVZOqC5l
	T90tqFp3To48N7R1XjR4w1Zc6lVcmpBbfd9l5CHEn+V0TLqAdtJvmi+1uS2Bq7mCgUJSf6aTRdN
	DKF1659q4wri5mGDTbVXepYX0V3ajlSjaa6doyqHUmzJEwtEk0ra5J6QzekD/ZBnJDsiH1k6Dia
	E6h+eDqP2o94gCzNN+ICJ71KW5nqnjCdbyiM=
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr262447705e9.0.1793690528518;
        Mon, 02 Nov 2026 23:22:08 -0800 (PST)
Received: from [10.77.100.5] (ipservice-092-209-215-046.092.209.pools.vodafone-ip.de. [92.209.215.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e184esm41772445e9.2.2026.11.02.23.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:22:08 -0800 (PST)
Message-ID: <2479af7b-7919-434c-a205-14e3b545c9a4@gmail.com>
Date: Tue, 3 Nov 2026 08:22:05 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/surface: aggregator: Fix use-after-free in
 ssh_ptl_shutdown()
To: Wentao Liang <vulab@iscas.ac.cn>, hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <20260917135607.2154130-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20260917135607.2154130-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.09.2026 um 15:56 schrieb Wentao Liang:
> ssh_packet_put() is called on the loop variable of both
> list_for_each_entry() loops in ssh_ptl_shutdown(), freeing the packet
> before the iterator advances past it. Use list_for_each_entry_safe()
> and move pending packets to complete_p, as their links use
> pending_node, so that each loop walks a single list.
> 
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Thanks! Overall valid fix, but similar to Ilpo I'd prefer this to be
two separate patches, and a better commit message for the typo. See below.

With that, feel free to add

Acked-by: Maximilian Luz <luzmaximilian@gmail.com>

> ---
>   drivers/platform/surface/aggregator/ssh_packet_layer.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_packet_layer.c b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> index 3dd22856570f..871780828419 100644
> --- a/drivers/platform/surface/aggregator/ssh_packet_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> @@ -1983,13 +1983,13 @@ void ssh_ptl_shutdown(struct ssh_ptl *ptl)
>   		smp_mb__before_atomic();
>   		clear_bit(SSH_PACKET_SF_PENDING_BIT, &p->state);
>   
> -		list_move_tail(&p->pending_node, &complete_q);
> +		list_move_tail(&p->pending_node, &complete_p);

This is fixes typo and should be addressed in a separate patch.

>   	}
>   	atomic_set(&ptl->pending.count, 0);
>   	spin_unlock(&ptl->pending.lock);
>   
>   	/* Complete and drop packets on complete_q. */
> -	list_for_each_entry(p, &complete_q, queue_node) {
> +	list_for_each_entry_safe(p, n, &complete_q, queue_node) {
>   		if (!test_and_set_bit(SSH_PACKET_SF_COMPLETED_BIT, &p->state))
>   			__ssh_ptl_complete(p, -ESHUTDOWN);
>   
> @@ -1997,7 +1997,7 @@ void ssh_ptl_shutdown(struct ssh_ptl *ptl)
>   	}
>   
>   	/* Complete and drop packets on complete_p. */
> -	list_for_each_entry(p, &complete_p, pending_node) {
> +	list_for_each_entry_safe(p, n, &complete_p, pending_node) {
>   		if (!test_and_set_bit(SSH_PACKET_SF_COMPLETED_BIT, &p->state))
>   			__ssh_ptl_complete(p, -ESHUTDOWN);
>   

