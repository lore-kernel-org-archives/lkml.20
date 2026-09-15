Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7924AEBDF;
	Tue, 15 Sep 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487031; cv=none; b=RayBT2R5uM7LcFLOZnxBauj3VN9Yb5+eVwQP6Lxs2/3iHA+6nz90mPw1WPIE+pwD6lo+espIaFLFBD6bXaJtoKsKhA4tvRqm3Pn+T/7xhH5f6FcP3WN7MjSYSby1ulbCyWFM+6pFM42h7uVicjPmsAgaKqXQAiVYU3HKELbZXPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487031; c=relaxed/simple;
	bh=du2XYEijBqSXIMmKSaSxD0l4/kRS+Jv8A+3wvT3Xsxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwIhPJMMICYV/kanc+dIIpARg/BqRqBXKOAEv1AQpVWx6F4VtYBxnTjfdZSQT3h8a7xsXqPdgCOs1KzkF6rqtdyIngyFvDGI3B1cWLc2Bo+tjYfkM6UtEkE0Dfs6r5obFz+Q+fAinH8KdIbgLMpXFb0i0AfqfCwjEks8LyglOLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=tssPH1kX; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="tssPH1kX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789487026; bh=du2XYEijBqSXIMmKSaSxD0l4/kRS+Jv8A+3wvT3Xsxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tssPH1kX18xCIJFOZ6rEuQcjRa8qLd3v9uGM8jZj94gmfGQO2LaxBIhKHjyq0T5Ww
	 iWKJN/bt290+r18cDkmlHKI128KUaOw5d8lidlTKq9w459ZZttWNYO4B3M0guGGM52
	 mHLwzutBF6DgTJ2Gx3bEk/JStQLJZGl1Zgra1GW9X4eWuylF2xnpY3POCJ7VZqAiH7
	 kbyTBVLMIp33qiSd9nLXMUIOW6hECe2WEVhPrh4Z12KIiQxTcU2uotgf/df1ihH6Ot
	 5tmK4zOVblM+lIeSqCZZazxeX8yS5i2ovL4SviptlQ3txEUpLim4tFbOYnoH1EOyQA
	 3/KvFWEALMs9A==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 6950940B71; Tue, 15 Sep 2026 16:43:46 +0100 (BST)
Date: Tue, 15 Sep 2026 16:43:46 +0100
From: Sean Young <sean@mess.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/20] media: rc: Replace open coded krealloc() for
 keymap
Message-ID: <aqlnsiUas27yhKHi@extorris.mess.org>
References: <cover.1789460680.git.sean@mess.org>
 <3b7094b8f0035d970fd61caca05abcdd3374146b.1789460680.git.sean@mess.org>
 <61897bc7-e210-4b81-b2fe-f133c962b152@kernel.org>
 <aqlcj9xXNRURA5iJ@extorris.mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqlcj9xXNRURA5iJ@extorris.mess.org>

