Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792700603;
	b=dTl9vFO+XyRV7i4FIkpD07Ejfx5mAPkJZB2cCPifvlQN9/hg2XBE9F3n/n3CVzxumm3x
	 tXhfzy2rwZimWVAJ2feG5Jcc2U2liPy0NyjilXbhf9pxjv6HMDjT5Kw/XfRSFK+Hkkmfn
	 B8GRTVSqAcd1ITkyGbAmCNHGdbGomOHeDdQ2iNbpGYKQuVt+C5DsUG6qxLR+7dpUTo2lx
	 1i3RpI4wlphqG/4EPGu3R/lABymVFuvsjnhbCqg/OHDmQ5xyze/nFr2iEfbbIjZOKJ79F
	 9iHtc0NfpHOsi1TeWu0XMqCRD/J00aOaurPqkyyRldsfcDuCRC0y5gnTmHzu8zwOINA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5uxHMH5lWNkFqrLK/1u2IVRs5r7Pb9pQoHHJh+WWXLs=;
	b=kHA6EubjB7PCHGpekSOI1Ln2EyY0pqL+uMSK72fC39qb62xNkc9r+2M6Vvo16Ssb6qjg
	 l/woavqi8qIQlXwOSbfW34Zji/1QS9AjF/cfSIoRfk4a9PayWt0nq17EJacQ+BMb8IMpU
	 exudK8xIn2MtDZDmcetMsSlHb/jX1l4FGd6pzfakYBgm4rx9HMxZprljJ2E1iC0SEHkEW
	 ZVB8ogmCF//zjw44ItCoUpnJu2aaIEFfzuxdjutFQOdqIyIivHPSN4/sLmncExII6Y8Ir
	 o95JE3RpGDJwXXU+KzENxAJ5e8ZlN51kl2XO4cdK+ZiYK+UyY2ZwQBAErXQGEJ73efQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jzFpZtNi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C335C606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C335C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jzFpZtNi
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677d35fd1d2so319567d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792700602; cv=none;
        d=google.com; s=arc-20260327;
        b=RDOBp9kFOmrxLR8no4iReFcLYoI3kT65gOyAA922ZV/wK3j7pLZYDBDOPN0HfubpO2
         V6pjUFVq/AzBqRcvP38jcHnKvW6QJalGIUoBRcUWdln8dweG+dRRoqIPSHa6fBuRVGly
         GwGTpCF30ET2U1mhMEB53PMikFM6gGeEiOUJ99Bd4oogFardzXaGzsQlEoMweDmFqi/D
         bPLgcnP50JIpnjhB73cnbjmrVnNJX5AMeVGiAm757fTlZaRmbLi0Cibe0E6ohPOZsejn
         nF7BFa9tOKCZBK8VATIWB4QeUBgt2qkT03c8wEL8NE0/qH3/eXuuMZrmBwdOdMQm4Lut
         x7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5uxHMH5lWNkFqrLK/1u2IVRs5r7Pb9pQoHHJh+WWXLs=;
        fh=3oSrk9wUji3O3nb+5mcMS8zMkvPBubPtiC5jFshAeCg=;
        b=WL0XO2V9HiAM7Tz3z2bK6wJTE6Os6PyCifeayWHsT62gIIPcX0LXSaNlCgzZPnAi/R
         fXVzWFginaqYjsi0UHR5bvZB9OSSQgz/SbKXc2+1AV1aLKKlvpFxst+NJBtqbZwI5TW8
         I4WcOzRFNY7wdBXF/3nVWKb8uF5mFQsalyxFOCTXDRToAf+UhYG1SxezysMOJ5rIYmqj
         L/9e445E1Mjq+ZEmpjohC0lOqtzUSnjhXrey9ZL10RQeQEf4rrXe+BM/l7m8gFutCbB/
         8CUsmSL2Z+5p9eiFQ1yLDVg++OC/AeSGVFdjmNgmA/BM9BVSSmINas++9Imd1utKKc2w
         x7jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700602; x=1793305402; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uxHMH5lWNkFqrLK/1u2IVRs5r7Pb9pQoHHJh+WWXLs=;
        b=jzFpZtNieITeERa6yPOUltFqxvFmZsA7jUVHqYQwqrsrPnTdUMFooxFz7O3ajLG16b
         9dFD9b+Fu67ap1GB7SVDIn0Csum4BSc5EY6FnVoH4LlHHU/tEVwe8aXMWqgBj/9dBC7e
         Jmei0M5tWkAmA2leok0D/QBy7+qXMU210KkqFZvoxJogOgbhX8pb/hrh1sJiqLaMjhKH
         n2ub3kgL7kPy1jhnhuZLsZPoPL0GsQ5XN0X1of+xD6fbAhCY3Z5od44uXxFRTaR6nNEK
         4aP0DxbIGicM6MevE4yq/LoNNzPOBZ5AJ44SFmMglAEDVuTM4ODvCUJTtI64S+xXXlDk
         yxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700602; x=1793305402;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5uxHMH5lWNkFqrLK/1u2IVRs5r7Pb9pQoHHJh+WWXLs=;
        b=0QiWQDJlFYi+p9DrUt5OouovEZrg3VxvStaNky7pdgI2Bjv7kHT6DcSo2Lq9nCoijv
         gHYm/0wWqui0wh8lvJrS70EjzpXZkw9Uq0lBiFli6qPSLWbUgez9+2yAhKewZUUjzw6z
         /Kj3sndCCaiLdZ7etmNTNoiowPqBBB3rdbhRwPgy3Sr4a8Pn5Gu7A1bmVGF4LOzfR9Ui
         eU+Y4T8Icvp19JE4/dBXVTiKpWPKVQCqXCcm7DxO+EWgv3dNKE7Fbofw9qNgvJ10vOel
         Zr5/aer5FABnaSHO9qJEoajSI1SGxA+oljxay4pedzlX8hAHsG/B57rist4jVOfqg+du
         eT+g==
