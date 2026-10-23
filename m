Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761442;
	b=tIWpQaHdLqzjwQz2gFI92zhyqYg3Ygdby2C35rrc7lGjMgorzu8a+XI+RShfdXeuK4WV
	 YdbYs2RgjXvnz+1xMtP7Copnrr4lPU2IWbyIi6RmR27ZuLjt9LDrJl/2aARV5oGH+PPl1
	 nWHv5S8lHvnDdFC198bdgt5eY+ngJvorGtEHjrTS6dJsW6n/boL8cYMtgvaJ2UiH/oHzz
	 CETAe7FueFkvZ0EEJ7cgGS99Q4NGOG/g5kep4CA61zI6d16fefryZwx4Jm6FQfKO/FahF
	 4uxQqB/vBG2hIMAlvUt0pXECG3qao7gqnEDEM4fwbosD8FdKUoq8wkPrfOw7QKYXSsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761442;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=0S7BJO5Y6P2JevjXrAwLRgy3pn+8oxplRo5cKT+TNu8=;
	b=lgnqBLyqU4FrcW8g4+uNlFD/i3IL0rEMNT8skIosPJzAEeB7j7uyr9C40+RwqxVDnBtN
	 rXy/FBh3qevcKbLjU0SVF1Rl9tScN1hhDHJyQXqxzEd/QdbRJK4Tb19MH49mGklsyWucD
	 NojqzhFvL3g07i+W6oJcWWqKjH1ias5MZGp6veNwCXinoX4BHBlueGOBo/7qYIQfuQFTz
	 k8H48N7mWU9pxNlmPpCTN+Mt1qwg4c2KwnjCDCvhqIqVVdkDzJ8HvjMqV1wXANigV0ISa
	 lKIZA2WW1tKfYl3zAER3ku0YUVVgO+eyf9VXirtA1hBmqZmis/Z2cvvqgWozNwpXY6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hjKHNlkT;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7BE606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C7BE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hjKHNlkT
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E46D2328D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:17:16 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D997A3F673
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792761440; bh=mXG0XX15yKYdw+EhkLniRyMbPXcVVDIBIbKHabfygrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjKHNlkTnxUdD1No2WVEwaDR7Ucv6OXGTKiE8jiCmFGfbVjIVN/7SdmKSwKD46EA1
	 vE+9VtTwKG7UD2coUffHvXu63V6CytydLY9PBO8JD9o60i85vNnYA/2MfH09e4Umlk
	 NiKu+m6Zb0s/2oh1gUdfMXIjEOVLKgnjmQPOi27U=
Date: Fri, 23 Oct 2026 14:17:17 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v7 2/4] workqueue: Separate sysfs mutable vs immutable wq
 attribute sanitizing
Message-ID: <atteXW1M-ZnWt6r3@e142607>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-3-tvrtko.ursulin@igalia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261022093848.5727-3-tvrtko.ursulin@igalia.com>

On Thu, Oct 22, 2026 at 10:38:46AM +0100, Tvrtko Ursulin wrote:
> In preparation for adding more sanitization steps split the current ones
> into ones which are immutable and the ones which can be modified from
> sysfs.
> 
> Point being that the mutable steps must only run on the initial workqueue
> creation, while the immutable properties need to be sanitized every time
> attributes are applied.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Bradley Morgan <include@grrlz.net>
> Cc: Chia-I Wu <olv@google.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Tejun Heo <tj@kernel.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  kernel/workqueue.c | 49 ++++++++++++++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index d8cf546d853f..c634b20f1874 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -5706,6 +5706,32 @@ static void apply_wqattrs_cleanup(struct apply_wqattrs_ctx *ctx)
>  	}
>  }
>  
> +/* Sanitize attributes not modifiable via sysfs. */
> +static void
> +sanitize_immutable_workqueue_attrs(struct workqueue_struct *wq,
> +				   struct workqueue_attrs *attrs)
> +{
> +	if (wq->flags & __WQ_ORDERED)
> +		attrs->ordered = true;
> +}
> +
> +/* Sanitize attributes modifiable via sysfs. */
> +static void
> +sanitize_mutable_workqueue_attrs(struct workqueue_struct *wq,
> +				 struct workqueue_attrs *attrs)
> +{
> +	if (wq->flags & WQ_HIGHPRI)
> +		attrs->nice = HIGHPRI_NICE_LEVEL;
> +}
> +
> +static void
> +sanitize_workqueue_attrs(struct workqueue_struct *wq,
> +				 struct workqueue_attrs *attrs)
> +{
> +	sanitize_immutable_workqueue_attrs(wq, attrs);
> +	sanitize_mutable_workqueue_attrs(wq, attrs);
> +}
> +
>  /* allocate the attrs and pwqs for later installation */
>  static struct apply_wqattrs_ctx *
>  apply_wqattrs_prepare(struct workqueue_struct *wq,
> @@ -5735,6 +5761,7 @@ apply_wqattrs_prepare(struct workqueue_struct *wq,
>  	 * every possible CPU and never falls back, so it has no default.
>  	 */
>  	copy_workqueue_attrs(new_attrs, attrs);
> +	sanitize_immutable_workqueue_attrs(wq, new_attrs);
>  	wqattrs_actualize_cpumask(new_attrs, unbound_cpumask);
>  	cpumask_copy(new_attrs->__pod_cpumask, new_attrs->cpumask);
>  	if (!(wq->flags & WQ_PERCPU)) {
> @@ -5757,6 +5784,7 @@ apply_wqattrs_prepare(struct workqueue_struct *wq,
>  
>  	/* save the user configured attrs and sanitize it. */
>  	copy_workqueue_attrs(new_attrs, attrs);
> +	sanitize_immutable_workqueue_attrs(wq, new_attrs);
>  	cpumask_and(new_attrs->cpumask, new_attrs->cpumask, cpu_possible_mask);
>  	cpumask_copy(new_attrs->__pod_cpumask, new_attrs->cpumask);
>  	ctx->attrs = new_attrs;
> @@ -5919,24 +5947,6 @@ static void unbound_wq_update_pwq(struct workqueue_struct *wq, int cpu)
>  	put_pwq_unlocked(old_pwq);
>  }
>  
> -/* the attrs @wq asked for, as spelled by its flags */
> -static struct workqueue_attrs *alloc_wq_std_attrs(struct workqueue_struct *wq)
> -{
> -	struct workqueue_attrs *attrs;
> -
> -	attrs = alloc_workqueue_attrs();
> -	if (!attrs)
> -		return NULL;
> -
> -	if (wq->flags & WQ_HIGHPRI)
> -		attrs->nice = HIGHPRI_NICE_LEVEL;
> -
> -	if (wq->flags & __WQ_ORDERED)
> -		attrs->ordered = true;
> -
> -	return attrs;
> -}
> -
>  static int alloc_and_link_pwqs(struct workqueue_struct *wq)
>  {
>  	struct workqueue_attrs *attrs;
> @@ -5948,10 +5958,11 @@ static int alloc_and_link_pwqs(struct workqueue_struct *wq)
>  	if (!wq->cpu_pwq)
>  		goto enomem;
>  
> -	attrs = alloc_wq_std_attrs(wq);
> +	attrs = alloc_workqueue_attrs();
>  	if (!attrs)
>  		goto enomem;
>  
> +	sanitize_workqueue_attrs(wq, attrs);
>  	ret = apply_workqueue_attrs_locked(wq, attrs);
>  	free_workqueue_attrs(attrs);
>  	if (ret)
> -- 
> 2.56.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
