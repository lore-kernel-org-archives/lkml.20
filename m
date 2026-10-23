Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761294;
	b=jyZrZkxgrvX0H2gGJrhtcJng1eSKlz3XRzhcLxSH1LQGKxk67xYzwn+h9XOkDZF0zS0U
	 o1nsYEGxA37sqm079f4TNAsBP8z1VxZeuP4rmR+5cYbcQ5PIHpHVuqszxnl4SSkS8dRlG
	 go+0ehdM9AoqmBELxuL93tcegwjbMx/OkCsRvHqtEaYMrX8sQF2B0p3m2sAs0hfYzy8YB
	 gKIkM1dfkcfl4IuRitzfs7zihMYqIPdS/YgKw9zSooWIbjkuVrCUe+pk033Ks4O/AwfKY
	 BTwrcJSdWKnbF4QMjGI06xcPpzsX7O2dd9YqK4rQxgolVcOOmMQ2rgG3yk7x1Agw2ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761294;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Is1dHRZckVmNWPbKrC4R2lSg0BxN8FpGmGd8j4z0iwk=;
	b=Tts0yM1AOo099JqxrWDjoE1KSzPbEHmf5Nf3Xq65sOW+6agbecqNNlOKHDiS9lMM/Uqx
	 zFy4eUWzZa8qyU0d4Fl0MCgGFigmQiUiViIO3FjtwDhGNS+pvuRO1x1idTh7N/vj71JM+
	 YP+aAdfCswo0G+5jxARNoUa/TzpD7p3QjEbuC52ZhXh0mEzi4lo+BAtBRZB5hpMg5Ejnq
	 djY5PDIPBaj2eVYofu/XVSpwsA8qem1Yd/HsnW/euR2aEX9GNjKpUQY7BKn2tWcPC+Zm1
	 1Zug6yivsy6jfT1+FWuO/0VFPAXcPPUW2EuEViHeQ4hircI5chQx8oV2F3Izf2/ROhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LWgdxZP4;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8312D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8312D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LWgdxZP4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67188315D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:14:49 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 65E993F673
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792761292; bh=UQ5/3tBMTbpg8C8cu7Y5xDvLCqAOImajR7a717b4m94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWgdxZP4T2QpPBm/B88bGTEFpad3u9RiZfcJDZb7yA/emgtFxKHrx/kty+m0Y5kHb
	 OrP96iKgCIQB2X/UtmHODUTCJTSt0WTJ3k/s5HFFIiTcP7m88pggvl9dT5sdQGaI+w
	 UjaWmiZjifU6TLOEe6OP1pt72816Gld/7ZghDW9M=
Date: Fri, 23 Oct 2026 14:14:50 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v7 1/4] workqueue: Simplify unbound sysfs attribute
 registration
Message-ID: <attdyi_ghyPWJQJv@e142607>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-2-tvrtko.ursulin@igalia.com>
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
In-Reply-To: <20261022093848.5727-2-tvrtko.ursulin@igalia.com>

On Thu, Oct 22, 2026 at 10:38:45AM +0100, Tvrtko Ursulin wrote:
> Instead of manually registering each attribute we can put them in an
> attribute group with a visibility check and device core will handle the
> rest, which simplifies the registration and error unwind.
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
> v2:
>  * Fix accidental rename of affinity_scope.
> 
> v3:
>  * SYSFS_GROUP_INVISIBLE should not be used for un-named groups.
> ---
>  kernel/workqueue.c | 98 ++++++++++++++++++++++++----------------------
>  1 file changed, 52 insertions(+), 46 deletions(-)
> 
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 41754f4126a6..d8cf546d853f 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -7599,8 +7599,8 @@ static const struct attribute_group wq_sysfs_group = {
>  };
>  __ATTRIBUTE_GROUPS(wq_sysfs);
>  
> -static ssize_t wq_nice_show(struct device *dev, struct device_attribute *attr,
> -			    char *buf)
> +static ssize_t nice_show(struct device *dev, struct device_attribute *attr,
> +			 char *buf)
>  {
>  	struct workqueue_struct *wq = dev_to_wq(dev);
>  	int written;
> @@ -7627,8 +7627,8 @@ static struct workqueue_attrs *wq_sysfs_prep_attrs(struct workqueue_struct *wq)
>  	return attrs;
>  }
>  
> -static ssize_t wq_nice_store(struct device *dev, struct device_attribute *attr,
> -			     const char *buf, size_t count)
> +static ssize_t nice_store(struct device *dev, struct device_attribute *attr,
> +			  const char *buf, size_t count)
>  {
>  	struct workqueue_struct *wq = dev_to_wq(dev);
>  	struct workqueue_attrs *attrs;
> @@ -7652,8 +7652,8 @@ static ssize_t wq_nice_store(struct device *dev, struct device_attribute *attr,
>  	return ret ?: count;
>  }
>  
> -static ssize_t wq_cpumask_show(struct device *dev,
> -			       struct device_attribute *attr, char *buf)
> +static ssize_t unbound_cpumask_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
>  {
>  	struct workqueue_struct *wq = dev_to_wq(dev);
>  	int written;
> @@ -7665,9 +7665,9 @@ static ssize_t wq_cpumask_show(struct device *dev,
>  	return written;
>  }
>  
> -static ssize_t wq_cpumask_store(struct device *dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> +static ssize_t unbound_cpumask_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
>  {
>  	struct workqueue_struct *wq = dev_to_wq(dev);
>  	struct workqueue_attrs *attrs;
> @@ -7689,8 +7689,8 @@ static ssize_t wq_cpumask_store(struct device *dev,
>  	return ret ?: count;
>  }
>  
> -static ssize_t wq_affn_scope_show(struct device *dev,
> -				  struct device_attribute *attr, char *buf)
> +static ssize_t affinity_scope_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
>  {
>  	struct workqueue_struct *wq = dev_to_wq(dev);
>  	int written;
> @@ -7708,9 +7708,9 @@ static ssize_t wq_affn_scope_show(struct device *dev,
>  	return written;
>  }
>  
> -static ssize_t wq_affn_scope_store(struct device *dev,
> -				   struct device_attribute *attr,
> -				   const char *buf, size_t count)
> +static ssize_t affinity_scope_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
>  {
>  	struct workqueue_struct *wq = dev_to_wq(dev);
>  	struct workqueue_attrs *attrs;
> @@ -7731,8 +7731,8 @@ static ssize_t wq_affn_scope_store(struct device *dev,
>  	return ret ?: count;
>  }
>  
> -static ssize_t wq_affinity_strict_show(struct device *dev,
> -				       struct device_attribute *attr, char *buf)
> +static ssize_t affinity_strict_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
>  {
>  	struct workqueue_struct *wq = dev_to_wq(dev);
>  
> @@ -7740,9 +7740,9 @@ static ssize_t wq_affinity_strict_show(struct device *dev,
>  			 wq->attrs->affn_strict);
>  }
>  
> -static ssize_t wq_affinity_strict_store(struct device *dev,
> -					struct device_attribute *attr,
> -					const char *buf, size_t count)
> +static ssize_t affinity_strict_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
>  {
>  	struct workqueue_struct *wq = dev_to_wq(dev);
>  	struct workqueue_attrs *attrs;
> @@ -7762,14 +7762,40 @@ static ssize_t wq_affinity_strict_store(struct device *dev,
>  	return ret ?: count;
>  }
>  
> -static struct device_attribute wq_sysfs_unbound_attrs[] = {
> -	__ATTR(nice, 0644, wq_nice_show, wq_nice_store),
> -	__ATTR(cpumask, 0644, wq_cpumask_show, wq_cpumask_store),
> -	__ATTR(affinity_scope, 0644, wq_affn_scope_show, wq_affn_scope_store),
> -	__ATTR(affinity_strict, 0644, wq_affinity_strict_show, wq_affinity_strict_store),
> -	__ATTR_NULL,
> +static DEVICE_ATTR_RW(nice);
> +static DEVICE_ATTR_RW(affinity_scope);
> +static DEVICE_ATTR_RW(affinity_strict);
> +/* Avoid naming clash with the other cpumask */
> +static struct device_attribute dev_attr_unbound_cpumask =
> +	__ATTR(cpumask, 0644, unbound_cpumask_show, unbound_cpumask_store);
> +
> +static struct attribute *wq_sysfs_unbound_attrs[] = {
> +	&dev_attr_nice.attr,
> +	&dev_attr_unbound_cpumask.attr,
> +	&dev_attr_affinity_scope.attr,
> +	&dev_attr_affinity_strict.attr,
> +	NULL,
>  };
>  
> +static umode_t wq_sysfs_unbound_group_visible(struct kobject *kobj,
> +					      struct attribute *attr, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct workqueue_struct *wq = dev_to_wq(dev);
> +
> +	if (!(wq->flags & WQ_UNBOUND))
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group wq_sysfs_unbound_group = {
> +	.is_visible = wq_sysfs_unbound_group_visible,
> +	.attrs = wq_sysfs_unbound_attrs,
> +};
> +
> +__ATTRIBUTE_GROUPS(wq_sysfs_unbound);
> +
>  static const struct bus_type wq_subsys = {
>  	.name				= "workqueue",
>  	.dev_groups			= wq_sysfs_groups,
> @@ -7907,14 +7933,9 @@ int workqueue_sysfs_register(struct workqueue_struct *wq)
>  	wq_dev->wq = wq;
>  	wq_dev->dev.bus = &wq_subsys;
>  	wq_dev->dev.release = wq_device_release;
> +	wq_dev->dev.groups = wq_sysfs_unbound_groups;
>  	dev_set_name(&wq_dev->dev, "%s", wq->name);
>  
> -	/*
> -	 * attrs are created separately.  Suppress uevent until
> -	 * everything is ready.
> -	 */
> -	dev_set_uevent_suppress(&wq_dev->dev, true);
> -
>  	ret = device_register(&wq_dev->dev);
>  	if (ret) {
>  		put_device(&wq_dev->dev);
> @@ -7922,21 +7943,6 @@ int workqueue_sysfs_register(struct workqueue_struct *wq)
>  		return ret;
>  	}
>  
> -	if (wq->flags & WQ_UNBOUND) {
> -		struct device_attribute *attr;
> -
> -		for (attr = wq_sysfs_unbound_attrs; attr->attr.name; attr++) {
> -			ret = device_create_file(&wq_dev->dev, attr);
> -			if (ret) {
> -				device_unregister(&wq_dev->dev);
> -				wq->wq_dev = NULL;
> -				return ret;
> -			}
> -		}
> -	}
> -
> -	dev_set_uevent_suppress(&wq_dev->dev, false);
> -	kobject_uevent(&wq_dev->dev.kobj, KOBJ_ADD);
>  	return 0;
>  }
>  
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
