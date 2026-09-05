Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECDB54788
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788625993; cv=none; b=pey5ejcWdVsu77EDi1QSNiq4fWVlYciZsnJZ6difUYloUio31Z6U7+LR9kmTVWI9VVMskWM+TILknKH3Hkxr5gtrNm+ojNepVNQQIEK6EZ+YGnsFCvf/JWToKcTn6tcC1cbjkl6q9fUCP2bdmvSOsiKsJkz9Y27iercphBswDl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788625993; c=relaxed/simple;
	bh=Ai+UNE+EMufdHYqj5Cdp0cgmfaW9xvMYf6GgrJZ2+8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPDq9K0RSTBPdb5g154voQS2ko6e6YGQJZK/JAzXDfPmChHJ0SGKm6oALFO7feF4LasZ/leEWgIUiDVI5VpOcqXi55BsUH3B5xqGzlR4AVzlDMnuGqPVgES02das8rF2bI5iOY2yQFOSe3peJS47uhIilO5YHLjj6bA8c3lL8B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mmOX0tCO; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mmOX0tCO"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90cbff85fa9so26279866d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788625991; x=1789230791; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbgO+8U0KMmcVm1eNMs2hqE1ucet9L5s6YGl2Q7gOP4=;
        b=mmOX0tCOPopigQg++n+ESjtHda06VsGbkkTKlGBzZyfgKcAXDUrFKywACwrNy3jid+
         m2sVa4G6OuUXh4CXvFlgZrGjq7U3Zntxir6R8y4VJydQdbLN04wTvJAHeaVlxSLVH3vb
         JEZtzLQgjZWE1cMfVI2xH1qu8x/q99HCdfrBofw+FZDv3uL38yGZLYXLR+Ak4vQgoOu0
         ftCu9U8z9+vPchW8XcNiis3jAydaDxqeP6yzEIZqkpSpXv2E8nh+iDE35q19qZZhAdYC
         6bEEA+ZGIwwNE176Oc8KAWed3X634HpqcCiUWmaTLXTeFdwt3ogca/+1hmLBay5r2rMK
         QdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788625991; x=1789230791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nbgO+8U0KMmcVm1eNMs2hqE1ucet9L5s6YGl2Q7gOP4=;
        b=qmBmfrMF1XPGf6LfqB3rb3zFEoccYRJUK6F56yx5/S0ehg+VTCICKs/dLi6kWCXroQ
         BXS9hBg1F23xTcbKbvqUDAvCm7APkd0h9g2EGVVXbf0+uNT9jE4byCcq6fXrku3sSNq7
         FxpftkRz0DhWTLqrb3RS4k5b529RlkyaTUPeEbOH+amNdHY75pSB1r98GrMI8YSa5UiJ
         a4R4QGiLnkJMIVOC5gw94MRqg4c73NrL13d2UOmq0kyt3DwmZLHlfTgu50ZXsL8rfiSJ
         +BbvonJTK4kNhFKxfTdmnq2IS5qMCWz7FpEvZVmBTB7nvVGEo3gFdyLgRArh7RLO79hZ
         7Cwg==
X-Forwarded-Encrypted: i=1; AKwUvByiA5pA7ZggKjuIAK1D2tqkMi7Z40pSup4kMl0Y9ka3OGbbcfiUq/5BtA1hu7EtMrZk2ekWNCFyfBtue0w=@vger.kernel.org
X-Gm-Message-State: AFuF++k53QPcleqPqch+GP+VNFw9P+yHLM+iDvkncFGdu9SZEb5GyLFA
	QRoLhO+RBxZ+rzn/QpRleSobXEzR4r5gMZkm34gt8ghV5C3gdn9hHcE48n6IZKfGQg==
