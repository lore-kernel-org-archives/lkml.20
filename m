Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.116.240.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757801;
	b=O6aIVEy0HI3hGoI/ygtp3Sc3TSmM2BggVncpNDyPfy2rOkJX9B8CoUQ8vm7Tt9Ov0JNA
	 h0nKxVmDhKQNzMxEioWvg30XdGeGj+i50bHWQ+6P+9NcnanRQREhrrpahvi260a30pldR
	 /Alz/rTbuaJ3dxrPkXcM9q0oMEkjG1kUyxEs+6QxswQGPkjtlENYtI30XSM2ZKogsDkKb
	 9wnTkyLHMNM/lRvA2Ws0trPKAM0Jx4hlwyGAflegxWVeWi1z7uaCxqEwBr5yVFJqW1wUT
	 arz5ISw6f6+Ovf1moGwpnGAqIcZ3UokefTVhEKAJdRecEPreFWNTK8bSDmYFkS1nS1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757801;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=mlkUlTBy3gi5X/PNLdqR3eK+uOg/TJTghfW/CD9/gwY=;
	b=dB7ddjoyRWshFp3fx7KrslUqGYDxVh29xB2+lJOtEGYkHZjmye6GK9XuasMo2Cu0mgmb
	 wxczAuwlL6n99KDOd27OaWkvBNAHySfXYlXDDlpJ9MbZv+vd/fyp+BzA6gm1RNOGCsU2x
	 6osaD17zhCYIPCUWt4PM4XMtUzS+m/2wOP7yi/YjLy7CSn5WEeyJIphmYrn3bLoy76mXf
	 6m9UzLKznWnU+oHhX70YOt0meouulXMgXatiBblgVMIBzFXXx1j1TfW5vKKjFBqo4u0Aw
	 8qrYwAnZMR5eg84BRzt4qpJd+dGVT4Ic1a/2gZiRVJR5zRJF4xzRfkWBBDN1FQ36HeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arkamax.eu;
	spf=pass smtp.mailfrom=arkamax.eu;
	arc=none smtp.remote-ip=128.116.240.228
Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C7606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=IpHhtEj7MQFXuK
	jI807etXOb5FXQT1zBeNAvZ4SdQkc=; h=in-reply-to:references:to:from:
	subject:cc:date; d=arkamax.eu; b=To+f6UD4wqx89wwjicO1lJV9TziT4ctx11TNk
	VVQ+D72bSnhwuFEkE7HoggQvslZt8uwFOLd5Se2xbMGrhsLEikp+wA+NkTGKtQvKQjBUeT
	3d/2DbnlldIDHXAp0FRKPDnSVfl+WZKVSJYHd4yQvxZHnw62kisGWwWKiWjpI8t/trE137
	zwQw+5iuLMWxG+A6tyz02kB+6IjKA6aScpnpJSoV4XrLN94l+eWIrVT0OUYBnqvjauxyNb
	CA/n4KgVTzISJXEjjeiTX606A6N3DCVo1CxaLWfiLVnc4yh1CbCNSk1+BF/RykZKwX9SVi
	zvoV8AFH8TkJ3Jf0UdUQoMMNg==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id ab229737 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 23 Oct 2026 14:16:31 +0200 (CEST)
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
Date: Fri, 23 Oct 2026 14:16:30 +0200
Message-Id: <DMC7LJCQ1QZO.M3C252P8IZG4@arkamax.eu>
Cc: <hch@lst.de>, <sagi@grimberg.me>, <kch@nvidia.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] nvmet: protect nvmet_ports_list with nvmet_config_sem
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "Qing Zhang" <diasyzhangqing@gmail.com>,
 <linux-nvme@lists.infradead.org>
X-Mailer: aerc 0.22.0
References: <179275538809.275862.8334230595898232727@tencent.com>
In-Reply-To: <179275538809.275862.8334230595898232727@tencent.com>

On Fri Oct 23, 2026 at 1:36 PM CEST, Qing Zhang wrote:
>>From 554233f4165842a0a104896c30ed4d2e89c11931 Mon Sep 17 00:00:00 2001
> From: Qing Zhang <diasyzhang@tencent.com>
> Date: Fri, 23 Oct 2026 19:29:28 +0800
> Subject: [PATCH] nvmet: protect nvmet_ports_list with nvmet_config_sem
>
> Readers of nvmet_ports_list (e.g. nvmet_subsys_disc_changed()) hold
> nvmet_config_sem and assert it via lockdep.  The writers --
> nvmet_ports_make() and nvmet_port_release() -- do not take the lock;
> they rely on the parent directory's VFS inode lock for serialization,
> which is an implementation detail of configfs and not a guaranteed
> contract.  Align the writers with the lock the readers already require.
>
> Also move list_add() in nvmet_ports_make() to after the port is fully
> initialized: the old position published the port on the global list
> before INIT_LIST_HEAD(&port->subsystems), so a concurrent reader
> could traverse uninitialized list heads.
>
> flush_workqueue() in nvmet_port_release() stays outside the semaphore
> to avoid a lock dependency on nvmet_wq.
>
> Fixes: b662a078576e ("nvmet: enable Discovery Controller AENs")
> Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
> ---
>  drivers/nvme/target/configfs.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configf=
s.c
> index b03b5d1c2dc3..75cb9e63025f 100644
> --- a/drivers/nvme/target/configfs.c
> +++ b/drivers/nvme/target/configfs.c
> @@ -2009,7 +2009,9 @@ static void nvmet_port_release(struct config_item *=
item)
> =20
>  	/* Let inflight controllers teardown complete */
>  	flush_workqueue(nvmet_wq);
> +	down_write(&nvmet_config_sem);
>  	list_del(&port->global_entry);
> +	up_write(&nvmet_config_sem);
> =20
>  	key_put(port->keyring);
>  	kfree(port);
> @@ -2070,8 +2072,6 @@ static struct config_group *nvmet_ports_make(struct=
 config_group *group,
>  			port->ana_state[i] =3D NVME_ANA_INACCESSIBLE;
>  	}
> =20
> -	list_add(&port->global_entry, &nvmet_ports_list);
> -
>  	INIT_LIST_HEAD(&port->entry);
>  	INIT_LIST_HEAD(&port->subsystems);
>  	INIT_LIST_HEAD(&port->referrals);
> @@ -2105,6 +2105,10 @@ static struct config_group *nvmet_ports_make(struc=
t config_group *group,
>  	configfs_add_default_group(&port->ana_default_group.group,
>  			&port->ana_groups_group);
> =20
> +	down_write(&nvmet_config_sem);
> +	list_add(&port->global_entry, &nvmet_ports_list);
> +	up_write(&nvmet_config_sem);
> +
>  	return &port->group;
>  }
> =20

Yes, I was already planning to submit the same fix as part of this
larger patch: https://lore.kernel.org/linux-nvme/DLOGQG9GZC3X.1UZ2MY7S3T5N2=
@arkamax.eu/
but I didn't have time to finish the tests and submit it.

Reviewed-by: Maurizio Lombardi <mlombard@redhat.com>

