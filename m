Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B42594BD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396769; cv=none; b=rkleGVJLO3vQoUCOPuPfFOKQd5Uzn6fEpNiGs6ELZnh+FUtFKWA2tu2RfqExPop1r20VH3Hoka7xL29kppiT/P7Kl9FpNn9dzMtFC8CqPjMqZQn3E8JIkIJ/sMz8B5VPXUn76odez9EFtJ/ac/ZHbx6dqdKVdgEYxxm/uUUhv/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396769; c=relaxed/simple;
	bh=E1KnhYl1vseAGA2a1YjLHXlwpoHA5xlkvU5SzwMaMvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btkROILA4EZlGBJhgc/OmXI8KY1OE/QlKBmVSWNymNMQyTCXcE8BLYFEuRJrHrwkUgMORHivuwLaxfq3f5//TWgj+xhl+erWLtX4AJCkSR0fwb8YtANnWDg+kUb33OkudLvSqIUHx8KidXFrTAWxJfM3agKp5bJEVqv4UhDGRbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=vTDEgKQU; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="vTDEgKQU"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5218927884fso26884161cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 17:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788396767; x=1789001567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PJgfeG9OkO77dXNQBRcYGcD7KsQqp8aI0V+XoArsabk=;
        b=vTDEgKQUkWW/MIp57nZKg0tuHgB/f5KizttIMvgJ2/wpjueRKdGLxqaefOafkMEi9m
         y1sXxTH/V0GRguo6pWn23p2ihhmApFGzMsFmd7panq2l724unbGPjY/ylubgXZzijsbu
         rHRxgX7erlQ1cWdtc2OH1GnNpN3HgK3nZG4ozjcLM5FwIK/srwpafXyCA19Ezni24e64
         hqOZ01DWI/e5PdlXCzpyR6TRyMAXVD6XyXg3g88N0ZwY3JdrZZYlpkLPgP5IAsRa3Q8H
         N22EqxYbphV6Hp8pHJBWPZfb1PYOuTcL+GrKFKj6ywO3bmK89pZmOywtJT4SkkVnAHaA
         eU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788396767; x=1789001567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJgfeG9OkO77dXNQBRcYGcD7KsQqp8aI0V+XoArsabk=;
        b=IQBi0kJlmz+DlfMYRVV3lsQrv80w8CBdgVVqlag+1KzT1Er2HWZY0BR2no73euIhM3
         l6cSW77sOy6BuzLe72RV1Apx0KPNk5Rw4tK0yQamft5vlLY9n0b9jwlZsC9Gd62uwDe9
         Ml5v3bmThM6JQVm2YiQVcufp16nARLvAupmQcHdDj7o4nxMEgkE+M/zF3lZauwPJR3aw
         vNjsg4jz8kdS86Op8DocnhR8ZKqKfsxaFE4pNNv6pzK7YmMtdeTPV6Xr0wSlSkGn62vN
         d6vZllJZJ4DaJeUoTA6MODD2djXRkFH1FZ1xBqn5POI1izRqE5ybuorq6Qh0qW3iMtKt
         Tg0w==
X-Forwarded-Encrypted: i=1; AKwUvBzs1C4jc5QkE44ufkLBTa/M+WHZz6bsUOmDIS415k5ZcyVrt5krW2dU89THfs0+bZbgeArQ7hu/fAt+Vqk=@vger.kernel.org
X-Gm-Message-State: AFuF++nld78YwaotgKf+H1wxKk5pyV3QHi4sUNZoEDKY75aJjRGfKE+n
	vB3FcSBRlij2AtlOcU6IHb+Suwn6jjjMs2GOKWA+3lk2dSGKiS+AxNhNENrLJCWBC8I=
