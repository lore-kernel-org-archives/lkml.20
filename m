Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2E33AE1BC;
	Tue, 15 Sep 2026 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477656; cv=none; b=lmLoPBjodaiSTb/ovB5/iYvUYkq37JsWcCOAUcAfnRq8Aa90A2PnGG7lRyzzDO1ZFveklxACa/K+yHwOwCnryvxgn3WWrm9nR9ZKp2G/xN/3xmsdN6Mo8iertS3/r38kO3/v6JsA4D8oq2ITjjNqQ1K7NYec+hJKKFr66cIlJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477656; c=relaxed/simple;
	bh=NUX5rL0Kk7rQ2StlbbS8mCYi/8u2Wde5l1AFE+Qy0SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkZiBAG054o2x1+A2CCtFTWBCXKuePi5uUz07kkCe8JmUrCrLSd/mqykZ7x32FY1kzZ+neXoUftj7WrlL8FH5ccLeD9Vb9f0NRvjGMGb+kAR2xLI7T/rioWXiTudwau/J6TmdP4T4spD1yTdFrRPR4UKDhstj+ybjMyreFzPyJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iho675fT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iho675fT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1182B1F000FF;
	Tue, 15 Sep 2026 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789477655;
	bh=S+aBpk36SIDdz/rg97zJi4lYM8gD6xGt4E4q60x12rE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iho675fT0lSEN/KB1MaQ8J8no4HYY6YjYRkXtIgt34jCmTfHhgBauIrE3Ebo/5/fl
	 HqpSY5yijqreDfIvUYUWeT/FHEQjy9g3EfmVVxiS3l2cMRCzHZiMdpyWPL/vAp8WCA
	 +sFsQmiTqySe1cy9Jv+J0YPzH4WjIrSz4+cFU9yO/8yAd3R70TV4f8w47lqAF8Dg30
	 Hj/ak47//B6WYp/qmBf44VJ/uN3BcPlFCf/gkqkRZyU9kg9AgmbxFYYboFkh2BEujZ
	 4DZho0YBW/R7BngulPxqVIFoCuKqEcQd1CrpK07O25fL8uR4QJC6cFo7k8EtSaq2LR
	 UMHHRPSlsH5nQ==
Message-ID: <61897bc7-e210-4b81-b2fe-f133c962b152@kernel.org>
Date: Tue, 15 Sep 2026 15:07:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/20] media: rc: Replace open coded krealloc() for
 keymap
To: Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
References: <cover.1789460680.git.sean@mess.org>
 <3b7094b8f0035d970fd61caca05abcdd3374146b.1789460680.git.sean@mess.org>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <3b7094b8f0035d970fd61caca05abcdd3374146b.1789460680.git.sean@mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 10:32, Sean Young wrote:
> Replace some ugly code with open coded krealloc() and remove
> superfluous member of struct rc_map.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/rc/rc-main.c | 45 +++++++++++++++++++-------------------
>  include/media/rc-map.h     |  2 --
>  2 files changed, 22 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index d4baaae3a834..53e39b7a489a 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -17,9 +17,8 @@
>  #include <linux/module.h>
>  #include "rc-core-priv.h"
>  
> -/* Sizes are in bytes, 256 bytes allows for 32 entries on x64 */
> -#define IR_TAB_MIN_SIZE	256
> -#define IR_TAB_MAX_SIZE	8192
> +#define IR_TAB_MIN_ENTRIES	32
> +#define IR_TAB_MAX_ENTRIES	1024

This is better...

