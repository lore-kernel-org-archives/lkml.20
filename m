Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46214E3220
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409688; cv=none; b=dYktcSzkuyXVBROBa1HSuzJNCm7Wao4lVVzMGKCzlUq9OQx7x2hbkgLifhF2qU4A6S7Rq2cHc9upWxWpWm71/VRC8825kA8TJfNhse9X6nVPFapyR71+1X+DxcN8HhVoQovrVDOgu6D1f6wLo0zNCWFLCwVLVw1cZOJ+VcZUvp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409688; c=relaxed/simple;
	bh=z4YKQyp0Km3k9/vkv/fi/Sj+c4OnunN2b1cJYfANKys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmlSQ12akxQVFvR+iV730S6Z5qoT7HmJjXREPlczQ7ltDMq2KsE2OK1Bz+XrlTsUUeaRQZg68R6FISqOt+CMbgiHmbh2iPgmVoAHj7YSJJb408dxN7BJkCkuj8BpbkojSmBLyNN6y9KHi+/1xgIW2g9oeINLeGSASFjGw7Jn6P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Btioxvxy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=CSXyFG4N; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Btioxvxy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=CSXyFG4N; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Btioxvxy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="CSXyFG4N";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Btioxvxy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="CSXyFG4N"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B1F521F441;
	Mon, 19 Oct 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1792409683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jD3t1wkN6Rchd26X8X6BEMEdqv5151afoVogq/j3xEE=;
	b=Btioxvxy2o/5nNjvrR/K024Fg9yRxU/DMlJ4FkQmX30tIdzdPtTzjjyLAOgv/bA6lh6nQC
	EhQICIipr8jVetUX/9sbV8pdOzUwXssZDtg7CLe8V89kWRPWE4yApuL1Ko/JGJmD7A41+u
	hipbb7daq4UFDKgMx1HWQds7Am1G+Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1792409683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jD3t1wkN6Rchd26X8X6BEMEdqv5151afoVogq/j3xEE=;
	b=CSXyFG4N0Co80mhRy5z5Z4Tf6vZKCYn4pVt1fSZvcp/kmS1ALupPvQJ8F3fw6DMCtG1808
	ECpplwObsREGaDCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1792409683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jD3t1wkN6Rchd26X8X6BEMEdqv5151afoVogq/j3xEE=;
	b=Btioxvxy2o/5nNjvrR/K024Fg9yRxU/DMlJ4FkQmX30tIdzdPtTzjjyLAOgv/bA6lh6nQC
	EhQICIipr8jVetUX/9sbV8pdOzUwXssZDtg7CLe8V89kWRPWE4yApuL1Ko/JGJmD7A41+u
	hipbb7daq4UFDKgMx1HWQds7Am1G+Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1792409683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jD3t1wkN6Rchd26X8X6BEMEdqv5151afoVogq/j3xEE=;
	b=CSXyFG4N0Co80mhRy5z5Z4Tf6vZKCYn4pVt1fSZvcp/kmS1ALupPvQJ8F3fw6DMCtG1808
	ECpplwObsREGaDCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87164134B3;
	Mon, 19 Oct 2026 11:34:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xFQWGFMA1momMAAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 19 Oct 2026 11:34:43 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 13E2BA1413; Mon, 19 Oct 2026 13:34:39 +0200 (CEST)
Date: Mon, 19 Oct 2026 13:34:39 +0200
From: Jan Kara <jack@suse.cz>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Manjong Lee <mj0123.lee@samsung.com>, Jan Kara <jack@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm: bdi: reset min_ratio after the sysfs attributes
 are gone
Message-ID: <jf527frib32yfvdlgrmjozxav2kujmijsmakmr3a6wlshdzwx5@ju6qpy6pztng>
References: <20261017030620.793108-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017030620.793108-1-nickolai@csail.mit.edu>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spam-Flag: NO

