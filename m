Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794395152;
	b=m544eZCR/mOmtzp5d855I650tDjo1+91f7v3wZiWl+EWz0TOs22oCQe+DPFaZvfpJgsW
	 QbBYE4/cd0J4E9a6zM7Sn7rvHPeKpO3y55sfY2WH6A/EL+v/1uwxcN+zx8QT0iFDA3B10
	 WRKf8GT9KXf+EIkz/a08D/deVRtTp0EkFcgRD/AQ+fweai2oI/67jROvBMAU3oTS5MDHx
	 VaJkAFEPrK17bqd2/ZcYj2RGtXaOtExl6SV6xCIf6auhaJBbHWADpQWGijdexIe67tCrF
	 eAE2VOgr+YSSZexGbcRjA0UA1PoSdkOactWckzByGA+JGc35GpQU9YQ9McLR9ptR3Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
	b=iAIXaQmYKuHakCaCiOVMgTp6XkJee8TsXHsNd02qIg7CGbPex/onP15W8H6lPswlvE5/
	 LQxv2QuA5SRrCG0HDV9JUwUK1ZuToiYpMDpTKCtSC+lynbcbfxFHk81ENP93qpwduLqp3
	 vAnle3Q8thhu0hSqK8J2zq60cSFINrWq7bxxgNgDvIOE/CHKYEeNd2LKnK3g4Y3OKe6/0
	 82sd+HHIwyDTMAPorFt0VwMWqFfL4m30bF6L13pP7p2vQuRI58aIhAlQKoN4Fxk0HGDmM
	 cSv/x+w6fjWzTTXpTuYAeH3VSyiiC3ptf8os26Tp97DdbF+pOlrjsiREN1/cPWyfdtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S9Oe343o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CD8606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CD8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S9Oe343o
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso1857003a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794395150; cv=none;
        d=google.com; s=arc-20260327;
        b=QcazxlAOAIUXBHJEZUrCCHxlMHJ+Iie6xP6UKje5IyP6jXlAhqdJKgKX1PrSH6LY8C
         hMSWpChextzioo1nbwuiuIjLqXvFosSAffraBQLbLB0w0VvAJYiSgI0JiSO6p7YlBU/X
         6QaGnh5jPVaZNrbftYDN6MJeIIJweE9bXTMqYo7rF7MtgKU9qPE7MMWmJ69kDDRouoGJ
         ImnAmg2dZSIobFPgGpmGSS3SsxSx4cz2C8h4KHyELI0cnYSS/DJ6ocBpx1pJ5LG4TtPj
         moTIIoSAj4A1lc/E1CpBcC4V0xIJFA1WltvmULpshKuWXjcXjw1MKjRZb/vFC7o2GoLJ
         qaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
        fh=GnQvctoWwtOAmYLmLo9gVhJR63b1qdpAOmvbeNNS1+4=;
        b=HcOlQT9NsARJsjQkwpsGtGSPU94XiV7EF5jMQOeXHLJ3/iTNpcblE33bLyo0jsOlqI
         Kjip628A4+tjp4K2yFLG/v190oS/HfJP0wNWwi/oY0zO5WNS4xe2nDiuIFvM3xfmqMoo
         0DUISBDK4RmXTFi4e4R1rHMYudZfWq/a2r6iRG2Y5tkb/O+8dVRlA3TgY/VuegwLvce7
         rYlFD0/YQg0Lln21+xsRHfjwp/RKcQqkoQCHzzWBx22QoDsqhqff0+UkLbIlrefq/N0h
         HT6echvjEnXs7TrtwPT+eCkPXHAx/dzh7jP+SWk3GcRxJhdgalXtfK4o4BCeqFvayzm2
         Weaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395150; x=1794999950; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
        b=S9Oe343oExiTS2KfqhZKo8v9uzSzroybxuYjiW8R/Epw+w2UBG78inWqMxbr9l/twP
         IDfc5RiZTs0v3oNc30kUYhmeFjo6joVPSdzWo9eDD2E56eKpbXMMggSFIt4pw/Xsh7Mp
         jg0IQcZK/HSW3c4+/RwSwMF5/WeoGpyQ711u4rm/d46EmrPOT3AVokqdONUfWCXM7cW1
         q+rx2pezIcC36mdu99xLYU03oreM5hPxRRJ/YkBoL8BKnLgshzid8AdfzXlBPvQ3sQVj
         k0oTp68pmXdeJAwHt69hJ7KCvAKvvDtOy7E5283OJ7zKW4mHzxvEmTgAq4sQOs1gi8jI
         HkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395150; x=1794999950;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
        b=rbnh34rApQWwt8zFTOheBl+d6sovVf+A018iOKMn0/IQwz94pN5QPdG+RUBQonVIWw
         zoXCF+og45Gahxe8lfqsAy5Wj8w9mwtBTrZYQ0pWxP6Pf66Cc70bsVnJ4D4qZsaZYEqK
         jMuZqiF4ksbyQqooNg7ghlzebvHHS9CRiVyN8FQS0XcmObBwEK0FA0vLyBiX1+mZDt3d
         JN0nXZVvL1julKoiKAY7X2F3eFGu6+Kl8dkH7yPLWSTWXwMMJCoJmni3GPOScUoSskPe
         MH3CQ+T3D8SUC7OW8rr+jDuOEeSf7dqdPELzw9y5OQkTErppYK7sy9YDO6iAhUhugQJV
         rMsQ==