On Tue, Sep 15, 2026 at 03:56:15PM +0100, Sean Young wrote:
> On Tue, Sep 15, 2026 at 03:07:32PM +0200, Hans Verkuil wrote:
> > On 9/15/26 10:32, Sean Young wrote:
> > > Replace some ugly code with open coded krealloc() and remove
> > > superfluous member of struct rc_map.
> > > 
> > > Signed-off-by: Sean Young <sean@mess.org>
> > > ---
> > >  drivers/media/rc/rc-main.c | 45 +++++++++++++++++++-------------------
> > >  include/media/rc-map.h     |  2 --
> > >  2 files changed, 22 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> > > index d4baaae3a834..53e39b7a489a 100644
> > > --- a/drivers/media/rc/rc-main.c
> > > +++ b/drivers/media/rc/rc-main.c
> > > @@ -17,9 +17,8 @@
> > >  #include <linux/module.h>
> > >  #include "rc-core-priv.h"
> > >  
> > > -/* Sizes are in bytes, 256 bytes allows for 32 entries on x64 */
> > > -#define IR_TAB_MIN_SIZE	256
> > > -#define IR_TAB_MAX_SIZE	8192
> > > +#define IR_TAB_MIN_ENTRIES	32
> > > +#define IR_TAB_MAX_ENTRIES	1024
> > 
> > This is better...
> > 
> > >  
> > >  static const struct {
> > >  	const char *name;
> > > @@ -214,21 +213,23 @@ static int scancode_to_u64(const struct input_keymap_entry *ke, u64 *scancode)
> > >  static int ir_create_table(struct rc_dev *dev, struct rc_map *rc_map,
> > >  			   const char *name, u64 rc_proto, size_t size)
> > >  {
> > > +	unsigned int alloc;
> > >  	rc_map->name = kstrdup(name, GFP_KERNEL);
> > >  	if (!rc_map->name)
> > >  		return -ENOMEM;
> > > +	alloc = roundup_pow_of_two(size);
> > >  	rc_map->rc_proto = rc_proto;
> > > -	rc_map->alloc = roundup_pow_of_two(size * sizeof(struct rc_map_table));
> > > -	rc_map->size = rc_map->alloc / sizeof(struct rc_map_table);
> > > -	rc_map->scan = kmalloc(rc_map->alloc, GFP_KERNEL);
> > > +	rc_map->len = 0;
> > > +	rc_map->size = alloc;
> > 
> > ...but this still says 'size'...
> 
> struct rc_map_table has a len and size member. I agree that size is not
> a good name. How about capacity or cap]? I am not sure that entries is much
> clearer that entries tbh, because what's the difference between len and
> entries?

Turns out this is a bit of a mess. All the keymaps in
drivers/media/rc/keymaps/ set the size member for the number of entries they
have - which really should be len. So, renaming this member of struct
rc_map_table will mean patching all the keymap entries. Nothing too complex
but maybe this is something for the next patch series.

It would be useful to hear what you think of I'm proposing though:

1. Rename size to cap in struct rc_map_table (so it will have a len and cap)
2. Rename newsize to newcap in ir_resize_table() and related functions
3. In every keymap, replace:
	.size     = ARRAY_SIZE(empty),
   With
	.len      = ARRAY_SIZE(empty),

This will be part of next series for rc-core, probably for the next release
 cycle.


Thanks,
Sean

> 
> > > +	rc_map->scan = kmalloc_objs(struct rc_map_table, alloc, GFP_KERNEL);
> > >  	if (!rc_map->scan) {
> > >  		kfree(rc_map->name);
> > >  		rc_map->name = NULL;
> > >  		return -ENOMEM;
> > >  	}
> > >  
> > > -	dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%u bytes)\n",
> > > -		rc_map->size, rc_map->alloc);
> > > +	dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%zu bytes)\n",
> > > +		alloc, alloc * sizeof(struct rc_map_table));
> > >  	return 0;
> > >  }
> > >  
> > > @@ -262,38 +263,36 @@ static void ir_free_table(struct rc_map *rc_map)
> > >  static int ir_resize_table(struct rc_dev *dev, struct rc_map *rc_map,
> > >  			   gfp_t gfp_flags)
> > >  {
> > > -	unsigned int oldalloc = rc_map->alloc;
> > > -	unsigned int newalloc = oldalloc;
> > > -	struct rc_map_table *oldscan = rc_map->scan;
> > > +	unsigned int newsize = rc_map->size;
> > >  	struct rc_map_table *newscan;
> > >  
> > >  	if (rc_map->size == rc_map->len) {
> > >  		/* All entries in use -> grow keytable */
> > > -		if (rc_map->alloc >= IR_TAB_MAX_SIZE)
> > > +		if (newsize >= IR_TAB_MAX_ENTRIES)
> > >  			return -ENOMEM;
> > >  
> > > -		newalloc *= 2;
> > > -		dev_dbg(&dev->dev, "Growing table to %u bytes\n", newalloc);
> > > +		newsize *= 2;
> > > +
> > > +		dev_dbg(&dev->dev, "Growing table to %u entries\n", newsize);
> > >  	}
> > >  
> > > -	if ((rc_map->len * 3 < rc_map->size) && (oldalloc > IR_TAB_MIN_SIZE)) {
> > > +	if (rc_map->len * 3 < rc_map->size && rc_map->size > IR_TAB_MIN_ENTRIES) {
> > 
> > ...which is especially confusing here where rc_map->size and IR_TAB_MIN_ENTRIES
> > are mixed.
> > 
> > This is not important for this series, so you can go ahead with it.
> > 
> > But personally I would prefer to rename rc_map->size to rc_map->entries and
> > ditto for newsize to newentries. That way it is clear that these variables
> > deal with the number of entries and not the size in bytes.
> 
> How about newcapicity or newcap? 
> 
> > I mention it only because when I reviewed v4 it confused me.
> 
> Thanks,
> 
> Sean
