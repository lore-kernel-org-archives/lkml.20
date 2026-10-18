Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685AC3DAAB8
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341193; cv=none; b=i6Dw8VO1/IgEJsO9RM4wOmb/X4KRuef2DBjNe5XFTd5EGMkNbXm3VpsJ8vXol2XH3FpiYBouC/jTlG6baUqVutBNnty621sIODB+Gro6kb3lkzNttUaUZPKwy2VVjk5kK2QRsytv+ACr0PFPFBx9jPPyLZ9CQiM+VpnWdCIFRa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341193; c=relaxed/simple;
	bh=AJ/km8sE6GctD4RuE/KlvnKKGAXGH2QdqK+ac6g6Ezo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BE9b+MjfUSJhi9L5u/bM0Aqn91MXQiv01NVnMxivGn4L+ktyOeYgurHAZ9OOwOA5e2O7+WmPJ1kjUCmlI5VSGZJalPOkC0OnaZb2gynvSZKca2KTglhZjGSnGNpfkT5KUfsQTCBq9XUKKQKgmf3/Pjy8bbIZ8S83nU3ru7pYsIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2tNA6R3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2tNA6R3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987a2ba0cso10558555ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341192; x=1792945992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8lASuEAWr02cFkueHsd07yvRwkaU6dw60ogYfI+giIU=;
        b=A2tNA6R3Vkx0sbAjhxknPHRb+hTU4X5Hjo3H3xLWAypJXOUWqXsLhSaLVZD5AXy4tU
         sj1/jYi+16zV3sW1W/tuFc8zIJco2PgtyAiS+KI9zfpBtASAzOXulIHbMQzmuh4c2OCe
         CGsrQ2LAQfpFEbO/Ni+RT4D8VBFFYL8aMR/gVRYCMAO4ptIk/tXvCSgz5OVSemO1fwgh
         Yc/qoea0n1PfS0ZhXh2cpp1YiTWX5aMsUbYVm7HioD6WbksWs8KQGvHEadH+BtMQ1AT7
         c7RHxtiARNrAKya43R1IGw3Hh+I3KMBZdoM3s5rOR5x35FbfnXc6kv3uIJtKEkO2aKK3
         O0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341192; x=1792945992;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lASuEAWr02cFkueHsd07yvRwkaU6dw60ogYfI+giIU=;
        b=hFyKZN9VNWmXSbJwWIMF6bvxthGPj18JyPK3hlQHA1vW6xQ8hPvEsqx1/AuXcOqbKf
         cPqcA5kdOkbyELQNaEXDSD73YXR1OACtIn42CFaha4OPtoA/4iAFmkxf39p52BbQHBpb
         8BEsIlKNWkB7z7Y8MZzpYNe4fZxsCwX8cR+rHGBImGcQaLWD6H5cx872VP+k/19hJxWW
         xTThxet+dbRLxCR0bdHlK3uqJ7mKJ6OaJSzZNMHPojFE4Y6Lgwi8kAFpo7VNWNJI7wUq
         saUdWtkQHgxv7JGQ3IIgMtyFF1JDkCJHiN5EmE/O1Z3klUtfwPgtEythF0bKTTQf/jHR
         BrhQ==
X-Forwarded-Encrypted: i=1; AKwUvByOESNSS0usOBMLx6YnmU/QKY9Ewi7rRWhyIyfL3VrXe03ijp5dftG8qPelKbXW4jNdvV57orcGLSQ6NBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8VQB0sEXeUdjncwjEgP55xiyN9r9QoMorYq2QATOgV7TU1bb9
	t77aUZQBejvbRmV1J+Cxcam7QmJMCehD4fI8ctQFFhTUzXyFUoZdZkYM
