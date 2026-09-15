Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C468E416865
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447106; cv=none; b=uMjWyrnGAiQCpaholby/SFpxp08xaWt/vE9sqDgdb4Fqg0+dDs7VQwUk6s17CoAZDTbBWUxx5gNiPjrH2e1L9mKf8qFeyUh/Jvp8FyO0FynCV8Hz5tncIcMSmkZCrQi2oMctREq/uOS+uOaTLzzRYc/bgVCK8X/nL61Tudr1xAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447106; c=relaxed/simple;
	bh=dFJb2ijcBPJYl4cdorewS9KTs3c7Q6nRF/uzlvcZh+Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FfCfArbbqNJVRVNFXaa+59Lr86ncZrnDYLbCZz5DG9woAI23ykK3dEtLgxt1gU6bD3LK1fF0wYSBe5mKg3NbTKbutbYEAohc4pCA2IKT2+zJ8shnfbFcG28GKpr2c3ZPv4dg/c8wUaNy4MN4dXwouGjma74XtVAgGuDpjbIjvIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rJvSqFS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rJvSqFS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5C31F000FF;
	Tue, 15 Sep 2026 04:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789447104;
	bh=SdgefM+gLOSrfxKV2nJVI9LHcUcy+EC4TLzdGDZ6DdE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=rJvSqFS1NGmQwvpKLCulwQuz9qgUAy4uWK0qXrftCjhnXLS1y4TKyDpXD7yS4D0aV
	 yB3fhhNeh3V3s8ycHrJPcAmCGoUDfel90Fb1+LWKleZpP2Lmme4Cv8iKuN3lKzSTlM
	 f2YVE+xIws/3Y+zTqLRvJTi+5b+mefJfqGVwWaN0=
Date: Mon, 14 Sep 2026 21:38:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Ye Liu <ye.liu@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH 3/3] mm/vmalloc: extract show_busy_info from
 vmalloc_info_show
Message-Id: <20260914213824.2b5d9af8a5be89fe09e1629b@linux-foundation.org>
In-Reply-To: <aqgqjRJ8qpYmx04v@milan>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
	<20260914-vmalloc_study-v1-3-526f68559706@linux.dev>
	<aqgqjRJ8qpYmx04v@milan>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 19:10:37 +0200 Uladzislau Rezki <urezki@gmail.com> wrote:

> On Mon, Sep 14, 2026 at 11:34:02AM +0800, Ye Liu wrote:
> > From: Ye Liu <liuye@kylinos.cn>
> > 
> > Extract the busy vmap area iteration into show_busy_info, mirroring
> > the existing show_purge_info pattern.
> > 
> > Signed-off-by: Ye Liu <liuye@kylinos.cn>
> > ---
> >  mm/vmalloc.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 797933ba9451..7638845377f5 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -5345,12 +5345,12 @@ static void show_purge_info(struct seq_file *m)
> >  	}
> >  }
> >  
> > -static int vmalloc_info_show(struct seq_file *m, void *p)
> > +static void show_busy_info(struct seq_file *m)
> >  {
> >  	struct vmap_node *vn;
> >  	struct vmap_area *va;
> >  	struct vm_struct *v;
> > -	unsigned int *counters;
> > +	unsigned int *counters = NULL;
> >
> Is setting counters setting to NULL odd here?

static void show_busy_info(struct seq_file *m)
{
	...
	unsigned int *counters = NULL;

	if (IS_ENABLED(CONFIG_NUMA))
		counters = ...

	...

	if (IS_ENABLED(CONFIG_NUMA))
		kfree(counters);
	...
}

Presumably some dumb compiler or checker warned about
kfree(uninitialized-val).