X-Gm-Gg: AYBFou3L/PhYuDAbr/6dXi1t1stjPY/5wvd9ZsfJ8mBCgFIyb2AsMUXukaPrGF3ASy5
	4JCAGfOEu9hd1ZiK/MUT8XBMpVTMQbNeXgqwHat/fz6fg/KdCzwX3zovhxXxY41Xv++vIkHJL/w
	x3dSH7XcnVBHAekRwYCOtIvlD+HsELEeb+X4Q+LtAOj/IsbFzvQU3Nd0yBX0E8/V3SpMHY/TWES
	W0Eo/iw6VHkDhR6RyepODs2YHZGlPondmtMYrQto1XyyqjonNk7ksHyQXIuOTPISyTl61c32VSe
	P0avYJMEvkDyIBYJjvn7kweNIz+HEY9G+QigLX/Qxy63GsDAGM4HRyhvAfl5zXR81sfxgfyCbH8
	yDIdmxQnFNxGNaJdmjGHUYdEwwFqtCMRqEBqneeDJEbItyJ7kC1ewNAioLuavkVeQ4jXII5wyGe
	Xrr2mRDp+y7KcmLmzIBJlsh403H+hEkF8a71W9xMvrDxLAKSbbBzjQLQvCUkOhwTc=
X-Received: by 2002:ac8:5e48:0:b0:52f:ae65:8996 with SMTP id d75a77b69052e-53054825cf2mr143762451cf.13.1788625991079;
        Sat, 05 Sep 2026 09:33:11 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91048476220sm20658886d6.31.2026.09.05.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:33:10 -0700 (PDT)
Date: Sat, 5 Sep 2026 12:33:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Oliver Neukum <oneukum@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Petko Manolov <petkan@nucleusys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 net-next 5/6] net: usb: pegasus: Move long delayed
 work on system_dfl_long_wq
Message-ID: <b6e6e8d0-0888-4bbc-85b8-ca3bdac88398@rowland.harvard.edu>
References: <20260720100902.155605-1-marco.crivellari@suse.com>
 <20260720100902.155605-6-marco.crivellari@suse.com>
 <f972b514-87ef-45bc-8258-db199a4cc0b8@suse.com>
 <20260825151812.4aJyFUgE@linutronix.de>
 <31b46916-dd89-4ae9-89b9-9d39e29e8e69@rowland.harvard.edu>
 <20260828094318.bOajNBno@linutronix.de>
 <b6cf44a1-d2b1-443d-8efe-c596ef89cc2a@rowland.harvard.edu>
 <20260905150450.2hrac_GV@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905150450.2hrac_GV@linutronix.de>