>  
>  static const struct {
>  	const char *name;
> @@ -214,21 +213,23 @@ static int scancode_to_u64(const struct input_keymap_entry *ke, u64 *scancode)
>  static int ir_create_table(struct rc_dev *dev, struct rc_map *rc_map,
>  			   const char *name, u64 rc_proto, size_t size)
>  {
> +	unsigned int alloc;
>  	rc_map->name = kstrdup(name, GFP_KERNEL);
>  	if (!rc_map->name)
>  		return -ENOMEM;
> +	alloc = roundup_pow_of_two(size);
>  	rc_map->rc_proto = rc_proto;
> -	rc_map->alloc = roundup_pow_of_two(size * sizeof(struct rc_map_table));
> -	rc_map->size = rc_map->alloc / sizeof(struct rc_map_table);
> -	rc_map->scan = kmalloc(rc_map->alloc, GFP_KERNEL);
> +	rc_map->len = 0;
> +	rc_map->size = alloc;

...but this still says 'size'...

> +	rc_map->scan = kmalloc_objs(struct rc_map_table, alloc, GFP_KERNEL);
>  	if (!rc_map->scan) {
>  		kfree(rc_map->name);
>  		rc_map->name = NULL;
>  		return -ENOMEM;
>  	}
>  
> -	dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%u bytes)\n",
> -		rc_map->size, rc_map->alloc);
> +	dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%zu bytes)\n",
> +		alloc, alloc * sizeof(struct rc_map_table));
>  	return 0;
>  }
>  
> @@ -262,38 +263,36 @@ static void ir_free_table(struct rc_map *rc_map)
>  static int ir_resize_table(struct rc_dev *dev, struct rc_map *rc_map,
>  			   gfp_t gfp_flags)
>  {
> -	unsigned int oldalloc = rc_map->alloc;
> -	unsigned int newalloc = oldalloc;
> -	struct rc_map_table *oldscan = rc_map->scan;
> +	unsigned int newsize = rc_map->size;
>  	struct rc_map_table *newscan;
>  
>  	if (rc_map->size == rc_map->len) {
>  		/* All entries in use -> grow keytable */
> -		if (rc_map->alloc >= IR_TAB_MAX_SIZE)
> +		if (newsize >= IR_TAB_MAX_ENTRIES)
>  			return -ENOMEM;
>  
> -		newalloc *= 2;
> -		dev_dbg(&dev->dev, "Growing table to %u bytes\n", newalloc);
> +		newsize *= 2;
> +
> +		dev_dbg(&dev->dev, "Growing table to %u entries\n", newsize);
>  	}
>  
> -	if ((rc_map->len * 3 < rc_map->size) && (oldalloc > IR_TAB_MIN_SIZE)) {
> +	if (rc_map->len * 3 < rc_map->size && rc_map->size > IR_TAB_MIN_ENTRIES) {

...which is especially confusing here where rc_map->size and IR_TAB_MIN_ENTRIES
are mixed.

This is not important for this series, so you can go ahead with it.

But personally I would prefer to rename rc_map->size to rc_map->entries and
ditto for newsize to newentries. That way it is clear that these variables
deal with the number of entries and not the size in bytes.

I mention it only because when I reviewed v4 it confused me.

Regards,

	Hans

>  		/* Less than 1/3 of entries in use -> shrink keytable */
> -		newalloc /= 2;
> -		dev_dbg(&dev->dev, "Shrinking table to %u bytes\n", newalloc);
> +		newsize /= 2;
> +		dev_dbg(&dev->dev, "Shrinking table to %u entries\n", newsize);
>  	}
>  
> -	if (newalloc == oldalloc)
> +	if (newsize == rc_map->size)
>  		return 0;
>  
> -	newscan = kmalloc(newalloc, gfp_flags);
> +	newscan = krealloc_array(rc_map->scan, newsize,
> +				 sizeof(struct rc_map_table), gfp_flags);
>  	if (!newscan)
>  		return -ENOMEM;
>  
> -	memcpy(newscan, rc_map->scan, rc_map->len * sizeof(struct rc_map_table));
>  	rc_map->scan = newscan;
> -	rc_map->alloc = newalloc;
> -	rc_map->size = rc_map->alloc / sizeof(struct rc_map_table);
> -	kfree(oldscan);
> +	rc_map->size = newsize;
> +
>  	return 0;
>  }
>  
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index d95ed3e96de2..f167c37179c8 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -148,7 +148,6 @@ struct rc_map_table {
>   * @scan: pointer to struct &rc_map_table
>   * @size: Max number of entries
>   * @len: Number of entries that are in use
> - * @alloc: size of \*scan, in bytes
>   * @rc_proto: type of the remote controller protocol, as defined at
>   *	     enum &rc_proto
>   * @name: name of the key map table
> @@ -158,7 +157,6 @@ struct rc_map {
>  	struct rc_map_table	*scan;
>  	unsigned int		size;
>  	unsigned int		len;
> -	unsigned int		alloc;
>  	enum rc_proto		rc_proto;
>  	const char		*name;
>  	spinlock_t		lock;

