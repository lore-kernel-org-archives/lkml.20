Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=184.106.54.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786441;
	b=T6s55kYxWOJF1PP6KpNzoEvIRApvJoSqozGgKoKbfneOYcJcZjd0/6c0BDR11TNEmpww
	 gkTwER8+IwfS1o0cgevMeoFt1lcGkQKx7D4kho+DSV+3Wo02ijpCqPehSyvPDPEGjLenN
	 g0FFMC+5OY3G9sTcInH+x026HjPa6Z2OpkbM8JOwrGbpJwumeuN8tIgINMS2Z1HABKRMq
	 JviK6L2VE/zvtH0+o+sY75zT/rQ8etd3norI5EllmGhFw9pA7J+HAULRPA8jepjnuXDBm
	 oQ/J5So0zQI9Xv2SyF7nrAqzLVATSZlUkumZynyAQfi2kWW0NU08QWmETLm4+jeUHwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786441;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Auth-ID:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Classification-ID;
	bh=cyIZopgYoUxe28j7gd5iDRmGJBNnH/aEmf5xOjJtdLg=;
	b=AyEXsB1j8dHLS2RDosNTuqWrOMwupd16fpeO/7Y2a9Bryb4OQzNieKjOMbCR4V7bsfr0
	 Ez8Sc4MnffMs8YnqtcVx0yfoeQRfeCQJuCjULYpyPhyFSDSVMxi8BWcLxhoM/+ME7ZER/
	 73P35Wg/yJVoMdvIOVeXYzlQJ6O1xEjtcIquIfQwjyKkiZ2fKiDk7KGxQIL6RJIzjjI0K
	 Sn3Uk85TENV0w8tfJrSTbnP88NQENtL81ZpFv+jJ7Zvs21VnaiyVPPk8I1mb4xnqnzWrb
	 WFzcakpC5WAICUCee/qoKJHGR5V5LcuAv3CRoaVMY0IhTgTxu/kq13DgAtAbXKuuu8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mev.co.uk;
	spf=pass smtp.mailfrom=mev.co.uk;
	dkim=pass header.d=g001.emailsrvr.com header.i=@g001.emailsrvr.com header.a=rsa-sha256 header.s=feedback header.b=X4TM7ynL;
	dkim=pass header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=i6mjaLvm;
	arc=none smtp.remote-ip=184.106.54.115
Received: from smtp115.ord1d.emailsrvr.com (smtp115.ord1d.emailsrvr.com [184.106.54.115])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECAE606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ECAE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=g001.emailsrvr.com header.i=@g001.emailsrvr.com header.a=rsa-sha256 header.s=feedback header.b=X4TM7ynL;
	dkim=pass (1024-bit key, unprotected) header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=i6mjaLvm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
	s=feedback; t=1793786434;
	bh=lGqbM9qs4/gt96IZ/iH8xKruO/KqF0rbWtZg6/DtGwE=;
	h=Date:Subject:To:From:From;
	b=X4TM7ynLVD718v/lQsFNcCIGbmO8MSKt6K0i4cV18FTEQWvWPWXiyos3SK4JCX/CR
	 +2a1ebOoyrcdVTFwW0QvlL7noJmeUbzBefsOevSOTGpH8dt4MyU9lqQIcMml4A6ncq
	 AIBGG3QTfdJsW7RGo8JjM4M6XomtYxFQ7Ncucwxk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1793786434;
	bh=lGqbM9qs4/gt96IZ/iH8xKruO/KqF0rbWtZg6/DtGwE=;
	h=Date:Subject:To:From:From;
	b=i6mjaLvmocudpzgnzGdg6Rww7zxFwzL5QYUJ3Ym6vm/apBIJcDjZItkqsZaLF7OsP
	 puNEsSi/e3P9Mx2Ts7i9IrtL8C6rbjalAxpJA/T6yFm4RaTKcNzCdUz4d+YfT1ujI9
	 iJsrAYYWcCAYeQgmNt26kcrBO45FKqgALx581wsM=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp23.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 9B58D2020A;
	Wed,  4 Nov 2026 05:00:33 -0500 (EST)
Message-ID: <b54ad21f-68bc-485a-b0bd-8470deacca36@mev.co.uk>
Date: Wed, 4 Nov 2026 10:00:32 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] comedi: give each device's mutex its own lockdep class
To: S0CloseYetS0Far <foroncewillbeproud@gmail.com>,
 H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: linux-kernel@vger.kernel.org,
 syzbot+acd959f649966559199c@syzkaller.appspotmail.com
References: <20261103174927.185498-1-foroncewillbeproud@gmail.com>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <20261103174927.185498-1-foroncewillbeproud@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: fb1d58b5-57b4-42be-a355-402d6399ac6d-1-1