X-Forwarded-Encrypted: i=1; AL+hErEi41mkCmQ1AHaI+tvRTwAP+Yz94EJ5IColjD2zK0AWLhXgOp8iUGp0ua4mrdlzhq+8hFyEXg9uphnWizE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sCVKiYFpexsGUwS8I2UCkFvcjmzgGRCJL19xtRZr6hUO9PSdd
	7jpbuYvnj/zAQOCFanScgyxnQq/Y9aO3kd5FxjnTMbY66JxzZaUFqvoAz/hccAJBQkLw63RD6tF
	ghwer9PU7Gj8HJmoiFfckm0wkUPMBAKQ=
X-Gm-Gg: AYBFou3651+zhW8PZzsNXPk5D/BC4oRFl/jKxAYiauy+kkeCdR0qdpXWi1W/0Ar4hNr
	bQefVL2eB0ts0Z0mYBiGTRpWIwFBpFsrl+SLWn5OG5UIvANTuyzIT4UA038nDHJxYiG1QuQflq6
	50c0tugHDWsOIVkRJXbgkOzp3jH/hRoMOFFf4WTsZW8guzI/Vf6K9PVAvNmYfpcSdpvz8rYmXOH
	pVKPDCxfWRmz0yi4t9ZiSXMQ9C+bzoChKRFk8p24Ab7L4uwn/yU7JA6pfaqU1a4+1hWO4smtzws
	2lrn9owiSpFy6tvZlAOqGVbUjfbnNKVhFHzAYFUwkovfxU9Yvei9gIMmqH6a6OFzmWDg8FHwXoJ
	CJsedEwSkrM6jtVS9GKTAOD+OguKgxasBwTo=
X-Received: by 2002:aa7:cd5b:0:b0:6b4:87b8:1348 with SMTP id
 4fb4d7f45d1cf-6b77780f23fmr1150131a12.27.1794395149944; Wed, 11 Nov 2026
 03:05:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <20261110061429.2036-2-linux.amoon@gmail.com>
 <avOL1mCkI4YSaDeO@aurel32.net> <DMRZGMGRLD4S.KT6VEU28902E@linux.spacemit.com> <avQ1kVTvdCmS1MxN@aurel32.net>
In-Reply-To: <avQ1kVTvdCmS1MxN@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 11 Nov 2026 16:35:27 +0530
X-Gm-Features: AclHuK9H8LcNFBf6OiW50_NDYDV5SRfOSw_9EFpDafFKu57Cw77PmBIsH4iiL2Y
Message-ID: <CANAwSgQgtEvgEfkBMC6meDzT4O28oEX-R16STeiUnP77UOQe_Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Anand Moon <linux.amoon@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Troy. Aurelien,

Thanks for your review comments.