On Fri 16-10-26 23:06:20, Nickolai Zeldovich wrote:
> A write to /sys/class/bdi/<dev>/min_ratio (or min_ratio_fine or
> min_bytes) that races with the removal of the device leaves the global
> sum of minimum dirty shares charged for a bdi that no longer exists.
> Until the next reboot, that share of the dirty threshold is withheld
> from every other bdi (__wb_calc_thresh() scales by 100 % minus the
> sum), and a later min_ratio store on any bdi that would push the sum
> to 100 % fails with EINVAL although every bdi reads 0. Root privilege
> is needed for the store; the removal is any del_gendisk() (a disk or
> loop device going away) or the unmount of a filesystem with its own
> bdi. On an x86_64 defconfig kernel (v7.3-rc7), 2000 rounds of
> LOOP_CTL_ADD/LOOP_CTL_REMOVE on one loop device with a second thread
> writing 50 to its min_ratio leak the share on the first round the
> store lands in the window; afterwards `echo 99 > min_ratio` on another
> loop device fails with EINVAL. With the fix the same run keeps the sum
> at 0 and the store succeeds. Affected since v5.16, when the reset in
> bdi_unregister() was added.
> 
> bdi_unregister() gives the bdi's share back with bdi_set_min_ratio(bdi,
> 0) and only then calls device_unregister(), which removes the sysfs
> attributes. A min_ratio_store() that gets its kernfs active reference
> before the removal runs to completion after the reset:
> __bdi_set_min_ratio() takes bdi_lock, sees bdi->min_ratio == 0, adds
> the new value to bdi_min_ratio and stores it in the bdi, which
> bdi_put() then frees. Nothing gives that share back.
> 
> Move the reset after device_unregister(): once the attributes are gone
> no store can run, and bdi_set_min_ratio() needs nothing from the
> device.
> 
> Found while formally verifying bdi_unregister() against the kernel
> binary.
> 
> Fixes: 3c376dfafbf7 ("mm: bdi: initialize bdi_min_ratio when bdi is unregistered")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
> 
> Notes:
>     The window is between the reset and kernfs draining the attribute's active
>     references in device_del(): bdi_debug_unregister() and the device
>     removal (uevent, bus and class teardown) sit in it, tens of microseconds,
>     so a tight store loop lands in it within a few hundred add/remove rounds
>     under QEMU TCG. A store that lands there also fails every later min_ratio
>     store of 50 with EINVAL, which is why the unpatched run shows few landed
>     stores: the leaked 50 % plus a new 50 % reach the limit. The same window
>     exists for min_ratio_fine and min_bytes (same helper), and for the
>     per-superblock bdis unregistered from generic_shutdown_super().
>     
>     Reproducer (x86_64 defconfig, root, loop devices 20 and 21 free, QEMU
>     -smp 2):
>     
>       gcc -O2 -pthread -static -o bdi_min_ratio_leak_short bdi_min_ratio_leak_short.c
>       ./bdi_min_ratio_leak_short
>       before: min_ratio 99 on loop21: Invalid argument   (exit 1)
>       after:  min_ratio 99 on loop21: ok                 (exit 0)
>     
>       /* loop device add/remove racing a min_ratio store; root, CONFIG_BLK_DEV_LOOP */
>       #include <errno.h>
>       #include <fcntl.h>
>       #include <linux/loop.h>
>       #include <pthread.h>
>       #include <stdio.h>
>       #include <string.h>
>       #include <sys/ioctl.h>
>       #include <unistd.h>
>     
>       static volatile int stop;
>     
>       static int store(const char *path, const char *val)
>       {
>       	int fd = open(path, O_WRONLY), r;
>     
>       	if (fd < 0)
>       		return -1;
>       	r = write(fd, val, strlen(val));
>       	close(fd);
>       	return r < 0 ? -errno : 0;
>       }
>     
>       static void *storer(void *arg)
>       {
>       	while (!stop)
>       		store("/sys/class/bdi/7:20/min_ratio", "50");
>       	return NULL;
>       }
>     
>       int main(void)
>       {
>       	int ctl = open("/dev/loop-control", O_RDWR), i, r;
>       	pthread_t th;
>     
>       	ioctl(ctl, LOOP_CTL_ADD, 21);			/* the control bdi */
>       	pthread_create(&th, NULL, storer, NULL);
>       	for (i = 0; i < 2000; i++) {
>       		if (ioctl(ctl, LOOP_CTL_ADD, 20) < 0)
>       			continue;
>       		while (ioctl(ctl, LOOP_CTL_REMOVE, 20) < 0)
>       			;
>       	}
>       	stop = 1;
>       	pthread_join(th, NULL);
>       	r = store("/sys/class/bdi/7:21/min_ratio", "99");	/* sum must stay < 100 */
>       	printf("min_ratio 99 on loop21: %s\n", r ? strerror(-r) : "ok");
>       	store("/sys/class/bdi/7:21/min_ratio", "0");
>       	return r != 0;
>       }
> 
>  mm/backing-dev.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index 18e999053bae..fad1495d3b20 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -1162,19 +1162,20 @@ void bdi_unregister(struct backing_dev_info *bdi)
>  	wb_shutdown(&bdi->wb);
>  	cgwb_bdi_unregister(bdi);
>  
> -	/*
> -	 * If this BDI's min ratio has been set, use bdi_set_min_ratio() to
> -	 * update the global bdi_min_ratio.
> -	 */
> -	if (bdi->min_ratio)
> -		bdi_set_min_ratio(bdi, 0);
> -
>  	if (bdi->dev) {
>  		bdi_debug_unregister(bdi);
>  		device_unregister(bdi->dev);
>  		bdi->dev = NULL;
>  	}
>  
> +	/*
> +	 * If this BDI's min ratio has been set, use bdi_set_min_ratio() to
> +	 * update the global bdi_min_ratio. After device_unregister(): the
> +	 * sysfs min_ratio stores can no longer run and set it again.
> +	 */
> +	if (bdi->min_ratio)
> +		bdi_set_min_ratio(bdi, 0);
> +
>  	if (bdi->owner) {
>  		put_device(bdi->owner);
>  		bdi->owner = NULL;
> 
> base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
> -- 
> 2.53.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
