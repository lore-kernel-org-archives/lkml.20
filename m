Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190383;
	b=ooQHuVgvzoSpuqSVQs303Mc3tTQVnDQBdllbc078MfpyJrUmoRzy8RxTpEV+6LOKq4yj
	 CJV03Rd9HPgjHISX+b8r9wy12jgUyZ/jjoi0NeXLGps7lOQ41BBXsuUnXVHxflhsYz41k
	 ymTNjWbQSFNsyMtKrZ1tJlCAoSV7IfuAZfN+MByp1grEgAOkzE0HKU5rwB2FLBJ42tlJM
	 DKQGQQEH9ioqomMZsx4s12PvWi36NtlZ+o6pecT0mAe0vWo1fTJFGtw50MTdQOna7P0tW
	 o0zbajacLZPvggOTtnGh8AKmeRx5GQhGpS+UZTQfdbfpUUy4oQcX7f6wU4D4/4ocgng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190383;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vvesad1kDFY0By3BmUGJac7+SDjFgTla5wzeO9p8Ivc=;
	b=m9GKFwgtghwkjIwykNS17YQy3VWxHRXmJCvA/1l3Vq4tJxbueMUtZaJLG9sVzruhrTIy
	 spZd51zwZm3EkuV2RJxFq14oJP/CmArsDrEre9IIYgQMvW0E7zbtQAFnAZ/rVs21iy2jo
	 3k2HQeGYU8BWiMxQWRYM3ko60cdmPgINcH+qPmycX2LpqmTYXJOX62X9L2ghF4AhWJ2QA
	 BBbGgHbRp4arvYok6FiraME1HWsHuhWtYRXKP8xVh0IIZAbEhgDUp8dyeY32skTUC1w16
	 OjVXiLRqDvoOupqrfSjdOLCkpr3JVzqJMA0uYGc5AnHO7aakB/eWBlVDNV81XZdMFmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gcsZYOp1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19636606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gcsZYOp1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2661F031E5;
	Wed, 28 Oct 2026 12:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793190382;
	bh=vvesad1kDFY0By3BmUGJac7+SDjFgTla5wzeO9p8Ivc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gcsZYOp10LCHXXNYRWz1HpHifXcklRY34NK2WelG0B2P8ex4VOvQ9D+2amTbCR7gm
	 Cnv8M3ESVGwrtyi9KhmMp7bOPWJ4mwySJS35DAEKlIX03BkGJYVMlH4hLXZ538TOia
	 WIDy1CJmAs524lrEFB7iddG8nLMy1wIQuYlMk0K0=
Date: Wed, 28 Oct 2026 13:26:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Gupta, Akshay" <Akshay.Gupta@amd.com>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de,
	naveenkrishna.chatradhi@amd.com, Anand.Umarji@amd.com,
	Prathima L K <Prathima.Lk@amd.com>
Subject: Re: [PATCH v1] misc: amd-sbi: Fix use-after-free on driver unbind
Message-ID: <2026102842-jam-demanding-7ba3@gregkh>
References: <20261026113910.1003008-1-Akshay.Gupta@amd.com>
 <2026102651-prideful-finance-b60a@gregkh>
 <dae36cea-b00a-4b3c-aa79-d82bfbb67f3e@amd.com>
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
In-Reply-To: <dae36cea-b00a-4b3c-aa79-d82bfbb67f3e@amd.com>

