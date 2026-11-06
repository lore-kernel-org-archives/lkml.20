Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985573;
	b=O3e1CZVH02p7qAYH6fGHJjaGyy6WNGar3MwBrBxVzZxEocEPIuYvPs22hAIHyTvR2gfe
	 zfJYjZmh4Z2bebjM6/gJvredkX5O8jjEGuV9D1lMHRAGD4bl1SLe4QSLF3eNoXW/Cm9Tg
	 4L8rXUv19s7PRP6uTc1UhOXYYNzCOeEkZAqVDaulrGyoTtXOunVrRavUV8zmTQ9d22unN
	 /C5DEv6gvWCxbs4hmfV4XQ5fG3b8CCWp0yKUAH+NAeNKGz1zUXfMtpl+1ZPhS0W0JD+Jf
	 kSZfXm80aA+mUqb6rSCEwDipnYtDYbOKKh/6mjQJfOK0TWFC0CLw+gNPVfJRVZ8Fn8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=tEaeh2MQM8Yqh+InUxWcP/c3Ugn8r1gCgilB/e+XZTU=;
	b=pkeg+BmIMKcSfLCKfCiNuedgMW2/Lddw5EK1XvQAIr3XVVf9AZqAOIFlXCTsJIp/+M0l
	 RyeoMuwoUMg7zHXY0SrZH3qMSPphJp4bfKm8XyU9KquMSFkhtZ86OKOhKOoSX+11V9s1/
	 DjVxoarPlK5d7wV8A/jFng+JXL1JuPdaGMFZZbVcXravdLx74I4TaqDE19Iob0acDOstw
	 jlbGiRx+IuIuCUvos2rs0YafEW2tm0ohc49mgNnsbkdjPdjC0XlQZzAgNY7DSERzowOzD
	 oxyyvcYWZEyZfUj5AFiyoMVGt8KBtaEPy8aInlfKZyTQSxCXFonaRUeLCaf9Uk/fLmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V3vuG2QG;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5319606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5319606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V3vuG2QG
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so534137a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793985572; x=1794590372; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tEaeh2MQM8Yqh+InUxWcP/c3Ugn8r1gCgilB/e+XZTU=;
        b=V3vuG2QGjhL8r2VuA4Y+96OnzymPavm7o7EgEyvr170YdIQ6DRl7oV53qhL1GcFHq9
         pAuFDTumBKjC04cfsqiF/s9mzLQ7MxMB33+iWjjD6M/c6YfzXCbLDc+N7vG+f5wRPHnt
         YGfusFO0BTgDqxJC3GAGWNZSjKJIGzOR0waqOm65uqs4mfbkFPtcjPreR4HJO5uzAwIM
         aZJqv3Eu06A17GOsAL38uxdtzasGV3QnNWGft1JdKGB0XYClaHm6eqK5tjUpWsaDDnGv
         L3j4WwyzVfe0Q7LrBT5u/+m8/nbkT0KO2eRt94r5hQOTgl8rRxeGomxzWEId9K33GS3u
         IwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985572; x=1794590372;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEaeh2MQM8Yqh+InUxWcP/c3Ugn8r1gCgilB/e+XZTU=;
        b=pVt4Iyb/FQfGhjcYxx94FjZ6qmYXaGAm6MoNHiA7yKg2TWFIgF4R/XlDFomvUMHpgQ
         QHfmNEnwBbfsR836/ZxS9/D45hV9NYwx0VxixU3uIc/6wKZhwQDKfDiDBhFbpKxzAr7R
         CGQPSybw0iNtU88IMrUHGCMaJ/4A4ye2NnEnrXM+0dvEdBz/QvkRRWpCQ6q1EydIizVZ
         X1A+dWOUHTNKqB6k3c1Z8743WQ/f90rOhwxRoXRQEl6woyYNycZ1MMABQTponDUe+Do5
         D7N7NfRWl2sjDRzvNdDwl5FzhYMVoRczvB39k4SEr7J0K5SGtxiHvM4GpKaLUh7Fn8bx
         7T8A==
X-Forwarded-Encrypted: i=1; AL+hErFCbZQOb7fhK7DOdvzs/eaeWCkXgZqhQHggBGOgs/FQfTxJlICfj/upKoPoWH/AVb8uZpmK7I6t7y/0xI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MPxpWsQ+s448AXkdqUeKijKcSOG2s8MxKZRPz/DxYlVXNdXtw
	YJ2tZF81s2UqIqfie6vlOc7nZr/biQ5DxdjahXea5nA9lCGH0JNJVNO9uw6GCRuqGw==