X-Gm-Gg: AYBFou0wkDeWGBmqkOzpkwkOA8PXH1Xk/PEAy3He815pJx4g28EzqY2B79AhKI4jlU9
	WQ4UFB3imMpmxoRyCxhxY615NwkozQYzoq3EUokQgaVqj7q68sAD+UBEjEg6Qq24ksn6rGBXgo5
	7WahX3xOuH4q3vjumvPiNi7Wsxu4XERTLKleCisUyzobWiHxQ+NYcciDEfjBN9taGC0UoE601SC
	R06KR2fu7qDg9t/7U2XKUGQPY8McetxdAkuR/3D2l3mEdbJmJBTW1fvH78B4iY9xJDDolfxTMu2
	eaNfAkJAfk8OvuFpSnQVajE09BOz4d7KbfG5VoatJWf3FtaoxPIpeXahczZMoPWXEBbl3MGk/hN
	TnOCnyngiqH+dDCLWhbHtgh/4KghFFvD3mSYAMERWm9yC7W05tVN6sx5PnZEMvqSbCOf4EKmwp/
	2mjimbQWYiO26nPu5J7d89UhqIvDtx88Kc7xjdTwdx9QM7ilXKlFZ0p8NGCTaEXzaCf7TDJrrSk
	pgqH1yBfLvoa3tBPgoDTaY=
X-Received: by 2002:a17:902:e748:b0:2e9:8510:6acf with SMTP id d9443c01a7336-2e9a6bff6c2mr46257275ad.25.1792341191722;
        Sun, 18 Oct 2026 09:33:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83406bsm29315425ad.38.2026.10.18.09.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:33:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:33:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sanan Hasanov <sanan.hasanou@gmail.com>
Cc: Marius Zachmann <mail@mariuszachmann.de>,
	Sanan Hasanov <sanan.hasanov@ucf.edu>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksa Savic <savicaleksa83@gmail.com>,
	syzbot+0f98b0c0bdeaab2dc2fd@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-cpro) Make wait_input_report_lock IRQ
 safe
Message-ID: <0b7c972c-f3e2-41ee-bd75-45bcae83a34a@roeck-us.net>
References: <20261008205310.30832-1-sanan.hasanou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008205310.30832-1-sanan.hasanou@gmail.com>

On Thu, Oct 08, 2026 at 04:52:45PM -0400, Sanan Hasanov wrote:
> From: Sanan Hasanov <sanan.hasanov@ucf.edu>
> 
> ccp_raw_event() is the HID ->raw_event() callback and takes
> wait_input_report_lock with a plain spin_lock(). This callback can run
> in very different contexts depending on the transport: from process
> context (e.g. uhid, via a write() to /dev/uhid) with softirqs and
> interrupts enabled, and from URB completion, which is softirq context
> for HCDs using HCD_BH and hard interrupt context for HCDs that do not
> (e.g. OHCI, UHCI).
> 
> Taking the lock from process context with softirqs enabled while the
> same lock is also taken from softirq context can deadlock if the
> softirq interrupts the lock holder on the same CPU. Lockdep reports:
> 
>   WARNING: inconsistent lock state
>   inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
>   ...
>    spin_lock include/linux/spinlock.h:347 [inline]
>    ccp_raw_event+0x51/0x110 drivers/hwmon/corsair-cpro.c:161
>    __hid_input_report+0x41c/0x580 drivers/hid/hid-core.c:2175
>    hid_irq_in+0x492/0x710 drivers/hid/usbhid/hid-core.c:287
>    __usb_hcd_giveback_urb+0x378/0x540 drivers/usb/core/hcd.c:1657
>    dummy_timer+0xa91/0x4cc0 drivers/usb/gadget/udc/dummy_hcd.c:2023
> 
> For the same reason, the spin_lock_bh() in send_usb_cmd() is not
> sufficient when ccp_raw_event() is called from hard interrupt context.
> 
> Use spin_lock_irqsave() in ccp_raw_event(), since it may be called with
> interrupts already disabled, and spin_lock_irq() in send_usb_cmd(),
> which always runs in process context.
> 
> Fixes: d02abd57e794 ("hwmon: (corsair-cpro) Protect ccp->wait_input_report with a spinlock")
> Reported-by: syzbot+0f98b0c0bdeaab2dc2fd@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0f98b0c0bdeaab2dc2fd
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>

Applied.

Thanks,
Guenter