On 03/11/2026 17:49, S0CloseYetS0Far wrote:
> From: abu mohammed saleh <foroncewillbeproud@gmail.com>
> 
> The "comedi_bond" driver forwards digital I/O instructions to other
> COMEDI devices via "kcomedilib".  When an INSN_BITS instruction is sent
> to a bonded device, comedi_unlocked_ioctl() holds the bonded device's
> mutex while comedi_do_insn() acquires the mutex of the underlying
> device.  All COMEDI device mutexes are initialized in
> comedi_device_init() and so share a single lockdep class, so lockdep
> reports this as recursive locking:
> 
>    WARNING: possible recursive locking detected
>    repro/77 is trying to acquire lock:
>    ffff9d0b41f39cf0 (&dev->mutex#3){+.+.}-{4:4}, at: comedi_do_insn+0x22/0xf0
>    but task is already holding lock:
>    ffff9d0b41f398f0 (&dev->mutex#3){+.+.}-{4:4}, at: comedi_unlocked_ioctl+0x5f/0x1060
> 
> The two locks belong to different devices.  Since commits d1b3b9c70e11
> ("comedi: kcomedilib: Add loop checking variants of open and close")
> and 2402f958cf3b ("comedi: comedi_bond: Check for loops when bonding
> devices"), comedi_open_from() refuses to open a device if that would
> form a loop of devices opening each other, so this nesting cannot
> deadlock.
> 
> Register a dynamic lockdep key for each COMEDI device and use it as the
> class of the device's mutex, unregistering it when the device is freed.
> This silences the false positive while keeping lockdep's ordering checks
> between different devices, which a mutex_lock_nested() annotation in
> comedi_do_insn() would not.  It also handles chains of bonded devices,
> which a single nesting subclass could not.  There are at most
> COMEDI_NUM_BOARD_MINORS devices, so the number of classes is small.
> 
> The problem was found by syzbot, which can trigger it as root by
> configuring a "comedi_test" device and a "comedi_bond" device bonding it
> on legacy minors, then issuing INSN_BITS on the bonded device.
> 
> Tested on v7.4-rc1 (x86_64 KVM guest, defconfig + kvm_guest.config +
> CONFIG_PROVE_LOCKING, gcc 15.2) with syzbot's C reproducer, booted with
> comedi.comedi_num_legacy_minors=4: unpatched, lockdep reports the splat
> above on every boot; patched, no lockdep reports in three runs.  Also
> built with CONFIG_LOCKDEP disabled and with W=1 without new warnings.
> Not tested with real COMEDI hardware.
> 
> This patch was written with the help of an AI coding assistant (Claude
> Opus 5.5, Anthropic), which analyzed the syzbot report, wrote the change
> and ran the tests above under the submitter's direction.
> 
> Reported-by: syzbot+acd959f649966559199c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=acd959f649966559199c
> Fixes: 69e2387f3bfd ("staging: comedi: kcomedilib: protect against device detachment")
> Signed-off-by: abu mohammed saleh <foroncewillbeproud@gmail.com>
> ---
>   drivers/comedi/comedi_fops.c     | 7 +++++++
>   include/linux/comedi/comedidev.h | 5 +++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
> index 05d14839c..a488044d9 100644
> --- a/drivers/comedi/comedi_fops.c
> +++ b/drivers/comedi/comedi_fops.c
> @@ -108,6 +108,12 @@ static void comedi_device_init(struct comedi_device *dev)
>   	kref_init(&dev->refcount);
>   	spin_lock_init(&dev->spinlock);
>   	mutex_init(&dev->mutex);
> +	/*
> +	 * Give each device's mutex its own lockdep class, as one device's
> +	 * mutex may be held while acquiring another's via kcomedilib.
> +	 */
> +	lockdep_register_key(&dev->mutex_key);
> +	lockdep_set_class(&dev->mutex, &dev->mutex_key);
>   	init_rwsem(&dev->attach_lock);
>   	dev->minor = -1;
>   }
> @@ -118,6 +124,7 @@ static void comedi_dev_kref_release(struct kref *kref)
>   		container_of(kref, struct comedi_device, refcount);
>   
>   	mutex_destroy(&dev->mutex);
> +	lockdep_unregister_key(&dev->mutex_key);
>   	put_device(dev->class_dev);
>   	kfree(dev);
>   }
> diff --git a/include/linux/comedi/comedidev.h b/include/linux/comedi/comedidev.h
> index 577a08f37..f6d732427 100644
> --- a/include/linux/comedi/comedidev.h
> +++ b/include/linux/comedi/comedidev.h
> @@ -489,6 +489,10 @@ struct comedi_driver {
>    *	its regions requested.
>    * @spinlock: Generic spin-lock for use by the low-level driver.
>    * @mutex: Generic mutex for use by the COMEDI core module.
> + * @mutex_key: Lockdep class key for @mutex.  Each COMEDI device has its own
> + *	class because a device's @mutex may be held while the @mutex of another
> + *	COMEDI device is acquired via "kcomedilib" (e.g. by the "comedi_bond"
> + *	driver).  "kcomedilib" refuses to form loops of such devices.
>    * @attach_lock: &struct rw_semaphore used to guard against the COMEDI device
>    *	being detached while an operation is in progress.  The down_write()
>    *	operation is only allowed while @mutex is held and is used when
> @@ -553,6 +557,7 @@ struct comedi_device {
>   	unsigned int ioenabled:1;
>   	spinlock_t spinlock;	/* generic spin-lock for low-level driver */
>   	struct mutex mutex;	/* generic mutex for COMEDI core */
> +	struct lock_class_key mutex_key;
>   	struct rw_semaphore attach_lock;
>   	struct kref refcount;
>   

Looks good, thanks!

Please could you repost and add Greg-Kroah Hartman to the CC list, as he 
is the person who usually ends up committing the comedi patches to a 
tree that gets pulled from.

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