X-Gm-Gg: AYBFou3r7Exmgk+lnAg9zUOq+fyhXAxWSK2CEiQa9Pjm6BmP2deaFdqI2zVmSDj1npX
	VvU3O3+fcvNULxo/kDIkk6W1zCs2FGWOUFAFLVloSt/bVww1zGKL3A6iC+zvJxRaCDXahmiU/jj
	/bZ7qWwkYNwmFy5p4NJ2ZIw3dS6RrT9e/1xJylLtYjVMVHv9ZDSrfWyOPUbfrHn8w2MHbMAykOI
	juGt68iLnHZZQsUt/paGZBVLzY0q7HqTJAj/e7q6Flozd2UPh4qY97vkqt7jWMZjnFeQ8omZjyV
	Z01RuNVzR2Aa7q9UicAeO4l9oFBy7lF0ShxSzsLQQ8LSSqo0ePNpEho2KWtxpQnaPmDYFCLslbX
	pd+HLBnx5oP8D9cnfSjBbBZ06+u5N3HYkEfwcHOfhYsxzRJFuVks7KzwGgS6noDaQi7gvmRWoQW
	Z+d9uZqfEH84syKOWMtbhIAcaPa6M7F6Ry2mAByw4XE/az16NoCNYC/U5sOB8SAuZYCRZmK9Uhl
	rhcz62/NjIgUw0+PScTTlm84ggtiv49LYs2MIO/hnkFaZ47YEC3lX+fRAu9ETpxrUhBUsYm3O81
	wI0mwXc4KjdKM0UDaYc/zoZLmVxhryfWcEgjUu4Ki3q0P9cUqiIyaoyoEfLAGxyJ
X-Received: by 2002:a17:90b:554d:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3b0db5edb73mr3411640a91.7.1793985571464;
        Fri, 06 Nov 2026 09:19:31 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a7fbcbsm795231a12.25.2026.11.06.09.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:19:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 17:19:28 +0000
Message-Id: <DMOAT4VV939P.2DI8CEOMMSKMY@google.com>
Subject: Re: [PATCH v6 11/27] vfio/pci: Retrieve preserved device files
 after Live Update
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>
Cc: <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <dmatlack@google.com>, <graf@amazon.com>, <jacob.pan@linux.microsoft.com>,
 <jgg@nvidia.com>, <jgg@ziepe.ca>, <jrhilke@google.com>,
 <julianr@linux.ibm.com>, <kees@kernel.org>, <kevin.tian@intel.com>,
 <leon@kernel.org>, <leonro@nvidia.com>, <lukas@wunner.de>,
 <mattev@meta.com>, <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-12-vipinsh@google.com>
In-Reply-To: <20261102153656.1431701-12-vipinsh@google.com>

On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:
> During retrieve():
>  * Validate the handed-over struct vfio_pci_core_device_ser header,
>    sizes, and flags.
>  * Locate the registered vfio-pci device matching the serialized domain
>    and BDF (requiring device->ops =3D=3D &vfio_pci_ops) under the device
>    lock. vfio-pci registers the vfio device before its probe completes,
>    and the probe holds that lock, so a device that is still being probed
>    is not returned.
[...]
>  * Open and return an anonymous VFIO cdev file via
>    vfio_device_liveupdate_cdev_open().

Here's an idea for how the device file could be created on retrieve,
which I'd like to hear your thoughts on.

The patches from Pasha at [1] lets userspace pass a
file-handler-specific argument to LIVEUPDATE_SESSION_RETRIEVE_FD. In the
next version of the tmpfs series, I'm planning to use that to have
userspace create the file and pass it in the argument, and the kernel
then restores the preserved file into it.

I wonder if VFIO should work the same way, e.g.:

  struct liveupdate_vfio_retrieve_arg {
          __u32 size;
          __s32 fd;
  };

Userspace would open /dev/vfio/devices/noiommu-vfioX itself and pass
the fd. retrieve() would check that it's an unbound vfio-pci cdev file
for the preserved device (domain/BDF, noiommu, incoming, cfg_size),
attach the incoming state to that file, and LUO would track that file
as the retrieved file. VFIO_DEVICE_BIND_IOMMUFD would then take over the
device as it does now. Since VFIO preservation is new, the argument
could simply be required.

I think this could get rid of some of the special handling:

 - There'd be no need to fake a cdev open with an anonymous inode, so
   PATCH 09 and PATCH 10 could probably be dropped.

 - retrieve() wouldn't need to look up the device by BDF, or reason
   about racing with probe under the device lock. If userspace was able
   to open the cdev, the device is registered and probed.

 - The device file would be opened through the normal cdev path, so the
   usual permission and LSM checks on the device node would apply.

 - It would be the same model across file types.

A few things I think would need care if you go this way. The file check
and the attach would need to happen under dev_set->lock so they can't
race with a concurrent VFIO_DEVICE_BIND_IOMMUFD on the same fd. And the
incoming state should probably be tied to that specific
vfio_device_file rather than just the vdev, so only the file passed to
RETRIEVE_FD can take over the device.

It would also change PATCH 12. Opening the cdev of an incoming device
would have to succeed, so the check would move to the first open of the
device instead: fail with -EBUSY if the device is incoming and the file
being bound doesn't have the incoming state attached. That one check in
vfio-pci would also cover VFIO_GROUP_GET_DEVICE_FD, which opens the
device right away, so vfio_liveupdate_incoming_is_preserved() and its
dev_is_pci() special case could be dropped from the VFIO core.

The next tmpfs version will also add a way for a file handler to say a
failed retrieve can be retried, and a helper to claim an existing file
before restoring into it (so a file LUO already manages, e.g. one that
is preserved in an outgoing session, is rejected). Both seem useful
here too, e.g. so that a mistake in the argument (wrong fd, an fd for
another device, an already bound fd) doesn't make the device
unretrievable. I'll Cc you when I send it, and I'm happy to share the
branch before then.

What do you think?

[1] https://lore.kernel.org/kexec/20261103010216.3447716-1-dmatlack@google.=
com/