X-Gm-Gg: AYBFou3nP9LJDymhFRCDaMxZgWSDZ9oCGb3eC1oBmaFibp9sJdk2o+CvqaKPsaA8tPb
	+mCoBc6Ks6uCkXqvnVMf/VuBKsZ9YADLnrHYDzMpN7C9Yv2g8O8lzsCweUpjJWqez3GMiU8m3Mg
	Y6AXZgVsRURZAZcTYhuHYtq0kPVYPMh4siGJ59CNEy2EUDmmOb26EYgd88V7lIp5CK06IAxKQFV
	6az0kD97PppkWl5yZCy/hCxwVjJ7naJJGIUMSSiAZwegGguPWg8wBz4cKUf7RCiR8L8KZLqnTiE
	zI6JNj5bu9g7mwwSXBXGFFPa2ZijwQJJpJBxm4A3UVnIdcGgv2L8q6U6MqkFuSB809ocnvMyWTu
	rkAtuLEpIKF+WGD3sWqtliBkknIeOClm/89KqGrAuMbZRw4/TmipTcoal5febHNAPdIkmB7SMUL
	1uriMjNeXsmvk65ykD0ZvHLXqGifzGPWOTHeitQsh9dMvfPOWLM8xDFBO+UyFYJ4RTJuj2QU1nJ
	OX+z/0AF176pgBiti7Jc+XNmTOb/Iy513YsOUiUPsHfD/60M1BFdH4=
X-Received: by 2002:a05:622a:1906:b0:52d:918b:92e1 with SMTP id d75a77b69052e-53036b93351mr100930171cf.5.1788396761900;
        Wed, 02 Sep 2026 17:52:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331dc460sm31323441cf.18.2026.09.02.17.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 17:52:41 -0700 (PDT)
Date: Wed, 2 Sep 2026 20:52:39 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de, akpm@linux-foundation.org
Subject: Re: [PATCH] mm/memory_hotplug: factor out node_is_memoryless()
Message-ID: <apjESMmhP61ovLuu@gourry-fedora-PF4VCD3F>
References: <20260902195507.88655-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902195507.88655-1-gourry@gourry.net>

On Wed, Sep 02, 2026 at 03:55:07PM -0400, Gregory Price wrote:
> A memoryless node neither spans present pages (populated or ZONE_DEVICE)
> nor has an offline-but-added memory block still linked to it in sysfs.
> 
> try_offline_node() presently open-codes this memoryless check.
> 
> Pull that into a node_is_memoryless() helper and pull the existing
> check_no_memblock_for_node_cb() helper ahead of the add/online path
> so it's clearer what is happening here.
> 
> No functional change.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>
> ---
>  mm/memory_hotplug.c | 60 +++++++++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 226ab9cb078ad..d0e94057682af 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1491,6 +1491,36 @@ static int create_altmaps_and_memory_blocks(int nid, struct memory_group *group,
>  	return ret;
>  }
>  
> +static int check_no_memblock_for_node_cb(struct memory_block *mem, void *arg)
> +{
> +	int nid = *(int *)arg;
> +
> +	/*
> +	 * If a memory block belongs to multiple nodes, the stored nid is not
> +	 * reliable. However, such blocks are always online (e.g., cannot get
> +	 * offlined) and, therefore, are still spanned by the node.
> +	 */
> +	return mem->nid == nid ? -EEXIST : 0;
> +}
> +
> +/* Caller must hold the memory hotplug lock for this check. */
> +static bool node_is_memoryless(int nid)
> +{
> +	/*
> +	 * A node still spanning pages (especially ZONE_DEVICE) is not
> +	 * memoryless.  A node spans memory after move_pfn_range_to_zone(),
> +	 * e.g. once a memory block has been onlined.
> +	 */
> +	if (node_spanned_pages(nid))
> +		return false;

browsing sashiko feedback:

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but can
this lockless read of node_spanned_pages() race with ZONE_DEVICE memory
hotplug?

---

This seems legit and worth addressing (other notes are addressible as
well, but this is maybe noteworthy).

I actually have some old patches sandbagged that tried to marry the
ZONE_DEVICE hotplug pattern through mm/memory_hotplug.c rather than its
separare entry-point.  Might be worth a revisit.

I don't know that I want to predicate this particular fix on this patch
but it's worth a think.

~Gregory