On Wed, 11 Nov 2026 at 14:59, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Troy,
>
> On 2026-11-11 01:16, Troy Mitchell wrote:
> > Hi Aurelien,
> >
> > On Tue Nov 10, 2026 at 9:25 PM GMT, Aurelien Jarno wrote:
> > > Hi Anand,
> > >
> > > On 2026-11-10 11:44, Anand Moon wrote:
> > >> The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> > >> to access the PMIC. However, these handlers run in an atomic notifier
> > >> context (specifically within an rcu_read_lock() critical section), while
> > >> the I2C-backed regmap uses a sleepable mutex.
> > >>
> > >> This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> > >> context switch in the RCU read-side critical section during shutdown on the
> > >> Banana Pi BPI-F3:
> > >>
> > >> [  563.803475] WARNING: suspicious RCU usage
> > >> [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> > >> [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> > >> ...
> > >> [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> > >> [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> > >> [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> > >>
> > >> Replace the regmap operations with atomic I2C transfers to avoid sleeping
> > >> in an atomic context. Preserve unrelated register bits through
> > >> read-modify-write operations and check for atomic I2C support before
> > >> registering the handlers.
> > >>
> > >> Obtain the I2C client from the parent device and verify that the adapter
> > >> supports atomic transfers before registering the handlers.
> > >>
> > >> Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> > >
> > > While the patch looks correct, I am not sure this is the correct
> > > approach, as opposed to the one proposed by Troy [1].
> > >
> > > Indeed bypassing regmap and using i2c atomic transfers needs to be done
> > > by all affected drivers. For instance the VisionFive 2 board, which use
> > > an axp15060 PMIC is also affected by this issue. And the corresponding
> > > driver is shared between architectures, which make this kind of change
> > > more difficult.
> > >
> > > For the BPI-F3, note that with OpenSBI 1.9, the reboot is handled
> > > through the SBI SRST extension, preventing this issue to happen. On the
> > > long term, I am not sure we should keep this driver.
> > >
> > That only covers restart. The SBI restart handler is registered at
> > priority 192 and runs before the P1 one at SYS_OFF_PRIO_DEFAULT. Power
> > off is the other way around: sbi_srst_power_off() goes through
> > register_platform_power_off(), i.e. SYS_OFF_PRIO_PLATFORM, so the P1
> > power-off handler still runs first and still hits this on shutdown,
> > even with OpenSBI 1.9.
> >

I had previously tested the OpenSBI P1 PMIC driver in a Yocto-based environment:

[1] https://lore.kernel.org/all/20260419150857.2705843-3-aurelien@aurel32.net/

With this driver registered in OpenSBI, Linux can delegate reboot and power-off
operations to firmware through the SBI SRST extension.

The power-off sequence is:
    Linux kernel_power_off()
      -> RISC-V machine power-off
      -> SBI SRST shutdown
      -> OpenSBI system_reset()
      -> SpacemiT P1 PMIC
      -> Power off

I have now rebuilt the Linux kernel with:

 # CONFIG_POWER_RESET_SPACEMIT_P1 is not set

Both reboot and power-off work correctly on the Banana Pi BPI-F3,
and I have not observed any issues.

alarm@k1:~$ sudo poweroff

Broadcast message from root@k1 on pts/1 (Wed 2026-11-11 10:34:03 UTC):

The system will power off now!

[ 1744.735287] systemd-shutdown[1]: Sending SIGTERM to remaining processes...
[ 1745.071304] systemd-journald[245]: Received SIGTERM from PID 1
(systemd-shutdow).
[ 1745.504595] systemd-shutdown[1]: Sending SIGKILL to remaining processes...
[ 1745.790159] systemd-shutdown[1]: Unmounting file systems.
[ 1745.822902] (sd-umount)[658]: Unmounting
'/run/credentials/systemd-journald.service'.
[ 1745.861214] (sd-remount)[659]: Remounting '/' read-only with options ''.
[ 1746.079291] EXT4-fs (mmcblk1p7): re-mounted
ccb95ca0-2804-4ade-938f-23116f90c193 ro.
[ 1746.272104] systemd-shutdown[1]: All filesystems unmounted.
[ 1746.272471] systemd-shutdown[1]: Deactivating swaps.
[ 1746.273712] systemd-shutdown[1]: All swaps deactivated.
[ 1746.273956] systemd-shutdown[1]: Detaching loop devices.
[ 1746.464867] systemd-shutdown[1]: All loop devices detached.
[ 1746.465346] systemd-shutdown[1]: Stopping MD devices.
[ 1746.471149] systemd-shutdown[1]: All MD devices stopped.
[ 1746.471417] systemd-shutdown[1]: Detaching DM devices.
[ 1746.476047] systemd-shutdown[1]: All DM devices detached.
[ 1746.476377] systemd-shutdown[1]: All filesystems, swaps, loop
devices, MD devices and DM devices detached.
[ 1746.533569] systemd-shutdown[1]: Successfully changed into root pivot.
[ 1746.533862] systemd-shutdown[1]: Entering exitrd...
[ 1746.686127] shutdown[1]: Syncing filesystems and block devices.
[ 1746.701832] shutdown[1]: Sending SIGTERM to remaining processes...
[ 1746.934370] shutdown[1]: Sending SIGKILL to remaining processes...
[ 1747.164219] shutdown[1]: Unmounting file systems.
[ 1747.203935] (sd-umoun[662]: Unmounting '/run/credentials'.
[ 1747.232643] (sd-umoun[663]: Unmounting '/oldroot/sys/kernel/config'.
[ 1747.269882] (sd-umoun[664]: Unmounting '/oldroot/sys/kernel/tracing'.
[ 1747.298218] (sd-umoun[665]: Unmounting '/oldroot/sys/kernel/debug'.
[ 1747.327488] (sd-umoun[666]: Unmounting '/oldroot/dev/hugepages'.
[ 1747.359053] (sd-umoun[667]: Unmounting '/oldroot/dev/mqueue'.
[ 1747.387798] (sd-umoun[668]: Unmounting '/oldroot/run'.
[ 1747.425939] (sd-umoun[669]: Unmounting '/oldroot/proc'.
[ 1747.473927] (sd-umoun[670]: Unmounting '/oldroot/sys/fs/bpf'.
[ 1747.527910] (sd-umoun[671]: Unmounting '/oldroot/sys/fs/pstore'.
[ 1747.588367] (sd-umoun[672]: Unmounting '/oldroot/sys/fs/cgroup'.
[ 1747.630489] (sd-umoun[673]: Unmounting '/oldroot/sys/kernel/security'.
[ 1747.664244] (sd-umoun[674]: Unmounting '/oldroot/sys'.
[ 1747.704716] (sd-umoun[675]: Unmounting '/oldroot/dev/pts'.
[ 1747.755218] (sd-umoun[676]: Unmounting '/oldroot/dev/shm'.
[ 1747.791652] (sd-umoun[677]: Unmounting '/oldroot/dev'.
[ 1747.826501] (sd-umoun[678]: Unmounting '/oldroot'.
[ 1748.451336] EXT4-fs (mmcblk1p7): unmounting filesystem
ccb95ca0-2804-4ade-938f-23116f90c193.
[ 1748.643359] shutdown[1]: All filesystems unmounted.
[ 1748.643640] shutdown[1]: Deactivating swaps.
[ 1748.644512] shutdown[1]: All swaps deactivated.
[ 1748.644722] shutdown[1]: Detaching loop devices.
[ 1748.732490] shutdown[1]: All loop devices detached.
[ 1748.732764] shutdown[1]: Stopping MD devices.
[ 1748.754002] shutdown[1]: All MD devices stopped.
[ 1748.754286] shutdown[1]: Detaching DM devices.
[ 1748.759617] shutdown[1]: All DM devices detached.
[ 1748.759885] shutdown[1]: All filesystems, swaps, loop devices, MD
devices and DM devices detached.
[ 1748.770510] shutdown[1]: Syncing filesystems and block devices.
[ 1748.791699] shutdown[1]: Powering off.
[ 1749.009246] reboot: Power down

Given that OpenSBI already handles both operations,
I agree that the Linux P1 power-off and reset driver may no longer be necessary,
at least on systems using firmware with the appropriate SBI SRST support.

> > So until this driver goes away, BPI-F3 still needs the arch fix [1]
> > for power-off.
> >
> > Link: https://lore.kernel.org/linux-riscv/20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev/ [1]
>
> We also need a more global fix for the other boards like the VisionFive
> 2, so definitely we need the above fix instead of patching the drivers.
>
Maybe we need an opensbi driver for VisionFive 2 dev boards; any thoughts
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand
