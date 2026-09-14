Received: from mta0.migadu.com (out-211.mta0.migadu.com [91.218.175.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A938D412
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410563; cv=none; b=itESpG6UwSlGlVkUAE50f9filqmEDV/e9SYvRVBJ+7TvSnwvCM5F0KIvTlC9xCK5x/SuxPpVf9sPwNskIu+53WO61Pw8/z/mPfUr0KZJOjhKxx4R83/izpEIxkMPW/6Snx6rpwXVaJCRgbCBNGUShxUUN8rUWJgA5XS8jB4UEaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410563; c=relaxed/simple;
	bh=I+Y/gZ6OMLL7/7j6LLXM9pgtNM+bYqgJ6extv6Qfp0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ewxpu7L0PjE8vg4edqOZIUO+9StjOEQvHH7RX3e5B/01UmK2oVbf2nL93qpur32HBk4/10CRKp03YJvjRg3e27VPuPe0yIxlzTG1M6lpTAvLHbOMnvM+M/fuS2RG9ddVjQmlH77MxQ4O6kwK1vr2BiHa9U42EbBclOTXlboMUQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BHIx/ifv; arc=none smtp.client-ip=91.218.175.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BHIx/ifv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=I+Y/gZ6OMLL7/7j6LLXM9pgtNM+bYqgJ6extv6Qfp0s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789410556; v=1; x=1790015356;
 b=BHIx/ifvpj5BJbx5yt4i/KRUw9WJ9QPIYpizYl9wYaxLAHyJsBYxkyUn6Vo35sTA5KA/5IqZ
 lL+HKr3Kxaaq9KLU9EmEEqEokwKz7sRFDZo9L5khjibHvZR+ETmAm38bvqsvv/A19RODvel4dv3
 6P77jbeDooGpAyIh4Uz42+Lg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fed64e0855cfc95c;
	Mon, 14 Sep 2026 18:29:16 +0000
X-Mizu-Trace-ID: fed64e0855cfc95c
X-Migadu-Flow: FLOW_OUT
Message-ID: <8b54604a-ec75-4c84-9909-358510f6f3ba@linux.dev>
Date: Mon, 14 Sep 2026 20:27:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: intel_auxdevice: Don't disable IRQs before
 removing children
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
 <20260911161903.419814-3-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260911161903.419814-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 18:19, Charles Keepax wrote:
> Currently the auxiliary device for the link disables IRQs before
> it calls sdw_bus_master_delete(). This has the side effect that
> none of the devices on the link can access their own registers
> whilst their remove functions run, because the IRQs are required
> for bus transactions to function.
> 
> It would appear the reason for the disabling of the IRQs is that
> the IRQ handler iterates through a linked list of all the links,
> once a link is removed the memory pointed at by this linked list
> is freed, but not removed from the linked_list. 

That wasn't the reason, even if you have a single link we all thought it
made more sense to disable peripheral interrupts on the host before
calling sdw_bus_master_delete()

> Add a list_del()> for the linked list item, note whilst the list
itself is contained
> in the intel_init portion of the code, the list remove needs
> to be attached to the auxiliary device for the link, since
> that owns the memory that the list points at. Locking is also
> required to ensure the IRQ handler runs either before or after
> any additions/removals from the list.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/soundwire/intel.h           |  1 +
>  drivers/soundwire/intel_auxdevice.c |  5 ++++-
>  drivers/soundwire/intel_init.c      | 16 ++++++++++++++++
>  include/linux/soundwire/sdw_intel.h |  1 +
>  4 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> index 7a2e7e73ad632..ec82ac8d54adb 100644
> --- a/drivers/soundwire/intel.h
> +++ b/drivers/soundwire/intel.h
> @@ -47,6 +47,7 @@ struct sdw_intel_link_res {
>  	u32 link_mask;
>  	struct sdw_cdns *cdns;
>  	struct list_head list;
> +	struct mutex *link_lock; /* lock protecting list */
>  	struct hdac_bus *hbus;
>  };
>  
> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> index 901a71262094f..1743793de2bd0 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -508,9 +508,12 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
>  	if (!bus->prop.hw_disabled) {
>  		sdw_intel_debugfs_exit(sdw);
>  		cancel_delayed_work_sync(&cdns->attach_dwork);
> -		sdw_cdns_enable_interrupt(cdns, false);
>  	}
> +
>  	sdw_bus_master_delete(bus);
> +
> +	if (!bus->prop.hw_disabled)
> +		sdw_cdns_enable_interrupt(cdns, false);
>  }

Sorry, that sequence looks really weird to me.

See the code in

void sdw_bus_master_delete(struct sdw_bus *bus)
{
	device_for_each_child(bus->dev, NULL, sdw_delete_slave);

	sdw_irq_delete(bus);

	sdw_master_device_del(bus);

After doing all this, one would mask the interrupts on the host side with


	if (!bus->prop.hw_disabled)
		sdw_cdns_enable_interrupt(cdns, false);

but that host is long gone.

Does this even work?

The last sdw_cdns_enable_interrupt(cdns, false) looks either very racy
or useless, no?
>  
>  int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
> index ad48d67fa9358..117c2e42b9bac 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -28,6 +28,15 @@ static void intel_link_dev_release(struct device *dev)
>  	kfree(ldev);
>  }
>  
> +static void intel_link_list_del(void *data)
> +{
> +	struct sdw_intel_link_res *link = data;
> +
> +	mutex_lock(link->link_lock);
> +	list_del(&link->list);
> +	mutex_unlock(link->link_lock);
> +}
> +
>  /* alloc, init and add link devices */
>  static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *res,
>  							  struct sdw_intel_ctx *ctx,
> @@ -79,6 +88,7 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
>  		link->shim_lock = res->eml_lock;
>  		link->mic_privacy = res->mic_privacy;
>  	}
> +	link->link_lock = &ctx->link_lock;
>  
>  	link->ops = res->ops;
>  	link->dev = res->dev;
> @@ -145,8 +155,10 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id)
>  	struct sdw_intel_ctx *ctx = dev_id;
>  	struct sdw_intel_link_res *link;
>  
> +	mutex_lock(&ctx->link_lock);
>  	list_for_each_entry(link, &ctx->link_list, list)
>  		sdw_cdns_irq(irq, link->cdns);
> +	mutex_unlock(&ctx->link_lock);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -210,6 +222,7 @@ static struct sdw_intel_ctx
>  	ctx->link_mask = res->link_mask;
>  	ctx->handle = res->handle;
>  	mutex_init(&ctx->shim_lock);
> +	mutex_init(&ctx->link_lock);
>  
>  	link_mask = ctx->link_mask;
>  
> @@ -246,7 +259,10 @@ static struct sdw_intel_ctx
>  			i++;
>  			goto err;
>  		}
> +		mutex_lock(&ctx->link_lock);
>  		list_add_tail(&link->list, &ctx->link_list);
> +		mutex_unlock(&ctx->link_lock);
> +		devm_add_action_or_reset(&ldev->auxdev.dev, intel_link_list_del, link);
>  		bus = &link->cdns->bus;
>  		/* Calculate number of slaves */
>  		list_for_each(node, &bus->slaves)
> diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
> index 9710f2dc04e29..7495d35ed2fc3 100644
> --- a/include/linux/soundwire/sdw_intel.h
> +++ b/include/linux/soundwire/sdw_intel.h
> @@ -307,6 +307,7 @@ struct sdw_intel_ctx {
>  	acpi_handle handle;
>  	struct sdw_intel_link_dev **ldev;
>  	struct list_head link_list;
> +	struct mutex link_lock; /* lock protecting link_list */
>  	struct mutex shim_lock; /* lock for access to shared SHIM registers */

IIRC shim_lock was used to prevent access to common registers shared
between links. How many locks do we need?

>  	u32 shim_mask;
>  	u32 shim_base;

