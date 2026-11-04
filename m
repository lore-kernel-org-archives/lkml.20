Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809973;
	b=Q2QeGkvQv9VVVikWvz3uVjxVyh7k3sdPz6b9Wo6pbaKSYgHxT9fGKU41ZluiGXn211MJ
	 J1ToNlwauML0SXy+2/c2eK6LuQ07slAXrnDPBCcZVR3hOfnTcyEj1v/7sYX2QBz0uQwzO
	 p7xztkS7p6jU9TZ7VRjBmLPmwN5APIguQBmKLRibcABa4tdKwrwqBF3TtoYUzVlP5r8pV
	 P5PGSG2U6Ko4eDC4P58LQf9OBXy50FHP//TNfZtmGQD44FRNmS54e109QyWwIJujpqFru
	 EPi1yy212dEBw3MhaaQQ6Cd42V71XJyq57rR5t6tKhl/NjxJ5F79PXgogf+Ru8QYNNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809973;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0OxZ/i70KBJXgtO+XrMBZ9hzxbG9NTin7tceTS2YfBw=;
	b=n/xXP0wEHKRhdDYC0pE8xdEg8qVl1+oi0UgL8xLhpyhPA62+O8fB+YE0wnXU8fO8mt7Z
	 gae+aiQZw8TUI3tfgq+PwYtkf6+VSCjRf1UzCXD8m/yfdVMUlfkCV/WkzbOxBQvZxwRWu
	 4dYuVVE210Xr9kTHagcM/2bDJDFRB986O2S/5rzV24KCUfH2W5jlQ94l7101MByXwgczU
	 Ixs0S+5afJia1Ft2b//eQJWsEU8V4mIHxZX4RDgFeZ+q8dGwN+fQmWTUA3w+4I4yZB0kG
	 C7GRkxNAqEfWaQ+CW+m4pk7EeDB8Mtl0t0v698AgoVWIgwoJKh1ranxZM1lSVulql4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuUK5Yub;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01788606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuUK5Yub
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC17D1F000C1;
	Wed,  4 Nov 2026 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809972;
	bh=0OxZ/i70KBJXgtO+XrMBZ9hzxbG9NTin7tceTS2YfBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QuUK5YubYb/EZ9mIvmoTONFpGacljzEc6xIlSQsIBk8ufozpFvs0sTozMrzngumVv
	 5YsIBgGlHvtq7Coidf0GocymtIoq9xYV/pB17wvMPEHoqBIve8Gc6xY7s4on+sYi0b
	 BTKI61G6EdZV8M11UkYLRIDy7JJSm7mwfa0iJFr6cQ9n6DwjZ2priNXthkNzsEk0Ms
	 2Zi4w7ejb+XepdcxTV3lwQu76aRMeZLBow2ZH3pYGragzMdqO4KnldRXWZmjUXUtZl
	 d+RBph/eC4yDJhQanFB1ixIuFneLlUsBUihnjs/x6f80MufpSiaPcvrB7DgmrHK8Oz
	 nkklMMOca8grg==
Date: Thu, 5 Nov 2026 00:32:49 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] reset: Fix circular locking dependency in
 reset_controller_unregister()
Message-ID: <auteMd0xm4zjxbWy@tzungbi-laptop>
References: <20261102155840.20376-1-tzungbi@kernel.org>
 <20261102155840.20376-3-tzungbi@kernel.org>
 <22d1be8d02ead0c4b669f33bb972da9834027baf.camel@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22d1be8d02ead0c4b669f33bb972da9834027baf.camel@pengutronix.de>

On Mon, Nov 02, 2026 at 06:54:04PM +0100, Philipp Zabel wrote:
> On Mo, 2026-11-02 at 23:58 +0800, Tzung-Bi Shih wrote:
> > @@ -179,6 +179,7 @@ static void reset_controller_remove(struct reset_controller_dev *rcdev,
> >  void reset_controller_unregister(struct reset_controller_dev *rcdev)
> >  {
> >  	struct reset_control *rstc, *pos;
> > +	LIST_HEAD(reset_control_head);
> >  
> >  	scoped_guard(mutex, &reset_list_mutex)
> >  		list_del(&rcdev->list);
> > @@ -195,12 +196,22 @@ void reset_controller_unregister(struct reset_controller_dev *rcdev)
> >  		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
> >  			kref_get(&rstc->refcnt);
> >  			rcu_assign_pointer(rstc->rcdev, NULL);
> > -			synchronize_srcu(&rstc->srcu);
> 
> Now reset_controller_remove() can be called while a concurrent reset
> operation that got an rcdev reference just before the
> rcu_assign_pointer() is about to enter a reset_control_ops callback.

Ack, fixed in v2[2].

[2] https://lore.kernel.org/all/20261104162038.48622-3-tzungbi@kernel.org

> 
> >  			reset_controller_remove(rcdev, rstc);
> 
> I think this should only do the list_del(&rstc->list); ...
> 
> > -			reset_control_put_internal(rstc);
> > +			list_add(&rstc->list, &reset_control_head);
> 
> ... which could be combined with this into list_move(). That would also
> make clearer what happens here (move into a temporary list that doesn't
> need to be rcdev->lock'ed).

Ack, fixed in v2.

> 
> The module_put() and put_device() calls should be deferred into the
> loop below, after synchronize_srcu(). We don't make it possible to
> unload the reset controller driver module until then.

Ack, drop the lockdep_assert_held() and simply call
reset_controller_remove() in v2.

> > +	/*
> > +	 * Run synchronize_srcu() outside rcdev->lock to avoid a circular
> > +	 * locking dependency with paths that acquire rcdev->lock inside
> > +	 * the rstc->srcu read-side critical section.
> > +	 */
> > +	list_for_each_entry_safe(rstc, pos, &reset_control_head, list) {
> > +		list_del(&rstc->list);
> > +		synchronize_srcu(&rstc->srcu);
> > +		reset_control_put_internal(rstc);
> 
> This shouldn't call reset_control_put_internal(), which is supposed to
> be the common internal implementation of the consumer
> reset_control_put() API variants.
> 
> Rather, I'd prefer this to call ref = kref_put() directly and then put
> the "if (ret) { ... }" part of reset_control_put_internal() into a
> separate helper function that can be called from here as well.

Ack, the call of reset_control_put_internal() is actually from [PATCH v1],
fixed in [PATCH v2 1/2][3].

[3] https://lore.kernel.org/all/20261104162038.48622-2-tzungbi@kernel.org
