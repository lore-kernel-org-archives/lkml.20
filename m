Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB58549E15A;
	Tue, 15 Sep 2026 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484184; cv=none; b=Dne19lc7jAaE+BwR8IJdecB9POLYxmV6mbepmv7tUWmaNl1+M7UA93BaCpfRqRjmjGbimT7OhFWFJh/Th+tIsHjXVvv3xWxowh7oLqBr1P1CZmIHQqd/om8C6B8Bt65FJbp0hoTGaBFew2YZ6Bl6VCULh+Mt+GH7DFZm24Il48w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484184; c=relaxed/simple;
	bh=kg9GekJuBJ8SYQL6TTBh61wvP3AifQMScyKfkRmP62A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmvkRTqRC710Imw6xvrC5H3QQmGVJjrbqXMBTHJ6ih/sOBcn1OdxyvTDodeFgfiqrZw6lWetDpXO2+IsueH2iGGQ9cGNXVWJrecOnofTMbU2Pt7TBDgslaCB5hn2iy3RQX1v4m7oPi9A5NSz6BDa/oEDB1x2DSQ7TisCf8/QXT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=grG5Mx/o; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="grG5Mx/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789484175; bh=kg9GekJuBJ8SYQL6TTBh61wvP3AifQMScyKfkRmP62A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grG5Mx/oU7ozBT1BnMN1wIeFxU6HPj2uLSo/wrh3X0u6j6gNtYcUQpsfcFz+s1TXX
	 LRoy9hiI0SdavFB7kxOypX/uaRoXONyqV9vFPm8NY5VodJDaJDy2QFYcyZJ9gySvUm
	 a1wisXtLn6uPoqDML2wmBFEjYETk/oGzfSzR/vU5j+1eCtfMgEItU7bmUlxLixgHrF
	 6jRUYn20dE52Esaw+MgCgIzpq8u2duH9kBkfuCJQ1aAOog1ET3+Tim50r3J0a1Hdja
	 1GgzO/JnI0BP6DExYFlVqBuQYgrO1USPD3z0Qt8LgylUgi9WzhCxlM8uEvKagDKay0
	 Rm2eph1MLDo0A==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 14E0C40B71; Tue, 15 Sep 2026 15:56:15 +0100 (BST)
Date: Tue, 15 Sep 2026 15:56:15 +0100
From: Sean Young <sean@mess.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/20] media: rc: Replace open coded krealloc() for
 keymap
Message-ID: <aqlcj9xXNRURA5iJ@extorris.mess.org>
References: <cover.1789460680.git.sean@mess.org>
 <3b7094b8f0035d970fd61caca05abcdd3374146b.1789460680.git.sean@mess.org>
 <61897bc7-e210-4b81-b2fe-f133c962b152@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61897bc7-e210-4b81-b2fe-f133c962b152@kernel.org>

On Tue, Sep 15, 2026 at 03:07:32PM +0200, Hans Verkuil wrote:
> On 9/15/26 10:32, Sean Young wrote:
> > Replace some ugly code with open coded krealloc() and remove
> > superfluous member of struct rc_map.
> > 
> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> >  drivers/media/rc/rc-main.c | 45 +++++++++++++++++++-------------------
> >  include/media/rc-map.h     |  2 --
> >  2 files changed, 22 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> > index d4baaae3a834..53e39b7a489a 100644
> > --- a/drivers/media/rc/rc-main.c
> > +++ b/drivers/media/rc/rc-main.c
> > @@ -17,9 +17,8 @@
> >  #include <linux/module.h>
> >  #include "rc-core-priv.h"
> >  
> > -/* Sizes are in bytes, 256 bytes allows for 32 entries on x64 */
> > -#define IR_TAB_MIN_SIZE	256
> > -#define IR_TAB_MAX_SIZE	8192
> > +#define IR_TAB_MIN_ENTRIES	32
> > +#define IR_TAB_MAX_ENTRIES	1024
> 
> This is better...
> 
> >  
> >  static const struct {
> >  	const char *name;
> > @@ -214,21 +213,23 @@ static int scancode_to_u64(const struct input_keymap_entry *ke, u64 *scancode)
> >  static int ir_create_table(struct rc_dev *dev, struct rc_map *rc_map,
> >  			   const char *name, u64 rc_proto, size_t size)
> >  {
> > +	unsigned int alloc;
> >  	rc_map->name = kstrdup(name, GFP_KERNEL);
> >  	if (!rc_map->name)
> >  		return -ENOMEM;
> > +	alloc = roundup_pow_of_two(size);
> >  	rc_map->rc_proto = rc_proto;
> > -	rc_map->alloc = roundup_pow_of_two(size * sizeof(struct rc_map_table));
> > -	rc_map->size = rc_map->alloc / sizeof(struct rc_map_table);
> > -	rc_map->scan = kmalloc(rc_map->alloc, GFP_KERNEL);
> > +	rc_map->len = 0;
> > +	rc_map->size = alloc;
> 
> ...but this still says 'size'...

struct rc_map_table has a len and size member. I agree that size is not
a good name. How about capacity or cap]? I am not sure that entries is much
clearer that entries tbh, because what's the difference between len and
entries?

> > +	rc_map->scan = kmalloc_objs(struct rc_map_table, alloc, GFP_KERNEL);
> >  	if (!rc_map->scan) {
> >  		kfree(rc_map->name);
> >  		rc_map->name = NULL;
> >  		return -ENOMEM;
> >  	}
> >  
> > -	dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%u bytes)\n",
> > -		rc_map->size, rc_map->alloc);
> > +	dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%zu bytes)\n",
> > +		alloc, alloc * sizeof(struct rc_map_table));
> >  	return 0;
> >  }
> >  
> > @@ -262,38 +263,36 @@ static void ir_free_table(struct rc_map *rc_map)
> >  static int ir_resize_table(struct rc_dev *dev, struct rc_map *rc_map,
> >  			   gfp_t gfp_flags)
> >  {
> > -	unsigned int oldalloc = rc_map->alloc;
> > -	unsigned int newalloc = oldalloc;
> > -	struct rc_map_table *oldscan = rc_map->scan;
> > +	unsigned int newsize = rc_map->size;
> >  	struct rc_map_table *newscan;
> >  
> >  	if (rc_map->size == rc_map->len) {
> >  		/* All entries in use -> grow keytable */
> > -		if (rc_map->alloc >= IR_TAB_MAX_SIZE)
> > +		if (newsize >= IR_TAB_MAX_ENTRIES)
> >  			return -ENOMEM;
> >  
> > -		newalloc *= 2;
> > -		dev_dbg(&dev->dev, "Growing table to %u bytes\n", newalloc);
> > +		newsize *= 2;
> > +
> > +		dev_dbg(&dev->dev, "Growing table to %u entries\n", newsize);
> >  	}
> >  
> > -	if ((rc_map->len * 3 < rc_map->size) && (oldalloc > IR_TAB_MIN_SIZE)) {
> > +	if (rc_map->len * 3 < rc_map->size && rc_map->size > IR_TAB_MIN_ENTRIES) {
> 
> ...which is especially confusing here where rc_map->size and IR_TAB_MIN_ENTRIES
> are mixed.
> 
> This is not important for this series, so you can go ahead with it.
> 
> But personally I would prefer to rename rc_map->size to rc_map->entries and
> ditto for newsize to newentries. That way it is clear that these variables
> deal with the number of entries and not the size in bytes.

How about newcapicity or newcap? 

> I mention it only because when I reviewed v4 it confused me.

Thanks,

Sean