On Wed, Oct 28, 2026 at 05:49:32PM +0530, Gupta, Akshay wrote:
> 
> On 10/26/2026 5:44 PM, Greg KH wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > 
> > 
> > On Mon, Oct 26, 2026 at 05:09:10PM +0530, Akshay Gupta wrote:
> > > From: Prathima L K <Prathima.Lk@amd.com>
> > > 
> > > sbrmi_data was allocated with devm_kzalloc() and freed at unbind while
> > > an open /dev/sbrmi-* fd could still reference it, leading to a
> > > use-after-free on ioctl after removal.
> > > 
> > > Refcount sbrmi_data with a kref: take a reference in open(), drop it in
> > > release(), and free the structure only when the last fd closes. Mark the
> > > device 'detached' under lock when the misc device is deregistered so all
> > > ioctl/xfer paths return -ENODEV. Move misc deregistration to a devm
> > > action and drop the now-unneeded i2c/i3c ".remove" callbacks.
> > > 
> > > Fixes: 35ac2034db72bbbc73609aab5f05ff6e0d38fdd0 ("misc: amd-sbi: Add support for AMD_SBI IOCTL")
> > The documentation shows how to properly format this line, please fix it
> > up, and don't put a blank line between it and these:
> 
> Hi Greg,
> 
> Thank you for the feedback.
> 
> Will update the commit message in proper format.
> 
> > 
> > > Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> > > Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> > signed-off-by implies review.
> > 
> > > Signed-off-by: Prathima L K <Prathima.Lk@amd.com>
> > Wait, this is out of order, yours should be below this, right?
> > 
> I will drop my Reviewed-by, and fix the order
> > 
> > > ---
> > >   drivers/misc/amd-sbi/rmi-core.c | 54 +++++++++++++++++++++++++++++++++
> > >   drivers/misc/amd-sbi/rmi-core.h |  6 ++++
> > >   drivers/misc/amd-sbi/rmi-i2c.c  | 54 +++++++++++++++++++--------------
> > >   3 files changed, 91 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
> > > index 95c9109101b5..e77f114c16c6 100644
> > > --- a/drivers/misc/amd-sbi/rmi-core.c
> > > +++ b/drivers/misc/amd-sbi/rmi-core.c
> > > @@ -13,6 +13,7 @@
> > >   #include <linux/module.h>
> > >   #include <linux/mutex.h>
> > >   #include <linux/regmap.h>
> > > +#include <linux/slab.h>
> > >   #include "rmi-core.h"
> > > 
> > >   /* Mask for Status Register bit[1] */
> > > @@ -193,6 +194,10 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
> > >        u16 thread;
> > > 
> > >        mutex_lock(&data->lock);
> > > +     if (data->detached) {
> > > +             ret = -ENODEV;
> > > +             goto exit_unlock;
> > Why isn't a guard being used here instead?  Then you can do a simple
> > "return -ENODEV", right?
> 
> The existing code in rmi-core.c take data->lock with mutex_lock() and
> release through mutex_unlock()
> The new code added as part of this fix patch, follows this so patch stays a
> lifetime fix.
> I can submit separate patch converting the mutex_lock/mutex_unlock() to
> guard(mutex) after the fix patch is merged.
> Let me know your opinion if you suggest to submit the guard_mutex() patch
> before the fix patch.
> 
> > > +static int sbrmi_open(struct inode *inode, struct file *fp)
> > > +{
> > > +     struct sbrmi_data *data;
> > > +
> > > +     data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
> > > +
> > > +     mutex_lock(&data->lock);
> > Again, please use a guard.
> same as above.
> > > +     if (data->detached) {
> > > +             mutex_unlock(&data->lock);
> > > +             return -ENODEV;
> > > +     }
> > > +     mutex_unlock(&data->lock);
> > > +
> > > +     kref_get(&data->kref);
> > Are you attempting to use a kref without a lock?  That way lies madness
> > and is sure to be wrong.
> > 
> > Are you attempting to keep the data "alive" somehow?  Are you sure this
> > is correct?
> Yes, the kref is there to keep sbrmi_data alive. kref_get() in open() does
> not race with the final put. misc_open() calls ->open() while holding
> misc_mtx, and misc_deregister() takes that same mutex. The probe reference
> is dropped by a devm action that runs only after
> misc_deregister() has returned, so the object cannot reach zero while open()
> runs.
> kref_get() and kref_put() are atomic. I will add a comment at the kref_get()
> saying this.
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int sbrmi_release(struct inode *inode, struct file *fp)
> > > +{
> > > +     struct sbrmi_data *data;
> > > +
> > > +     data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
> > > +     kref_put(&data->kref, sbrmi_data_release);
> > If open is the only thing that can get the reference to the kref, and
> > this is the thing that drops it, why is the kref needed at all?
> open () is not the only holder, kref_init() is the reference owned by the
> driver binding and a devm action drops it on unbind. each open() takes
> another reference and drops it in release().
> sbrmi_data is freed only when both are gone, which is what closes the window
> where devm frees the structure while an ioctl is still using it.

That's not good, this should be attached to the file descriptor.  Don't
go allocating things at bind as you will mess with the lifetime rules
here very quickly, and it gets very messy.  Rely on the rules that the
vfs layer gives us and it will be much much simpler.

> > 
> > 
> > > +     return 0;
> > > +}
> > > +
> > >   static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> > >   {
> > >        void __user *argp = (void __user *)arg;
> > > @@ -570,6 +622,8 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> > > 
> > >   static const struct file_operations sbrmi_fops = {
> > >        .owner          = THIS_MODULE,
> > > +     .open           = sbrmi_open,
> > > +     .release        = sbrmi_release,
> > >        .unlocked_ioctl = sbrmi_ioctl,
> > >        .compat_ioctl   = compat_ptr_ioctl,
> > >   };
> > > diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
> > > index 975ae858e9fd..ae084beb6c03 100644
> > > --- a/drivers/misc/amd-sbi/rmi-core.h
> > > +++ b/drivers/misc/amd-sbi/rmi-core.h
> > > @@ -9,6 +9,7 @@
> > >   #include <linux/miscdevice.h>
> > >   #include <linux/mutex.h>
> > >   #include <linux/i2c.h>
> > > +#include <linux/kref.h>
> > >   #include <linux/platform_device.h>
> > >   #include <linux/regmap.h>
> > >   #include <uapi/misc/amd-apml.h>
> > > @@ -56,9 +57,13 @@ struct sbrmi_data {
> > >        struct regmap *regmap;
> > >        /* Mutex locking */
> > >        struct mutex lock;
> > > +     /* Reference count; keeps @sbrmi_data alive while misc fds are open */
> > > +     struct kref kref;
> > >        u32 pwr_limit_max;
> > >        u8 dev_static_addr;
> > >        u8 rev;
> > > +     /* Set on driver unbind; open/ioctl return -ENODEV afterward */
> > > +     bool detached;
> > How can open/ioctl even run if the driver is unloaded?  You aren't using
> > the cdev api properly I think...
> 
> This fix addresses driver unbind, including unbind through sysfs; it is not
> limited to module unload. misc_deregister() removes the miscdevice from the
> misc-device list and destroys its device node. Although it prevents new
> opens, it does not retain a reference to the driver-private sbrmi_data for
> files that are already open. Such files retain sbrmi_fops and private_data,
> so a later ioctl can still enter the driver.

unbind through sysfs is for developers and if things break, you get to
keep the pieces when it happens (see the discussions on lkml about the
recent taint flag added when this happens.)

So it's rare, but still, let's make this simpler by just moving the
resource management to open/release instead of probe/remove.

thanks,

greg k-h