X-Forwarded-Encrypted: i=1; AKwUvBz1HGQSQbamd6ybtgWgIGQONhciWDT9elZA2K4nzFwoM1Ty40pZuR6SeHaDXG6j1kKdOH+AyQcaAfHFtBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJflf8sD9AHCKxusmR3Gt6RvIo+HFST5yOkYG8ZQbnTfhCsL+qn
	VO3LDoBBP3vtwTKNX2PhE3mfY34ho13TKJAU5Q58iiviKeBCxSHeu/2PG+FITMoR6j1avVwoMpl
	PA7e6wvJHKEHIjk2in9540GzWObfqdjaEgcqMoTQa
X-Gm-Gg: AYBFou01+f0oaVXycY4bAwKJuD7whuASZHWJ7GYgx/sx/j9sLuLs5/KLfyxEBcMqlgM
	JNPw/aRMLPpa/4EnF3ZYa2bfUYRRr1ybu+/sfZ1WXM+icQarkFKm9MmYWYLN+qPukJnG3vlHBxu
	3s5HLvcUxANnXjguVPGZixQnEbGmmuybuEYx+QXb/CLMpWq8ZZnXjYsBS6Pz+kq0TG7Iqsilani
	3ObT/DBe16OvXK6Qle2nakKypchccuPpvx4sxt8VRbuDMXMSOuQ0xION8gK8NcwewNrIVLP3GhI
	X0bnjFr+0D0TJJjzAMPmlJNOFAPFkxWQvufh7amcyP8JYWnKP//9nNkERzObPnLhvkxMio1Yk3q
	1xkGXP+HK/RCzTxr8A8jWzuE+FmuLl4hzBhqtFnO5rH+RRSh+9eMe0YxIGG6FbIbnxYM=
X-Received: by 2002:a05:690e:4886:20b0:679:b810:6e02 with SMTP id
 956f58d0204a3-67a35be55damr41297d50.26.1792700601354; Thu, 22 Oct 2026
 13:23:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local> <ati4B33tnKsCD4c_@ashevche-desk.local>
In-Reply-To: <ati4B33tnKsCD4c_@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Thu, 22 Oct 2026 13:23:10 -0700
X-Gm-Features: AclHuK-UXeYd7f4xuTeUAZF1JwhmIdSpH-ZAZho2bvnDVSV1qLbRZ06-APU7LkY
Message-ID: <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Adrian Hunter <adrian.hunter@intel.com>, 
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > 1. Tooling & production users:
> >
> > - i3ctransfer (Patch 5/5 of this series, and carried out-of-tree in
> > AspeedTech-BMC/i3c-tools and vendor OpenBMC BSPs for several
> > years).
>
> So, nothing in production, meaning we can design that in kernel differently.

In hindsight I should have ordered that list differently, the second bullet
right below that is the production use case: production BMC firmware update
and recovery daemons running in OpenBMC server fleets (managing Caliptra
Root-of-Trust and SoC recovery targets over I3C), as well as production
server accelerator management daemons.

> But why recovery mechanism can't be kernel-driven? With some sysfs
> (just as an example) knobs to say "I want to run now a recovery flow
> on this bus", et cetera.

To make sure we're talking about the same thing: "OCP Secure Firmware
Recovery" is not electrical bus recovery (like recovering an i2c or
i3c bus itself by bit-banging to unstick a hung bus). It is device
firmware recovery and provisioning (similar in concept to USB DFU) to
recover and boot a target device that sits on the bus.

This lives in userspace because it is part of the BMC's Redfish/RoT
firmware management stack (handling network image streaming, signing/key
management, and chassis-level recovery policies), rather than a single
"recover this bus" hardware toggle. And it uses I3C_IOC_XFER because
each protocol register read/write requires combined Write + Repeated
START + Read transfers (or HDR transfers) to that specific target node.

> Oh, that's quite a dangerous "feature"! Can we avoid doing that? Otherwise it
> means any missed guard against unbind for the system controller related chips
> may lead to real HW damage. I'm totally against this feature to be in any way
> of an ABI. If you want that, do it exclusively via debugfs with a big fat
> warning that this may lead to HW damages.

Agreed -- as Alexandre also suggested in his reply, it sounds like
automatic binding isn't favored here due to risk of hardware damage.

> Can i2c device require an i2c recovery flow on the bus? If so, how would
> it be combined together with the i3c recovery flow(s)?

If you mean electrical bus recovery, i3cdev doesn't perform
bus-level electrical recovery. It only submits normal target-addressed
transfers via i3c_device_do_xfers().

If you mean OCP device firmware recovery on a mixed bus:

An I2C recovery target on a mixed bus uses standard SMBus Block
Read/Write transactions through the controller's i2c_adapter (not
i3cdev) while an I3C recovery target uses I3C Private Write/Read
transfers via i3cdev. On a mixed bus, the Linux I3C core already
configures the bus mode/SCL rate according to the I2C targets' LVR
spike-filter capabilities and serializes both paths via
i3c_bus_normaluse_lock(&master->bus).


Thanks,
Sam