On Sat, Sep 05, 2026 at 05:04:50PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-28 10:10:01 [-0400], Alan Stern wrote:
> > > While this does make sense I don't see how this is related to this
> > > patch. The pegasus driver uses `system_long_wq'. This is a system wide
> > > workqueue_struct and is not limited to USB or this driver.
> > > This workqueue is per-CPU meaning if you enqueue the work item on CPU3
> > > it will be executed on CPU3. However pegasus uses a delayed work item
> > > and the timer can fire on any CPU so even if it is enqueued on CPU3 it
> > > could be executed on CPU1.
> > 
> > It doesn't matter what CPU the work item runs on.  Here's the deadlock 
> > sequence, in brief:
> > 
> > 	USB device reset cannot proceed until network interface's
> > 	->pre_reset() method returns.
> > 
> > 	The ->pre_reset() method cannot return until its call to
> > 	flush_workqueue() returns.
> > 
> > 	flush_workqueue() cannot return until the already executing
> > 	work item finishes.
> 
> Not sure where you pointing at but you have an unordered workqueue (such
> as system_long_wq/ system_dfl_long_wq then you can have more than one
> work item executed in parallel. One item does not stall the other so you
> can flush your work item (waiting for it's completion) without having all
> other work item completed.
> There is no need to flush the workqueue, that would force _all_ work
> item to complete. Flushing a workqueue would make sense if you have your
> own and you want to ensure that _all_ work items, that has been
> enqueued, did complete and you don't want to check them one by one.
> 
> To illustrate your point, the  example would translate to something like
> the following:
> 
> | static struct work_struct test_worker_busy;
> | static struct work_struct test_worker_reg;
> |  
> | static void test_worker_complete_fn(struct work_struct *work)
> | {
> |         int count = 0;
> |         while (1) {
> |                 ssleep(1);
> |                 count++;
> |                 if (count > 10)
> |                         break;
> |         }
> |         pr_err("%s()\n leaving", __func__);
> | }
> |  
> | static void test_worker_busy_fn(struct work_struct *work)
> | {
> |         while (1) {
> |                 ssleep(1);
> |                 pr_err("%s()\n", __func__);
> |         }
> | }
> |  
> | static void the_workers(void)
> | {
> |         INIT_WORK(&test_worker_busy, test_worker_busy_fn);
> |         INIT_WORK(&test_worker_reg, test_worker_complete_fn);
> |  
> |         queue_work(system_long_wq, &test_worker_busy);
> |         ssleep(1);
> |         queue_work(system_long_wq, &test_worker_reg);
> |         pr_err("%s() starting...\n", __func__);
> |         ssleep(1);
> |         pr_err("%s() cancel\n", __func__);
> |         flush_work(&test_worker_reg);
> |         pr_err("%s() moving on\n", __func__);
> | }
> 
> which leads to:
> 
> | [    4.136593] the_workers() starting...
> | [    4.137007] test_worker_busy_fn()
> | [    5.161198] the_workers() cancel
> | [    5.164832] test_worker_busy_fn()
> | [    6.184710] test_worker_busy_fn()
> | [    7.208525] test_worker_busy_fn()
> | [    8.232754] test_worker_busy_fn()
> | [    9.256522] test_worker_busy_fn()
> | [   10.280716] test_worker_busy_fn()
> | [   11.304523] test_worker_busy_fn()
> | [   12.328671] test_worker_busy_fn()
> | [   13.352517] test_worker_busy_fn()
> | [   14.376842] test_worker_busy_fn()
> | [   15.400539] test_worker_busy_fn()
> | [   15.402676] test_worker_complete_fn()
> | [   15.403290] the_workers() moving on
> | [   16.424483] test_worker_busy_fn()
> | [   17.448524] test_worker_busy_fn()
> 
> which means the test_worker_reg work item completed despite the fact
> that test_worker_busy remained busy.
> 
> Of course flushing the workqueue system_long_wq (via flush_workqueue())
> would stall but also raise a warning…
> 
> > 	The work item cannot finish until its kmalloc() call returns.
> > 
> > 	kmalloc() won't return until the kernel can free up memory by 
> > 	writing some pages to the swap partition.
> > 
> > 	The write to the swap partition cannot take place until the
> > 	usb_storage/uas driver carries it out.
> > 
> > 	usb_storage/uas cannot do anything until the USB device reset
> > 	is finished.
> 
> as shown, this is not a concern.
> 
> > > Therefore the suggested change system_long_wq -> system_dfl_long_wq
> > > should not make a difference here: it is a different workqueue and it is
> > > unbound (instead of per-CPU) but given the usage it is unchanged but
> > > more obvious. Also its usage recommendations (use this for long running
> > > items) is the same.
> > > 
> > > The plan is remove system_long_wq from the tree.
> > 
> > The point Oliver was making is that the driver shouldn't be using a 
> > general-purpose workqueue at all.  Switching from one general-purpose 
> > workqueue to another ignores this point; it's not the right thing to do.
> 
> Still the wrong thing to do? The driver should do either flush_work() or
> cancel_work_sync() (not flush_workqueue()).

I think we're in agreement.  If the driver relies on calling 
flush_workqueue(), it should not use a general-purpose workqueue.  
However, flush_work() or cancel_work_sync() is okay on an unordered 
general-purpose workqueue.

If Oliver still has any objections, he can raise them.

Alan Stern
